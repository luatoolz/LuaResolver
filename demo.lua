local Resolver = require "dns.resolver"

local function main(domain, type)
	type = type or "*"
	if not domain then
		print("Usage: ./demo.lua DOMAIN [RECORDTYPE]")
		return
	end
	
	local r = Resolver.new({"1.1.1.1"}, 2)
	r:addServer("8.8.8.8")
	
	local rec, errmsg = r:resolve(domain, type)
	if errmsg then
		print(errmsg)
		return
	end

	for _, v in ipairs(rec) do
		print(v.name, v.type, v.class, v.content)
	end
end
main(arg[1] or 'yandex.ru', arg[2] or '*')
