open Printf

let rec ackermann x y = match (x,y) with
    | (0, _) -> y + 1
    | (_ , 0) -> ackermann (x - 1) 1
    | (_, _) -> ackermann (x - 1) (ackermann x (y - 1));;

let display m n = printf "%i\n" (ackermann m n);;

if !Sys.interactive then () else display (int_of_string (Sys.argv.(1))) (int_of_string (Sys.argv.(2)));;