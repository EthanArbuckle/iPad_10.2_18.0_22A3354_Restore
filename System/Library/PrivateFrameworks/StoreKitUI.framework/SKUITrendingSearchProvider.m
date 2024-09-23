@implementation SKUITrendingSearchProvider

- (SKUITrendingSearchProvider)initWithClientContext:(id)a3
{
  SKUITrendingSearchProvider *v4;
  id v5;
  NSOperationQueue *v6;
  NSOperationQueue *operationQueue;
  NSMutableArray *v8;
  NSMutableArray *pendingCompletionBlocks;
  void *v10;
  _QWORD *v11;
  void *v12;
  objc_super v14;
  id location;

  objc_initWeak(&location, a3);
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrendingSearchProvider initWithClientContext:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUITrendingSearchProvider;
  v4 = -[SKUITrendingSearchProvider init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_clientContext, v5);

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v6;

    -[NSOperationQueue setName:](v4->_operationQueue, "setName:", CFSTR("com.apple.StoreKitUI.SKUITrendingSearchProvider.operationQueue"));
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingCompletionBlocks = v4->_pendingCompletionBlocks;
    v4->_pendingCompletionBlocks = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (_QWORD *)MEMORY[0x1E0DC4730];
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel_clearCache, *MEMORY[0x1E0DC4768], *MEMORY[0x1E0DC4730]);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_clearCache, *MEMORY[0x1E0DC4778], *v11);

  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SKUITrendingSearchProvider;
  -[SKUITrendingSearchProvider dealloc](&v4, sel_dealloc);
}

- (id)requestOperationWithPageURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  SKUILoadTrendingSearchPageOperation *v8;
  void *v9;
  SKUILoadTrendingSearchPageOperation *v10;

  v6 = a4;
  v7 = a3;
  v8 = [SKUILoadTrendingSearchPageOperation alloc];
  -[SKUITrendingSearchProvider clientContext](self, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SKUILoadTrendingSearchPageOperation initWithClientContext:pageURL:outputBlock:](v8, "initWithClientContext:pageURL:outputBlock:", v9, v7, v6);

  return v10;
}

- (NSOperationQueue)callbackQueue
{
  return (NSOperationQueue *)objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
}

- (void)requestTrendingSearchPageWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SKUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke;
  v7[3] = &unk_1E73A7710;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  -[SKUITrendingSearchProvider requestOperationWithPageURL:completionBlock:](self, "requestOperationWithPageURL:completionBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITrendingSearchProvider operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

  -[SKUITrendingSearchProvider setRunningRequestOperation:](self, "setRunningRequestOperation:", v5);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __63__SKUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__SKUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke_2;
    v12[3] = &unk_1E73A1350;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    v15 = v8;
    v16 = v6;
    objc_msgSend(v9, "addOperationWithBlock:", v12);

  }
}

void __63__SKUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setCachedSearchPage:");
  objc_msgSend(*(id *)(a1 + 48), "pendingCompletionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  objc_msgSend(v2, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 48), "setRunningRequestOperation:", 0);

}

- (void)trendingSearchPageWithURL:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[SKUITrendingSearchProvider cachedSearchPage](self, "cachedSearchPage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SKUITrendingSearchProvider cachedSearchPage](self, "cachedSearchPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8, 0);

  }
  else
  {
    -[SKUITrendingSearchProvider pendingCompletionBlocks](self, "pendingCompletionBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "copy");

    v11 = _Block_copy(v10);
    objc_msgSend(v9, "addObject:", v11);

    -[SKUITrendingSearchProvider runningRequestOperation](self, "runningRequestOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[SKUITrendingSearchProvider requestTrendingSearchPageWithURL:](self, "requestTrendingSearchPageWithURL:", v13);
  }

}

- (void)clearCache
{
  -[SKUITrendingSearchProvider setCachedSearchPage:](self, "setCachedSearchPage:", 0);
}

- (SKUIClientContext)clientContext
{
  return (SKUIClientContext *)objc_loadWeakRetained((id *)&self->_clientContext);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SKUITrendingSearchPage)cachedSearchPage
{
  return self->_cachedSearchPage;
}

- (void)setCachedSearchPage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSearchPage, a3);
}

- (NSMutableArray)pendingCompletionBlocks
{
  return self->_pendingCompletionBlocks;
}

- (NSOperation)runningRequestOperation
{
  return self->_runningRequestOperation;
}

- (void)setRunningRequestOperation:(id)a3
{
  objc_storeStrong((id *)&self->_runningRequestOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRequestOperation, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_cachedSearchPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_clientContext);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITrendingSearchProvider initWithClientContext:]";
}

@end
