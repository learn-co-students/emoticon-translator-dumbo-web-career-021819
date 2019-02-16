require "yaml"
require 'pry'

def load_library(filePath)
  emoticons = YAML.load_file(filePath)
  emoticonObj = {}
  
  emoticonObj['get_meaning'] = {}
  emoticonObj['get_emoticon'] = {}
  
  emoticons.each {|wordForm, emotesArr|
    emoticonObj['get_meaning'][emotesArr[1]] = wordForm
    emoticonObj['get_emoticon'][emotesArr[0]] = emotesArr[1]
  }
  
  return emoticonObj
end

def get_japanese_emoticon(filePath, emoticon)
  emoticonHash = load_library(filePath)
  
  emoticonHash['get_emoticon'].each {|key, value|
    if key == emoticon
      return value
    end
  }
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filePath, emoticon)
  emoticonHash = load_library(filePath)
  
  emoticonHash['get_meaning'].each {|key, value|
    if key == emoticon
      return value
    end
  }
  
  return "Sorry, that emoticon was not found"
end