@implementation NSArray(TSUAdditions)

- (uint64_t)initWithCGFloats:()TSUAdditions count:
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

+ (id)arrayWithCGFloats:()TSUAdditions count:
{
  return (id)objc_msgSend([a1 alloc], "initWithCGFloats:count:", a3, a4);
}

- (uint64_t)initWithInts:()TSUAdditions count:
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

+ (id)arrayWithInts:()TSUAdditions count:
{
  return (id)objc_msgSend([a1 alloc], "initWithInts:count:", a3, a4);
}

- (uint64_t)tsu_objectBeforeObjectIdenticalTo:()TSUAdditions
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "indexOfObjectIdenticalTo:");
  if (v2 && v2 != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(a1, "objectAtIndex:", v2 - 1);
  else
    return 0;
}

- (uint64_t)tsu_objectAfterObjectIdenticalTo:()TSUAdditions
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "indexOfObjectIdenticalTo:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v3 = v2 + 1;
  if (v2 + 1 >= (unint64_t)objc_msgSend(a1, "count"))
    return 0;
  else
    return objc_msgSend(a1, "objectAtIndex:", v3);
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

- (uint64_t)tsu_makeObjectsPerformSelector:()TSUAdditions withObject:withObject:
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v10 = result;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(a1);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "performSelector:withObject:withObject:", a3, a4, a5);
      }
      while (v10 != v12);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v10 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)tsu_makeObjectsPerformSelectorIfImplemented:()TSUAdditions withObject:
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a1);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "performSelector:withObject:", a3, a4);
        ++v10;
      }
      while (v8 != v10);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)tsu_makeObjectsPerformSelectorIfImplemented:()TSUAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(a1);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "performSelector:", a3);
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
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

- (void)tsu_arrayByRemovingObjectsInArray:()TSUAdditions
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a1);
  objc_msgSend(v4, "removeObjectsInArray:", a3);
  return v4;
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

- (id)tsu_mutableArrayByMakingObjectsPerformSelector:()TSUAdditions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithResultsOfPerformingSelector:onObjectsFromArray:", a3, a1);
}

- (void)tsu_map:()TSUAdditions
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
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(a1);
        v10 = (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v5, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
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

- (uint64_t)tsu_arrayOfObjectsPassingTest:()TSUAdditions
{
  return objc_msgSend(a1, "objectsAtIndexes:", objc_msgSend(a1, "indexesOfObjectsPassingTest:"));
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
  id v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a1);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v10);
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          v12 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSArray(TSUAdditions) tsu_arrayByMappingObjectsUsingBlock:]");
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSArrayAdditions.m"), 293, CFSTR("Block returned a nil object for %@."), v10);
        }
      }
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  return (id)objc_msgSend(v5, "copy");
}

- (uint64_t)tsu_arrayOfObjectsAtIndexes:()TSUAdditions options:passingTest:
{
  return objc_msgSend(a1, "objectsAtIndexes:", objc_msgSend(a1, "indexesOfObjectsAtIndexes:options:passingTest:"));
}

- (uint64_t)tsu_arrayByTransformingWithBlock:()TSUAdditions
{
  uint64_t v5;
  _QWORD v7[6];

  v5 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__NSArray_TSUAdditions__tsu_arrayByTransformingWithBlock___block_invoke;
  v7[3] = &unk_24D61B0B8;
  v7[4] = v5;
  v7[5] = a3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v7);
  return v5;
}

- (BOOL)tsu_containsObjectIdenticalTo:()TSUAdditions
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL;
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
  v5[3] = __Block_byref_object_copy__0;
  v5[4] = __Block_byref_object_dispose__0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke;
  v4[3] = &unk_24D61B0E0;
  v4[4] = v5;
  v5[5] = v4;
  __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke((uint64_t)v4, a1, v2);
  _Block_object_dispose(v5, 8);
  return v2;
}

@end
