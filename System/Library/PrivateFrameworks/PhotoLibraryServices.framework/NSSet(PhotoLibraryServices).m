@implementation NSSet(PhotoLibraryServices)

- (id)_pl_firstObjectPassingTest:()PhotoLibraryServices
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pl_filter:()PhotoLibraryServices
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__NSSet_PhotoLibraryServices___pl_filter___block_invoke;
  v8[3] = &unk_1E3671648;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_pl_map:()PhotoLibraryServices
{
  id v3;
  void *v4;
  id v6;

  v6 = a3;
  v3 = v6;
  pl_result_with_autoreleasepool();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  if (objc_msgSend(a1, "count"))
    pl_result_with_autoreleasepool();
  else
    PLEmptyContainerDescription();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
