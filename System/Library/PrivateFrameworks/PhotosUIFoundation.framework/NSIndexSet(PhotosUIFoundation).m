@implementation NSIndexSet(PhotosUIFoundation)

- (id)px_intersectionWithIndexSet:()PhotosUIFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "count") && objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "removeIndexes:", v6);
    objc_msgSend(v6, "removeIndexes:", a1);
    objc_msgSend(v5, "addIndexes:", v6);
    v7 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v7, "addIndexes:", v4);
    objc_msgSend(v7, "removeIndexes:", v5);
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)px_shortDescription
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, unint64_t);
  void *v11;
  id v12;

  v2 = (void *)MEMORY[0x24950CD7C]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __53__NSIndexSet_PhotosUIFoundation__px_shortDescription__block_invoke;
  v11 = &unk_2514D0978;
  v12 = v3;
  v4 = v3;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", &v8);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]"), v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v6;
}

- (uint64_t)px_indexAtPosition:()PhotosUIFoundation
{
  uint64_t i;

  for (i = objc_msgSend(a1, "firstIndex"); a3; --a3)
    i = objc_msgSend(a1, "indexGreaterThanIndex:", i);
  return i;
}

- (uint64_t)px_intersectsWithIndexSet:()PhotosUIFoundation
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__NSIndexSet_PhotosUIFoundation__px_intersectsWithIndexSet___block_invoke;
  v7[3] = &unk_2514D09A0;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v7);
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)px_map:()PhotosUIFoundation
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDD1698];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__NSIndexSet_PhotosUIFoundation__px_map___block_invoke;
  v10[3] = &unk_2514D0978;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "px_enumerateMap:usingBlock:", v5, v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (void)px_enumerateMap:()PhotosUIFoundation usingBlock:
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__NSIndexSet_PhotosUIFoundation__px_enumerateMap_usingBlock___block_invoke;
  v11[3] = &unk_2514D09C8;
  v11[4] = a1;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v11);

}

- (id)px_indexSetAdjustedForDeletions:()PhotosUIFoundation
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "px_adjustIndexesForDeletions:", v4);
  }
  else
  {
    v5 = (void *)objc_msgSend(a1, "copy");
  }

  return v5;
}

- (id)px_indexSetAdjustedForInsertions:()PhotosUIFoundation
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "px_adjustIndexesForInsertions:", v4);
  }
  else
  {
    v5 = (void *)objc_msgSend(a1, "copy");
  }

  return v5;
}

- (uint64_t)px_coveringRange
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "firstIndex");
  if (((v2 != 0x7FFFFFFFFFFFFFFFLL) & (objc_msgSend(a1, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL)) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)px_isSingleRangeWithMax:()PhotosUIFoundation
{
  uint64_t v4;
  _BOOL8 v5;
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
  v13 = 0;
  v11 = &unk_244396D4B;
  v12 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__NSIndexSet_PhotosUIFoundation__px_isSingleRangeWithMax___block_invoke;
  v7[3] = &unk_2514D09F0;
  v7[4] = &v8;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v7);
  v4 = v9[5];
  if (v4)
    v5 = v9[4] + v4 == a3;
  else
    v5 = 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end
