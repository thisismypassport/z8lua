
local eqmeta = {__eq=function() return true end}
local eqctor = function () return setmetatable({}, eqmeta) end

local t={1,2,3}
assert(add(t,123) == 123, 1)
assert(t[4] == 123, 1.01)
assert(select('#', add(1,2)) == 0, 1.1)
assert(add(t,9,2.1) == 9, 1.2)
assert(t[2] == 9, 1.21)
assert(t[3] == 2 and t[4] == 3, 1.22)
assert(add(t,100,#t+1) == 100, 1.3)
assert(t[#t] == 100, 1.31)
assert(select('#', add(t)) == 0, 1.4)
assert(select('#', add(t, nil)) == 1, 1.41)

local t={11,22,33,44,55}
assert(deli(t) == 55, 2)
assert(#t == 4, 2.01)
assert(deli(t, 3) == 33, 2.1)
assert(t[3] == 44, 2.11)
assert(select('#', deli(1)) == 0, 2.2)
assert(select('#', deli({})) == 0, 2.21)
assert(select('#', deli(t, 100)) == 0, 2.22)
assert(select('#', deli(t, -1)) == 0, 2.23)

local t={11,22,33,44}
local t2={1,2,nil,3,4}
assert(select('#', del(t, 4)) == 0, 3)
assert(select('#', del(t)) == 0, 3.01)
assert(select('#', del(3)) == 0, 3.02)
assert(del(t, 22) == 22, 3.1)
assert(t[2] == 33 and t[3] == 44, 3.11)
assert(#t == 3, 3.12)
assert(del({eqctor()}, eqctor()), 3.2)
assert(select('#', del(t2, nil)) == 1, 3.3)
assert(t2[3] == 3 and t2[4] == 4 and #t2 == 4, 3.31)

local t={1,2,3,nil,3,3,nil,4,4,3}
assert(count(t) == 10, 4)
assert(select('#', count(3)) == 0, 4.1)
assert(count(t, 1) == 1, 4.2)
assert(count(t, 3) == 4, 4.21)
assert(count(t, 4) == 2, 4.22)
assert(count(t, nil) == 2, 4.23)
assert(count(t, 5) == 0, 4.3)
assert(count({eqctor()}, eqctor()) == 1, 4.4)

assert(select('#', pairs({})) == 3, 5) -- builtin
assert(select('#', ipairs({})) == 3, 5.1) -- builtin
assert(select('#', next({})) == 1, 5.2) -- builtin

local t = {11,22,33}
assert(select(1, inext(t)) == 1, 6)
assert(select(2, inext(t)) == 11, 6.01)
assert(select(1, inext(t,1)) == 2, 6.1)
assert(select(2, inext(t,1)) == 22, 6.11)
assert(select(1, inext(t,2)) == 3, 6.2)
assert(select(2, inext(t,2)) == 33, 6.21)
assert(inext(t,3) == nil, 6.3)
assert(select('#', inext(t,3)) == 1, 6.31)
assert(inext(t,99) == nil, 6.4)
assert(inext(t,-1) == nil, 6.41)
assert(select(1, inext(t,0)) == 1, 6.5)
assert(select(2, inext(t,0)) == 11, 6.51)

assert(pack(1,2,3).n == 3, 7)
assert(pack(11,22,33)[2] == 22, 7.1)

assert(select('#', unpack({11,22,33})) == 3, 8)
assert(select('#', unpack({11,22,33,n=1})) == 3, 8.1)
assert(select('#', unpack({11,22,33},1,1)) == 1, 8.2)
assert(select('#', unpack({11,22,33},-1,2)) == 4, 8.3)
assert(select('1', unpack({11,22,33},-1,2)) == nil, 8.31)
assert(select('3', unpack({11,22,33},-1,2)) == 11, 8.32)

local t = {11,22,nil,33}
local f = all(t)
assert(select('#', all({1,2,3})) == 1, 9)
assert(f() == 11, 9.1)
assert(f() == 22, 9.11)
assert(f() == 33, 9.12)
assert(f() == nil, 9.2)
assert(select('#', f()) == 1, 9.21)
t[6]=99
assert(f() == 99, 9.3)
t[6]=101
assert(f() == 101, 9.31)
t[6]=102
assert(f() == 102, 9.32)
t[7]=55
assert(f() == 55, 9.33)
assert(all({eqobj})() == nil, 9.4)
local f = all("bog")
assert(f() == 'b', 9.5)
assert(f() == 'o', 9.51)
assert(f() == 'g', 9.52)
assert(f() == nil, 9.53)
assert(all(nil)() == nil, 9.6)

local t = {11,22,33}
local i = 1
assert(select('#', foreach(t,function(v) assert(v == t[i], 10.9); i += 1 end)) == 0, 10)
assert(i == 4, 10.1)
