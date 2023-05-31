--[[
The code from this mod starts by using the following bushy_leaves mod by erlehmann below and was refactored and expanded on by neuromancer.
My code changes is WTFPL.  
Info on bushy_leaves:
bushy_leaves – Minetest mod to render leaves bushy
Copyright © 2022  Nils Dagsson Moskopp (erlehmann)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

Dieses Programm hat das Ziel, die Medienkompetenz der Leser zu
steigern. Gelegentlich packe ich sogar einen handfesten Buffer
Overflow oder eine Format String Vulnerability zwischen die anderen
Codezeilen und schreibe das auch nicht dran.

]]--


local def = {
drawtype = "plantlike",
--tiles = {"default_leaves.png"},
paramtype = "light",
paramtype2 = "meshoptions",
place_param2 = 3,
sunlight_propagates = true,
walkable = false,
buildable_to = true,
drop = "",
--groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2}
}

local get_node_def = function(node_name, node_def)
	local new_node_def

	if (
		 (string.match(node_name, "leaves") and not(string.match(node_name, "with_leaves") ))or
		string.match(node_name, "needles")
	) then
		 new_node_def  = table.copy(def)
	end
	return new_node_def
end


local add_bushy_leaves = function()
	for node_name, node_def in pairs(minetest.registered_nodes) do
		local new_node_def = get_node_def(node_name, node_def)
		if  nil ~= new_node_def then
			minetest.override_item(node_name, new_node_def)
		end
	end
end

minetest.register_on_mods_loaded(add_bushy_leaves)
