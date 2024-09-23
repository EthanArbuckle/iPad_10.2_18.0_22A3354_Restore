@implementation NSIndexSet(PLAdditions)

- (id)pl_shortDescription
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__NSIndexSet_PLAdditions__pl_shortDescription__block_invoke;
  v7[3] = &unk_1E366A158;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v7);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v5;
}

- (id)_pl_indexSetByUpdatingWithChangedIndexes:()PLAdditions asInserts:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD v14[4];
  id v15;

  v6 = a3;
  if (objc_msgSend(v6, "rangeCount"))
  {
    v7 = (void *)objc_msgSend(a1, "mutableCopy");
    if (a4)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke;
      v14[3] = &unk_1E366A158;
      v8 = v7;
      v15 = v8;
      objc_msgSend(v6, "enumerateRangesUsingBlock:", v14);

    }
    else
    {
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      v13[3] = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke_2;
      v10[3] = &unk_1E366A180;
      v12 = v13;
      v8 = v7;
      v11 = v8;
      objc_msgSend(v6, "enumerateRangesUsingBlock:", v10);

      _Block_object_dispose(v13, 8);
    }
  }
  else
  {
    v8 = (id)objc_msgSend(a1, "copy");
  }

  return v8;
}

- (uint64_t)pl_indexSetAdjustedForDeletions:()PLAdditions
{
  return objc_msgSend(a1, "_pl_indexSetByUpdatingWithChangedIndexes:asInserts:", a3, 0);
}

- (uint64_t)pl_indexSetAdjustedForInsertions:()PLAdditions
{
  return objc_msgSend(a1, "_pl_indexSetByUpdatingWithChangedIndexes:asInserts:", a3, 1);
}

- (uint64_t)pl_rangeCoveringIndexSet
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "firstIndex");
  if (((v2 != 0x7FFFFFFFFFFFFFFFLL) & (objc_msgSend(a1, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL)) != 0)
    return v2;
  else
    return 0;
}

@end
