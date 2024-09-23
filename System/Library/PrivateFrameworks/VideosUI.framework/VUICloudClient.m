@implementation VUICloudClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_65);
  return (id)sharedInstance__sharedInstance;
}

void __32__VUICloudClient_sharedInstance__block_invoke()
{
  VUICloudClient *v0;
  void *v1;

  v0 = objc_alloc_init(VUICloudClient);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (VUICloudClient)init
{
  VUICloudClient *v2;
  uint64_t v3;
  NSMutableDictionary *artworkMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUICloudClient;
  v2 = -[VUICloudClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    artworkMap = v2->_artworkMap;
    v2->_artworkMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)loadArtworkURLsForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, BOOL);
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  VUICloudClient *val;
  id v37;
  void (**v38)(id, id, BOOL);
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id location;
  _QWORD v46[4];
  NSObject *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD aBlock[4];
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, BOOL))a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DDBF10]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke;
  v55[3] = &unk_1E9F9DFF8;
  v55[4] = self;
  v11 = v9;
  v56 = v11;
  v12 = v10;
  v57 = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v55);
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v11, "count");
  v15 = v14;
  if (v13)
    v7[2](v7, v12, v14 == 0);
  if (v15)
  {
    val = self;
    v37 = v12;
    v38 = v7;
    v39 = v6;
    v35 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v11, "count");
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      do
      {
        if (v19 >= 0x1F4)
          v21 = 500;
        else
          v21 = v19;
        objc_msgSend(v11, "subarrayWithRange:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);
        v19 -= v21;
        v20 += v21;

      }
      while (v19);
    }
    v23 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E9F9E020;
    v34 = v16;
    v54 = v34;
    v24 = _Block_copy(aBlock);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v25 = v17;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v50 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          dispatch_group_enter(v23);
          v31 = (void *)objc_msgSend(v30, "copy");
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_3;
          v46[3] = &unk_1E9F9E048;
          v48 = v24;
          v47 = v23;
          objc_msgSend(v8, "loadArtworkInfoForPurchaseHistoryIDs:completionHandler:", v31, v46);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v27);
    }

    objc_initWeak(&location, val);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_4;
    block[3] = &unk_1E9F997F0;
    objc_copyWeak(&v44, &location);
    v41 = v8;
    v42 = v34;
    v43 = v35;
    v32 = v35;
    v33 = v34;
    dispatch_group_notify(v23, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

    v7 = v38;
    v6 = v39;
    v12 = v37;
  }

}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v4);
  else
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = a1;
  v17 = *(id *)(a1 + 32);
  objc_sync_enter(v17);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v27 = *(_QWORD *)v30;
    v25 = *MEMORY[0x1E0DDBC80];
    v26 = *MEMORY[0x1E0DDBC48];
    v23 = *MEMORY[0x1E0DDBC78];
    v24 = *MEMORY[0x1E0DDBC60];
    v22 = *MEMORY[0x1E0DDBC58];
    v20 = *MEMORY[0x1E0DDBC70];
    v21 = *MEMORY[0x1E0DDBC50];
    do
    {
      v28 = v4;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v24);
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v23);
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && v9 | v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v10)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("template-url"));
          if (v9)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("full-url"));
          if (v11)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("full-token"));
          if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("supports-layered-image"));

          }
          if (v12)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("cover-art-url"));
          objc_msgSend(*(id *)(v18 + 32), "setObject:forKeyedSubscript:", v15, v8);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v4);
  }

  objc_sync_exit(v17);
}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__VUICloudClient_loadArtworkURLsForPurchaseHistoryIDs_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "artworkMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (NSMutableDictionary)artworkMap
{
  return self->_artworkMap;
}

- (void)setArtworkMap:(id)a3
{
  objc_storeStrong((id *)&self->_artworkMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMap, 0);
}

@end
