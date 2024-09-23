@implementation NSSet(TSUAdditions)

+ (uint64_t)tsu_set:()TSUAdditions isEqualToSet:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  if (a3 != (void *)a4)
  {
    v11 = v5;
    v12 = v4;
    v8 = a4;
    v9 = a3;
    if (a3)
    {
      if (a4)
        return objc_msgSend(v9, "isEqualToSet:", v8);
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
      if (v8)
        return objc_msgSend(v9, "isEqualToSet:", v8);
    }
    v8 = objc_msgSend(MEMORY[0x24BDBCF20], "set", v11, v12, v6, v7);
    return objc_msgSend(v9, "isEqualToSet:", v8);
  }
  return 1;
}

- (uint64_t)tsu_containsObjectIdenticalTo:()TSUAdditions
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
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a1);
        if (*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) == a3)
          return 1;
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

@end
