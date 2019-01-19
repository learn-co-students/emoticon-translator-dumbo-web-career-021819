# require modules here

def load_library(arg)
  require 'yaml' # get_meaning is japanese: meaning
  original = YAML.load_file(arg) #get
  temphash = {"get_meaning" => {}, "get_emoticon" => {}}
  original.each do |meaning, array| #"angel"=>["O:)", "☜(⌒▽⌒)☞"]
    temphash["get_meaning"][array[1]] = meaning
    temphash["get_emoticon"][array[0]] = array[1]
  end
  temphash
end

def get_japanese_emoticon(file, emoticon)
  file = load_library(file)
  if file["get_emoticon"].key?(emoticon)
    return file["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  file = load_library(file)
  if file["get_meaning"].key?(emoticon)
    return file["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
