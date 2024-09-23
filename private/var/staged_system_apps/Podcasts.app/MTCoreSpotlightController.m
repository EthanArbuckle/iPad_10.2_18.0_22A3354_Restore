@implementation MTCoreSpotlightController

- (MTCoreSpotlightController)init
{
  MTAppCoreSpotlightEntityAnnotator *v3;
  MTCoreSpotlightController *v4;

  v3 = objc_opt_new(MTAppCoreSpotlightEntityAnnotator);
  v4 = -[MTCoreSpotlightController initWithAnnotator:](self, "initWithAnnotator:", v3);

  return v4;
}

- (void)libraryDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  MTCoreSpotlightController *v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[3];

  v4 = a3;
  if (-[MTCoreSpotlightController hasDeferredIndexAll](self, "hasDeferredIndexAll"))
  {
    v5 = _MTLogCategorySpotlight();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dropping index update request (context:didInsertObjects:) since we haven't yet received the initial indexAllData", buf, 2u);
    }

  }
  else
  {
    v21[0] = kMTPodcastEntityName;
    v21[1] = kMTEpisodeEntityName;
    v21[2] = kMTPlaylistEntityName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
    v8 = objc_msgSend(v4, "hasInsertsForEntityNames:", v7);

    if (v8)
    {
      *(_QWORD *)buf = 0;
      v16 = buf;
      v17 = 0x3032000000;
      v18 = sub_1000466EC;
      v19 = sub_1000469EC;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "importContext"));

      v10 = (void *)*((_QWORD *)v16 + 5);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10009EA54;
      v11[3] = &unk_1004A7180;
      v13 = self;
      v14 = buf;
      v12 = v4;
      objc_msgSend(v10, "performBlock:", v11);

      _Block_object_dispose(buf, 8);
    }
  }

}

- (BOOL)hasDeferredIndexAll
{
  return self->_hasDeferredIndexAll;
}

- (void)updateStationsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", ")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Update Stations (%@)"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController searchableIndex](self, "searchableIndex"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009CAD8;
  v10[3] = &unk_1004A8D50;
  v11 = v4;
  v9 = v4;
  -[MTCoreSpotlightController updateSearchableIndexWithReason:searchableIndex:entityLoadingBlock:completion:](self, "updateSearchableIndexWithReason:searchableIndex:entityLoadingBlock:completion:", v7, v8, v10, 0);

}

- (void)scheduleIndexAllIfNecessary
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  if (!-[MTCoreSpotlightController hasBeenIndexed](self, "hasBeenIndexed"))
  {
    v3 = _MTLogCategorySpotlight();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Indexing] *** deferring initial indexAll until sync/feedUpdates are idle", buf, 2u);
    }

    -[MTCoreSpotlightController setHasDeferredIndexAll:](self, "setHasDeferredIndexAll:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateIdleCoordinator sharedInstance](MTFeedUpdateIdleCoordinator, "sharedInstance"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009CCB0;
    v6[3] = &unk_1004A7570;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "scheduleFeedUpdateIdleBlock:", v6);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

- (void)_performDeferredIndexAll
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (-[MTCoreSpotlightController hasDeferredIndexAll](self, "hasDeferredIndexAll"))
  {
    v3 = _MTLogCategorySpotlight();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Indexing] *** performing initial indexAll", v6, 2u);
    }

    -[MTCoreSpotlightController setHasDeferredIndexAll:](self, "setHasDeferredIndexAll:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController searchableIndex](self, "searchableIndex"));
    -[MTCoreSpotlightController indexAllDataWithSearchableIndex:completionHandler:](self, "indexAllDataWithSearchableIndex:completionHandler:", v5, 0);

  }
}

- (void)indexAllDataWithSearchableIndex:(id)a3 completionHandler:(id)a4
{
  Block_layout *v5;
  Block_layout *v6;
  NSObject *v7;
  Block_layout *v8;
  _QWORD v9[5];
  Block_layout *v10;

  v5 = (Block_layout *)a4;
  if (v5)
    v6 = v5;
  else
    v6 = &stru_1004A8D70;
  v7 = objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexingQueue](self, "indexingQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009CE9C;
  v9[3] = &unk_1004A63C8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)updateSearchableIndexWithReason:(id)a3 searchableIndex:(id)a4 entityLoadingBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexingQueue](self, "indexingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D1FC;
  block[3] = &unk_1004A8D98;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_onQueueCancelCurrentReindexAll
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexAllBatchGenerator](self, "indexAllBatchGenerator"));

  if (v3)
  {
    v4 = _MTLogCategorySpotlight();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexAllBatchGenerator](self, "indexAllBatchGenerator"));
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Indexing] *** canceling current indexAll [%@] ***", (uint8_t *)&v9, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexAllBatchGenerator](self, "indexAllBatchGenerator"));
    objc_msgSend(v7, "cancel");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexAllBatchGenerator](self, "indexAllBatchGenerator"));
    -[MTCoreSpotlightController _onQueuePerformCompletionsForGenerator:error:](self, "_onQueuePerformCompletionsForGenerator:error:", v8, 0);

    -[MTCoreSpotlightController setIndexAllBatchGenerator:](self, "setIndexAllBatchGenerator:", 0);
    -[MTCoreSpotlightController setHasIndexingOperationInProgress:](self, "setHasIndexingOperationInProgress:", 0);
  }
}

- (void)_onQueuePerformCompletionsForGenerator:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexAllCompletions"));
  v8 = objc_msgSend(v7, "copy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexAllCompletions"));
  objc_msgSend(v9, "removeAllObjects");

  global_queue = dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009D55C;
  v14[3] = &unk_1004A6640;
  v15 = v8;
  v16 = v5;
  v12 = v5;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)_onIndexingQueueHandleNextBatchOrUpdateRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[MTCoreSpotlightController hasIndexingOperationInProgress](self, "hasIndexingOperationInProgress"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_updateIndexRequests, "firstObject"));
    if (v6)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_updateIndexRequests, "removeObjectAtIndex:", 0);
      -[MTCoreSpotlightController _onIndexingQueuePerformUpdateRequest:](self, "_onIndexingQueuePerformUpdateRequest:", v6);
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexAllBatchGenerator](self, "indexAllBatchGenerator"));

      if (v3)
      {
        -[MTCoreSpotlightController setHasIndexingOperationInProgress:](self, "setHasIndexingOperationInProgress:", 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexAllBatchGenerator](self, "indexAllBatchGenerator"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController searchableIndex](self, "searchableIndex"));
        -[MTCoreSpotlightController _onQueueStartProcessNextBatchInGenerator:searchableIndex:](self, "_onQueueStartProcessNextBatchInGenerator:searchableIndex:", v4, v5);

      }
    }

  }
}

- (void)_onIndexingQueuePerformUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MTCoreSpotlightController *v14;
  id v15;

  v4 = a3;
  -[MTCoreSpotlightController setHasIndexingOperationInProgress:](self, "setHasIndexingOperationInProgress:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchableIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateQueueContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009D7B0;
  v11[3] = &unk_1004A6C78;
  v12 = v4;
  v13 = v7;
  v14 = self;
  v15 = v5;
  v8 = v5;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)_prepareToHandleNextBatchWithReadyBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)_onQueueStartProcessNextBatchInGenerator:(id)a3 searchableIndex:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  MTCoreSpotlightController *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009DC0C;
  v7[3] = &unk_1004A7398;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[MTCoreSpotlightController _prepareToHandleNextBatchWithReadyBlock:](v8, "_prepareToHandleNextBatchWithReadyBlock:", v7);

}

- (void)_startProcessNextBatchInGenerator:(id)a3 searchableIndex:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009DCBC;
  v7[3] = &unk_1004A8E78;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  objc_msgSend(v6, "collectNextBatch:", v7);

}

- (void)_didCompleteBatchProcessingBatchGenerator:(id)a3 state:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MTCoreSpotlightController *v16;
  id v17;
  int64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 4 && !v9)
  {
    -[MTCoreSpotlightController markHasBeenIndexed](self, "markHasBeenIndexed");
    -[MTCoreSpotlightController clearPartialUploadState](self, "clearPartialUploadState");
  }
  v11 = objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexingQueue](self, "indexingQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009E034;
  v14[3] = &unk_1004A8EA0;
  v15 = v8;
  v16 = self;
  v17 = v10;
  v18 = a4;
  v12 = v10;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (MTCoreSpotlightController)initWithAnnotator:(id)a3
{
  id v5;
  MTCoreSpotlightController *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *updateIndexRequests;
  dispatch_queue_t v10;
  OS_dispatch_queue *indexingQueue;
  void *v12;
  id v13;
  CSSearchableIndex *v14;
  CSSearchableIndex *searchableIndex;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTCoreSpotlightController;
  v6 = -[MTCoreSpotlightController init](&v17, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    objc_msgSend(v7, "addChangeNotifier:", v6);

    objc_storeStrong((id *)&v6->_annotator, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    updateIndexRequests = v6->_updateIndexRequests;
    v6->_updateIndexRequests = (NSMutableArray *)v8;

    v10 = dispatch_queue_create("com.podcasts.CoreSpotlightIndexingQueue", 0);
    indexingQueue = v6->_indexingQueue;
    v6->_indexingQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, "_podcastArtworkDidChangeNotification:", kMTImageDownloaderArtworkDidLoadNotification, 0);

    v13 = objc_alloc((Class)CSSearchableIndex);
    v14 = (CSSearchableIndex *)objc_msgSend(v13, "initWithName:bundleIdentifier:", CFSTR("Podcasts"), kMTApplicationBundleIdentifier);
    searchableIndex = v6->_searchableIndex;
    v6->_searchableIndex = v14;

    -[CSSearchableIndex setIndexDelegate:](v6->_searchableIndex, "setIndexDelegate:", v6);
  }

  return v6;
}

- (void)_podcastArtworkDidChangeNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t CacheKeys;
  void *v8;
  NSObject *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  MTCoreSpotlightController *v15;
  _QWORD v16[4];
  dispatch_group_t v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = _MTLogCategorySpotlight(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got podcast artwork change notification", buf, 2u);
  }

  CacheKeys = MTImageDownloaderArtworkDidLoadCacheKeys(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(CacheKeys);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009E408;
  v16[3] = &unk_1004A8EF0;
  v17 = dispatch_group_create();
  v9 = v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  global_queue = dispatch_get_global_queue(-32768, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009E4BC;
  block[3] = &unk_1004A6640;
  v14 = v8;
  v15 = self;
  v12 = v8;
  dispatch_group_notify(v9, v11, block);

}

- (void)searchableIndex:(id)a3 indexSearchableItems:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  Block_layout *v9;
  Block_layout *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  Block_layout *v14;

  v7 = a3;
  v8 = a4;
  v9 = (Block_layout *)a5;
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1004A8F38;
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009E89C;
    v11[3] = &unk_1004A8F88;
    v12 = v7;
    v13 = v8;
    v14 = v10;
    objc_msgSend(v12, "indexSearchableItems:completionHandler:", v13, v11);

  }
  else
  {
    v10->invoke(v10, 0);
  }

}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController searchableIndex](self, "searchableIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009E9F0;
    v7[3] = &unk_1004A8E50;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "deleteSearchableItemsWithIdentifiers:completionHandler:", v6, v7);

  }
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightController indexingQueue](self, "indexingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009EDE8;
  block[3] = &unk_1004A8C40;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MTCoreSpotlightController *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  global_queue = dispatch_get_global_queue(-32768, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009EFB8;
  v16[3] = &unk_1004A6618;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (BOOL)hasBeenIndexed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MTCoreSpotlightDataHasBeenIndexed_v3"));

  return v3;
}

- (void)markHasBeenIndexed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("MTCoreSpotlightDataHasBeenIndexed_v3"));

}

- (void)clearHasBeenIndexed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("MTCoreSpotlightDataHasBeenIndexed_v3"));

}

- (void)clearPartialUploadState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("MTCoreSpotlightPartialIndexObjectNumber"));

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("MTCoreSpotlightPartialIndexBatchNumber"));

}

- (id)savedPartialUploadStateIndexPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MTCoreSpotlightPartialIndexBatchNumber")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MTCoreSpotlightPartialIndexObjectNumber")));

  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v3, "integerValue"), objc_msgSend(v5, "integerValue")));

  return v7;
}

- (void)savePartialUploadStateIndexPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "section")));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("MTCoreSpotlightPartialIndexObjectNumber"));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v3, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("MTCoreSpotlightPartialIndexBatchNumber"));

}

- (MTCoreSpotlightEntityAnnotator)annotator
{
  return (MTCoreSpotlightEntityAnnotator *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)indexingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndexingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CSSearchableIndex)searchableIndex
{
  return (CSSearchableIndex *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchableIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)hasIndexingOperationInProgress
{
  return self->_hasIndexingOperationInProgress;
}

- (void)setHasIndexingOperationInProgress:(BOOL)a3
{
  self->_hasIndexingOperationInProgress = a3;
}

- (id)didCompleteSyncObservance
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidCompleteSyncObservance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)didCompleteFeedUpdateObservance
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDidCompleteFeedUpdateObservance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MTCoreSpotlightIndexBatchGenerator)indexAllBatchGenerator
{
  return (MTCoreSpotlightIndexBatchGenerator *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIndexAllBatchGenerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setHasDeferredIndexAll:(BOOL)a3
{
  self->_hasDeferredIndexAll = a3;
}

- (NSMutableArray)updateIndexRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpdateIndexRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIndexRequests, 0);
  objc_storeStrong((id *)&self->_indexAllBatchGenerator, 0);
  objc_storeStrong(&self->_didCompleteFeedUpdateObservance, 0);
  objc_storeStrong(&self->_didCompleteSyncObservance, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_indexingQueue, 0);
  objc_storeStrong((id *)&self->_annotator, 0);
}

@end
