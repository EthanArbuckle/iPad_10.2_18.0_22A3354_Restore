@implementation _UICollectionPreferredSizes

- (id)objectAtIndexedSubscript:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32) + a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryBaseOffsets, 0);
  objc_storeStrong((id *)&self->_supplementarySizesDict, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
}

- (id)objectForKeyedSubscript:(uint64_t)a1
{
  void *v4;
  void *v6;

  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_objectForKeyedSubscript_, a1, CFSTR("_UICollectionPreferredSizes.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], 0, 0, 0, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v4, a2);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)initWithSizes:(void *)a3 indexes:(void *)a4 supplementarySizesDict:(uint64_t)a5 frameOffset:(void *)a6 supplementaryBaseOffsets:
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  if (!a1)
    return 0;
  v19.receiver = a1;
  v19.super_class = (Class)_UICollectionPreferredSizes;
  v11 = objc_msgSendSuper2(&v19, sel_init);
  if (v11)
  {
    if (a2)
      v12 = (id)objc_msgSend(a2, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    if (a3)
      v14 = (id)objc_msgSend(a3, "mutableCopy");
    else
      v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v15 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v14;

    if (a4)
      v16 = (id)objc_msgSend(a4, "mutableCopy");
    else
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = (void *)*((_QWORD *)v11 + 3);
    *((_QWORD *)v11 + 3) = v16;

    *((_QWORD *)v11 + 4) = a5;
    objc_storeStrong((id *)v11 + 5, a6);
  }
  return v11;
}

- (__n128)setObject:(uint64_t)a3 atIndexedSubscript:
{
  uint64_t v5;
  void *v6;
  void *v7;
  __n128 result;

  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 32) + a3;
    v6 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", a2, v7);

      objc_msgSend(*(id *)(a1 + 16), "addIndex:", v5);
    }
    else
    {
      objc_msgSend(v6, "removeObjectForKey:", v7);

      objc_msgSend(*(id *)(a1 + 16), "removeIndex:", v5);
    }
    result = *(__n128 *)MEMORY[0x1E0C9D820];
    *(_OWORD *)(a1 + 48) = *MEMORY[0x1E0C9D820];
  }
  return result;
}

- (_UICollectionPreferredSizes)init
{
  return (_UICollectionPreferredSizes *)-[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:](self, 0, 0, 0, 0, 0);
}

- (id)indexes
{
  id v2;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", *(_QWORD *)(a1 + 16));
      objc_msgSend(v2, "shiftIndexesStartingAtIndex:by:", 0, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v2 = *(id *)(a1 + 16);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)preferredSizesApplyingFrameOffset:(void *)a3 supplementaryBaseOffsets:
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a1;
  if (a1)
  {
    v5 = a1[4];
    v4 = (void *)a1[5];
    v6 = v5 + a2;
    if (v4)
    {
      objc_msgSend(v4, "offsetsByApplyingOffsets:");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = a3;
    }
    v8 = v7;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)*((_QWORD *)v3 + 3);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90___UICollectionPreferredSizes_preferredSizesApplyingFrameOffset_supplementaryBaseOffsets___block_invoke;
    v14[3] = &unk_1E16B8338;
    v15 = v8;
    v16 = v9;
    v11 = v9;
    v12 = v8;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
    v3 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], *((void **)v3 + 1), *((void **)v3 + 2), v11, v6, v12);

  }
  return v3;
}

- (id)elementKinds
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 24), "allKeys");
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

- (id)indexesOfItemsWithoutPreferredSizesInRange:(uint64_t)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  if (a1)
  {
    v3 = a3;
    if (a3)
    {
      -[_UICollectionPreferredSizes indexes](a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      if (a2 < a2 + v3)
      {
        do
        {
          if ((objc_msgSend(v5, "containsIndex:", a2) & 1) == 0)
            objc_msgSend(v6, "addIndex:", a2);
          ++a2;
          --v3;
        }
        while (v3);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)copyByDirtyingPreferredSizes
{
  id *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  if (result)
  {
    v1 = result;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(result[1], "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v4 = v1[1];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke;
    v12[3] = &unk_1E16B8360;
    v13 = v2;
    v5 = v2;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v1[3];
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke_2;
    v10[3] = &unk_1E16B8388;
    v11 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
    v9 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], v5, v1[2], v8, (uint64_t)v1[4], v1[5]);

    return (id *)v9;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:](+[_UICollectionPreferredSizes allocWithZone:](_UICollectionPreferredSizes, "allocWithZone:", a3), self->_sizes, self->_indexes, self->_supplementarySizesDict, self->_frameOffset, self->_supplementaryBaseOffsets);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_frameOffset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: frameOffset=<%@>; supplementaryBaseOffsets=<%@>; sizes=%@ >"),
    v5,
    self,
    v6,
    self->_supplementaryBaseOffsets,
    self->_sizes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)containsSupplementaryOffsets:(uint64_t)a1
{
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel_containsSupplementaryOffsets_, v2, CFSTR("_UICollectionPreferredSizes.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryOffsets"));

    }
    v4 = a2;
    v5 = v4;
    if (*(_QWORD *)(v2 + 40))
    {
      objc_msgSend(v4, "offsetsByApplyingOffsets:");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[_UICollectionPreferredSizes elementKinds](v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[_UICollectionPreferredSizes objectForKeyedSubscript:](v2, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = objc_msgSend(v5, "rangeForElementKind:", v12);
            if (v15)
            {
              v16 = v14;
              v17 = v15;
              -[_UICollectionPreferredSizes indexes]((uint64_t)v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "countOfIndexesInRange:", v16, v17);

              if (v19)
              {

                v2 = 1;
                goto LABEL_18;
              }
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }
    v2 = 0;
LABEL_18:

  }
  return v2;
}

- (double)largestItemSize
{
  double v2;
  void *v4;
  double *v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;

  if (!a1)
    return 0.0;
  if (!objc_msgSend(*(id *)(a1 + 8), "count"))
    return *MEMORY[0x1E0C9D820];
  v2 = *(double *)(a1 + 48);
  if (v2 == *MEMORY[0x1E0C9D820] && *(double *)(a1 + 56) == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v8 = 0;
    v9 = (double *)&v8;
    v10 = 0x3010000000;
    v11 = &unk_18685B0AF;
    v12 = *MEMORY[0x1E0C9D820];
    -[_UICollectionPreferredSizes indexes](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46___UICollectionPreferredSizes_largestItemSize__block_invoke;
    v7[3] = &unk_1E16B83B0;
    v7[4] = a1;
    v7[5] = &v8;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);

    v5 = v9;
    *(_OWORD *)(a1 + 48) = *((_OWORD *)v9 + 2);
    v2 = v5[4];
    _Block_object_dispose(&v8, 8);
  }
  return v2;
}

@end
