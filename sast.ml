(* Semantically-checked Abstract Syntax Tree
 * Contributors: Caroline Roig-Irwin clr2176
 *)

open Ast

type sexpr = typ * sx
and sx =
    SLiterali of int
  | SLiteralc of char
  | SLiterals of string
  | SLiteralb of bool
  | Null
  | SVariable of string
  | SVmember of sexpr * string
  | SLiterall of (sexpr list)
  | SLiteralm of ((sexpr * sexpr) list)
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SAssign of string * sexpr
  | SAssignm of sexpr * string * sexpr
  | SNewtobj of typ
  | SNewobj of (sexpr * sexpr) list
  | SNewlis of sexpr list
  | SCall of string * sexpr list
  | SNoexpr


type sstmt =
  SExpr of sexpr
  | SReturn of sexpr
  | SPrint of sexpr
  | SIf of sexpr * (sstmt list) * (sstmt list)
  | SWhile of sexpr * (sstmt list)
  | SFor of sexpr * (sstmt list)
  | SForeach of string * sexpr * (sstmt list)
  | SBind of typ * string
  | SExit of int


type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : formalbind list;
    sbody : sstmt list;
  }

type sprogram = formalbind list * sfunc_decl list
