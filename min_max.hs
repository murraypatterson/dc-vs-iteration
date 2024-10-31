import System.Environment
import Text.Printf (printf)

left :: [a] -> [a]
left xs = take n xs
  where n = length xs `div` 2

right :: [a] -> [a]
right xs = drop n xs
  where n = length xs `div` 2

minmax :: Ord a => [a] -> (a,a)
minmax [x] = (x,x)
minmax xs = (min mnl mnr, max mxl mxr)
  where
    (mnl, mxl) = minmax (left xs)
    (mnr, mxr) = minmax (right xs)

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

f :: [String] -> [Double]
f = map read

showPair :: (Double,Double) -> String
showPair t = printf "%.10f %.10f" x y
  where (x,y) = t

main = do
  args <- getArgs
  s <- readLines $ head args
  putStrLn $ showPair $ minmax (f s)
