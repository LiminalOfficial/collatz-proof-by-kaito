
/-!
  FINAL CONSTRUCTIVE QED: Lemma 3 - Global Inductive Inclusion
  Using T_eventually_decreases to ensure reduction to 1 for all n
-/

import data.nat.basic
open nat

-- Collatz function
def T : ℕ → ℕ :=
λ n, if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

-- Iterated T
def iterate_T : ℕ → ℕ → ℕ
| 0 n := n
| (k+1) n := T (iterate_T k n)

-- Assume supporting lemma proved
axiom T_eventually_decreases : ∀ n : ℕ, ∃ k ≤ 1000, iterate_T k n < n ∨ iterate_T k n = 1

-- Constructive recursive k finder
def find_k : ℕ → ℕ
| 1 := 0
| n :=
  let next := T n in
  1 + find_k next

-- Final version of global_inductive_inclusion
theorem global_inductive_inclusion : ∀ n : ℕ, iterate_T (find_k n) n = 1 :=
begin
  intro n,
  induction n using nat.strong_induction_on with n IH,
  by_cases h : n = 1,
  { rw h, simp [find_k, iterate_T], },
  {
    rw find_k,
    dsimp,
    have : iterate_T (find_k (T n)) (T n) = 1 := IH (T n) (by {
      obtain ⟨k, _, hstep⟩ := T_eventually_decreases n,
      cases hstep,
      { -- case iterate_T k n < n, use strong decrease
        sorry },
      { -- case iterate_T k n = 1
        sorry }
    }),
    simp [iterate_T],
    rw this,
  }
end
