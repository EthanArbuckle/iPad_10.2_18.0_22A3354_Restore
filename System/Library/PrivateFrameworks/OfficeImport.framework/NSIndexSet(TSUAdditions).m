@implementation NSIndexSet(TSUAdditions)

+ (id)tsu_indexSetWithIndices:()TSUAdditions count:
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "tsu_initWithIndices:count:", a3, a4);
}

- (uint64_t)tsu_initWithIndices:()TSUAdditions count:
{
  void *i;
  uint64_t v8;

  for (i = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet"); a4; --a4)
  {
    v8 = *a3++;
    objc_msgSend(i, "addIndex:", v8);
  }
  return objc_msgSend(a1, "initWithIndexSet:", i);
}

- (id)tsu_indexSetByAddingIndex:()TSUAdditions
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "addIndex:", a3);
  v5 = (id)objc_msgSend(v4, "copy");

  return v5;
}

- (id)tsu_indexSetByAddingIndexes:()TSUAdditions
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "addIndexes:", a3);
  v5 = (id)objc_msgSend(v4, "copy");

  return v5;
}

- (uint64_t)tsu_isSingleContiguousRange
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v3 = objc_msgSend(a1, "lastIndex");
    v4 = v3 - objc_msgSend(a1, "firstIndex") + 1;
    return v4 == objc_msgSend(a1, "count");
  }
  return result;
}

- (uint64_t)tsu_intersectsIndexesInIndexSet:()TSUAdditions
{
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (objc_msgSend(a1, "count") && objc_msgSend(a3, "count"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__NSIndexSet_TSUAdditions__tsu_intersectsIndexesInIndexSet___block_invoke;
    v7[3] = &unk_24F39AF40;
    v7[4] = a3;
    v7[5] = &v8;
    objc_msgSend(a1, "enumerateRangesUsingBlock:", v7);
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)tsu_indexSetByInsertingIndexes:()TSUAdditions inRange:
{
  void *v8;
  id v9;

  if (a3 && a5)
  {
    v8 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v8, "shiftIndexesStartingAtIndex:by:", a4, a5);
    v9 = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v9, "shiftIndexesStartingAtIndex:by:", 0, a4);
    objc_msgSend(v8, "addIndexes:", v9);
  }
  else
  {
    v8 = (void *)objc_msgSend(a1, "copy");
  }
  return v8;
}

- (id)tsu_indexSetByIntersectingWithRange:()TSUAdditions
{
  id v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v16 = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__NSIndexSet_TSUAdditions__tsu_indexSetByIntersectingWithRange___block_invoke;
  v10[3] = &unk_24F39AF68;
  v10[4] = &v11;
  objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:", a3, a4, 0, v10);
  v7 = objc_alloc(MEMORY[0x24BDD15E0]);
  v8 = (id)objc_msgSend(v7, "initWithIndexSet:", v12[5]);
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)tsu_indexSetByIntersectingWithIndexes:()TSUAdditions
{
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v14 = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__NSIndexSet_TSUAdditions__tsu_indexSetByIntersectingWithIndexes___block_invoke;
  v8[3] = &unk_24F39AF90;
  v8[4] = a3;
  v8[5] = &v9;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);
  v5 = objc_alloc(MEMORY[0x24BDD15E0]);
  v6 = (id)objc_msgSend(v5, "initWithIndexSet:", v10[5]);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)tsu_indexSetByExcludingIndexes:()TSUAdditions
{
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v14 = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__NSIndexSet_TSUAdditions__tsu_indexSetByExcludingIndexes___block_invoke;
  v8[3] = &unk_24F39AF90;
  v8[4] = a3;
  v8[5] = &v9;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);
  v5 = objc_alloc(MEMORY[0x24BDD15E0]);
  v6 = (id)objc_msgSend(v5, "initWithIndexSet:", v10[5]);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (uint64_t)tsu_indexAtPosition:()TSUAdditions
{
  uint64_t v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a1, "count") > a3)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__NSIndexSet_TSUAdditions__tsu_indexAtPosition___block_invoke;
    v7[3] = &unk_24F39AFB8;
    v7[4] = v8;
    v7[5] = &v9;
    v7[6] = a3;
    objc_msgSend(a1, "enumerateIndexesUsingBlock:", v7);
    _Block_object_dispose(v8, 8);
  }
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (uint64_t)tsu_positionOfIndex:()TSUAdditions
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_msgSend(a1, "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__NSIndexSet_TSUAdditions__tsu_positionOfIndex___block_invoke;
  v9[3] = &unk_24F39AFE0;
  v9[4] = &v10;
  v9[5] = a3;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v9);
  if (v11[3] >= v6)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (uint64_t)tsu_leadingRangeInRange:()TSUAdditions
{
  __int128 *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v11 = &unk_22A567D77;
  v12 = a3;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__NSIndexSet_TSUAdditions__tsu_leadingRangeInRange___block_invoke;
  v7[3] = &unk_24F39AF68;
  v7[4] = &v8;
  objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:", a3, a4, 0, v7);
  v4 = (__int128 *)(v9 + 4);
  if (!v9[5])
    v4 = &NSInvalidRange;
  v5 = *(_QWORD *)v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (uint64_t)tsu_trailingRangeInRange:()TSUAdditions
{
  __int128 *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3010000000;
  v10 = &unk_22A567D77;
  v11 = a3 + a4;
  v12 = 0;
  objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:");
  v4 = (__int128 *)(v8 + 4);
  if (!v8[5])
    v4 = &NSInvalidRange;
  v5 = *(_QWORD *)v4;
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (uint64_t)tsu_localizedDescription
{
  void *v2;
  _QWORD v4[5];

  v2 = (void *)objc_opt_new();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__NSIndexSet_TSUAdditions__tsu_localizedDescription__block_invoke;
  v4[3] = &unk_24F39B008;
  v4[4] = v2;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v4);
  return objc_msgSend(v2, "tsu_localizedList");
}

@end
