@implementation THReflowablePaginationController

- (THReflowablePaginationController)initWithDocumentRoot:(id)a3 sourcePresentationType:(id)a4 targetPresentationType:(id)a5 loadCache:(BOOL)a6 observer:(id)a7
{
  _BOOL4 v8;
  THReflowablePaginationController *v12;
  NSOperationQueue *v13;
  NSOperationQueue *v14;
  NSMutableArray *v15;
  objc_super v17;

  v8 = a6;
  v17.receiver = self;
  v17.super_class = (Class)THReflowablePaginationController;
  v12 = -[THReflowablePaginationController init](&v17, "init");
  if (v12)
  {
    v12->_documentRoot = (THDocumentRoot *)a3;
    v12->_sourcePresentationType = (THPresentationType *)a4;
    v12->_presentationType = (THPresentationType *)objc_msgSend(a5, "copyFixingSize");
    v12->_paginationResults = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v12->_paginationCompletions = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
    v12->_loadCompletions = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
    v13 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v12->_paginationQueue = v13;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v13, "setMaxConcurrentOperationCount:", 1);
    v14 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v12->_loadQueue = v14;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v14, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue addObserver:forKeyPath:options:context:](v12->_paginationQueue, "addObserver:forKeyPath:options:context:", v12, CFSTR("operationCount"), 0, 0);
    -[NSOperationQueue addObserver:forKeyPath:options:context:](v12->_loadQueue, "addObserver:forKeyPath:options:context:", v12, CFSTR("operationCount"), 0, 0);
    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v12->_observers = v15;
    -[NSMutableArray addObject:](v15, "addObject:", a7);
    if (v8)
      -[THReflowablePaginationController loadPaginationCache](v12, "loadPaginationCache");
  }
  return v12;
}

- (void)teardown
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  objc_sync_enter(self);

  self->_observers = 0;
  self->_documentRoot = 0;

  self->_sourcePresentationType = 0;
  self->_presentationType = 0;

  self->_paginationResults = 0;
  self->_paginationCompletions = 0;

  self->_loadCompletions = 0;
  -[NSOperationQueue removeObserver:forKeyPath:](self->_paginationQueue, "removeObserver:forKeyPath:", self, CFSTR("operationCount"));
  -[NSOperationQueue cancelAllOperations](self->_paginationQueue, "cancelAllOperations");

  self->_paginationQueue = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSOperationQueue operations](self->_loadQueue, "operations", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "delegate") == self)
          objc_msgSend(v7, "setDelegate:", 0);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  -[NSOperationQueue removeObserver:forKeyPath:](self->_loadQueue, "removeObserver:forKeyPath:", self, CFSTR("operationCount"));
  -[NSOperationQueue cancelAllOperations](self->_loadQueue, "cancelAllOperations");

  self->_loadQueue = 0;
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_super v3;

  -[THReflowablePaginationController teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)THReflowablePaginationController;
  -[THReflowablePaginationController dealloc](&v3, "dealloc");
}

- (unint64_t)numberOfContentNodes
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (!self->_numberOfContentNodes)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = -[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](-[THReflowablePaginationController documentRoot](self, "documentRoot", 0), "navigationModel"), "navigationUnits");
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          self->_numberOfContentNodes += (unint64_t)objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "contentNodes"), "count");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
  return self->_numberOfContentNodes;
}

- (void)willClose
{
  -[THReflowablePaginationController savePaginationCache](self, "savePaginationCache");
}

- (void)stopPagination
{
  objc_sync_enter(self);
  -[NSOperationQueue cancelAllOperations](-[THReflowablePaginationController loadQueue](self, "loadQueue"), "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](-[THReflowablePaginationController paginationQueue](self, "paginationQueue"), "cancelAllOperations");
  objc_sync_exit(self);
}

- (void)setPresentationType:(id)a3
{
  _QWORD v5[6];

  objc_sync_enter(self);
  if (!-[THPresentationType isEqualIncludingSize:](self->_presentationType, "isEqualIncludingSize:", a3))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_D7068;
    v5[3] = &unk_426E28;
    v5[4] = self;
    v5[5] = a3;
    _os_activity_initiate(&dword_0, "RPC Set presentation Type", OS_ACTIVITY_FLAG_DEFAULT, v5);
  }
  objc_sync_exit(self);
}

- (BOOL)presentationTypeMatchesPageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  BOOL v8;

  height = a3.height;
  width = a3.width;
  objc_sync_enter(self);
  if (-[THReflowablePaginationController presentationType](self, "presentationType"))
  {
    -[THPresentationType pageSize](self->_presentationType, "pageSize");
    v8 = v7 == height && v6 == width;
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (void)assignContentNodes
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];

  objc_sync_enter(self);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = -[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v8 = objc_msgSend(v7, "contentNodes", 0);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v13;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v13 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "setReflowablePaginationController:", self);
              v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
          }
          while (v9);
        }
        v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }
  objc_sync_exit(self);
}

- (void)paginate
{
  NSObject *v3;
  _QWORD v4[6];

  objc_sync_enter(self);
  -[THReflowablePaginationController setPaginationInProgress:](self, "setPaginationInProgress:", 1);
  v3 = _os_activity_create(&dword_0, "RPC Pagination", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_D7500;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = v3;
  os_activity_apply(v3, v4);

  objc_sync_exit(self);
}

- (void)setPaginationInProgress:(BOOL)a3
{
  BOOL v4;
  _QWORD block[6];
  BOOL v6;

  if (self->_paginationInProgress != a3)
  {
    self->_paginationInProgress = a3;
    v4 = !a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D773C;
    block[3] = &unk_428E10;
    block[4] = -[THPresentationType copyFixingSize](-[THReflowablePaginationController presentationType](self, "presentationType"), "copyFixingSize");
    block[5] = self;
    v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)p_updatePaginationInProgress
{
  -[THReflowablePaginationController setPaginationInProgress:](self, "setPaginationInProgress:", -[THReflowablePaginationController paginationComplete](self, "paginationComplete") ^ 1);
}

- (void)p_updatePageNumbers
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSArray *obj;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  objc_sync_enter(self);
  if (-[THReflowablePaginationController paginationComplete](self, "paginationComplete"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = -[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits");
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v4)
    {
      obj = v3;
      v15 = *(_QWORD *)v22;
      v5 = 1;
      do
      {
        v6 = 0;
        v16 = v4;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v6);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v8 = objc_msgSend(v7, "contentNodes");
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v18;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(_QWORD *)v18 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
                v13 = -[THReflowablePaginationController paginationResultForContentNode:](self, "paginationResultForContentNode:", v12);
                objc_msgSend(v12, "setDisplayStartingPageNumber:presentationType:", v5, -[THReflowablePaginationController presentationType](self, "presentationType"));
                objc_msgSend(v13, "setFirstPageIndex:", v5 - 1);
                if (v13)
                {
                  objc_msgSend(v12, "setPageCount:forPresentationType:", objc_msgSend(v13, "pageCount"), objc_msgSend(v13, "presentationType"));
                  v5 += (uint64_t)objc_msgSend(v13, "pageCount");
                }
              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v9);
          }
          v6 = (char *)v6 + 1;
        }
        while (v6 != v16);
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v4);
    }
  }
  objc_sync_exit(self);
}

- (id)p_queuePaginationOperationForContentNode:(id)a3 nodeBody:(id)a4 priority:(int64_t)a5 isForeground:(BOOL)a6
{
  THReflowableContentPaginationOperation *v8;

  v8 = -[THReflowableContentPaginationOperation initWithContentNode:paginationResults:flowModelContentNodeBody:presentationType:documentRoot:isForegroundPagination:delegate:]([THReflowableContentPaginationOperation alloc], "initWithContentNode:paginationResults:flowModelContentNodeBody:presentationType:documentRoot:isForegroundPagination:delegate:", a3, -[THReflowablePaginationController paginationResultForContentNode:](self, "paginationResultForContentNode:"), a4, -[THReflowablePaginationController presentationType](self, "presentationType"), -[THReflowablePaginationController documentRoot](self, "documentRoot"), a6, self);
  -[THReflowableContentPaginationOperation setQueuePriority:](v8, "setQueuePriority:", a5);
  -[NSOperationQueue addOperation:](-[THReflowablePaginationController paginationQueue](self, "paginationQueue"), "addOperation:", v8);
  return v8;
}

- (id)paginateContentNode:(id)a3 paginationCompletionDelegate:(id)a4 priority:(int64_t)a5 isForeground:(BOOL)a6 activity:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  THModelContentLoadOperation *v14;

  v7 = a6;
  objc_sync_enter(self);
  if (a4
    && !-[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController paginationCompletions](self, "paginationCompletions"), "objectForKey:", a3))
  {
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THReflowablePaginationController paginationCompletions](self, "paginationCompletions"), "setObject:forUncopiedKey:", a4, a3);
  }
  v12 = objc_msgSend(a3, "nodeBodyForPresentationType:", -[THReflowablePaginationController sourcePresentationType](self, "sourcePresentationType"));
  if (v12)
  {
    v13 = -[THReflowablePaginationController p_queuePaginationOperationForContentNode:nodeBody:priority:isForeground:](self, "p_queuePaginationOperationForContentNode:nodeBody:priority:isForeground:", a3, v12, a5, v7);
  }
  else
  {
    v14 = -[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]([THModelContentLoadOperation alloc], "initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:", self, a3, -[THReflowablePaginationController documentRoot](self, "documentRoot"), -[THBookDescription bookBundleUrl](-[THDocumentRoot bookDescription](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "bookDescription"), "bookBundleUrl"), objc_msgSend(a3, "applePubRelativePath"));
    -[THModelContentLoadOperation setQueuePriority:](v14, "setQueuePriority:", a5);
    -[NSOperationQueue addOperation:](-[THReflowablePaginationController loadQueue](self, "loadQueue"), "addOperation:", v14);

    v13 = 0;
  }
  -[THReflowablePaginationController p_updatePaginationInProgress](self, "p_updatePaginationInProgress");
  objc_sync_exit(self);
  return v13;
}

- (unint64_t)paginationCount
{
  NSMutableDictionary *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  objc_sync_enter(self);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[THReflowablePaginationController paginationResults](self, "paginationResults", 0);
  v4 = 0;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "presentationType"), "isEqualIncludingSize:", -[THReflowablePaginationController presentationType](self, "presentationType"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_sync_exit(self);
  return v4;
}

- (double)paginationProgress
{
  double v3;

  if (!-[THReflowablePaginationController numberOfContentNodes](self, "numberOfContentNodes"))
    return 0.0;
  v3 = (double)-[THReflowablePaginationController paginationCount](self, "paginationCount");
  return v3 / (double)-[THReflowablePaginationController numberOfContentNodes](self, "numberOfContentNodes");
}

- (BOOL)paginationComplete
{
  unint64_t v3;

  v3 = -[THReflowablePaginationController paginationCount](self, "paginationCount");
  return v3 == -[THReflowablePaginationController numberOfContentNodes](self, "numberOfContentNodes");
}

- (void)savePaginationCache
{
  THBookDescription *v3;
  THReflowablePaginationCache *v4;
  NSMutableDictionary *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  objc_sync_enter(self);
  if (-[NSMutableDictionary count](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "count"))
  {
    v3 = -[THDocumentRoot bookDescription](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "bookDescription");
    v4 = -[THReflowablePaginationCache initWithAssetID:bookVersionString:modificationDate:]([THReflowablePaginationCache alloc], "initWithAssetID:bookVersionString:modificationDate:", -[THAsset assetID](-[THBookDescription asset](v3, "asset"), "assetID"), -[THBookDescription bookVersionString](v3, "bookVersionString"), -[THDocumentProperties modificationDate](-[THDocumentRoot properties](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "properties"), "modificationDate"));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = -[THReflowablePaginationController paginationResults](self, "paginationResults", 0);
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          -[THReflowablePaginationCache cacheResult:forKey:](v4, "cacheResult:forKey:", -[NSMutableDictionary objectForKeyedSubscript:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8)), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[THReflowablePaginationCache archive](v4, "archive");

  }
  objc_sync_exit(self);
}

- (void)loadPaginationCache
{
  THBookDescription *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = -[THDocumentRoot bookDescription](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "bookDescription");
  v4 = +[THReflowablePaginationCache loadFromArchiveWithAssetID:bookVersionString:modificationDate:](THReflowablePaginationCache, "loadFromArchiveWithAssetID:bookVersionString:modificationDate:", -[THAsset assetID](-[THBookDescription asset](v3, "asset"), "assetID"), -[THBookDescription bookVersionString](v3, "bookVersionString"), -[THDocumentProperties modificationDate](-[THDocumentRoot properties](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "properties"), "modificationDate"));
  objc_sync_enter(self);
  v5 = objc_msgSend(v4, "keyEnumerator");
  while (1)
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    v7 = objc_msgSend(v4, "cachedResultsForKey:", v6);
    if (-[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForGUID:", objc_msgSend(v7, "nodeGUID")))
    {
      -[THReflowablePaginationController updatePaginationResult:presentationType:](self, "updatePaginationResult:presentationType:", v7, objc_msgSend(v6, "presentationType"));
    }
  }
  objc_sync_exit(self);
}

- (id)paginationResultForContentNode:(id)a3
{
  THPaginationResultsKey *v5;
  id v6;

  objc_sync_enter(self);
  v5 = -[THPaginationResultsKey initWithContentNode:presentationType:]([THPaginationResultsKey alloc], "initWithContentNode:presentationType:", a3, -[THReflowablePaginationController presentationType](self, "presentationType"));
  v6 = -[NSMutableDictionary objectForKey:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "objectForKey:", v5);

  objc_sync_exit(self);
  return v6;
}

- (void)updatePaginationResult:(id)a3
{
  -[THReflowablePaginationController updatePaginationResult:presentationType:](self, "updatePaginationResult:presentationType:", a3, -[THReflowablePaginationController presentationType](self, "presentationType"));
}

- (void)updatePaginationResult:(id)a3 presentationType:(id)a4
{
  THPaginationResultsKey *v7;

  objc_sync_enter(self);
  v7 = -[THPaginationResultsKey initWithContentNodeGUID:presentationType:]([THPaginationResultsKey alloc], "initWithContentNodeGUID:presentationType:", objc_msgSend(a3, "nodeGUID"), a4);
  if (-[NSMutableDictionary objectForKey:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "objectForKey:", v7))
  {
    -[NSMutableDictionary removeObjectForKey:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "removeObjectForKey:", v7);
  }
  if (a3)
    -[NSMutableDictionary setObject:forKey:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "setObject:forKey:", a3, v7);

  objc_sync_exit(self);
}

- (id)loadOperationForContentNode:(id)a3 loadOperationCompletionDelegate:(id)a4 priority:(int64_t)a5
{
  NSArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  objc_sync_enter(self);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = -[NSOperationQueue operations](-[THReflowablePaginationController loadQueue](self, "loadQueue", 0), "operations");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "contentNode") == a3)
        {
          objc_msgSend(v13, "setQueuePriority:", a5);
          v15 = v13;
          v14 = v15;
          if (a4
            && v15
            && !-[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "objectForKey:", a3))
          {
            -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "setObject:forUncopiedKey:", a4, a3);
          }
          goto LABEL_14;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:
  objc_sync_exit(self);
  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("operationCount"))
    && (-[THReflowablePaginationController paginationQueue](self, "paginationQueue") == a4
     || -[THReflowablePaginationController loadQueue](self, "loadQueue") == a4))
  {
    -[THReflowablePaginationController paginationQueue](self, "paginationQueue");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THReflowablePaginationController;
    -[THReflowablePaginationController observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6);
  }
}

- (void)registerObserver:(id)a3
{
  objc_sync_enter(self);
  if ((-[NSMutableArray tsu_containsObjectIdenticalTo:](-[THReflowablePaginationController observers](self, "observers"), "tsu_containsObjectIdenticalTo:", a3) & 1) == 0)-[NSMutableArray addObject:](-[THReflowablePaginationController observers](self, "observers"), "addObject:", a3);
  objc_sync_exit(self);
}

- (void)unregisterObserver:(id)a3
{
  objc_sync_enter(self);
  if (-[NSMutableArray tsu_containsObjectIdenticalTo:](-[THReflowablePaginationController observers](self, "observers"), "tsu_containsObjectIdenticalTo:", a3))-[NSMutableArray removeObjectIdenticalTo:](-[THReflowablePaginationController observers](self, "observers"), "removeObjectIdenticalTo:", a3);
  objc_sync_exit(self);
}

- (void)contentPaginationOperation:(id)a3 paginatedNodeBody:(id)a4 forPresentationType:(id)a5
{
  id v8;
  THPaginationResultsKey *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  char v15;
  _QWORD v16[7];
  char v17;

  objc_sync_enter(self);
  v8 = objc_msgSend(a3, "paginationResults");
  if (!-[THReflowablePaginationController paginationResultForContentNode:](self, "paginationResultForContentNode:", objc_msgSend(a3, "contentNode")))
  {
    v9 = -[THPaginationResultsKey initWithContentNode:presentationType:]([THPaginationResultsKey alloc], "initWithContentNode:presentationType:", objc_msgSend(a3, "contentNode"), -[THReflowablePaginationController presentationType](self, "presentationType"));
    if (objc_msgSend(a3, "paginationResults"))
      -[NSMutableDictionary setObject:forKey:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "setObject:forKey:", objc_msgSend(a3, "paginationResults"), v9);

  }
  objc_msgSend(objc_msgSend(a3, "contentNode"), "setPageCount:forPresentationType:", objc_msgSend(v8, "pageCount"), objc_msgSend(v8, "presentationType"));
  v10 = -[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController paginationCompletions](self, "paginationCompletions"), "objectForKey:", objc_msgSend(a3, "contentNode"));
  if (v10)
  {
    objc_msgSend(v10, "paginationController:paginatedBody:forPresentationType:", self, objc_msgSend(a3, "paginatedModelContentNodeBody"), a5);
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THReflowablePaginationController paginationCompletions](self, "paginationCompletions"), "removeObjectForKey:", objc_msgSend(a3, "contentNode"));
  }
  v11 = objc_msgSend(a3, "contentNode");
  -[THReflowablePaginationController paginationProgress](self, "paginationProgress");
  v13 = v12;
  v14 = -[THReflowablePaginationController paginationComplete](self, "paginationComplete");
  v15 = v14;
  if (v14)
  {
    -[THReflowablePaginationController p_updatePageNumbers](self, "p_updatePageNumbers");
    -[THReflowablePaginationController p_updatePaginationInProgress](self, "p_updatePaginationInProgress");
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_D8850;
  v16[3] = &unk_429360;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  v17 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
  objc_sync_exit(self);
}

- (void)contentLoadOperation:(id)a3 loadedContentBodies:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  unsigned int v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  objc_sync_enter(self);
  v7 = -[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "objectForKey:", objc_msgSend(a3, "contentNode"));
  if (v7)
  {
    objc_msgSend(v7, "contentLoadOperation:loadedContentBodies:", a3, a4);
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "removeObjectForKey:", objc_msgSend(a3, "contentNode"));
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v21 = a3;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(a4);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v15 = objc_opt_class(THPresentationType, v8);
          *(_QWORD *)&v17 = TSUDynamicCast(v15, v14).n128_u64[0];
          v18 = v16;
          if (v16)
          {
            v19 = objc_msgSend(a4, "objectForKey:", v16, v17);
            if (v11 & 1 | ((objc_msgSend(v18, "isFlow") & 1) == 0))
            {
              v20 = objc_msgSend(v18, "isPaginated");
              if (v20)
                v10 = 0;
              v11 |= v20;
            }
            else
            {
              v11 = 0;
              v10 = v19;
            }
          }
        }
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v17);
      }
      while (v9);
      if (!(v11 & 1 | (v10 == 0)))
        -[THReflowablePaginationController p_queuePaginationOperationForContentNode:nodeBody:priority:isForeground:](self, "p_queuePaginationOperationForContentNode:nodeBody:priority:isForeground:", objc_msgSend(v21, "contentNode"), v10, 0, 0);
    }
  }
  objc_sync_exit(self);
}

- (void)contentLoadOperationFailed:(id)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "objectForKey:", objc_msgSend(a3, "contentNode"));
  if (v5)
  {
    objc_msgSend(v5, "contentLoadOperationFailed:", a3);
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "removeObjectForKey:", objc_msgSend(a3, "contentNode"));
  }
  objc_sync_exit(self);
}

- (BOOL)navigationPageNode
{
  return 0;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setNumberOfContentNodes:(unint64_t)a3
{
  self->_numberOfContentNodes = a3;
}

- (THPresentationType)sourcePresentationType
{
  return self->_sourcePresentationType;
}

- (void)setSourcePresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (NSMutableDictionary)paginationResults
{
  return self->_paginationResults;
}

- (void)setPaginationResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSOperationQueue)loadQueue
{
  return self->_loadQueue;
}

- (void)setLoadQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSOperationQueue)paginationQueue
{
  return self->_paginationQueue;
}

- (void)setPaginationQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (TSUPointerKeyDictionary)paginationCompletions
{
  return self->_paginationCompletions;
}

- (void)setPaginationCompletions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (TSUPointerKeyDictionary)loadCompletions
{
  return self->_loadCompletions;
}

- (void)setLoadCompletions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)paginationInProgress
{
  return self->_paginationInProgress;
}

@end
