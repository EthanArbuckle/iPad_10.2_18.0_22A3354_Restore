@implementation PXSearchActiveSearch

- (PXSearchActiveSearch)initWithSearchText:(id)a3 searchTokens:(id)a4 libraryScope:(unint64_t)a5
{
  id v8;
  id v9;
  PXSearchActiveSearch *v10;
  PXSearchActiveSearch *v11;
  uint64_t v12;
  NSString *searchText;
  uint64_t v14;
  NSArray *searchTokens;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchActiveSearch;
  v10 = -[PXSearchActiveSearch init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_libraryScope = a5;
    v12 = objc_msgSend(v8, "copy");
    searchText = v11->_searchText;
    v11->_searchText = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    searchTokens = v11->_searchTokens;
    v11->_searchTokens = (NSArray *)v14;

    -[PXSearchActiveSearch _generateRelatedSearchObjects](v11, "_generateRelatedSearchObjects");
  }

  return v11;
}

- (BOOL)hasSearchText
{
  void *v2;
  BOOL v3;

  -[PXSearchActiveSearch searchText](self, "searchText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)hasSearchTokens
{
  return -[PXSearchActiveSearch searchTokenCount](self, "searchTokenCount") != 0;
}

- (BOOL)isEmpty
{
  if (-[PXSearchActiveSearch hasSearchText](self, "hasSearchText"))
    return 0;
  else
    return !-[PXSearchActiveSearch hasSearchTokens](self, "hasSearchTokens");
}

- (unint64_t)searchTokenCount
{
  void *v2;
  unint64_t v3;

  -[PXSearchActiveSearch searchTokens](self, "searchTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)searchTermCount
{
  _BOOL4 v3;

  v3 = -[PXSearchActiveSearch hasSearchText](self, "hasSearchText");
  return -[PXSearchActiveSearch searchTokenCount](self, "searchTokenCount") + v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXSearchActiveSearch *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXSearchActiveSearch *v10;

  v5 = [PXSearchActiveSearch alloc];
  -[PXSearchActiveSearch searchText](self, "searchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[PXSearchActiveSearch searchTokens](self, "searchTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[PXSearchActiveSearch initWithSearchText:searchTokens:libraryScope:](v5, "initWithSearchText:searchTokens:libraryScope:", v7, v9, -[PXSearchActiveSearch libraryScope](self, "libraryScope"));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSearchActiveSearch;
  if (-[PXSearchActiveSearch isEqual:](&v14, sel_isEqual_, v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = -[PXSearchActiveSearch searchTokenCount](self, "searchTokenCount");
      if (v7 == objc_msgSend(v6, "searchTokenCount")
        && (v8 = -[PXSearchActiveSearch libraryScope](self, "libraryScope"), v8 == objc_msgSend(v6, "libraryScope")))
      {
        -[PXSearchActiveSearch representedObjects](self, "representedObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "representedObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "isEqualToArray:", v10);

        if (-[PXSearchActiveSearch hasSearchText](self, "hasSearchText")
          || objc_msgSend(v6, "hasSearchText"))
        {
          -[PXSearchActiveSearch searchText](self, "searchText");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "searchText");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v5 &= objc_msgSend(v11, "isEqualToString:", v12);

        }
      }
      else
      {
        LOBYTE(v5) = 0;
      }

    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (void)_generateRelatedSearchObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchActiveSearch searchTokenCount](self, "searchTokenCount"))
  {
    v3 = (void *)objc_opt_new();
    -[PXSearchActiveSearch searchTokens](self, "searchTokens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v5)
      goto LABEL_20;
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "representedObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "queryToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
          if (!v9)
            goto LABEL_15;
        }
        else
        {
          PXAssertGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Expected queryToken", v14, 2u);
          }

          if (!v9)
          {
LABEL_15:
            PXAssertGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v14 = 0;
              _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Expected searchTokenRepresentedObject", v14, 2u);
            }
            goto LABEL_17;
          }
        }
        if (!-[PXSearchActiveSearch hasSearchText](self, "hasSearchText") && objc_msgSend(v4, "count") == 1)
        {
          objc_msgSend(v9, "priorityAssetUUID");
          v11 = objc_claimAutoreleasedReturnValue();
          -[PXSearchActiveSearch setPriorityAssetUUID:](self, "setPriorityAssetUUID:", v11);
LABEL_17:

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v6)
      {
LABEL_20:
        v13 = (void *)objc_msgSend(v3, "copy");
        -[PXSearchActiveSearch setRepresentedObjects:](self, "setRepresentedObjects:", v13);

        return;
      }
    }
  }
  -[PXSearchActiveSearch setRepresentedObjects:](self, "setRepresentedObjects:", MEMORY[0x1E0C9AA60]);
}

- (NSString)searchTermsString
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PXSearchActiveSearch searchTokens](self, "searchTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "text", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (-[PXSearchActiveSearch hasSearchText](self, "hasSearchText"))
  {
    -[PXSearchActiveSearch searchText](self, "searchText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v4, (_QWORD)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (void)setSearchTokens:(id)a3
{
  objc_storeStrong((id *)&self->_searchTokens, a3);
}

- (NSArray)representedObjects
{
  return self->_representedObjects;
}

- (void)setRepresentedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_representedObjects, a3);
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (void)setPriorityAssetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, a3);
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_representedObjects, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
}

@end
