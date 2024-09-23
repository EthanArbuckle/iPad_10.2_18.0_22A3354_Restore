@implementation _UIIdentifierDiffer

- (_QWORD)movePairs
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[5];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)insertedIndexes
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[3];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)deletedIndexes
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[4];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)initWithBeforeIdentifiers:(void *)a3 afterIdentifiers:
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (a1)
    a1 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:collectionDifference:](a1, v5, v6, 0);

  return a1;
}

- (id)initWithBeforeIdentifiers:(void *)a3 afterIdentifiers:(void *)a4 collectionDifference:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_UIIdentifierDiffer;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 6, a4);
      if (v10)
        -[_UIIdentifierDiffer _performDiffWithOptions:]((uint64_t)a1, 4);
    }
  }

  return a1;
}

- (void)_performFoundationDiffWithOptions:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _UIIdentifierDifferMovePair *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _UIIdentifierDifferMovePair *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a1 && (objc_msgSend(*(id *)(a1 + 8), "count") || objc_msgSend(*(id *)(a1 + 16), "count")))
  {
    v4 = a2 & 2;
    v32 = (_QWORD *)a1;
    objc_msgSend(*(id *)(a1 + 16), "differenceFromOrderedSet:withOptions:", *(_QWORD *)(a1 + 8), (2 * v4) ^ 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v37 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v34 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v35 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v33, "insertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v44;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v44 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "index");
          if (v4 || (v11 = objc_msgSend(v9, "associatedIndex"), v11 == 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v38, "addIndex:", v10);
          }
          else
          {
            v12 = [_UIIdentifierDifferMovePair alloc];
            if (v12)
            {
              v47.receiver = v12;
              v47.super_class = (Class)_UIIdentifierDifferMovePair;
              v13 = objc_msgSendSuper2(&v47, sel_init);
              v14 = v13;
              if (v13)
              {
                *((_QWORD *)v13 + 1) = v11;
                *((_QWORD *)v13 + 2) = v10;
              }
            }
            else
            {
              v14 = 0;
            }
            objc_msgSend(v36, "addObject:", v14);
            objc_msgSend(v34, "addIndex:", v11);
            objc_msgSend(v35, "addIndex:", v10);

          }
          ++v8;
        }
        while (v6 != v8);
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        v6 = v15;
      }
      while (v15);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v33, "removals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v40;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v19);
          v21 = objc_msgSend(v20, "index");
          if (v4 || (v22 = objc_msgSend(v20, "associatedIndex"), v22 == 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v37, "addIndex:", v21);
          }
          else
          {
            v23 = [_UIIdentifierDifferMovePair alloc];
            if (v23)
            {
              v47.receiver = v23;
              v47.super_class = (Class)_UIIdentifierDifferMovePair;
              v24 = objc_msgSendSuper2(&v47, sel_init);
              v25 = v24;
              if (v24)
              {
                *((_QWORD *)v24 + 1) = v21;
                *((_QWORD *)v24 + 2) = v22;
              }
            }
            else
            {
              v25 = 0;
            }
            objc_msgSend(v36, "addObject:", v25);
            objc_msgSend(v34, "addIndex:", v21);
            objc_msgSend(v35, "addIndex:", v22);

          }
          ++v19;
        }
        while (v17 != v19);
        v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        v17 = v26;
      }
      while (v26);
    }

    v27 = (void *)v32[3];
    v32[3] = v38;
    v28 = v38;

    v29 = (void *)v32[4];
    v32[4] = v37;
    v30 = v37;

    v31 = (void *)v32[5];
    v32[5] = v36;

  }
}

- (void)_performDiffWithOptions:(uint64_t)a1
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 48))
      -[_UIIdentifierDiffer _prepareDiffResultsFromCollectionDifference:]((_QWORD *)a1, *(void **)(a1 + 48));
    else
      -[_UIIdentifierDiffer _performFoundationDiffWithOptions:](a1, a2);
  }
}

- (BOOL)hasChanges
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return objc_msgSend(*(id *)(result + 24), "count")
        || objc_msgSend(*(id *)(v1 + 32), "count")
        || objc_msgSend(*(id *)(v1 + 40), "count") != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionDifference, 0);
  objc_storeStrong((id *)&self->_movePairs, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_afterIdentifiers, 0);
  objc_storeStrong((id *)&self->_beforeIdentifiers, 0);
}

- (id)collectionDifference
{
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v1 = a1;
  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1[6];
    if (v2)
    {
      v1 = (id *)v2;
    }
    else
    {
      v3 = objc_msgSend(a1[3], "count");
      v4 = objc_msgSend(v1[4], "count") + v3;
      v5 = v4 + 2 * objc_msgSend(v1[5], "count");
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      v7 = MEMORY[0x1E0C809B0];
      v8 = v1[3];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __43___UIIdentifierDiffer_collectionDifference__block_invoke;
      v30[3] = &unk_1E16BC2D8;
      v30[4] = v1;
      v9 = v6;
      v31 = v9;
      objc_msgSend(v8, "enumerateIndexesUsingBlock:", v30, v9);
      v10 = v1[4];
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __43___UIIdentifierDiffer_collectionDifference__block_invoke_2;
      v28[3] = &unk_1E16BC2D8;
      v28[4] = v1;
      v11 = v9;
      v29 = v11;
      objc_msgSend(v10, "enumerateIndexesUsingBlock:", v28);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = v1[5];
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v25;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
            if (v15)
            {
              v16 = *(_QWORD *)(v15 + 8);
              v17 = *(_QWORD *)(v15 + 16);
            }
            else
            {
              v16 = 0;
              v17 = 0;
            }
            objc_msgSend(v1[1], "objectAtIndexedSubscript:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:associatedIndex:", v18, 1, v16, v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:associatedIndex:", v18, 0, v17, v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);
            objc_msgSend(v11, "addObject:", v20);

            ++v14;
          }
          while (v12 != v14);
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          v12 = v21;
        }
        while (v21);
      }

      v1 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v11);
    }
  }
  return v1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  -[NSSet allObjects](self->_movePairs, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; beforeCount = %lu; afterCount = %lu; inserted: %@; deleted: %@; moved: %@"),
    v7,
    self,
    -[NSOrderedSet count](self->_beforeIdentifiers, "count"),
    -[NSOrderedSet count](self->_afterIdentifiers, "count"),
    self->_insertedIndexes,
    self->_deletedIndexes,
    v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_prepareDiffResultsFromCollectionDifference:(_QWORD *)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _UIIdentifierDifferMovePair *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  if (a1)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v27 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v25, "removals");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v34;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v34 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v5);
          v7 = objc_msgSend(v6, "index");
          v8 = objc_msgSend(v6, "associatedIndex");
          if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v27, "addIndex:", v7);
          }
          else
          {
            v9 = [_UIIdentifierDifferMovePair alloc];
            if (v9)
            {
              v37.receiver = v9;
              v37.super_class = (Class)_UIIdentifierDifferMovePair;
              v10 = objc_msgSendSuper2(&v37, sel_init);
              v11 = v10;
              if (v10)
              {
                *((_QWORD *)v10 + 1) = v7;
                *((_QWORD *)v10 + 2) = v8;
              }
            }
            else
            {
              v11 = 0;
            }
            objc_msgSend(v28, "addObject:", v11);

          }
          ++v5;
        }
        while (v3 != v5);
        v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v3 = v12;
      }
      while (v12);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v25, "insertions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "index");
          if (objc_msgSend(v17, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v26, "addIndex:", v18);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v14);
    }

    v19 = (void *)a1[3];
    a1[3] = v26;
    v20 = v26;

    v21 = (void *)a1[4];
    a1[4] = v27;
    v22 = v27;

    v23 = (void *)a1[5];
    a1[5] = v28;

  }
}

@end
