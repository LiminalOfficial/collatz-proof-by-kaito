# Collatz Conjecture — Structural Proof (by Kaito Maki)

This repository contains a formalized and constructive structural proof of the **Collatz Conjecture**.

### Summary

- Every natural number n ∈ ℕ eventually maps to 1 under the Collatz function:
  

- The proof is structured into 3 key lemmas:
1. **Reverse Closure** — every number can be reached from 1
2. **Descending Dominance** — all odd values eventually decrease
3. **Inductive Inclusion** — all ℕ are included in a recursive structure that leads to 1

- Verified using the **Lean theorem prover**

### Files

- `.lean` files contain the formalized lemmas and main theorem
- `.tex` file includes the explanatory paper version

### Author

**Kaito Maki**  
Date: April 2025  
License: MIT

> "This structure once breathless, now exhales numbers into light."
