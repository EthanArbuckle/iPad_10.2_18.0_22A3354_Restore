@implementation NSMutableArray(TSUAdditions)

- (uint64_t)tsu_enqueue:()TSUAdditions
{
  return objc_msgSend(a1, "insertObject:atIndex:", a3, 0);
}

- (id)tsu_pop
{
  id v2;

  v2 = (id)objc_msgSend(a1, "lastObject");
  if (v2)
    objc_msgSend(a1, "removeLastObject");
  return v2;
}

- (uint64_t)tsu_addObjects:()TSUAdditions
{
  void *v9;
  uint64_t *v10;
  uint64_t *v11;

  v11 = &a9;
  if (a3)
  {
    v9 = (void *)result;
    do
    {
      result = objc_msgSend(v9, "addObject:");
      v10 = v11++;
    }
    while (*v10);
  }
  return result;
}

- (void)tsu_addNonNilObject:()TSUAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)tsu_addObjectsFromNonNilArray:()TSUAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (uint64_t)tsu_removeObjectsIdenticalToObjectsInArray:()TSUAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1 == a3)
    return objc_msgSend(a1, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = objc_msgSend(a1, "indexOfObjectIdenticalTo:", v9);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (i = v10; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(a1, "indexOfObjectIdenticalTo:", v9))
            objc_msgSend(a1, "removeObjectAtIndex:", i);
        }
        ++v8;
      }
      while (v8 != v6);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (unint64_t)tsu_trimObjectsFromIndex:()TSUAdditions
{
  unint64_t result;

  result = objc_msgSend(a1, "count");
  if (result > a3)
    return objc_msgSend(a1, "removeObjectsInRange:", a3, result - a3);
  return result;
}

- (uint64_t)tsu_insertObject:()TSUAdditions usingComparator:
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a1, "count"), 1024, a4);
  objc_msgSend(a1, "insertObject:atIndex:", a3, v6);
  return v6;
}

@end
