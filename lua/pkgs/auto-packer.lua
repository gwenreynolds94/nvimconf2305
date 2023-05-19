local A = {}


A.git_url = 'https://github.com/wbthomason/packer.nvim'


A.plugin_dir = vim.fn.stdpath'data'..'/site/pack/packer/start/packer.nvim'

function A:has_dir()
    return not (vim.fn.empty(vim.fn.glob(self.plugin_dir)) > 0)
end


A.bootstrapped = false

function A:bootstrap()
    self.bootstrapped = vim.fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        self.git_url,
        self.plugin_dir
    }
    return self.bootstrapped
end

function A:ready()
    local good_string = (type(self.bootstrapped) == 'string' and 
                         not self.bootstrapped:match[[^fatal]])
    local good_bool = type(self.bootstrapped) == 'boolean'
    return (good_string or good_bool)
end

function A:startup()
    require'packer'.startup(function(use)
        for _, _pkg in ipairs(self.pkgs) do
            use(_pkg)
        end
        if self.bootstrapped then require'packer'.sync() end
    end)
end


A.pkgs = {
    [[wbthomason/packer.nvim]],
    insert = tb.insert
}


function A:init(pkg_list)
    pkg_list = pkg_list or {}
    for _, _pkg in ipairs(pkg_list) do
    	self.pkgs:insert(_pkg)
    end
    if not self:has_dir() then self:bootstrap() end
    if self:ready() then self:startup() end
end

return A
