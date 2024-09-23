@implementation WiFi3BarsSource

- (WiFi3BarsSource)initWithChangeHandler:(id)a3 localStoreType:(unint64_t)a4
{
  id v6;
  WiFi3BarsSource *v7;
  uint64_t v8;
  id changeHandler;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v12;
  NSMutableDictionary *networks;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *storeURL;
  NSURL *v19;
  TBDataSourceMediator *v20;
  TBDataSourceMediator *sourceMediator;
  WiFi3BarsTileFetcher *v22;
  WiFi3BarsTileFetcher *tileFetcher;
  WiFi3BarsTileFetcher *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WiFi3BarsSource;
  v7 = -[WiFi3BarsSource init](&v26, sel_init);
  if (!v7)
    goto LABEL_17;
  if (v6)
  {
    v8 = MEMORY[0x1D17AC9EC](v6);
    changeHandler = v7->changeHandler;
    v7->changeHandler = (id)v8;

  }
  v10 = dispatch_queue_create("com.apple.wifi.3bars-source", MEMORY[0x1E0C80D50]);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v10;

  if (!v7->_queue)
    goto LABEL_17;
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  networks = v7->_networks;
  v7->_networks = v12;

  if (!v7->_networks)
    goto LABEL_17;
  -[WiFi3BarsSource _descriptorForType:](v7, "_descriptorForType:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: store descriptor is nil", buf, 0xCu);
    }
LABEL_17:
    v15 = 0;
LABEL_18:

    v7 = 0;
    goto LABEL_14;
  }
  v15 = v14;
  objc_msgSend(v14, "storeURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  storeURL = v7->_storeURL;
  v7->_storeURL = (NSURL *)v17;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v7->_storeURL;
    *(_DWORD *)buf = 136315394;
    v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: source initialized with storeURL %@", buf, 0x16u);
  }
  v20 = -[TBDataSourceMediator initWithLocalStoreDescriptor:]([TBDataSourceMediator alloc], "initWithLocalStoreDescriptor:", v15);
  sourceMediator = v7->_sourceMediator;
  v7->_sourceMediator = v20;

  if (!v7->_sourceMediator)
    goto LABEL_18;
  if (!objc_msgSend(v15, "type"))
  {
    v22 = -[WiFi3BarsTileFetcher initWithDataSourceMediator:]([WiFi3BarsTileFetcher alloc], "initWithDataSourceMediator:", v7->_sourceMediator);
    tileFetcher = v7->_tileFetcher;
    v7->_tileFetcher = v22;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v7->_tileFetcher;
      *(_DWORD *)buf = 136315394;
      v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: created tile fetcher %@ for server", buf, 0x16u);
    }
  }
  v7->_cacheExpirationInDays = 7;
LABEL_14:

  return v7;
}

- (id)_descriptorForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      +[TBCoreDataStoreDescriptor serverStoreDescriptor](TBCoreDataStoreDescriptor, "serverStoreDescriptor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      +[TBCoreDataStoreDescriptor directStoreDescriptor](TBCoreDataStoreDescriptor, "directStoreDescriptor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      +[TBCoreDataStoreDescriptor clientStoreDescriptor](TBCoreDataStoreDescriptor, "clientStoreDescriptor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      +[TBCoreDataStoreDescriptor tempStoreDescriptor](TBCoreDataStoreDescriptor, "tempStoreDescriptor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)relevantNetworks
{
  return 0;
}

void __74__WiFi3BarsSource_fetchCandidateNetworksMatchingBSSIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[WiFi3BarsSource fetchCandidateNetworksMatchingBSSIDs:completionHandler:]_block_invoke";
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fetch error %@", (uint8_t *)&v11, 0x16u);

    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_matchSearchBSSIDs:toResponse:", *(_QWORD *)(a1 + 40), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

- (id)_matchSearchBSSIDs:(id)a3 toResponse:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  WiFi3BarsNetwork *v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  id obj;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  WiFi3BarsNetwork *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
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
  _QWORD v52[4];
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v6, "resultsByBSSID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = v5;
    obj = v5;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (!v34)
      goto LABEL_33;
    v31 = v6;
    v32 = *(_QWORD *)v49;
    while (1)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v49 != v32)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "reformatBSSID", v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v6, "results");
        v13 = (WiFi3BarsNetwork *)objc_claimAutoreleasedReturnValue();
        v38 = -[WiFi3BarsNetwork countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        if (!v38)
        {
          v26 = 0;
          goto LABEL_29;
        }
        v33 = v11;
        v35 = i;
        v36 = v13;
        v39 = 0;
        v37 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v45 != v37)
              objc_enumerationMutation(v36);
            v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            objc_msgSend(v15, "accessPoints");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v41;
              while (2)
              {
                for (k = 0; k != v18; ++k)
                {
                  if (*(_QWORD *)v41 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
                  v22 = (void *)MEMORY[0x1D17AC818]();
                  objc_msgSend(v21, "BSSID");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "isEqualToString:", v12);

                  if (v24)
                  {
                    v25 = v15;

                    objc_autoreleasePoolPop(v22);
                    v39 = v25;
                    goto LABEL_24;
                  }
                  objc_autoreleasePoolPop(v22);
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
                if (v18)
                  continue;
                break;
              }
            }
LABEL_24:

          }
          v38 = -[WiFi3BarsNetwork countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        }
        while (v38);

        v26 = v39;
        if (v39)
        {
          v13 = -[WiFi3BarsNetwork initWithNetwork:]([WiFi3BarsNetwork alloc], "initWithNetwork:", v39);
          objc_msgSend(v29, "setObject:forKey:", v13, v33);
          v6 = v31;
          i = v35;
LABEL_29:

          goto LABEL_31;
        }
        v6 = v31;
        i = v35;
LABEL_31:

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (!v34)
      {
LABEL_33:

        v5 = v28;
        goto LABEL_34;
      }
    }
  }
  objc_msgSend(v6, "resultsByBSSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __49__WiFi3BarsSource__matchSearchBSSIDs_toResponse___block_invoke;
  v52[3] = &unk_1E881E7C8;
  v53 = v29;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v52);

LABEL_34:
  return v29;
}

- (void)fetch3BarsNetworksForLocation:(id)a3 forceRemote:(BOOL)a4 trigger:(unint64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  TBLocationFetchRequestDescriptor *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *, int);
  void *v32;
  WiFi3BarsSource *v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[WiFi3BarsSource fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingDays:", --[WiFi3BarsSource cacheExpirationInDays](self, "cacheExpirationInDays"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [TBLocationFetchRequestDescriptor alloc];
  objc_msgSend(v10, "coordinate");
  v16 = v15;
  objc_msgSend(v10, "coordinate");
  v18 = v17;
  if (a5 == 1)
  {
    +[TBDefaults nearbyTileSearchRadius](TBDefaults, "nearbyTileSearchRadius");
    v20 = -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:](v14, "initWithLatitude:longitude:radius:maxCacheAge:", v13, v16, v18, v19);
  }
  else
  {
    v20 = -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:maxCacheAge:](v14, "initWithLatitude:longitude:maxCacheAge:", v13, v16, v17);
  }
  v21 = (void *)v20;
  if (v8)
    v22 = 2;
  else
    v22 = 3;
  +[TBLocationFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:](TBLocationFetchRequest, "fetchRequestWithDescriptor:sourcePolicy:cacheable:", v20, v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = CFSTR("tileKey");
  v36[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v21, "primaryTileKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUserInfo:", v26);

  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __87__WiFi3BarsSource_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler___block_invoke;
  v32 = &unk_1E881E700;
  v33 = self;
  v34 = v11;
  v27 = v11;
  objc_msgSend(v23, "setResultsHandler:", &v29);
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator", v29, v30, v31, v32, v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "executeFetchRequest:", v23);

}

- (void)fetchCandidateNetworksMatchingBSSIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  TBNetworkFetchRequestDescriptor *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  WiFi3BarsSource *v17;
  id v18;
  id v19;
  _BYTE *v20;
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WiFi3BarsSource fetchCandidateNetworksMatchingBSSIDs:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fetching candidates for %lu BSSIDS", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = (id)os_transaction_create();
  v8 = -[TBNetworkFetchRequestDescriptor initWithBSSIDs:]([TBNetworkFetchRequestDescriptor alloc], "initWithBSSIDs:", v6);
  +[TBNetworkFetchRequest fetchRequestWithDescriptor:sourcePolicy:](TBNetworkFetchRequest, "fetchRequestWithDescriptor:sourcePolicy:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfo:", &unk_1E88642D8);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __74__WiFi3BarsSource_fetchCandidateNetworksMatchingBSSIDs_completionHandler___block_invoke;
  v16 = &unk_1E881E7A0;
  v17 = self;
  v10 = v6;
  v18 = v10;
  v11 = v7;
  v19 = v11;
  v20 = buf;
  objc_msgSend(v9, "setResultsHandler:", &v13);
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator", v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeFetchRequest:", v9);

  _Block_object_dispose(buf, 8);
}

- (TBDataSourceMediator)sourceMediator
{
  return self->_sourceMediator;
}

- (unint64_t)cacheExpirationInDays
{
  return self->_cacheExpirationInDays;
}

- (void)fetch3BarsNetworksFor:(id)a3
{
  -[WiFi3BarsSource fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:](self, "fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:", a3, 0, 1, 0);
}

- (void)_handleRemoteFetchResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "tiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9)
        goto LABEL_11;
      objc_msgSend(v3, "tiles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
      v14 = 2048;
      v15 = objc_msgSend(v5, "count");
      v10 = MEMORY[0x1E0C81028];
      v11 = "%s: Fetched %lu tiles";
    }
    else
    {
      if (!v9)
        goto LABEL_11;
      objc_msgSend(v3, "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
      v14 = 2048;
      v15 = objc_msgSend(v5, "count");
      v10 = MEMORY[0x1E0C81028];
      v11 = "%s: Fetched %lu results";
    }
    _os_log_impl(&dword_1CC44E000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = 136315394;
    v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
    v14 = 2080;
    v15 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Failed fetch with error %s\n", (uint8_t *)&v12, 0x16u);

LABEL_10:
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFetcher, 0);
  objc_storeStrong((id *)&self->_sourceMediator, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong(&self->relevancyHandler, 0);
  objc_storeStrong(&self->changeHandler, 0);
}

void __87__WiFi3BarsSource_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
    (*((void (**)(id))v7 + 2))(v7);
  objc_msgSend(*(id *)(a1 + 32), "_handleRemoteFetchResponse:", v10);
  if (a4)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }

}

- (void)fetch3BarsNetworksPredictedForLocation:(id)a3 duration:(double)a4 maxLocations:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  double v19;

  v10 = a3;
  v11 = a6;
  -[WiFi3BarsSource queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke;
  block[3] = &unk_1E881E778;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[16];
  _QWORD v17[4];
  NSObject *v18;
  id v19[2];
  id location;

  v2 = dispatch_group_create();
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_group_enter(v2);
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_2;
  v17[3] = &unk_1E881E750;
  v19[1] = *(id *)(a1 + 56);
  v4 = v2;
  v18 = v4;
  objc_copyWeak(v19, &location);
  v5 = (void *)MEMORY[0x1D17AC9EC](v17);
  objc_msgSend(MEMORY[0x1E0D18468], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", v7, v8, v5, *(double *)(a1 + 64));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Querying current location", buf, 2u);
  }
  dispatch_group_enter(v4);
  v9 = objc_loadWeakRetained(&location);
  v10 = *(_QWORD *)(a1 + 40);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_18;
  v14[3] = &unk_1E881E728;
  v11 = v4;
  v15 = v11;
  objc_msgSend(v9, "fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:", v10, 0, 2, v14);

  v12 = dispatch_time(0, 3600000000000);
  dispatch_group_wait(v11, v12);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  id WeakRetained;
  id v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  _QWORD v35[3];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v26 = objc_msgSend(v5, "count");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35[0] = v26;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[predictedLocationsOfInterest count] <%ld>", buf, 0xCu);
  }
  if (!v6 && v26)
  {
    v25 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v31;
      v27 = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1D17AC818]();
          if (v10 < *(_QWORD *)(a1 + 48))
          {
            objc_msgSend(v13, "confidence");
            if (v15 >= 0.5)
            {
              dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
              objc_msgSend(v13, "locationOfInterest");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_alloc(MEMORY[0x1E0C9E3B0]);
              objc_msgSend(v16, "location");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "latitude");
              v20 = v19;
              objc_msgSend(v16, "location");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "longitude");
              v23 = (void *)objc_msgSend(v17, "initWithLatitude:longitude:", v20, v22);

              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                LODWORD(v35[0]) = v10 + 1;
                WORD2(v35[0]) = 2048;
                *(_QWORD *)((char *)v35 + 6) = v26;
                _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Querying predicted location %d/%ld", buf, 0x12u);
              }
              WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
              v28[0] = MEMORY[0x1E0C809B0];
              v28[1] = 3221225472;
              v28[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_14;
              v28[3] = &unk_1E881E728;
              v29 = *(id *)(a1 + 32);
              objc_msgSend(WeakRetained, "fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:", v23, 0, 3, v28);

              ++v10;
              v7 = v27;
            }
          }
          objc_autoreleasePoolPop(v14);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    v6 = 0;
    v5 = v25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_14(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_18(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prune3BarsNetworks:completionHandler:", a3, v6);

}

void __49__WiFi3BarsSource__matchSearchBSSIDs_toResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WiFi3BarsNetwork *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[WiFi3BarsNetwork initWithNetwork:]([WiFi3BarsNetwork alloc], "initWithNetwork:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TBNetworkFetchRequestDescriptor *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[WiFi3BarsSource forceFetch3BarsNetworkMatchingBSSID:completionHandler:]";
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fetching 3bars network for %{mask.hash}@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingDays:", --[WiFi3BarsSource cacheExpirationInDays](self, "cacheExpirationInDays"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:]([TBNetworkFetchRequestDescriptor alloc], "initWithBSSIDs:maxCacheAge:", v8, v10);
  +[TBNetworkFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:](TBNetworkFetchRequest, "fetchRequestWithDescriptor:sourcePolicy:cacheable:", v11, 3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInfo:", &unk_1E8864300);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__WiFi3BarsSource_forceFetch3BarsNetworkMatchingBSSID_completionHandler___block_invoke;
  v16[3] = &unk_1E881E7F0;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v12, "setResultsHandler:", v16);
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "executeFetchRequest:", v12);

}

void __73__WiFi3BarsSource_forceFetch3BarsNetworkMatchingBSSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WiFi3BarsSource forceFetch3BarsNetworkMatchingBSSID:completionHandler:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fetch error %@", (uint8_t *)&v10, 0x16u);

    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_matchSearchBSSIDs:toResponse:", *(_QWORD *)(a1 + 40), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setResults:", v7);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    objc_msgSend(v3, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v4, v9);

  }
}

- (void)submitCacheAnalyticsEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[TBTileMO fetchRequest](TBTileMO, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIncludesSubentities:", 0);
    +[TBTileMO fetchRequest](TBTileMO, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIncludesSubentities:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingDays:", -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("created > %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v9);

    v17 = 0;
    v10 = objc_msgSend(v4, "countForFetchRequest:error:", v5, &v17);
    v11 = v17;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
        v20 = 2112;
        v21 = (uint64_t)v11;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: error fetching all tiles %@", buf, 0x16u);
      }
    }
    else
    {
      v16 = 0;
      v12 = objc_msgSend(v4, "countForFetchRequest:error:", v6, &v16);
      v13 = v16;
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
          v20 = 2112;
          v21 = (uint64_t)v11;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: error fetching last day tiles %@", buf, 0x16u);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315650;
          v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
          v20 = 2048;
          v21 = v10;
          v22 = 2048;
          v23 = v12;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: allCount: %lu lastDayCount: %lu", buf, 0x20u);
        }
        +[TBCacheAnalyticsEvent cacheEventWithTotalCount:last24HoursCount:](TBCacheAnalyticsEvent, "cacheEventWithTotalCount:last24HoursCount:", v10, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v15);

      }
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: unable to get moc", buf, 0xCu);
  }

}

- (void)setCacheExpirationInDays:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WiFi3BarsSource setCacheExpirationInDays:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: setting new cache expiration %lu", (uint8_t *)&v7, 0x16u);
  }
  self->_cacheExpirationInDays = a3;
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCacheExpirationInDays:", a3);

}

- (id)changeHandler
{
  return self->changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)relevancyHandler
{
  return self->relevancyHandler;
}

- (void)setRelevancyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_networks, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSourceMediator:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMediator, a3);
}

- (WiFi3BarsTileFetcher)tileFetcher
{
  return self->_tileFetcher;
}

- (void)setTileFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_tileFetcher, a3);
}

@end
