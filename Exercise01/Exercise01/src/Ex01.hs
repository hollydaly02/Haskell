module Ex01 where
import Data.Char (toLower)
-- import Data.List(group)

name, idno, username :: String
name      =  "Holly Daly"  -- replace with your name
idno      =  "20331814"    -- replace with your student id
username  =  "dalyho"   -- replace with your TCD username


declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]


{- Part 1

Write a function 'lower' that converts a string to lowercase

Hint: 'toLower :: Char -> Char' converts a character to lowercase
if it is uppercase. All other characters are unchanged.
It is imported should you want to use it.

-}
lower :: String -> String
lower str = [toLower ch | ch <- str]  -- goes through the string and converts all characters to lower

{- Part 2

Write a function 'nth' that returns the nth element of a list.
Hint: the test will answer your Qs

-}
nth :: Int -> [a] -> a
nth n xs = xs !! (n-1)  -- !! gets the element (n-1) in the list, we use n-1 as the index starts at 0


{- Part 3

Write a function `commonPfx` that compares two sequences
and returns the prefix they have in common.

-}
commonPfx :: Eq a => [a] -> [a] -> [a]
commonPfx _ [] = []                 -- empty list 
commonPfx [] _ = []                 -- empty list 
commonPfx (x:xs) (y:ys)   
    | x == y = x :(commonPfx xs ys)  -- if x equals y then add x to prefix and call commonPfx on lists xs and ys                                              
    | otherwise = []                -- else return empty list

{- Part 4

(TRICKY!) (VERY!)

Write a function `runs` that converts a list of things
into a list of sublists, each containing elements of the same value,
which when concatenated together give the same list

So `runs [1,2,2,1,3,3,3,2,2,1,1,4]`
 becomes `[[1],[2,2],[1],[3,3,3],[2,2],[1,1],[4]]`

Hint:  `elem :: Eq a => a -> [a] -> Bool`

HINT: Don't worry about code efficiency
       Seriously, don't!
-}
runs :: Eq a => [a] -> [[a]]
-- runs xs = group xs
runs = groupBy (==)                                  -- function uses groupBy which uses an equality test
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]          -- groupBy function, a non-overloaded version of 'group'
groupBy _ [] = []                                    -- empty list 
groupBy eq (x:xs) = (x:ys) : groupBy eq zs           -- the list here starts with x, and contains all the elements of ys, ( x is the first element of the sublist)
                     where (ys,zs) = span (eq x) xs  -- the predicate is eq x so it adds elements to the group as long as the predicate holds
