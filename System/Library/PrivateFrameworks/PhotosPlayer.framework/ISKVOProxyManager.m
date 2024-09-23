@implementation ISKVOProxyManager

- (ISKVOProxyManager)init
{
  ISKVOProxyManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *recordsByIdentifier;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *recordsQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ISKVOProxyManager;
  v2 = -[ISKVOProxyManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recordsByIdentifier = v2->_recordsByIdentifier;
    v2->_recordsByIdentifier = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.photosplayer.kvoproxyrecords", v5);
    recordsQueue = v2->_recordsQueue;
    v2->_recordsQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (id)addProxyWithTarget:(id)a3 queue:(id)a4 keyPaths:(id)a5 delegate:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  ISKVOProxy *v17;
  ISKVOProxyRecord *v18;
  NSObject *recordsQueue;
  id v20;
  ISKVOProxy *v21;
  id v22;
  ISKVOProxyRecord *v23;
  ISKVOProxy *v24;
  id v25;
  _QWORD block[5];
  id v28;
  ISKVOProxyRecord *v29;
  id v30;
  ISKVOProxy *v31;

  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB3A28];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v11, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ISKVOProxy initWithTarget:keyPaths:identifier:delegate:]([ISKVOProxy alloc], "initWithTarget:keyPaths:identifier:delegate:", v14, v13, v16, v12);
  v18 = -[ISKVOProxyRecord initWithProxy:queue:]([ISKVOProxyRecord alloc], "initWithProxy:queue:", v17, v10);
  recordsQueue = self->_recordsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke;
  block[3] = &unk_1E94535E0;
  block[4] = self;
  v20 = v16;
  v28 = v20;
  v29 = v18;
  v30 = v10;
  v31 = v17;
  v21 = v17;
  v22 = v10;
  v23 = v18;
  dispatch_async(recordsQueue, block);
  v24 = v31;
  v25 = v20;

  return v25;
}

- (void)removeProxyWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *recordsQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    recordsQueue = self->_recordsQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke;
    v7[3] = &unk_1E9454130;
    v7[4] = self;
    v8 = v4;
    dispatch_async(recordsQueue, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsQueue, 0);
  objc_storeStrong((id *)&self->_recordsByIdentifier, 0);
}

void __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(v2, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "proxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke_2;
    block[3] = &unk_1E9453F48;
    v7 = v4;
    v5 = v4;
    dispatch_async(v3, block);

  }
}

uint64_t __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObservingTarget");
}

void __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke_2;
  block[3] = &unk_1E9453F48;
  v2 = *(NSObject **)(a1 + 56);
  v4 = *(id *)(a1 + 64);
  dispatch_async(v2, block);

}

uint64_t __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObservingTarget");
}

+ (ISKVOProxyManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_528);
  return (ISKVOProxyManager *)(id)sharedManager_sharedInstance;
}

void __34__ISKVOProxyManager_sharedManager__block_invoke()
{
  ISKVOProxyManager *v0;
  void *v1;

  v0 = objc_alloc_init(ISKVOProxyManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

@end
