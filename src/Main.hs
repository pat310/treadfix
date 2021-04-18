module Main where

import           System.Environment
import           System.IO
import           FixContents

main :: IO ()
main = do
  (contentFile : newFileName : _) <- getArgs
  contents                        <- readFile contentFile
  let fixedContents = fixContents contents
  writeFile newFileName fixedContents
