@implementation NSSet(TSUAdditions)

+ (id)tsu_setWithSelectors:()TSUAdditions
{
  id v10;
  const char **v11;
  id v12;
  const char **v14;

  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = (const char **)&a9;
  if (a3)
  {
    do
    {
      objc_msgSend(v10, "addObject:", NSStringFromSelector(a3));
      v11 = v14++;
      a3 = *v11;
    }
    while (*v11);
  }
  v12 = (id)objc_msgSend(v10, "copy");

  return v12;
}

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

+ (uint64_t)tsu_intersectionOfSets:()TSUAdditions
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    return objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(a3);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
      if (v6)
        objc_msgSend(v6, "intersectSet:", v9);
      else
        v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v9);
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);
  if (!v6)
    return objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  return (uint64_t)v6;
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

- (uint64_t)tsu_sortedArray
{
  return objc_msgSend((id)objc_msgSend(a1, "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
}

- (id)tsu_setByMappingObjectsUsingBlock:()TSUAdditions
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSSetAdditions.m"), 86, 0, "Invalid parameter not satisfying: %{public}s", "block != nil");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(a1, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a1);
        v11 = (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        if (v11)
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]");
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSSetAdditions.m"), 96, 0, "Block returned a nil object.");
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        }
      }
      v8 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return (id)objc_msgSend(v6, "copy");
}

- (uint64_t)tsu_isHomogeneousForClass:()TSUAdditions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(a1);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 0;
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
  return 1;
}

- (uint64_t)tsu_onlyObject
{
  uint64_t v2;

  if ((unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSSet(TSUAdditions) tsu_onlyObject]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSSetAdditions.m"), 117, 0, "As this method returns the only object in the set, it only makes sense if the set has at most one object.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return objc_msgSend(a1, "anyObject");
}

- (uint64_t)tsu_setByIntersectingSet:()TSUAdditions
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", a1);
  objc_msgSend(v4, "intersectSet:", a3);
  return objc_msgSend((id)objc_opt_class(), "setWithSet:", v4);
}

- (uint64_t)tsu_setBySubtractingSet:()TSUAdditions
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", a1);
  objc_msgSend(v4, "minusSet:", a3);
  return objc_msgSend((id)objc_opt_class(), "setWithSet:", v4);
}

@end
