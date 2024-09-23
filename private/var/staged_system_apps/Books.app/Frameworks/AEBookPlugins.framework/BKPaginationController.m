@implementation BKPaginationController

- (BKPaginationController)init
{
  BKPaginationController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPaginationController;
  v2 = -[BKPaginationController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "managedObjectContextDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    v2->_pageTotal = 0x7FFFFFFFFFFFFFFFLL;
    v2->_paginationBatchSize = 0;
    v2->_paginationBatchProgress = 0;
    v2->_jobGeneration = 0;
  }
  return v2;
}

- (BKPaginationController)initWithBook:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  BKPaginationController *v9;
  uint64_t v10;
  NSManagedObjectID *bookObjectID;
  uint64_t v12;
  NSString *bookDatabaseKey;
  uint64_t v14;
  NSString *bookLanguage;
  void *v16;
  uint64_t v17;
  NSManagedObjectContext *primaryMOC;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = -[BKPaginationController init](self, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
    bookObjectID = v9->_bookObjectID;
    v9->_bookObjectID = (NSManagedObjectID *)v10;

    objc_storeStrong((id *)&v9->_bookObject, a3);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "databaseKey"));
    bookDatabaseKey = v9->_bookDatabaseKey;
    v9->_bookDatabaseKey = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookLanguage"));
    bookLanguage = v9->_bookLanguage;
    v9->_bookLanguage = (NSString *)v14;

    v9->_bookDirection = objc_msgSend(v7, "bkPageProgressionDirection");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sampleContent"));
    v9->_bookSample = objc_msgSend(v16, "BOOLValue");

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
    primaryMOC = v9->_primaryMOC;
    v9->_primaryMOC = (NSManagedObjectContext *)v17;

    v9->_bookShouldDisableOptimizeSpeed = objc_msgSend(v7, "shouldDisableOptimizeSpeed");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spineIndexInPackage"));
    v9->_spineIndexInPackage = (unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  NSOperationQueue *layoutQueue;
  NSOperationQueue *resultsQueue;
  NSString *lookupKey;
  NSManagedObjectContext *primaryMOC;
  NSArray *paginationInfo;
  NSArray *chapterInfo;
  NSArray *physicalPagesInfo;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[BKPaginationController setJobGeneration:](self, "setJobGeneration:", (char *)-[BKPaginationController jobGeneration](self, "jobGeneration") + 1);
  layoutQueue = self->_layoutQueue;
  self->_layoutQueue = 0;

  resultsQueue = self->_resultsQueue;
  self->_resultsQueue = 0;

  -[BKPaginationController _releaseData:](self, "_releaseData:", 0);
  -[BKPaginationController setOperationFactory:](self, "setOperationFactory:", 0);
  lookupKey = self->_lookupKey;
  self->_lookupKey = 0;

  primaryMOC = self->_primaryMOC;
  self->_primaryMOC = 0;

  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = 0;

  chapterInfo = self->_chapterInfo;
  self->_chapterInfo = 0;

  physicalPagesInfo = self->_physicalPagesInfo;
  self->_physicalPagesInfo = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v11.receiver = self;
  v11.super_class = (Class)BKPaginationController;
  -[BKPaginationController dealloc](&v11, "dealloc");
}

- (id)paginationCompletedNotificationName
{
  return BKPaginationCompleteForBookNotification;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return -[NSManagedObjectContext persistentStoreCoordinator](self->_primaryMOC, "persistentStoreCoordinator");
}

- (AEAnnotationProvider)bookAnnotationProvider
{
  return -[AEBookInfo annotationProvider](self->_bookObject, "annotationProvider");
}

- (void)destroyIvars
{
  NSArray *paginationInfo;
  NSArray *chapterInfo;
  NSArray *physicalPagesInfo;
  NSString *bookDatabaseKey;
  NSString *lookupKey;
  NSManagedObjectID *bookObjectID;
  NSManagedObjectContext *primaryMOC;
  AEBookInfo *bookObject;
  ContentStyle *style;
  BKPaginationFactory *operationFactory;
  BKNavigationHistory *navigationHistory;
  BKFlowingBookLayoutConfiguration *configuration;

  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = 0;

  chapterInfo = self->_chapterInfo;
  self->_chapterInfo = 0;

  physicalPagesInfo = self->_physicalPagesInfo;
  self->_physicalPagesInfo = 0;

  -[BKPaginationController setBookmarkPageCounts:](self, "setBookmarkPageCounts:", 0);
  bookDatabaseKey = self->_bookDatabaseKey;
  self->_bookDatabaseKey = 0;

  lookupKey = self->_lookupKey;
  self->_lookupKey = 0;

  bookObjectID = self->_bookObjectID;
  self->_bookObjectID = 0;

  primaryMOC = self->_primaryMOC;
  self->_primaryMOC = 0;

  bookObject = self->_bookObject;
  self->_bookObject = 0;

  style = self->_style;
  self->_style = 0;

  operationFactory = self->_operationFactory;
  self->_operationFactory = 0;

  navigationHistory = self->_navigationHistory;
  self->_navigationHistory = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

}

- (void)setOperationFactory:(id)a3
{
  BKPaginationFactory *v5;
  BKPaginationFactory **p_operationFactory;
  BKPaginationFactory *operationFactory;
  BKPaginationFactory *v8;

  v5 = (BKPaginationFactory *)a3;
  operationFactory = self->_operationFactory;
  p_operationFactory = &self->_operationFactory;
  if (operationFactory != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_operationFactory, a3);
    v5 = v8;
  }

}

- (void)postPaginationLoadedNotification
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", BKPaginationDataLoadedNotification, self);

  v4 = _AEPaginationLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Posting PaginationLoaded", v6, 2u);
  }

}

- (void)batchEnded:(BOOL)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  if (a3)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_7A02C;
    v3[3] = &unk_1C0788;
    objc_copyWeak(&v4, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

+ (id)newPaginationControllerForBook:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  BKPaginationController *v7;
  unsigned int v8;
  EpubPaginationFactory *v9;

  v5 = a4;
  v6 = a3;
  v7 = -[BKPaginationController initWithBook:delegate:]([BKPaginationController alloc], "initWithBook:delegate:", v6, v5);

  v8 = objc_msgSend(v6, "contentType");
  if (v8 == 2)
  {
    v9 = (EpubPaginationFactory *)v7;
    v7 = 0;
    goto LABEL_5;
  }
  if (!v8)
  {
    v9 = -[EpubPaginationFactory initWithPaginationController:]([EpubPaginationFactory alloc], "initWithPaginationController:", v7);
    -[BKPaginationController setOperationFactory:](v7, "setOperationFactory:", v9);
LABEL_5:

  }
  return v7;
}

- (AEBookInfo)book
{
  return self->_bookObject;
}

- (void)cancelAllOperations
{
  -[BKPaginationController setJobGeneration:](self, "setJobGeneration:", (char *)-[BKPaginationController jobGeneration](self, "jobGeneration") + 1);
  -[NSOperationQueue cancelAllOperations](self->_layoutQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_resultsQueue, "cancelAllOperations");
}

- (void)abortCurrentBatch
{
  BKPaginationAbortJob *v3;

  if (self->_resultsQueue)
  {
    -[BKPaginationController setJobGeneration:](self, "setJobGeneration:", (char *)-[BKPaginationController jobGeneration](self, "jobGeneration") + 1);
    -[NSOperationQueue cancelAllOperations](self->_resultsQueue, "cancelAllOperations");
    v3 = objc_alloc_init(BKPaginationAbortJob);
    -[BKPaginationController addResultSentinel:](self, "addResultSentinel:", v3);

  }
}

- (void)waitUntilAllOperationsAreFinished
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_layoutQueue, "operations"));
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    -[BKPaginationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "waitUntilAllOperationsAreFinished", 0, 1.0);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_resultsQueue, "operations"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_layoutQueue, "waitUntilAllOperationsAreFinished");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_resultsQueue, "waitUntilAllOperationsAreFinished");
}

- (void)quit
{
  -[BKPaginationController cancelAllOperations](self, "cancelAllOperations");
  -[BKPaginationFactory quit](self->_operationFactory, "quit");
  -[BKPaginationController abortCurrentBatch](self, "abortCurrentBatch");
  -[BKPaginationController destroyIvars](self, "destroyIvars");
  -[BKPaginationController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "waitUntilAllOperationsAreFinished", 0, 0);
}

- (id)documentPageCountForDocumentOrdinal:(int64_t)a3
{
  id v4;
  id v5;
  void *v6;

  if (a3 < 0)
  {
    v6 = 0;
  }
  else
  {
    v4 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", a3);
    v5 = -[NSArray bu_indexOfObjectWithValue:forKeyPath:](self->_paginationInfo, "bu_indexOfObjectWithValue:forKeyPath:", v4, CFSTR("documentOrdinal"));
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
      v6 = 0;
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_paginationInfo, "objectAtIndex:", v5));

  }
  return v6;
}

- (int64_t)pageNumberForDocumentOrdinal:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController documentPageCountForDocumentOrdinal:](self, "documentPageCountForDocumentOrdinal:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pageNumber"));
    v6 = (int64_t)objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (int64_t)pagesInDocumentOrdinal:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  signed int v6;
  int64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController documentPageCountForDocumentOrdinal:](self, "documentPageCountForDocumentOrdinal:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pageCount"));
    v6 = objc_msgSend(v5, "intValue");

    v7 = v6;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)pageTotal
{
  NSUInteger v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  if (self->_pageTotal == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = -[NSArray count](self->_paginationInfo, "count");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
    v5 = objc_msgSend(v4, "linearDocumentCount");

    if ((id)v3 == v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_paginationInfo, "lastObject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageNumber"));
      v8 = objc_msgSend(v7, "integerValue");

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageCount"));
      v10 = objc_msgSend(v9, "integerValue");

      self->_pageTotal = (int64_t)v10 + (_QWORD)v8 - 1;
    }
  }
  return self->_pageTotal;
}

- (void)repaginateWithStyle:(id)a3 geometry:(id)a4
{
  -[BKPaginationController repaginateWithStyle:geometry:force:](self, "repaginateWithStyle:geometry:force:", a3, a4, 0);
}

- (void)repaginateWithStyle:(id)a3 geometry:(id)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  __int16 v38;
  id v39;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController _lookupKey](self, "_lookupKey"));
  -[BKPaginationController setStyle:](self, "setStyle:", v8);
  -[BKPaginationController setConfiguration:](self, "setConfiguration:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "environment"));
  objc_msgSend(v12, "unfreeze");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController delegate](self, "delegate"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "environmentOverrideViewForPaginationController:", self));

  if (v14)
  {
    v15 = _AEPaginationLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 138412290;
      v37 = v14;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Set an override view: %@", (uint8_t *)&v36, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "environment"));
    objc_msgSend(v18, "setView:", v14);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "environment"));
  objc_msgSend(v20, "freeze");

  v21 = _AEPaginationLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
    v36 = 138543618;
    v37 = v23;
    v38 = 2114;
    v39 = v8;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "\nCaptured configuration: %{public}@\nStyle:%{public}@\n", (uint8_t *)&v36, 0x16u);

  }
  -[BKPaginationController releasePaginationInfo](self, "releasePaginationInfo");
  if (v8
    || !-[BKPaginationFactory isStyleRequiredForPagination](self->_operationFactory, "isStyleRequiredForPagination"))
  {
    v25 = objc_claimAutoreleasedReturnValue(-[BKPaginationController _lookupKey](self, "_lookupKey"));
    v26 = _AEPaginationLog();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 138543362;
      v37 = v25;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Repagination request made for:%{public}@.", (uint8_t *)&v36, 0xCu);
    }

    if ((objc_msgSend(v10, "isEqualToString:", v25) & 1) == 0)
    {
      v28 = _AEPaginationLog();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v36 = 138543618;
        v37 = v25;
        v38 = 2114;
        v39 = v10;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "CurrentKey:%{public}@ != PreviousKey:%{public}@ Resetting count. #retryPagination", (uint8_t *)&v36, 0x16u);
      }

      -[BKPaginationController setPaginationRetryCount:](self, "setPaginationRetryCount:", 0);
    }
    -[BKPaginationController updatePaginationCache:](self, "updatePaginationCache:", v5);
    -[BKPaginationController setJobGeneration:](self, "setJobGeneration:", (char *)-[BKPaginationController jobGeneration](self, "jobGeneration") + 1);
    v30 = -[BKPaginationJob init:]([BKPaginationBatchJob alloc], "init:", -[BKPaginationController jobGeneration](self, "jobGeneration"));
    objc_msgSend(v30, "setStyle:", v8);
    objc_msgSend(v30, "setLookupKey:", v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController bookDatabaseKey](self, "bookDatabaseKey"));
    objc_msgSend(v30, "setBookDatabaseKey:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
    objc_msgSend(v32, "contentLayoutSize");
    objc_msgSend(v30, "setPageSize:");

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController navigationHistory](self, "navigationHistory"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allObjects"));
    objc_msgSend(v30, "setHistoryEntities:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
    objc_msgSend(v30, "setConfiguration:", v35);

    objc_msgSend(v30, "setForce:", v5);
    -[BKPaginationController addPrepareJob:](self, "addPrepareJob:", v30);

  }
  else
  {
    v24 = _AEPaginationLog();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Aborting pagination because no style was provided.", (uint8_t *)&v36, 2u);
    }
  }

}

- (void)_releaseData:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *paginationInfo;
  NSArray *chapterInfo;
  NSArray *physicalPagesInfo;
  NSString *lookupKey;

  v3 = a3;
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = 0;

  chapterInfo = self->_chapterInfo;
  self->_chapterInfo = 0;

  physicalPagesInfo = self->_physicalPagesInfo;
  self->_physicalPagesInfo = 0;

  -[BKPaginationController setBookmarkPageCounts:](self, "setBookmarkPageCounts:", 0);
  self->_pageTotal = 0x7FFFFFFFFFFFFFFFLL;
  lookupKey = self->_lookupKey;
  self->_lookupKey = 0;

  self->_paginationBatchSize = 0;
  self->_paginationBatchProgress = 0;
  if (v3)
    -[BKPaginationController abortCurrentBatch](self, "abortCurrentBatch");
}

- (void)releasePaginationInfo
{
  -[BKPaginationController _releaseData:](self, "_releaseData:", 1);
}

- (void)pause
{
  int64_t *p_pauseCount;
  unint64_t v3;

  p_pauseCount = &self->_pauseCount;
  do
    v3 = __ldaxr((unint64_t *)p_pauseCount);
  while (__stlxr(v3 + 1, (unint64_t *)p_pauseCount));
  if (!v3)
    -[NSOperationQueue setSuspended:](self->_layoutQueue, "setSuspended:", 1);
}

- (void)resume
{
  int64_t *p_pauseCount;
  unint64_t v3;
  unint64_t v4;

  p_pauseCount = &self->_pauseCount;
  do
  {
    v3 = __ldaxr((unint64_t *)p_pauseCount);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, (unint64_t *)p_pauseCount));
  if (!v4)
    -[NSOperationQueue setSuspended:](self->_layoutQueue, "setSuspended:", 0);
}

- (id)paginationInfoForPageNumber:(int64_t)a3
{
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (a3 >= 1 && (v5 = -[NSArray count](self->_paginationInfo, "count")) != 0)
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_paginationInfo, "objectAtIndex:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pageNumber"));
      v9 = objc_msgSend(v8, "integerValue");

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pageCount"));
      v11 = objc_msgSend(v10, "integerValue");

      if ((uint64_t)v9 <= a3 && (uint64_t)v9 + (uint64_t)v11 > a3)
        break;

      if (v5 == ++v6)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    v7 = 0;
  }
  return v7;
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  void *v4;
  BKPageLocation *v5;
  void *v6;
  id v7;
  void *v8;
  BKPageLocation *v9;

  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v9 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController paginationInfoForPageNumber:](self, "paginationInfoForPageNumber:"));
    if (v4)
    {
      v5 = [BKPageLocation alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentOrdinal"));
      v7 = objc_msgSend(v6, "integerValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pageNumber"));
      v9 = -[BKPageLocation initWithOrdinal:andOffset:](v5, "initWithOrdinal:andOffset:", v7, a3 - (_QWORD)objc_msgSend(v8, "integerValue"));

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (int64_t)pageNumberForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_opt_class(BKPageLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = -[BKPaginationController pagesInDocumentOrdinal:](self, "pagesInDocumentOrdinal:", objc_msgSend(v6, "ordinal"));
    if (v7 <= (unint64_t)objc_msgSend(v6, "pageOffset")
      || (v8 = -[BKPaginationController pageNumberForDocumentOrdinal:](self, "pageNumberForDocumentOrdinal:", objc_msgSend(v6, "ordinal")), (unint64_t)(v8 - 1) > 0x7FFFFFFFFFFFFFFDLL))
    {
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v9 = (int64_t)objc_msgSend(v6, "pageOffset") + v8;
    }

  }
  else
  {
    objc_opt_class(BKAnchorLocation);
    objc_opt_isKindOfClass(v4, v10);
    v9 = -[BKPaginationController pageNumberForDocumentOrdinal:](self, "pageNumberForDocumentOrdinal:", objc_msgSend(v4, "ordinal"));
  }

  return v9;
}

- (unint64_t)chapterIndexForPageNumber:(int64_t)a3
{
  return -[BKPaginationController chapterIndexForPageNumber:getFirstChapter:](self, "chapterIndexForPageNumber:getFirstChapter:", a3, 0);
}

- (unint64_t)chapterIndexForPageNumber:(int64_t)a3 getFirstChapter:(BOOL)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  signed int v11;
  BOOL v12;

  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v7 >= -[NSArray count](self->_chapterInfo, "count"))
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_chapterInfo, "objectAtIndex:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pageNumber"));
    v11 = objc_msgSend(v10, "intValue");

    v12 = v11 == a3 && a4;
    if (v11 > a3)
      break;
    v8 = v7++;
  }
  while (!v12);
  return v8;
}

- (unint64_t)numberOfChapters
{
  return -[NSArray count](self->_chapterInfo, "count");
}

- (unint64_t)physicalPageIndexForPageNumber:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v7 = v6;
    if (v5 >= -[NSArray count](self->_physicalPagesInfo, "count"))
      break;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_physicalPagesInfo, "objectAtIndex:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageNumber"));
    v10 = objc_msgSend(v9, "integerValue");

    v6 = v5++;
  }
  while ((uint64_t)v10 <= a3);
  return v7;
}

- (unint64_t)chapterIndexForHref:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  unsigned __int8 v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_chapterInfo;
    v7 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        v10 = 0;
        v11 = &v7[(_QWORD)v8];
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10), "href", (_QWORD)v16));
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if ((v13 & 1) != 0)
          {

            v14 = (unint64_t)&v10[(_QWORD)v8];
            goto LABEL_14;
          }
          ++v10;
        }
        while (v7 != v10);
        v7 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v8 = v11;
        if (v7)
          continue;
        break;
      }
    }

  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v14;
}

- (id)physicalPageTitlesForPageNumber:(int64_t)a3
{
  NSArray *physicalPagesInfo;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  physicalPagesInfo = self->_physicalPagesInfo;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7B828;
  v14[3] = &unk_1C0890;
  v14[4] = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray indexesOfObjectsWithOptions:passingTest:](physicalPagesInfo, "indexesOfObjectsWithOptions:passingTest:", 3, v14));
  if (objc_msgSend(v6, "count"))
  {
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v7 = -[BKPaginationController physicalPageIndexForPageNumber:](self, "physicalPageIndexForPageNumber:", a3);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7;
    v9 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v8));

    v6 = (void *)v9;
    if (!v9)
      goto LABEL_10;
  }
  v10 = objc_msgSend(v6, "lastIndex");
  if (v10 >= (id)-[NSArray count](self->_physicalPagesInfo, "count"))
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self->_physicalPagesInfo, "objectsAtIndexes:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("name")));

LABEL_11:
  return v12;
}

- (id)chapterForPageNumber:(int64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[BKPaginationController chapterIndexForPageNumber:](self, "chapterIndexForPageNumber:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_chapterInfo, "objectAtIndex:", v4));
  return v5;
}

- (id)titleForChapterAtPageNumber:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController chapterForPageNumber:](self, "chapterForPageNumber:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (id)hrefForChapterAtPageNumber:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController chapterForPageNumber:](self, "chapterForPageNumber:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "href"));

  return v4;
}

- (id)hrefForPageNumber:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController paginationInfoForPageNumber:](self, "paginationInfoForPageNumber:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "href"));

  return v4;
}

- (_NSRange)pageRangeForChapterAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  if (-[NSArray count](self->_chapterInfo, "count") <= a3)
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_chapterInfo, "objectAtIndex:", a3));
    if (a3 + 1 >= -[NSArray count](self->_chapterInfo, "count"))
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      if (-[BKPaginationController pageTotal](self, "pageTotal") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pageNumber"));
        v8 = (uint64_t)objc_msgSend(v11, "integerValue");

        v10 = -[BKPaginationController pageTotal](self, "pageTotal") - v8 + 1;
      }
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_chapterInfo, "objectAtIndex:"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pageNumber"));
      v8 = (uint64_t)objc_msgSend(v7, "integerValue");

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageNumber"));
      v10 = (uint64_t)objc_msgSend(v9, "integerValue") - v8;

    }
  }
  v12 = v8;
  v13 = v10;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)pageRangeForChapter:(id)a3
{
  void *v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "href"));
  v5 = -[BKPaginationController chapterIndexForHref:](self, "chapterIndexForHref:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = (NSUInteger)-[BKPaginationController pageRangeForChapterAtIndex:](self, "pageRangeForChapterAtIndex:", v5);
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)pageRangeForChapterAtPageNumber:(int64_t)a3
{
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v4 = -[BKPaginationController chapterIndexForPageNumber:](self, "chapterIndexForPageNumber:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = (NSUInteger)-[BKPaginationController pageRangeForChapterAtIndex:](self, "pageRangeForChapterAtIndex:", v4);
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (_NSRange)pageRangeForAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotationUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationUuid == %@"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController fetchBookmarkPageCounts](self, "fetchBookmarkPageCounts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v5));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageNumber"));
    v10 = (uint64_t)objc_msgSend(v9, "unsignedIntegerValue");
    v11 = 1;

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v12 = v10;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  NSArray *physicalPagesInfo;
  id v6;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (!-[NSArray count](self->_physicalPagesInfo, "count"))
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
  physicalPagesInfo = self->_physicalPagesInfo;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7BDD8;
  v10[3] = &unk_1C0890;
  v10[4] = a3;
  v6 = -[NSArray indexOfObjectWithOptions:passingTest:](physicalPagesInfo, "indexOfObjectWithOptions:passingTest:", 3, v10);
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_physicalPagesInfo, "objectAtIndex:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  return v9;
}

- (id)pageTitleForAnnotation:(id)a3
{
  id v4;
  void *v5;

  v4 = -[BKPaginationController pageRangeForAnnotation:](self, "pageRangeForAnnotation:", a3);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v4));
  return v5;
}

- (id)pageTitleForChapter:(id)a3
{
  void *v4;
  unint64_t v5;
  NSArray *chapterInfo;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  float v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "href"));
  v5 = -[BKPaginationController chapterIndexForHref:](self, "chapterIndexForHref:", v4);

  chapterInfo = self->_chapterInfo;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](chapterInfo, "objectAtIndex:", v5));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pageNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", objc_msgSend(v20, "integerValue")));

    return v12;
  }
  v7 = -[NSArray count](chapterInfo, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chapters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v11 = objc_msgSend(v10, "count");

  -[BKPaginationController progress](self, "progress");
  v12 = 0;
  if (v13 < 1.0 || v7 == v11)
    return v12;
  v14 = _AEPaginationLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
    v21 = 138543618;
    v22 = v16;
    v23 = 2114;
    v24 = v17;

  }
  return 0;
}

- (id)_lookupKey
{
  BKPaginationFactory *operationFactory;
  void *v4;
  void *v5;
  void *v6;

  operationFactory = self->_operationFactory;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController style](self, "style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory lookupKeyForStyle:geometry:](operationFactory, "lookupKeyForStyle:geometry:", v4, v5));

  return v6;
}

- (int64_t)incrementBatchProgress
{
  BKPaginationController *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_paginationBatchProgress + 1;
  v2->_paginationBatchProgress = v3;
  objc_sync_exit(v2);

  -[BKPaginationController performSelectorOnMainThread:withObject:waitUntilDone:](v2, "performSelectorOnMainThread:withObject:waitUntilDone:", "updateProgress", 0, 0);
  return v3;
}

- (float)progress
{
  BKPaginationController *v2;
  uint64_t paginationBatchSize;
  uint64_t paginationBatchProgress;
  float result;

  v2 = self;
  objc_sync_enter(v2);
  paginationBatchSize = v2->_paginationBatchSize;
  paginationBatchProgress = v2->_paginationBatchProgress;
  objc_sync_exit(v2);

  if (paginationBatchSize < 1)
    return 0.0;
  result = fmaxf((float)paginationBatchProgress / (float)paginationBatchSize, 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (BOOL)workIsStillPending
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController prepareQueue](self, "prepareQueue"));
  if (objc_msgSend(v3, "operationCount"))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController layoutQueue](self, "layoutQueue"));
    if (objc_msgSend(v5, "operationCount"))
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController resultsQueue](self, "resultsQueue"));
      v4 = objc_msgSend(v6, "operationCount") != 0;

    }
  }

  return v4;
}

- (void)updateProgress
{
  -[BKPaginationController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("progress"));
  -[BKPaginationController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("progress"));
}

- (void)updatePaginationCache:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSArray *paginationInfo;
  NSArray *chapterInfo;
  NSArray *physicalPagesInfo;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  NSArray *v25;
  NSArray *v26;
  int v27;
  NSObject *v28;

  v5 = objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext")),
        v8,
        v7,
        v6,
        v8))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKPaginationController _lookupKey](self, "_lookupKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController paginationArrayWithLookupKey:](self, "paginationArrayWithLookupKey:", v9));
    if (!objc_msgSend(v10, "count"))
    {
      v11 = _AEPaginationLog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138543362;
        v28 = v9;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Did not find existing pagination results for LookupKey:%{public}@", (uint8_t *)&v27, 0xCu);
      }

    }
    if (!-[NSArray isEqualToArray:](self->_paginationInfo, "isEqualToArray:", v10) && objc_msgSend(v10, "count"))
    {
      objc_storeStrong((id *)&self->_lookupKey, v9);
      paginationInfo = self->_paginationInfo;
      self->_paginationInfo = 0;

      chapterInfo = self->_chapterInfo;
      self->_chapterInfo = 0;

      physicalPagesInfo = self->_physicalPagesInfo;
      self->_physicalPagesInfo = 0;

      self->_pageTotal = 0x7FFFFFFFFFFFFFFFLL;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
      v17 = objc_msgSend(v16, "linearDocumentCount");

      if ((uint64_t)v17 >= 1)
      {
        self->_paginationBatchSize = (int64_t)v17;
        if (a3)
          v18 = 0;
        else
          v18 = objc_msgSend(v10, "count");
        self->_paginationBatchProgress = (int64_t)v18;
        -[BKPaginationController updateProgress](self, "updateProgress");
      }
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue(-[BKPaginationController chapterArrayWithLookupKey:](self, "chapterArrayWithLookupKey:", v9));
      v23 = self->_chapterInfo;
      self->_chapterInfo = v22;
      v24 = v22;

      objc_storeStrong((id *)&self->_paginationInfo, v10);
      v25 = (NSArray *)objc_claimAutoreleasedReturnValue(-[BKPaginationController physicalPagesArrayWithLookupKey:](self, "physicalPagesArrayWithLookupKey:", v9));
      v26 = self->_physicalPagesInfo;
      self->_physicalPagesInfo = v25;

      -[BKPaginationController postPaginationLoadedNotification](self, "postPaginationLoadedNotification");
    }

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController bookObjectID](self, "bookObjectID"));

    if (!v19)
      return;
    v20 = _AEPaginationLog();
    v9 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_claimAutoreleasedReturnValue(-[BKPaginationController bookObjectID](self, "bookObjectID"));
      v27 = 138412290;
      v28 = v21;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "We have no book. Was it deleted? %@", (uint8_t *)&v27, 0xCu);

    }
  }

}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSDeletedObjectsKey));

  if (objc_msgSend(v6, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "objectID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController bookObjectID](self, "bookObjectID"));
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
          {
            v15 = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v9)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_12:

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", NSInsertedObjectsKey));

  v18 = objc_msgSend(v17, "count");
  if ((v15 & 1) == 0 && v18)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      while (2)
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
          objc_opt_class(BKBookmarkPageCount);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
          {
            LOBYTE(v20) = 1;
            goto LABEL_26;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_26:

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_7C788;
    v25[3] = &unk_1BFD40;
    v26 = (char)v20;
    v25[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);
  }

}

- (id)chapterArrayWithLookupKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lookupKey ==[n] %@"), v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKChapterPageCount"), v7, CFSTR("pageNumber"), 1, 0));

  return v8;
}

- (id)paginationArrayWithLookupKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lookupKey ==[n] %@"), v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKDocumentPageCount"), v7, CFSTR("documentOrdinal"), 1, 0));

  return v8;
}

- (id)physicalPagesArrayWithLookupKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lookupKey ==[n] %@"), v4));
  v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("pageNumber"), 1);
  v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("name"), 1);
  v10 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v8, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortDescriptors:fetchLimit:prefetchRelationships:", CFSTR("BKPhysicalPageCount"), v7, v10, 0, 0));

  return v11;
}

- (id)fetchBookmarkPageCounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController bookmarkPageCounts](self, "bookmarkPageCounts"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController _lookupKey](self, "_lookupKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationController book](self, "book"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lookupKey ==[n] %@"), v4));
    objc_opt_class(BKBookmarkPageCount);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", v10, v7, CFSTR("pageNumber"), 1, 0));
    -[BKPaginationController setBookmarkPageCounts:](self, "setBookmarkPageCounts:", v11);

  }
  return -[BKPaginationController bookmarkPageCounts](self, "bookmarkPageCounts");
}

- (id)resultsQueue
{
  NSOperationQueue *resultsQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  resultsQueue = self->_resultsQueue;
  if (!resultsQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_resultsQueue;
    self->_resultsQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_resultsQueue, "setMaxConcurrentOperationCount:", 1);
    resultsQueue = self->_resultsQueue;
  }
  return resultsQueue;
}

- (id)layoutQueue
{
  NSOperationQueue *layoutQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  layoutQueue = self->_layoutQueue;
  if (!layoutQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_layoutQueue;
    self->_layoutQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_layoutQueue, "setMaxConcurrentOperationCount:", 1);
    layoutQueue = self->_layoutQueue;
  }
  return layoutQueue;
}

- (void)addPrepareJob:(id)a3
{
  -[BKPaginationFactory addPrepareJob:](self->_operationFactory, "addPrepareJob:", a3);
}

- (void)addResultSentinel:(id)a3
{
  -[BKPaginationFactory addResultSentinel:](self->_operationFactory, "addResultSentinel:", a3);
}

- (void)addResultJob:(id)a3
{
  -[BKPaginationFactory addResultJob:](self->_operationFactory, "addResultJob:", a3);
}

- (id)paginationRevision
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)qword_20F560;
  if (!qword_20F560)
  {
    v3 = objc_alloc((Class)NSString);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine appInfoMgr](AEAssetEngine, "appInfoMgr"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osBuildVersion"));
    v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%d"), v5, 14);
    v7 = (void *)qword_20F560;
    qword_20F560 = (uint64_t)v6;

    v2 = (void *)qword_20F560;
  }
  return v2;
}

- (NSManagedObjectID)bookObjectID
{
  return self->_bookObjectID;
}

- (NSString)bookDatabaseKey
{
  return self->_bookDatabaseKey;
}

- (NSString)bookLanguage
{
  return self->_bookLanguage;
}

- (int)bookDirection
{
  return self->_bookDirection;
}

- (void)setBookDirection:(int)a3
{
  self->_bookDirection = a3;
}

- (BOOL)isBookSample
{
  return self->_bookSample;
}

- (ContentStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (unint64_t)jobGeneration
{
  return self->_jobGeneration;
}

- (void)setJobGeneration:(unint64_t)a3
{
  self->_jobGeneration = a3;
}

- (BKNavigationHistory)navigationHistory
{
  return (BKNavigationHistory *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNavigationHistory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)bookmarkPageCounts
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBookmarkPageCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)bookShouldDisableOptimizeSpeed
{
  return self->_bookShouldDisableOptimizeSpeed;
}

- (unint64_t)spineIndexInPackage
{
  return self->_spineIndexInPackage;
}

- (BKPaginationControllerDelegate)delegate
{
  return (BKPaginationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)paginationRetryCount
{
  return self->_paginationRetryCount;
}

- (void)setPaginationRetryCount:(int64_t)a3
{
  self->_paginationRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_navigationHistory, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_primaryMOC, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_physicalPagesInfo, 0);
  objc_storeStrong((id *)&self->_bookmarkPageCounts, 0);
  objc_storeStrong((id *)&self->_chapterInfo, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_lookupKey, 0);
  objc_storeStrong((id *)&self->_bookLanguage, 0);
  objc_storeStrong((id *)&self->_bookDatabaseKey, 0);
  objc_storeStrong((id *)&self->_bookObject, 0);
  objc_storeStrong((id *)&self->_bookObjectID, 0);
}

@end
