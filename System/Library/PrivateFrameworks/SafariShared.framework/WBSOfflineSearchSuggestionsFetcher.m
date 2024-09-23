@implementation WBSOfflineSearchSuggestionsFetcher

- (WBSOfflineSearchSuggestionsFetcher)initWithMaximumSuggestionsToFetch:(unint64_t)a3
{
  WBSOfflineSearchSuggestionsFetcher *v4;
  WBSOfflineSearchSuggestionsFetcher *v5;
  void *v6;
  WBSOfflineSearchSuggestionsFetcher *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSOfflineSearchSuggestionsFetcher;
  v4 = -[WBSOfflineSearchSuggestionsFetcher init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[WBSOfflineSearchSuggestionsFetcher _searchHelperProxy](v4, "_searchHelperProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfOfflineSuggestionsToFetch:", a3);

    -[WBSOfflineSearchSuggestionsFetcher updateAvailability](v5, "updateAvailability");
    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSOfflineSearchSuggestionsFetcher;
  -[WBSOfflineSearchSuggestionsFetcher dealloc](&v4, sel_dealloc);
}

- (void)updateAvailability
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke;
  v2[3] = &unk_1E4B3D2F8;
  v2[4] = self;
  -[WBSOfflineSearchSuggestionsFetcher _checkForRemoteDisablement:](self, "_checkForRemoteDisablement:", v2);
}

void __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke(uint64_t a1, int a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  v3 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    v3[1] = 2;
    objc_msgSend(*(id *)(a1 + 32), "_logOfflineSuggestionStatus");
  }
  else
  {
    objc_msgSend(v3, "_searchHelperProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_2;
    v5[3] = &unk_1E4B3D2D0;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "fetchOfflineSearchSuggestionsStatus:", v5);

  }
}

void __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_3;
  v2[3] = &unk_1E4B2A910;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1] == 3)
  {
    +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeClient:", *(_QWORD *)(a1 + 32));

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_logOfflineSuggestionStatus");
}

- (void)_checkForRemoteDisablement:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[WBSOfflineSearchRemoteDisablementManager sharedManager](WBSOfflineSearchRemoteDisablementManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke;
  v6[3] = &unk_1E4B3D320;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "areOfflineSearchSuggestionsDisabled:", v6);

}

void __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke_2;
  v3[3] = &unk_1E4B2A0A0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_logOfflineSuggestionStatus
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;

  switch(self->_offlineSuggestionsStatus)
  {
    case 0uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v10 = 0;
        v3 = "Unable to determine status of offline search suggestions";
        v4 = (uint8_t *)&v10;
        goto LABEL_14;
      }
      break;
    case 1uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v9 = 0;
        v3 = "Unable to communicate with com.apple.Safari.SearchHelper";
        v4 = (uint8_t *)&v9;
        goto LABEL_14;
      }
      break;
    case 2uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v8 = 0;
        v3 = "Offline search suggestions have been disabled remotely";
        v4 = (uint8_t *)&v8;
        goto LABEL_14;
      }
      break;
    case 3uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v7 = 0;
        v3 = "No offline search model exists for current locale";
        v4 = (uint8_t *)&v7;
        goto LABEL_14;
      }
      break;
    case 4uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v6 = 0;
        v3 = "Download needs to be initiated";
        v4 = (uint8_t *)&v6;
        goto LABEL_14;
      }
      break;
    case 5uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v5 = 0;
        v3 = "Offline search suggestions are availabe";
        v4 = (uint8_t *)&v5;
LABEL_14:
        _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, v3, v4, 2u);
      }
      break;
    default:
      return;
  }
}

- (id)_searchHelperProxy
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchHelperConnectionRequestedByClient:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke;
  v7[3] = &unk_1E4B2B7F8;
  v7[4] = self;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke_cold_1(v4, v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 1;

}

- (BOOL)areOfflineSearchSuggestionsAvailable
{
  return self->_offlineSuggestionsStatus == 5;
}

- (void)setCurrentQuery:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self->_offlineSuggestionsStatus == 5)
  {
    objc_storeStrong((id *)&self->_currentQuery, a3);
    -[WBSOfflineSearchSuggestionsFetcher _searchHelperProxy](self, "_searchHelperProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke;
    v8[3] = &unk_1E4B3D348;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v6, "fetchOfflineSuggestionsForQueryString:completionHandler:", v7, v8);

  }
}

void __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke_2;
  block[3] = &unk_1E4B2A5F8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "offlineSearchSuggestionsFetcher:didFindSuggestions:forQuery:", a1[4], a1[5], a1[6]);

}

- (WBSCompletionQuery)currentQuery
{
  return self->_currentQuery;
}

- (WBSOfflineSearchSuggestionsFetcherDelegate)delegate
{
  return (WBSOfflineSearchSuggestionsFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentQuery, 0);
}

void __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke_cold_1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "WBSOfflineSearchFetcher received an error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
