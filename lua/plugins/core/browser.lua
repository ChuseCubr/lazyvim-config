local show_dotfiles = false
local filter_show = function(_)
  return true
end
local filter_hide = function(fs_entry)
  return not vim.startswith(fs_entry.name, ".")
end

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  require("mini.files").refresh({ content = { filter = new_filter } })
end

local system_open = function()
  local file_path = require("mini.files").get_fs_entry().path
  if vim.fn.has("win32") == 1 then
    os.execute("start " .. file_path)
  elseif vim.fn.has("unix") == 1 then
    os.execute("xdg-open " .. file_path)
  else
    os.execute("open " .. file_path)
  end
end

local files_set_cwd = function()
  -- Works only if cursor is on the valid file system entry
  local cur_entry_path = MiniFiles.get_fs_entry().path
  local cur_directory = vim.fs.dirname(cur_entry_path)
  vim.fn.chdir(cur_directory)
end

return {
  "echasnovski/mini.files",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "File Browser (current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.loop.cwd(), true)
      end,
      desc = "File Browser (cwd)",
    },
  },
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_nofocus = 15,
      width_preview = 80,
    },
    mappings = {
      close = "<leader>e",
      go_in_plus = "l",
      go_in = "L",
      go_out_plus = "h",
      go_out = "H",
    },
    content = {
      filter = show_dotfiles and filter_show or filter_hide,
    },
  },
  config = function(_, opts)
    require("mini.files").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id

        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set("n", "g.", toggle_dotfiles, {
          buffer = buf_id,
          desc = "Toggle dotfiles",
        })

        vim.keymap.set("n", "gs", system_open, {
          buffer = buf_id,
          desc = "Open with system default",
        })

        vim.keymap.set("n", "gd", files_set_cwd, {
          buffer = buf_id,
          desc = "Change directory",
        })

        vim.keymap.set("n", "<leader>q", function()
          files_set_cwd()
          vim.fn.execute("qa!")
        end, {
          buffer = buf_id,
          desc = "Cd and quit",
        })
      end,
    })
  end,
}
