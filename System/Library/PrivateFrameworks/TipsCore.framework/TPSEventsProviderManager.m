@implementation TPSEventsProviderManager

+ (id)defaultManager
{
  if (defaultManager_predicate != -1)
    dispatch_once(&defaultManager_predicate, &__block_literal_global_22);
  return (id)defaultManager_gDataProviderDefaultManager;
}

void __42__TPSEventsProviderManager_defaultManager__block_invoke()
{
  TPSEventsProviderManager *v0;
  void *v1;

  v0 = objc_alloc_init(TPSEventsProviderManager);
  v1 = (void *)defaultManager_gDataProviderDefaultManager;
  defaultManager_gDataProviderDefaultManager = (uint64_t)v0;

}

- (TPSEventsProviderManager)init
{
  TPSEventsProviderManager *v2;
  TPSContentStatusEventsProvider *v3;
  TPSContentStatusEventsProvider *contentStatusEventsProvider;
  TPSBiomeEventsProvider *v5;
  TPSBiomeEventsProvider *biomeEventsProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSEventsProviderManager;
  v2 = -[TPSEventsProviderManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TPSContentStatusEventsProvider);
    contentStatusEventsProvider = v2->_contentStatusEventsProvider;
    v2->_contentStatusEventsProvider = v3;

    -[TPSEventsProvider setDelegate:](v2->_contentStatusEventsProvider, "setDelegate:", v2);
    v5 = objc_alloc_init(TPSBiomeEventsProvider);
    biomeEventsProvider = v2->_biomeEventsProvider;
    v2->_biomeEventsProvider = v5;

    -[TPSEventsProvider setDelegate:](v2->_biomeEventsProvider, "setDelegate:", v2);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_respondsToDidFinishQueryWithResults = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidReceiveCallbackWithResult = objc_opt_respondsToSelector() & 1;
  }

}

- (int64_t)_dataTypeForDataProvider:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 3;
    else
      v4 = -1;
  }

  return v4;
}

- (void)queryEvents:(id)a3 type:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = 16;
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v7 = 24;
LABEL_5:
    v8 = v6;
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "queryEvents:", v6);
    v6 = v8;
  }

}

- (void)registerCallbackForEvents:(id)a3 type:(int64_t)a4
{
  if (a4 == 3)
    -[TPSBiomeEventsProvider registerEventsForCallback:](self->_biomeEventsProvider, "registerEventsForCallback:", a3);
}

- (void)registerWakingCallbackForEvents:(id)a3 type:(int64_t)a4 clientIdentifier:(id)a5
{
  if (a4 == 3)
    -[TPSBiomeEventsProvider registerEventsForWakingCallback:clientIdentifier:](self->_biomeEventsProvider, "registerEventsForWakingCallback:clientIdentifier:", a3, a5);
}

- (void)unregisterAllWakingEvents
{
  TPSBiomeEventsProvider *biomeEventsProvider;

  biomeEventsProvider = self->_biomeEventsProvider;
  if (biomeEventsProvider)
    -[TPSBiomeEventsProvider deregisterAllEventsForCallback](biomeEventsProvider, "deregisterAllEventsForCallback");
}

- (void)dataProvider:(id)a3 didFinishQueryWithResults:(id)a4
{
  id v6;
  int64_t v7;
  id WeakRetained;

  if (self->_respondsToDidFinishQueryWithResults)
  {
    v6 = a4;
    v7 = -[TPSEventsProviderManager _dataTypeForDataProvider:](self, "_dataTypeForDataProvider:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dataProviderManager:didFinishQueryWithResults:type:", self, v6, v7);

  }
}

- (void)dataProvider:(id)a3 didReceiveCallbackWithResult:(id)a4
{
  id v6;
  int64_t v7;
  id WeakRetained;

  if (self->_respondsToDidReceiveCallbackWithResult)
  {
    v6 = a4;
    v7 = -[TPSEventsProviderManager _dataTypeForDataProvider:](self, "_dataTypeForDataProvider:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dataProviderManager:didReceiveCallbackWithResult:type:", self, v6, v7);

  }
}

- (TPSDEventsProviderManagerDelegate)delegate
{
  return (TPSDEventsProviderManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_biomeEventsProvider, 0);
  objc_storeStrong((id *)&self->_contentStatusEventsProvider, 0);
}

@end
