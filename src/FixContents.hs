module FixContents
  ( fixContents
  , getFilenameFromPath
  )
where

import           Text.Regex.TDFA
import           Data.List

fixContents :: String -> String
fixContents str =
  let
    (s : strs)      = lines str
    noLeadingSpaces = deleteLeadingSpaces s
    creatorRemoved  = map
      (\x -> if containsCreatorField x then removeCreatorField x else x)
      strs
  in
    unlines $ noLeadingSpaces : creatorRemoved

deleteLeadingSpaces :: String -> String
deleteLeadingSpaces = dropWhile (== ' ')

creatorTag = "<Creator>"
creatorClosedTag = "</Creator>"

containsCreatorField :: String -> Bool
containsCreatorField str = str =~ creatorTag

removeCreatorField :: String -> String
removeCreatorField str =
  let (f1, _ ) = str =~ creatorTag :: (Int, Int)
      (f2, l2) = str =~ creatorClosedTag :: (Int, Int)
      (f , _ ) = splitAt f1 str
      (_ , l ) = splitAt (f2 + l2) str
  in  f ++ l

getFilenameFromPath :: String -> String
getFilenameFromPath str =
  let fileSplitAtSlash = groupBy (\x y -> x /= '/' && y /= '/') str
  in  last fileSplitAtSlash
