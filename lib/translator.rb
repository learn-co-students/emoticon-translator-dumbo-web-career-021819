# require modules here
require 'yaml'
require 'pry'


def load_library(library)
  library = YAML.load_file('./lib/emoticons.yml')

  final = {"get_meaning" => {}, "get_emoticon" => {}}

  library.each do |meaning, value|

    final["get_meaning"][value[1]] = meaning
    final["get_emoticon"][value[0]] = value[1]
  end
  final
end

def get_japanese_emoticon(library = './lib/emoticons.yml', english_value)
  # code goes here
  library = load_library(library)
if library["get_emoticon"].include?(english_value)
  library["get_emoticon"][english_value]
else
  "Sorry, that emoticon was not found"
end

end

def get_english_meaning(library = './lib/emoticons.yml', japanese_value)
   library = load_library(library)
  if library["get_meaning"].include?(japanese_value)
    library["get_meaning"][japanese_value]
  else
    "Sorry, that emoticon was not found"
  end
end
