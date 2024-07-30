require('lualine').setup {
	options = {
		icons_enabled = tue,
		theme = 'gruvbox',
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 1,
			}
		}
	}
}
