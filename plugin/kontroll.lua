local M = {}

M.setup = function(user_config)
	local default_config = {
		colors = {
			["Normal"] = "#FFFFFF",
			["Visual"] = "#FF0000",
			["Visual Line"] = "#AA0000",
			["Visual Block"] = "#880000",
			["Insert"] = "#00FF00",
			["Command"] = "#0000FF",
		},
	}
	if user_config ~= nil then
		default_config = vim.tbl_deep_extend("force", default_config, user_config)
	end
	vim.g.kontroll = default_config
end

return M
