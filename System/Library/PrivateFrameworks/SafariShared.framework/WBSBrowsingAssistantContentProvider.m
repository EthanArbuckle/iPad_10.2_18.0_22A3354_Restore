@implementation WBSBrowsingAssistantContentProvider

+ (id)_sharedSessionConfiguration
{
  if (_sharedSessionConfiguration_onceToken != -1)
    dispatch_once(&_sharedSessionConfiguration_onceToken, &__block_literal_global_6);
  return (id)_sharedSessionConfiguration_configuration;
}

void __66__WBSBrowsingAssistantContentProvider__sharedSessionConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Safari/%s"), "8619.1.26.30.5");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("Safari"), v2);
  v1 = (void *)_sharedSessionConfiguration_configuration;
  _sharedSessionConfiguration_configuration = v0;

}

+ (PARSession)sharedPARSession
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  objc_msgSend(a1, "_sharedSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D177D8], "sharedPARSessionWithConfiguration:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__WBSBrowsingAssistantContentProvider_sharedPARSession__block_invoke;
    block[3] = &unk_1E4B2A078;
    v6 = v2;
    if (sharedPARSession_onceToken != -1)
      dispatch_once(&sharedPARSession_onceToken, block);
    v3 = (id)sharedPARSession_sharedSession;

  }
  return (PARSession *)v3;
}

void __55__WBSBrowsingAssistantContentProvider_sharedPARSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedPARSession_sharedSession;
  sharedPARSession_sharedSession = v1;

}

+ (BOOL)assistantEnabledForCurrentDevice
{
  void *v2;
  BOOL v3;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend((id)objc_opt_class(), "sharedPARSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "safariAssistantEnabledStatus") != 1)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    v3 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Assitant is not support for this device.", v6, 2u);
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

+ (BOOL)assistantEnabledForLocale:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedPARSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safariAssistantEnabledStatusForPageLanguage:", v3);
  if (v5 != 1)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138739971;
      v9 = v3;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Assitant is not eligible for page language: %{sensitive}@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v5 == 1;
}

+ (id)filteredStringForURL:(id)a3 needsVariants:(BOOL *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  objc_msgSend(a3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_assetManagerForCurrentSystemLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "sharedPARSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "safariAssistantHashPrefixLength");
    else
      v10 = 21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "prefilterSafariSummarizationPrefetchRequestModelWithUrlString:prefetchHashPrefixLength:", v6, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "hasMatchedPattern") & 1) == 0)
        *a4 = 1;
      objc_msgSend(v12, "prefilterUrl");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v6;
    }

  }
  else
  {
    v11 = v6;
  }

  return v11;
}

+ (id)_assetManagerForCurrentSystemLocale
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  getSAAssetManagerFactoryClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!_assetManagerForCurrentSystemLocale__localeToAssetManagerMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)_assetManagerForCurrentSystemLocale__localeToAssetManagerMap;
      _assetManagerForCurrentSystemLocale__localeToAssetManagerMap = v2;

    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_assetManagerForCurrentSystemLocale__localeToAssetManagerMap, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(getSAAssetManagerFactoryClass(), "safariAssistantAssetManagerWithLocale:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_assetManagerForCurrentSystemLocale__localeToAssetManagerMap, "setObject:forKeyedSubscript:", v6, v5);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (void)subscribeToAssistantAssetAndDownloadNow:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_assetManagerForCurrentSystemLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke;
      v8[3] = &unk_1E4B2A3F8;
      v9 = v6;
      v11 = a3;
      v10 = v4;
      objc_msgSend(v10, "subscribeToAndPreloadSafariSummarizationAssetsForLocale:completionHandler:", v9, v8);

    }
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v13 = v6;
      _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_DEFAULT, "Safari failed to subscribe to UAF asset download for locale: %{sensitive}@", buf, 0xCu);
    }
  }

}

void __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138739971;
    v9 = v3;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Safari finishes subscribing to assistant assets: %{sensitive}@", buf, 0xCu);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke_21;
    v6[3] = &unk_1E4B2A078;
    v7 = v4;
    objc_msgSend(v5, "ensureSafariSummarizationAssetsDownloadedForLocale:completionHandler:", v7, v6);

  }
}

void __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138739971;
    v5 = v3;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Safari finishes downloading assistant assets: %{sensitive}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)clearAssistantAssetCache
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(a1, "_assetManagerForCurrentSystemLocale");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "resetSafariSummarizationAssets");
      v3 = v5;
    }
  }

}

+ (void)unsubscribeFromAssistantAsset
{
  id v2;

  objc_msgSend(a1, "_assetManagerForCurrentSystemLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsubscribeFromSafariSummarizationAssetsWithCompletionHandler:", &__block_literal_global_24);

}

void __68__WBSBrowsingAssistantContentProvider_unsubscribeFromAssistantAsset__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_DEFAULT, "Safari finishes unsubscribing assistant assets", v1, 2u);
  }
}

- (void)checkContentAvailabilityForURL:(id)a3 locale:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v28 = 0;
  objc_msgSend((id)objc_opt_class(), "filteredStringForURL:needsVariants:", v6, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D177B0];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prefetchRequestForUrl:locale:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[WBSBrowsingAssistantURLVariants variantsForURL:](WBSBrowsingAssistantURLVariants, "variantsForURL:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "variants");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUrlVariants:", v14);

    }
    if (v28)
    {
      objc_msgSend(v6, "absoluteString");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_7:
      v15 = v8;
    }
    v16 = v15;
    v17 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v12;
      _os_signpost_emit_with_name_impl(&dword_1A3D90000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HashPrefixFetching", "Request [%p]", buf, 0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "sharedPARSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __88__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_completion___block_invoke;
    v23[3] = &unk_1E4B2A440;
    v24 = v12;
    v25 = v6;
    v26 = v16;
    v27 = v7;
    v19 = v16;
    v20 = v12;
    objc_msgSend(v18, "taskWithRequest:completion:", v20, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "resume");
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v30 = v6;
      _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_INFO, "Safari didn't find a match for the URL in bloom filter or pattern list. URL: %{sensitive}@", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __88__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  void *v22;
  int v23;
  char *v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  NSObject *v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_signpost_enabled(v7))
  {
    v8 = CFSTR("YES");
    v9 = a1[4];
    if (!v5)
      v8 = CFSTR("NO");
    *(_DWORD *)buf = 134218242;
    v58 = v9;
    v59 = 2112;
    v60 = v8;
    _os_signpost_emit_with_name_impl(&dword_1A3D90000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HashPrefixFetching", "Request [%p] Success=%@ enableTelemetry=YES ", buf, 0x16u);
  }
  if (v6)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __88__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_completion___block_invoke_cold_2((uint64_t)a1, v10, v6);
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v11 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v5;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v33 = v11;
      objc_msgSend(v11, "hashBucketDetails");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      v12 = 0;
      v13 = 0;
      if (v37)
      {
        v36 = *(_QWORD *)v51;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v51 != v36)
              objc_enumerationMutation(obj);
            v38 = v14;
            v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v14);
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            objc_msgSend(v15, "hash_details");
            v41 = (id)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v47;
              do
              {
                v19 = 0;
                v20 = sel_matched_url_variant;
                v39 = v17;
                do
                {
                  if (*(_QWORD *)v47 != v18)
                    objc_enumerationMutation(v41);
                  v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v19);
                  if ((objc_opt_respondsToSelector() & 1) == 0
                    || (objc_msgSend(v21, "matched_url_variant"),
                        v22 = (void *)objc_claimAutoreleasedReturnValue(),
                        v23 = objc_msgSend(v22, "isEqualToString:", a1[6]),
                        v22,
                        v23))
                  {
                    v12 |= objc_msgSend(v21, "has_summary");
                    v13 |= objc_msgSend(v21, "has_table_of_contents");
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      v24 = v20;
                      v25 = v13;
                      v26 = v18;
                      v44 = 0u;
                      v45 = 0u;
                      v42 = 0u;
                      v43 = 0u;
                      objc_msgSend(v21, "sba_entity_types");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                      if (v28)
                      {
                        v29 = v28;
                        v30 = *(_QWORD *)v43;
                        do
                        {
                          for (i = 0; i != v29; ++i)
                          {
                            if (*(_QWORD *)v43 != v30)
                              objc_enumerationMutation(v27);
                            switch(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "integerValue"))
                            {
                              case 1u:
                                v12 |= 2uLL;
                                break;
                              case 2u:
                                v12 |= 4uLL;
                                break;
                              case 3u:
                                v12 |= 8uLL;
                                break;
                              case 4u:
                                v12 |= 0x10uLL;
                                break;
                              default:
                                continue;
                            }
                          }
                          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                        }
                        while (v29);
                      }

                      v18 = v26;
                      v13 = v25;
                      v20 = v24;
                      v17 = v39;
                    }
                  }
                  ++v19;
                }
                while (v19 != v17);
                v17 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
              }
              while (v17);
            }

            v14 = v38 + 1;
          }
          while (v38 + 1 != v37);
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v37);
      }

      (*(void (**)(void))(a1[7] + 16))();
      v5 = v34;
      v11 = v33;
    }
    else
    {
      if (v11)
      {
        v32 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          __88__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_completion___block_invoke_cold_1(v32);
      }
      (*(void (**)(void))(a1[7] + 16))();
    }

  }
}

- (void)fetchContentForURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = 0;
    objc_msgSend((id)objc_opt_class(), "filteredStringForURL:needsVariants:", v5, &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (v21)
      {
        objc_msgSend(v5, "absoluteString");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = v7;
      }
      v11 = v9;
      v12 = (void *)MEMORY[0x1E0D177B0];
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "summarizeRequestForUrl:locale:", v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "sharedPARSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke;
      v18[3] = &unk_1E4B2A468;
      v19 = v5;
      v20 = v6;
      objc_msgSend(v16, "taskWithRequest:completion:", v15, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "resume");
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBSBrowsingAssistantContentProvider fetchContentForURL:completion:].cold.1((uint64_t)v5, v10);
      (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60]);
  }

}

void __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_2(a1, v8, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "summaryCandidates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v11, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_1(v14);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __88__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v2 = (void *)MEMORY[0x1E0D177C0];
  v3 = a1;
  v4 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A3D90000, v7, v8, "Checking content availability failed. Received unexpected response type. Expected %{public}@ but received %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_1();
}

void __88__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_completion___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A3D90000, v8, v9, "Failed to check content availability for URL %{sensitive}@ with error %{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_2_1();
}

- (void)fetchContentForURL:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Trying to fetch assistant content for an URL that failed broom filter and pattern check, this should never happen. Please file a bug with URL: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v2 = (void *)MEMORY[0x1E0D177C8];
  v3 = a1;
  v4 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A3D90000, v7, v8, "Fetching content failed. Received unexpected response type. Expected %{public}@ but received %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_1();
}

void __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A3D90000, v8, v9, "Failed to fetch content for URL %{sensitive}@ with error %{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_2_1();
}

@end
