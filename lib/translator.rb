require 'yaml'
require 'pry'
# require modules here

def load_library(filePath)
	emoticons = YAML.load_file(filePath)
	result = {}

	result['get_meaning'] = {}
	result['get_emoticon'] = {}

	emoticons.map do |word, emote|
		result['get_meaning'][emote[1]] = word
		result['get_emoticon'][emote[0]] = emote[1]
	end
	return result
end

def get_japanese_emoticon(filePath, emote)
	loadLib = load_library(filePath)

	loadLib['get_emoticon'].map do |key, value|
		if key == emote
			return value
		end 
	end
	return "Sorry, that emoticon was not found"
end

def get_english_meaning(filePath, emote)
	loadLib = load_library(filePath)

	loadLib['get_meaning'].map do |key, value|
		if key == emote
			return value
		end 
	end
	return "Sorry, that emoticon was not found"
end