# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticon_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |meaning, emoticon|
    emoticon_hash["get_meaning"][emoticon[1]] = meaning
    emoticon_hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end

  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  emoticon_hash["get_emoticon"].each do |engrish, jap|
    return jap if engrish == emoticon
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  emoticon_hash.each do |category, translation|
    translation.each do |icon, translate|
      return translate if icon == emoticon
    end
  end
  "Sorry, that emoticon was not found"
end
