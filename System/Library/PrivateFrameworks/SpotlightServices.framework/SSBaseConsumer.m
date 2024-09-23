@implementation SSBaseConsumer

- (SSBaseConsumer)init
{
  SSBaseConsumer *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSString *identifier;
  SSBaseConsumer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSBaseConsumer;
  v2 = -[SSBaseConsumer init](&v10, sel_init);
  if (v2)
  {
    if (-[SSBaseConsumer isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("SSBaseConsumer is an abstract class and should not be instantiated directly."));
    if (!-[SSBaseConsumer enabled](v2, "enabled"))
    {
      v8 = 0;
      goto LABEL_10;
    }
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_14);
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = init_clientBundleIdentifier;
    -[SSBaseConsumer consumerLabel](v2, "consumerLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.BiomeConsumer.%@"), v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v6;

  }
  v8 = v2;
LABEL_10:

  return v8;
}

void __22__SSBaseConsumer_init__block_invoke()
{
  void *v0;

  v0 = (void *)init_clientBundleIdentifier;
  init_clientBundleIdentifier = (uint64_t)CFSTR("com.apple.searchd");

}

+ (id)sharedInstance
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Derived class must override this abstractMethod"));
  return 0;
}

- (BOOL)enabled
{
  return +[SSBiomeConsumers enabled](SSBiomeConsumers, "enabled");
}

- (id)consumerLabel
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Derived class must override this abstractMethod"));
  return 0;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)stream
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Derived class must override this abstractMethod"));
  return 0;
}

- (void)start
{
  id v3;
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *indexQueue;
  id v17;
  void *v18;
  BMBiomeScheduler *v19;
  BMBiomeScheduler *scheduler;
  void *v21;
  void *v22;
  void *v23;
  BPSSink *v24;
  BPSSink *sink;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id location;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    -[SSBaseConsumer identifier](self, "identifier");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (OS_dispatch_queue *)dispatch_queue_create(v4, v6);
    queue = self->_queue;
    self->_queue = v7;

  }
  if (!self->_indexQueue)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[SSBaseConsumer identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.indexQueue"), v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (OS_dispatch_queue *)dispatch_queue_create(v12, v14);
    indexQueue = self->_indexQueue;
    self->_indexQueue = v15;

  }
  v17 = objc_alloc(MEMORY[0x1E0D025E0]);
  -[SSBaseConsumer identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (BMBiomeScheduler *)objc_msgSend(v17, "initWithIdentifier:targetQueue:waking:", v18, self->_queue, 0);
  scheduler = self->_scheduler;
  self->_scheduler = v19;

  -[SSBaseConsumer stream](self, "stream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "DSLPublisherWithUseCase:", CFSTR("SpotlightEngagementData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "subscribeOn:", self->_scheduler);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __23__SSBaseConsumer_start__block_invoke;
  v30[3] = &unk_1E6E43DD0;
  v30[4] = self;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __23__SSBaseConsumer_start__block_invoke_69;
  v28[3] = &unk_1E6E43DF8;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v23, "sinkWithCompletion:receiveInput:", v30, v28);
  v24 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v24;

  SSGeneralLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    -[SSBaseConsumer identifier](self, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl(&dword_1B86C5000, v26, OS_LOG_TYPE_DEFAULT, "%@: start listening.", buf, 0xCu);

  }
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

void __23__SSBaseConsumer_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  SSGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __23__SSBaseConsumer_start__block_invoke_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B86C5000, v6, OS_LOG_TYPE_DEFAULT, "%@: done listening.", (uint8_t *)&v8, 0xCu);

  }
}

void __23__SSBaseConsumer_start__block_invoke_69(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      objc_msgSend(v6, "eventBody");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleEvent:", v5);

    }
  }

}

- (void)stop
{
  BPSSink *sink;
  BMBiomeScheduler *scheduler;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[BMBiomeScheduler cancel](self->_scheduler, "cancel");
  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

  SSGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SSBaseConsumer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B86C5000, v5, OS_LOG_TYPE_DEFAULT, "%@: finished listening.", (uint8_t *)&v7, 0xCu);

  }
}

- (BOOL)filterEvent:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Derived class must override this abstractMethod"));
  return 0;
}

- (void)handleEvent:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Derived class must override this abstractMethod"));
}

- (void)indexItems:(id)a3 protectionClass:(id)a4 bundleID:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0DA9B70];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v10, 0, 0, v9, v8, 0, 0);

}

- (id)queryWithString:(id)a3 bundleIDs:(id)a4 fetchAttributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  dispatch_group_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v10, "setBundleIDs:", v8);
  objc_msgSend(v10, "setInternal:", 1);
  objc_msgSend(v10, "setFetchAttributes:", v9);
  v11 = dispatch_group_create();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v7, v10);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v31 = v13;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke;
  v25[3] = &unk_1E6E438A8;
  v25[4] = &v26;
  objc_msgSend(v12, "setFoundItemsHandler:", v25);
  v20 = v14;
  v21 = 3221225472;
  v22 = __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke_2;
  v23 = &unk_1E6E43E20;
  v15 = v11;
  v24 = v15;
  objc_msgSend(v12, "setCompletionHandler:", &v20);
  dispatch_group_enter(v15);
  objc_msgSend(v12, "start", v20, v21, v22, v23);
  v16 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v15, v16);
  v17 = (id)v27[5];
  objc_sync_enter(v17);
  v18 = (void *)objc_msgSend((id)v27[5], "copy");
  objc_sync_exit(v17);

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_sync_enter(v8);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7, (_QWORD)v9);
        objc_sync_exit(v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __23__SSBaseConsumer_start__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_ERROR, "%@: error listening: %@", (uint8_t *)&v7, 0x16u);

}

@end
