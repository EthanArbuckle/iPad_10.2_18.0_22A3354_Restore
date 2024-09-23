@implementation PRSBagHandler

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "resourceMetadata");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (objc_msgSend(*(id *)(a1 + 32), "resourceMetadataNeedsWrite"))
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceMetadata");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resourceMetadataPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:", v3, 1);

    objc_msgSend(*(id *)(a1 + 32), "setResourceMetadataNeedsWrite:", 0);
  }
  objc_sync_exit(obj);

}

- (NSMutableDictionary)resourceMetadata
{
  return self->_resourceMetadata;
}

- (BOOL)resourceMetadataNeedsWrite
{
  return self->_resourceMetadataNeedsWrite;
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1BCCB3708]();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "sessionReceivedBagWithEnabledDomains:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "suggestionRankerModelParams");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "sessionReceivedSuggestionsParameters:", *(_QWORD *)(a1 + 56));
  }
  objc_autoreleasePoolPop(v2);
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  _QWORD block[4];
  id v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "enabledDomains");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEnabledDomains:", v2);

  objc_msgSend(*(id *)(a1 + 40), "firstUseDescriptionText");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E6E549F0;
  objc_msgSend(*(id *)(a1 + 32), "setFteLocString:", v5);

  objc_msgSend(*(id *)(a1 + 40), "firstUseLearnMoreText");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E6E549F0;
  objc_msgSend(*(id *)(a1 + 32), "setFteLearnMoreString:", v8);

  objc_msgSend(*(id *)(a1 + 40), "firstUseContinueText");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E6E549F0;
  objc_msgSend(*(id *)(a1 + 32), "setFteContinueString:", v11);

  objc_msgSend(*(id *)(a1 + 32), "setCollectAnonymousData:", objc_msgSend(*(id *)(a1 + 40), "collectAnonymousMetadata"));
  objc_msgSend(*(id *)(a1 + 32), "setDisableAsTypedSuggestion:", objc_msgSend(*(id *)(a1 + 40), "disableAsTypedSuggestion"));
  objc_msgSend(*(id *)(a1 + 40), "searchRenderTimeout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 32), "setSearchRenderTimeout:", v14 / 1000.0);
  objc_msgSend(*(id *)(a1 + 40), "minSuggestionRenderTimeout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 32), "setSuggestionsRenderTimeout:", v17 / 1000.0);
  objc_msgSend(*(id *)(a1 + 32), "setCollectScores:", objc_msgSend(*(id *)(a1 + 40), "collectScores"));
  objc_msgSend(*(id *)(a1 + 40), "anonymousMetadataPreference");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnonymousMetadataUndesiredBundleIDs:", v18);
  }
  else
  {
    v53[0] = CFSTR("com.apple.application");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAnonymousMetadataUndesiredBundleIDs:", v19);

  }
  if (*(_QWORD *)(a1 + 48))
    v20 = 4;
  else
    v20 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", v20);
  objc_msgSend(*(id *)(a1 + 32), "setUse2LayerRanking:", objc_msgSend(*(id *)(a1 + 40), "use2LayerRanking"));
  objc_msgSend(*(id *)(a1 + 40), "suggestionRankerModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuggestionRankerModelParams:", v21);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = objc_msgSend(*(id *)(a1 + 40), "isEnabled");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v22 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "triggerQuery:", objc_msgSend(*(id *)(a1 + 32), "status") == 2);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v24);
  }

  objc_msgSend(*(id *)(a1 + 32), "resourceFetchQueue");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_2;
  block[3] = &unk_1E6E43000;
  v29 = *(id *)(a1 + 56);
  v30 = *(_QWORD *)(a1 + 32);
  v45 = v29;
  v46 = v30;
  v47 = *(id *)(a1 + 64);
  dispatch_async(v27, block);

  objc_msgSend(*(id *)(a1 + 32), "enabledDomains");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");

  objc_msgSend(*(id *)(a1 + 32), "suggestionRankerModelParams");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");

  v39[0] = v28;
  v39[1] = 3221225472;
  v39[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_7;
  v39[3] = &unk_1E6E43028;
  v40 = *(id *)(a1 + 64);
  v41 = v32;
  v42 = *(_QWORD *)(a1 + 32);
  v43 = v34;
  v35 = v34;
  v36 = v32;
  dispatch_async(MEMORY[0x1E0C80D38], v39);
  v37 = *(_QWORD *)(a1 + 32);
  v38 = *(void **)(v37 + 32);
  *(_QWORD *)(v37 + 32) = 0;

}

- (NSArray)suggestionRankerModelParams
{
  return self->_suggestionRankerModelParams;
}

- (void)setUse2LayerRanking:(BOOL)a3
{
  self->_use2LayerRanking = a3;
}

- (void)setSuggestionRankerModelParams:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionRankerModelParams, a3);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setFteContinueString:(id)a3
{
  objc_storeStrong((id *)&self->_fteContinueString, a3);
}

- (void)setEnabledDomains:(id)a3
{
  objc_storeStrong((id *)&self->_enabledDomains, a3);
}

- (NSArray)enabledDomains
{
  return self->_enabledDomains;
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v2 = *MEMORY[0x1E0D17808];
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_3;
  v16[3] = &unk_1E6E42F60;
  v4 = *(void **)(a1 + 32);
  v16[4] = *(_QWORD *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v4, "fileHandleAndAttributesForResource:completion:", v2, v16);
  objc_msgSend(*(id *)(a1 + 40), "resourceFetchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v5);

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *MEMORY[0x1E0D177F8];
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_4;
  v13[3] = &unk_1E6E42FB0;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v15 = v10;
  objc_msgSend(v6, "fetchModifiedResourceFromSession:resource:completion:", v7, v8, v13);
  objc_msgSend(*(id *)(a1 + 40), "resourceFetchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_6;
  block[3] = &unk_1E6E42FD8;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v11, block);

}

- (OS_dispatch_queue)resourceFetchQueue
{
  return self->_resourceFetchQueue;
}

- (void)setSuggestionsRenderTimeout:(double)a3
{
  self->_suggestionsRenderTimeout = a3;
}

- (void)setSearchRenderTimeout:(double)a3
{
  self->_searchRenderTimeout = a3;
}

- (void)setFteLocString:(id)a3
{
  objc_storeStrong((id *)&self->_fteLocString, a3);
}

- (void)setFteLearnMoreString:(id)a3
{
  objc_storeStrong((id *)&self->_fteLearnMoreString, a3);
}

- (void)setDisableAsTypedSuggestion:(BOOL)a3
{
  self->_disableAsTypedSuggestion = a3;
}

- (void)setCollectAnonymousData:(BOOL)a3
{
  self->_collectAnonymousData = a3;
}

- (void)fetchModifiedResourceFromSession:(id)a3 resource:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PRSBagHandler *v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PRSBagHandler_fetchModifiedResourceFromSession_resource_completion___block_invoke;
  v12[3] = &unk_1E6E42F38;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "fileHandleAndAttributesForResource:completion:", v11, v12);

}

- (void)setCollectScores:(BOOL)a3
{
  self->_collectScores = a3;
}

- (void)setAnonymousMetadataUndesiredBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

void __70__PRSBagHandler_fetchModifiedResourceFromSession_resource_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  double v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  const __CFString *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v36 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    PRSLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v42 = v24;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_1B86C5000, v23, OS_LOG_TYPE_INFO, "failed fetch resource:%@ err:%@", buf, 0x16u);
    }

    v25 = 0;
    goto LABEL_21;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D177F8]);
  objc_msgSend(v36, "objectForKey:", *MEMORY[0x1E0CB2A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 40), "resourceMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  objc_msgSend(*(id *)(a1 + 40), "resourceMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "languageCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("last_modified"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    if (v13 - v20 >= 0.01)
    {

      goto LABEL_16;
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("language"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", v18);

    if ((v22 & 1) == 0)
    {
LABEL_16:
      if (v18)
      {
        v39[0] = CFSTR("last_modified");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = CFSTR("language");
        v40[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "languageCode");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v32 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v32;
      }
      else
      {
        v37 = CFSTR("last_modified");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v34 = objc_claimAutoreleasedReturnValue();

        v18 = 0;
        v16 = (void *)v34;
      }
      goto LABEL_19;
    }
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v25 = 0;
    v27 = 1;
    goto LABEL_20;
  }
  objc_msgSend(v16, "doubleValue");
  if (v13 - v26 < 0.01)
  {
    v18 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v28 = objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v16 = (void *)v28;
LABEL_19:
  objc_msgSend(*(id *)(a1 + 40), "resourceMetadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setResourceMetadataNeedsWrite:", 1);
  v25 = v7;
  v27 = 0;
LABEL_20:

  objc_sync_exit(v14);
  if ((v27 & 1) == 0)
LABEL_21:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_get_global_queue(9, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_5;
    v9 = &unk_1E6E42F88;
    v10 = *(id *)(a1 + 32);
    v11 = v3;
    dispatch_async(v4, &v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "resourceFetchQueue", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v5);

}

+ (id)sharedHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PRSBagHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, block);
  return (id)sharedHandler_sharedHandler;
}

- (BOOL)disableAsTypedSuggestion
{
  return self->_disableAsTypedSuggestion;
}

- (void)updateFromSession:(id)a3 bag:(id)a4 forClient:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *bagQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  bagQueue = self->_bagQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke;
  block[3] = &unk_1E6E43050;
  block[4] = self;
  v20 = v11;
  v21 = v13;
  v22 = v10;
  v23 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v13;
  v18 = v11;
  dispatch_async(bagQueue, block);

}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)collectScores
{
  return self->_collectScores;
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (a2)
  {
    if (!a4)
    {
      objc_msgSend(a2, "prs_mappedData");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "parseCEPFromData:forClient:", v5, *(_QWORD *)(a1 + 40));

    }
  }
}

- (id)_base64CEPDataNoCopyFromFeatureData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  const char *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[4];
  _QWORD v17[3];
  int v18;

  v3 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = -1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3810000000;
  v13 = "";
  v14 = xmmword_1B87DED48;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PRSBagHandler__base64CEPDataNoCopyFromFeatureData___block_invoke;
  v9[3] = &unk_1E6E42EF0;
  v9[4] = v17;
  v9[5] = &v10;
  v9[6] = v16;
  v9[7] = "qi_features";
  v4 = (void *)MEMORY[0x1BCCB38DC](v9);
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  if (json_parse() && *((_DWORD *)v11 + 8) == 4 && (v6 = v11[5]) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, v11[6], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

  return v7;
}

_QWORD *__53__PRSBagHandler__base64CEPDataNoCopyFromFeatureData___block_invoke(_QWORD *result, int a2, __int128 *a3, _BYTE *a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  switch(a2)
  {
    case 1:
      ++*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24);
      break;
    case 2:
      *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = 0;
      if (!*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) && *((_QWORD *)a3 + 2) == 11)
      {
        v8 = (_QWORD *)result[7];
        v9 = (uint64_t *)*((_QWORD *)a3 + 1);
        v10 = *v9;
        v11 = *(uint64_t *)((char *)v9 + 3);
        if (*v8 == v10 && *(_QWORD *)((char *)v8 + 3) == v11)
          *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = v8;
      }
      break;
    case 3:
      v4 = *(_QWORD *)(result[4] + 8);
      v5 = *(_DWORD *)(v4 + 24);
      *(_DWORD *)(v4 + 24) = v5 - 1;
      if (!v5 && *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 32) != 4)
        *a4 = 1;
      break;
    case 6:
      if (!*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24)
        && *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) == result[7])
      {
        v6 = *(_QWORD *)(result[5] + 8);
        v7 = *a3;
        *(_QWORD *)(v6 + 48) = *((_QWORD *)a3 + 2);
        *(_OWORD *)(v6 + 32) = v7;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (void)_processQIFeatures:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  const void *Mutable;
  void *v9;
  id v10;
  int v11;
  SSPlistDataReader *v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[8];
  _QWORD v16[3];
  int v17;
  _QWORD v18[3];
  int v19;
  _QWORD v20[4];
  __int128 v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3810000000;
  v20[3] = "";
  v21 = xmmword_1B87DED48;
  v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = -1;
  Mutable = (const void *)_MDPlistContainerCreateMutable();
  _MDPlistContainerBeginContainer();
  _MDPlistContainerBeginDictionary();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__PRSBagHandler__processQIFeatures_forClient___block_invoke;
  v15[3] = &unk_1E6E42EF0;
  v15[4] = v16;
  v15[5] = v18;
  v15[6] = v20;
  v15[7] = Mutable;
  v9 = (void *)MEMORY[0x1BCCB38DC](v15);
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v11 = json_parse();
  _MDPlistContainerEndDictionary();
  _MDPlistContainerEndContainer();
  if (v11)
    v12 = -[SSPlistDataReader initWithPlistContainer:]([SSPlistDataReader alloc], "initWithPlistContainer:", Mutable);
  else
    v12 = 0;
  CFRelease(Mutable);
  if (v12)
  {
    -[PRSBagHandler setCep_server_values:](self, "setCep_server_values:", v12);
    PRSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B86C5000, v13, OS_LOG_TYPE_INFO, "Loaded qi features", v14, 2u);
    }
  }
  else
  {
    PRSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PRSBagHandler _processQIFeatures:forClient:].cold.1(v13);
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

void __46__PRSBagHandler__processQIFeatures_forClient___block_invoke(_QWORD *a1, int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  char *v25;
  char v26[1024];
  char __s1[1024];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  bzero(__s1, 0x400uLL);
  bzero(v26, 0x400uLL);
  switch(a2)
  {
    case 1:
      v6 = *(_QWORD *)(a1[4] + 8);
      v7 = *(_DWORD *)(v6 + 24) + 1;
      goto LABEL_10;
    case 2:
      v8 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      if (v8 == 1)
      {
        v11 = *(_QWORD *)(a1[6] + 8);
        v12 = *(_OWORD *)a3;
        *(_QWORD *)(v11 + 48) = *(_QWORD *)(a3 + 16);
        *(_OWORD *)(v11 + 32) = v12;
      }
      else
      {
        if (v8)
          return;
        *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
        json_utf8_string(a3, __s1, 0x400uLL);
        v9 = 1;
        while (strcmp(__s1, *((const char **)&sQIFetureKeys + v9)))
        {
          if (++v9 == 3)
            return;
        }
        *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
      }
      return;
    case 3:
      v6 = *(_QWORD *)(a1[4] + 8);
      v7 = *(_DWORD *)(v6 + 24) - 1;
LABEL_10:
      *(_DWORD *)(v6 + 24) = v7;
      return;
    case 6:
      if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == 1)
      {
        v10 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        if (v10 == 1)
        {
          json_utf8_string(*(_QWORD *)(a1[6] + 8) + 32, __s1, 0x400uLL);
          json_utf8_string(a3, v26, 0x400uLL);
          if ((*(_DWORD *)a3 & 0xFFFFFFFE) == 6)
          {
            v13 = 0;
            v14 = MEMORY[0x1E0C80978];
            do
            {
              v15 = __s1[v13];
              if (!__s1[v13])
                break;
              if ((v15 & 0x80) == 0 && (*(_DWORD *)(v14 + 4 * v15 + 60) & 0x8000) != 0)
                __s1[v13] = __tolower(v15);
              ++v13;
            }
            while (v13 != 1024);
            _MDPlistContainerAddCString();
            atof(v26);
            _MDPlistContainerAddDoubleValue();
          }
          else
          {
            PRSLogCategoryDefault();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = *(_DWORD *)a3;
              v18 = *((_QWORD *)&sQIFetureKeys + *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24));
              v19[0] = 67109890;
              v19[1] = v17;
              v20 = 2080;
              v21 = v18;
              v22 = 2080;
              v23 = __s1;
              v24 = 2080;
              v25 = v26;
              _os_log_error_impl(&dword_1B86C5000, v16, OS_LOG_TYPE_ERROR, "## unexpected type:%d %s-%s value:%s", (uint8_t *)v19, 0x26u);
            }

          }
        }
        else if (v10 == 2)
        {
          json_utf8_string(*(_QWORD *)(a1[6] + 8) + 32, __s1, 0x400uLL);
          json_utf8_string(a3, v26, 0x400uLL);
        }
      }
      return;
    default:
      return;
  }
}

- (void)parseCEPFromData:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  -[PRSBagHandler _base64CEPDataNoCopyFromFeatureData:](self, "_base64CEPDataNoCopyFromFeatureData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PRSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_INFO, "Loading qi features", v10, 2u);
    }

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v7, 0);
    -[PRSBagHandler _processQIFeatures:forClient:](self, "_processQIFeatures:forClient:", v9, v6);

  }
}

+ (void)initialize
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringForKey:", CFSTR("ParsecExtraParam"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "hasPrefix:", CFSTR("&")))
      {
        v4 = objc_msgSend(v6, "copy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&%@"), v6);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)gExtraParam;
      gExtraParam = v4;

      v3 = v6;
    }

  }
}

- (BOOL)isEnabled
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v3 = objc_msgSend(WeakRetained, "isEnabled");

  return v3;
}

- (id)applicationNameForUserAgent
{
  PRSSessionController **p_client;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;

  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "applicationNameForUserAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)userId
{
  return 0;
}

void __30__PRSBagHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = (uint64_t)v1;

}

- (BOOL)searchSupported:(BOOL)a3
{
  return 1;
}

- (PRSBagHandler)init
{
  PRSBagHandler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *bagQueue;
  dispatch_group_t v6;
  OS_dispatch_group *locationGroup;
  id v8;
  id lockObject;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PRSBagHandler;
  v2 = -[PRSBagHandler init](&v19, sel_init);
  *(_OWORD *)&v2->_searchRenderTimeout = xmmword_1B87DED60;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("Bag queue", v3);
  bagQueue = v2->_bagQueue;
  v2->_bagQueue = (OS_dispatch_queue *)v4;

  v6 = dispatch_group_create();
  locationGroup = v2->_locationGroup;
  v2->_locationGroup = (OS_dispatch_group *)v6;

  v8 = objc_alloc_init(MEMORY[0x1E0DE7910]);
  lockObject = v2->_lockObject;
  v2->_lockObject = v8;

  NSHomeDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("Library/Spotlight/parsecResources.plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "mutableCopy");
  else
    v14 = objc_opt_new();
  v15 = (void *)v14;
  -[PRSBagHandler setResourceMetadata:](v2, "setResourceMetadata:", v14);

  -[PRSBagHandler setResourceMetadataNeedsWrite:](v2, "setResourceMetadataNeedsWrite:", 0);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create("Resource fetch queue", v16);
  -[PRSBagHandler setResourceFetchQueue:](v2, "setResourceFetchQueue:", v17);

  -[PRSBagHandler setResourceMetadataPath:](v2, "setResourceMetadataPath:", v11);
  return v2;
}

- (id)excludedDomainIdentifiers
{
  PRSSessionController **p_client;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;

  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "excludedDomainIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)sessionReady
{
  return 1;
}

- (void)updateWithBagDictionary:(id)a3 error:(id)a4
{
  uint64_t v4;

  if (a4)
    v4 = 4;
  else
    v4 = 2;
  -[PRSBagHandler setStatus:](self, "setStatus:", v4);
}

uint64_t __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCorrectionDict:", *(_QWORD *)(a1 + 40));
}

- (void)removeTask:(id)a3
{
  id v4;
  NSObject *bagQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  bagQueue = self->_bagQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__PRSBagHandler_removeTask___block_invoke;
  v7[3] = &unk_1E6E42F88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(bagQueue, v7);

}

uint64_t __28__PRSBagHandler_removeTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)triggerTaskWhenReady:(id)a3
{
  id v4;
  NSObject *bagQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "needsBag"))
  {
    bagQueue = self->_bagQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__PRSBagHandler_triggerTaskWhenReady___block_invoke;
    v6[3] = &unk_1E6E42F88;
    v6[4] = self;
    v7 = v4;
    dispatch_async(bagQueue, v6);

  }
  else
  {
    objc_msgSend(v4, "triggerQuery:", 1);
  }

}

uint64_t __38__PRSBagHandler_triggerTaskWhenReady___block_invoke(uint64_t a1)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4
    || objc_msgSend(*(id *)(a1 + 32), "status") == 2
    || objc_msgSend(*(id *)(a1 + 32), "status") == 3)
  {
    return objc_msgSend(*(id *)(a1 + 40), "triggerQuery:", objc_msgSend(*(id *)(a1 + 32), "status") == 2);
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)getFTEStringsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PRSFTETask *v13;

  v4 = a3;
  PRSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PRSBagHandler getFTEStringsWithReply:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = -[PRSFTETask initWithReply:]([PRSFTETask alloc], "initWithReply:", v4);
  -[PRSBagHandler triggerTaskWhenReady:](self, "triggerTaskWhenReady:", v13);

}

- (BOOL)active
{
  return self->_active;
}

- (PRSSessionController)client
{
  return (PRSSessionController *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (double)searchRenderTimeout
{
  return self->_searchRenderTimeout;
}

- (double)suggestionsRenderTimeout
{
  return self->_suggestionsRenderTimeout;
}

- (SSPlistDataReader)cep_server_values
{
  return (SSPlistDataReader *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCep_server_values:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSSet)appBlocklist
{
  return self->_appBlocklist;
}

- (void)setAppBlocklist:(id)a3
{
  objc_storeStrong((id *)&self->_appBlocklist, a3);
}

- (BOOL)collectAnonymousData
{
  return self->_collectAnonymousData;
}

- (NSArray)anonymousMetadataUndesiredBundleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)use2LayerRanking
{
  return self->_use2LayerRanking;
}

- (NSString)fteLocString
{
  return self->_fteLocString;
}

- (NSString)fteLearnMoreString
{
  return self->_fteLearnMoreString;
}

- (NSString)fteContinueString
{
  return self->_fteContinueString;
}

- (NSString)lookupFirstUseDescription1
{
  return self->_lookupFirstUseDescription1;
}

- (NSString)lookupFirstUseDescription2
{
  return self->_lookupFirstUseDescription2;
}

- (NSString)lookupFirstUseLearnMore
{
  return self->_lookupFirstUseLearnMore;
}

- (BOOL)isBagEnabled
{
  return self->_bagEnabled;
}

- (GEOUserSessionEntity)geoUserSessionEntity
{
  return (GEOUserSessionEntity *)objc_getProperty(self, a2, 184, 1);
}

- (void)setResourceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_resourceMetadata, a3);
}

- (void)setResourceMetadataNeedsWrite:(BOOL)a3
{
  self->_resourceMetadataNeedsWrite = a3;
}

- (NSString)resourceMetadataPath
{
  return self->_resourceMetadataPath;
}

- (void)setResourceMetadataPath:(id)a3
{
  objc_storeStrong((id *)&self->_resourceMetadataPath, a3);
}

- (void)setResourceFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceFetchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceFetchQueue, 0);
  objc_storeStrong((id *)&self->_resourceMetadataPath, 0);
  objc_storeStrong((id *)&self->_resourceMetadata, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntity, 0);
  objc_storeStrong((id *)&self->_lookupFirstUseLearnMore, 0);
  objc_storeStrong((id *)&self->_lookupFirstUseDescription2, 0);
  objc_storeStrong((id *)&self->_lookupFirstUseDescription1, 0);
  objc_storeStrong((id *)&self->_suggestionRankerModelParams, 0);
  objc_storeStrong((id *)&self->_fteContinueString, 0);
  objc_storeStrong((id *)&self->_fteLearnMoreString, 0);
  objc_storeStrong((id *)&self->_fteLocString, 0);
  objc_storeStrong((id *)&self->_anonymousMetadataUndesiredBundleIDs, 0);
  objc_storeStrong((id *)&self->_enabledDomains, 0);
  objc_storeStrong((id *)&self->_appBlocklist, 0);
  objc_storeStrong((id *)&self->_cep_server_values, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_bagQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong(&self->_lockObject, 0);
  objc_storeStrong((id *)&self->_locationGroup, 0);
}

- (void)_processQIFeatures:(os_log_t)log forClient:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "## Error loading qi features", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getFTEStringsWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B86C5000, a1, a3, "[FTE] Triggering task for FTE", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
