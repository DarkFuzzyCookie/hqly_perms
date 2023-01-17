function inTable(tab, val)
	if tab == nil then return false end
	
	for i = 1, #tab do
		if tab[i] == val then return true end
	end
	return false
end