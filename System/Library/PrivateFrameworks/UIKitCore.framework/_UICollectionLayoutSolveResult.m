@implementation _UICollectionLayoutSolveResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedAuxillaryIndexesDict, 0);
  objc_storeStrong((id *)&self->_invalidatedIndexes, 0);
}

- (_UICollectionLayoutSolveResult)init
{
  _UICollectionLayoutSolveResult *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *invalidatedIndexes;
  NSMutableDictionary *v5;
  NSMutableDictionary *invalidatedAuxillaryIndexesDict;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionLayoutSolveResult;
  v2 = -[_UICollectionLayoutSolveResult init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    invalidatedIndexes = v2->_invalidatedIndexes;
    v2->_invalidatedIndexes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    invalidatedAuxillaryIndexesDict = v2->_invalidatedAuxillaryIndexesDict;
    v2->_invalidatedAuxillaryIndexesDict = v5;

  }
  return v2;
}

- (id)invalidatedAuxillaryKinds
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 16), "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)addInvalidatedSupplementariesWithOffsets:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a2, "elementKinds", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(a2, "indexesForElementKind:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UICollectionLayoutSolveResult addInvalidatedAuxillaryOfKind:indexes:](a1, v9, (uint64_t)v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)addInvalidatedAuxillaryOfKind:(uint64_t)a3 indexes:
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_addInvalidatedAuxillaryOfKind_indexes_, a1, CFSTR("_UICollectionLayoutHelpers.m"), 1431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

    }
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v8, a2);
      v6 = v8;
    }
    v9 = v6;
    objc_msgSend(v6, "addIndexes:", a3);

  }
}

- (id)indexesForInvalidatedAuxillariesOfKind:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id *v6;
  void *v8;

  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexesForInvalidatedAuxillariesOfKind_, v2, CFSTR("_UICollectionLayoutHelpers.m"), 1457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

    }
    objc_msgSend(v2[2], "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v6 = (id *)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  return v2;
}

@end
