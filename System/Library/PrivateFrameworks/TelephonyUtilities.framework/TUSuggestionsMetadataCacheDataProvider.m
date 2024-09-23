@implementation TUSuggestionsMetadataCacheDataProvider

void __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forDestinationID:", v8, *(_QWORD *)(a1 + 40));

  }
  if (v6)
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Could not fetch suggested contact via [SGSuggestionsService namesForDetail:limitTo:prependMaybe:withCompletion:]: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(a1, v10);

  objc_msgSend(*(id *)(a1 + 32), "suggestionsServiceThrottleSemaphore");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v11);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  __int128 v23;
  _QWORD v24[6];
  id v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v9 = 138412290;
    v23 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "handle", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "normalizedValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
        {
          -[TUSuggestionsMetadataCacheDataProvider suggestionsServiceThrottleSemaphore](self, "suggestionsServiceThrottleSemaphore");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = dispatch_time(0, 1000000000);
          v18 = dispatch_semaphore_wait(v16, v17);

          TUDefaultLog();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v18)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v32 = v13;
              _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] TUSuggestionsMetadataCacheDataProvider waited too long for other requests and will not look up '%@'", buf, 0xCu);
            }

          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v23;
              v32 = v15;
              _os_log_debug_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEBUG, "dispatch_group_enter %@", buf, 0xCu);
            }

            dispatch_group_enter(v7);
            v21 = (void *)objc_opt_class();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke;
            v24[3] = &unk_1E38A1600;
            v24[4] = self;
            v24[5] = v13;
            v22 = v15;
            v25 = v22;
            v26 = v7;
            objc_msgSend(v21, "suggestedNamesForDestinationID:onlySignificant:withCompletion:", v22, 0, v24);

          }
        }

      }
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v10);
  }

}

- (OS_dispatch_semaphore)suggestionsServiceThrottleSemaphore
{
  return self->_suggestionsServiceThrottleSemaphore;
}

+ (void)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  objc_msgSend(a1, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(a1, "canUseSiriSuggestions"))
  {
    if (objc_msgSend((id)objc_opt_class(), "shouldQuerySupportsInfo"))
      objc_msgSend(v9, "namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:withCompletion:", v10, 1, 1, v6, 1, v8);
    else
      objc_msgSend(v9, "namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:", v10, 1, 1, v6, v8);
  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }

}

+ (SGSuggestionsServiceContactsProtocol)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  return (SGSuggestionsServiceContactsProtocol *)(id)sharedService_sharedService;
}

+ (BOOL)shouldQuerySupportsInfo
{
  return 0;
}

+ (BOOL)canUseSiriSuggestions
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.mobilephone")) ^ 1;

  return v3;
}

void __55__TUSuggestionsMetadataCacheDataProvider_sharedService__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  objc_msgSend((id)CUTWeakLinkClass(), "serviceForContacts");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = v0;

  objc_msgSend((id)sharedService_sharedService, "setSyncTimeout:", 5.0);
  if (!sharedService_sharedService)
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __55__TUSuggestionsMetadataCacheDataProvider_sharedService__block_invoke_cold_1(v2);

  }
}

- (TUSuggestionsMetadataCacheDataProvider)init
{
  TUSuggestionsMetadataCacheDataProvider *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *suggestionsServiceThrottleSemaphore;
  void *v5;
  uint64_t v6;
  id suggestionsContactsObserver;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUSuggestionsMetadataCacheDataProvider;
  v2 = -[TUMetadataCacheDataProvider init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(9);
    suggestionsServiceThrottleSemaphore = v2->_suggestionsServiceThrottleSemaphore;
    v2->_suggestionsServiceThrottleSemaphore = (OS_dispatch_semaphore *)v3;

    objc_initWeak(&location, v2);
    objc_msgSend((id)objc_opt_class(), "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__TUSuggestionsMetadataCacheDataProvider_init__block_invoke;
    v9[3] = &unk_1E38A15D8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "registerContactsChangeObserver:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    suggestionsContactsObserver = v2->_suggestionsContactsObserver;
    v2->_suggestionsContactsObserver = (id)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "suggestedNamesForDestinationID:onlySignificant:supportsInfoLookup:error:", v7, v6, objc_msgSend((id)objc_opt_class(), "shouldQuerySupportsInfo"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 supportsInfoLookup:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  objc_msgSend(a1, "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(a1, "canUseSiriSuggestions"))
  {
    if (objc_msgSend((id)objc_opt_class(), "shouldQuerySupportsInfo"))
      objc_msgSend(v11, "namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:error:", v10, 1, 1, v8, v7, a6);
    else
      objc_msgSend(v11, "namesForDetail:limitTo:prependMaybe:onlySignificant:error:", v10, 1, 1, v8, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (v12)
    v13 = v12;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  return v14;
}

+ (id)newestSuggestedContactForDestinationID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(a1, "canUseSiriSuggestions"))
    goto LABEL_14;
  if (!objc_msgSend(v4, "destinationIdIsEmailAddress"))
  {
    if (objc_msgSend(v4, "destinationIdIsPhoneNumber"))
    {
      objc_msgSend(a1, "sharedService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v9, "contactMatchesByPhoneNumber:error:", v4, &v30);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v30;

      if (!v6 && v7)
      {
        TUDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          +[TUSuggestionsMetadataCacheDataProvider newestSuggestedContactForDestinationID:].cold.2();
        goto LABEL_12;
      }
      goto LABEL_17;
    }
LABEL_14:
    v7 = 0;
    v6 = 0;
    goto LABEL_15;
  }
  objc_msgSend(a1, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v5, "contactMatchesByEmailAddress:error:", v4, &v31);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v31;

  if (v6 || !v7)
  {
LABEL_17:
    if (v6)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v6 = v6;
      v10 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v10)
      {
        v24 = v7;
        v25 = v4;
        v8 = 0;
        v13 = *(_QWORD *)v27;
        v14 = -1;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v6);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v16, "contact", v24);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "recordId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "numericValue");

            if (v19 > v14)
            {
              objc_msgSend(v16, "contact");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "recordId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v21, "numericValue");

              v22 = v16;
              v8 = v22;
            }
          }
          v10 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v10);

        v7 = v24;
        if (!v8)
        {
          v10 = 0;
          v4 = v25;
          goto LABEL_16;
        }
        -[NSObject contact](v8, "contact");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cnContact");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v25;
      }
      else
      {
        v8 = v6;
      }
      goto LABEL_13;
    }
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[TUSuggestionsMetadataCacheDataProvider newestSuggestedContactForDestinationID:].cold.1();
LABEL_12:
  v6 = 0;
  v10 = 0;
LABEL_13:

LABEL_16:
  v11 = v10;

  return v11;
}

void __46__TUSuggestionsMetadataCacheDataProvider_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling Suggestions contacts change by refreshing", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refresh");

}

- (void)setSuggestionsServiceThrottleSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsServiceThrottleSemaphore, a3);
}

- (id)suggestionsContactsObserver
{
  return self->_suggestionsContactsObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suggestionsContactsObserver, 0);
  objc_storeStrong((id *)&self->_suggestionsServiceThrottleSemaphore, 0);
}

void __55__TUSuggestionsMetadataCacheDataProvider_sharedService__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "serviceForContacts is nil", v1, 2u);
}

+ (void)newestSuggestedContactForDestinationID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Retrieving suggested contact matches by email address %@ failed with error %@.");
  OUTLINED_FUNCTION_1();
}

+ (void)newestSuggestedContactForDestinationID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Retrieving suggested contact matches by phone number %@ failed with error %@.");
  OUTLINED_FUNCTION_1();
}

void __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "dispatch_group_leave %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
