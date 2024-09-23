@implementation NSIndexPath(PhotosUI)

- (id)pu_indexPathByChangingIndexAtPosition:()PhotosUI toIndex:
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "length");
  v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    v9 = 0;
    do
    {
      v10 = a4;
      if (a3 != v9)
        v10 = objc_msgSend(a1, "indexAtPosition:", v9);
      *(_QWORD *)&v8[8 * v9++] = v10;
    }
    while (v7 != v9);
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v8, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pu_indexPathByAppendingIndexPath:()PhotosUI
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t i;
  unint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_msgSend(v4, "length") + v5;
  v7 = (char *)v13 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
      *(_QWORD *)&v7[8 * i] = objc_msgSend(a1, "indexAtPosition:", i);
  }
  if (objc_msgSend(v4, "length"))
  {
    v9 = 0;
    v10 = &v7[8 * v5];
    do
    {
      *(_QWORD *)&v10[8 * v9] = objc_msgSend(v4, "indexAtPosition:", v9);
      ++v9;
    }
    while (v9 < objc_msgSend(v4, "length"));
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)pu_isValid
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _BOOL8 result;

  if (!objc_msgSend(a1, "length"))
    return 1;
  v2 = 0;
  while (1)
  {
    v3 = objc_msgSend(a1, "indexAtPosition:", v2);
    v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
    result = v3 != 0x7FFFFFFFFFFFFFFFLL;
    if (v4)
      break;
    if (++v2 >= (unint64_t)objc_msgSend(a1, "length"))
      return 1;
  }
  return result;
}

- (uint64_t)pu_isParentOfIndexPath:()PhotosUI
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5 <= objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(a1, "length"))
    {
      v7 = 0;
      while (1)
      {
        v8 = objc_msgSend(a1, "indexAtPosition:", v7);
        v9 = v8 == objc_msgSend(v4, "indexAtPosition:", v7);
        v6 = v9;
        if (!v9)
          break;
        if (++v7 >= (unint64_t)objc_msgSend(a1, "length"))
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pu_alteredIndexPathAfterInsertingItemAtIndexPath:()PhotosUI
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = a1;
  v6 = objc_msgSend(v4, "section");
  if (v6 == objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v4, "item");
    if (v7 <= objc_msgSend(v5, "item"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v5, "item") + 1, objc_msgSend(v5, "section"));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
  }

  return v5;
}

- (id)pu_alteredIndexPathAfterInsertingItemsAtIndexPaths:()PhotosUI
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

  v17 = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(v10, "pu_alteredIndexPathAfterInsertingItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
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

- (id)pu_alteredIndexPathAfterDeletingItemAtIndexPath:()PhotosUI
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
  v6 = objc_msgSend(v4, "section");
  if (v6 == objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v4, "item");
    if (v7 == objc_msgSend(v5, "item"))
    {
      v8 = (void *)MEMORY[0x1E0CB36B0];
      v9 = objc_msgSend(v5, "section");
      v10 = v8;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
      objc_msgSend(v10, "indexPathForItem:inSection:", v11, v9);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v15;
      goto LABEL_7;
    }
    v12 = objc_msgSend(v4, "item");
    if (v12 < objc_msgSend(v5, "item"))
    {
      v13 = (void *)MEMORY[0x1E0CB36B0];
      v14 = objc_msgSend(v5, "item") - 1;
      v9 = objc_msgSend(v5, "section");
      v10 = v13;
      v11 = v14;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (id)pu_alteredIndexPathAfterDeletingItemsAtIndexPaths:()PhotosUI
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

  v17 = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(v10, "pu_alteredIndexPathAfterDeletingItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
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

- (id)pu_alteredIndexPathAfterMovingItemAtIndexPath:()PhotosUI toIndexPath:
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
      objc_msgSend(v8, "pu_alteredIndexPathAfterDeletingItemAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "pu_alteredIndexPathAfterInsertingItemAtIndexPath:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v10;
    }

    v8 = v9;
  }

  return v8;
}

- (id)pu_indexPathAfterInsertingItemAtIndexPath:()PhotosUI
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
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NSIndexPath+PhotosUI.m"), 148, CFSTR("can't insert zero-length index path"));
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
    objc_msgSend(v6, "pu_indexPathByChangingIndexAtPosition:toIndex:", v9, v13 + 1);
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

- (id)pu_indexPathAfterDeletingItemAtIndexPath:()PhotosUI
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
    objc_msgSend(v14, "pu_indexPathByChangingIndexAtPosition:toIndex:", v15, v16);
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

- (id)pu_indexPathAfterMovingItemFromIndexPath:()PhotosUI toIndexPath:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    v9 = v8;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqual:", v6))
  {
    v9 = v7;
LABEL_10:

    goto LABEL_11;
  }
  if (!objc_msgSend(v6, "pu_isParentOfIndexPath:", v8))
  {
    objc_msgSend(v8, "pu_indexPathAfterDeletingItemAtIndexPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "pu_indexPathAfterInsertingItemAtIndexPath:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    goto LABEL_10;
  }
  v10 = v7;

  v11 = objc_msgSend(v6, "length");
  if (v11 >= objc_msgSend(v8, "length"))
  {
    v9 = v10;
  }
  else
  {
    do
    {
      objc_msgSend(v10, "indexPathByAddingIndex:", objc_msgSend(v8, "indexAtPosition:", v11));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      ++v11;
      v10 = v9;
    }
    while (v11 < objc_msgSend(v8, "length"));
  }
LABEL_11:

  return v9;
}

- (id)pu_indexPathAfterReloadingItemAtIndexPath:()PhotosUI
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = a1;
  if (objc_msgSend(v4, "pu_isParentOfIndexPath:", v5))
  {
    if (objc_msgSend(v4, "length"))
      v6 = objc_msgSend(v4, "length") - 1;
    else
      v6 = 0;
    objc_msgSend(v5, "pu_indexPathByChangingIndexAtPosition:toIndex:", v6, 0x7FFFFFFFFFFFFFFFLL);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }

  return v5;
}

- (__CFString)pu_shortDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v3; ++i)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "indexAtPosition:", i));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("-"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("∅");
  }
  return v9;
}

+ (id)pu_indexPathsForItems:()PhotosUI inSection:
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
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NSIndexPath_PhotosUI__pu_indexPathsForItems_inSection___block_invoke;
  v10[3] = &unk_1E58A6058;
  v12 = a4;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  return v8;
}

+ (id)pu_indexPathForItem:()PhotosUI inSubSection:section:
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = a5;
  v6[1] = a4;
  v6[2] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)pu_rootIndexPath
{
  return (id)objc_msgSend([a1 alloc], "initWithIndexes:length:", 0, 0);
}

@end
