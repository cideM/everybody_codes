import argv
import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import gleam/yielder
import stdin

pub fn parse(input: String) -> Result(List(Int), Nil) {
  input
  |> string.trim
  |> string.split(",")
  |> list.try_map(int.parse)
}

fn ceil_sqrt(n: Int) -> Int {
  ceil_sqrt_loop(n, 0, n)
}

fn ceil_sqrt_loop(n: Int, lo: Int, hi: Int) -> Int {
  case lo >= hi {
    True -> lo
    False -> {
      let mid = { lo + hi } / 2
      case mid * mid >= n {
        True -> ceil_sqrt_loop(n, lo, mid)
        False -> ceil_sqrt_loop(n, mid + 1, hi)
      }
    }
  }
}

fn cones_needed_p1(n: Int) -> Int {
  let sqrt = ceil_sqrt(n)
  sqrt * sqrt - n
}

pub fn p1(input: String) -> Result(Int, Nil) {
  use cones <- result.map(parse(input))
  cones
  |> list.map(cones_needed_p1)
  |> int.sum
}

pub fn p2(input: String) -> Result(Int, Nil) {
  use cones <- result.map(parse(input))
  cones
  |> list.map(fn(n) { int.max(8, 4 * { { n + 3 } / 4 }) - n })
  |> int.sum
}

fn cones_needed_p3(n: Int) -> Int {
  let sqrt = ceil_sqrt(n + 1)
  let side = int.max(sqrt, 3)
  let side = case int.is_even(side) {
    True -> side + 1
    False -> side
  }
  side * side - 1 - n
}

pub fn p3(input: String) -> Result(Int, Nil) {
  use cones <- result.map(parse(input))
  cones
  |> list.map(cones_needed_p3)
  |> int.sum
}

pub fn main() {
  case argv.load().arguments {
    ["1"] -> run(p1)
    ["2"] -> run(p2)
    ["3"] -> run(p3)
    _ -> io.println_error("usage: gleam run -m d1 -- <1|2|3> <input>")
  }
}

fn run(solve: fn(String) -> Result(value, Nil)) -> Nil {
  let input = stdin.read_lines() |> yielder.to_list |> string.concat
  case solve(input) {
    Ok(answer) -> io.println(string.inspect(answer))
    Error(Nil) -> panic as "input parse error"
  }
}
