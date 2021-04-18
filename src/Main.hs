module Main where

import           System.Directory
import           System.Environment
import           System.IO
import           FixContents

main :: IO ()
main = do
  (filePath : _) <- getArgs
  contents       <- readFile filePath
  let fileName = getFilenameFromPath filePath
  (tempName, tempHandle) <- openTempFile "." "temp"
  let fixedContents = fixContents contents
  hPutStr tempHandle fixedContents
  hClose tempHandle
  removeFile filePath
  renameFile tempName filePath
