require 'pry'
require "yaml"

def load_library(yml_file)
  library = YAML.load_file(yml_file)
  emo_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library.each do |mean, eng_jap|
    emo_hash["get_meaning"][eng_jap[1]] = mean
    emo_hash["get_emoticon"][eng_jap[0]] = eng_jap[1]
  end
  emo_hash
end

def get_japanese_emoticon(dictionary, e_emoticon)
  emo_hash = load_library(dictionary)
  emo_hash["get_emoticon"].each do |eng, jap|
  if e_emoticon == eng
    return jap
  end
end
return "Sorry, that emoticon was not found"
end

def get_english_meaning(dictionary, j_emoticon)
  emo_hash = load_library(dictionary)
  emo_hash["get_meaning"].each do |jap, mean|
    if j_emoticon == jap
      return mean
    end
  end
  return "Sorry, that emoticon was not found"
end
