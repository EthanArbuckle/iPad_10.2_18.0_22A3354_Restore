@implementation NSArray(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  id v14;

  v14 = a4;
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    v7 = v6;
    v8 = a1;
    v9 = v8;
    if ((a3 & 8) != 0)
    {
      objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_171);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_ICSStringWithOptions:appendingToString:", a3, v14);

    if (v7 >= 2)
    {
      for (i = 1; i != v7; ++i)
      {
        objc_msgSend(v14, "appendString:", CFSTR(","));
        objc_msgSend(v9, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_ICSStringWithOptions:appendingToString:", a3, v14);

      }
    }

  }
}

- (void)_ICSParametersAppendingToString:()ICSWriter
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(a1, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = v4 - 1;
    do
    {
      objc_msgSend(a1, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "absoluteString");
      else
        objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_ICSStringForParameterValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v10);

      if (v6 < v7)
        objc_msgSend(v11, "appendString:", CFSTR(","));

      ++v6;
    }
    while (v5 != v6);
  }

}

- (void)_ICSStringsForPropertyValuesWithOptions:()ICSWriter appendingToString:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if ((v10 & 1) != 0)
          objc_msgSend(v6, "appendString:", CFSTR(","), (_QWORD)v15);
        objc_msgSend(v13, "_ICSStringForProperyValue", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_ICSStringWithOptions:appendingToString:", a3, v6);

        ++v12;
        v10 = 1;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

@end
