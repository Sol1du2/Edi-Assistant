#!/usr/local/bin/python
# coding: utf8
import json

with open('/config/.shopping_list.json') as data_file:
    shoppingListData = json.load(data_file)

result = u""
for entry in shoppingListData:
    if not entry['complete']:
        result += u"- %s\n" % entry['name']

print(result)
