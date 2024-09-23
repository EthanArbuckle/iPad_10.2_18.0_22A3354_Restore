@implementation RMStatusPublisherDelegate

+ (id)sharedDelegateWithPublisherClass:(Class)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__RMStatusPublisherDelegate_sharedDelegateWithPublisherClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = a3;
  if (sharedDelegateWithPublisherClass__onceToken != -1)
    dispatch_once(&sharedDelegateWithPublisherClass__onceToken, block);
  return (id)sharedDelegateWithPublisherClass__delegate;
}

void __62__RMStatusPublisherDelegate_sharedDelegateWithPublisherClass___block_invoke(uint64_t a1)
{
  RMStatusPublisherDelegate *v1;
  void *v2;

  v1 = -[RMStatusPublisherDelegate initWithPublisherClass:]([RMStatusPublisherDelegate alloc], "initWithPublisherClass:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedDelegateWithPublisherClass__delegate;
  sharedDelegateWithPublisherClass__delegate = (uint64_t)v1;

}

- (RMStatusPublisherDelegate)initWithPublisherClass:(Class)a3
{
  RMStatusPublisherDelegate *v4;
  RMStatusPublisherDelegate *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *publisherQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  RMSharedLock *fetchLock;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RMStatusPublisherDelegate;
  v4 = -[RMStatusPublisherDelegate init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_publisherClass, a3);
    v6 = dispatch_queue_create("com.apple.rmstore.publisher", 0);
    publisherQueue = v5->_publisherQueue;
    v5->_publisherQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)MEMORY[0x24BE7EB40];
    v9 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(-[RMStatusPublisherDelegate publisherClass](v5, "publisherClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Shared lock for %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "newSharedLockWithDescription:", v11);
    fetchLock = v5->_fetchLock;
    v5->_fetchLock = (RMSharedLock *)v12;

  }
  return v5;
}

- (void)fetchStatusForStatusKeys:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  RMSharedLock *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  RMSharedLock *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_fetchLock;
  -[RMSharedLock lock](v11, "lock");
  NSStringFromClass(-[RMStatusPublisherDelegate publisherClass](self, "publisherClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDelegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = v12;
    v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_245188000, v13, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ starting processing status keys: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStatusPublisherDelegate _filterSupportedStatus:store:unsupported:](self, "_filterSupportedStatus:store:unsupported:", v8, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDelegate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_245188000, v16, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ unsupported status keys: %{public}@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v15, "count"))
  {
    -[RMStatusPublisherDelegate publisherClass](self, "publisherClass");
    v18 = (void *)objc_opt_new();
    -[RMStatusPublisherDelegate publisherQueue](self, "publisherQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke;
    v22[3] = &unk_25162F9C0;
    v23 = v18;
    v24 = v15;
    v25 = v9;
    v26 = v12;
    v27 = v8;
    v28 = v14;
    v30 = v10;
    v29 = v11;
    v20 = v18;
    dispatch_async(v19, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDelegate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_impl(&dword_245188000, v21, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ has no valid status keys to process", buf, 0xCu);
    }

    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v14, 0);
    -[RMSharedLock unlock](v11, "unlock");
    objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDelegate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245188000, v20, OS_LOG_TYPE_DEFAULT, "Fetching complete.", buf, 2u);
    }
  }

}

void __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke_2;
  v5[3] = &unk_25162F998;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 88);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "queryForStatusWithKeyPaths:store:completionHandler:", v3, v4, v5);

}

void __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE7EB20];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "statusPublisherDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_245188000, v8, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ finished processing status keys: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  objc_msgSend(*(id *)(a1 + 56), "unlock");
  objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_245188000, v11, OS_LOG_TYPE_DEFAULT, "Fetching complete.", (uint8_t *)&v12, 2u);
  }

}

- (id)_filterSupportedStatus:(id)a3 store:(id)a4 unsupported:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v16 = objc_msgSend(MEMORY[0x24BE7EBB0], "classForStatusItemType:", v15);
        if (v16)
        {
          if ((objc_msgSend(v8, "isValidStatusItem:", v16) & 1) != 0)
          {
            objc_msgSend(v20, "addObject:", v15);
            continue;
          }
          objc_msgSend(MEMORY[0x24BE7EB08], "createDisallowedStatusValueErrorWithKeyPath:", v15);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE7EB08], "createUnsupportedStatusValueErrorWithKeyPath:", v15);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v17;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v20;
}

- (Class)publisherClass
{
  return self->_publisherClass;
}

- (OS_dispatch_queue)publisherQueue
{
  return self->_publisherQueue;
}

- (void)setPublisherQueue:(id)a3
{
  objc_storeStrong((id *)&self->_publisherQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherQueue, 0);
  objc_storeStrong((id *)&self->_publisherClass, 0);
  objc_storeStrong((id *)&self->_fetchLock, 0);
}

@end
