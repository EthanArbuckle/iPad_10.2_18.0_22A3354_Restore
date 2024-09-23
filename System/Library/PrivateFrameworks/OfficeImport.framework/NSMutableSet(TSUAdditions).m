@implementation NSMutableSet(TSUAdditions)

- (uint64_t)tsu_xorSet:()TSUAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (objc_msgSend(a1, "containsObject:", v9))
          objc_msgSend(a1, "removeObject:", v9);
        else
          objc_msgSend(a1, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
    }
    while (result);
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

- (uint64_t)tsu_removeEqualObject:()TSUAdditions
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a1, "allObjects");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isEqual:", a3))
          objc_msgSend(a1, "removeObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)tsu_removeObjectsPassingTest:()TSUAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = result;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    result = (void *)objc_msgSend(result, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (result)
    {
      v5 = result;
      v6 = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
          if ((*(unsigned int (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9))
          {
            if (!v6)
              v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
            objc_msgSend(v6, "addObject:", v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        result = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v5 = result;
      }
      while (result);
      if (v6)
        return (void *)objc_msgSend(v4, "minusSet:", v6);
    }
  }
  return result;
}

@end
