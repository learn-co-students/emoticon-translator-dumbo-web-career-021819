require "pry"
require "yaml"

def load_library(file_path)
  load = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |key, value|
    english, japanese = value
    load["get_emoticon"][english] = japanese
    load["get_meaning"][japanese] = key
  end
  load
end

def get_japanese_emoticon(file_path, emoji)
  load = load_library(file_path)
  get = load["get_emoticon"][emoji]
  if get
    get
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoji)
  load = load_library(file_path)
  get = load["get_meaning"][emoji]
  if get
    get
  else
    "Sorry, that emoticon was not found"
  end
end
