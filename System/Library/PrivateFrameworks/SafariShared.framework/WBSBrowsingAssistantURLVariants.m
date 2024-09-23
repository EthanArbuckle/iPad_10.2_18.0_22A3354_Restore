@implementation WBSBrowsingAssistantURLVariants

- (WBSBrowsingAssistantURLVariants)initWithURL:(id)a3
{
  id v4;
  WBSBrowsingAssistantURLVariants *v5;
  uint64_t v6;
  NSURL *url;
  WBSBrowsingAssistantURLVariants *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSBrowsingAssistantURLVariants;
  v5 = -[WBSBrowsingAssistantURLVariants init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)variantsForURL:(id)a3
{
  id v3;
  WBSBrowsingAssistantURLVariants *v4;

  v3 = a3;
  v4 = -[WBSBrowsingAssistantURLVariants initWithURL:]([WBSBrowsingAssistantURLVariants alloc], "initWithURL:", v3);

  return v4;
}

- (NSArray)variants
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", self->_url, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfPath");
  objc_msgSend(v4, "substringToIndex:", v5 + v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 6)
  {
    objc_msgSend(v8, "subarrayWithRange:", 0, 5);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (v8)
  {
    -[WBSBrowsingAssistantURLVariants _queryVariantsFromArray:](self, "_queryVariantsFromArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "setQueryItems:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          objc_msgSend(v12, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v19 = objc_msgSend(v11, "indexOfObject:", v4);
    if (v19 && v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "removeObjectAtIndex:", v19);
      objc_msgSend(v11, "insertObject:atIndex:", v4, 0);
    }

    v7 = v21;
  }
  else
  {
    v11 = 0;
  }

  return (NSArray *)v11;
}

- (id)_queryVariantsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    -[WBSBrowsingAssistantURLVariants _queryVariantsFromArray:](self, "_queryVariantsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

            objc_msgSend(v6, "addObject:", v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
