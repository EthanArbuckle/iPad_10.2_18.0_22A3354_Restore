@implementation TUCallDirectoryMetadataCacheDataProvider

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  NSObject *group;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  TUCallDirectoryMetadataCacheDataProvider *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  group = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v26 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v27 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "type") == 2)
        {
          objc_msgSend(v13, "normalizedValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "length"))
          {
            objc_msgSend(v13, "value");
            v15 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v15;
          }
          if (objc_msgSend(v14, "length"))
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v14);
            if ((objc_msgSend(v14, "pn_hasInternationalDirectDialingPrefix") & 1) == 0)
            {
              objc_msgSend(v13, "isoCountryCode");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "length"))
              {
                objc_msgSend(MEMORY[0x1E0C99DC8], "nationalDirectDialingPrefixForISOCountryCode:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "length") && objc_msgSend(v14, "hasPrefix:", v17))
                {
                  objc_msgSend(v14, "substringFromIndex:", objc_msgSend(v17, "length"));
                  v18 = objc_claimAutoreleasedReturnValue();

                  v14 = (void *)v18;
                }
                -[TUCallDirectoryMetadataCacheDataProvider countryDialingCode](self, "countryDialingCode");
                v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v19)[2](v19, v16);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v20, "stringByAppendingString:", v14);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "length"))
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v12, v21);

                v7 = v26;
                v6 = v27;
              }

            }
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    dispatch_group_enter(group);
    -[TUCallDirectoryMetadataCacheDataProvider firstIdentificationEntriesForEnabledExtensions](self, "firstIdentificationEntriesForEnabledExtensions");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke;
    v28[3] = &unk_1E38A16C0;
    v29 = v6;
    v30 = self;
    v31 = group;
    ((void (**)(_QWORD, void *, _QWORD *))v22)[2](v22, v23, v28);

    v7 = v26;
  }

}

void __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "callDirectoryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:completionHandler:", v6, 1, v5);

}

- (id)firstIdentificationEntriesForEnabledExtensions
{
  return self->_firstIdentificationEntriesForEnabledExtensions;
}

- (CXCallDirectoryManager)callDirectoryManager
{
  return self->_callDirectoryManager;
}

- (TUCallDirectoryMetadataCacheDataProvider)init
{
  TUCallDirectoryMetadataCacheDataProvider *v2;
  CXCallDirectoryManager *v3;
  CXCallDirectoryManager *callDirectoryManager;
  id countryDialingCode;
  uint64_t v6;
  void *v7;
  id firstIdentificationEntriesForEnabledExtensions;
  const char *v9;
  NSObject *v10;
  id v11;
  _QWORD handler[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TUCallDirectoryMetadataCacheDataProvider;
  v2 = -[TUMetadataCacheDataProvider init](&v18, sel_init);
  if (v2)
  {
    v3 = (CXCallDirectoryManager *)objc_alloc_init((Class)CUTWeakLinkClass());
    callDirectoryManager = v2->_callDirectoryManager;
    v2->_callDirectoryManager = v3;

    objc_initWeak(&location, v2);
    countryDialingCode = v2->_countryDialingCode;
    v2->_countryDialingCode = &__block_literal_global_1;

    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_2;
    aBlock[3] = &unk_1E38A1670;
    objc_copyWeak(&v16, &location);
    v7 = _Block_copy(aBlock);
    firstIdentificationEntriesForEnabledExtensions = v2->_firstIdentificationEntriesForEnabledExtensions;
    v2->_firstIdentificationEntriesForEnabledExtensions = v7;

    if (__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit != -1)
      dispatch_once(&__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit, &__block_literal_global_48);
    v9 = (const char *)__CUTStaticWeak_CXCallDirectoryManagerIdentificationEntriesChangedNotification;
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    handler[0] = v6;
    handler[1] = 3221225472;
    handler[2] = __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_3;
    handler[3] = &unk_1E38A1698;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v9, &v2->_identificationEntriesChangedNotifyToken, v10, handler);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v5);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0CB3940];
          TUBundle();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CALL_DIRECTORY_EXTENSION_%@_LABEL_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedExtensionContainingAppName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedLabel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", v12, v13, v14);
          v15 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "setObject:forDestinationID:", v15, v9);
        }
        else
        {
          TUDefaultLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v7;
            _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "[WARN] No metadata destinationID found for phone number '%@'", buf, 0xCu);
          }
        }

      }
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v19);
  }
  if (v17)
  {
    TUDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(a1, (uint64_t)v17, v16);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

id __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0C99DC8], "ITUCountryCodeForISOCountryCode:", a2);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit != -1)
      dispatch_once(&__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit, &__block_literal_global_48);
    v4 = 136315138;
    v5 = __CUTStaticWeak_CXCallDirectoryManagerIdentificationEntriesChangedNotification;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by refreshing", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refresh");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_identificationEntriesChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)TUCallDirectoryMetadataCacheDataProvider;
  -[TUCallDirectoryMetadataCacheDataProvider dealloc](&v3, sel_dealloc);
}

- (int)identificationEntriesChangedNotifyToken
{
  return self->_identificationEntriesChangedNotifyToken;
}

- (id)countryDialingCode
{
  return self->_countryDialingCode;
}

- (void)setCountryDialingCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setFirstIdentificationEntriesForEnabledExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstIdentificationEntriesForEnabledExtensions, 0);
  objc_storeStrong(&self->_countryDialingCode, 0);
  objc_storeStrong((id *)&self->_callDirectoryManager, 0);
}

void __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19A50D000, a3, OS_LOG_TYPE_ERROR, "Error retrieving first identification entries for phone numbers %@: %@", (uint8_t *)&v6, 0x16u);

}

@end
