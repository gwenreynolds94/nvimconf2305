local K = {}

local kset = vim.keymap.set





--- --[=====[
----- key utils {{{2

function K.binder(s)
    local skeys = tb.keys(s)
    local has_leader = tb.contains(skeys, 'leader')
    local has_mode = tb.contains(skeys, 'mode')
    local has_opts = tb.contains(skeys, 'opts')
    local leader = (has_leader and s.leader) or [[]]
    local mode = (has_mode and s.mode) or { [[n]] }
    local opts = (has_opts and s.opts) or {}
    for lh, rh in pairs(s) do
        local reserved = (lh == 'leader') or (lh == 'mode') or
                         (lh == 'opts')   or (lh == 'bind')
        if not reserved then
            if type(rh) == 'string' or type(rh) == 'function' then
                kset(mode, leader..lh, rh, opts)
            elseif type(rh) == 'table' then
                local rkeys = tb.keys(rh)
                local _has_index = #rh > 0
                local _has_rhs = tb.contains(rkeys, 'rhs')
                if not (_has_index or _has_rhs) then return end
                local _has_mode = tb.contains(rkeys, 'mode')
                local _has_opts = tb.contains(rkeys, 'opts')
                kset((_has_mode and rh.mode) or mode,
                     leader..lh,
                     (_has_rhs and rh.rhs) or rh[1],
                     (_has_opts and rh.opts) or opts)
            end
        end
    end
end


function K:bindall()
    for _key, _val in pairs(self) do ---@cast _key string
        if _key:match[[keys$]]    and
            type(_val) == 'table' and
            tb.contains(tb.keys(_val), 'bind')
        then
            _val:bind()
        end
    end
end

----- key utils }}}2
--- --]=====]





--- --[=====[
----- comment utils {{{2

K.comment = {}

K.comment.line = {}

local function _comment_line(self)

end
setmetatable(K.comment.line, { __call = _comment_line })

function K.comment.line:undo()

end



K.comment.range = {}

local function _comment_range(self)

end
setmetatable(K.comment.range, { __call = _comment_range })

function K.comment.range:undo()

end

----- comment utils }}}2
--- --]=====]





--- --[=====[
----- key tables {{{2

K.misc_keys = {
    bind       = K.binder,
    [',,']     = [[@@]],
    ['<M-BS>'] = { [[<C-w>]], mode = { 'i', 'c' } },
    ['<M-Left>'] = { [[<C-\><C-n>]], mode = { 't' } },
}

K.leader_keys = {
    bind    = K.binder,
    leader  = [[<leader>]],
    noh     = [[<CMD>nohl<CR>]],
    undoall = [[<CMD>u0<CR>]],
    dnl     = [[<CMD>%s;\s\+$;<CR>]],
    bufs    = [[<CMD>buffers<CR>]]
}

K.win_leader_keys = {
    bind   = K.binder,
    leader = [[<leader>w]],
    ww     = [[<CMD>w<CR>]],
    wq     = [[<CMD>wq<CR>]],
    qq     = [[<CMD>q<CR>]],
    qa     = [[<CMD>qa<CR>]],
    q1     = [[<CMD>q!<CR>]],
    e      = [[<C-w><C-w>]],
}

----- key tables }}}2
--- --]=====]





--- --[=====[
----- coc bindings {{{2

local tab_opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
}

function _G._jk_check_backspace()
    local col = vim.fn.col[[.]] - 1
    return col == 0 or vim.fn.getline[[.]]:sub(col, col):match[[%s]] ~= nil
end

kset( [[i]], [[<TAB>]],
    [[coc#pum#visible() ? coc#pum#next(1) : v:lua._jk_check_backspace() ? "<TAB>" : coc#refresh()]],
    tab_opts)
kset( [[i]], [[<S-TAB>]],
    [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
    tab_opts)

----- coc bindings }}}2
--- --]=====]





return K
