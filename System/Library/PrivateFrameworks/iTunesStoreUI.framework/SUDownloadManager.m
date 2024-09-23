@implementation SUDownloadManager

- (SUDownloadManager)initWithDownloadManager:(id)a3
{
  return -[SUDownloadManager initWithDownloadManager:clientInterface:](self, "initWithDownloadManager:clientInterface:", a3, +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
}

- (SUDownloadManager)initWithDownloadManager:(id)a3 clientInterface:(id)a4
{
  SUDownloadManager *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUDownloadManager;
  v6 = -[SUDownloadManager init](&v9, sel_init);
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    v6->_downloadManager = (SSDownloadManager *)a3;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUDownloadManager.%p"), v6);
    v6->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SUDownloadManager;
  -[SUDownloadManager dealloc](&v4, sel_dealloc);
}

- (BOOL)deleteDownload:(id)a3
{
  NSObject *dispatchQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SUDownloadManager_deleteDownload___block_invoke;
  block[3] = &unk_24DE7CA58;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __36__SUDownloadManager_deleteDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "storeItemIdentifier");
  v2 = SSGetUnsignedLongLongFromValue();
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "managedDownload"), "persistentIdentifier");
  v4 = dispatch_semaphore_create(0);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v6 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(*(id *)(a1 + 32), "managedDownload"), 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SUDownloadManager_deleteDownload___block_invoke_2;
  v8[3] = &unk_24DE7DDD8;
  v7 = *(_QWORD *)(a1 + 48);
  v8[4] = v4;
  v8[5] = v7;
  objc_msgSend(v5, "cancelDownloads:completionBlock:", v6, v8);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeObject:fromArray:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3));
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "purchaseManager"), "removePurchasedItemIdentifier:", v2);
  }
}

intptr_t __36__SUDownloadManager_deleteDownload___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)downloadForDownloadIdentifier:(int64_t)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__45;
  v11 = __Block_byref_object_dispose__45;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUDownloadManager_downloadForDownloadIdentifier___block_invoke;
  block[3] = &unk_24DE7DE00;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__SUDownloadManager_downloadForDownloadIdentifier___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", v2);

}

- (SSDownloadManager)downloadManager
{
  NSObject *dispatchQueue;
  SSDownloadManager *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SUDownloadManager_downloadManager__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownloadManager *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SUDownloadManager_downloadManager__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)downloads
{
  NSObject *dispatchQueue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__SUDownloadManager_downloads__block_invoke;
  v5[3] = &unk_24DE7BE08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__SUDownloadManager_downloads__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_reloadDownloadManager");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  result = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)preflightWithCompletionBlock:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke;
  v4[3] = &unk_24DE7DE50;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[7];
  _QWORD block[5];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_2;
    block[3] = &unk_24DE7DE28;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v2 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v3 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_24DE7DE78;
    v6[4] = v3;
    v6[5] = v2;
    v6[6] = v4;
    objc_msgSend(v5, "getDownloadsUsingBlock:", v6);
  }
}

uint64_t __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD v2[4];
  __int128 v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_4;
  v2[3] = &unk_24DE7DE50;
  v3 = *(_OWORD *)(a1 + 40);
  dispatch_async(v1, v2);
}

uint64_t __50__SUDownloadManager_preflightWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_finishPreflightWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)reloadDownloadManager
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUDownloadManager_reloadDownloadManager__block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __42__SUDownloadManager_reloadDownloadManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDownloadManager");
}

- (void)_finishPreflightWithCompletionBlock:(id)a3
{
  _QWORD block[5];

  if (-[NSArray count](self->_cachedDownloads, "count"))
  {
    if (!a3)
      return;
  }
  else
  {

    self->_cachedDownloads = 0;
    if (!a3)
      return;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUDownloadManager__finishPreflightWithCompletionBlock___block_invoke;
  block[3] = &unk_24DE7DE28;
  block[4] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__SUDownloadManager__finishPreflightWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reloadDownloadManager
{
  NSMutableDictionary *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ISUDownload *v12;
  ISUDownload *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)-[SSDownloadManager downloads](self->_downloadManager, "downloads");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v10, "persistentIdentifier"));
        v12 = (ISUDownload *)(id)-[NSMutableDictionary objectForKey:](self->_downloadsByID, "objectForKey:", v11);
        if (v12)
        {
          v13 = v12;
          -[ISUDownload setManagedDownload:](v12, "setManagedDownload:", v10);
        }
        else
        {
          v13 = -[ISUDownload initWithManagedDownload:]([ISUDownload alloc], "initWithManagedDownload:", v10);
        }
        objc_msgSend(v4, "addObject:", v13);
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v13, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  self->_cachedDownloads = (NSArray *)objc_msgSend(v4, "copy");
  self->_downloadsByID = v3;

}

- (void)_removeObject:(id)a3 fromArray:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (*a4)
  {
    v5 = objc_msgSend(*a4, "indexOfObject:", a3);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = (id)objc_msgSend(*a4, "mutableCopy");
      objc_msgSend(v7, "removeObjectAtIndex:", v6);

      *a4 = (id)objc_msgSend(v7, "copy");
    }
  }
}

@end
