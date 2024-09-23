@implementation MTFeedUpdateIdleCoordinator

+ (id)sharedInstance
{
  if (qword_1005672E0 != -1)
    dispatch_once(&qword_1005672E0, &stru_1004A74E0);
  return (id)qword_1005672E8;
}

- (id)_initShared
{
  MTFeedUpdateIdleCoordinator *v2;
  uint64_t v3;
  NSMutableArray *deferredWorkBlocks;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTFeedUpdateIdleCoordinator;
  v2 = -[MTFeedUpdateIdleCoordinator init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    deferredWorkBlocks = v2->_deferredWorkBlocks;
    v2->_deferredWorkBlocks = (NSMutableArray *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_attemptToPerformDeferredWork", CFSTR("MTSyncControllerDidStartRunningNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "_attemptToPerformDeferredWork", CFSTR("MTSyncControllerOperationCompleted"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_attemptToPerformDeferredWork", CFSTR("MTFeedUpdateDidEndUpdatingAllFeeds"), 0);

  }
  return v2;
}

- (void)scheduleFeedUpdateIdleBlock:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v5 = v4;
    if (-[MTFeedUpdateIdleCoordinator _shouldDeferWork](self, "_shouldDeferWork"))
      -[MTFeedUpdateIdleCoordinator _appendDeferredWorkBlock:](self, "_appendDeferredWorkBlock:", v5);
    else
      v5[2]();
    v4 = v5;
  }

}

- (void)_attemptToPerformDeferredWork
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (!-[MTFeedUpdateIdleCoordinator _shouldDeferWork](self, "_shouldDeferWork"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateIdleCoordinator _dequeueAllDeferredWorkBlocks](self, "_dequeueAllDeferredWorkBlocks", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7) + 16))();
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_appendDeferredWorkBlock:(id)a3
{
  MTFeedUpdateIdleCoordinator *v4;
  NSMutableArray *deferredWorkBlocks;
  id v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  deferredWorkBlocks = v4->_deferredWorkBlocks;
  v6 = objc_retainBlock(v7);
  -[NSMutableArray addObject:](deferredWorkBlocks, "addObject:", v6);

  objc_sync_exit(v4);
}

- (id)_dequeueAllDeferredWorkBlocks
{
  MTFeedUpdateIdleCoordinator *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateIdleCoordinator deferredWorkBlocks](v2, "deferredWorkBlocks"));
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateIdleCoordinator deferredWorkBlocks](v2, "deferredWorkBlocks"));
  objc_msgSend(v5, "removeAllObjects");

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)_shouldDeferWork
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  v3 = objc_msgSend(v2, "isRunning");

  if (!v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  v5 = objc_msgSend(v4, "isSyncing");

  if ((v5 & 1) != 0)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](MTFeedUpdateManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "statusManager"));
  v9 = objc_msgSend(v8, "isUpdating");

  return v9;
}

- (NSMutableArray)deferredWorkBlocks
{
  return self->_deferredWorkBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredWorkBlocks, 0);
}

@end
