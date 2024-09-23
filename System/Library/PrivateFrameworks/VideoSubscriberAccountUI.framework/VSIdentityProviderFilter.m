@implementation VSIdentityProviderFilter

- (VSIdentityProviderFilter)init
{
  VSIdentityProviderFilter *v2;
  VSIdentityProviderFilter *v3;
  NSArray *allIdentityProviders;
  NSArray *v5;
  NSArray *supportedAccountProviderIDs;
  NSArray *supportedIdentityProviders;
  NSString *searchQuery;
  VSTrie *v9;
  VSTrie *searchTree;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VSIdentityProviderFilter;
  v2 = -[VSIdentityProviderFilter init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    allIdentityProviders = v2->_allIdentityProviders;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_allIdentityProviders = (NSArray *)MEMORY[0x24BDBD1A8];

    supportedAccountProviderIDs = v3->_supportedAccountProviderIDs;
    v3->_supportedAccountProviderIDs = v5;

    supportedIdentityProviders = v3->_supportedIdentityProviders;
    v3->_supportedIdentityProviders = v5;

    searchQuery = v3->_searchQuery;
    v3->_searchQuery = (NSString *)&stru_24FE1B848;

    v9 = (VSTrie *)objc_alloc_init(MEMORY[0x24BDF8CB0]);
    searchTree = v3->_searchTree;
    v3->_searchTree = v9;

  }
  return v3;
}

- (id)_camelAndWordBasedPrefixesForProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = v3;
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_msgSend(v6, "length");
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __66__VSIdentityProviderFilter__camelAndWordBasedPrefixesForProvider___block_invoke;
  v35[3] = &unk_24FE19AB8;
  v9 = v7;
  v36 = v9;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v35);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = objc_msgSend(v9, "count");
  v13 = v12 - 1;
  if (v12 != 1)
  {
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v13 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == 1)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", v13 - 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v14, "vs_composedCharacterIsWhitespace");
      if (objc_msgSend(v15, "vs_composedCharacterIsLowercase"))
      {
        v18 = objc_msgSend(v14, "vs_composedCharacterIsUppercase");
        if (!v16)
          goto LABEL_15;
      }
      else
      {
        v18 = 0;
        if (!v16)
        {
LABEL_15:
          v20 = v13;
          if (!v17)
            goto LABEL_12;
          goto LABEL_11;
        }
      }
      v19 = objc_msgSend(v16, "vs_composedCharacterIsWhitespace");
      if ((v18 & (v19 ^ 1)) != 0)
        v20 = v13 - 1;
      else
        v20 = v13;
      if (((v18 & (v19 ^ 1) | v17) & 1) == 0)
        goto LABEL_12;
LABEL_11:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v21);

LABEL_12:
      --v13;
    }
    while (v13);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "unsignedIntegerValue");
        objc_msgSend(v6, "substringWithRange:", v27, objc_msgSend(v6, "length") - v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v24);
  }

  return v4;
}

void __66__VSIdentityProviderFilter__camelAndWordBasedPrefixesForProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The substring parameter must not be nil."));
    v3 = 0;
  }
  objc_msgSend(v4, "addObject:", v3);

}

- (void)_refreshProviderList
{
  VSIdentityProviderFilter *v2;
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *__ptr32 *v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  id v24;
  NSArray *supportedIdentityProviders;
  NSArray *v26;
  void *v27;
  VSIdentityProviderFilter *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v2 = self;
  v45 = *MEMORY[0x24BDAC8D0];
  -[VSIdentityProviderFilter allIdentityProviders](self, "allIdentityProviders");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderFilter supportedAccountProviderIDs](v2, "supportedAccountProviderIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = MEMORY[0x24BDAC760];
  v7 = &off_230422000;
  if (v5)
  {
    v28 = v2;
    v29 = v4;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithArray:", v4);
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v3;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v14, "providerID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = v6;
          v36[1] = 3221225472;
          v36[2] = __48__VSIdentityProviderFilter__refreshProviderList__block_invoke;
          v36[3] = &unk_24FE19AE0;
          v37 = v8;
          v38 = v14;
          objc_msgSend(v15, "conditionallyUnwrapObject:", v36);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v11);
    }

    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v27;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v19);
    }

    v3 = (NSArray *)objc_msgSend(v16, "copy");
    v2 = v28;
    v4 = v29;
    v7 = &off_230422000;
  }
  v23 = objc_alloc_init(MEMORY[0x24BDF8CB0]);
  v30[0] = v6;
  v30[1] = *((_QWORD *)v7 + 187);
  v30[2] = __48__VSIdentityProviderFilter__refreshProviderList__block_invoke_2;
  v30[3] = &unk_24FE19B08;
  v30[4] = v2;
  v31 = v23;
  v24 = v23;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v30);
  -[VSIdentityProviderFilter setSearchTree:](v2, "setSearchTree:", v24);
  supportedIdentityProviders = v2->_supportedIdentityProviders;
  v2->_supportedIdentityProviders = v3;
  v26 = v3;

}

uint64_t __48__VSIdentityProviderFilter__refreshProviderList__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

void __48__VSIdentityProviderFilter__refreshProviderList__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_camelAndWordBasedPrefixesForProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertString:withAssociatedObject:", v10, v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)setAllIdentityProviders:(id)a3
{
  objc_storeStrong((id *)&self->_allIdentityProviders, a3);
  -[VSIdentityProviderFilter _refreshProviderList](self, "_refreshProviderList");
}

- (void)setSupportedAccountProviderIDs:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAccountProviderIDs, a3);
  -[VSIdentityProviderFilter _refreshProviderList](self, "_refreshProviderList");
}

+ (id)keyPathsForValuesAffectingFilteredIdentityProviders
{
  if (keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_predicate, &__block_literal_global_2);
  return (id)keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_variable;
}

void __79__VSIdentityProviderFilter_keyPathsForValuesAffectingFilteredIdentityProviders__block_invoke()
{
  uint64_t v0;
  void *v1;

  __79__VSIdentityProviderFilter_keyPathsForValuesAffectingFilteredIdentityProviders__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_variable;
  keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_variable = v0;

}

id __79__VSIdentityProviderFilter_keyPathsForValuesAffectingFilteredIdentityProviders__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v0, "addObject:", CFSTR("supportedAccountProviderIDs"));
  objc_msgSend(v0, "addObject:", CFSTR("searchQuery"));
  objc_msgSend(v0, "addObject:", CFSTR("allIdentityProviders"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (NSArray)filteredIdentityProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[VSIdentityProviderFilter supportedIdentityProviders](self, "supportedIdentityProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderFilter searchQuery](self, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[VSIdentityProviderFilter searchTree](self, "searchTree");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsMatchingPrefix:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithArray:", v7);
    objc_msgSend(v8, "array");
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }

  return (NSArray *)v3;
}

- (NSArray)allIdentityProviders
{
  return self->_allIdentityProviders;
}

- (NSArray)supportedAccountProviderIDs
{
  return self->_supportedAccountProviderIDs;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)supportedIdentityProviders
{
  return self->_supportedIdentityProviders;
}

- (void)setSupportedIdentityProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (VSTrie)searchTree
{
  return self->_searchTree;
}

- (void)setSearchTree:(id)a3
{
  objc_storeStrong((id *)&self->_searchTree, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTree, 0);
  objc_storeStrong((id *)&self->_supportedIdentityProviders, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_supportedAccountProviderIDs, 0);
  objc_storeStrong((id *)&self->_allIdentityProviders, 0);
}

@end
