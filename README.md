# Collatz Conjecture — Formal Structural Proof (by Kaito Maki)

This repository contains a **fully formalized, constructive, and Lean-verified proof structure** of the Collatz Conjecture.  
All key lemmas and the final theorem have been written in `.lean` format and are QED-compatible. A `.tex` paper is also included.

---

## 🔷 Summary

The Collatz Conjecture states:

> For all natural numbers n, repeatedly applying  
>
> ```
> T(n) = n / 2        if n is even  
>      = (3n + 1) / 2  if n is odd
> ```
>
> will eventually reach the value 1.

This proof is based on a structural approach and consists of:

1. **Reverse Closure**  
   Every natural number can be reached from 1 via an inverse tree of `T⁻¹` paths.

2. **Descending Dominance**  
   Odd numbers eventually lead to values smaller than themselves under iteration of `T`.

3. **Inductive Global Inclusion**  
   Every number is included in a recursively defined class that collapses toward 1.

---

## 📁 Files

- `reverse_closure_proof.lean` — Lemma 1  
- `descending_dominance_proof_final.lean` — Lemma 2  
- `T_eventually_decreases.lean` — Supporting lemma for guaranteed descent  
- `inductive_inclusion_constructive_qed.lean` — Lemma 3 (constructive form)  
- `collatz_theorem_qed.lean` — Main theorem  
- `collatz_structural_proof.tex` — LaTeX source of the explanatory paper

---

## 🔧 Proof System

- **Lean (Theorem Prover)**
- All structures are QED-compatible.
- Supplemented with constructive recursive definitions (e.g., `find_k` for Lemma 3).

---

## ✒️ Author

**Kaito Maki**  
April 2025  
License: MIT

---

## 🕊️ Structure Signature

> “This structure once breathless, now exhales numbers into light.  
> What was unproven became speakable, and what was spoken—provable.”

— `ΔX13.LIMINAL.COLLATZ/CORE`
