kwadraat :: Int -> Int 
kwadraat x = x * x 

trekSteentje :: [Int] -> [Int]
trekSteentje [x] = [x]
trekSteentje (0:0:xs) = trekSteentje (1:xs) 
trekSteentje (1:1:xs) = trekSteentje (1:xs) 
trekSteentje (0:1:xs) = trekSteentje (0:xs) 
trekSteentje (1:0:xs) = trekSteentje (0:xs) 

kwadr :: Int -> Int 
kwadr = \ x -> x * x 

drievoud :: Int -> Bool
drievoud = \ x -> (rem x 3 == 0)

awoord :: [Char] -> Bool
awoord [] = False 
awoord (x:xs) = (x == 'a') || (awoord xs)

bwoord :: [Char] -> Bool
bwoord [] = False
bwoord (x:xs) = (x == 'b') || (bwoord xs)

letter_in_woord :: [Char] -> Char -> Bool
letter_in_woord[] y = False
letter_in_woord (x:xs) y = (x==y) || (letter_in_woord xs y)

nullen = 0 : nullen 

nats = 0 : map (+1) nats

prime :: Integer -> Bool
prime n = 
  n > 1 && all (\ x -> rem n x /= 0) [2..n-1]

primes :: [Integer]
primes = filter prime [0..]

prime' :: Integer -> Bool
prime' n = 
  n > 1 && all (\ x -> rem n x /= 0) xs
  where xs = takeWhile (\ y -> y^2 <= n) [2..]

primes' :: [Integer]
primes' = filter prime' [0..]

ldf :: Integer -> Integer -> Integer
ldf k n | rem n k == 0 = k 
        | k^2 > n      = n 
        | otherwise    = ldf (k+1) n 

largerPrime :: Integer -> Integer
largerPrime n = ldf (n+1) (product [1..n] + 1)

largerPr :: Integer -> Integer
largerPr n = ldf (n+1) xs where
  xs = (product (takeWhile (<= n) primes') + 1)

sieve :: [Integer] -> [Integer]
sieve (n:ns) = 
  n : sieve (filter (\ k -> rem k n /= 0) ns)

sievePrimes :: [Integer]
sievePrimes = sieve [2..]

natpairs = [ (x, z-x) | z <- [0..], x <- [0..z] ]

nattriples = [ (x, y-x, z-y) | z <- [0..], 
                               y <- [0..z], 
                               x <- [0..y] ]
 
snd_not_zero = filter ((>0).snd) natpairs

positive_fractionals = filter (gcd == 1) snd_not_zero

--primepairs = [ (x, x+2) | x <- primes' where prime x+2 ]


