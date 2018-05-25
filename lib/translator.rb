# require modules here
require "yaml"
require "pry"


def load_library(path)
  # code goes here
  library = YAML.load_file(path)
  #initialize new return hash
  translator = {"get_meaning" => {}, "get_emoticon" => {}}
  #iterate library hash and put things into right order in translator
  library.each do |meaning, emoticon_arr|
    japanese = emoticon_arr[1]
    english = emoticon_arr[0]
    translator["get_meaning"][japanese] = meaning
    translator["get_emoticon"][english] = japanese    
  end
  translator
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path)["get_emoticon"].each do |english, japanese|
    if english == emoticon
      return japanese      
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path)["get_meaning"].each do |japanese, meaning|
    if japanese == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end