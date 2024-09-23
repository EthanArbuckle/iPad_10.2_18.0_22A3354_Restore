@implementation WFRuntimeRunnableDataSource

- (WFRuntimeRunnableDataSource)init
{
  WFRuntimeRunnableDataSource *v2;
  WFRuntimeRunnableDataSourceImpl *v3;
  WFRuntimeRunnableDataSourceImpl *impl;
  WFRuntimeRunnableDataSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFRuntimeRunnableDataSource;
  v2 = -[WFRuntimeRunnableDataSource init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WFRuntimeRunnableDataSourceImpl);
    impl = v2->_impl;
    v2->_impl = v3;

    v5 = v2;
  }

  return v2;
}

- (void)loadEntriesFor:(Class)a3 parameterKey:(id)a4 limit:(int64_t)a5 collectionIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  -[WFRuntimeRunnableDataSource impl](self, "impl");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loadEntriesFor:parameterKey:collectionIdentifier:limit:completionHandler:", a3, v14, v13, a5, v12);

}

- (WFRuntimeRunnableDataSourceImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (id)sharedDataSource
{
  if (sharedDataSource_onceToken != -1)
    dispatch_once(&sharedDataSource_onceToken, &__block_literal_global_40796);
  return (id)sharedDataSource_dataSource;
}

void __47__WFRuntimeRunnableDataSource_sharedDataSource__block_invoke()
{
  WFRuntimeRunnableDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(WFRuntimeRunnableDataSource);
  v1 = (void *)sharedDataSource_dataSource;
  sharedDataSource_dataSource = (uint64_t)v0;

}

@end
