use std::env;
use std::str::FromStr;


pub fn ackermann(m: u64, n: u64) -> u64 {
  if m == 0 {
    n + 1
  } else if n == 0 {
    ackermann(m - 1, 1)
  } else {
    ackermann(m - 1, ackermann(m, n - 1))
  }
}


fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        println!("usage: {} m n", args[0]);
        return;
    };

    let m = u64::from_str(&args[1]).unwrap();
    let n = u64::from_str(&args[2]).unwrap();

    let result = ackermann(m, n);

    println!("ackermann({}, {})", m, n);
    println!("Result: {}", result);
}
