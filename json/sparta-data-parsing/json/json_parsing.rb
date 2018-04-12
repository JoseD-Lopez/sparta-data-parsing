require 'json'

json = File.read('json_example.json')

puts json
p json.class

json_parse = JSON.parse(json)

p json_parse
p json_parse.class