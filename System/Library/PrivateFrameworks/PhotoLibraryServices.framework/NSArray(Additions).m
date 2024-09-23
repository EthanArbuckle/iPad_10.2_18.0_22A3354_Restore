@implementation NSArray(Additions)

- (id)pl_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v11);

  objc_autoreleasePoolPop(v3);
  objc_msgSend(v2, "appendString:", CFSTR("}"));
  return v2;
}

- (uint64_t)pl_countOfObjectsPassingTest:()Additions
{
  unsigned int (**v4)(id, _QWORD, char *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v6);
      v9 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), &v17);
      if (v17)
        break;
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (id)pl_arrayOfUniqueObjectsNotInOrderedSet:()Additions
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const void *v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = v13;
    goto LABEL_33;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "count");
  if (!v7)
  {
    v13 = a1;
    goto LABEL_10;
  }
  v8 = v7;
  v30 = &v28;
  if (v7 >= 0x201)
    v9 = 1;
  else
    v9 = v7;
  v10 = 8 * v9;
  MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v28 - v11;
  bzero((char *)&v28 - v11, v10);
  if (v8 > 0x200)
    v12 = (char *)NSAllocateScannedUncollectable();
  else
    bzero(v12, v10);
  objc_msgSend(v4, "getObjects:range:", v12, 0, v8);
  qsort_b(v12, v8, 8uLL, &__block_literal_global_46340);
  if (v6 >= 0x201)
    v16 = 1;
  else
    v16 = v6;
  v17 = 8 * v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v28 - v18;
  bzero((char *)&v28 - v18, v17);
  if (v6 > 0x200)
    v19 = (char *)NSAllocateScannedUncollectable();
  else
    bzero(v19, v17);
  v29 = v6;
  v31 = v4;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v32 = 0u;
  v20 = a1;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v20);
        v26 = *(const void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (!bsearch_b(v26, v12, v8, 8uLL, &__block_literal_global_46340))
          *(_QWORD *)&v19[8 * v23++] = v26;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v31;
  if (v8 >= 0x201)
    NSZoneFree(0, v12);
  if (v29 >= 0x201)
    NSZoneFree(0, v19);
LABEL_33:

  return v14;
}

- (uint64_t)pl_indexOfFirstObjectPassingTest:()Additions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "pl_indexOfFirstObjectInRange:passingTest:", 0, objc_msgSend(a1, "count"), v4);

  return v5;
}

- (uint64_t)pl_indexOfFirstObjectInRange:()Additions passingTest:
{
  id v8;
  void *v9;
  unsigned int (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  unint64_t v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a5;
  v9 = v8;
  if (a4)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__NSArray_Additions__pl_indexOfFirstObjectInRange_passingTest___block_invoke;
    v14[3] = &unk_1E366ABC0;
    v14[4] = a1;
    v15 = v8;
    v16 = &v17;
    v10 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v14);
    if ((((uint64_t (*)(_QWORD, unint64_t))v10[2])(v10, a3) & 1) != 0)
    {
      v11 = a3;
    }
    else if (*((_BYTE *)v18 + 24)
           || (v12 = a4 + a3 - 1, (((uint64_t (*)(_QWORD, unint64_t))v10[2])(v10, v12) & 1) == 0)
           || *((_BYTE *)v18 + 24))
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      while (a3 + 1 < v12)
      {
        if (v10[2](v10, (v12 + a3) >> 1))
          v12 = (v12 + a3) >> 1;
        else
          a3 = (v12 + a3) >> 1;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
        if (*((_BYTE *)v18 + 24))
          goto LABEL_9;
      }
      v11 = v12;
    }
LABEL_9:

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (uint64_t)pl_indexOfLastObjectPassingTest:()Additions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "pl_indexOfLastObjectInRange:passingTest:", 0, objc_msgSend(a1, "count"), v4);

  return v5;
}

- (uint64_t)pl_indexOfLastObjectInRange:()Additions passingTest:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = v8;
  if (a4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__NSArray_Additions__pl_indexOfLastObjectInRange_passingTest___block_invoke;
    v14[3] = &unk_1E3670120;
    v15 = v8;
    v10 = objc_msgSend(a1, "pl_indexOfFirstObjectInRange:passingTest:", a3, a4, v14);
    v11 = v10 - 1;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = a4 + a3 - 1;
    if (v10 == a3)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;

  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

@end
