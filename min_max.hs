
readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

f :: [String] -> [Float]
f = map read

main = do
  s <- readLines "100.txt"
  let a = f s
  print a
