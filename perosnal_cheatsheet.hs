import Data.List
import System.IO

maxInt = maxBound :: Int

-- Integer vs Int (Bounded vs NonBounded)

-- Math functions (all trigonometric functions available too)

mynum = sum [1..39] 
piVal = pi
ePow47 = exp 39
logOf47 = log 39
truncateVal = truncate 39.47897
roundVal = round 39.28937
ceilingVal = ceiling 39.28923
floorVal = floor 39.2343149

-- Lists in Haskell are singly linked and you can only add to the front of them.

myList = [3, 5, 2, 9, 7]

--  Concatentation of a list (or string) can be done w/ the ' ++ ' operator (order matters):

newList = myList ++ [0,0,0,0]
otherList = [0,0,0,0] ++ myList

-- Combining single items to form a list can be done w/ the ' : ' operator with an empty list at the end: 

combinedList = 4 : 0 : 4 : []
addingValAtStartOfList = 5 : combinedList

-- Reversing a list
reversedList = reverse myList

-- Getting list item by index using ' !! ' operator:
secondItemInList = myList !! 1

-- "head" takes the first value, "last" takes the last value, and "take" returns a specific 
-- amount of values from the start and "minimum" and "maximum" gets min and max of a list

getFirst3ValuesFromList = take 3 myList

-- "drop" removes the amount of values, remember that all values are immutable so the assignment only has the new value:
drop3Items = drop 3 myList 
 
-- `elem` checks to see if an item is in a list (need to escape elem)
-- ( INFIX vs PREFIX keywords that perform operations need to me escaped using backticks ) 

is7InList = 7 `elem` myList

-- There are also infinite lists that are laziliy loaded, using [n..] notation and "repeat" , "replicate" or "cycle":

many2s = take 10 (repeat 2)
many3s = replicate 10 3

-- Expressions can be Mapped over every item in a list using
-- the following notation: (multiplying all items by 2)

multiplyByTwo = [x * 2 | x <- myList]
 
-- Items can be Filtered over a list with a given consraint separated by comma
-- from the same expression above.

filterEvenNums = [x | x <- myList, mod x 2 == 0]
multiplyByTwoThenFilterMoreThan10 = [x * 2 | x <- myList, x * 2 > 10] -- Multiple filters can be chained using commas

-- Sorting a list using "sort" and filtering a list with "filter"

greaterThan5 = filter (>5) myList

-- Apply an operator to each item of multiple lists (sum, product etc.. ) using "zipWith"

sumOfLists = zipWith (+) many2s many3s

-- "takeWhile" lazy-load items based on constraint 

evensUpTo20 = takeWhile (<=20) [2,4..] -- Infinite list using start and increment notation too: [start, increment]

-- "foldl" and "foldr" will have each item perform an operation on each other from right to left or vice versa

productOfList = foldl (*) 1 myList -- n * n + 1 etc...

-------------------------------TUPLES

-- "snd" and "fst" can be used to get the left or right values of a TUPLES

myTuple = ("weight", 50)

-- "zip" will combine two lists into a list of tuple pairs

someNames = ["Barry", "Smith", "Simon"]
someAges = [35, 34, 21]
namesAndAges = zip someNames someAges

------------------USING 'MAIN'
-- "do" will chain operations together like a normal program, w/ "main" to make the module executable or function body
-- "getLine" gets standard input from the user
-- "putStrLn" outputs a line of code to standard output for the user

main = do 
    putStrLn "What's your name?"
    name <- getLine
    putStrLn ("Hello " ++ name)


------------------FUNCTION
-- First you make the type declaration then specifiy the function body
-- Format: funcName param1 param2 = operations (returned value)

addMe :: Int -> Int -> Int -- Receives two integers and returns an integer
addMe x y = x + y
-- Type declarations aren't always needed which gives more freedom when dealing w/ types:
sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

-- functions can also return specific outputs for inputs:

whatAge :: Int -> String
whatAge 18 = "you can vote"
whatAge 21 = "you can drink"
whatAge _ = "don't know"

-- Recursion!!

factorial :: Int -> Int
factorial 0 = 1       -- Base Case
factorial n = n * factorial (n - 1)

-- GUARDS (like IF statements and the "otherwise" keywords for ELSE or even SWITCH statements)
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

whatTimeOfDay hour
    | (hour >= 0) && (hour < 12) = "Morning"
    | (hour > 12) && (hour < 18) = "Afternoon"
    | (hour > 18) = "Night" 
    | otherwise = "must be less than 24"

-- The "where" clause provides a way to reuse computed values in a function that has GUARDS

whatOverallGrade :: [Int] -> String
whatOverallGrade grades
    | (avg >= 80) && (avg < 90) = "B"
    | (avg >= 90) = "A"
    | otherwise = "not passing"
     where avg = (foldl (+) 0 grades) `div` (length grades)

-- Selecting items from a list using (x:[] , x:xs) notation in function arguments (also iterating over a list recursively using x:xs)
-----------------TO DO:

-- Higher Order Functions "map" etc.. Taking in and returning functions

-- map: 


------ TO DO

useFuncWithNum :: (Int -> Int) -> Int     -- This says its expecting a function as input that takes in an int and returns one

multBy4 :: Int -> Int
multBy4 num = num * 4

useFuncWithNum fn = fn 3

mult4and3 = useFuncWithNum multBy4

--------------------------------ENUMERATED AND CUSTOM TYPES W/ TYPE CLASSES
-----TO DO


-- The Just keyword: 


-------------------------------------MONADS 
-- (Monads are in a way like promises ) (>>=) (bind operation) and (>>) anonymous bind
-- WHERE: m >>= (\x -> ..) is equivalent to "do" x <- m

{-
# Implementation of "Maybe" Monad #

    instance Monad Maybe where 
    m >>= f case m of
        Nothing -> Nothing
        Just x -> f x
    return v = Just v

# Implementation of (>>=)(bind) #

    (>>=) :: Monad m => m a -> (a -> m b) -> m b

Proving the Monad in the same stride as "callback hell" in Javascript:

-}