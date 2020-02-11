#!/bin/sh
source flask_app/bin/activate
flask db upgrade
flask translate compile
flask run