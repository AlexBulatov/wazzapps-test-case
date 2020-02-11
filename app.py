from flask import Flask, jsonify, request

import requests
import os

import datetime
from datetime import timedelta, date

from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

access_key = os.environ.get("FLASK_ACCESS_KEY")

fixer_request_url = "http://data.fixer.io/api"

class Config(object):
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL')
    SQLALCHEMY_TRACK_MODIFICATIONS = False

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)
migrate = Migrate(app, db)

class Currency(db.Model):
    currency_date = db.Column(db.Date, primary_key=True)
    currency = db.Column(db.String, primary_key=True)
    to_eur = db.Column(db.Numeric, nullable=False)

    def __repr__(self):
        return "Currency {}-{}: {}".format(self.currency, self.currency_date, float(self.to_eur))

    def to_dict(self):
        return {"currency": self.currency, "currency_date": self.currency_date, "to_eur": float(self.to_eur)}

def database_initialization_sequence():
    db.create_all()
    test_rec = Currency(currency_date=date('2019-10-10'), currency="USD", to_eur=20.33)

    db.session.add(test_rec)
    db.session.rollback()
    db.session.commit()


def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days + 1)):
        yield start_date + timedelta(n)

@app.route('/', methods=['GET'])
def hello_world():
    currency1 = request.args.get("currency1")
    currency2 = request.args.get("currency2")
    date_from = datetime.datetime.strptime(request.args.get("from"), '%Y-%m-%d').date()
    date_to = datetime.datetime.strptime(request.args.get("to"), '%Y-%m-%d').date()
    dates = list()
    for single_date in daterange(date_from, date_to):
        for curr in [currency1, currency2]:
            curr_db = Currency.query.filter_by(currency_date = single_date).filter_by(currency=curr).first()
            print(curr_db)
            if curr_db is None:
                fixer_data = requests.get("{url}/{date}?access_key={key}&symbols={cur}".format(
                    url = fixer_request_url, 
                    date = single_date.strftime("%Y-%m-%d"),
                    key = access_key,
                    cur = curr)).json()
                if (fixer_data['success'] == False):
                    return jsonify({"success": False, "error": fixer_data["error"]})
                curr_db = Currency(currency_date=single_date, currency=curr, to_eur=fixer_data["rates"][curr])
                db.session.add(curr_db)
                db.session.commit()
            #dates.append(curr_db.to_dict())
    lines = []
    result = db.session.execute('''SELECT "{curr1}".currency_date, ("{curr2}"."{curr2}"/ "{curr1}"."{curr1}") as "{curr1}/{curr2}" FROM 
                                    (SELECT currency_date, to_eur as "{curr1}" FROM currency where currency = '{curr1}') "{curr1}"
                                    JOIN 
                                    (SELECT currency_date, to_eur as "{curr2}" FROM currency where currency = '{curr2}') "{curr2}"
                                    on "{curr1}".currency_date="{curr2}".currency_date
                                    WHERE "{curr1}".currency_date >= '{date_from}'::date and "{curr1}".currency_date <= '{date_to}'::date;'''.format(
                                        curr1=currency1, curr2=currency2, date_from= date_from, date_to= date_to
                                    )
    )
    for row in result:
        lines.append({"date": row[0], "rate": float(row[1])}) 
    return jsonify({"success": True, "result": lines})