@implementation NSMutableArray(TSUAdditions)

- (void)initWithResultsOfPerformingSelector:()TSUAdditions onObjectsFromArray:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a1, "initWithCapacity:", objc_msgSend(a4, "count"));
  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
            objc_enumerationMutation(a4);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "performSelector:", a3));
        }
        while (v8 != v10);
        v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  return v6;
}

- (void)initWithResultsOfPerformingSelector:()TSUAdditions withObject:onObjectsFromArray:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(a1, "initWithCapacity:", objc_msgSend(a5, "count"));
  if (v8)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(a5);
          objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "performSelector:withObject:", a3, a4));
        }
        while (v10 != v12);
        v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  return v8;
}

- (uint64_t)tsu_enqueue:()TSUAdditions
{
  return objc_msgSend(a1, "insertObject:atIndex:", a3, 0);
}

- (id)pop_tsu
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

- (uint64_t)tsu_removeObjectsIdenticalToObjectsInSet:()TSUAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(a1, "removeObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
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

@end
