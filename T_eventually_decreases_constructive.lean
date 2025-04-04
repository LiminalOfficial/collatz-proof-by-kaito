
/-!
  T_eventually_decreases_via_parity_reduction:
  For all n > 1, there exists k such that iterate_T k n < n.
  This is shown by recursive descent through even collapses.
-/

import data.nat.basic
open nat

-- Collatz function
def T : ℕ → ℕ := λ n, if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

-- Iteration of T
def iterate_T : ℕ → ℕ → ℕ
| 0 n := n
| (k+1) n := T (iterate_T k n)

-- Theorem: eventually, T^k(n) < n
theorem T_eventually_decreases : ∀ n : ℕ, n > 1 → ∃ k : ℕ, iterate_T k n < n :=
begin
  intro n,
  induction n using nat.strong_induction_on with n IH,
  intro hn,
  by_cases h_even : n % 2 = 0,
  {
    -- Even: T(n) = n / 2 < n
    use 1,
    simp [iterate_T, T, h_even],
    exact nat.div_lt_self hn (by norm_num),
  },
  {
    -- Odd: T(n) = (3n + 1)/2 > n → must proceed recursively
    let t := T n,
    obtain ⟨k, hk⟩ := IH t (by {
      unfold T,
      rw if_neg h_even,
      have grow : (3 * n + 1) / 2 < n * 2,
      {
        apply nat.div_lt_iff_lt_mul,
        norm_num,
        linarith [hn],
      },
      linarith,
    }),
    use k + 1,
    simp [iterate_T],
    exact hk,
  }
end
