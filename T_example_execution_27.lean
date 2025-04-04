
/-!
  Concrete Example: T^k(27) = 1
  This proves that for n = 27, T iterated 111 times leads to 1.
-/

import data.nat.basic
open nat

-- Collatz function
def T : ℕ → ℕ := λ n, if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

-- Iteration of T
def iterate_T : ℕ → ℕ → ℕ
| 0 n := n
| (k+1) n := T (iterate_T k n)

-- Example proof: 27 reaches 1 in 111 steps
example : iterate_T 111 27 = 1 := by norm_num
