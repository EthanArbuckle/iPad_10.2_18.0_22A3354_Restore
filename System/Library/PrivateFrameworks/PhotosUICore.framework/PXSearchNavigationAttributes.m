@implementation PXSearchNavigationAttributes

+ (id)attributesForURLComponents:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id *v17;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = a3;
  objc_msgSend(v20, "queryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {
    obj = 0;
    v6 = (void *)MEMORY[0x1E0C9AA60];
    v8 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  v5 = v4;
  obj = 0;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = *(_QWORD *)v23;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("searchTerm")))
      {
        objc_msgSend(v10, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
        v13 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v13;
      }
      else if (objc_msgSend(v11, "isEqualToString:", CFSTR("searchCategory")))
      {
        objc_msgSend(v10, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
        v14 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v14;
      }
      else
      {
        if (!objc_msgSend(v11, "isEqualToString:", CFSTR("completionKey")))
          goto LABEL_13;
        objc_msgSend(v10, "value");
        v12 = obj;
        obj = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_13:
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v5);
LABEL_17:

  if (objc_msgSend(v8, "count"))
  {
    v15 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v15 + 1, v8);
    objc_storeStrong(v15 + 2, v6);
    v16 = obj;
    objc_storeStrong(v15 + 4, obj);
  }
  else
  {
    v15 = 0;
    v16 = obj;
  }
  v17 = v15;

  return v17;
}

+ (id)attributesWithGenericSearchTerm:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init((Class)a1);
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v5[2];
    v5[2] = v9;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)attributesWithGenericSearchText:(id)a3
{
  id v5;
  id *v6;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v6 + 3, a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (NSArray)searchCategories
{
  return self->_searchCategories;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSString)completionKey
{
  return self->_completionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionKey, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchCategories, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end
