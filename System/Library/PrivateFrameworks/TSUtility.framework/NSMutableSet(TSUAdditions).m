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

@end
