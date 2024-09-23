@implementation FRArticlePrefetchManager

- (void)_revisitSuspendedState
{
  void *v3;
  id v4;

  if (-[FRArticlePrefetchManager suspendedDepth](self, "suspendedDepth") < 1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager context](self, "context"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "networkReachability"));
    -[FCKeyedOperationQueue setSuspended:](self->_prefetchQueue, "setSuspended:", FRShouldPrefetchIgnoringNetworkInterface(v3) ^ 1);

  }
  else
  {
    -[FCKeyedOperationQueue setSuspended:](self->_prefetchQueue, "setSuspended:", 1);
  }
}

- (FRArticlePrefetchManager)initWithCloudContext:(id)a3 articleContentPool:(id)a4
{
  id v7;
  id v8;
  FRArticlePrefetchManager *v9;
  FRArticlePrefetchManager *v10;
  FCKeyedOperationQueue *v11;
  FCKeyedOperationQueue *prefetchQueue;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *prefetchRequestsByID;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)FRArticlePrefetchManager;
  v9 = -[FRArticlePrefetchManager init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_articleContentPool, a4);
    v11 = (FCKeyedOperationQueue *)objc_msgSend(objc_alloc((Class)FCKeyedOperationQueue), "initWithDelegate:maxConcurrentOperationCount:", v10, 1);
    prefetchQueue = v10->_prefetchQueue;
    v10->_prefetchQueue = v11;

    v13 = FCDispatchQueueForQualityOfService(9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[FCKeyedOperationQueue setExecutionQueue:](v10->_prefetchQueue, "setExecutionQueue:", v14);

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    prefetchRequestsByID = v10->_prefetchRequestsByID;
    v10->_prefetchRequestsByID = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, "_prefetchRequestsChanged", CFSTR("FRArticlePrefetchRequestsDidChangeNotification"), v10);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager context](v10, "context"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "networkReachability"));
    objc_msgSend(v19, "addObserver:", v10);

    -[FRArticlePrefetchManager _revisitSuspendedState](v10, "_revisitSuspendedState");
  }

  return v10;
}

- (int64_t)suspendedDepth
{
  return self->_suspendedDepth;
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FRArticlePrefetchManager;
  -[FRArticlePrefetchManager dealloc](&v4, "dealloc");
}

- (void)addPrefetchInterestInHeadline:(id)a3 priority:(unint64_t)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FRArticlePrefetchRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;

  v8 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100083298();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "articleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  if (!v11)
  {
    v12 = (void *)FRArticlePrefetchLog;
    if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "articleID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      v23 = 138412546;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "prefetch interest added to article %@, '%{public}@'", (uint8_t *)&v23, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager articleContentPool](self, "articleContentPool"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "articleID"));
    objc_msgSend(v16, "addInterestInArticleWithID:", v17);

    v18 = objc_alloc_init(FRArticlePrefetchRequest);
    -[FRArticlePrefetchRequest setHeadline:](v18, "setHeadline:", v8);
    -[FRArticlePrefetchRequest setPriority:](v18, "setPriority:", a4);
    -[FRArticlePrefetchRequest setOptions:](v18, "setOptions:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "articleID"));
    objc_msgSend(v19, "setObject:forKey:", v18, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:](NSNotification, "notificationWithName:object:", CFSTR("FRArticlePrefetchRequestsDidChangeNotification"), self));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationQueue defaultQueue](NSNotificationQueue, "defaultQueue"));
    objc_msgSend(v22, "enqueueNotification:postingStyle:", v21, 1);

  }
}

- (void)removePrefetchInterestInHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100083354();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  if (v7)
  {
    v8 = (void *)FRArticlePrefetchLog;
    if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
      v18 = 138412546;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "prefetch interest removed from article %@, '%{public}@'", (uint8_t *)&v18, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager articleContentPool](self, "articleContentPool"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
    objc_msgSend(v12, "removeInterestInArticleWithID:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
    objc_msgSend(v14, "removeObjectForKey:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:](NSNotification, "notificationWithName:object:", CFSTR("FRArticlePrefetchRequestsDidChangeNotification"), self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationQueue defaultQueue](NSNotificationQueue, "defaultQueue"));
    objc_msgSend(v17, "enqueueNotification:postingStyle:", v16, 1);

  }
}

- (void)resetPrefetchStateForArticleID:(id)a3 withHeadline:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v6)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager articleContentPool](self, "articleContentPool"));
      objc_msgSend(v8, "flushContentWithArticleID:", v6);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchQueue](self, "prefetchQueue"));
        objc_msgSend(v11, "setKeyQueue:", 0);

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headline"));
        -[FRArticlePrefetchManager removePrefetchInterestInHeadline:](self, "removePrefetchInterestInHeadline:", v12);

        -[FRArticlePrefetchManager addPrefetchInterestInHeadline:priority:options:](self, "addPrefetchInterestInHeadline:priority:options:", v7, objc_msgSend(v10, "priority"), objc_msgSend(v10, "options"));
      }

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000834CC();
  if (!v7)
  {
LABEL_9:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100083410();
  }
LABEL_11:

}

- (void)pushPrefetchSuspended
{
  +[NSThread isMainThread](NSThread, "isMainThread");
  -[FRArticlePrefetchManager setSuspendedDepth:](self, "setSuspendedDepth:", (char *)-[FRArticlePrefetchManager suspendedDepth](self, "suspendedDepth") + 1);
  -[FRArticlePrefetchManager _revisitSuspendedState](self, "_revisitSuspendedState");
}

- (void)popPrefetchSuspended
{
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!-[FRArticlePrefetchManager suspendedDepth](self, "suspendedDepth")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100083588();
  }
  -[FRArticlePrefetchManager setSuspendedDepth:](self, "setSuspendedDepth:", (char *)-[FRArticlePrefetchManager suspendedDepth](self, "suspendedDepth") - 1);
  -[FRArticlePrefetchManager _revisitSuspendedState](self, "_revisitSuspendedState");
}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v7 = a5;
  v8 = a4;
  v10 = objc_opt_class(FRArticlePrefetchOperation, v9);
  v11 = FCCheckedDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = objc_alloc_init((Class)FCOnce);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager articleContentPool](self, "articleContentPool"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006D9EC;
  v27[3] = &unk_1000D9AA8;
  v15 = v13;
  v28 = v15;
  v16 = v7;
  v29 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeWithArticleContentPool:completionHandler:", v14, v27));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10006DAE8;
  v23[3] = &unk_1000DC8A8;
  v24 = v17;
  v25 = v15;
  v26 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FCCancelHandler cancelHandlerWithBlock:](FCCancelHandler, "cancelHandlerWithBlock:", v23));

  return v21;
}

- (void)_prefetchRequestsChanged
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchRequestsByID](self, "prefetchRequestsByID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headline"));
        v13 = objc_msgSend(v12, "isDeleted");

        if ((v13 & 1) == 0)
          objc_msgSend(v11, "addPrefetchOperationsToOrderedSet:", v3);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortUsingComparator:", &stru_1000DE540);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchManager prefetchQueue](self, "prefetchQueue"));
  objc_msgSend(v14, "setKeyQueue:", v3);

}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FRArticleContentPool)articleContentPool
{
  return self->_articleContentPool;
}

- (void)setArticleContentPool:(id)a3
{
  objc_storeStrong((id *)&self->_articleContentPool, a3);
}

- (FCKeyedOperationQueue)prefetchQueue
{
  return self->_prefetchQueue;
}

- (void)setPrefetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchQueue, a3);
}

- (void)setSuspendedDepth:(int64_t)a3
{
  self->_suspendedDepth = a3;
}

- (NSMutableDictionary)prefetchRequestsByID
{
  return self->_prefetchRequestsByID;
}

- (void)setPrefetchRequestsByID:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchRequestsByID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchRequestsByID, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_articleContentPool, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
