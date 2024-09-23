@implementation TBRemoteDataSource

- (TBRemoteDataSource)init
{
  TBRemoteDataSource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TBRemoteDataSource;
  v2 = -[TBRemoteDataSource init](&v6, sel_init);
  if (!v2)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/ThreeBars/Data Sources/TBRemoteDataSource.m", 38, 0);
LABEL_6:

    return 0;
  }
  v3 = dispatch_queue_create("com.apple.wifi.threebars.service", MEMORY[0x1E0C80D50]);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  if (!v2->_queue)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_queue", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/ThreeBars/Data Sources/TBRemoteDataSource.m", 41, 0);
    goto LABEL_6;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (unint64_t)type
{
  return 1;
}

- (void)_submitNetworkSearch:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D27210];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ticketForWiFiQualityNetworkServiceRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBRemoteDataSource queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitNetworkSearchWithCompletionQueue:completion:", v12, v7);

}

- (void)executeFetchRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  switch(v6)
  {
    case 3:
      -[TBRemoteDataSource _executeTileFetchRequest:](self, "_executeTileFetchRequest:", v4);
      break;
    case 2:
      -[TBRemoteDataSource _executeLocationFetchRequest:](self, "_executeLocationFetchRequest:", v4);
      break;
    case 1:
      -[TBRemoteDataSource _executeNetworkFetchRequest:](self, "_executeNetworkFetchRequest:", v4);
      break;
    default:
      v7.receiver = self;
      v7.super_class = (Class)TBRemoteDataSource;
      -[TBDataSource executeFetchRequest:](&v7, sel_executeFetchRequest_, v4);
      break;
  }

}

- (void)_executeNetworkFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    v16 = (id)os_transaction_create();
    v7 = mach_absolute_time();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__TBRemoteDataSource__executeNetworkFetchRequest___block_invoke;
    v11[3] = &unk_1E881CCE0;
    v14 = v7;
    v11[4] = self;
    v12 = v4;
    v13 = v15;
    -[TBRemoteDataSource _submitNetworkSearch:completion:](self, "_submitNetworkSearch:completion:", v6, v11);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("remoteRequest property is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError fetchMissingParametersErrorWithUserInfo:](TBError, "fetchMissingParametersErrorWithUserInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("%s: failed to create GEOWiFiQualityNetworkSearch"), "-[TBRemoteDataSource _executeNetworkFetchRequest:]");
    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleResponse:", v10);

  }
}

void __50__TBRemoteDataSource__executeNetworkFetchRequest___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = mach_absolute_time();
  v7 = MachTimeToSecs(v6 - a1[7]);
  if (v5)
  {
    NSLog(CFSTR("%s: error %@"), "-[TBRemoteDataSource _executeNetworkFetchRequest:]_block_invoke", v5);
    +[TBErrorFetchResponse remoteResponseWithError:](TBErrorFetchResponse, "remoteResponseWithError:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  else
  {
    +[TBNetworkRemoteFetchResponse responseWithNetworkSearchResults:](TBNetworkRemoteFetchResponse, "responseWithNetworkSearchResults:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "count");

    objc_msgSend(v8, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: fetched %lu results in %gs"), "-[TBRemoteDataSource _executeNetworkFetchRequest:]_block_invoke", objc_msgSend(v11, "count"), *(_QWORD *)&v7);

  }
  v12 = (void *)a1[4];
  v13 = a1[5];
  objc_msgSend(v8, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitAnalyticsEventForFetchRequest:duration:error:resultCount:", v13, v14, v9, v7);

  objc_msgSend((id)a1[5], "handleResponse:", v8);
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

}

- (void)_fetchTilesWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  TBRemoteDataSource *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tileItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v4, "userInfo"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trigger")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("trigger"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

    }
    else
    {
      v11 = 0;
    }
    -[TBRemoteDataSource queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke;
    block[3] = &unk_1E881CD30;
    v17 = v6;
    v18 = self;
    v19 = v4;
    v20 = v11;
    dispatch_async(v12, block);

    v13 = v17;
  }
  else
  {
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("tileItem property is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError fetchMissingParametersErrorWithUserInfo:](TBError, "fetchMissingParametersErrorWithUserInfo:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("%s: failed to create tile key fetches"), "-[TBRemoteDataSource _fetchTilesWithRequest:]");
    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleResponse:", v15);

  }
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v14 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  NSLog(CFSTR("%s: fetching %lu tiles"), "-[TBRemoteDataSource _fetchTilesWithRequest:]_block_invoke", v3);
  v4 = 0;
  v5 = 1;
  do
  {
    if (v4 < v3)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
    v7 = v4 + 1;
    if (v3 - 1 == v4 || 10 * (v5 / 0xA) - 1 == v4)
    {
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      v9 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_2;
      v16[3] = &unk_1E881CD08;
      v10 = v2;
      v17 = v10;
      v21 = v7;
      v22 = v3;
      v18 = *(id *)(a1 + 48);
      v19 = v8;
      v11 = *(_QWORD *)(a1 + 40);
      v23 = v14;
      v20 = v11;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = v8;
      objc_msgSend(v9, "_fetchTilesForTileItems:completionHandler:trigger:", v10, v16, v12);
      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

    }
    ++v5;
    v4 = v7;
  }
  while (v7 <= v3);

}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 40), "resultsHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "resultsHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_3;
    v13[3] = &unk_1E881C8E8;
    v14 = *(id *)(a1 + 48);
    ((void (**)(_QWORD, id, _QWORD *, BOOL))v7)[2](v7, v3, v13, v4 == v5);

    if (v4 == v5)
    {
      v8 = mach_absolute_time();
      v9 = MachTimeToSecs(v8 - *(_QWORD *)(a1 + 80));
      v10 = *(void **)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "submitAnalyticsEventForFetchRequest:duration:error:resultCount:", v11, v12, *(_QWORD *)(a1 + 72), v9);

    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_fetchTilesForTileItems:(id)a3 completionHandler:(id)a4 trigger:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id obj;
  uint64_t v23;
  _QWORD block[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  NSObject *v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__0;
  v37[4] = __Block_byref_object_dispose__0;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = dispatch_group_create();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        dispatch_group_enter(v8);
        v12 = mach_absolute_time();
        objc_msgSend(MEMORY[0x1E0D27210], "sharedService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "etag");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ticketForWiFiQualityTileLoadForKey:eTag:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[TBRemoteDataSource queue](self, "queue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke;
        v28[3] = &unk_1E881CD58;
        v31 = v12;
        v32 = a5;
        v28[4] = self;
        v30 = v37;
        v29 = v8;
        objc_msgSend(v17, "submitTileLoadWithCompletionQueue:completion:", v18, v28);

        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  -[TBRemoteDataSource queue](self, "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke_2;
  block[3] = &unk_1E881CD80;
  v27 = v37;
  block[4] = self;
  v26 = v21;
  v20 = v21;
  dispatch_group_notify(v8, v19, block);

  _Block_object_dispose(v37, 8);
}

void __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  TBRemoteFetchTileItem *v19;
  id v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if ((a3 & 1) != 0)
  {
    if (!v13)
    {
      v15 = 2;
LABEL_9:
      v19 = -[TBRemoteFetchTileItem initWithTile:status:etag:error:]([TBRemoteFetchTileItem alloc], "initWithTile:status:etag:error:", v11, v15, v12, 0);
      v20 = *(id *)(a1 + 32);
      objc_sync_enter(v20);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v19);
      goto LABEL_10;
    }
LABEL_13:
    NSLog(CFSTR("%s: error %@"), "-[TBRemoteDataSource _fetchTilesForTileItems:completionHandler:trigger:]_block_invoke", v14);
    goto LABEL_14;
  }
  if (!v13)
  {
    v15 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v13, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", v17))
  {

    goto LABEL_12;
  }
  v18 = objc_msgSend(v14, "code");

  if (v18 != -7)
  {
LABEL_12:
    v21 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 32), "_captureTileFetchError:tileKey:duration:trigger:", v14, v22, *(_QWORD *)(a1 + 64), MachTimeToSecs(v21 - *(_QWORD *)(a1 + 56)));
    goto LABEL_13;
  }
  v19 = -[TBRemoteFetchTileItem initWithEmptyTileKey:etag:error:]([TBRemoteFetchTileItem alloc], "initWithEmptyTileKey:etag:error:", objc_msgSend(v22, "integerValue"), v12, v14);
  v20 = *(id *)(a1 + 32);
  objc_sync_enter(v20);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v19);
LABEL_10:
  objc_sync_exit(v20);

LABEL_14:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  NSLog(CFSTR("%s: finished tile downloads %lu"), "-[TBRemoteDataSource _fetchTilesForTileItems:completionHandler:trigger:]_block_invoke_2", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
  v2 = *(_QWORD *)(a1 + 40);
  +[TBTileRemoteFetchResponse responseWithTileItems:](TBTileRemoteFetchResponse, "responseWithTileItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)_writeSearchTileToFile:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB36F8];
  v10 = 0;
  v4 = a3;
  objc_msgSend(v3, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend(v4, "tileKey");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("/tmp/tile_%llu"), v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeToURL:atomically:", v9, 1);

}

- (void)_captureTileFetchError:(id)a3 tileKey:(id)a4 duration:(double)a5 trigger:(unint64_t)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "numberWithDouble:", a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[TBFetchAnalyticsEvent fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:](TBFetchAnalyticsEvent, "fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:", 2, 3, a6, v13, &unk_1E8861FE0, 0, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v12);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

@end
