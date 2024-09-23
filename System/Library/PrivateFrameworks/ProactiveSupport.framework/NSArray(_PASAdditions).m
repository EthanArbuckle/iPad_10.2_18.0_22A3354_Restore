@implementation NSArray(_PASAdditions)

- (id)_pas_mappedArrayWithTransform:()_PASAdditions
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__NSArray__PASAdditions___pas_mappedArrayWithTransform___block_invoke;
  v10[3] = &unk_1E442F770;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a1, "_pas_mappedArrayWithIndexedTransform:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_pas_mappedArrayWithIndexedTransform:()_PASAdditions
{
  void (**v5)(id, uint64_t, uint64_t);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1A1AFDC98]();
        v5[2](v5, v13, v10 + i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v6, "addObject:", v15);

        objc_autoreleasePoolPop(v14);
      }
      v10 += i;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  return v16;
}

- (id)_pas_filteredArrayWithTest:()_PASAdditions
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSArray__PASAdditions___pas_filteredArrayWithTest___block_invoke;
  v10[3] = &unk_1E442F798;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a1, "_pas_filteredArrayWithIndexedTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_pas_filteredArrayWithIndexedTest:()_PASAdditions
{
  unsigned int (**v5)(id, uint64_t, uint64_t);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1A1AFDC98]();
        if (v5[2](v5, v13, v10 + i))
          objc_msgSend(v6, "addObject:", v13);
        objc_autoreleasePoolPop(v14);
      }
      v10 += i;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

+ (id)_pas_proxyArrayWithObject:()_PASAdditions repetitions:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
  {
    if (a4 == 1)
    {
      v15[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = MEMORY[0x1E0C809B0];
      v9 = (void *)MEMORY[0x1E0C99D20];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke;
      v12[3] = &unk_1E442F908;
      v14 = a4;
      v13 = v5;
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke_2;
      v11[3] = &__block_descriptor_40_e5_Q8__0l;
      v11[4] = a4;
      objc_msgSend(v9, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v12, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_pas_componentsJoinedByString:()_PASAdditions
{
  __CFString *v4;
  void *v5;
  uint8_t v7[16];

  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "_pas_componentsJoinedByString called with a nil separator. Will use @\"\" instead.", v7, 2u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    v4 = &stru_1E4431528;
  }
  _PASJoinStrings(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_pas_leftFoldWithInitialObject:()_PASAdditions indexedAccumulate:
{
  id v7;
  void (**v8)(id, void *, uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accumulate"));

  }
  v9 = v7;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = a1;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v21 = v9;
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      v16 = v9;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1A1AFDC98]();
        v8[2](v8, v16, v17, v13 + v15);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v18);
        ++v15;
        v16 = v9;
      }
      while (v12 != v15);
      v13 += v15;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)_pas_leftFoldWithInitialObject:()_PASAdditions accumulate:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accumulate"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__NSArray__PASAdditions___pas_leftFoldWithInitialObject_accumulate___block_invoke;
  v13[3] = &unk_1E442F7C0;
  v14 = v8;
  v9 = v8;
  objc_msgSend(a1, "_pas_leftFoldWithInitialObject:indexedAccumulate:", v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_pas_rightFoldWithInitialObject:()_PASAdditions indexedAccumulate:
{
  id v7;
  void (**v8)(id, void *, _QWORD, uint64_t);
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accumulate"));

  }
  v9 = v7;
  v10 = objc_msgSend(a1, "count");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "reverseObjectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v13 = v9;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v21;
    v13 = v9;
    do
    {
      v16 = 0;
      v17 = v13;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v8[2](v8, v17, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), --v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        ++v16;
        v17 = v13;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v13;
}

- (id)_pas_rightFoldWithInitialObject:()_PASAdditions accumulate:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accumulate"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__NSArray__PASAdditions___pas_rightFoldWithInitialObject_accumulate___block_invoke;
  v13[3] = &unk_1E442F7C0;
  v14 = v8;
  v9 = v8;
  objc_msgSend(a1, "_pas_rightFoldWithInitialObject:indexedAccumulate:", v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_pas_shuffledArrayUsingRng:()_PASAdditions
{
  id *v3;
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if ((unint64_t)objc_msgSend(a1, "count") > 1)
  {
    if (v5)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __53__NSArray__PASAdditions___pas_shuffledArrayUsingRng___block_invoke;
      v13[3] = &unk_1E442F7E8;
      v7 = v13;
      v3 = &v14;
      v14 = v5;
    }
    else
    {
      v7 = &__block_literal_global_494;
    }
    v8 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A1AFDE78](v7);
    v9 = (void *)objc_msgSend(a1, "mutableCopy");
    v10 = objc_msgSend(v9, "count");
    v11 = v10 - 1;
    if (v10 != 1)
    {
      do
      {
        objc_msgSend(v9, "exchangeObjectAtIndex:withObjectAtIndex:", v11, v8[2](v8, v11 + 1));
        --v11;
      }
      while (v11);
    }
    v6 = (void *)objc_msgSend(v9, "copy");

    if (v5)
  }
  else
  {
    v6 = (void *)objc_msgSend(a1, "copy");
  }

  return v6;
}

- (void)_pas_enumerateChunksOfSize:()_PASAdditions usingBlock:
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  NSRange v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  char v17;
  NSRange v18;
  NSRange v19;

  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (a3)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 177, CFSTR("Chunk size must be nonzero"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  if (objc_msgSend(a1, "count"))
  {
    if (objc_msgSend(a1, "count") <= a3)
    {
      v17 = 0;
      ((void (**)(_QWORD, void *, char *))v8)[2](v8, a1, &v17);
    }
    else
    {
      v9 = objc_msgSend(a1, "count");
      v16 = 0;
      if (objc_msgSend(a1, "count"))
      {
        v10 = 0;
        do
        {
          v11 = (void *)MEMORY[0x1A1AFDC98]();
          v18.location = v10;
          v18.length = a3;
          v19.location = 0;
          v19.length = v9;
          v12 = NSIntersectionRange(v18, v19);
          objc_msgSend(a1, "subarrayWithRange:", v12.location, v12.length);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, unsigned __int8 *))v8)[2](v8, v13, &v16);

          LODWORD(v13) = v16;
          objc_autoreleasePoolPop(v11);
          if ((_DWORD)v13)
            break;
          v10 += a3;
        }
        while (v10 < objc_msgSend(a1, "count"));
      }
    }
  }

}

- (__CFString)_pas_proxyComponentsJoinedByString:()_PASAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, unint64_t);
  void *v23;
  id v24;
  id v25;
  uint64_t v26;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(a1, "copy");
    v8 = (void *)objc_msgSend(v4, "copy");
    v9 = (void *)MEMORY[0x1E0C99D20];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke;
    v23 = &unk_1E442F850;
    v25 = v8;
    v26 = 2 * v6 - 1;
    v24 = v7;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke_2;
    v18 = &__block_descriptor_40_e5_Q8__0l;
    v19 = v26;
    v10 = v8;
    v11 = v7;
    objc_msgSend(v9, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", &v20, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "_pas_proxyStringByConcatenatingStrings:", v12, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_1E4431528;
  }

  return v13;
}

- (id)_pas_ensureImmutable
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (id)objc_msgSend(a1, "copy");
  else
    v2 = a1;
  return v2;
}

- (id)_pas_proxySubarrayWithRange:()_PASAdditions
{
  void *v8;
  NSUInteger v9;
  NSRange v10;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[4];
  id v21;
  NSUInteger v22;
  NSUInteger v23;
  NSRange v24;
  NSRange v25;
  NSRange v26;
  NSRange v27;

  objc_msgSend(a1, "_pas_ensureImmutable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v24.location = 0;
  v24.length = v9;
  v27.location = a3;
  v27.length = a4;
  v10 = NSIntersectionRange(v24, v27);
  if (a3 == v10.location && a4 == v10.length)
  {
    if (!a4)
    {
LABEL_12:
      v12 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25.location = a3;
    v25.length = a4;
    NSStringFromRange(v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26.location = 0;
    v26.length = v9;
    NSStringFromRange(v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 272, CFSTR("Range %@ out of array bounds %@"), v16, v17);

    if (!a4)
      goto LABEL_12;
  }
  if (a3 || v9 != a4)
  {
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke;
    v20[3] = &unk_1E442F898;
    v22 = a3;
    v23 = a4;
    v21 = v8;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke_2;
    v19[3] = &__block_descriptor_48_e5_Q8__0l;
    v19[4] = a3;
    v19[5] = a4;
    objc_msgSend(v13, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v20, v19);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v8;
  }
LABEL_13:

  return v12;
}

- (id)_pas_proxyArrayWithObjectsAtIndexes:()_PASAdditions
{
  id v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  id v26;
  size_t v27;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(a1, "_pas_ensureImmutable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = objc_msgSend(v5, "firstIndex");
    v11 = objc_msgSend(v5, "lastIndex");
    if (v11 >= v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("index %tu from indexSet out of range for array with count %tu"), v11, v9);
    if (v7 == v11 - v10 + 1)
    {
      objc_msgSend(a1, "_pas_proxySubarrayWithRange:", v10, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = malloc_type_calloc(v7, 8uLL, 0x100004000313F17uLL);
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v22);
      }
      v14 = v13;
      v15 = objc_msgSend(v5, "getIndexes:maxCount:inIndexRange:", v13, v7, 0);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v14, 8 * v7, 1);
      if (v15 != v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+_PASAdditions.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexesGotten == indexSetCount"));

      }
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke;
      v24[3] = &unk_1E442F850;
      v27 = v7;
      v25 = v16;
      v26 = v8;
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke_2;
      v23[3] = &__block_descriptor_40_e5_Q8__0l;
      v23[4] = v7;
      v19 = v16;
      objc_msgSend(v17, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v24, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)_pas_proxyArrayWithMapping:()_PASAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(a1, "_pas_ensureImmutable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v7 = MEMORY[0x1E0C809B0];
    v8 = (void *)MEMORY[0x1E0C99D20];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke;
    v14[3] = &unk_1E442F8E0;
    v16 = v6;
    v15 = v5;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke_2;
    v12[3] = &unk_1E442FCD8;
    v13 = v15;
    v9 = v6;
    objc_msgSend(v8, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v14, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)_pas_proxyArrayByAppendingArray:()_PASAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  if (a1 != v4)
  {
    objc_msgSend(a1, "_pas_ensureImmutable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    objc_msgSend(v4, "_pas_ensureImmutable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v9 = objc_msgSend(v7, "count");
      if (v9)
      {
        v10 = v9;
        v11 = MEMORY[0x1E0C809B0];
        v12 = (void *)MEMORY[0x1E0C99D20];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke;
        v17[3] = &unk_1E442F850;
        v20 = v6;
        v18 = v5;
        v19 = v8;
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke_2;
        v16[3] = &__block_descriptor_48_e5_Q8__0l;
        v16[4] = v6;
        v16[5] = v10;
        objc_msgSend(v12, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v17, v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_10;
      }
      v14 = v5;
    }
    else
    {
      v14 = v7;
    }
    v13 = v14;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_pas_proxyArrayWithRepetitions:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v13;
}

- (id)_pas_proxyArrayWithRepetitions:()_PASAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[6];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    if (a3 == 1)
    {
      v4 = a1;
    }
    else
    {
      objc_msgSend(a1, "_pas_ensureImmutable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = MEMORY[0x1E0C809B0];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke;
        v12[3] = &unk_1E442F898;
        v14 = v6;
        v15 = a3;
        v13 = v5;
        v11[0] = v9;
        v11[1] = 3221225472;
        v11[2] = __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke_2;
        v11[3] = &__block_descriptor_48_e5_Q8__0l;
        v11[4] = v7;
        v11[5] = a3;
        objc_msgSend(v8, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v12, v11);
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = (id)MEMORY[0x1E0C9AA60];
      }

    }
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (id)_pas_proxyArrayDistillingStrings
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__NSArray__PASAdditions___pas_proxyArrayDistillingStrings__block_invoke;
  v3[3] = &unk_1E442F930;
  v3[4] = a1;
  v3[5] = a2;
  objc_msgSend(a1, "_pas_proxyArrayWithMapping:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pas_proxyArrayRevivingStrings
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NSArray__PASAdditions___pas_proxyArrayRevivingStrings__block_invoke;
  v3[3] = &unk_1E442F958;
  v3[4] = a1;
  v3[5] = a2;
  objc_msgSend(a1, "_pas_proxyArrayWithMapping:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pas_proxyArrayReversed
{
  void *v1;
  unint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  unint64_t v9;

  objc_msgSend(a1, "_pas_ensureImmutable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  if (v2 >= 2)
  {
    v3 = (void *)MEMORY[0x1E0C99D20];
    v6[4] = v2;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke;
    v7[3] = &unk_1E442F908;
    v8 = v1;
    v9 = v2;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke_2;
    v6[3] = &__block_descriptor_40_e5_Q8__0l;
    v4 = v1;
    objc_msgSend(v3, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v7, v6);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_pas_unlazyArray
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_pas_overrideUnlazyArray");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  return v2;
}

+ (_QWORD)_pas_proxyArrayUsingObjectAtIndexBlock:()_PASAdditions andCountBlock:
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = (_QWORD *)objc_opt_new();
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[1];
  v7[1] = v8;

  v10 = objc_msgSend(v5, "copy");
  v11 = (void *)v7[2];
  v7[2] = v10;

  return v7;
}

+ (id)_pas_arrayNoCopyLeavesWithPropertyListData:()_PASAdditions error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;

  v5 = a3;
  +[_PASLazyPlist arrayWithData:error:](_PASLazyPlistWithBPlistSupport, "arrayWithData:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_unlazyArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = v9;
      if (a4)
        *a4 = 0;
    }
    v8 = v11;

  }
  return v8;
}

@end
