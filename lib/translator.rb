# require modules here
require "yaml"
# emoticons = YAML.load_file('emoticons.yml')

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticons_arr|
    emoticon_hash["get_meaning"].merge!({emoticons_arr[1] => meaning}) 
    emoticon_hash["get_emoticon"].merge!({emoticons_arr[0] => emoticons_arr[1]}) 
  end
  return emoticon_hash
end

def get_japanese_emoticon(file_path, eng_emoticon)
  emoti_lib = load_library(file_path)
  if emoti_lib["get_emoticon"][eng_emoticon] 
    return emoti_lib["get_emoticon"][eng_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, jap_emoticon)
  emoti_lib = load_library(file_path)
  if emoti_lib["get_meaning"][jap_emoticon] 
    return emoti_lib["get_meaning"][jap_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end