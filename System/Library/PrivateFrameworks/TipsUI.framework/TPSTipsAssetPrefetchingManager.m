@implementation TPSTipsAssetPrefetchingManager

- (TPSTipsAssetPrefetchingManager)init
{
  TPSTipsAssetPrefetchingManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  uint64_t v6;
  NSMutableArray *sessionItems;
  NSOperationQueue *v8;
  NSOperationQueue *operationQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPSTipsAssetPrefetchingManager;
  v2 = -[TPSTipsAssetPrefetchingManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.tips.AssetPrefetchingManager", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    sessionItems = v2->_sessionItems;
    v2->_sessionItems = (NSMutableArray *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 9);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TPSTipsAssetPrefetchingManager cancelFetch](self, "cancelFetch");
  v3.receiver = self;
  v3.super_class = (Class)TPSTipsAssetPrefetchingManager;
  -[TPSTipsAssetPrefetchingManager dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[TPSTipsAssetPrefetchingManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__TPSTipsAssetPrefetchingManager_cancel__block_invoke;
  v4[3] = &unk_24C5DDE20;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__TPSTipsAssetPrefetchingManager_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancelFetch");

}

- (void)cancelFetch
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[TPSTipsAssetPrefetchingManager sessionItems](self, "sessionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "data");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CF80000, v5, OS_LOG_TYPE_INFO, "Prefetching cancelled", buf, 2u);
    }

  }
  -[TPSTipsAssetPrefetchingManager operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllOperations");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TPSTipsAssetPrefetchingManager sessionItems](self, "sessionItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x24BEB7DC8], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cancelSessionItem:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)prefetchAssetsFromTip:(id)a3 tips:(id)a4 assetUserInterfaceStyle:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTipsAssetPrefetchingManager currentTip](self, "currentTip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (!v13 || -[TPSTipsAssetPrefetchingManager assetUserInterface](self, "assetUserInterface") != a5)
  {
    -[TPSTipsAssetPrefetchingManager cancel](self, "cancel");
    -[TPSTipsAssetPrefetchingManager setCurrentTip:](self, "setCurrentTip:", v8);
    -[TPSTipsAssetPrefetchingManager setAssetUserInterface:](self, "setAssetUserInterface:", a5);
    v14 = objc_msgSend(v9, "count");
    v15 = objc_msgSend(v9, "indexOfObject:", v8);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v15;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 < v14 - 1)
      {
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectsAtIndexes:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObjectsFromArray:", v19);
      }
      if (v16)
      {
        objc_msgSend(v9, "subarrayWithRange:", 0, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "reverseObjectEnumerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v22, "count") != 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectsAtIndexes:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObjectsFromArray:", v24);
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v31 != v28)
              objc_enumerationMutation(v25);
            -[TPSTipsAssetPrefetchingManager appendAssetsOperationsForTip:](self, "appendAssetsOperationsForTip:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), (_QWORD)v30);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v27);
      }

    }
  }

}

- (void)appendAssetsOperationsForTip:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BEB7CF0];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullContentAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TPSTipsAssetPrefetchingManager assetUserInterface](self, "assetUserInterface");
  objc_msgSend(v5, "assetFileInfoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetConfigurationForAssets:language:userInterfaceStyle:assetFileInfoManager:", v7, v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[TPSTipsAssetPrefetchingManager addFetchOperationWithAssetConfiguration:type:operationName:](self, "addFetchOperationWithAssetConfiguration:type:operationName:", v11, 0, CFSTR("image-prefetch"));
  -[TPSTipsAssetPrefetchingManager addFetchOperationWithAssetConfiguration:type:operationName:](self, "addFetchOperationWithAssetConfiguration:type:operationName:", v11, 1, CFSTR("video-prefetch"));

}

- (void)addFetchOperationWithAssetConfiguration:(id)a3 type:(int64_t)a4 operationName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "cacheIdentifierForType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB7D30], "assetPathFromAssetConfiguration:type:", v8, a4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
  {
    if (v11)
    {
      if (!a4
        || (objc_msgSend(MEMORY[0x24BEB7CF8], "sharedInstance"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "dataCacheForIdentifier:", v10),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v14))
      {
        objc_msgSend(MEMORY[0x24BEB7D68], "data");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v10;
          v30 = 2112;
          v31 = v12;
          _os_log_impl(&dword_20CF80000, v15, OS_LOG_TYPE_INFO, "Prefetching needed for video with identifier: %@ path %@", buf, 0x16u);
        }

        objc_initWeak((id *)buf, self);
        v16 = objc_alloc(MEMORY[0x24BEB7D10]);
        v17 = MEMORY[0x24BDAC760];
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke;
        v24[3] = &unk_24C5DDEC0;
        objc_copyWeak(v27, (id *)buf);
        v25 = v10;
        v26 = v12;
        v27[1] = (id)a4;
        v18 = (void *)objc_msgSend(v16, "initWithAsyncBlock:", v24);
        objc_msgSend(v18, "setName:", v9);
        -[TPSTipsAssetPrefetchingManager serialQueue](self, "serialQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        v21[0] = v17;
        v21[1] = 3221225472;
        v21[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_5;
        v21[3] = &unk_24C5DDB30;
        objc_copyWeak(&v23, (id *)buf);
        v22 = v18;
        v20 = v18;
        dispatch_async(v19, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak(v27);
        objc_destroyWeak((id *)buf);
      }
    }
  }

}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  NSObject *v26;
  _QWORD block[6];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v5 = MEMORY[0x24BDAC760];
  v43 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_15;
  aBlock[3] = &unk_24C5DDE70;
  v33 = *(id *)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v35 = WeakRetained;
  v37 = &v38;
  v6 = v3;
  v36 = v6;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x24BEB7CF8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1 + 32;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v12 + 8);
    v13 = *MEMORY[0x24BDD1348];
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_3;
    v28[3] = &unk_24C5DDE98;
    v29 = v8;
    LODWORD(v14) = v13;
    objc_msgSend(v9, "formattedDataForPath:identifier:attributionIdentifier:priority:completionHandler:", v11, v10, 0, v28, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v39[5];
    v39[5] = v15;

    v17 = *MEMORY[0x24BDD1358];
  }
  else
  {
    v20 = a1 + 32;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(v20 + 8);
    v17 = *MEMORY[0x24BDD1358];
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_2;
    v30[3] = &unk_24C5DDE98;
    v31 = v7;
    LODWORD(v21) = v17;
    +[TPSImageAssetController formattedDataForPath:identifier:priority:completionHandler:](TPSImageAssetController, "formattedDataForPath:identifier:priority:completionHandler:", v19, v18, v30, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v39[5];
    v39[5] = v22;

  }
  objc_msgSend((id)v39[5], "sessionTask");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = v17;
  objc_msgSend(v24, "setPriority:", v25);

  if (v39[5])
  {
    objc_msgSend(WeakRetained, "serialQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_4;
    block[3] = &unk_24C5DDE48;
    block[4] = WeakRetained;
    block[5] = &v38;
    dispatch_async(v26, block);

  }
  _Block_object_dispose(&v38, 8);

}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];

  v3 = a2;
  objc_msgSend(MEMORY[0x24BEB7D68], "data");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_15_cold_2(a1, v4);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "data");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_15_cold_1((uint64_t)v3, v5);

  }
  objc_msgSend(*(id *)(a1 + 48), "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16;
    v9[3] = &unk_24C5DDE48;
    v8 = *(_QWORD *)(a1 + 64);
    v9[4] = *(_QWORD *)(a1 + 48);
    v9[5] = v8;
    dispatch_async(v7, v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOperation:", *(_QWORD *)(a1 + 32));

}

- (int64_t)assetUserInterface
{
  return self->_assetUserInterface;
}

- (void)setAssetUserInterface:(int64_t)a3
{
  self->_assetUserInterface = a3;
}

- (TPSTip)currentTip
{
  return self->_currentTip;
}

- (void)setCurrentTip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSMutableArray)sessionItems
{
  return self->_sessionItems;
}

- (void)setSessionItems:(id)a3
{
  objc_storeStrong((id *)&self->_sessionItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionItems, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_currentTip, 0);
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_15_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20CF80000, a2, OS_LOG_TYPE_DEBUG, "error %@", (uint8_t *)&v2, 0xCu);
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_15_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_20CF80000, a2, OS_LOG_TYPE_DEBUG, "Prefetched image with identifier: %@ path %@", (uint8_t *)&v4, 0x16u);
}

@end
