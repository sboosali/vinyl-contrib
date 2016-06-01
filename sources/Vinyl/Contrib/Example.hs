module Vinyl.Contrib.Example where
import Vinyl.Contrib()

{-|
@
stack build && stack exec -- vinyl-contrib-example
@
-}
main :: IO ()
main = do
 putStrLn ""
 print $ "Vinyl"
