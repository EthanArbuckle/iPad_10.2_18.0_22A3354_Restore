@implementation NSIndexPath(PhotosUIFoundation)

- (uint64_t)px_item
{
  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return objc_msgSend(a1, "indexAtPosition:", 1);
}

- (uint64_t)px_section
{
  return objc_msgSend(a1, "indexAtPosition:", 0);
}

- (uint64_t)px_kind
{
  if ((unint64_t)objc_msgSend(a1, "length") < 3)
    return 0;
  else
    return objc_msgSend(a1, "indexAtPosition:", 2);
}

- (id)px_indexPathByChangingIndexAtPosition:()PhotosUIFoundation toIndex:
{
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a1, "length");
  v8 = (char *)v10 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "getIndexes:", v8);
  *(_QWORD *)&v8[8 * a3] = a4;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", v8, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)px_alteredIndexPathAfterInsertingItemAtIndexPath:()PhotosUIFoundation
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = a1;
  v6 = objc_msgSend(v4, "px_section");
  if (v6 == objc_msgSend(v5, "px_section"))
  {
    v7 = objc_msgSend(v4, "px_item");
    if (v7 <= objc_msgSend(v5, "px_item"))
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:", objc_msgSend(v5, "px_item") + 1, objc_msgSend(v5, "px_section"));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
  }

  return v5;
}

- (id)px_alteredIndexPathAfterInsertingItemsAtIndexPaths:()PhotosUIFoundation
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v10, "px_alteredIndexPathAfterInsertingItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)px_alteredIndexPathAfterDeletingItemAtIndexPath:()PhotosUIFoundation
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = a1;
  v6 = objc_msgSend(v4, "px_section");
  if (v6 == objc_msgSend(v5, "px_section"))
  {
    v7 = objc_msgSend(v4, "px_item");
    if (v7 == objc_msgSend(v5, "px_item"))
    {
      v8 = (void *)MEMORY[0x24BDD15D8];
      v9 = objc_msgSend(v5, "px_section");
      v10 = v8;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
      objc_msgSend(v10, "px_indexPathForItem:inSection:", v11, v9);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v15;
      goto LABEL_7;
    }
    v12 = objc_msgSend(v4, "px_item");
    if (v12 < objc_msgSend(v5, "px_item"))
    {
      v13 = (void *)MEMORY[0x24BDD15D8];
      v14 = objc_msgSend(v5, "px_item") - 1;
      v9 = objc_msgSend(v5, "px_section");
      v10 = v13;
      v11 = v14;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (id)px_alteredIndexPathAfterDeletingItemsAtIndexPaths:()PhotosUIFoundation
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v10, "px_alteredIndexPathAfterDeletingItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)px_alteredIndexPathAfterMovingItemAtIndexPath:()PhotosUIFoundation toIndexPath:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  if (v6 && (objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    if (objc_msgSend(v8, "isEqual:", v6))
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v8, "px_alteredIndexPathAfterDeletingItemAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "px_alteredIndexPathAfterInsertingItemAtIndexPath:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v10;
    }

    v8 = v9;
  }

  return v8;
}

- (id)px_indexPathAfterInsertingItemAtIndexPath:()PhotosUIFoundation
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a1;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NSIndexPath+PhotosUIFoundation.m"), 109, CFSTR("can't insert zero-length index path"));
    goto LABEL_11;
  }
  v7 = objc_msgSend(v6, "length");
  if (v7 < objc_msgSend(v5, "length"))
    goto LABEL_12;
  v8 = objc_msgSend(v5, "length");
  v9 = v8 - 1;
  if (v8 == 1)
  {
LABEL_7:
    v12 = objc_msgSend(v6, "indexAtPosition:", v9);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v13 = v12;
    if (v12 < objc_msgSend(v5, "indexAtPosition:", v9))
      goto LABEL_12;
    objc_msgSend(v6, "px_indexPathByChangingIndexAtPosition:toIndex:", v9, v13 + 1);
    v14 = v6;
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
  while (1)
  {
    v11 = objc_msgSend(v6, "indexAtPosition:", v10);
    if (v11 != objc_msgSend(v5, "indexAtPosition:", v10))
      break;
    if (v9 == ++v10)
      goto LABEL_7;
  }
LABEL_12:

  return v6;
}

- (id)px_indexPathAfterDeletingItemAtIndexPath:()PhotosUIFoundation
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = a1;
  if (!objc_msgSend(v4, "length"))
  {
    v14 = v5;
    v15 = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend(v5, "length");
  if (v6 < objc_msgSend(v4, "length"))
    goto LABEL_13;
  v7 = objc_msgSend(v4, "length");
  v8 = v7 - 1;
  if (v7 == 1)
  {
LABEL_7:
    v11 = objc_msgSend(v5, "indexAtPosition:", v8);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
    v12 = v11;
    v13 = objc_msgSend(v4, "indexAtPosition:", v8);
    if (v12 != v13)
    {
      if (v12 <= v13)
        goto LABEL_13;
      v16 = v12 - 1;
      v14 = v5;
      v15 = v8;
      goto LABEL_12;
    }
    v14 = v5;
    v15 = v8;
LABEL_11:
    v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
    objc_msgSend(v14, "px_indexPathByChangingIndexAtPosition:toIndex:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v17;
    goto LABEL_13;
  }
  v9 = 0;
  while (1)
  {
    v10 = objc_msgSend(v5, "indexAtPosition:", v9);
    if (v10 != objc_msgSend(v4, "indexAtPosition:", v9))
      break;
    if (v8 == ++v9)
      goto LABEL_7;
  }
LABEL_13:

  return v5;
}

+ (id)px_indexPathsForItems:()PhotosUIFoundation inSection:
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (!a3)
    return 0;
  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__NSIndexPath_PhotosUIFoundation__px_indexPathsForItems_inSection___block_invoke;
  v10[3] = &unk_2514CF7F8;
  v12 = a4;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  return v8;
}

+ (id)px_indexPathForItem:()PhotosUIFoundation inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)px_indexPathForItem:()PhotosUIFoundation inSection:withKind:
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = a4;
  v6[1] = a3;
  v6[2] = a5;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
