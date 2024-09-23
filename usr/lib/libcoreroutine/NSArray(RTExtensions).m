@implementation NSArray(RTExtensions)

- (id)flatten
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (id)objc_msgSend(a1, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)objc_opt_class();
        if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v15))
        {
          objc_msgSend(v8, "flatten");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v10);
LABEL_13:

          goto LABEL_14;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "allObjects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
          v10 = v11;
          objc_msgSend(v11, "flatten");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v12);

          goto LABEL_13;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "allValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        objc_msgSend(v2, "addObject:", v8);
LABEL_14:
        ++v7;
      }
      while (v5 != v7);
      v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v5 = v13;
    }
    while (v13);
  }

  return v2;
}

- (id)shuffle
{
  void *v1;
  unint64_t v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  if (v2 >= 2)
  {
    do
    {
      v3 = v2 - 1;
      objc_msgSend(v1, "exchangeObjectAtIndex:withObjectAtIndex:", v2 - 1, arc4random_uniform(v2));
      v2 = v3;
    }
    while (v3 > 1);
  }
  return v1;
}

@end
