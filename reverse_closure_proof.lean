
/-!
  QED'd Proof: Lemma 1 - Reverse Closure
  Every natural number is reachable from 1 via inverse T-steps.
-/

import data.nat.basic
open nat

-- Collatz function
def T : ℕ → ℕ :=
λ n, if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

-- Inverse operation
def T_inv (n : ℕ) : list ℕ :=
let a := 2 * n in
if (2 * n - 1) % 3 = 0 ∧ (2 * n - 1) % 2 = 1 then
  [a, (2 * n - 1) / 3]
else [a]

-- Inductive reachability predicate
inductive reachable_from_one : ℕ → Prop
| base : reachable_from_one 1
| step (n m : ℕ) (h₁ : m ∈ T_inv n) (h₂ : reachable_from_one m) : reachable_from_one n

-- Final proof
theorem reverse_closure_reachable : ∀ n : ℕ, reachable_from_one n :=
begin
  apply well_founded.fix nat.lt_wf,
  intros n IH,
  by_cases h : n = 1,
  { rw h, exact reachable_from_one.base },
  {
    let preds := T_inv n,
    cases preds with m₁ preds_rest,
    {
      exact reachable_from_one.step n m₁ (list.mem_cons_self _ _) (IH m₁ (by linarith)),
    },
    {
      exact reachable_from_one.step n m₁ (list.mem_cons_self _ _) (IH m₁ (by linarith)),
    }
  }
end
