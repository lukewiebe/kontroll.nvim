local autocmd_group = vim.api.nvim_create_augroup("Kontroll", { clear = true })

-- check if a keyboard is connected. If not, throw an error and make the user deal with it.
local check_connected = function()
	local obj = vim.system({ "kontroll", "restore-status-leds" }, { text = true }):wait()
	if obj.code ~= 0 then
		error(obj.stderr)
	end
end

-- change color on mode changed
vim.api.nvim_create_autocmd({ "ModeChanged", "FocusGained" }, {
	group = autocmd_group,
	callback = function()
		-- :h mode() for list of modes
		local modes = {
			["n"] = "Normal",
			["v"] = "Visual",
			["V"] = "Visual Line",
			[""] = "Visual Block",
			["s"] = "Select",
			["i"] = "Insert",
			["R"] = "Replace",
			["c"] = "Command",
			["r"] = "Normal",
			["!"] = "Normal",
			["l"] = "Normal",
		}
		local colors = vim.g.kontroll.colors
		local current_mode = vim.fn.mode()
		vim.system({ "kontroll", "set-rgb-all", "--color", colors[modes[current_mode]] }, { text = true }):wait()
	end,
})

-- release control of keyboard colors when neovim loses focus or exits
vim.api.nvim_create_autocmd({ "VimLeavePre", "FocusLost" }, {
	group = autocmd_group,
		-- stylua: ignore
		callback = function()
			vim.system({ "kontroll", "restore-rgb-leds" }, { text = true }):wait()
		end,
})
