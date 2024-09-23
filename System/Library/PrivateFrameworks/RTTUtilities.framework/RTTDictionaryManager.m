@implementation RTTDictionaryManager

- (RTTDictionaryManager)init
{
  RTTDictionaryManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTTDictionaryManager;
  v2 = -[RTTDictionaryManager init](&v5, sel_init);
  if (v2)
  {
    +[RTTDictionaryManager _availableDictionaryAssetsUsingRemoteInfo:](RTTDictionaryManager, "_availableDictionaryAssetsUsingRemoteInfo:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTDictionaryManager setAvailableDictionaries:](v2, "setAvailableDictionaries:", v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RTTDictionaryManager setAvailableDictionaries:](self, "setAvailableDictionaries:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RTTDictionaryManager;
  -[RTTDictionaryManager dealloc](&v3, sel_dealloc);
}

- (void)downloadIfNeeded
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[RTTDictionaryManager _ttyDictionaryAsset](self, "_ttyDictionaryAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Downloading dictionary: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3 && objc_msgSend(v3, "state") == 1)
  {
    AXLogRTT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Asset not present - downloading", (uint8_t *)&v6, 2u);
    }

    -[RTTDictionaryManager _downloadAsset:](self, "_downloadAsset:", v3);
  }

}

- (void)deleteIfNeeded
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[RTTDictionaryManager _ttyDictionaryAsset](self, "_ttyDictionaryAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    AXLogRTT();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v2;
      _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Deleting dictionary %@", buf, 0xCu);
    }

    if (objc_msgSend(v2, "state") == 4)
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __38__RTTDictionaryManager_deleteIfNeeded__block_invoke;
      v4[3] = &unk_24D203E50;
      v5 = v2;
      objc_msgSend(v5, "cancelDownload:", v4);

    }
    else if (objc_msgSend(v2, "state") == 2)
    {
      objc_msgSend(v2, "purgeWithError:", &__block_literal_global_181);
    }
  }

}

uint64_t __38__RTTDictionaryManager_deleteIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Cancelled asset download with result %li", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "purgeWithError:", &__block_literal_global_1);
}

void __38__RTTDictionaryManager_deleteIfNeeded__block_invoke_177(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Purged asset with result %li, error? %@", (uint8_t *)&v6, 0x16u);
  }

}

void __38__RTTDictionaryManager_deleteIfNeeded__block_invoke_180(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Purged asset with result %li, error? %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_downloadAsset:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v5 = 0;
  if (objc_msgSend(v3, "spaceCheck:", &v5))
  {
    v4 = objc_opt_new();
    -[NSObject setAllowsCellularAccess:](v4, "setAllowsCellularAccess:", 1);
    -[NSObject setDiscretionary:](v4, "setDiscretionary:", 0);
    objc_msgSend(v3, "startDownload:completionWithError:", v4, &__block_literal_global_182);
  }
  else
  {
    AXLogRTT();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v7 = v5;
      _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Space not available to download asset %lli", buf, 0xCu);
    }
  }

}

void __39__RTTDictionaryManager__downloadAsset___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Downloaded asset with result %li, error? %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)_ttyDictionaryAsset
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_availableDictionaries;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "attributes", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("DictionaryPackageName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("TTY Abbreviations Dictionary.dictionary")) & 1) != 0)
        {
          v10 = v7;

          goto LABEL_11;
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)_availableDictionaryAssetsUsingRemoteInfo:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"));
  v4 = objc_msgSend(v3, "queryMetaDataSync");
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Queried asset metadata with result: %ld", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v3, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)availableDictionaries
{
  return self->_availableDictionaries;
}

- (void)setAvailableDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_availableDictionaries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDictionaries, 0);
}

@end
