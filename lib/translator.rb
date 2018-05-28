# require modules here
require "yaml"
require "pry"
# emote_hash = YAML.load_file("emoticons.yml")
# {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrased"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆"],
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]}

def load_library(file_path)
  # code goes here
  yml_values = YAML.load_file(file_path)
  library_hash = {}
  library_hash["get_meaning"] = {}
  #key is JP emote value name
  library_hash["get_emoticon"] = {}
  #key is EN emote JP emote
      yml_values.each do |name, emotes_array|
        library_hash["get_meaning"][emotes_array[1]] = name
        library_hash["get_emoticon"][emotes_array[0]] = emotes_array[1]
      end
library_hash
end

def get_japanese_emoticon(file_path, en_emote)
  library_hash = load_library(file_path)
  jp_equivalent = nil
  library_hash["get_emoticon"].each do |english_emote, jp_emote|
    if en_emote == english_emote
      jp_equivalent = jp_emote
    end
  end
  if jp_equivalent == nil
    return "Sorry, that emoticon was not found"
  end
jp_equivalent
end

def get_english_meaning(file_path, jp_emote)
library_hash = load_library(file_path)
en_meaning = nil
library_hash["get_meaning"].each do |japanese_emote, english_name|
  if jp_emote == japanese_emote
    en_meaning = english_name
  end
end
if en_meaning == nil
  return "Sorry, that emoticon was not found"
end
en_meaning
  # code goes here
end
