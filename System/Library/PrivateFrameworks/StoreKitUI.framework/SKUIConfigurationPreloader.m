@implementation SKUIConfigurationPreloader

- (SKUIConfigurationPreloader)initWithConfigurationCachePath:(id)a3
{
  id v4;
  SKUIConfigurationPreloader *v5;
  uint64_t v6;
  NSString *configurationCachePath;
  NSOperationQueue *v8;
  NSOperationQueue *workQueue;
  NSMutableArray *v10;
  NSMutableArray *completionBlocks;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIConfigurationPreloader initWithConfigurationCachePath:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIConfigurationPreloader;
  v5 = -[SKUIConfigurationPreloader init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configurationCachePath = v5->_configurationCachePath;
    v5->_configurationCachePath = (NSString *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    workQueue = v5->_workQueue;
    v5->_workQueue = v8;

    -[NSOperationQueue setName:](v5->_workQueue, "setName:", CFSTR("com.apple.storekit.configurationpreloader"));
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = v10;

  }
  return v5;
}

- (SKUIConfigurationPreloader)init
{
  void *v3;
  SKUIConfigurationPreloader *v4;

  +[SKUIReloadConfigurationOperation cachePath](SKUIReloadConfigurationOperation, "cachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKUIConfigurationPreloader initWithConfigurationCachePath:](self, "initWithConfigurationCachePath:", v3);

  return v4;
}

- (BOOL)hasExistingConfigurationCache
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIConfigurationPreloader configurationCachePath](self, "configurationCachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)newReloadConfigurationOperation
{
  return objc_alloc_init(SKUIReloadConfigurationOperation);
}

- (void)preloadConfigurationForPurpose:(int64_t)a3 withCompletionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  SKUIURLBag *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v6 = a4;
  -[SKUIConfigurationPreloader loadedConfiguration](self, "loadedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3;
    v20[3] = &unk_1E73A17D0;
    v20[4] = self;
    v21 = v6;
    objc_msgSend(v8, "addOperationWithBlock:", v20);

  }
  else if (a3 || !-[SKUIConfigurationPreloader hasExistingConfigurationCache](self, "hasExistingConfigurationCache"))
  {
    -[SKUIConfigurationPreloader completionBlocks](self, "completionBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = _Block_copy(v10);
    objc_msgSend(v9, "addObject:", v11);

    -[SKUIConfigurationPreloader pendingReloadOperation](self, "pendingReloadOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = -[SKUIConfigurationPreloader newReloadConfigurationOperation](self, "newReloadConfigurationOperation");
      -[SKUIConfigurationPreloader setPendingReloadOperation:](self, "setPendingReloadOperation:", v13);

      if (a3 == 2)
      {
        objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        SSVDefaultUserAgent();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setValue:forHTTPHeaderField:", v15, *MEMORY[0x1E0DAFA58]);

        v16 = -[SSURLBag initWithURLBagContext:]([SKUIURLBag alloc], "initWithURLBagContext:", v14);
        -[SKUIReloadConfigurationOperation setURLBag:](self->_pendingReloadOperation, "setURLBag:", v16);

      }
      objc_initWeak(&location, self);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke;
      v22[3] = &unk_1E73A1D78;
      objc_copyWeak(&v23, &location);
      -[SKUIConfigurationPreloader pendingReloadOperation](self, "pendingReloadOperation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOutputBlock:", v22);

      -[SKUIConfigurationPreloader workQueue](self, "workQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIConfigurationPreloader pendingReloadOperation](self, "pendingReloadOperation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addOperation:", v19);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA70], 0);
  }

}

void __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E73A02E8;
    v9[4] = WeakRetained;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "addOperationWithBlock:", v9);

  }
}

uint64_t __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishPreloadingConfiguration:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "loadedConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)finishPreloadingConfiguration:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SKUIConfigurationPreloader setLoadedConfiguration:](self, "setLoadedConfiguration:", v6);
  -[SKUIConfigurationPreloader setPendingReloadOperation:](self, "setPendingReloadOperation:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SKUIConfigurationPreloader completionBlocks](self, "completionBlocks", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SKUIConfigurationPreloader completionBlocks](self, "completionBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (NSString)configurationCachePath
{
  return self->_configurationCachePath;
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (SKUIReloadConfigurationOperation)pendingReloadOperation
{
  return self->_pendingReloadOperation;
}

- (void)setPendingReloadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReloadOperation, a3);
}

- (NSDictionary)loadedConfiguration
{
  return self->_loadedConfiguration;
}

- (void)setLoadedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_loadedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingReloadOperation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configurationCachePath, 0);
}

- (void)initWithConfigurationCachePath:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIConfigurationPreloader initWithConfigurationCachePath:]";
}

@end
