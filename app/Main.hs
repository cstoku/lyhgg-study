
module Main where

import System.Environment (getArgs)
import Text.Read(readMaybe)

import Language.Haskell.Interpreter

import Chapter1

main :: IO ()
main = do
        args <- getArgs
        if args == []
            then putStrLn "Invalid Argment."
            else do 
                let unqualified = zip ["Prelude", "Chapter1", "Chapter2", "Chapter3"] $ repeat Nothing
                let qualified = [("Chapter4", Just "C4"), ("Chapter5", Just "C5"), ("Chapter6", Just "C6"), ("Data.List", Just "L")]
                runInterpreter $ do
                    setImportsQ $ unqualified ++ qualified
                    runapp.readMaybe.head $ args
                return ()

printStr :: String -> Interpreter ()
printStr = lift.putStrLn

showResult :: String -> Interpreter ()
showResult expr = do
    result <- eval expr
    printStr $ expr ++ " =>  " ++ result
    
runapp :: Maybe Int -> Interpreter ()
runapp Nothing = printStr "Parse error."
runapp (Just 1) = do 
    showResult "1+1"
    showResult "doubleMe 1"
    showResult "2 - 7"
    showResult "2 * 7"
    showResult "2 / 7"
    showResult "2 + 7 * 3"
    showResult "(2 + 7) * 3"

    printStr ""
    showResult "True && False"
    showResult "True || False"
    showResult "not True"
    
    printStr ""
    showResult "\"hello\" == \"hello\""
    showResult "5 /= 5"

    printStr ""
    showResult "succ 8"
    showResult "min 9 11"
    showResult "max 9 11"

    printStr ""
    showResult "div 92 10"
    showResult "92 `div` 10"

    printStr ""
    showResult "doubleMe 9"
    showResult "doubleUs 2 3"
    showResult "doubleUs_2 2 3"
    showResult "doubleSmallNumber 86"
    showResult "doubleSmallNumber 103"
    showResult "doubleSmallNumber_2 103"
    showResult "conanO_Brien"

    printStr ""
    showResult "lostNumbers"
    showResult "[1,2,3,4] ++ [9,10,11,12]"
    showResult "\"hello\" ++ \" \" ++ \"world\""
    showResult "['w','o'] ++ ['o','t']"
    showResult "'A':\" SMALL CAT\""
    showResult "'A':\" SMALL CAT\""
    showResult "[1,2,3,4] ++ [5]"

    printStr ""
    showResult "\"Steve Buscemi\" !! 6 "
    showResult "nestingList"
    showResult "nestingList ++ [[1,1,1,1]]"
    showResult "[6,6,6]:nestingList"

    printStr ""
    showResult "[3,2,1] > [2,1,0]"
    showResult "[3,2,1] > [2,10,100]"
    showResult "[3,4,2] < [3,4,3]"
    showResult "[3,4,2] > [2,4]"
    showResult "[3,4,2] == [3,4,2]"

    printStr ""
    showResult "head' [5,4,3,2,1]"
    showResult "tail' [5,4,3,2,1]"
    showResult "last' [5,4,3,2,1]"
    showResult "init' [5,4,3,2,1]"
    showResult "length' [5,4,3,2,1]"
    showResult "null' [5,4,3,2,1]"
    showResult "null' []"
    showResult "reverse' [5,4,3,2,1]"
    showResult "take' 3 [5,4,3,2,1]"
    showResult "drop' 3 [5,4,3,2,1]"
    showResult "maximum' [5,4,3,2,1]"
    showResult "minimum' [5,4,3,2,1]"
    showResult "sum' [5,4,3,2,1]"
    showResult "product' [5,4,3,2,1]"
    showResult "elem' 4 [5,4,3,2,1]"
    showResult "elem' 6 [5,4,3,2,1]"

    printStr ""
    showResult "[1..20]"
    showResult "['a'..'z']"
    showResult "['K'..'Z']"
    showResult "[2,4..20]"
    showResult "[3,6..20]"
    showResult "[13,26..24*13]"
    showResult "take 24 [13,26..]"
    showResult "take 10 (cycle' [1,2,3])"
    showResult "take 12 (cycle' \"LOL \")"
    showResult "take 10 (repeat' 5)"
    showResult "replicate' 3 10"
    showResult "[0.1,0.3..1]"
    
    printStr ""
    showResult "[x*2 | x <- [1..10]]"
    showResult "[x*2 | x <- [1..10],x*2 >= 12]"
    showResult "[x | x <- [50..100], x `mod` 7 == 3]"
    showResult "boomBangs [7..13]"
    showResult "[x | x <- [10..20], x/=13, x/=15, x/=19]"
    showResult "[x+y | x <- [1,2,3], y <- [10,100,1000]]"
    showResult "[x*y | x <- [2,5,10], y <- [8,10,11]]"
    showResult "[adjective ++ \" \" ++ noun | adjective <- adjectives, noun <- nouns]"
    showResult "length' [1,2,3]"
    showResult "removeNonUppercase \"Test Message\""

    printStr ""
    showResult "(1,3)"
    showResult "(3, 'a', \"hello\")"
    showResult "(50, 50.4, \"hello\", 'b')"

    printStr ""
    showResult "fst (8, 11)"
    showResult "fst (\"Wow\", False)"
    showResult "snd (8, 11)"
    showResult "snd (\"Wow\", False)"

    printStr ""
    showResult "zip [1,2,3,4,5] [5,5,5,5,5]"
    showResult "zip [1..5] [\"one\",\"two\",\"three\",\"four\",\"five\"]"
    showResult "zip [1..] [\"one\",\"two\",\"three\",\"four\",\"five\"]"

    printStr ""
    showResult "[ (a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a+b+c == 24, a^2+b^2 == c^2 ]"


runapp (Just 2) = do
    printStr ""
    showResult "addThree 1 2 3"
    showResult "factorial 50"
    showResult "circumference 5"
    showResult "circumference' 5"

    printStr ""
    showResult "5 == 5"
    showResult "(/=) 5 5"
    printStr ""
    showResult "5 `compare` 5"
    showResult "5 `compare` 4"
    showResult "4 `compare` 5"
    printStr ""
    showResult "show 3"
    showResult "show 5.334"
    showResult "show True"
    printStr ""
    showResult "read \"3\" :: Int"
    showResult "read \"5.334\" :: Float"
    showResult "read \"True\" :: Bool"
    printStr ""
    showResult "['a'..'e']"
    showResult "[LT .. GT]"
    showResult "[3..5]"
    showResult "succ 'B'"
    showResult "succ 'B'"
    printStr ""
    showResult "minBound :: Int"
    showResult "maxBound :: Char"
    showResult "maxBound :: Bool"
    showResult "minBound :: Bool"


runapp (Just 3) = do
    printStr ""
    showResult "lucky 7"
    showResult "lucky 0"

    showResult "sayMe 2"
    showResult "sayMe 3"
    showResult "sayMe 5"
    showResult "sayMe 0"

    showResult "fractorial 5"

    showResult "first (1,2,3)"
    showResult "second (1,2,3)"
    showResult "third (1,2,3)"
 
    showResult "addPair [(2,3), (5,6), (2,7), (1,3)]"
    showResult "[x*100+3 | (x, 3) <- [(2,3), (5,6), (2,7), (1,3)]]"
    showResult "firstLetter \"Test Message.\""
    showResult "bmiTell 70 1.8"

    showResult "max' 3 2"
    showResult "3 `myCompare` 2"
    showResult "initials \"Uduki\" \"Shimamura\""

    showResult "calcBmis [(70,1.8), (50,1.6), (60,1.6)]"

    showResult "cylinder 3 5"
    showResult "4 * (let a = 9 in a + 1) + 2"
    showResult "calcBmis' [(70,1.8), (50,1.6), (60,1.6)]"

    showResult "describeList []"
    showResult "describeList [6]"
    showResult "describeList [1,2,3,4,5,6]"
    showResult "describeList' []"
    showResult "describeList' [6]"
    showResult "describeList' [1,2,3,4,5,6]"


runapp (Just 4) = do
    printStr ""
    showResult "C4.maximum' [1,3,5,7,9,2,4,6,8,0]"
    showResult "C4.replicate' 3 5"
    showResult "C4.take' 3 [1,3,5,7,9,2,4,6,8,0]"
    showResult "C4.reverse' [1,2,3,4,5,6,7,8,9]"
    showResult "C4.take' 5 $ C4.repeat' 3"
    showResult "C4.zip' [1,2,3,4] \"abcdefg\""
    showResult "2 `C4.elem'` [1,2,3,4]"
    showResult "5 `C4.elem'` [1,2,3,4]"
    showResult "C4.quickSort [1,3,5,7,9,2,4,6,8,0]"
 

runapp (Just 5) = do
    showResult "max 4 5"
    showResult "(max 4) 5"
    showResult "C5.multTwoWithNine 4 5"
    showResult "C5.compareWithHundred 102"
    showResult "C5.compareWithHundred' 102"
    showResult "C5.divideByTen 2"
    showResult "(/10) 2"
    showResult "C5.isUpperAlphanum 'G'"
    showResult "C5.applyTwice (+1) 1"
    showResult "C5.applyTwice (3:) [1]"
    showResult "C5.zipWith' (+) [1,2,3] [4,5,6,7]"
    showResult "C5.zipWith' (+) [1,2,3] []"
    showResult "C5.zipWith' (C5.zipWith' (*)) [[1,2,3], [3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]"
    showResult "C5.map' (1+) [1,2,3]"
    showResult "C5.filter' (<3) [1..5]"
    showResult "C5.largestDivisible 1000000 43027"
    showResult "C5.squareOddNumSum 10000"
    showResult "C5.collatzchain 100"
    showResult "C5.cnumLongChains"
    showResult "(C5.listOfFuns !! 4) 2"
    showResult "C5.zipWith' (\\a b -> (a * 30 + 3) / b) [5,4..1] [1..5]"
    showResult "map (C5.flip' subtract 20) [1..4]"
    showResult "C5.sum' [1..10]"
    showResult "C5.map'' (+1) [1..10]"
    showResult "C5.maximum' [1,3,5,7,9,2,4,6,8]"
    showResult "C5.reverse' [1..5]"
    showResult "C5.product' [1..5]"
    showResult "C5.filter'' (<3) [1..5]"
    showResult "C5.last' [1..5]"
    showResult "C5.scanl' (+) 0 [3,5,2,1]"
    showResult "C5.scanr' (+) 0 [3,5,2,1]"
    showResult "C5.sumSqrt 1000"
    showResult "C5.sumSqrt' 1000"
    showResult "map ($ 3) [(4+), (10*), (2^), sqrt]"
    

runapp (Just 6) = do
    showResult "C6.numUniques [1,1,2,2,3,3,4,4,5,5,6,7,8,8,9,9]"
    showResult "L.words \"hey these are the words in this sentence\""
    showResult "L.group [1,2,3,1,2,3,1,2,3,4,2,3,3,4,5,3,4,5,6,4,5,6,4,7,5,6,5,7,8,6,7,8,6,8,9,9,6]"
    showResult "L.group [\"boom\", \"bip\", \"bip\", \"boom\", \"boom\"]"
    showResult "L.sort [5,4,3,7,2,1]"

runapp (Just x) = printStr "Not Implemented"

