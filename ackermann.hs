--ackermann.hs
import System.Environment

ackermann :: Integer -> Integer -> Integer
ackermann 0 y = y + 1
ackermann x 0 = ackermann (x-1) 1
ackermann x y = ackermann (x-1) $ ackermann x (y-1)

main = do
    args <- getArgs
    let arg1 = args !! 0
    let arg2 = args !! 1
    putStrLn $ show $ ackermann (read arg1) (read arg2)
