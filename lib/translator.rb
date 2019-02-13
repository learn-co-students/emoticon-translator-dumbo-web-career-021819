# require modules here
require 'yaml'
require 'pry'

def load_library(_file)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')

  emoticons_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |meaning, emoticon|
    english = emoticon[0]
    japanese = emoticon[1]

    emoticons_hash['get_meaning'][japanese] = meaning
    emoticons_hash['get_emoticon'][english] = japanese
  end
  emoticons_hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  emotions_hash = load_library(file)

  japanese_emoticon = emotions_hash['get_emoticon'][emoticon]

  return 'Sorry, that emoticon was not found' if japanese_emoticon.nil?

  japanese_emoticon
end

def get_english_meaning(file, emoticon)
  # code goes here
  emoticons_hash = load_library(file)

  english_meaning = emoticons_hash['get_meaning'][emoticon]

  return 'Sorry, that emoticon was not found' if english_meaning.nil?

  english_meaning
end
