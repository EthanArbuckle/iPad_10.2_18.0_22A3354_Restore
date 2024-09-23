@implementation BSUILibraryItemStateProvider

+ (id)sharedInstance
{
  if (qword_32BF60 != -1)
    dispatch_once(&qword_32BF60, &stru_2E4190);
  return (id)qword_32BF58;
}

- (BSUILibraryItemStateProvider)init
{
  BSUILibraryItemStateProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQ;
  dispatch_queue_t v5;
  OS_dispatch_queue *fileChangesQ;
  BSUILibraryItemStateCenter *v7;
  BSUILibraryItemStateCenter *stateCenter;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *itemStateCache;
  uint64_t v12;
  NSMutableDictionary *itemWantToReadStateCache;
  uint64_t v14;
  NSMutableDictionary *itemFinishedStateCache;
  uint64_t v16;
  NSMutableSet *downloadingItems;
  uint64_t v18;
  NSMutableDictionary *purchasesMadeThisSession;
  uint64_t v20;
  NSMutableDictionary *parentIdentifierForStoreIdentifierMap;
  uint64_t v22;
  NSMutableDictionary *childIdentifiersForParentIdentifierMap;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BSUILibraryItemStateProvider *v33;
  void *v34;
  uint64_t v35;
  BSUILibraryItemStateProvider *v36;
  void *v37;
  void **v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  BSUILibraryItemStateProvider *v43;
  _QWORD v44[4];
  BSUILibraryItemStateProvider *v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)BSUILibraryItemStateProvider;
  v2 = -[BSUILibraryItemStateProvider init](&v46, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("BSUILibraryItemStateProvider.access", 0);
    accessQ = v2->_accessQ;
    v2->_accessQ = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("BSUILibraryItemStateProvider.fileWrites.monitoring", 0);
    fileChangesQ = v2->_fileChangesQ;
    v2->_fileChangesQ = (OS_dispatch_queue *)v5;

    v7 = -[BSUILibraryItemStateCenter initWithProvider:]([BSUILibraryItemStateCenter alloc], "initWithProvider:", v2);
    stateCenter = v2->_stateCenter;
    v2->_stateCenter = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v9, "addObserver:", v2);

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    itemStateCache = v2->_itemStateCache;
    v2->_itemStateCache = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    itemWantToReadStateCache = v2->_itemWantToReadStateCache;
    v2->_itemWantToReadStateCache = (NSMutableDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    itemFinishedStateCache = v2->_itemFinishedStateCache;
    v2->_itemFinishedStateCache = (NSMutableDictionary *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    downloadingItems = v2->_downloadingItems;
    v2->_downloadingItems = (NSMutableSet *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    purchasesMadeThisSession = v2->_purchasesMadeThisSession;
    v2->_purchasesMadeThisSession = (NSMutableDictionary *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    parentIdentifierForStoreIdentifierMap = v2->_parentIdentifierForStoreIdentifierMap;
    v2->_parentIdentifierForStoreIdentifierMap = (NSMutableDictionary *)v20;

    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    childIdentifiersForParentIdentifierMap = v2->_childIdentifiersForParentIdentifierMap;
    v2->_childIdentifiersForParentIdentifierMap = (NSMutableDictionary *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    objc_msgSend(v24, "addObserver:accountTypes:", v2, 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_2FB888, MPMediaItemPropertyMediaType));
    objc_msgSend(v25, "addLibraryFilterPredicate:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    +[MPMediaLibrary setRunLoopForNotifications:](MPMediaLibrary, "setRunLoopForNotifications:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v2, "_mediaLibraryDidChanged:", MPMediaLibraryDidChangeNotification, 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    objc_msgSend(v29, "beginGeneratingLibraryChangeNotifications");

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v32 = BLDownloadQueuePurchaseSucceededNotification;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_AFB0;
    v44[3] = &unk_2E41E0;
    v33 = v2;
    v45 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "addObserverForName:object:queue:usingBlock:", v32, 0, v31, v44));
    -[BSUILibraryItemStateProvider setPurchaseSucceededObserver:](v33, "setPurchaseSucceededObserver:", v34);

    v35 = BLDownloadQueuePurchaseFailedNotification;
    v39 = _NSConcreteStackBlock;
    v40 = 3221225472;
    v41 = sub_B28C;
    v42 = &unk_2E41E0;
    v36 = v33;
    v43 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "addObserverForName:object:queue:usingBlock:", v35, 0, v31, &v39));
    -[BSUILibraryItemStateProvider setPurchaseFailedObserver:](v36, "setPurchaseFailedObserver:", v37, v39, v40, v41, v42);

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *accessQ;
  OS_dispatch_queue *fileChangesQ;
  NSMutableDictionary *itemStateCache;
  NSMutableDictionary *itemWantToReadStateCache;
  NSMutableDictionary *itemFinishedStateCache;
  NSSet *itemIdentifiers;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  accessQ = self->_accessQ;
  self->_accessQ = 0;

  fileChangesQ = self->_fileChangesQ;
  self->_fileChangesQ = 0;

  itemStateCache = self->_itemStateCache;
  self->_itemStateCache = 0;

  itemWantToReadStateCache = self->_itemWantToReadStateCache;
  self->_itemWantToReadStateCache = 0;

  itemFinishedStateCache = self->_itemFinishedStateCache;
  self->_itemFinishedStateCache = 0;

  itemIdentifiers = self->_itemIdentifiers;
  self->_itemIdentifiers = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  objc_msgSend(v9, "removeObserver:accountTypes:", self, 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v10, "removeObserver:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "removeObserver:name:object:", self->_purchaseSucceededObserver, BLDownloadQueuePurchaseSucceededNotification, 0);
  objc_msgSend(v11, "removeObserver:name:object:", self->_purchaseFailedObserver, BLDownloadQueuePurchaseFailedNotification, 0);

  v12.receiver = self;
  v12.super_class = (Class)BSUILibraryItemStateProvider;
  -[BSUILibraryItemStateProvider dealloc](&v12, "dealloc");
}

- (void)updateStateToPurchasingForIdentifier:(id)a3
{
  id v4;
  NSObject *accessQ;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B590;
  block[3] = &unk_2E40C8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(accessQ, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v7));
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v7, v6);

}

- (void)updateStateToPurchaseFailedForIdentifier:(id)a3
{
  id v4;
  NSObject *accessQ;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B648;
  block[3] = &unk_2E40C8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(accessQ, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v7));
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v7, v6);

}

- (void)updateStateToDeletedForIdentifier:(id)a3
{
  id v4;
  NSObject *accessQ;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B6FC;
  block[3] = &unk_2E40C8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(accessQ, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v7));
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v7, v6);

}

- (void)updateWantToReadState:(BOOL)a3 identifier:(id)a4
{
  id v6;
  NSObject *accessQ;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B798;
  block[3] = &unk_2E4208;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(accessQ, block);

}

- (void)updateFinishedState:(BOOL)a3 identifier:(id)a4
{
  id v6;
  NSObject *accessQ;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B874;
  block[3] = &unk_2E4208;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(accessQ, block);

}

- (void)_cacheNewPurchaseWithIdentifier:(id)a3 isPreorder:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQ;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B9B8;
  block[3] = &unk_2E4230;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v11 = v6;
  dispatch_sync(accessQ, block);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v11));
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v11, v10);

}

- (BOOL)_itemIsPurchasedThisSession:(id)a3
{
  id v4;
  NSObject *accessQ;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BA78;
  block[3] = &unk_2E4258;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQ, block);
  LOBYTE(accessQ) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQ;
}

- (void)_mediaLibraryDidChanged:(id)a3
{
  -[BSUILibraryItemStateProvider updateAllItemsOfInterest](self, "updateAllItemsOfInterest", a3);
}

- (void)updateAllItemsOfInterest
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider itemsOfInterest](self, "itemsOfInterest", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v8));
        -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)updateItemOfInterestForItemIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v4));
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v4, v5);

}

- (void)updateInterest:(id)a3
{
  id v4;
  NSObject *accessQ;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BCA8;
  block[3] = &unk_2E40C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQ, block);

}

- (void)_updateStateToDownloadingForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQ;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_BE40;
    block[3] = &unk_2E4280;
    block[4] = self;
    v7 = v4;
    v11 = v7;
    v12 = &v13;
    dispatch_sync(accessQ, block);
    if (*((_BYTE *)v14 + 24))
    {
      v8 = BKLibraryItemStateProviderLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "=> DOWNLOADING: %@", buf, 0xCu);
      }

    }
  }
  _Block_object_dispose(&v13, 8);

}

- (void)_updateStateToDownloadFinishedForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQ;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_BFF8;
    block[3] = &unk_2E4280;
    block[4] = self;
    v7 = v4;
    v11 = v7;
    v12 = &v13;
    dispatch_sync(accessQ, block);
    if (*((_BYTE *)v14 + 24))
    {
      v8 = BKLibraryItemStateProviderLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "=> FINISHED DOWNLOAD: %@", buf, 0xCu);
      }

    }
  }
  _Block_object_dispose(&v13, 8);

}

- (BOOL)_itemIsBeingDownloaded:(id)a3
{
  id v4;
  NSObject *accessQ;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C0FC;
  block[3] = &unk_2E4258;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQ, block);
  LOBYTE(accessQ) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQ;
}

- (BOOL)_updateItemStateFieldsFromCache:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQ;
  id v7;
  uint64_t *v8;
  char v9;
  NSObject *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(_QWORD *);
  void *v15;
  BSUILibraryItemStateProvider *v16;
  id v17;
  uint64_t *v18;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_C344;
  v26 = sub_C354;
  v27 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C35C;
  block[3] = &unk_2E4258;
  v21 = &v22;
  block[4] = self;
  v7 = v5;
  v20 = v7;
  dispatch_sync(accessQ, block);
  v8 = v23;
  *((_BYTE *)v29 + 24) = v23[5] != 0;
  objc_msgSend(v4, "setLibrary:", objc_msgSend((id)v8[5], "longLongValue"));
  objc_msgSend(v4, "setDownload:", 0);
  if (*((_BYTE *)v29 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = self->_accessQ;
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_C398;
    v15 = &unk_2E4258;
    v18 = &v28;
    v16 = self;
    v17 = v7;
    dispatch_sync(v10, &v12);
    if (*((_BYTE *)v29 + 24))
    {
      objc_msgSend(v4, "setLibrary:", 4, v12, v13, v14, v15, v16);
      objc_msgSend(v4, "setIsPurchased:", 1);
      objc_msgSend(v4, "setDownload:", 1);
    }

    v9 = *((_BYTE *)v29 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v9;
}

- (BOOL)_updateItemStateFieldsFromBookLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allBookItems"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeIdentifier", (_QWORD)v18));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          if (objc_msgSend(v12, "isSample"))
            v16 = 1;
          else
            v16 = 4;
          objc_msgSend(v3, "setLibrary:", v16);
          objc_msgSend(v3, "setIsPurchased:", objc_msgSend(v12, "isSample") ^ 1);
          objc_msgSend(v3, "setDownload:", 2);
          objc_msgSend(v3, "setIsInSamples:", objc_msgSend(v12, "isSample"));
          objc_msgSend(v3, "setIsSample:", objc_msgSend(v12, "isSample"));
          v15 = 1;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)_updateItemStateFieldsFromMediaLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BSUILibraryItemStateProvider *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
  if (v6 && objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v5, MPMediaItemPropertyStorePlaylistID));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v5, MPMediaItemPropertyStoreID));
    v40[0] = v7;
    v40[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAnyPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v9));
    objc_msgSend(v6, "addFilterPredicate:", v10);

    objc_msgSend(v6, "setGroupingType:", 1);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collections"));
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v11)
    {
      v29 = self;
      v30 = v8;
      v31 = v7;
      v32 = v6;
      v34 = v5;
      v12 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "bk_representativeItem"));
          v16 = objc_opt_class(NSNumber, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
          v18 = BUDynamicCast(v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bk_storeID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
            v22 = objc_msgSend(v34, "isEqualToString:", v21);

            if (v22)
            {
              v24 = objc_opt_class(NSNumber, v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForProperty:", MPMediaItemPropertyIsCloudItem));
              v26 = BUDynamicCast(v24, v25);
              v11 = (id)objc_claimAutoreleasedReturnValue(v26);

              objc_msgSend(v4, "setLibrary:", 4);
              objc_msgSend(v4, "setIsPurchased:", 1);
              if (objc_msgSend(v11, "BOOLValue"))
              {
                v27 = BLAudiobookStreamingEnabled();
                v5 = v34;
              }
              else
              {
                v5 = v34;
                -[BSUILibraryItemStateProvider _updateStateToDownloadFinishedForIdentifier:](v29, "_updateStateToDownloadFinishedForIdentifier:", v34);
                objc_msgSend(v4, "setDownload:", 2);
                v27 = 0;
              }
              v7 = v31;
              v6 = v32;
              v8 = v30;
              objc_msgSend(v4, "setStreamable:", v27);

              LOBYTE(v11) = 1;
              goto LABEL_18;
            }
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v11)
          continue;
        break;
      }
      v6 = v32;
      v5 = v34;
      v8 = v30;
      v7 = v31;
    }
LABEL_18:

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (BOOL)_updateItemStateFieldsFromJalisco:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  NSObject *accessQ;
  _QWORD block[5];
  id v23;
  id v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeStoreAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (!v8)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoReadOnlyDAAPClient sharedClient](BLJaliscoReadOnlyDAAPClient, "sharedClient"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
  v25 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fetchServerItemsForStoreIDs:andDSIDS:", v12, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  if (!v15)
  {

LABEL_14:
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CB0C;
    block[3] = &unk_2E4230;
    block[4] = self;
    v23 = v9;
    v24 = v4;
    dispatch_sync(accessQ, block);

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "expectedDate"));

  if (v17)
    v18 = 3;
  else
    v18 = 4;
  objc_msgSend(v4, "setLibrary:", v18);
  v19 = 1;
  objc_msgSend(v4, "setIsPurchased:", 1);
LABEL_16:

  return v19;
}

- (id)_stateForItemIdentifier:(id)a3
{
  id v4;
  PPLibraryItemState *v5;
  NSObject *accessQ;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  void **v18;
  uint64_t v19;
  void (*v20)(_QWORD *);
  void *v21;
  BSUILibraryItemStateProvider *v22;
  id v23;
  uint64_t *v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD block[5];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v4 = a3;
  v5 = objc_alloc_init(PPLibraryItemState);
  -[PPLibraryItemState setItemIdentifier:](v5, "setItemIdentifier:", v4);
  -[PPLibraryItemState setLibrary:](v5, "setLibrary:", 0);
  -[PPLibraryItemState setDownload:](v5, "setDownload:", 0);
  -[PPLibraryItemState setIsInSamples:](v5, "setIsInSamples:", 0);
  -[PPLibraryItemState setIsSample:](v5, "setIsSample:", 0);
  -[PPLibraryItemState setUpdateAvailable:](v5, "setUpdateAvailable:", 0);
  -[PPLibraryItemState setAssetIsPreorderable:](v5, "setAssetIsPreorderable:", 0);
  -[PPLibraryItemState setIsPurchased:](v5, "setIsPurchased:", 0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_C344;
  v48 = sub_C354;
  v49 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CF58;
  block[3] = &unk_2E4258;
  v43 = &v44;
  block[4] = self;
  v7 = v4;
  v42 = v7;
  dispatch_sync(accessQ, block);
  if (!v45[5])
  {
    v8 = kBKCollectionDefaultIDWantToRead;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_CF94;
    v39[3] = &unk_2E42A8;
    v39[4] = self;
    v40 = v7;
    +[BDSServiceCenter fetchIsAssetID:inCollectionID:completion:](BDSServiceCenter, "fetchIsAssetID:inCollectionID:completion:", v40, v8, v39);

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_C344;
  v37 = sub_C354;
  v38 = 0;
  v9 = self->_accessQ;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_D090;
  v30[3] = &unk_2E4258;
  v32 = &v33;
  v30[4] = self;
  v10 = v7;
  v31 = v10;
  dispatch_sync(v9, v30);
  if (!v34[5])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetDetailManager"));

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_D0CC;
    v28[3] = &unk_2E42D0;
    v28[4] = self;
    v29 = v10;
    objc_msgSend(v12, "assetDetailForAssetID:completion:", v29, v28);

  }
  if (!-[BSUILibraryItemStateProvider _updateItemStateFieldsFromMediaLibrary:](self, "_updateItemStateFieldsFromMediaLibrary:", v5)&& !-[BSUILibraryItemStateProvider _updateItemStateFieldsFromCache:](self, "_updateItemStateFieldsFromCache:", v5)&& !-[BSUILibraryItemStateProvider _updateItemStateFieldsFromBookLibrary:](self, "_updateItemStateFieldsFromBookLibrary:", v5))
  {
    -[BSUILibraryItemStateProvider _updateItemStateFieldsFromJalisco:](self, "_updateItemStateFieldsFromJalisco:", v5);
  }
  v13 = self->_accessQ;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_D268;
  v25[3] = &unk_2E4258;
  v27 = &v44;
  v25[4] = self;
  v14 = v10;
  v26 = v14;
  dispatch_sync(v13, v25);
  -[PPLibraryItemState setWantToRead:](v5, "setWantToRead:", objc_msgSend((id)v45[5], "BOOLValue"));
  v15 = self->_accessQ;
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_D2A4;
  v21 = &unk_2E4258;
  v24 = &v33;
  v22 = self;
  v16 = v14;
  v23 = v16;
  dispatch_sync(v15, &v18);
  -[PPLibraryItemState setFinished:](v5, "setFinished:", objc_msgSend((id)v34[5], "isFinished", v18, v19, v20, v21, v22));
  -[PPLibraryItemState setHasSpecifiedFinishedDate:](v5, "setHasSpecifiedFinishedDate:", objc_msgSend((id)v34[5], "hasSpecifiedFinishedDate"));

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v44, 8);

  return v5;
}

- (id)itemsOfInterest
{
  NSObject *accessQ;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_C344;
  v10 = sub_C354;
  v11 = 0;
  accessQ = self->_accessQ;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D394;
  v5[3] = &unk_2E42F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_trackChildIdentifier:(id)a3 forParentIdentifier:(id)a4
{
  id v6;
  NSObject *accessQ;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D488;
    block[3] = &unk_2E4230;
    block[4] = self;
    v10 = v8;
    v11 = v6;
    dispatch_sync(accessQ, block);

  }
}

- (void)_untrackChildIdentifier:(id)a3 forParentIdentifier:(id)a4
{
  id v6;
  NSObject *accessQ;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D5D4;
    block[3] = &unk_2E4230;
    block[4] = self;
    v10 = v6;
    v11 = v8;
    dispatch_sync(accessQ, block);

  }
}

- (BOOL)_hasRemainingDownloadsForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQ;
  BOOL v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (v4)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D70C;
    block[3] = &unk_2E4280;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQ, block);

    v7 = *((_BYTE *)v13 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v5 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v24;
    *(_QWORD *)&v7 = 138412802;
    v22 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeID", v22));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storePlaylistID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadID"));
        v17 = BKLibraryItemStateProviderLog();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v22;
          v28 = v13;
          v29 = 2112;
          v30 = v15;
          v31 = 2114;
          v32 = v16;
          _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "Processing download state change: %@, parent:%@, downloadID:%{public}@", buf, 0x20u);
        }

        if (v15)
          v19 = v15;
        else
          v19 = v13;
        v20 = v19;
        if (v20)
        {
          -[BSUILibraryItemStateProvider _trackChildIdentifier:forParentIdentifier:](self, "_trackChildIdentifier:forParentIdentifier:", v13, v15);
          if (!-[BSUILibraryItemStateProvider _itemIsBeingDownloaded:](self, "_itemIsBeingDownloaded:", v20))
          {
            if (-[BSUILibraryItemStateProvider _itemIsPurchasedThisSession:](self, "_itemIsPurchasedThisSession:", v20))
            {
              -[BSUILibraryItemStateProvider _updateStateToDownloadingForIdentifier:](self, "_updateStateToDownloadingForIdentifier:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v20));
              -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v20, v21);

            }
          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v8);
  }

}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];

  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 138412802;
    v23 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID", v23));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storePlaylistID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

        if (v16)
          v17 = v16;
        else
          v17 = v14;
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "downloadID"));
        v20 = BKLibraryItemStateProviderLog();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v29 = v14;
          v30 = 2112;
          v31 = v16;
          v32 = 2114;
          v33 = v19;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Processing download complete: %@, parent:%@, downloadID:%{public}@", buf, 0x20u);
        }

        if (v18)
        {
          -[BSUILibraryItemStateProvider _untrackChildIdentifier:forParentIdentifier:](self, "_untrackChildIdentifier:forParentIdentifier:", v14, v16);
          if (!-[BSUILibraryItemStateProvider _hasRemainingDownloadsForIdentifier:](self, "_hasRemainingDownloadsForIdentifier:", v16))
          {
            -[BSUILibraryItemStateProvider _updateStateToDownloadFinishedForIdentifier:](self, "_updateStateToDownloadFinishedForIdentifier:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v18));
            -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:](self->_stateCenter, "updateItemWithIdentifier:state:", v18, v22);

          }
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v9);
  }

}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "storeIdentifier", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v6 = v7;
  if (v7)
  {
    -[BSUILibraryItemStateProvider updateStateToPurchasingForIdentifier:](self, "updateStateToPurchasingForIdentifier:", v7);
    v6 = v7;
  }

}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  -[BSUILibraryItemStateProvider updateAllItemsOfInterest](self, "updateAllItemsOfInterest", a3, a4);
}

- (BSUILibraryItemStateCenter)stateCenter
{
  return self->_stateCenter;
}

- (id)purchaseSucceededObserver
{
  return self->_purchaseSucceededObserver;
}

- (void)setPurchaseSucceededObserver:(id)a3
{
  objc_storeStrong(&self->_purchaseSucceededObserver, a3);
}

- (id)purchaseFailedObserver
{
  return self->_purchaseFailedObserver;
}

- (void)setPurchaseFailedObserver:(id)a3
{
  objc_storeStrong(&self->_purchaseFailedObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purchaseFailedObserver, 0);
  objc_storeStrong(&self->_purchaseSucceededObserver, 0);
  objc_storeStrong((id *)&self->_stateCenter, 0);
  objc_storeStrong((id *)&self->_childIdentifiersForParentIdentifierMap, 0);
  objc_storeStrong((id *)&self->_parentIdentifierForStoreIdentifierMap, 0);
  objc_storeStrong((id *)&self->_purchasesMadeThisSession, 0);
  objc_storeStrong((id *)&self->_downloadingItems, 0);
  objc_storeStrong((id *)&self->_itemFinishedStateCache, 0);
  objc_storeStrong((id *)&self->_itemWantToReadStateCache, 0);
  objc_storeStrong((id *)&self->_itemStateCache, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_fileChangesQ, 0);
  objc_storeStrong((id *)&self->_accessQ, 0);
}

@end
