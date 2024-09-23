@implementation TBRemoteFetchAndCacheOperation

- (TBRemoteFetchAndCacheOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4
{
  TBFetchRequest *v6;
  TBRemoteFetchAndCacheDataSource *v7;
  TBRemoteFetchAndCacheOperation *v8;
  TBFetchRequest *fetchRequest;
  TBFetchRequest *v10;
  TBRemoteFetchAndCacheDataSource *dataSource;
  objc_super v13;

  v6 = (TBFetchRequest *)a3;
  v7 = (TBRemoteFetchAndCacheDataSource *)a4;
  v13.receiver = self;
  v13.super_class = (Class)TBRemoteFetchAndCacheOperation;
  v8 = -[TBRemoteFetchAndCacheOperation init](&v13, sel_init);
  fetchRequest = v8->_fetchRequest;
  v8->_fetchRequest = v6;
  v10 = v6;

  dataSource = v8->_dataSource;
  v8->_dataSource = v7;

  return v8;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  NSDate *v3;
  NSDate *start;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  self->_finished = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  self->_start = v3;

  objc_initWeak(&location, self);
  -[TBRemoteFetchAndCacheOperation fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", 0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__TBRemoteFetchAndCacheOperation_start__block_invoke;
  v9[3] = &unk_1E881E948;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "setResultsHandler:", v9);
  -[TBRemoteFetchAndCacheOperation dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:", v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__TBRemoteFetchAndCacheOperation_start__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  char v25;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __39__TBRemoteFetchAndCacheOperation_start__block_invoke_2;
  v21 = &unk_1E881E920;
  v12 = v7;
  v22 = v12;
  v13 = v8;
  v23 = v13;
  v25 = a4;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  objc_msgSend(v11, "cacheFetchResponse:completionHandler:", v12, &v18);

  objc_msgSend(*(id *)(a1 + 32), "fetchRequest", v18, v19, v20, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resultsHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resultsHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, uint64_t))v17)[2](v17, v12, 0, a4);

  }
  objc_destroyWeak(&v24);

}

void __39__TBRemoteFetchAndCacheOperation_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  id v6;

  NSLog(CFSTR("%s: completed caching response %@"), "-[TBRemoteFetchAndCacheOperation start]_block_invoke_2", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "setResponse:", v3);

    NSLog(CFSTR("%s: finishing caching response"), "-[TBRemoteFetchAndCacheOperation start]_block_invoke_2");
    v6 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "finish");

  }
}

- (void)finish
{
  void *v3;
  double v4;

  -[TBRemoteFetchAndCacheOperation name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  NSLog(CFSTR("%@ finished.  Elapsed: %.2f seconds."), v3, -v4);

  -[TBRemoteFetchAndCacheOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_finished = 1;
  -[TBRemoteFetchAndCacheOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (id)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (TBFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (TBFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (TBRemoteFetchAndCacheDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
