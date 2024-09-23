@implementation NSMutableArray(SafariCoreExtras)

- (void)safari_addObjectUnlessNil:()SafariCoreExtras
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)safari_addObjectsFromArrayUnlessNil:()SafariCoreExtras
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (void)safari_insertObjects:()SafariCoreExtras afterObject:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v7 = objc_msgSend(a1, "indexOfObject:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7 + 1;
LABEL_5:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v8, objc_msgSend(v10, "count"));
    objc_msgSend(a1, "insertObjects:atIndexes:", v10, v9);

  }
}

- (void)safari_setObject:()SafariCoreExtras atIndex:withPaddingObject:
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = objc_msgSend(a1, "count");
  if (v9 < a4)
  {
    v10 = v9;
    do
      objc_msgSend(a1, "setObject:atIndexedSubscript:", v8, v10++);
    while (a4 != v10);
  }
  if (v12)
    v11 = v12;
  else
    v11 = v8;
  objc_msgSend(a1, "setObject:atIndexedSubscript:", v11, a4);

}

- (void)safari_removeObjectsPassingTest:()SafariCoreExtras
{
  id v2;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsAtIndexes:", v2);

}

- (void)safari_removeObjectsAtIndexes:()SafariCoreExtras withOffset:startingAtIndex:
{
  id v8;
  BOOL v9;
  void *v10;
  id v11;

  v8 = a3;
  if (v8)
  {
    v11 = v8;
    v9 = objc_msgSend(a1, "count") > a5;
    v8 = v11;
    if (v9)
    {
      v10 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v10, "shiftIndexesStartingAtIndex:by:", a5, a4);
      objc_msgSend(a1, "removeObjectsAtIndexes:", v10);

      v8 = v11;
    }
  }

}

- (void)safari_insertObject:()SafariCoreExtras afterObject:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "safari_insertObjects:afterObject:", v9, v7, v10, v11);
}

- (void)safari_insertObject:()SafariCoreExtras inSortedOrderUsingComparator:
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  v8 = a3;
  v7 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1024, v6);

  objc_msgSend(a1, "insertObject:atIndex:", v8, v7);
}

- (id)safari_takeFirstObject
{
  void *v2;

  objc_msgSend(a1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "count"))
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

@end
