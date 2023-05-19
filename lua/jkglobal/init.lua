local JK = {}

_G.jk = {
    
}

_G.tb = {
    foreach = table.foreach,
    foreachi = table.foreachi,
    concat = table.concat,
    insert = table.insert,
    remove = table.remove,
    getn = table.getn,
    maxn = table.maxn,
    move = table.move,
    sort = table.sort,
    get = vim.tbl_get,
    map = vim.tbl_map,
    keys = vim.tbl_keys,
    count = vim.tbl_count,
    values = vim.tbl_values,
    filter = vim.tbl_filter,
    islist = vim.tbl_islist,
    extend = vim.tbl_extend,
    isempty = vim.tbl_isempty,
    flatten = vim.tbl_flatten,
    contains = vim.tbl_contains,
    deep_extend = vim.tbl_deep_extend,
    add_reverse_lookup = vim.tbl_add_reverse_lookup
}


return JK
