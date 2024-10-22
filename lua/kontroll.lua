local M = {}

M.setup = function(user_config)
	local default_config = {
		colors = {
			["Normal"] = "#FFFFFF",
			["Insert"] = "#780000",
			["Command"] = "#007200",
			["Visual"] = "#0D00A4",
		},
	}
	if user_config ~= nil then
		default_config = vim.tbl_deep_extend("force", default_config, user_config)
	end
	vim.g.kontroll = default_config

	local autocmd_group = vim.api.nvim_create_augroup("Kontroll", { clear = true })

	-- change color on mode changed
	vim.api.nvim_create_autocmd({ "ModeChanged", "FocusGained" }, {
		group = autocmd_group,
		callback = function()
			-- :h mode() for list of modes
			local modes = {
				["n"] = "Normal",
				["v"] = "Visual",
				["V"] = "Visual",
				[""] = "Visual",
				["s"] = "Select",
				["i"] = "Insert",
				["R"] = "Insert",
				["c"] = "Command",
				["r"] = "Normal",
				["!"] = "Normal",
				["l"] = "Normal",
			}
			local colors = vim.g.kontroll.colors
			local current_mode = vim.fn.mode()
			vim.system({ "kontroll", "set-rgb-all", "--color", colors[modes[current_mode]] }, { text = true })
		end,
	})

	-- release control of keyboard colors when neovim loses focus or exits
	vim.api.nvim_create_autocmd({ "VimLeavePre", "FocusLost" }, {
		group = autocmd_group,
		-- stylua: ignore
		callback = function()
			vim.system({ "kontroll", "restore-rgb-leds" }, { text = true })
		end,
	})
end

return M
