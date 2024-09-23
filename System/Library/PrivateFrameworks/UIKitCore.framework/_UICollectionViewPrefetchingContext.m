@implementation _UICollectionViewPrefetchingContext

- (id)peekNextItem
{
  if (a1)
  {
    objc_msgSend(a1[2], "firstObject");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)initWithPrefetchItems:(double)a3 prefetchRect:(double)a4
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _WORD *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  if (a1)
  {
    v34.receiver = a1;
    v34.super_class = (Class)_UICollectionViewPrefetchingContext;
    a1 = (id *)objc_msgSendSuper2(&v34, sel_init);
    if (a1)
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
      if (v11)
        v12 = v11;
      v13 = v12;

      v14 = objc_msgSend(v13, "mutableCopy");
      v15 = a1[2];
      a1[2] = (id)v14;

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
      v17 = a1[3];
      a1[3] = (id)v16;

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v11 = v13;
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v11);
            v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21);
            if (v22)
              v23 = *(void **)(v22 + 16);
            else
              v23 = 0;
            v24 = v23;
            objc_msgSend(v24, "indexPath");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (!v24 || (v24[144] & 1) == 0 || (unint64_t)objc_msgSend(v25, "length") <= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithPrefetchItems_prefetchRect_, a1, CFSTR("_UICollectionViewPrefetchingContext.m"), 32, CFSTR("UICollectionView internal bug: Attempting to create prefetching context using invalid attributes. Attributes: %@"), v24);

            }
            objc_msgSend(a1[3], "setObject:forKeyedSubscript:", v22, v26);

            ++v21;
          }
          while (v19 != v21);
          v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          v19 = v28;
        }
        while (v28);
      }

      *((double *)a1 + 4) = a3;
      *((double *)a1 + 5) = a4;
      *((double *)a1 + 6) = a5;
      *((double *)a1 + 7) = a6;
    }
  }

  return a1;
}

- (id)popNextItem
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;

  if (a1 && objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    objc_msgSend(*(id *)(a1 + 16), "firstObject");
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v3 = (_QWORD *)v3[2];
    objc_msgSend(v3, "indexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v5);
    objc_msgSend(*(id *)(a1 + 16), "removeObjectAtIndex:", 0);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)remainingIndexPaths
{
  id *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return a1;
  v1 = a1;
  v2 = objc_msgSend(a1[2], "count");
  if (!v2)
  {
    a1 = (id *)MEMORY[0x1E0C9AA60];
    return a1;
  }
  v3 = v1[1];
  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v1[2];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          if (v10)
            v10 = (_QWORD *)v10[2];
          v11 = v10;
          objc_msgSend(v11, "indexPath", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = v1[1];
    v1[1] = v4;

    v3 = v1[1];
  }
  return (id *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsDict, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_remainingIndexPaths, 0);
}

@end
