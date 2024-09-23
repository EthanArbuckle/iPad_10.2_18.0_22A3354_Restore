@implementation BKLibraryPriceManager

- (BKLibraryPriceManager)initWithLibraryManager:(id)a3
{
  id v4;
  BKLibraryPriceManager *v5;
  BKLibraryPriceManager *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *dispatchQueue;
  NSMutableDictionary *v13;
  NSMutableDictionary *prices;
  NSMutableDictionary *v15;
  NSMutableDictionary *completionHandlers;
  NSMutableArray *v17;
  NSMutableArray *listeners;
  NSMutableDictionary *v19;
  NSMutableDictionary *allStoreAssets;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *testQueue;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BKLibraryPriceManager;
  v5 = -[BKLibraryPriceManager init](&v28, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v11 = dispatch_queue_create("com.apple.iBooks.BKLibraryPriceManager.dispatchQueue", v10);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new(NSMutableDictionary);
    prices = v6->_prices;
    v6->_prices = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    completionHandlers = v6->_completionHandlers;
    v6->_completionHandlers = v15;

    v17 = objc_opt_new(NSMutableArray);
    listeners = v6->_listeners;
    v6->_listeners = v17;

    v19 = objc_opt_new(NSMutableDictionary);
    allStoreAssets = v6->_allStoreAssets;
    v6->_allStoreAssets = v19;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("BCCloudAssetManager.testQueue", v22);
    testQueue = v6->_testQueue;
    v6->_testQueue = (OS_dispatch_queue *)v23;

    *(_OWORD *)&v6->_generationCount = xmmword_95C40;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v6, "_internetReachabilityChanged:", CFSTR("kNetworkReachabilityChangedNotification"), v26);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("kNetworkReachabilityChangedNotification"), v4);

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryPriceManager;
  -[BKLibraryPriceManager dealloc](&v5, "dealloc");
}

- (void)collectPricesForSeriesStoreIDs:(id)a3 isAudiobookSeries:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BKLibraryPriceManagerAsset *v14;
  BKLibraryPriceManagerAsset *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
        v14 = [BKLibraryPriceManagerAsset alloc];
        v15 = -[BKLibraryPriceManagerAsset initWithType:storeID:](v14, "initWithType:storeID:", v4, v13, (_QWORD)v20);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v16 = -[NSMutableDictionary copy](v7, "copy");
  -[BKLibraryPriceManager setSeriesAssets:](self, "setSeriesAssets:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager allStoreAssets](self, "allStoreAssets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager seriesAssets](self, "seriesAssets"));
  objc_msgSend(v17, "addEntriesFromDictionary:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager seriesAssets](self, "seriesAssets"));
  -[BKLibraryPriceManager _fetchPricesForStoreAssets:forGeneration:](self, "_fetchPricesForStoreAssets:forGeneration:", v19, -[BKLibraryPriceManager generationCount](self, "generationCount"));

}

- (void)fetchPriceForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKLibraryPriceManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_588E4;
  block[3] = &unk_C21D0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)cancelForAssetID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryPriceManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_58C70;
  v7[3] = &unk_C12F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)addListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryPriceManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_58D64;
  v7[3] = &unk_C12F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryPriceManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_58E6C;
  v7[3] = &unk_C12F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)invalidate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_58FF0;
  v7[3] = &unk_C1428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_invalidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager prices](self, "prices"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager allStoreAssets](self, "allStoreAssets"));
  objc_msgSend(v6, "removeAllObjects");

  -[BKLibraryPriceManager _callCompletionHandlers:](self, "_callCompletionHandlers:", 0);
  v7 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager dispatchQueue](self, "dispatchQueue"));
  dispatch_suspend(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager libraryManager](self, "libraryManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_590E8;
  v10[3] = &unk_C3090;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "allUnownedStoreAssetIDs:", v10);

}

- (void)_internetReachabilityChanged:(id)a3
{
  -[BKLibraryPriceManager invalidate:](self, "invalidate:", 0);
}

- (void)_fetchPricesForStoreAssetIDs
{
  void *v3;
  id v4;

  v3 = -[BKLibraryPriceManager generationFetched](self, "generationFetched");
  if (v3 != (void *)-[BKLibraryPriceManager generationCount](self, "generationCount"))
  {
    -[BKLibraryPriceManager setGenerationFetched:](self, "setGenerationFetched:", -[BKLibraryPriceManager generationCount](self, "generationCount"));
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager allStoreAssets](self, "allStoreAssets"));
    -[BKLibraryPriceManager _fetchPricesForStoreAssets:forGeneration:](self, "_fetchPricesForStoreAssets:forGeneration:", v4, -[BKLibraryPriceManager generationCount](self, "generationCount"));

  }
}

- (void)_fetchPricesForStoreAssets:(id)a3 forGeneration:(unint64_t)a4
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a3;
  v6 = objc_opt_new(NSMutableArray);
  v7 = objc_opt_new(NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v14 = objc_msgSend(v13, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storeID"));
        if (v14)
          v16 = v7;
        else
          v16 = v6;
        -[NSMutableArray addObject:](v16, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCMBridgedCatalogService sharedInstance](BCMBridgedCatalogService, "sharedInstance"));
  v18 = objc_alloc((Class)BFMRequestMetadata);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "BKLibraryPriceManager.m"));
  v20 = objc_msgSend(v18, "initWithFileID:line:", v19, 319);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_596EC;
  v22[3] = &unk_C30B8;
  v22[4] = self;
  v22[5] = a4;
  objc_msgSend(v17, "fetchMixedAssetsWithBookIds:audiobookIds:relationships:views:additionalParameters:batchSize:metadata:completionHandler:", v6, v7, 0, 0, 0, 0, v20, v22);

}

- (void)_notifyListeners:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager listeners](self, "listeners"));
  v6 = objc_msgSend(v5, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "nonretainedObjectValue", (_QWORD)v13));
        if ((objc_opt_respondsToSelector(v12, "priceManager:updatedPrices:") & 1) != 0)
          objc_msgSend(v12, "priceManager:updatedPrices:", self, v4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_callCompletionHandlers:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  void *v18;
  void *v19;
  id obj;
  BKLibraryPriceManager *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v23 = a3;
  v21 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager completionHandlers](self, "completionHandlers"));
  v5 = objc_msgSend(v4, "copy");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v10));
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              v17 = objc_retainBlock(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j));
              v18 = v17;
              if (v17)
                (*((void (**)(id, uint64_t, void *))v17 + 2))(v17, v10, v11);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager completionHandlers](v21, "completionHandlers"));
        objc_msgSend(v19, "removeObjectForKey:", v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

}

- (void)testPriceForStoreID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryPriceManager testQueue](self, "testQueue"));
  v9 = dispatch_time(0, 15000000000);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_59F7C;
  v12[3] = &unk_C1CC8;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_after(v9, v8, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (NSMutableDictionary)prices
{
  return self->_prices;
}

- (void)setPrices:(id)a3
{
  objc_storeStrong((id *)&self->_prices, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NSMutableDictionary)allStoreAssets
{
  return self->_allStoreAssets;
}

- (void)setAllStoreAssets:(id)a3
{
  objc_storeStrong((id *)&self->_allStoreAssets, a3);
}

- (NSDictionary)seriesAssets
{
  return self->_seriesAssets;
}

- (void)setSeriesAssets:(id)a3
{
  objc_storeStrong((id *)&self->_seriesAssets, a3);
}

- (OS_dispatch_queue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testQueue, a3);
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (unint64_t)generationFetched
{
  return self->_generationFetched;
}

- (void)setGenerationFetched:(unint64_t)a3
{
  self->_generationFetched = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_seriesAssets, 0);
  objc_storeStrong((id *)&self->_allStoreAssets, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_prices, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
