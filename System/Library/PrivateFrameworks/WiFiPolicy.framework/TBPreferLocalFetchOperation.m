@implementation TBPreferLocalFetchOperation

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isReady
{
  return 1;
}

void __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;

  v24 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v6, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v24, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v24, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "code");

    if (v11 == 102)
    {
      v12 = 3;
    }
    else
    {
      objc_msgSend(v24, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "code");

      if (v20 == 103)
        v12 = 2;
      else
        v12 = 4;
    }
    objc_msgSend(v24, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: local fetch error %@"), "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke_2", v21);

    v22 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v24, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_captureCacheEventWithStatus:userInfo:error:type:", v12, v8, v23, *(_QWORD *)(a1 + 40));

    v18 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v18, "_fetchRemote");
  }
  else
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v13, "setResponse:", v24);

    objc_msgSend(v24, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v24, "tiles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: results (%d) tiles (%d) found in local cache"), "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke_2", v15, objc_msgSend(v16, "count"));

    v17 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v17, "_captureCacheEventWithStatus:userInfo:error:type:", 1, v8, 0, *(_QWORD *)(a1 + 40));

    v18 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v18, "finishAndCallCompletionWithResponse:", v24);
  }

}

- (TBFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (TBPreferLocalFetchOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4 fetchQueue:(id)a5
{
  TBFetchRequest *v8;
  TBPreferLocalFetchDataSource *v9;
  NSOperationQueue *v10;
  TBPreferLocalFetchOperation *v11;
  TBFetchRequest *fetchRequest;
  TBFetchRequest *v13;
  TBPreferLocalFetchDataSource *dataSource;
  TBPreferLocalFetchDataSource *v15;
  NSOperationQueue *fetchQueue;
  objc_super v18;

  v8 = (TBFetchRequest *)a3;
  v9 = (TBPreferLocalFetchDataSource *)a4;
  v10 = (NSOperationQueue *)a5;
  v18.receiver = self;
  v18.super_class = (Class)TBPreferLocalFetchOperation;
  v11 = -[TBPreferLocalFetchOperation init](&v18, sel_init);
  fetchRequest = v11->_fetchRequest;
  v11->_fetchRequest = v8;
  v13 = v8;

  dataSource = v11->_dataSource;
  v11->_dataSource = v9;
  v15 = v9;

  fetchQueue = v11->_fetchQueue;
  v11->_fetchQueue = v10;

  return v11;
}

- (void)_captureCacheEventWithStatus:(unint64_t)a3 userInfo:(id)a4 error:(id)a5 type:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a5;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("staleness"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("staleness"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "unsignedIntegerValue");

  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("tileKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("tileKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "unsignedIntegerValue");

  }
  +[TBCacheAnalyticsEvent cacheAnalyticsEventWithStatus:staleness:tileKey:type:error:](TBCacheAnalyticsEvent, "cacheAnalyticsEventWithStatus:staleness:tileKey:type:error:", a3, v10, v12, a6, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v14);

}

- (void)_fetchLocal
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14[2];
  _QWORD v15[4];
  id v16;
  id v17;
  id from;
  id location;

  objc_initWeak(&location, self);
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 1)
    v5 = 1;
  else
    v5 = 2;

  -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v6);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke;
  v15[3] = &unk_1E881DF58;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferLocalHandler:", v15);

  objc_copyWeak(v14, &location);
  v14[1] = (id)v5;
  -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy", v7, 3221225472, __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke_2, &unk_1E881DF80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultsHandler:", &v13);

  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (TBFetchRequest)fetchRequestCopy
{
  return self->_fetchRequestCopy;
}

- (TBPreferLocalFetchDataSource)dataSource
{
  return self->_dataSource;
}

- (void)start
{
  NSDate *v3;
  NSDate *start;
  void *v5;
  void *v6;

  self->_finished = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  self->_start = v3;

  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", 0);
  -[TBPreferLocalFetchOperation setFetchRequestCopy:](self, "setFetchRequestCopy:", v6);

  -[TBPreferLocalFetchOperation _fetchLocal](self, "_fetchLocal");
}

- (void)setFetchRequestCopy:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequestCopy, a3);
}

- (void)finish
{
  void *v3;
  double v4;

  -[TBPreferLocalFetchOperation name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  NSLog(CFSTR("%@ finished.  Elapsed: %.2f seconds."), v3, -v4);

  -[TBPreferLocalFetchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_finished = 1;
  -[TBPreferLocalFetchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

uint64_t __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id v14;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = 0;
  v14 = 0;
  v7 = objc_msgSend(WeakRetained, "_doResults:satisfyFetchRequest:keysToFetchRemotely:satisfiedKeys:", v3, v6, &v14, &v13);
  v8 = v14;
  v9 = v13;

  if ((v7 & 1) != 0)
  {
    NSLog(CFSTR("%s: request is fully satisified by local results (count %lu)"), "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke", objc_msgSend(v3, "count"));
  }
  else
  {
    NSLog(CFSTR("%s: request unsatisfied with local results"), "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke");
    v10 = objc_loadWeakRetained(v4);
    objc_msgSend(v10, "setRemoteKeysToFetch:", v8);

    NSLog(CFSTR("keys needed to fetch remotely %@"), v8);
    v11 = objc_loadWeakRetained(v4);
    objc_msgSend(v11, "setSatisfiedLocalKeys:", v9);

    NSLog(CFSTR("satisifed local keys %@"), v9);
  }

  return v7;
}

- (BOOL)_doResults:(id)a3 satisfyFetchRequest:(id)a4 keysToFetchRemotely:(id *)a5 satisfiedKeys:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") == 2)
  {

  }
  else
  {
    objc_msgSend(v10, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "type");

    if (v13 != 3)
    {
      v25 = objc_msgSend(v9, "count") != 0;
      goto LABEL_20;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v10, "descriptor", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tileItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  objc_msgSend(v9, "valueForKey:", CFSTR("key"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minusSet:", v23);

    v24 = objc_msgSend(v14, "count");
    v25 = v24 == 0;
    if (a5 && v24)
    {
      objc_msgSend(v14, "allObjects");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
      *a6 = objc_retainAutorelease(v22);
  }
  else
  {
    v25 = 0;
  }

LABEL_20:
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satisfiedLocalKeys, 0);
  objc_storeStrong((id *)&self->_remoteKeysToFetch, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_fetchRequestCopy, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

- (id)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)finishAndCallCompletionWithResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);

  v4 = a3;
  -[TBPreferLocalFetchOperation setResponse:](self, "setResponse:", v4);
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultsHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD, uint64_t))v6)[2](v6, v4, 0, 1);

  -[TBPreferLocalFetchOperation finish](self, "finish");
}

- (void)_fetchRemote
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  TBRemoteFetchAndCacheDataSource *v11;
  TBTileFetchRequestDescriptor *v12;
  void *v13;
  void *v14;
  TBRemoteFetchAndCacheDataSource *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TBRemoteFetchAndCacheDataSource *v20;
  TBRemoteFetchAndCacheOperation *v21;
  void *v22;
  TBRemoteFetchAndCacheDataSource *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TBRemoteFetchAndCacheOperation *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id from;
  id location;

  -[TBPreferLocalFetchOperation remoteKeysToFetch](self, "remoteKeysToFetch");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = (void *)v3;
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") != 2)
  {
    -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    if (v9 == 3)
      goto LABEL_5;
LABEL_6:
    v23 = [TBRemoteFetchAndCacheDataSource alloc];
    -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "remoteDataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cacheProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TBRemoteFetchAndCacheDataSource initWithFetchDataSource:cacheProvider:](v23, "initWithFetchDataSource:cacheProvider:", v25, v27);

    v28 = [TBRemoteFetchAndCacheOperation alloc];
    -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TBRemoteFetchAndCacheOperation initWithFetchRequest:dataSource:](v28, "initWithFetchRequest:dataSource:", v29, v11);

    -[TBPreferLocalFetchOperation addDependency:](self, "addDependency:", v12);
    -[TBPreferLocalFetchOperation fetchQueue](self, "fetchQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addOperation:", v12);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v12);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke_2;
    v31[3] = &unk_1E881DFA8;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    -[TBTileFetchRequestDescriptor setCompletionBlock:](v12, "setCompletionBlock:", v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }

LABEL_5:
  -[TBPreferLocalFetchOperation remoteKeysToFetch](self, "remoteKeysToFetch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation _tileItemsFromTileKeys:](self, "_tileItemsFromTileKeys:", v10);
  v11 = (TBRemoteFetchAndCacheDataSource *)objc_claimAutoreleasedReturnValue();

  v12 = -[TBTileFetchRequestDescriptor initWithTileItems:]([TBTileFetchRequestDescriptor alloc], "initWithTileItems:", v11);
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TBTileFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:](TBTileFetchRequest, "fetchRequestWithDescriptor:sourcePolicy:cacheable:", v12, 2, objc_msgSend(v13, "cacheable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [TBRemoteFetchAndCacheDataSource alloc];
  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cacheProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[TBRemoteFetchAndCacheDataSource initWithFetchDataSource:cacheProvider:](v15, "initWithFetchDataSource:cacheProvider:", v17, v19);

  v21 = -[TBRemoteFetchAndCacheOperation initWithFetchRequest:dataSource:]([TBRemoteFetchAndCacheOperation alloc], "initWithFetchRequest:dataSource:", v14, v20);
  -[TBPreferLocalFetchOperation addDependency:](self, "addDependency:", v21);
  -[TBPreferLocalFetchOperation fetchQueue](self, "fetchQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addOperation:", v21);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v21);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke;
  v34[3] = &unk_1E881DFA8;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(&v36, &from);
  -[TBRemoteFetchAndCacheOperation setCompletionBlock:](v21, "setCompletionBlock:", v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_7:
}

void __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_mergeLocalAndRemoteResults:", v3);

}

void __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke_2(id *a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  v1 = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v1 += 4;
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setResponse:", v3);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "finish");

}

- (void)_mergeLocalAndRemoteResults:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  TBTileFetchRequestDescriptor *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  -[TBPreferLocalFetchOperation satisfiedLocalKeys](self, "satisfiedLocalKeys");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") != 2)
  {
    -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    if (v11 == 3)
      goto LABEL_5;
LABEL_6:
    -[TBPreferLocalFetchOperation finishAndCallCompletionWithResponse:](self, "finishAndCallCompletionWithResponse:", v4);
    goto LABEL_7;
  }

LABEL_5:
  -[TBPreferLocalFetchOperation satisfiedLocalKeys](self, "satisfiedLocalKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: fetching remaining satisfied local keys %@"), "-[TBPreferLocalFetchOperation _mergeLocalAndRemoteResults:]", v12);

  -[TBPreferLocalFetchOperation satisfiedLocalKeys](self, "satisfiedLocalKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation _tileItemsFromTileKeys:](self, "_tileItemsFromTileKeys:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[TBTileFetchRequestDescriptor initWithTileItems:]([TBTileFetchRequestDescriptor alloc], "initWithTileItems:", v14);
  +[TBTileFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:](TBTileFetchRequest, "fetchRequestWithDescriptor:sourcePolicy:cacheable:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__TBPreferLocalFetchOperation__mergeLocalAndRemoteResults___block_invoke;
  v19[3] = &unk_1E881DFD0;
  v20 = v4;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v16, "setResultsHandler:", v19);
  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "executeFetchRequest:", v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

LABEL_7:
}

void __59__TBPreferLocalFetchOperation__mergeLocalAndRemoteResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  TBMutableTileFetchResponse *v5;

  v3 = a2;
  v5 = objc_alloc_init(TBMutableTileFetchResponse);
  -[TBMutableTileFetchResponse addResponse:](v5, "addResponse:", *(_QWORD *)(a1 + 32));
  -[TBMutableTileFetchResponse addResponse:](v5, "addResponse:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "finishAndCallCompletionWithResponse:", v5);

}

- (id)_tileItemsFromTileKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17AC818]();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[TBTileItemDescriptor tileItemDescriptorWithKey:](TBTileItemDescriptor, "tileItemDescriptorWithKey:", v11, (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v5);
  return v4;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (TBFetchResponse)response
{
  return self->_response;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSOperationQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchQueue, a3);
}

- (NSArray)remoteKeysToFetch
{
  return self->_remoteKeysToFetch;
}

- (void)setRemoteKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_remoteKeysToFetch, a3);
}

- (NSArray)satisfiedLocalKeys
{
  return self->_satisfiedLocalKeys;
}

- (void)setSatisfiedLocalKeys:(id)a3
{
  objc_storeStrong((id *)&self->_satisfiedLocalKeys, a3);
}

@end
