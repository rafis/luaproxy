require 'proxy'


p = proxy.new()
p:dostring([[
print('This is the proxy state')

print('n is:')
print(n)
]])

p.n = 42	-- creates n in the proxy state
p:dostring([[print('n is ' .. n) n = n + 1]])
print(p.n)

p.Query = {
	op = 'test',
	num = 73
}

p:dostring([[print(Query.op) print(Query.num)]])

print(p.Query.op)
print(p.Query.num)

p.Query.num = 15

p:dostring('print(Query.num)')

t = {
	a = 1,
	b = true,
	c = 3
}

p.t = t

p:dostring('print(t.a) print(t.b) print(t.c)')


p:dostring([[print('n is now ' .. n)]])

print("abc " .. p.Query.op)

p:dostring([[function test ()
	print('this is the test function in the proxy')
end]])

p.test()
