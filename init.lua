require("lf.init")

vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {
      ['+'] = 'wl-copy',
      ['*'] = 'wl-copy',
    },
    paste = {
      ['+'] = 'wl-paste --no-newline',
      ['*'] = 'wl-paste --no-newline',
    },
}