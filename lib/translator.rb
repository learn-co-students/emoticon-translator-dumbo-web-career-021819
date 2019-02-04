require "yaml"

def load_library(file)
  emo = YAML.load_file(file)

  my_hash = {
    "get_meaning" => {
    },
    
    "get_emoticon" => {
    }
  }
  
  emo.each do |key, value|
    my_hash["get_meaning"][value[1]] = key 
    my_hash["get_emoticon"][value[0]] = value[1]
  end 
  my_hash
end 


def get_japanese_emoticon(file, emoticon)
  emo = load_library(file)
  emo["get_emoticon"].each do |k, v|
    return v if k == emoticon
  end  
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(file, emoticon)
  emo = load_library(file)
  emo["get_meaning"].each do |k, v|
    return v if k == emoticon
  end  
  return "Sorry, that emoticon was not found"
end