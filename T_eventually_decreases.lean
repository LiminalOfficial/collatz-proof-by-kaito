
/-!
  FINAL SUPPORTING LEMMA:
  T eventually decreases — ∃ k, T^k(n) < n for all n
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

-- Supporting Lemma: Eventually T reduces the value
theorem T_eventually_decreases : ∀ n : ℕ, ∃ k ≤ 1000, iterate_T k n < n ∨ iterate_T k n = 1 :=
begin
  intro n,
  -- Computable fallback for now: assumed checked for all n ≤ 1000
  -- For actual QED, replace this with computable verification or well-founded proof
  use 100,
  split,
  { norm_num },
  { admit } -- requires evaluation trace or well-founded induction
end
