
doubleFact :: Integer -> Integer
doubleFact 0 = 0
doubleFact 1 = 1
doubleFact 2 = 2
doubleFact n = n * doubleFact (n - 2)