@implementation FRFlintDataProvider

- (FRFlintDataProvider)initWithANFContent:(id)a3 headline:(id)a4 resourceManager:(id)a5 cloudContext:(id)a6 embedConfigurationManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FRFlintDataProvider *v17;
  FRFlintDataProvider *v18;
  id v19;
  void *v20;
  NUArticleResourceURLTranslator *v21;
  NUArticleResourceURLTranslator *resourceURLTranslator;
  NSOperationQueue *v23;
  NSOperationQueue *operationQueue;
  NSMutableDictionary *v25;
  NSMutableDictionary *resourcesByID;
  NFUnfairLock *v27;
  NFUnfairLock *resourcesLock;
  uint64_t v29;
  NSMutableArray *fontResources;
  uint64_t v31;
  NSMutableArray *fontsToRegister;
  id v34;
  objc_super v35;

  v34 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007F75C();
  v35.receiver = self;
  v35.super_class = (Class)FRFlintDataProvider;
  v17 = -[FRFlintDataProvider init](&v35, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_anfContent, a3);
    objc_storeStrong((id *)&v18->_headline, a4);
    objc_storeStrong((id *)&v18->_resourceManager, a5);
    objc_storeStrong((id *)&v18->_embedConfigurationManager, a7);
    v19 = objc_alloc((Class)NUArticleResourceURLTranslator);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appConfigurationManager"));
    v21 = (NUArticleResourceURLTranslator *)objc_msgSend(v19, "initWithAppConfigurationManager:", v20);
    resourceURLTranslator = v18->_resourceURLTranslator;
    v18->_resourceURLTranslator = v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v23;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v18->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    -[NSOperationQueue setQualityOfService:](v18->_operationQueue, "setQualityOfService:", 17);
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourcesByID = v18->_resourcesByID;
    v18->_resourcesByID = v25;

    v27 = (NFUnfairLock *)objc_msgSend(objc_alloc((Class)NFUnfairLock), "initWithOptions:", 1);
    resourcesLock = v18->_resourcesLock;
    v18->_resourcesLock = v27;

    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    fontResources = v18->_fontResources;
    v18->_fontResources = (NSMutableArray *)v29;

    v31 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    fontsToRegister = v18->_fontsToRegister;
    v18->_fontsToRegister = (NSMutableArray *)v31;

    objc_storeStrong((id *)&v18->_cloudContext, a6);
    -[FRFlintDataProvider initializeLoadingGroup](v18, "initializeLoadingGroup");
  }

  return v18;
}

- (void)initializeLoadingGroup
{
  id v3;
  id v4;
  id v5;
  id v6;
  FRFlintDataLoadingGroup *v7;
  FRFlintDataLoadingGroup *loadingGroup;
  id v9;

  v9 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadJSONWithCompletionBlock:");
  v3 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadFontsWithCompletionBlock:");
  v4 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadAssetURLsWithCompletionBlock:");
  v5 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadAssetsWithCompletionBlock:");
  v6 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadLinkedContentWithCompletionBlock:");
  v7 = -[FRFlintDataLoadingGroup initWithLoadJSONOnce:loadFontsOnce:loadAssetURLsOnce:loadAssetsOnce:loadLinkedContentOnce:]([FRFlintDataLoadingGroup alloc], "initWithLoadJSONOnce:loadFontsOnce:loadAssetURLsOnce:loadAssetsOnce:loadLinkedContentOnce:", v9, v3, v4, v5, v6);
  loadingGroup = self->_loadingGroup;
  self->_loadingGroup = v7;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourcesLock](self, "resourcesLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider fontResources](self, "fontResources"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourcesLock](self, "resourcesLock"));
  objc_msgSend(v6, "unlock");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(FCResource, v9);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileURL"));
          +[FRFont unregisterFontWithURL:](FRFont, "unregisterFontWithURL:", v15);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v16.receiver = self;
  v16.super_class = (Class)FRFlintDataProvider;
  -[FRFlintDataProvider dealloc](&v16, "dealloc");
}

- (id)loadContextWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[5];
  NSObject *v27;
  _QWORD v28[5];
  NSObject *v29;
  _QWORD v30[4];
  NSObject *v31;
  uint8_t buf[4];
  FRFlintDataProvider *v33;
  __int16 v34;
  void *v35;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000512C8;
  v30[3] = &unk_1000D9758;
  v7 = v6;
  v31 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadJSONWithCompletionBlock:](self, "loadJSONWithCompletionBlock:", v30));
  dispatch_group_enter(v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000512D0;
  v28[3] = &unk_1000D97A8;
  v28[4] = self;
  v9 = v7;
  v29 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadFontsWithCompletionBlock:](self, "loadFontsWithCompletionBlock:", v28));
  dispatch_group_enter(v9);
  v11 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider embedConfigurationManager](self, "embedConfigurationManager"));
    *(_DWORD *)buf = 134218240;
    v33 = self;
    v34 = 2048;
    v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%p will fetch embed configuration from manager=%p", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider embedConfigurationManager](self, "embedConfigurationManager"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100051568;
  v26[3] = &unk_1000DCAE0;
  v26[4] = self;
  v15 = v9;
  v27 = v15;
  objc_msgSend(v14, "fetchEmbedConfigurationWithCompletion:", v26);

  dispatch_group_enter(v15);
  v16 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%p will fetch linked content", buf, 0xCu);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100051614;
  v24[3] = &unk_1000D97A8;
  v24[4] = self;
  v17 = v15;
  v25 = v17;
  v18 = -[FRFlintDataProvider loadLinkedContentWithCompletionBlock:](self, "loadLinkedContentWithCompletionBlock:", v24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000516C0;
  block[3] = &unk_1000D9D18;
  block[4] = self;
  v23 = v4;
  v19 = v4;
  dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, block);
  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  if (v10)
    objc_msgSend(v5, "addObject:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FCGroupCancelHandler groupCancelHandlerWithCancelHandlers:](FCGroupCancelHandler, "groupCancelHandlerWithCancelHandlers:", v5));

  return v20;
}

- (id)loadJSONWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadJSONOnce"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeWithCompletionHandler:", v4));

  return v7;
}

- (id)loadFontsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadFontsOnce"));
  v7 = FCDispatchQueueForQualityOfService(25);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeWithCallbackQueue:completionHandler:", v8, v4));

  return v9;
}

- (id)loadAssetURLsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadJSONOnce"));
  v7 = objc_msgSend(v6, "finishedExecuting");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadAssetURLsOnce"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeWithCompletionHandler:", v4));

  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    v9 = 0;
  }

  return v9;
}

- (id)loadAssetsWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100018634;
  v16[4] = sub_10001853C;
  v17 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_100051A58;
  v12[3] = &unk_1000DCB08;
  v12[1] = 3221225472;
  objc_copyWeak(&v15, &location);
  v5 = v4;
  v13 = v5;
  v14 = v16;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100051AE8;
  v9[3] = &unk_1000DB3E0;
  v11 = v16;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadAssetURLsWithCompletionBlock:](self, "loadAssetURLsWithCompletionBlock:", v12));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FCCancelHandler cancelHandlerWithBlock:](FCCancelHandler, "cancelHandlerWithBlock:", v9));

  objc_destroyWeak(&v15);
  _Block_object_dispose(v16, 8);

  objc_destroyWeak(&location);
  return v7;
}

- (id)loadLinkedContentWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadLinkedContentOnce"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeWithCompletionHandler:", v4));

  return v7;
}

- (void)resetFailedDownloads
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;
  FRFlintDataLoadingGroup *v36;
  unsigned int v37;
  uint8_t buf[4];
  FRFlintDataProvider *v39;
  __int16 v40;
  void *v41;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadJSONOnce"));
  v5 = objc_msgSend(v4, "finishedExecutingWithFailure");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadFontsOnce"));
  v7 = objc_msgSend(v6, "finishedExecutingWithFailure");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadAssetURLsOnce"));
  v9 = objc_msgSend(v8, "finishedExecutingWithFailure");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadAssetsOnce"));
  v11 = objc_msgSend(v10, "finishedExecutingWithFailure");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadLinkedContentOnce"));
  v13 = objc_msgSend(v12, "finishedExecutingWithFailure");

  if ((v5 & 1) == 0 && (v7 & 1) == 0 && (v9 & 1) == 0 && !v11)
    goto LABEL_17;
  v37 = v13;
  v14 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider anfContent](self, "anfContent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "anfDocumentAssetHandles"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteURL"));
    *(_DWORD *)buf = 134218242;
    v39 = self;
    v40 = 2112;
    v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%p retrying failed downloads for Flint article with JSON URL %@", buf, 0x16u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadJSONOnce"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadFontsOnce"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadAssetURLsOnce"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadAssetsOnce"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadLinkedContentOnce"));
  if (v5)
  {
    v25 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadJSONWithCompletionBlock:");
    v26 = v20;
    v27 = v9;
    v28 = v23;
    v29 = v25;

    -[FRFlintDataProvider setError:](self, "setError:", 0);
    v30 = v29;
    v23 = v28;
    v9 = v27;
    v20 = v30;
    if (!v7)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v7)
  {
LABEL_11:
    v31 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadFontsWithCompletionBlock:");

    v21 = v31;
  }
LABEL_12:
  if (v37)
  {
    v32 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadLinkedContentWithCompletionBlock:");

    v24 = v32;
  }
  if ((v5 | v9) == 1)
  {
    v33 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadAssetURLsWithCompletionBlock:");

    v22 = v33;
  }
  v34 = objc_msgSend(objc_alloc((Class)FCAsyncOnceOperation), "initWithTarget:selector:", self, "_loadAssetsWithCompletionBlock:");

  v35 = -[FRFlintDataProvider relativePriority](self, "relativePriority");
  objc_msgSend(v20, "setRelativePriority:", v35);
  objc_msgSend(v21, "setRelativePriority:", v35);
  objc_msgSend(v22, "setRelativePriority:", v35);
  objc_msgSend(v34, "setRelativePriority:", v35);
  objc_msgSend(v24, "setRelativePriority:", v35);
  v36 = -[FRFlintDataLoadingGroup initWithLoadJSONOnce:loadFontsOnce:loadAssetURLsOnce:loadAssetsOnce:loadLinkedContentOnce:]([FRFlintDataLoadingGroup alloc], "initWithLoadJSONOnce:loadFontsOnce:loadAssetURLsOnce:loadAssetsOnce:loadLinkedContentOnce:", v20, v21, v22, v34, v24);
  -[FRFlintDataProvider setLoadingGroup:](self, "setLoadingGroup:", v36);

LABEL_17:
}

- (void)setCurrentRelativePriority:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  +[NSThread isMainThread](NSThread, "isMainThread");
  -[FRFlintDataProvider setRelativePriority:](self, "setRelativePriority:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadJSONOnce"));
  objc_msgSend(v6, "setRelativePriority:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loadFontsOnce"));
  objc_msgSend(v8, "setRelativePriority:", a3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "loadAssetURLsOnce"));
  objc_msgSend(v10, "setRelativePriority:", a3);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadAssetsOnce"));
  objc_msgSend(v12, "setRelativePriority:", a3);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider loadingGroup](self, "loadingGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "loadLinkedContentOnce"));
  objc_msgSend(v13, "setRelativePriority:", a3);

}

- (id)_loadJSONWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  FRFlintDataProvider *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    if (-[FRFlintDataProvider isDocumentLocallyAvailable](self, "isDocumentLocallyAvailable"))
      v7 = CFSTR("load cached");
    else
      v7 = CFSTR("download");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider anfContent](self, "anfContent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anfDocumentAssetHandles"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueKey"));
    *(_DWORD *)buf = 134218498;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%p will %{public}@ JSON %{public}@", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider anfContent](self, "anfContent"));
  v13 = -[FRFlintDataProvider relativePriority](self, "relativePriority");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100052240;
  v17[3] = &unk_1000DCB58;
  v17[4] = self;
  v18 = v4;
  v14 = v4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fetchANFDocumentDataProviderWithPriority:completion:", v13, v17));

  return v15;
}

- (id)_loadFontsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  FRFlintDataProvider *v24;
  __int16 v25;
  const __CFString *v26;

  v4 = a3;
  v5 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = -[FRFlintDataProvider areFontsLocallyAvailable](self, "areFontsLocallyAvailable");
    v8 = CFSTR("download");
    if (v7)
      v8 = CFSTR("load cached");
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2114;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%p will %{public}@ fonts", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider anfContent](self, "anfContent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontResourceIDs"));

  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourceManager](self, "resourceManager"));
    v12 = -[FRFlintDataProvider relativePriority](self, "relativePriority");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000528E0;
    v20[3] = &unk_1000DCBE8;
    v20[4] = self;
    v21 = v10;
    v22 = v4;
    v13 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fetchFontResourcesWithIdentifiers:downloadAssets:relativePriority:completionBlock:", v21, 1, v12, v20));

  }
  else
  {
    v15 = FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%p requires no fonts", buf, 0xCu);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100052BD8;
    v18[3] = &unk_1000DAF28;
    v19 = v4;
    v16 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

    v14 = 0;
  }

  return v14;
}

- (id)_loadAssetURLsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  FRFlintDataProvider *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider context](self, "context"));

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007F924();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider context](self, "context"));

  v7 = FRArticleLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%p will load asset URLs", buf, 0xCu);
    }
    v8 = (id)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourceManager](self, "resourceManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider requiredResourceIDs](self, "requiredResourceIDs"));
    v10 = -[FRFlintDataProvider relativePriority](self, "relativePriority");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100052E00;
    v16[3] = &unk_1000DCC10;
    v16[4] = self;
    v17 = v4;
    v11 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchResourcesWithIdentifiers:downloadAssets:relativePriority:callBackQueue:completionBlock:", v9, 0, v10, &_dispatch_main_q, v16));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR))
      sub_10007F8B0((uint64_t)self, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100053038;
    block[3] = &unk_1000DAF28;
    v15 = v4;
    v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v12 = 0;
    v9 = v15;
  }

  return v12;
}

- (id)_loadAssetsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  FRFlintDataProvider *v28;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100018634;
  v25 = sub_10001853C;
  v26 = 0;
  v5 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p will download assets", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourcesLock](self, "resourcesLock"));
  objc_msgSend(v6, "lock");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourcesByID](self, "resourcesByID"));
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v22[5];
  v22[5] = (uint64_t)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourcesLock](self, "resourcesLock"));
  objc_msgSend(v10, "unlock");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "allValues"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", &stru_1000DCC30));

  v13 = objc_msgSend(objc_alloc((Class)FCAssetsFetchOperation), "initWithAssetHandles:", v12);
  objc_msgSend(v13, "setPurpose:", FCOperationPurposeArticle);
  objc_msgSend(v13, "setQualityOfService:", 25);
  objc_msgSend(v13, "setRelativePriority:", -[FRFlintDataProvider relativePriority](self, "relativePriority"));
  v14 = &_dispatch_main_q;
  objc_msgSend(v13, "setFetchCompletionQueue:", &_dispatch_main_q);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000532E4;
  v18[3] = &unk_1000DCC78;
  v20 = &v21;
  v18[4] = self;
  v15 = v4;
  v19 = v15;
  objc_msgSend(v13, "setFetchCompletionBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue"));
  objc_msgSend(v16, "addOperation:", v13);

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)_loadLinkedContentWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id location;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider headline](self, "headline"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "linkedArticleIDs"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = objc_alloc((Class)FCArticleHeadlinesFetchOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider cloudContext](self, "cloudContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider headline](self, "headline"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "linkedArticleIDs"));
    v12 = objc_msgSend(v8, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v9, v11, 0);

    objc_msgSend(v12, "setQualityOfService:", 17);
    objc_msgSend(v12, "setRelativePriority:", 1);
    objc_msgSend(v12, "setFetchCompletionQueue:", &_dispatch_main_q);
    objc_initWeak(&location, self);
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_1000537B0;
    v19 = &unk_1000DCCC8;
    objc_copyWeak(&v21, &location);
    v20 = v4;
    objc_msgSend(v12, "setFetchCompletionBlock:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue", v16, v17, v18, v19));
    objc_msgSend(v13, "addOperation:", v12);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100053730;
    v23[3] = &unk_1000DCCA0;
    v24 = v4;
    v14 = sub_100053730((uint64_t)v23);
    v12 = (id)objc_claimAutoreleasedReturnValue(v14);

  }
  return v12;
}

- (id)_resourceIDFromResourceURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("asset")))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  else
    v5 = 0;

  return v5;
}

- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  FRFlintDataProvider *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider _resourceIDFromResourceURL:](self, "_resourceIDFromResourceURL:", v8));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053B08;
  v16[3] = &unk_1000DCD18;
  objc_copyWeak(&v21, &location);
  v12 = v10;
  v19 = v12;
  v13 = v11;
  v17 = v13;
  v18 = self;
  v14 = v9;
  v20 = v14;
  v15 = -[FRFlintDataProvider loadAssetURLsWithCompletionBlock:](self, "loadAssetURLsWithCompletionBlock:", v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (id)translateURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourceURLTranslator](self, "resourceURLTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "translateFileURLForURL:", v4));

  return v6;
}

- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4
{
  void *v4;
  id v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v44;
  void *v45;
  _QWORD *v46;
  unsigned __int8 v47;
  void *v48;
  NSObject *group;
  _QWORD block[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  FRFlintDataProvider *v55;
  id v56;
  id v57;
  NSObject *v58;
  uint64_t *v59;
  _QWORD *v60;
  id v61;
  BOOL v62;
  char v63;
  id location;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  NSObject *v69;
  uint64_t *v70;
  uint64_t v71;
  double v72;
  double v73;
  _QWORD v74[4];
  id v75;
  _QWORD *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  _QWORD v82[5];
  id v83;

  v7 = a3;
  v8 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007F9F8();
  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  group = dispatch_group_create();
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = sub_100018634;
  v82[4] = sub_10001853C;
  v83 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000543DC;
  v74[3] = &unk_1000DCD40;
  v76 = v82;
  v77 = &v78;
  v44 = v8;
  v75 = v44;
  v46 = objc_retainBlock(v74);
  v47 = objc_msgSend(v7, "qualities");
  if ((objc_msgSend(v7, "qualities") & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider thumbnailImage](self, "thumbnailImage", v44));
    if (v11
      || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider thumbnailAssetHandle](self, "thumbnailAssetHandle"))) != 0)
    {
      v10 = -[FRFlintDataProvider shouldReturnThumbnail](self, "shouldReturnThumbnail");
      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageIdentifier", v44));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider context](self, "context"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "documentController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "thumbnailImageIdentifier"));
  v17 = objc_msgSend(v12, "isEqualToString:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider _resourceIDFromResourceURL:](self, "_resourceIDFromResourceURL:", v18));

  v48 = (void *)v9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourcesByID](self, "resourcesByID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v19));

  v22 = objc_msgSend(v21, "isOnDisk");
  if ((v10 & v17 | v22) == 1 && !*((_BYTE *)v79 + 24))
  {
    objc_msgSend(v7, "size");
    v24 = v23;
    v26 = v25;
    if (v22)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fileURL"));
      v28 = 4;
    }
    else
    {
      v27 = 0;
      v28 = 2;
    }
    v29 = +[FRAnimationHelpers synchronousImageLoadingEnabled](FRAnimationHelpers, "synchronousImageLoadingEnabled");
    dispatch_group_enter(group);
    if (v29)
    {
      if (!*((_BYTE *)v79 + 24))
      {
        if ((v28 & 2) != 0)
        {
          v30 = objc_alloc_init((Class)SXImageResourceResponse);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider thumbnailImage](self, "thumbnailImage"));
          objc_msgSend(v30, "setImage:", v32);

          objc_msgSend(v30, "setImageQuality:", v28);
        }
        else
        {
          v30 = (id)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:](self, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", v27, objc_msgSend(v7, "preserveColorspace"), v28, v24, v26));
        }
        if (v30)
          objc_msgSend(v48, "addObject:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loadingBlock"));

        if (v33)
        {
          v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loadingBlock"));
          ((void (**)(_QWORD, id))v34)[2](v34, v30);

        }
      }
      dispatch_group_leave(group);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider operationQueue](self, "operationQueue"));
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100054438;
      v65[3] = &unk_1000DCD68;
      v70 = &v78;
      v71 = v28;
      v65[4] = self;
      v66 = v27;
      v67 = v7;
      v72 = v24;
      v73 = v26;
      v68 = v48;
      v69 = group;
      objc_msgSend(v31, "addOperationWithBlock:", v65);

    }
  }
  dispatch_group_enter(group);
  objc_initWeak(&location, self);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100054658;
  v53[3] = &unk_1000DCE08;
  objc_copyWeak(&v61, &location);
  v62 = (v47 & 4) != 0;
  v63 = v22;
  v35 = v19;
  v59 = &v78;
  v60 = v82;
  v54 = v35;
  v55 = self;
  v36 = v7;
  v56 = v36;
  v37 = v48;
  v57 = v37;
  v38 = group;
  v58 = v38;
  v39 = -[FRFlintDataProvider loadAssetURLsWithCompletionBlock:](self, "loadAssetURLsWithCompletionBlock:", v53);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054B3C;
  block[3] = &unk_1000D9D18;
  v40 = v45;
  v52 = v40;
  v41 = v37;
  v51 = v41;
  dispatch_group_notify(v38, (dispatch_queue_t)&_dispatch_main_q, block);
  v42 = objc_msgSend(v46, "copy");

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(v82, 8);

  return v42;
}

- (id)imageResourceResponseForFileURL:(id)a3 perserveColorSpace:(BOOL)a4 withSize:(CGSize)a5 andQuality:(unint64_t)a6
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SXImageDecodingTools sharedInstance](SXImageDecodingTools, "sharedInstance"));
  v12 = objc_msgSend(v11, "dataIsAnimatedImage:", v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SXImageDecodingTools sharedInstance](SXImageDecodingTools, "sharedInstance"));
  v14 = v13;
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loadAnimatedImageFromImageData:size:", v10, width, height));

    v16 = objc_alloc_init((Class)SXAnimatedImageResourceResponse);
    objc_msgSend(v16, "setAnimatedImage:", v15);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageFromData:size:", v10, width, height));

    v16 = objc_alloc_init((Class)SXImageResourceResponse);
    objc_msgSend(v16, "setImage:", v15);
  }
  objc_msgSend(v16, "setFileURL:", v9);

  objc_msgSend(v16, "setImageQuality:", a6);
  return v16;
}

- (id)fallbackResourceForImageRequest:(id)a3 originalResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider cloudContext](self, "cloudContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "networkReachability"));
  v10 = objc_msgSend(v9, "isNetworkReachable");

  if (v10)
  {
    v11 = v7;
    v12 = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider context](self, "context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "documentController"));
    v25 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageIdentifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allResourcesForImageIdentifier:", v15));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reverseObjectEnumerator"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v20), "URL"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider _resourceIDFromResourceURL:](self, "_resourceIDFromResourceURL:", v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourceManager](self, "resourceManager"));
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cachedResourceWithIdentifier:", v22));

          if (v12 && (objc_msgSend(v12, "isOnDisk") & 1) != 0)
          {

            goto LABEL_14;
          }

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
          continue;
        break;
      }
    }

    v12 = v7;
LABEL_14:
    v6 = v25;
  }

  return v12;
}

- (BOOL)isDocumentLocallyAvailable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider anfContent](self, "anfContent"));
  v3 = objc_msgSend(v2, "isANFDocumentCached");

  return v3;
}

- (BOOL)areFontsLocallyAvailable
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider anfContent](self, "anfContent"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontResourceIDs"));
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider resourceManager](self, "resourceManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cachedResourcesWithIdentifiers:", v7));

  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v7, "count");

  if (v10 == v11)
    v12 = objc_msgSend(v9, "fc_allObjectsPassTest:", &stru_1000DCE48);
  else
    v12 = 0;

  return v12;
}

- (BOOL)isThumbnailAvailableInDocument
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "documentController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentIdentifierUsingThumbnail"));
  v5 = v4 != 0;

  return v5;
}

- (id)headlineForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider headline](self, "headline"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "articleID"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider headline](self, "headline"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProvider linkedHeadlines](self, "linkedHeadlines"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));

  }
  return v8;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (FCAssetHandle)thumbnailAssetHandle
{
  return self->_thumbnailAssetHandle;
}

- (void)setThumbnailAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailAssetHandle, a3);
}

- (BOOL)shouldReturnThumbnail
{
  return self->_shouldReturnThumbnail;
}

- (void)setShouldReturnThumbnail:(BOOL)a3
{
  self->_shouldReturnThumbnail = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSArray)requiredResourceIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequiredResourceIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NFUnfairLock)resourcesLock
{
  return self->_resourcesLock;
}

- (NSMutableDictionary)resourcesByID
{
  return self->_resourcesByID;
}

- (SXContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NUArticleResourceURLTranslator)resourceURLTranslator
{
  return self->_resourceURLTranslator;
}

- (NSMutableArray)fontsToRegister
{
  return self->_fontsToRegister;
}

- (NSMutableArray)fontResources
{
  return self->_fontResources;
}

- (FRFlintDataLoadingGroup)loadingGroup
{
  return (FRFlintDataLoadingGroup *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLoadingGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
}

- (NSMutableDictionary)linkedHeadlines
{
  return self->_linkedHeadlines;
}

- (void)setLinkedHeadlines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (FRFlintEmbedConfigurationManager)embedConfigurationManager
{
  return self->_embedConfigurationManager;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_embedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_linkedHeadlines, 0);
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_storeStrong((id *)&self->_fontResources, 0);
  objc_storeStrong((id *)&self->_fontsToRegister, 0);
  objc_storeStrong((id *)&self->_resourceURLTranslator, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourcesByID, 0);
  objc_storeStrong((id *)&self->_resourcesLock, 0);
  objc_storeStrong((id *)&self->_requiredResourceIDs, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailAssetHandle, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_anfContent, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
