@implementation NSIndexPath(SBIconIndex)

+ (id)indexPathWithIconIndex:()SBIconIndex listIndex:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend(a1, "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sbListIndex
{
  if (objc_msgSend(a1, "length"))
    return objc_msgSend(a1, "indexAtPosition:", 0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)sbIconIndex
{
  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return objc_msgSend(a1, "indexAtPosition:", 1);
}

+ (id)indexPathWithFolderIconIndex:()SBIconIndex folderListIndex:iconIndex:listIndex:
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = a4;
  v7[1] = a3;
  v7[2] = a6;
  v7[3] = a5;
  objc_msgSend(a1, "indexPathWithIndexes:length:", v7, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sb_indexPathWithFolderIconIndex:()SBIconIndex folderListIndex:listIndex:
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = a4;
  v6[1] = a3;
  v6[2] = a5;
  objc_msgSend(a1, "indexPathWithIndexes:length:", v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)sb_iconPathCount
{
  return (unint64_t)objc_msgSend(a1, "length") >> 1;
}

- (uint64_t)sb_lastListIndex
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "length");
  return objc_msgSend(a1, "indexAtPosition:", v2 + (v2 | 0xFFFFFFFFFFFFFFFELL));
}

- (uint64_t)sb_lastIconIndex
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "length");
  if ((v2 & 1) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return objc_msgSend(a1, "indexAtPosition:", v2 - 1);
}

- (id)sb_iconRelativePathComponents
{
  size_t v2;
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  size_t v6;
  _QWORD *v7;
  void *v8;

  v2 = objc_msgSend(a1, "length");
  v3 = malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(a1, "getIndexes:range:", v3, 0, v2);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v2)
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (v2 - 1 == v6)
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", *v7);
        else
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v7, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        v6 += 2;
        v7 += 2;
      }
      while (v6 < v2);
    }
    free(v4);
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)sb_firstIconPathComponent
{
  unint64_t v2;
  _BYTE v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2 == 2)
    return a1;
  if (v2 < 2)
    return 0;
  objc_msgSend(a1, "getIndexes:range:", v4, 0, 2);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v4, 2);
}

- (id)sb_indexPathByRemovingFirstIconPathComponent
{
  size_t v2;
  size_t v3;
  char *v5;
  char *v6;
  void *v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v3 = v2 - 2;
  if (v2 <= 2)
    return objc_alloc_init(MEMORY[0x1E0CB36B0]);
  if (v2 >= 0x10)
  {
    v6 = (char *)malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
    v5 = v6;
  }
  else
  {
    v5 = 0;
    v6 = &v8;
  }
  objc_msgSend(a1, "getIndexes:range:", v6, 2, v3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v6, v3);
  free(v5);
  return v7;
}

- (id)sb_indexPathByRemovingLastIconPathComponent
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "indexPathByRemovingLastIndex");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "indexPathByRemovingLastIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sb_indexPathByRemovingLastIconIndex
{
  id v2;

  if ((objc_msgSend(a1, "length") & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "indexPathByRemovingLastIndex");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)sb_lastIconPathComponent
{
  unint64_t v2;
  _BYTE v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2 == 2)
    return a1;
  if (v2 < 2)
    return 0;
  objc_msgSend(a1, "getIndexes:range:", v4, v2 - 2, 2);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v4, 2);
}

- (id)sb_indexPathByAddingIndexPath:()SBIconIndex
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_msgSend(v4, "length");
  v7 = v5 + v6;
  if (__CFADD__(v5, v6) || (v8 = v6, (v9 = (char *)malloc_type_calloc(v5 + v6, 8uLL, 0x100004000313F17uLL)) == 0))
  {
    v11 = 0;
  }
  else
  {
    v10 = v9;
    objc_msgSend(a1, "getIndexes:range:", v9, 0, v5);
    objc_msgSend(v4, "getIndexes:range:", &v10[8 * v5], 0, v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v10, v7);
    free(v10);
  }

  return v11;
}

- (id)sb_indexPathByAddingPathComponentWithListIndex:()SBIconIndex iconIndex:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sb_indexPathByAddingIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)sb_isOnSameListAsIndexPath:()SBIconIndex
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "sb_indexPathByRemovingLastIconIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_indexPathByRemovingLastIconIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

- (id)sb_indexPathByReplacingLastIconIndex:()SBIconIndex
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "sb_indexPathByRemovingLastIconIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathByAddingIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sb_iconPathDescription
{
  void *v2;
  size_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t i;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v4 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1, "getIndexes:range:", v4, 0, v3);
    if (v3)
    {
      for (i = 0; i != v3; ++i)
      {
        if ((i & 1) != 0)
          v7 = CFSTR(" - %lu");
        else
          v7 = CFSTR(" / %lu");
        if (i)
          v8 = v7;
        else
          v8 = CFSTR("%lu");
        objc_msgSend(v2, "appendFormat:", v8, v5[i]);
      }
    }
    free(v5);
  }
  return v2;
}

@end
