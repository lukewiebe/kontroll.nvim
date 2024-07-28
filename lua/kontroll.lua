local M = {}

M.setup = function(user_config)
	default_config = vim.g.kontroll
	if user_config ~= nil then
		default_config = vim.tbl_deep_extend("force", default_config, user_config)
	end
	vim.g.kontroll = default_config
end

return M
