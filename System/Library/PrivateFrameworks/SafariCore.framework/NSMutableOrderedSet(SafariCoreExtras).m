@implementation NSMutableOrderedSet(SafariCoreExtras)

- (void)safari_insertObject:()SafariCoreExtras inSortedOrderUsingComparator:
{
  uint64_t (**v6)(id, void *, id);
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  if (!v7)
  {
    v9 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  v9 = 0;
  while (1)
  {
    v10 = (v9 + v8) >> 1;
    objc_msgSend(a1, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6[2](v6, v11, v13);

    if (v12 == -1)
    {
      v9 = v10 + 1;
      goto LABEL_9;
    }
    if (v12 == 1)
    {
      v8 = (v9 + v8) >> 1;
      goto LABEL_9;
    }
    if (!v12)
      break;
LABEL_9:
    if (v9 >= v8)
      goto LABEL_12;
  }
  v9 = v10 + 1;
LABEL_12:
  objc_msgSend(a1, "insertObject:atIndex:", v13, v9);

}

- (BOOL)safari_isSortedInAscendingOrDescendingOrderUsingComparator:()SafariCoreExtras
{
  uint64_t (**v4)(id, void *, void *);
  unint64_t v5;
  _BOOL8 v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 >= 3)
  {
    v7 = v5;
    objc_msgSend(a1, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4[2](v4, v9, v8);
    v11 = v8;

    objc_msgSend(a1, "objectAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4[2](v4, v11, v12) == v10)
    {
      v13 = 3;
      while (1)
      {
        v14 = v13;
        if (v7 == v13)
          break;
        v15 = v12;

        objc_msgSend(a1, "objectAtIndex:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v4[2](v4, v15, v12);
        v13 = v14 + 1;
        v11 = v15;
        if (v16 != v10)
          goto LABEL_10;
      }
      v15 = v11;
LABEL_10:
      v6 = v14 >= v7;
      v11 = v15;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)safari_containsObjectPassingTest:()SafariCoreExtras
{
  id v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__NSMutableOrderedSet_SafariCoreExtras__safari_containsObjectPassingTest___block_invoke;
  v8[3] = &unk_1E649CA28;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

@end
