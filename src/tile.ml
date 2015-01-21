open Core.Std

type t =
  | Void
  | Solid
  | TopSolid
  | Sticky

let sexp_of_t = function
  | Void -> Sexp.Atom "."
  | Solid -> Sexp.Atom "#"
  | TopSolid -> Sexp.Atom "^"
  | Sticky -> Sexp.Atom "X"

let t_of_sexp = function
  | Sexp.Atom s -> (
    match String.nget s 0 with
    | '.' -> Void
    | '#' -> Solid
    | '^' -> TopSolid
    | 'X' -> Sticky
    | _ -> failwith "Tile.t_of_exp: Invalid tile symbol"
  )
  | _ -> failwith "Tile.t_of_exp: Invalid expression"

let size = 16