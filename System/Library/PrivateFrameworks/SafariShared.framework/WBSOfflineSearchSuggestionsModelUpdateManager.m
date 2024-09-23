@implementation WBSOfflineSearchSuggestionsModelUpdateManager

- (void)_doUpdates
{
  if (self->_googleWasADefaultSearchProvider && !self->_googleIsADefaultSearchProvider
    || self->_offlineSuggestionsRemotelyDisabled)
  {
    -[WBSOfflineSearchSuggestionsModelUpdateManager _clearModels](self, "_clearModels");
  }
  else if (-[WBSOfflineSearchSuggestionsModelUpdateManager _shouldCheckForModelUpdates](self, "_shouldCheckForModelUpdates"))
  {
    -[WBSOfflineSearchSuggestionsModelUpdateManager _checkForModelUpdates](self, "_checkForModelUpdates");
  }
}

- (BOOL)_shouldCheckForModelUpdates
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL result;
  const char *v10;
  uint8_t *v11;
  _BOOL4 v12;
  __int16 v13;
  uint8_t buf[2];

  if (self->_googleIsADefaultSearchProvider)
  {
    if (!self->_googleWasADefaultSearchProvider)
      return 1;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", self->_lastUsedLocaleIdentifier);

    if (!v5)
      return 1;
    -[WBSOfflineSearchSuggestionsModelUpdateManager _timeIntervalSinceLastUpdate](self, "_timeIntervalSinceLastUpdate");
    if (v6 >= 604800.0)
      return 1;
    v7 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v8)
      return result;
    v13 = 0;
    v10 = "Deferring check for offline model updates. Last check was within a week";
    v11 = (uint8_t *)&v13;
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v12)
      return result;
    *(_WORD *)buf = 0;
    v10 = "Search Provider does not offer offline search suggestions";
    v11 = buf;
  }
  _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
  return 0;
}

- (double)_timeIntervalSinceLastUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("WBSOfflineSearchSuggestionsModelLastUpdateDateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    -[NSDateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v6;
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v13 = v12;

  return v13;
}

- (void)checkForModelUpdatesOrRemoteDisablementIfNeeded
{
  void *v3;
  _QWORD v4[5];

  +[WBSOfflineSearchRemoteDisablementManager sharedManager](WBSOfflineSearchRemoteDisablementManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke;
  v4[3] = &unk_1E4B3D2F8;
  v4[4] = self;
  objc_msgSend(v3, "areOfflineSearchSuggestionsDisabled:", v4);

}

- (WBSOfflineSearchSuggestionsModelUpdateManager)init
{
  WBSOfflineSearchSuggestionsModelUpdateManager *v2;
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;
  void *v5;
  uint64_t v6;
  NSString *lastUsedLocaleIdentifier;
  void *v8;
  void *v9;
  WBSOfflineSearchSuggestionsModelUpdateManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WBSOfflineSearchSuggestionsModelUpdateManager;
  v2 = -[WBSOfflineSearchSuggestionsModelUpdateManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    -[NSDateFormatter setDateFormat:](v2->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmm"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("WBSOfflineSearchSuggestionsModelLastUsedLocaleIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUsedLocaleIdentifier = v2->_lastUsedLocaleIdentifier;
    v2->_lastUsedLocaleIdentifier = (NSString *)v6;

    -[WBSOfflineSearchSuggestionsModelUpdateManager _updateDefaultSearchEnginePreferencesState](v2, "_updateDefaultSearchEnginePreferencesState");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__searchEngineChangedToOrFromGoogle_, *MEMORY[0x1E0D89E28], 0);

    v10 = v2;
  }

  return v2;
}

- (void)_updateDefaultSearchEnginePreferencesState
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_googleWasADefaultSearchProvider = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSOfflineSearchSuggestionsModelGoogleWasDefaultSearchEngineKey"));
  objc_msgSend(MEMORY[0x1E0D89D08], "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_googleIsADefaultSearchProvider = objc_msgSend(v3, "isGoogleEnabledSearchEngine");

  objc_msgSend(v4, "setBool:forKey:", self->_googleIsADefaultSearchProvider, CFSTR("WBSOfflineSearchSuggestionsModelGoogleWasDefaultSearchEngineKey"));
}

void __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke_2;
  v2[3] = &unk_1E4B2A8E8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_doUpdates");
}

- (void)_searchEngineChangedToOrFromGoogle:(id)a3
{
  -[WBSOfflineSearchSuggestionsModelUpdateManager _updateDefaultSearchEnginePreferencesState](self, "_updateDefaultSearchEnginePreferencesState", a3);
  -[WBSOfflineSearchSuggestionsModelUpdateManager _doUpdates](self, "_doUpdates");
}

- (void)_checkForModelUpdates
{
  void *v3;
  NSString *v4;
  NSString *lastUsedLocaleIdentifier;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastUsedLocaleIdentifier = self->_lastUsedLocaleIdentifier;
  self->_lastUsedLocaleIdentifier = v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", self->_lastUsedLocaleIdentifier, CFSTR("WBSOfflineSearchSuggestionsModelLastUsedLocaleIdentifierKey"));

  -[WBSOfflineSearchSuggestionsModelUpdateManager _searchHelperProxy](self, "_searchHelperProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__WBSOfflineSearchSuggestionsModelUpdateManager__checkForModelUpdates__block_invoke;
  v8[3] = &unk_1E4B2B7F8;
  v8[4] = self;
  objc_msgSend(v7, "checkForModelUpdatesIfNeededWithCompletionHandler:", v8);

}

uint64_t __70__WBSOfflineSearchSuggestionsModelUpdateManager__checkForModelUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recordUpdateResultWithError:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_disconnectFromSearchHelper");
}

- (void)_recordUpdateResultWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSDateFormatter *dateFormatter;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSOfflineSearchSuggestionsModelUpdateManager _recordUpdateResultWithError:].cold.1(v6, v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_DEFAULT, "Successfully checked for offline search model updates", v11, 2u);
    }
    dateFormatter = self->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("WBSOfflineSearchSuggestionsModelLastUpdateDateKey"));

  }
}

- (void)_clearModels
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all offline search models", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("WBSOfflineSearchSuggestionsModelLastUpdateDateKey"));

  -[WBSOfflineSearchSuggestionsModelUpdateManager _searchHelperProxy](self, "_searchHelperProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__WBSOfflineSearchSuggestionsModelUpdateManager__clearModels__block_invoke;
  v6[3] = &unk_1E4B2A078;
  v6[4] = self;
  objc_msgSend(v5, "clearAllSearchModelsWithCompletionHandler:", v6);

}

uint64_t __61__WBSOfflineSearchSuggestionsModelUpdateManager__clearModels__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disconnectFromSearchHelper");
}

- (id)_searchHelperProxy
{
  void *v3;
  void *v4;
  void *v5;

  +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchHelperConnectionRequestedByClient:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_75);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __67__WBSOfflineSearchSuggestionsModelUpdateManager__searchHelperProxy__block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __67__WBSOfflineSearchSuggestionsModelUpdateManager__searchHelperProxy__block_invoke_cold_1(v0);
}

- (void)_disconnectFromSearchHelper
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSOfflineSearchSuggestionsModelUpdateManager__disconnectFromSearchHelper__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__WBSOfflineSearchSuggestionsModelUpdateManager__disconnectFromSearchHelper__block_invoke(uint64_t a1)
{
  id v2;

  +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeClient:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSOfflineSearchSuggestionsModelUpdateManager;
  -[WBSOfflineSearchSuggestionsModelUpdateManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)_recordUpdateResultWithError:(void *)a1 .cold.1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Encountered error attempting to update offline search suggestion models: %{public}@", (uint8_t *)&v5, 0xCu);

}

void __67__WBSOfflineSearchSuggestionsModelUpdateManager__searchHelperProxy__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Encountered error attempting to create remote proxy object for SafariSearchHelper.", v1, 2u);
}

@end
