@implementation NSSet(_PASAdditions)

- (id)_pas_mappedSetWithTransform:()_PASAdditions
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSSet+_PASAdditions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1A1AFDC98]();
        v5[2](v5, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (id)_pas_filteredSetWithTest:()_PASAdditions
{
  unsigned int (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSSet+_PASAdditions.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1A1AFDC98]();
        if (v5[2](v5, v12))
          objc_msgSend(v6, "addObject:", v12);
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

- (id)_pas_setByRemovingObject:()_PASAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && (objc_msgSend(a1, "containsObject:", v4) & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", a1);
    objc_msgSend(v5, "removeObject:", v4);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = (void *)objc_msgSend(a1, "copy");
  }

  return v6;
}

- (id)_pas_setByRemovingObjectsFromSet:()_PASAdditions
{
  id v4;
  size_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *memptr;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
LABEL_20:
    v13 = objc_msgSend(a1, "copy");
    goto LABEL_21;
  }
  if (a1 == v4)
  {
    v13 = objc_opt_new();
LABEL_21:
    v14 = (void *)v13;
    goto LABEL_22;
  }
  v5 = (8 * objc_msgSend(a1, "count")) | 7;
  memptr = 0;
  v23 = 0;
  if (v5 > 0x400)
  {
    v16 = malloc_type_posix_memalign(&memptr, 8uLL, 8 * objc_msgSend(a1, "count"), 0x80040B8603338uLL);
    LOBYTE(v23) = 0;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v6 = (char *)memptr;
  }
  else
  {
    v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v6, v5);
  }
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  a1 = a1;
  v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(a1);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
          *(_QWORD *)&v6[8 * v9++] = v12;
      }
      v8 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v9 == objc_msgSend(a1, "count"))
  {
    if (v5 >= 0x401)
      free(v6);
    goto LABEL_20;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v6, v9);
  if (v5 >= 0x401)
    free(v6);
LABEL_22:

  return v14;
}

@end
