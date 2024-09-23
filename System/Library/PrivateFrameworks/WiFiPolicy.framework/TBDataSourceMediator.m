@implementation TBDataSourceMediator

- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3
{
  id v4;
  TBRemoteDataSource *v5;
  TBDataSourceMediator *v6;

  v4 = a3;
  v5 = objc_alloc_init(TBRemoteDataSource);
  v6 = -[TBDataSourceMediator initWithLocalStoreDescriptor:remoteStore:](self, "initWithLocalStoreDescriptor:remoteStore:", v4, v5);

  return v6;
}

- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3 remoteStore:(id)a4
{
  TBDataSource *v6;
  id v7;
  TBDataSourceMediator *v8;
  TBCoreDataSource *v9;
  uint64_t v10;
  TBCoreDataSource *local;
  TBDataSource *remote;
  TBDataSource *v13;
  NSOperationQueue *v14;
  NSOperationQueue *fetchQueue;
  objc_super v17;

  v6 = (TBDataSource *)a4;
  v17.receiver = self;
  v17.super_class = (Class)TBDataSourceMediator;
  v7 = a3;
  v8 = -[TBDataSourceMediator init](&v17, sel_init);
  v9 = [TBCoreDataSource alloc];
  v10 = -[TBCoreDataSource initWithStoreDescriptor:](v9, "initWithStoreDescriptor:", v7, v17.receiver, v17.super_class);

  local = v8->_local;
  v8->_local = (TBCoreDataSource *)v10;

  remote = v8->_remote;
  v8->_remote = v6;
  v13 = v6;

  v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  fetchQueue = v8->_fetchQueue;
  v8->_fetchQueue = v14;

  return v8;
}

- (void)executeFetchRequest:(id)a3
{
  TBRemoteFetchAndCacheDataSource *v4;
  void *v5;
  void *v6;
  TBPreferLocalFetchDataSource *v7;
  TBRemoteFetchAndCacheOperation *v8;
  TBPreferLocalFetchDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  TBPreferLocalFetchOperation *v13;
  void *v14;
  void *v15;
  TBCoreDataSource *local;
  id v17;
  id v18;

  v18 = a3;
  NSLog(CFSTR("%s: executing fetch request %@"), "-[TBDataSourceMediator executeFetchRequest:]", v18);
  if (objc_msgSend(v18, "sourcePolicy") != 2)
  {
    if (objc_msgSend(v18, "sourcePolicy") == 3)
    {
      v9 = [TBPreferLocalFetchDataSource alloc];
      -[TBDataSourceMediator local](self, "local");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TBDataSourceMediator remote](self, "remote");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TBDataSourceMediator local](self, "local");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TBPreferLocalFetchDataSource initWithLocalDataSource:remoteDataSource:cacheProvider:](v9, "initWithLocalDataSource:remoteDataSource:cacheProvider:", v10, v11, v12);

      v13 = [TBPreferLocalFetchOperation alloc];
      -[TBDataSourceMediator fetchQueue](self, "fetchQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TBPreferLocalFetchOperation initWithFetchRequest:dataSource:fetchQueue:](v13, "initWithFetchRequest:dataSource:fetchQueue:", v18, v7, v14);

      goto LABEL_6;
    }
    if (objc_msgSend(v18, "sourcePolicy") != 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unhandled source policy"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    local = self->_local;
LABEL_10:
    -[TBCoreDataSource executeFetchRequest:](local, "executeFetchRequest:", v18);
    goto LABEL_11;
  }
  if (!objc_msgSend(v18, "cacheable"))
  {
    local = (TBCoreDataSource *)self->_remote;
    goto LABEL_10;
  }
  v4 = [TBRemoteFetchAndCacheDataSource alloc];
  -[TBDataSourceMediator remote](self, "remote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBDataSourceMediator local](self, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TBRemoteFetchAndCacheDataSource initWithFetchDataSource:cacheProvider:](v4, "initWithFetchDataSource:cacheProvider:", v5, v6);

  v8 = -[TBRemoteFetchAndCacheOperation initWithFetchRequest:dataSource:]([TBRemoteFetchAndCacheOperation alloc], "initWithFetchRequest:dataSource:", v18, v7);
LABEL_6:
  -[TBDataSourceMediator fetchQueue](self, "fetchQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v8);

LABEL_11:
}

- (TBCoreDataSource)local
{
  return self->_local;
}

- (NSOperationQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (TBDataSource)remote
{
  return self->_remote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_local, 0);
}

- (void)removeWithFetchRequest:(id)a3
{
  id v4;
  TBCoreDataSource *local;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  NSLog(CFSTR("%s: removing with fetch request %@"), "-[TBDataSourceMediator removeWithFetchRequest:]", v4);
  local = self->_local;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__TBDataSourceMediator_removeWithFetchRequest___block_invoke;
  v7[3] = &unk_1E881D728;
  v8 = v4;
  v6 = v4;
  -[TBCoreDataSource removeWithFetchRequest:completionHandler:](local, "removeWithFetchRequest:completionHandler:", v6, v7);

}

void __47__TBDataSourceMediator_removeWithFetchRequest___block_invoke(uint64_t a1)
{
  TBLocalFetchResponse *v1;
  void (**v2)(id, TBLocalFetchResponse *, _QWORD, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "resultsHandler");
  v2 = (void (**)(id, TBLocalFetchResponse *, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
  v1 = -[TBLocalFetchResponse initWithResults:entityDescription:]([TBLocalFetchResponse alloc], "initWithResults:entityDescription:", 0, 0);
  v2[2](v2, v1, 0, 1);

}

- (void)removeAllWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  NSLog(CFSTR("%s: removing all"), "-[TBDataSourceMediator removeAllWithCompletionHandler:]");
  -[TBCoreDataSource removeAllWithCompletionHandler:](self->_local, "removeAllWithCompletionHandler:", v4);

}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;

  v6 = a4;
  NSLog(CFSTR("%s: prune local store, sizeLimit: %lu bytes"), "-[TBDataSourceMediator prune3BarsNetworks:completionHandler:]", a3);
  -[TBCoreDataSource prune3BarsNetworks:completionHandler:](self->_local, "prune3BarsNetworks:completionHandler:", a3, v6);

}

- (void)setLocal:(id)a3
{
  objc_storeStrong((id *)&self->_local, a3);
}

- (void)setRemote:(id)a3
{
  objc_storeStrong((id *)&self->_remote, a3);
}

- (void)setFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchQueue, a3);
}

@end
