@implementation NSMutableOrderedSet(PLAdditions)

- (void)pl_addObjectsFromArray:()PLAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(a1, "count");
    v6 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "insertObjects:atIndexes:", v4, v7);

  }
}

- (void)pl_removeObjectsInArray:()PLAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(a1, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "removeObjectsAtIndexes:", v5);
  }

}

- (void)pl_insertObjects:()PLAdditions atIndex:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "indexOfObject:", v11);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(a1, "insertObject:atIndex:", v11, a4 + i);
        }
        else if (a4 + i != v12)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "moveObjectsAtIndexes:toIndex:", v13, a4 + i);

        }
      }
      a4 += i;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)pl_removeObjectsPassingTest:()PLAdditions
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    v7[1] = 3221225472;
    v7[2] = __64__NSMutableOrderedSet_PLAdditions__pl_removeObjectsPassingTest___block_invoke;
    v7[3] = &unk_1E3670120;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    objc_msgSend(a1, "indexesOfObjectsPassingTest:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectsAtIndexes:", v5);

    v4 = v6;
  }

}

@end
