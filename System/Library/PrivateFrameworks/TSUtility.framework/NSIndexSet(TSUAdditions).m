@implementation NSIndexSet(TSUAdditions)

+ (id)tsu_indexSetWithIndices:()TSUAdditions count:
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndices:count:", a3, a4);
}

- (uint64_t)initWithIndices:()TSUAdditions count:
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

- (id)tsu_indexSetByAddingIndexes:()TSUAdditions
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "addIndexes:", a3);
  v5 = (id)objc_msgSend(v4, "copy");

  return v5;
}

- (BOOL)tsu_isSingleContiguousRange
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "lastIndex");
  v3 = v2 - objc_msgSend(a1, "firstIndex") + 1;
  return v3 == objc_msgSend(a1, "count");
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
    v7[3] = &unk_24D61B178;
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

@end
