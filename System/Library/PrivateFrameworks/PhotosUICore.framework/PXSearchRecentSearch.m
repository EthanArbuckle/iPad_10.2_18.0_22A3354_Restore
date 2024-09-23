@implementation PXSearchRecentSearch

- (PXSearchRecentSearch)initWithRepresentedObjects:(id)a3 searchText:(id)a4
{
  id v6;
  id v7;
  PXSearchRecentSearch *v8;
  uint64_t v9;
  NSArray *representedObjects;
  uint64_t v11;
  PXSearchRecentSearch *searchText;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXSearchRecentSearch;
  v8 = -[PXSearchRecentSearch init](&v14, sel_init);
  if (v8)
  {
    if (+[PXSearchRecentSearch _isSupportedRepresentedObjects:](PXSearchRecentSearch, "_isSupportedRepresentedObjects:", v6))
    {
      v9 = objc_msgSend(v6, "copy");
      representedObjects = v8->_representedObjects;
      v8->_representedObjects = (NSArray *)v9;

      v11 = objc_msgSend(v7, "copy");
      searchText = (PXSearchRecentSearch *)v8->_searchText;
      v8->_searchText = (NSString *)v11;
    }
    else
    {
      searchText = v8;
      v8 = 0;
    }

  }
  return v8;
}

- (PXSearchRecentSearch)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PXSearchTokenRepresentedObject *v12;
  PXSearchTokenRepresentedObject *v13;
  PXSearchRecentSearch *v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SearchText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RepresentedObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = -[PXSearchTokenRepresentedObject initWithDictionary:]([PXSearchTokenRepresentedObject alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
        if (!v12)
        {
          PLUIGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to initalize PXSearchTokenRepresentedObject for Recent Search. Unable to initalize PXSearchRecentSearch.", v17, 2u);
          }

          v14 = 0;
          goto LABEL_13;
        }
        v13 = v12;
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  self = -[PXSearchRecentSearch initWithRepresentedObjects:searchText:](self, "initWithRepresentedObjects:searchText:", v6, v5);
  v14 = self;
LABEL_13:

  return v14;
}

- (id)dictionaryForArchiving
{
  void *v3;
  void *v4;
  void *v5;
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
  v3 = (void *)objc_opt_new();
  -[PXSearchRecentSearch searchText](self, "searchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SearchText"));
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXSearchRecentSearch representedObjects](self, "representedObjects");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "dictionaryForArchiving");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          PLUIGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to convert SearchTokenRepresentedObject to Dictionary", v17, 2u);
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

- (BOOL)isEqual:(id)a3
{
  PXSearchRecentSearch *v4;
  PXSearchRecentSearch *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (PXSearchRecentSearch *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSearchRecentSearch title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchRecentSearch title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v7) == 0;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXSearchRecentSearch representedObjects](self, "representedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXSearchRecentSearch searchText](self, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PXLocalizedStringFromTable(CFSTR("SEARCH_CATEGORY_DELIMITER"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PXSearchRecentSearch representedObjects](self, "representedObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "length"))
          objc_msgSend(v4, "appendString:", v3);
        objc_msgSend(v4, "appendString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[PXSearchRecentSearch searchText](self, "searchText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v4, "appendString:", v3);
    -[PXSearchRecentSearch searchText](self, "searchText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v13);

  }
  return (NSString *)v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  -[PXSearchRecentSearch title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Title: %@\n"), v6);

  -[PXSearchRecentSearch representedObjects](self, "representedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("RepresentedObjects: %@\n"), v7);

  -[PXSearchRecentSearch searchText](self, "searchText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("SearchText: %@\n"), v8);

  return v3;
}

- (PXSearchRecentSearch)initWithCoder:(id)a3
{
  id v4;
  PXSearchRecentSearch *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *representedObjects;
  uint64_t v11;
  PXSearchRecentSearch *searchText;
  NSObject *v13;
  NSArray *v14;
  objc_super v16;
  uint8_t buf[4];
  NSArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXSearchRecentSearch;
  v5 = -[PXSearchRecentSearch init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("RepresentedObjects"));
    v9 = objc_claimAutoreleasedReturnValue();
    representedObjects = v5->_representedObjects;
    v5->_representedObjects = (NSArray *)v9;

    if (+[PXSearchRecentSearch _isSupportedRepresentedObjects:](PXSearchRecentSearch, "_isSupportedRepresentedObjects:", v5->_representedObjects))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SearchText"));
      v11 = objc_claimAutoreleasedReturnValue();
      searchText = (PXSearchRecentSearch *)v5->_searchText;
      v5->_searchText = (NSString *)v11;
    }
    else
    {
      PLUIGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v5->_representedObjects;
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Validation failed for decoded search tokens: %@", buf, 0xCu);
      }

      searchText = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PXAssertGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1A6789000, v3, OS_LOG_TYPE_FAULT, "Encoding Recent Searches is no longer supported.", v4, 2u);
  }

}

- (PXSearchRecentSearch)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchRecentSearch.m"), 175, CFSTR("%s is not available as initializer"), "-[PXSearchRecentSearch init]");

  abort();
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSArray)representedObjects
{
  return self->_representedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedObjects, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
}

+ (BOOL)_isSupportedRepresentedObjects:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "title", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        if (!v9)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchRecentSearch.m"), 171, CFSTR("%s is not available as initializer"), "+[PXSearchRecentSearch new]");

  abort();
}

@end
