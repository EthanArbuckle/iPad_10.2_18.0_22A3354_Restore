@implementation _UICollectionViewSelectionController

- (_UICollectionViewSelectionController)init
{
  _UICollectionViewSelectionController *v2;
  NSMutableSet *v3;
  NSMutableSet *selectedIndexPaths;
  NSMutableSet *v5;
  NSMutableSet *highlightedIndexPaths;
  NSMutableSet *v7;
  NSMutableSet *nonvisibleTrackedSelectedIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewSelectionController;
  v2 = -[_UICollectionViewSelectionController init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    selectedIndexPaths = v2->_selectedIndexPaths;
    v2->_selectedIndexPaths = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    highlightedIndexPaths = v2->_highlightedIndexPaths;
    v2->_highlightedIndexPaths = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    nonvisibleTrackedSelectedIdentifiers = v2->_nonvisibleTrackedSelectedIdentifiers;
    v2->_nonvisibleTrackedSelectedIdentifiers = v7;

  }
  return v2;
}

- (id)_updateCollapsedSelectedIndexPaths:(void *)a3 withTransaction:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = a2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(a3, "finalIndexPathForInitialIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(a3, "initialSnapshot");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifierForIndexPath:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && objc_msgSend(a3, "_containsItemIdentifier:", v14))
            objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v8);
  }
  v35 = v5;

  objc_msgSend(a3, "finalSnapshot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = *(id *)(a1 + 32);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        if (objc_msgSend(v15, "indexOfItemIdentifier:", v23, v35) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v17, "addObject:", v23);
LABEL_23:
          objc_msgSend(v16, "addObject:", v23);
          continue;
        }
        if ((objc_msgSend(a3, "_containsItemIdentifier:", v23) & 1) == 0)
          goto LABEL_23;
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v20);
  }

  objc_msgSend(*(id *)(a1 + 32), "minusSet:", v16);
  v24 = *(void **)(a1 + 32);
  objc_msgSend(v35, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v27 = v17;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(v15, "indexPathForIdentifier:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k), v35);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v26, "addObject:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v29);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (uint64_t)rebaseItemsWithDiffableTransaction:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  if (result)
  {
    v3 = result;
    if ((objc_msgSend(a2, "isReorderingTransaction") & 1) != 0)
    {
      return 0;
    }
    else
    {
      -[_UICollectionViewSelectionController _updateCollapsedSelectedIndexPaths:withTransaction:](v3, *(void **)(v3 + 8), a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](v3, *(void **)(v3 + 8), a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "mutableCopy");
      v7 = *(void **)(v3 + 8);
      *(_QWORD *)(v3 + 8) = v6;

      v8 = *(void **)(v3 + 8);
      objc_msgSend(v4, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v9);

      -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](v3, *(void **)(v3 + 16), a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");
      v12 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = v11;

      v13 = *(void **)(v3 + 24);
      if (v13)
      {
        -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](v3, v13, a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "mutableCopy");
        v16 = *(void **)(v3 + 24);
        *(_QWORD *)(v3 + 24) = v15;

      }
      return 1;
    }
  }
  return result;
}

- (id)_rebaseIndexPaths:(void *)a3 withTransaction:
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a3, "initialSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a2, "count");
  v7 = (id)MEMORY[0x1E0C9AA60];
  if (v5 && v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = a2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v5, "identifierForIndexPath:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(a3, "finalSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v14, "indexPathForIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (void)rebaseItemsWithTranslator:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a1)
  {
    -[_UICollectionViewSelectionController _rebaseIndexPaths:withTranslator:](a1, *(void **)(a1 + 8), a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v5;

    -[_UICollectionViewSelectionController _rebaseIndexPaths:withTranslator:](a1, *(void **)(a1 + 16), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    v9 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v8;

    v10 = *(void **)(a1 + 24);
    if (v10)
    {
      -[_UICollectionViewSelectionController _rebaseIndexPaths:withTranslator:](a1, v10, a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "mutableCopy");
      v12 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v11;

    }
  }
}

- (id)_rebaseIndexPaths:(void *)a3 withTranslator:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a3, "finalIndexPathForInitialIndexPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonvisibleTrackedSelectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_deselectionTransitionIndexPaths, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPaths, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
}

- (uint64_t)setAllowsMultipleSelection:(uint64_t)result
{
  char v2;
  uint64_t v3;
  int v4;

  if (result)
  {
    v2 = a2;
    v3 = result;
    v4 = *(unsigned __int8 *)(result + 40);
    if (v4 != a2)
    {
      result = objc_msgSend(*(id *)(result + 8), "count");
      *(_BYTE *)(v3 + 40) = v2;
      if (v4)
      {
        if ((v2 & 1) == 0)
        {
          if (result)
            return objc_msgSend(*(id *)(v3 + 32), "removeAllObjects");
        }
      }
    }
  }
  return result;
}

- (void)addDeselectionTransitionIndexPaths:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v3 = *(void **)(a1 + 24);
    if (v3)
    {
      objc_msgSend(v3, "addObjectsFromArray:", a2);
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a2);
      v5 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v4;

    }
  }
}

- (id)rebaseIndexPath:(void *)a3 withDiffableTransaction:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = a2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](a1, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reset
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 16), "removeAllObjects");
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

@end
