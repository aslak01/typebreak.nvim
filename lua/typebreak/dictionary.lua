local utils = require("typebreak.utils")

local M = {}

local currentDir = utils.get_pwd()

local dictPath = currentDir .. "/dict"

-- lines in `dict`
local linecount = 235976

local hasDict = utils.file_exists(dictPath)

if not hasDict then
	error("Dictionary not loaded")
end

local local_dictionary = utils.read_file_lines(dictPath)

M.pick_random_words = function(n)
	local picked = {}
	for _ = 1, n, 1 do
		table.insert(picked, local_dictionary[math.random(1, linecount)])
	end
	return picked
end

M.extend_or_replace_dictionary = function(new_dictionary, replace)
	local do_replace = replace or false
	if do_replace then
		local_dictionary = new_dictionary
	else
		utils.extend_table(local_dictionary, new_dictionary)
	end
end

return M
