(**********************************************************************)
(* Equations                                                          *)
(* Copyright (c) 2009-2016 Matthieu Sozeau <matthieu.sozeau@inria.fr> *)
(**********************************************************************)
(* This file is distributed under the terms of the                    *)
(* GNU Lesser General Public License Version 2.1                      *)
(**********************************************************************)

open Environ
open Names
open Equations_common
open Splitting

val make_ref : string list -> string -> Globnames.global_reference
val fix_proto_ref : unit -> Constant.t
val constr_of_global : Globnames.global_reference -> Constr.t

val define_by_eqs :
  Syntax.equation_option list ->
  Syntax.pre_equations ->
  (Misctypes.lstring * Constrexpr.constr_expr *
   Notation_term.scope_name option)
  list ->
  unit

val define_principles :
  flags ->
  EConstr.t list ->
  (program_info * compiled_program_info) list -> unit

val equations :
  Syntax.equation_option list ->
  Syntax.pre_equations ->
  (Misctypes.lstring * Constrexpr.constr_expr *
   Notation_term.scope_name option)
  list ->
  unit

val solve_equations_goal :
  Proof_type.tactic ->
  Proof_type.tactic ->
  Proof_type.goal Evd.sigma -> Proof_type.goal list Evd.sigma

val dependencies :
  env -> Evd.evar_map ->
  Constr.t -> named_context -> Id.Set.t * Id.Set.t
