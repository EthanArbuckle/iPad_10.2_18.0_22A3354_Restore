@implementation NSArray(TSUAdditions)

- (uint64_t)tsu_initWithCGFloats:()TSUAdditions count:
{
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (count < 0x11)
  {
    if (!count)
      return objc_msgSend(a1, "initWithObjects:count:", v11, 0);
    v7 = v11;
LABEL_5:
    v8 = 0;
    do
    {
      *(_QWORD *)&v7[8 * v8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a3 + 8 * v8));
      ++v8;
    }
    while (count != v8);
    v9 = objc_msgSend(a1, "initWithObjects:count:", v7, count);
    if (v7 != v11)
      free(v7);
    return v9;
  }
  v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
  if (v7)
    goto LABEL_5;
  return objc_msgSend(a1, "initWithObjects:count:", 0, count);
}

+ (id)tsu_arrayWithCGFloats:()TSUAdditions count:
{
  return (id)objc_msgSend([a1 alloc], "tsu_initWithCGFloats:count:", a3, a4);
}

- (uint64_t)tsu_initWithInts:()TSUAdditions count:
{
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (count < 0x11)
  {
    if (!count)
      return objc_msgSend(a1, "initWithObjects:count:", v11, 0);
    v7 = v11;
LABEL_5:
    v8 = 0;
    do
    {
      *(_QWORD *)&v7[8 * v8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a3 + 4 * v8));
      ++v8;
    }
    while (count != v8);
    v9 = objc_msgSend(a1, "initWithObjects:count:", v7, count);
    if (v7 != v11)
      free(v7);
    return v9;
  }
  v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
  if (v7)
    goto LABEL_5;
  return objc_msgSend(a1, "initWithObjects:count:", 0, count);
}

+ (id)tsu_arrayWithInts:()TSUAdditions count:
{
  return (id)objc_msgSend([a1 alloc], "tsu_initWithInts:count:", a3, a4);
}

+ (uint64_t)tsu_arrayByUnioningArray:()TSUAdditions withArray:
{
  if (a3)
    return objc_msgSend(a3, "tsu_arrayByAddingNonContainedObjectsFromArray:", a4);
  else
    return a4;
}

- (uint64_t)tsu_initWithUIntegers:()TSUAdditions count:
{
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (count < 0x11)
  {
    if (!count)
      return objc_msgSend(a1, "initWithObjects:count:", v11, 0);
    v7 = v11;
LABEL_5:
    v8 = 0;
    do
    {
      *(_QWORD *)&v7[8 * v8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a3 + 8 * v8));
      ++v8;
    }
    while (count != v8);
    v9 = objc_msgSend(a1, "initWithObjects:count:", v7, count);
    if (v7 != v11)
      free(v7);
    return v9;
  }
  v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
  if (v7)
    goto LABEL_5;
  return objc_msgSend(a1, "initWithObjects:count:", 0, count);
}

+ (id)tsu_arrayWithUIntegers:()TSUAdditions count:
{
  return (id)objc_msgSend([a1 alloc], "tsu_initWithUIntegers:count:", a3, a4);
}

- (uint64_t)tsu_rangeCheckedObjectAtIndex:()TSUAdditions
{
  if (objc_msgSend(a1, "count") <= a3)
    return 0;
  else
    return objc_msgSend(a1, "objectAtIndex:", a3);
}

- (uint64_t)tsu_objectPriorToObject:()TSUAdditions
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 && v2 != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(a1, "objectAtIndex:", v2 - 1);
  else
    return 0;
}

- (uint64_t)tsu_indexOfSmallestObject
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v7 = (void *)objc_msgSend(a1, "objectAtIndex:", v4);
    v8 = v7;
    if (!v5 || objc_msgSend(v7, "compare:", v5) == -1)
    {
      v6 = v4;
      v5 = v8;
    }
    ++v4;
  }
  while (v3 != v4);
  return v6;
}

- (void)tsu_indexesOfObjects:()TSUAdditions
{
  void *v5;
  uint64_t v6;
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
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        v10 = objc_msgSend(a1, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (void)tsu_arrayWithObjectsInSet:()TSUAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(a1);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(a3, "containsObject:", v10))
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return v5;
}

- (void)tsu_intersectionWithArray:()TSUAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(a1);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(a3, "indexOfObject:", v10) != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return v5;
}

- (void)tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:()TSUAdditions
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;

  v5 = objc_msgSend(a3, "count");
  if (!v5)
    return a1;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = a1;
  do
  {
    v10 = objc_msgSend(a3, "objectAtIndex:", v7);
    v11 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v10);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v11; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v10))
      {
        if (!v8)
        {
          v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a1);
          v8 = v9;
        }
        objc_msgSend(v8, "removeObjectAtIndex:", i);
      }
    }
    ++v7;
  }
  while (v7 != v6);
  return v9;
}

- (void)tsu_arrayByAddingNonContainedObjectsFromArray:()TSUAdditions
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (a3 && (v5 = objc_msgSend(a3, "count")) != 0)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(a3, "objectAtIndex:", v7);
      if ((objc_msgSend(a1, "containsObject:", v9) & 1) == 0)
      {
        if (!v8)
        {
          v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count") + v6);
          objc_msgSend(v8, "addObjectsFromArray:", a1);
        }
        objc_msgSend(v8, "addObject:", v9);
      }
      ++v7;
      --v6;
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    return v8;
  else
    return a1;
}

- (void)tsu_arrayByReversingOrder
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(a1, "reverseObjectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return v2;
}

- (uint64_t)tsu_arrayByRemovingFirstObject
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!objc_msgSend(a1, "count"))
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSArray(TSUAdditions) tsu_arrayByRemovingFirstObject]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSArrayAdditions.m"), 231, 1, "Can't remove the first object of an empty array!");
    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can't remove the first object of an empty array!", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[NSArray(TSUAdditions) tsu_arrayByRemovingFirstObject]");
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a1);
  objc_msgSend(v10, "removeObjectAtIndex:", 0);
  return objc_msgSend((id)objc_opt_class(), "arrayWithArray:", v10);
}

- (void)tsu_enumerateSnapshotObjectsUsingBlock:()TSUAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a1, "copy");
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", a3);

}

- (uint64_t)tsu_firstObjectPassingTest:()TSUAdditions
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(a1);
    v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v6)
        goto LABEL_4;
      return v9;
    }
  }
}

- (uint64_t)tsu_containsObjectPassingTest:()TSUAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a1);
        if (((*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
          return 1;
      }
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      result = 0;
      if (v6)
        continue;
      break;
    }
  }
  return result;
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

- (uint64_t)tsu_arrayOfObjectsPassingTest:()TSUAdditions
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (!a3)
    return objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NSArray_TSUAdditions__tsu_arrayOfObjectsPassingTest___block_invoke;
  v7[3] = &unk_24F39AC98;
  v7[4] = a3;
  v4 = (void *)objc_msgSend(a1, "indexesOfObjectsPassingTest:", v7);
  if (!v4)
    return objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v5 = v4;
  if (!objc_msgSend(v4, "count"))
    return objc_msgSend(MEMORY[0x24BDBCE30], "array");
  if ((objc_msgSend(v5, "containsIndexesInRange:", 0, objc_msgSend(a1, "count")) & 1) != 0)
    return (uint64_t)a1;
  return objc_msgSend(a1, "objectsAtIndexes:", v5);
}

- (uint64_t)tsu_arrayByTransformingWithBlock:()TSUAdditions
{
  uint64_t v5;
  _QWORD v7[6];

  v5 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__NSArray_TSUAdditions__tsu_arrayByTransformingWithBlock___block_invoke;
  v7[3] = &unk_24F39ACC0;
  v7[4] = v5;
  v7[5] = a3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v7);
  return v5;
}

- (id)tsu_arrayByMappingObjectsUsingBlock:()TSUAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a1);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v10);
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSArray(TSUAdditions) tsu_arrayByMappingObjectsUsingBlock:]");
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSArrayAdditions.m"), 335, 0, "Block returned a nil object for %@.", v10);
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        }
      }
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  return (id)objc_msgSend(v5, "copy");
}

- (void)tsu_arrayByFlattening
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[6];

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke;
  v4[3] = &unk_24F39ACE8;
  v4[4] = v5;
  v5[5] = v4;
  __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke((uint64_t)v4, a1, v2);
  _Block_object_dispose(v5, 8);
  return v2;
}

- (uint64_t)tsu_uniqueObjects
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a1);
}

- (uint64_t)tsu_onlyObject
{
  uint64_t v2;

  if ((unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSArray(TSUAdditions) tsu_onlyObject]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSArrayAdditions.m"), 365, 0, "As this method returns the only object in the array, it only makes sense if the array has at most one object.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return objc_msgSend(a1, "firstObject");
}

- (id)tsu_localizedList
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = objc_msgSend(a1, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 2;
    for (i = v3; i; --i)
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v5 - 2), "description"));
      if (i < 3)
      {
        if (v4 >= 3 && i == 2)
        {
          v7 = (void *)SFUBundle();
          v8 = CFSTR("TSU_LIST_SEPARATOR_FINAL");
          v9 = CFSTR(", and ");
        }
        else
        {
          if (v4 != 2 || v5 != 2)
            goto LABEL_12;
          v7 = (void *)SFUBundle();
          v8 = CFSTR("TSU_LIST_SEPARATOR_TWO_ITEMS");
          v9 = CFSTR(" and ");
        }
      }
      else
      {
        v7 = (void *)SFUBundle();
        v8 = CFSTR("TSU_LIST_SEPARATOR");
        v9 = CFSTR(", ");
      }
      objc_msgSend(v2, "appendFormat:", CFSTR("%@"), objc_msgSend(v7, "localizedStringForKey:value:table:", v8, v9, CFSTR("TSUtility")));
LABEL_12:
      ++v5;
    }
  }
  return (id)objc_msgSend(v2, "copy");
}

+ (uint64_t)tsu_arrayWithNonNilObject:()TSUAdditions
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return MEMORY[0x24BDBD1A8];
  v4[0] = a3;
  return objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
}

@end
