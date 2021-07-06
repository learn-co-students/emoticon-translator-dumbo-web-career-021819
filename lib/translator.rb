require 'yaml'


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons_hash = {}
  emoticons_hash["get_meaning"] = {}
  emoticons_hash["get_emoticon"] = {}
  emoticons.each do |english_meaning, emoticons_array|
    emoticons_hash["get_meaning"][emoticons_array.last] = english_meaning
    emoticons_hash["get_emoticon"][emoticons_array.first] = emoticons_array.last
  end
  emoticons_hash
end


def get_japanese_emoticon(file_path, western_emoticon)
  emoticons_hash = load_library(file_path)
  if emoticons_hash["get_emoticon"].has_key?(western_emoticon)
    japanese_emoticon = emoticons_hash["get_emoticon"][western_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, japanese_emoticon)
  emoticons_hash = load_library(file_path)
  if emoticons_hash["get_meaning"].has_key?(japanese_emoticon)
    english_meaning = emoticons_hash["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

