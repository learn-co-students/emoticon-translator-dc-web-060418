# require modules here
require 'pry'
require 'yaml'

def load_library(emoticon)
  # code goes here
  emotes = YAML.load_file(emoticon)
  
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  
  emotes.each do |meaning, text|
    emotes_english = text[0]
    emotes_japanese = text[1]
  
    library["get_meaning"][emotes_japanese] = meaning
    library["get_emoticon"][emotes_english] = emotes_japanese
  end
  library
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  library = load_library(file)
  
  if library["get_emoticon"].include?(emoticon)
    return library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  # code goes here
  library = load_library(file)
  
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end