@implementation NSTextSelectionLineFragmentInfo

uint64_t __55____NSTextSelectionLineFragmentInfo__fetchCaretOffsets__block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  BOOL v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;

  v6 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  v8 = *(_QWORD *)(result + 32);
  if (v7 > *(_QWORD *)(v8 + 24))
    goto LABEL_2;
  v12 = result;
  v13 = v7 - 1;
  if (v7 < 1)
  {
    v19 = 1;
  }
  else
  {
    v14 = *(_QWORD *)(v8 + 48);
    v15 = v14 + 32 * v13;
    v16 = *(double *)v15;
    v17 = vabdd_f64(*(double *)v15, a5);
    v18 = *(unsigned __int8 *)(v15 + 24);
    if (v17 >= 0.001)
    {
      if (!v18)
      {
        v21 = v14 + 32 * v13;
        if ((unint64_t)v7 >= 2 && *(_QWORD *)(v21 + 16) == 0)
        {
          v23 = *(void **)(v21 + 8);
          v24 = 32 * v7;
          while (vabdd_f64(v16, *(double *)(v14 - 64 + v24)) < 0.001)
          {
            --v13;
            v24 -= 32;
            if (v13 <= 0)
              goto LABEL_27;
          }
          v19 = 1;
          while (1)
          {
            v25 = *(_QWORD *)(*(_QWORD *)(v12 + 32) + 48) + v24;
            if (*(_BYTE *)(v25 - 40))
            {
              result = objc_msgSend(v23, "isEqual:", *(_QWORD *)(v25 - 56));
              if ((_DWORD)result)
                break;
            }
            --v13;
            v24 -= 32;
            if (v13 <= 0)
              goto LABEL_28;
          }
          --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24);
        }
      }
LABEL_27:
      v19 = 1;
    }
    else
    {
      v19 = v18 != a3;
      v20 = v18 != a3 && a3 == 0;
      if (!v20)
        *(_QWORD *)(v6 + 24) = v13;
    }
LABEL_28:
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24);
    if (v26 >= 1)
    {
      v27 = v26 - 1;
      v20 = v27 == 0;
      v28 = *(_QWORD *)(*(_QWORD *)(v12 + 32) + 48) + 32 * v27;
      v29 = !v20 && *(_QWORD *)(v28 + 16) == 0;
      if (v29 && a3 != 0)
      {
        result = objc_msgSend(*(id *)(v28 + 8), "isEqual:", a2);
        if ((_DWORD)result)
        {
          v31 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8);
          v32 = *(_QWORD *)(v31 + 24) - 1;
LABEL_38:
          *(_QWORD *)(v31 + 24) = v32;
          goto LABEL_45;
        }
        v33 = *(_QWORD *)(*(_QWORD *)(v12 + 32) + 48);
        v31 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8);
        v34 = *(_QWORD *)(v31 + 24);
        v32 = v34 - 1;
        v35 = v34 >= 2 && *(_BYTE *)(v33 + 32 * (v34 - 1) + 24) == 0;
        if (v35 && vabdd_f64(*(double *)(v33 + 32 * v34 - 64), *(double *)(v33 + 32 * v32)) < 0.001)
          goto LABEL_38;
      }
    }
  }
LABEL_45:
  if (!a2 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(v12 + 32) + 24))
  {
LABEL_2:
    *a4 = 1;
    return result;
  }
  v36 = objc_msgSend(*(id *)(v12 + 40), "member:", a2);
  v37 = v36;
  if (!v36)
  {
    objc_msgSend(*(id *)(v12 + 40), "addObject:", a2);
    v37 = a2;
  }
  v38 = (v36 == 0) ^ a3;
  if (v19)
  {
    v39 = 0;
  }
  else
  {
    v40 = *(unsigned __int8 *)(v12 + 88);
    v41 = v40 == v38;
    v42 = v40 != v38;
    v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24);
    v44 = *(_QWORD *)(*(_QWORD *)(v12 + 32) + 48) + 32 * v43;
    v45 = *(_QWORD *)(v44 + 8);
    if (v41)
      v46 = v37;
    else
      v46 = *(_QWORD *)(v44 + 8);
    LOBYTE(v38) = v38 ^ v42;
    if (v41)
      v39 = v45;
    else
      v39 = v37;
    if ((a3 & 1) == 0)
    {
      v47 = *(_QWORD *)(*(_QWORD *)(v12 + 64) + 8);
      if (*(_QWORD *)(v47 + 24) == 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(v47 + 24) = v43;
    }
    v37 = v46;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 48)
            + 32 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)) = a5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 48)
            + 32 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)
            + 8) = v37;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 48)
            + 32 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)
            + 16) = v39;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 48)
           + 32 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)
           + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 48)
           + 32 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)
           + 25) = v38;
  if (!a3)
  {
    v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(v12 + 72) + 8) + 40);
    if (!v48)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 72) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(v12 + 72) + 8) + 40);
    }
    result = objc_msgSend(v48, "addObject:", v37);
    if (!v39)
      goto LABEL_70;
    goto LABEL_67;
  }
  result = objc_msgSend(*(id *)(v12 + 48), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)), v37);
  if (v39)
  {
LABEL_67:
    v49 = *(void **)(*(_QWORD *)(*(_QWORD *)(v12 + 80) + 8) + 40);
    if (!v49)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 80) + 8) + 40) = (id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v49 = *(void **)(*(_QWORD *)(*(_QWORD *)(v12 + 80) + 8) + 40);
    }
    result = objc_msgSend(v49, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24)), v39);
  }
LABEL_70:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 24);
  return result;
}

uint64_t __69____NSTextSelectionLineFragmentInfo__sortedLocationIndexForLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t i;

  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", a2, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_23);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_1();
  for (i = v4;
        i < objc_msgSend(*(id *)(a1 + 32), "count")
     && !objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i), "compare:", a2);
  if (i >= objc_msgSend(*(id *)(a1 + 32), "count"))
    __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_2();
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
}

uint64_t __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __86____NSTextSelectionLineFragmentInfo_rangesBetweenStartingOffset_endOffset_continuous___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v8;
  void *v9;
  NSTextRange *v10;

  if (!objc_msgSend(a2, "isEqual:") || a4)
  {
    v8 = objc_msgSend(a2, "compare:", a3);
    if (v8 == 1)
      v9 = a3;
    else
      v9 = a2;
    if (v8 == 1)
      a3 = a2;
    v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v9, a3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

  }
}

uint64_t __84____NSTextSelectionLineFragmentInfo_caretIndexForEdgeLocationInTextRanges_leftEdge___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v3 = *(_QWORD *)(v2 + 24);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL || *(_BYTE *)(result + 40) == v3 > a2)
      *(_QWORD *)(v2 + 24) = a2;
  }
  return result;
}

void __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_1()
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo _resolveTrailingEdges]_block_invoke", "NSTextSelectionNavigation.m", 349, "index != NSNotFound");
}

void __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_2()
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo _resolveTrailingEdges]_block_invoke", "NSTextSelectionNavigation.m", 354, "index < leadingEdges.count");
}

@end
