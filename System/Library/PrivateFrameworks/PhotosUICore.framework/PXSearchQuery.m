@implementation PXSearchQuery

- (PXSearchQuery)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQuery.m"), 33, CFSTR("%s is not available as initializer"), "-[PXSearchQuery init]");

  abort();
}

- (PXSearchQuery)initWithSearchText:(id)a3 searchTokens:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 options:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXSearchQuery *v17;
  uint64_t v18;
  NSString *searchText;
  uint64_t v20;
  NSArray *searchTokens;
  uint64_t v22;
  PXSearchQueryOptions *options;
  uint64_t v24;
  NSSet *scopedSearchIdentifiers;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *priorityAssetUUID;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQuery.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchTokens"));

    if (v16)
      goto LABEL_4;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQuery.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchText"));

  if (!v14)
    goto LABEL_18;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQuery.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_4:
  v37.receiver = self;
  v37.super_class = (Class)PXSearchQuery;
  v17 = -[PXSearchQuery init](&v37, sel_init);
  if (!v17)
    goto LABEL_14;
  v18 = objc_msgSend(v13, "copy");
  searchText = v17->_searchText;
  v17->_searchText = (NSString *)v18;

  v20 = objc_msgSend(v14, "copy");
  searchTokens = v17->_searchTokens;
  v17->_searchTokens = (NSArray *)v20;

  v22 = objc_msgSend(v16, "copy");
  options = v17->_options;
  v17->_options = (PXSearchQueryOptions *)v22;

  v24 = objc_msgSend(v15, "copy");
  scopedSearchIdentifiers = v17->_scopedSearchIdentifiers;
  v17->_scopedSearchIdentifiers = (NSSet *)v24;

  v17->_searchResultTypes = a6;
  v26 = objc_msgSend(v13, "length");
  if (objc_msgSend(v13, "length"))
  {
    if (!v26)
      goto LABEL_11;
    goto LABEL_9;
  }
  v27 = objc_msgSend(v14, "count");
  if (v26)
  {
LABEL_9:
    v28 = 1;
    goto LABEL_10;
  }
  if (!v27)
    goto LABEL_11;
  v28 = 2;
LABEL_10:
  v17->_searchSuggestionType = v28;
LABEL_11:
  if (!objc_msgSend(v13, "length") && objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "priorityAssetUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    priorityAssetUUID = v17->_priorityAssetUUID;
    v17->_priorityAssetUUID = (NSString *)v31;

  }
LABEL_14:

  return v17;
}

- (PXSearchQuery)initWithDictionary:(id)a3
{
  id v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PXNewSearchToken *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  PXSearchQueryOptions *v17;
  PXSearchQuery *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RepresentedObjects"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = -[__CFString countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = [PXNewSearchToken alloc];
        v13 = -[PXNewSearchToken initWithDictionaryRepresentation:](v12, "initWithDictionaryRepresentation:", v11, (_QWORD)v20);
        if (!v13)
        {
          PLUIGetLog();
          v17 = (PXSearchQueryOptions *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, &v17->super, OS_LOG_TYPE_ERROR, "Failed to initialize PXNewSearchToken from represented object for Recent Search. Unable to initalize PXSearchQuery.", buf, 2u);
          }
          v18 = 0;
          v15 = v6;
          goto LABEL_19;
        }
        v14 = (void *)v13;
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[__CFString countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SearchText"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    PXAssertGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Unexpected nil search text for recent search dict: %@.", buf, 0xCu);
    }

    v15 = &stru_1E5149688;
  }
  if (-[__CFString length](v15, "length", (_QWORD)v20) || objc_msgSend(v5, "count"))
  {
    v17 = objc_alloc_init(PXSearchQueryOptions);
    self = -[PXSearchQuery initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:](self, "initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:", v15, v5, 0, 3, v17);
    v18 = self;
  }
  else
  {
    PXAssertGetLog();
    v17 = (PXSearchQueryOptions *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, &v17->super, OS_LOG_TYPE_ERROR, "Initialized an empty PXSearchQuery for Recent Search.", buf, 2u);
    }
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXSearchQuery searchText](self, "searchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SearchText"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXSearchQuery searchTokens](self, "searchTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "dictionaryRepresentation");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          PLUIGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to convert PXNewSearchToken to Dictionary", v17, 2u);
          }

          v14 = 0;
          goto LABEL_15;
        }
        v12 = (void *)v11;
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("RepresentedObjects"));

  v14 = (void *)objc_msgSend(v3, "copy");
LABEL_15:

  return v14;
}

- (NSArray)queryTokens
{
  void *v2;
  void *v3;

  -[PXSearchQuery searchTokens](self, "searchTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)localizedQueryString
{
  return (NSString *)-[PXSearchQuery localizedQueryStringWithQuotationDelimitersForSearchText:](self, "localizedQueryStringWithQuotationDelimitersForSearchText:", 0);
}

- (id)localizedQueryStringWithQuotationDelimitersForSearchText:(BOOL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v19 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PXSearchQuery searchTokens](self, "searchTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "queryToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v10, "attributedTitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "string");
          v14 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v4, "addObject:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[PXSearchQuery searchText](self, "searchText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchDisplayUtility localizedListStringFromSearchTokenNames:searchText:includeQuotationDelimitersForSearchText:](PXSearchDisplayUtility, "localizedListStringFromSearchTokenNames:searchText:includeQuotationDelimitersForSearchText:", v4, v16, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)hasSearchText
{
  void *v2;
  BOOL v3;

  -[PXSearchQuery searchText](self, "searchText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isEmpty
{
  BOOL v3;
  void *v4;

  if (-[PXSearchQuery hasSearchText](self, "hasSearchText"))
    return 0;
  -[PXSearchQuery searchTokens](self, "searchTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") == 0;

  return v3;
}

- (unint64_t)searchTermCount
{
  _BOOL4 v3;
  void *v4;
  unint64_t v5;

  v3 = -[PXSearchQuery hasSearchText](self, "hasSearchText");
  -[PXSearchQuery searchTokens](self, "searchTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + v3;

  return v5;
}

- (BOOL)supportsRecentSearch
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXSearchQuery searchTokens](self, "searchTokens", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isPersistable"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  -[PXSearchQuery localizedQueryString](self, "localizedQueryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Query String: %@\n"), v6);

  -[PXSearchQuery searchText](self, "searchText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Search Text: %@\n"), v7);

  -[PXSearchQuery searchTokens](self, "searchTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Search Tokens: %@\n"), v8);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXSearchQuery *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXSearchQuery *v12;

  v5 = [PXSearchQuery alloc];
  -[PXSearchQuery searchText](self, "searchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[PXSearchQuery searchTokens](self, "searchTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[PXSearchQuery options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  v12 = -[PXSearchQuery initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:](v5, "initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:", v7, v9, 0, 3, v11);

  return v12;
}

- (BOOL)isEquivalentToRecentSearchQuery:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXSearchQuery localizedQueryString](self, "localizedQueryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedQueryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v7) == 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXSearchQuery *v4;
  PXSearchQuery *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  char v18;

  v4 = (PXSearchQuery *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXSearchQuery searchTermCount](self, "searchTermCount");
      v7 = -[PXSearchQuery searchTermCount](v5, "searchTermCount");
      -[PXSearchQuery queryTokens](self, "queryTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchQuery queryTokens](v5, "queryTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToArray:", v9);

      -[PXSearchQuery searchText](self, "searchText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchQuery searchText](v5, "searchText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
        v13 = 1;
      else
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

      -[PXSearchQuery options](self, "options");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchQuery options](v5, "options");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (v6 == v7)
        v18 = v10;
      else
        v18 = 0;
      v14 = v18 & v13 & v17;

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXSearchQuery searchTokens](self, "searchTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXSearchQuery searchText](self, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (PXSearchQueryOptions)options
{
  return self->_options;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (NSSet)scopedSearchIdentifiers
{
  return self->_scopedSearchIdentifiers;
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (unint64_t)searchResultTypes
{
  return self->_searchResultTypes;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_scopedSearchIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t __28__PXSearchQuery_queryTokens__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryToken");
}

@end
