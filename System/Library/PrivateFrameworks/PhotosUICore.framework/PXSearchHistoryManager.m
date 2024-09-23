@implementation PXSearchHistoryManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXSearchHistoryManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_180462 != -1)
    dispatch_once(&sharedManager_onceToken_180462, block);
  return (id)sharedManager_s_sharedManager;
}

void __39__PXSearchHistoryManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___PXSearchHistoryManager;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)sharedManager_s_sharedManager;
  sharedManager_s_sharedManager = v1;

}

- (void)clearRecentSearches
{
  -[PXSearchHistoryManager setRecentSearches:](self, "setRecentSearches:", 0);
}

- (void)saveRecentSearch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "supportsRecentSearch") & 1) != 0)
  {
    -[PXSearchHistoryManager recentSearches](self, "recentSearches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (v6)
    {
      -[PXSearchHistoryManager recentSearches](self, "recentSearches");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __43__PXSearchHistoryManager_saveRecentSearch___block_invoke;
      v16 = &unk_1E5132228;
      v17 = v4;
      v8 = v6;
      v18 = v8;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);

    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    objc_msgSend(v8, "insertObject:atIndex:", v4, 0, v13, v14, v15, v16);
    v10 = objc_msgSend(v8, "count");
    if (v10 >= 5)
      v11 = 5;
    else
      v11 = v10;
    objc_msgSend(v8, "subarrayWithRange:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchHistoryManager setRecentSearches:](self, "setRecentSearches:", v12);

  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Search query does not support recent search: %@", buf, 0xCu);
    }

  }
}

- (void)setRecentSearches:(id)a3
{
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXSearchHistoryManager _recentSearchesFileURL](self, "_recentSearchesFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = -[PXSearchHistoryManager _writeRecentSearches:toURL:error:](self, "_writeRecentSearches:toURL:error:", v5, v6, &v11);
  v8 = v11;

  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Saved recent searches", buf, 2u);
    }

    objc_storeStrong((id *)&self->_recentSearches, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("PXSearchHistoryNotificationRecentSearchesDidChange"), self);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Saving recent searches failed, error: %@", buf, 0xCu);
  }

}

- (NSArray)recentSearches
{
  NSArray *recentSearches;
  void *v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  uint8_t v10[16];

  recentSearches = self->_recentSearches;
  if (!recentSearches)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", 0, CFSTR("search.recentlySearched"));

    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to load Recent Searches from disk...", v10, 2u);
    }

    -[PXSearchHistoryManager _recentSearchesFileURL](self, "_recentSearchesFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchHistoryManager _readRecentSearchesFromURL:](self, "_readRecentSearchesFromURL:", v6);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v8 = self->_recentSearches;
    self->_recentSearches = v7;

    recentSearches = self->_recentSearches;
  }
  return recentSearches;
}

- (id)_recentSearchesFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchIndexDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E98];
  v10[0] = v5;
  v10[1] = CFSTR("RecentSearches.plist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPathComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_writeRecentSearches:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  char v16;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v8, "addObject:", v14);
        }
        else
        {
          PLUIGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Not saving Recent Search. Failed to convert Recent Search to Plist.", buf, 2u);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v8, "writeToURL:error:", v7, a5);
  return v16;
}

- (id)_readRecentSearchesFromURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  PXSearchQuery *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t buf[4];
  NSObject *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:error:", v3, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Reading Recent Searches from disk.", buf, 2u);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v8;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v12)
      {
        v13 = v12;
        v21 = v8;
        v22 = v3;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(NSObject **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v17 = -[PXSearchQuery initWithDictionary:]([PXSearchQuery alloc], "initWithDictionary:", v16);
            if (v17)
            {
              objc_msgSend(v4, "addObject:", v17);
            }
            else
            {
              PLUIGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v16;
                _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Failed to initalize RecentSearch with dictionary: %@. Dropping Recent Search from history.", buf, 0xCu);
              }

            }
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        }
        while (v13);
        v3 = v22;
        v8 = v21;
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to read Recent Searches, error: %@", buf, 0xCu);
    }

  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "No Recent Searches found on disk.", buf, 2u);
    }
  }

  v19 = (void *)objc_msgSend(v4, "copy");
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentSearches, 0);
}

uint64_t __43__PXSearchHistoryManager_saveRecentSearch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEquivalentToRecentSearchQuery:", a2);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", a3);
    *a4 = 1;
  }
  return result;
}

@end
