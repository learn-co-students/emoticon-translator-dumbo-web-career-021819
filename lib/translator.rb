# require modules here
require "yaml"

def load_library(file)
  # code goes here
  hash = YAML.load_file('./lib/emoticons.yml')
  # hash = {angel: ["O:)", "☜(⌒▽⌒)☞"], angry: [">:(", "ヽ(ｏ`皿′ｏ)ﾉ"]
  getmeaning = {}
  getemoticon = {}
  new_hash = {}
  hash.each do |meaning, emoticons|
    getmeaning[emoticons[1]] = meaning
    getemoticon[emoticons[0]] = emoticons[1]
  end
  new_hash["get_meaning"] = getmeaning
  new_hash["get_emoticon"] = getemoticon
  # new_hash = {get_meaning=> {jap_emot => meaning, jap_emot => meaning},
  #             get_emoticon => {english_emot => jap_emot, english_emot => jap_emot}}

  return new_hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  hash = load_library(file)
  hash.each do |get, hashy|
    if get == "get_emoticon"
      hashy.each do |english, japanese|
        if english == emoticon
          return japanese
        end
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # code goes here
  hash = load_library(file)
  hash.each do |get, hashy|
    if get == "get_meaning"
      hashy.each do |emoticonz, meaning|
        if emoticonz == emoticon
          return meaning 
        end
      end
    end
  end
  return "Sorry, that emoticon was not found"
end
