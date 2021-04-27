#!/usr/local/bin/python3.9
# coding: utf8
import json

with open('/home/homeassistant/.homeassistant/.shopping_list.json') as data_file:
    shoppingListData = json.load(data_file)

result = u""
for entry in shoppingListData:
    if not entry['complete']:
        result += u"- %s\n" % entry['name']

print(result)