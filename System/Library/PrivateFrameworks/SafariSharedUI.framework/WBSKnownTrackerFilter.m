@implementation WBSKnownTrackerFilter

- (void)getKnownTrackersFromHighLevelDomains:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  id SWCTrackingDomainInfoClass;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, void *);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  _QWORD v29[4];
  id v30;
  const __CFString *v31;
  uint64_t v32;
  _BYTE v33[128];
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!SharedWebCredentialsLibraryCore_frameworkLibrary)
  {
    v34 = xmmword_1E5444380;
    v35 = 0;
    SharedWebCredentialsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (SharedWebCredentialsLibraryCore_frameworkLibrary)
  {
    get_SWCTrackingDomainInfoClass();
    v8 = objc_opt_respondsToSelector();
    SWCTrackingDomainInfoClass = get_SWCTrackingDomainInfoClass();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke;
      v29[3] = &unk_1E5444320;
      v30 = v7;
      objc_msgSend(SWCTrackingDomainInfoClass, "getTrackingDomainInfoWithDomains:sources:completion:", v10, 1, v29);

      v11 = v30;
    }
    else
    {
      objc_msgSend(SWCTrackingDomainInfoClass, "trackingDomainInfoWithDomains:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v21);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_4;
    block[3] = &unk_1E5441CB8;
    block[4] = self;
    v22 = (void (**)(_QWORD, void *))v7;
    if (getKnownTrackersFromHighLevelDomains_completionHandler__onceToken != -1)
      dispatch_once(&getKnownTrackersFromHighLevelDomains_completionHandler__onceToken, block);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend((id)getKnownTrackersFromHighLevelDomains_completionHandler__knownTrackers, "objectForKeyedSubscript:", v17, v22);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
          {
            v31 = CFSTR("OwnerName");
            v32 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v17);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v14);
    }

    v7 = v22;
    v22[2](v22, v11);
    v6 = v23;
  }

}

void __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_20);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

id __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("OwnerName");
  objc_msgSend(a3, "ownerDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "source") == 1)
  {
    v7 = CFSTR("OwnerName");
    objc_msgSend(v3, "ownerDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createKnownTrackersDictionary");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getKnownTrackersFromHighLevelDomains_completionHandler__knownTrackers;
  getKnownTrackersFromHighLevelDomains_completionHandler__knownTrackers = v1;

}

- (id)_createKnownTrackersDictionary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariSharedBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("WBSDuckDuckGoTDS"), CFSTR("json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSKnownTrackerFilter _createKnownTrackersDictionary].cold.1(v8, v7);
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __55__WBSKnownTrackerFilter__createKnownTrackersDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("d"));
}

- (void)_createKnownTrackersDictionary
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
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Unable to read known tracker data %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
