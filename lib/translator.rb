# require modules here
require "yaml"
require "pry"

def load_library (file_path)
  # code goes here
  return_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |emoticon_type, emoticon_data|
    return_hash["get_meaning"][emoticon_data[1]] = emoticon_type
    return_hash["get_emoticon"][emoticon_data[0]] = emoticon_data[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if(!emoticon_hash["get_emoticon"][emoticon])
    return "Sorry, that emoticon was not found"
  end
  emoticon_hash["get_emoticon"][emoticon]

end

def get_english_meaning (file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if(!emoticon_hash["get_meaning"][emoticon])
    return "Sorry, that emoticon was not found"
  end
  emoticon_hash["get_meaning"][emoticon]
end
