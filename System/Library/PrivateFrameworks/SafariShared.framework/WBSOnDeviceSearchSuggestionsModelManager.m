@implementation WBSOnDeviceSearchSuggestionsModelManager

+ (WBSOnDeviceSearchSuggestionsModelManager)sharedManager
{
  if (sharedManager_onceToken_3 != -1)
    dispatch_once(&sharedManager_onceToken_3, &__block_literal_global_77);
  return (WBSOnDeviceSearchSuggestionsModelManager *)(id)sharedManager_sharedManager_2;
}

void __57__WBSOnDeviceSearchSuggestionsModelManager_sharedManager__block_invoke()
{
  WBSOnDeviceSearchSuggestionsModelManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSOnDeviceSearchSuggestionsModelManager);
  v1 = (void *)sharedManager_sharedManager_2;
  sharedManager_sharedManager_2 = (uint64_t)v0;

}

- (WBSOnDeviceSearchSuggestionsModelManager)init
{
  WBSOnDeviceSearchSuggestionsModelManager *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  NSMutableDictionary *localeIdentifiersToChecksums;
  WBSOnDeviceSearchSuggestionsModelManager *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WBSOnDeviceSearchSuggestionsModelManager;
  v2 = -[WBSOnDeviceSearchSuggestionsModelManager init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    urlForOfflineSearchDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "safari_ensureDirectoryExists:", v4);

    urlForOfflineSearchModelPlist();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfURL:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupportedLocales"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSOnDeviceSearchSuggestionsModelManager updateSupportedModelLocales:](v2, "updateSupportedModelLocales:", v11);

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DownloadedModels"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
      else
        v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      localeIdentifiersToChecksums = v2->_localeIdentifiersToChecksums;
      v2->_localeIdentifiersToChecksums = v13;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v2->_localeIdentifiersToChecksums;
      v2->_localeIdentifiersToChecksums = (NSMutableDictionary *)v14;
    }

    v16 = v2;
  }

  return v2;
}

- (BOOL)needsSupportedLocaleUpdate
{
  return -[NSSet count](self->_supportedLocaleIdentifiers, "count") == 0;
}

- (void)addOrUpdateModelForLocale:(id)a3 withChecksum:(id)a4
{
  NSMutableDictionary *localeIdentifiersToChecksums;
  id v7;
  void *v8;

  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  v7 = a4;
  objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](localeIdentifiersToChecksums, "setObject:forKeyedSubscript:", v7, v8);

  -[WBSOnDeviceSearchSuggestionsModelManager _updateModelFileOnDisk](self, "_updateModelFileOnDisk");
}

- (void)updateSupportedModelLocales:(id)a3
{
  NSSet *v4;
  NSSet *supportedLocaleIdentifiers;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedLocaleIdentifiers = self->_supportedLocaleIdentifiers;
    self->_supportedLocaleIdentifiers = v4;

    -[WBSOnDeviceSearchSuggestionsModelManager _updateModelFileOnDisk](self, "_updateModelFileOnDisk");
  }

}

- (void)clearModels
{
  void *v3;
  void *v4;
  NSSet *supportedLocaleIdentifiers;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  urlForOfflineSearchDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_removeContentsOfDirectory:", v4);

  -[NSMutableDictionary removeAllObjects](self->_localeIdentifiersToChecksums, "removeAllObjects");
  supportedLocaleIdentifiers = self->_supportedLocaleIdentifiers;
  self->_supportedLocaleIdentifiers = 0;

}

- (id)fileURLForModelWithLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  urlForOfflineSearchDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "safari_localeStringInOfflineSearchModelFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.bin"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fileURLForModelWithLocaleIfDownloaded:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[WBSOnDeviceSearchSuggestionsModelManager haveModelForLocale:](self, "haveModelForLocale:", v4))
  {
    -[WBSOnDeviceSearchSuggestionsModelManager fileURLForModelWithLocale:](self, "fileURLForModelWithLocale:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)haveModelForLocale:(id)a3
{
  NSMutableDictionary *localeIdentifiersToChecksums;
  void *v4;
  void *v5;

  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](localeIdentifiersToChecksums, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(localeIdentifiersToChecksums) = v5 != 0;

  return (char)localeIdentifiersToChecksums;
}

- (BOOL)isLocaleSupported:(id)a3
{
  NSSet *supportedLocaleIdentifiers;
  void *v4;

  supportedLocaleIdentifiers = self->_supportedLocaleIdentifiers;
  objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(supportedLocaleIdentifiers) = -[NSSet containsObject:](supportedLocaleIdentifiers, "containsObject:", v4);

  return (char)supportedLocaleIdentifiers;
}

- (id)currentChecksumForModelWithLocale:(id)a3
{
  NSMutableDictionary *localeIdentifiersToChecksums;
  void *v4;
  void *v5;

  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](localeIdentifiersToChecksums, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateModelFileOnDisk
{
  WBSCoalescedAsynchronousWriter *asyncWriter;
  id v4;
  void *v5;
  WBSCoalescedAsynchronousWriter *v6;
  WBSCoalescedAsynchronousWriter *v7;
  _QWORD v8[5];

  asyncWriter = self->_asyncWriter;
  if (!asyncWriter)
  {
    v4 = objc_alloc(MEMORY[0x1E0D89BC0]);
    urlForOfflineSearchModelPlist();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke;
    v8[3] = &unk_1E4B3D478;
    v8[4] = self;
    v6 = (WBSCoalescedAsynchronousWriter *)objc_msgSend(v4, "initWithName:fileURL:dataSourceBlock:", CFSTR("OfflineModelPlist"), v5, v8);
    v7 = self->_asyncWriter;
    self->_asyncWriter = v6;

    asyncWriter = self->_asyncWriter;
  }
  -[WBSCoalescedAsynchronousWriter scheduleWrite](asyncWriter, "scheduleWrite");
}

id __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v1 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(*(id *)(a1 + 32), "_dictionaryToSave");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v1, "dataWithPropertyList:format:options:error:", v2, 200, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke_cold_1(v5, v4);
  }

  return v3;
}

- (id)_dictionaryToSave
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *localeIdentifiersToChecksums;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("SupportedLocales");
  -[NSSet allObjects](self->_supportedLocaleIdentifiers, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = v3;
  v9[1] = CFSTR("DownloadedModels");
  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  if (!localeIdentifiersToChecksums)
    localeIdentifiersToChecksums = (NSMutableDictionary *)MEMORY[0x1E0C9AA70];
  v10[0] = v5;
  v10[1] = localeIdentifiersToChecksums;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_asyncWriter, 0);
  objc_storeStrong((id *)&self->_localeIdentifiersToChecksums, 0);
}

void __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Failed to serialize OfflineSearch plist: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
