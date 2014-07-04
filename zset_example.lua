local zset = require "zset" 

local sl = zset.new() 


-- add()
for i=1, 10 do 
    value = math.random(100, 1000)
    sl:add(value, "key_" .. tostring(i))
end

-- dump()
sl:dump()

-- score()
print("key_1 = " .. sl:score([[key_1]]))

-- range_by_score()
local res = sl:range_by_score(100, 500)
print("score range 100, 500:")
for k,v in pairs(res) do 
    print(k, v, sl:score(v))    
end

-- rank() 
print("key_1 is " .. sl:rank("key_1"))

-- rev_rank()
print("key_1 is " .. sl:rev_rank("key_1") .. " in inverted sequence")

-- range(), means range by rank 
res = sl : range(5, 7) 
print("rank range 5, 7:")
for k,v in pairs(res) do 
    print(k, v, sl:score(v))
end 

-- rev_range(), means range by rank but in inverted sequence
res = sl : rev_range(1, 3)
print("rev_range 1, 3:") 
for k,v in pairs(res) do 
    print(k, v, sl:score(v))
end 

-- rev_limit() 
print("rev_limit(9): ")
sl:rev_limit(9) 
sl:dump()


-- limit()
print("limit(7): ")
sl:limit(7)
sl:dump()

-- count() 
print("count = " .. sl:count())

-- rem()
sl:rem("key_2")
sl:dump()
