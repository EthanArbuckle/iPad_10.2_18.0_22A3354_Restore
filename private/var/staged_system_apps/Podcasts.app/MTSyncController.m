@implementation MTSyncController

- (void)setIsRunning:(BOOL)a3
{
  MTSyncController *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isRunning = a3;
  objc_sync_exit(obj);

}

- (BOOL)resetToInitialStateIfIncomplete
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("kMTSyncControllerResettingToInitialState")));
  v5 = (void *)v4;
  v6 = &__kCFBooleanFalse;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = objc_msgSend(v7, "BOOLValue");
  if (!v8)
    return 0;
  v10 = _MTLogCategoryCloudSync(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reset to initial state was incomplete. Will retry.", v13, 2u);
  }

  return -[MTSyncController resetToInitialStateForced:](self, "resetToInitialStateForced:", 1);
}

- (BOOL)hasPlaylistSyncVersion
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController playlistSyncVersion](self, "playlistSyncVersion"));
  v3 = v2 != 0;

  return v3;
}

- (NSString)playlistSyncVersion
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "playlistSyncVersion");
}

- (MTSyncController)init
{
  MTSyncController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *syncQueue;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  uint64_t v7;
  NSMutableArray *episodeObservers;
  _TtC8Podcasts20CloudSyncBugReporter *v9;
  _TtP8Podcasts21CloudSyncBugReporting_ *cloudSyncBugReporter;
  MTKeyProcessorPairProvider *v11;
  MTKeyProcessorPairProvider *keyProcessorPairProvider;
  void *v13;
  void *v14;
  MTEpisodeSyncStorage *v15;
  MTEpisodeSyncStorage *episodeSyncStorage;
  unint64_t v17;
  id v18;
  MTSyncController *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MTSyncController;
  v2 = -[MTSyncController init](&v21, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("MTSyncController.syncQueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableArray *)v7;

    v9 = objc_alloc_init(_TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v2->_cloudSyncBugReporter;
    v2->_cloudSyncBugReporter = (_TtP8Podcasts21CloudSyncBugReporting_ *)v9;

    v11 = -[MTKeyProcessorPairProvider initWithCloudSyncBugReporter:]([MTKeyProcessorPairProvider alloc], "initWithCloudSyncBugReporter:", v2->_cloudSyncBugReporter);
    keyProcessorPairProvider = v2->_keyProcessorPairProvider;
    v2->_keyProcessorPairProvider = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    v2->_lastOperation = 0.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, "operationFinished:", CFSTR("MTTimedOperationFinished"), 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, "syncCoreKeysIfDirty", CFSTR("MTFeedUpdateDidEndUpdatingAllFeeds"), 0);

    v15 = objc_opt_new(MTEpisodeSyncStorage);
    episodeSyncStorage = v2->_episodeSyncStorage;
    v2->_episodeSyncStorage = v15;

    v17 = (unint64_t)objc_msgSend((id)objc_opt_class(v2), "syncFlagsForSyncType:", 0);
    v2->_syncVersionFlags = (unint64_t)objc_msgSend((id)objc_opt_class(v2), "syncFlagsForSyncType:", 1) | v17;
    v18 = +[MTAppShortcutManager sharedInstance](MTAppShortcutManager, "sharedInstance");
    -[MTSyncController resetToInitialStateIfIncomplete](v2, "resetToInitialStateIfIncomplete");
    v19 = v2;
  }

  return v2;
}

- (void)start
{
  void *v3;
  OS_dispatch_queue *v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  OS_dispatch_queue *v18;
  MTSyncController *v19;
  uint8_t buf[16];

  if (!sub_10004857C())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    v4 = self->_syncQueue;
    v5 = -[MTSyncController isRunning](self, "isRunning");
    if (v5)
    {
      v6 = _MTLogCategoryCloudSync(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "MTSyncController start called, but the controller is already running.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
      objc_msgSend(v9, "addObserver:", self);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
      v11 = objc_msgSend(v10, "isReachable");

      v13 = _MTLogCategoryCloudSync(v12);
      v7 = objc_claimAutoreleasedReturnValue(v13);
      v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) != 0)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MTSyncController start is requesting bag keys", buf, 2u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForKey:", kMTSyncGetAll));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000143B0;
        v16[3] = &unk_1004AA1F0;
        v17 = v3;
        v18 = v4;
        v19 = self;
        objc_msgSend(v15, "asyncValueOnQueue:withCompletion:", v18, v16);

        v7 = v17;
        goto LABEL_12;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        v8 = "Cannot start sync controller - Network is not reachable";
        goto LABEL_11;
      }
    }
LABEL_12:

  }
}

- (MZKeyValueStoreController)cloudSyncController
{
  return self->_cloudSyncController;
}

- (MZUniversalPlaybackPositionStore)UPPStore
{
  return self->_UPPStore;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004FA8;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_1005674B8 != -1)
    dispatch_once(&qword_1005674B8, block);
  return (id)qword_1005674B0;
}

- (void)syncEverything
{
  -[MTSyncController syncAllBookkeeperKeys](self, "syncAllBookkeeperKeys");
  -[MTSyncController performUniversalPlaybackPositionSync](self, "performUniversalPlaybackPositionSync");
}

- (void)syncAllBookkeeperKeys
{
  void *v3;
  id v4;

  if (-[MTSyncController canScheduleSyncRequest](self, "canScheduleSyncRequest"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController keyProcessorPairProvider](self, "keyProcessorPairProvider"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysAndProcessorsForAllBookkeeperKeys"));

    -[MTSyncController syncMultipleKeysAndProcessors:shouldSyncCleanKeys:](self, "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:", v4, 1);
  }
  else
  {
    -[MTSyncController resetToInitialStateForced:](self, "resetToInitialStateForced:", 0);
  }
}

- (void)performUniversalPlaybackPositionSync
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  _QWORD v15[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = -[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP");
  if (!v3)
  {
    v8 = _MTLogCategoryCloudSync(v3);
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Cannot sync library and UPP. Skipping UPP sync.";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  v4 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
  if ((_DWORD)v4)
  {
    v5 = _MTLogCategoryCloudSync(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Not doing UPP Sync on HomePod.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D65E0;
  v15[3] = &unk_1004A6530;
  v15[4] = buf;
  v10 = objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("MTSyncController.UPPEnabled"), v15);

  *((_QWORD *)v17 + 3) = v10;
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPEnabled](self, "UPPEnabled"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D663C;
  v12[3] = &unk_1004AA238;
  objc_copyWeak(&v13, &location);
  v12[4] = buf;
  objc_msgSend(v11, "addFinishBlock:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (BOOL)canScheduleSyncRequest
{
  _BOOL8 v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  uint8_t buf[2];
  __int16 v25;
  __int16 v26;

  v3 = -[MTSyncController isRunning](self, "isRunning");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v5 = objc_msgSend(v4, "isReachable");

    if ((v5 & 1) != 0)
    {
      v7 = -[MTSyncController isUserLoggedIn](self, "isUserLoggedIn");
      if (v7)
      {
        v8 = +[MTPrivacyUtil privacyAcknowledgementNeeded](MTPrivacyUtil, "privacyAcknowledgementNeeded");
        if (v8)
        {
          v9 = _MTLogCategoryCloudSync(v8);
          v10 = objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v23 = 0;
            v11 = "Cannot schedule sync request - Need privacy acknoweldgement";
            v12 = (uint8_t *)&v23;
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
          }
        }
        else
        {
          v17 = -[MTSyncController hasAccountChangedSinceLastSync](self, "hasAccountChangedSinceLastSync");
          if (v17)
          {
            v18 = _MTLogCategoryCloudSync(v17);
            v10 = objc_claimAutoreleasedReturnValue(v18);
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              goto LABEL_14;
            v22 = 0;
            v11 = "Cannot schedule sync request - Account has changed since last sync";
            v12 = (uint8_t *)&v22;
            goto LABEL_13;
          }
          v19 = -[MTSyncController resettingToInitialState](self, "resettingToInitialState");
          if (!v19)
            return !sub_10004857C();
          v20 = _MTLogCategoryCloudSync(v19);
          v10 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v21 = 0;
            v11 = "Cannot schedule sync request - We are in the process of resetting to initial state";
            v12 = (uint8_t *)&v21;
            goto LABEL_13;
          }
        }
      }
      else
      {
        v15 = _MTLogCategoryCloudSync(v7);
        v10 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "Cannot schedule sync request - User is not logged in";
          v12 = buf;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v14 = _MTLogCategoryCloudSync(v6);
      v10 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 0;
        v11 = "Cannot schedule sync request - Network is not reachable";
        v12 = (uint8_t *)&v25;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v13 = _MTLogCategoryCloudSync(v3);
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 0;
      v11 = "Cannot schedule sync request - Sync controller should be started before syncing.";
      v12 = (uint8_t *)&v26;
      goto LABEL_13;
    }
  }
LABEL_14:

  return 0;
}

- (BOOL)isUserLoggedIn
{
  return objc_msgSend((id)objc_opt_class(self), "isUserLoggedIn");
}

+ (BOOL)isUserLoggedIn
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v5 = objc_msgSend(v4, "isUserLoggedIn");

  return v5;
}

+ (id)playlistSyncVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", kMTPlaylistsKey));

  return v3;
}

- (BOOL)resetToInitialStateForced:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  MTSyncController *v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  _BOOL8 v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  MTTimedOperation *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  MTSyncController *v37;
  void (**v38)(id, _QWORD);
  uint8_t buf[16];

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = +[MTApplication localLibraryUpdatesDisabled](MTApplication, "localLibraryUpdatesDisabled");
  if (!v7)
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = -[MTSyncController resettingToInitialState](v11, "resettingToInitialState");
    if (v12)
    {
      v13 = _MTLogCategoryCloudSync(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v15 = "Reset to initial state in progress";
      goto LABEL_26;
    }
    v16 = -[MTSyncController isRunning](v11, "isRunning");
    if (!v16 && !v4)
    {
      v22 = _MTLogCategoryCloudSync(v16);
      v14 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v15 = "Shouldn't reset because the sync controller didn't complete starting yet.";
      goto LABEL_26;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    v18 = objc_msgSend(v17, "hasFetchedInitialAccount") | v4;

    if ((v18 & 1) == 0)
    {
      v23 = _MTLogCategoryCloudSync(v19);
      v14 = objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v15 = "Can't reset because the account isn't available yet";
      goto LABEL_26;
    }
    if (!-[MTSyncController hasPodcastSyncVersion](v11, "hasPodcastSyncVersion")
      && !-[MTSyncController hasPodcastSyncV3Version](v11, "hasPodcastSyncV3Version"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTPrivacyUtil cloudSyncVersion](MTPrivacyUtil, "cloudSyncVersion"));
      if (v20 || -[MTSyncController hasPlaylistSyncVersion](v11, "hasPlaylistSyncVersion"))
      {

      }
      else if (!+[MTBookmarksSyncStorage hasBookmarksSync](MTBookmarksSyncStorage, "hasBookmarksSync"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTSyncController accountIdentifierForLastSync](MTSyncController, "accountIdentifierForLastSync"));

        if (!v30)
        {
          v32 = _MTLogCategoryCloudSync(v31);
          v14 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v15 = "Already in Initial State";
            goto LABEL_26;
          }
LABEL_27:

          if (v6)
          {
LABEL_28:
            v6[2](v6, 0);
            v10 = 0;
            goto LABEL_29;
          }
LABEL_21:
          v10 = 0;
LABEL_29:
          objc_sync_exit(v11);

          goto LABEL_30;
        }
      }
    }
    if (!-[MTSyncController isUserLoggedIn](v11, "isUserLoggedIn")
      || (v21 = -[MTSyncController hasAccountChangedSinceLastSync](v11, "hasAccountChangedSinceLastSync"), v21 || v4))
    {
      if (!+[MTPrivacyUtil privacyAcknowledgementNeeded](MTPrivacyUtil, "privacyAcknowledgementNeeded"))
      {
        v25 = _MTLogCategoryCloudSync(-[MTSyncController setResettingToInitialState:](v11, "setResettingToInitialState:", 1));
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Reset to Initial State - Started", buf, 2u);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController cloudSyncController](v11, "cloudSyncController"));
        objc_msgSend(v27, "cancelAllTransactions");

        -[NSOperationQueue cancelAllOperations](v11->_queue, "cancelAllOperations");
        v28 = objc_opt_new(MTTimedOperation);
        -[MTTimedOperation setOperationType:](v28, "setOperationType:", 10);
        -[MTTimedOperation setStartDelay:](v28, "setStartDelay:", 0.0);
        v33 = _NSConcreteStackBlock;
        v34 = 3221225472;
        v35 = sub_1000D81C4;
        v36 = &unk_1004A63C8;
        v37 = v11;
        v38 = v6;
        -[MTTimedOperation setMainBlock:](v28, "setMainBlock:", &v33);
        -[MTSyncController addOperation:](v11, "addOperation:", v28, v33, v34, v35, v36, v37);

        v10 = 1;
        goto LABEL_29;
      }
      if (v6)
        goto LABEL_28;
      goto LABEL_21;
    }
    v29 = _MTLogCategoryCloudSync(v21);
    v14 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Already in Initial State, account didn't change";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  v8 = _MTLogCategoryCloudSync(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DEMO MODE Trying to reset to initial state. We say no", buf, 2u);
  }

  if (v6)
    v6[2](v6, 0);
  v10 = 0;
LABEL_30:

  return v10;
}

- (BOOL)isRunning
{
  MTSyncController *v2;
  BOOL isRunning;

  v2 = self;
  objc_sync_enter(v2);
  isRunning = v2->_isRunning;
  objc_sync_exit(v2);

  return isRunning;
}

- (BOOL)resettingToInitialState
{
  return self->_resettingToInitialState;
}

- (BOOL)hasPodcastSyncVersion
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subscriptionsSyncVersionFor:", 0));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasPodcastSyncV3Version
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subscriptionsSyncVersionFor:", 1));
  v4 = v3 != 0;

  return v4;
}

+ (int64_t)syncFlagsForSyncType:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionsSyncVersionFor:", a3));

  if (v5)
    v6 = 1 << a3;
  else
    v6 = 0;

  return v6;
}

+ (id)accountIdentifierForLastSync
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("SSAccountIdentifier")));

  return v3;
}

- (void)setUPPStore:(id)a3
{
  objc_storeStrong((id *)&self->_UPPStore, a3);
}

- (void)setCloudSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncController, a3);
}

- (BOOL)resetToInitialStateForced:(BOOL)a3
{
  return -[MTSyncController resetToInitialStateForced:completion:](self, "resetToInitialStateForced:completion:", a3, 0);
}

- (void)endBackgroundTask
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = -[MTSyncController backgroundTask](self, "backgroundTask");
  if (v3 != UIBackgroundTaskInvalid)
  {
    v4 = _MTLogCategoryCloudSync(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "*** Ending background task", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v6, "endBackgroundTask:", -[MTSyncController backgroundTask](self, "backgroundTask"));

    -[MTSyncController setBackgroundTask:](self, "setBackgroundTask:", UIBackgroundTaskInvalid);
  }
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (id)addEpisodeObserverUsingBlock:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTSyncedEpisodeObserver observerWithBlock:](MTSyncedEpisodeObserver, "observerWithBlock:", a3));
  -[NSMutableArray addObject:](self->_episodeObservers, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
  objc_msgSend(v5, "addEpisodeObserver:", v4);

  return v4;
}

- (void)removeEpisodeObserver:(id)a3
{
  NSMutableArray *episodeObservers;
  id v5;
  id v6;

  episodeObservers = self->_episodeObservers;
  v5 = a3;
  -[NSMutableArray removeObject:](episodeObservers, "removeObject:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
  objc_msgSend(v6, "removeEpisodeObserver:", v5);

}

- (void)_setupUPP
{
  void *v3;
  MZUniversalPlaybackPositionStore *v4;
  MTUniversalPlaybackPositionDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  objc_msgSend(v3, "setDataSource:", 0);

  v4 = objc_alloc_init(MZUniversalPlaybackPositionStore);
  -[MTSyncController setUPPStore:](self, "setUPPStore:", v4);

  v5 = objc_alloc_init(MTUniversalPlaybackPositionDataSource);
  -[MTSyncController setUppDataSource:](self, "setUppDataSource:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
  objc_msgSend(v6, "setDataSource:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController episodeObservers](self, "episodeObservers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
        objc_msgSend(v14, "addEpisodeObserver:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)startUPPSyncTimerAfterPrivacy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  objc_msgSend(v2, "startUPPSyncTimer");

}

- (void)operationFinished:(id)a3
{
  id v4;
  NSUInteger v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  MTSyncController *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  MTSyncController *v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  double v24;
  int v25;
  _QWORD v26[2];

  v4 = a3;
  v5 = -[NSOperationQueue operationCount](self->_queue, "operationCount");
  v6 = _MTLogCategoryCloudSync(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v25 = 134217984;
    v26[0] = v5 - 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MTSyncController operation completed: Count is %lld", (uint8_t *)&v25, 0xCu);
  }

  if (objc_msgSend((id)objc_opt_class(self), "isUserLoggedIn"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
    objc_msgSend(v8, "registerPushNotifications");

  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = -[MTSyncController resettingToInitialState](v9, "resettingToInitialState");
  objc_sync_exit(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("MTTimedOperationIsCancelledKey")));
  v13 = objc_msgSend(v12, "BOOLValue");

  if (((v10 | v13) & 1) != 0)
  {
    v15 = _MTLogCategoryCloudSync(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 67109376;
      LODWORD(v26[0]) = v10;
      WORD2(v26[0]) = 1024;
      *(_DWORD *)((char *)v26 + 6) = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Didn't updateAccountForLastSync because resettingToInitialState = %d or operationIsCancelled = %d", (uint8_t *)&v25, 0xEu);
    }

  }
  else
  {
    -[MTSyncController updateAccountForLastSync](v9, "updateAccountForLastSync");
  }
  if ((id)-[NSOperationQueue operationCount](self->_queue, "operationCount") == (id)1)
  {
    v17 = _MTLogCategoryCloudSync(1);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sync Operations Completed", (uint8_t *)&v25, 2u);
    }

    -[MTSyncController enableAssetDeletionIfPossible:](v9, "enableAssetDeletionIfPossible:", 1);
    -[MTSyncController endBackgroundTask](v9, "endBackgroundTask");
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1004AA210);
    v19 = v9;
    objc_sync_enter(v19);
    v20 = -[MTSyncController resyncWhenDone](v19, "resyncWhenDone");
    if (v20)
    {
      v21 = _MTLogCategoryCloudSync(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Syncing Content for New Account (previous sync completed)", (uint8_t *)&v25, 2u);
      }

      -[MTSyncController syncEverything](v19, "syncEverything");
      -[MTSyncController setResyncWhenDone:](v19, "setResyncWhenDone:", 0);
    }
    objc_sync_exit(v19);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v23, "timeIntervalSince1970");
  v9->_lastOperation = v24;

}

- (void)applicationDidEnterBackground
{
  void *v3;
  unsigned int v4;

  if (-[NSOperationQueue operationCount](self->_queue, "operationCount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
    v4 = objc_msgSend(v3, "isActive");

    if (v4)
      -[MTSyncController startBackgroundTask](self, "startBackgroundTask");
  }
}

- (void)startBackgroundTask
{
  MTSyncController *v2;
  void *v3;
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  uint64_t v20;

  v2 = self;
  objc_sync_enter(v2);
  -[MTSyncController endBackgroundTask](v2, "endBackgroundTask");
  objc_initWeak(&location, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000D5EC8;
  v14 = &unk_1004A7570;
  objc_copyWeak(&v15, &location);
  v4 = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("MTSyncController"), &v11);
  -[MTSyncController setBackgroundTask:](v2, "setBackgroundTask:", v4, v11, v12, v13, v14);

  v5 = -[MTSyncController backgroundTask](v2, "backgroundTask");
  v6 = +[PodcastsApplicationStateMonitor remainingBackgroundTime](PodcastsApplicationStateMonitor, "remainingBackgroundTime");
  v8 = v7;
  v9 = _MTLogCategoryCloudSync(v6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v18 = v5;
    v19 = 2048;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "*** Start background task with id=%lu timeout=%f", buf, 0x16u);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);

}

- (void)addOperation:(id)a3
{
  id v4;
  MTSyncController *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double lastOperation;
  uint64_t v15;
  NSObject *v16;
  double v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  double v33;
  __int16 v34;
  _BYTE v35[10];
  NSUInteger v36;
  __int16 v37;
  id v38;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController operationInQueueWithType:](v5, "operationInQueueWithType:", objc_msgSend(v4, "operationType")));
  if (!v6
    || objc_msgSend(v4, "operationType") == (id)6
    || objc_msgSend(v4, "operationType") == (id)7
    || (v7 = objc_msgSend(v4, "operationType"), v7 == (id)12))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
    if (objc_msgSend(v8, "isActive"))
    {
      v9 = -[MTSyncController backgroundTask](v5, "backgroundTask");

      if (v9 == (id)UIBackgroundTaskInvalid)
        -[MTSyncController startBackgroundTask](v5, "startBackgroundTask");
    }
    else
    {

    }
    if (objc_msgSend(v4, "requiresStartDelayToAvoidClampErrors"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v10, "timeIntervalSince1970");
      v12 = v11;

      lastOperation = v5->_lastOperation;
      if (lastOperation != 0.0)
      {
        v15 = _MTLogCategoryCloudSync(v13);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = v12 - v5->_lastOperation;
          v32 = 134217984;
          v33 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Time since last operation %f", (uint8_t *)&v32, 0xCu);
        }

        lastOperation = v5->_lastOperation;
      }
      if ((lastOperation == 0.0 || v12 - lastOperation >= 6.0)
        && !-[NSOperationQueue operationCount](v5->_queue, "operationCount"))
      {
        v18 = 0.5;
      }
      else
      {
        v18 = 6.0;
      }
      objc_msgSend(v4, "setStartDelay:", v18);
    }
    v19 = _MTLogCategoryCloudSync(-[NSOperationQueue addOperation:](v5->_queue, "addOperation:", v4));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v4, "operationType");
      objc_msgSend(v4, "startDelay");
      v23 = v22;
      v24 = -[NSOperationQueue operationCount](v5->_queue, "operationCount");
      v32 = 134218754;
      v33 = *(double *)&v21;
      v34 = 2048;
      *(_QWORD *)v35 = v23;
      *(_WORD *)&v35[8] = 2048;
      v36 = v24;
      v37 = 2112;
      v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Add operation with type: %ld with a timeout of %f. Total operation count is %li op=%@", (uint8_t *)&v32, 0x2Au);
    }
  }
  else
  {
    v25 = _MTLogCategoryCloudSync(v7);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 134218496;
      v33 = COERCE_DOUBLE(objc_msgSend(v6, "operationType"));
      v34 = 1024;
      *(_DWORD *)v35 = objc_msgSend(v6, "isExecuting");
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = objc_msgSend(v6, "isFinished");
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Dropping operation with type %ld as it's in the queue. isExecuting = %d, isFinished = %d", (uint8_t *)&v32, 0x18u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController queue](v5, "queue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "operations"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));

    if ((-[NSObject isFinished](v20, "isFinished") & 1) == 0)
    {
      if (-[NSObject isCancelled](v20, "isCancelled"))
      {
        v29 = -[NSObject isExecuting](v20, "isExecuting");
        if ((v29 & 1) == 0)
        {
          v30 = _MTLogCategoryCloudSync(v29);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v32) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Sync is probably stalled :(", (uint8_t *)&v32, 2u);
          }

        }
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)setResettingToInitialState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  MTSyncController *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_resettingToInitialState = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("kMTSyncControllerResettingToInitialState"));

  objc_sync_exit(obj);
}

- (BOOL)isSyncing
{
  return -[NSOperationQueue operationCount](self->_queue, "operationCount") != 0;
}

- (id)operationInQueueWithType:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_queue, "operations", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "operationType") == (id)a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  MTSyncController *v9;

  v3 = _MTLogCategoryCloudSync(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "<%p>", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  objc_msgSend(v5, "setDataSource:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)MTSyncController;
  -[MTSyncController dealloc](&v7, "dealloc");
}

- (int64_t)timedOperationTypeForSyncType:(int64_t)a3
{
  if (a3 == 1)
    return 13;
  else
    return 1;
}

- (int64_t)timedOperationTypeForBookmarksSyncType:(int64_t)a3
{
  if (a3 == 1)
    return 14;
  else
    return 11;
}

- (AMSPromise)UPPEnabled
{
  AMSPromise *UPPEnabled;
  void *v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  AMSPromise *v8;
  AMSPromise *v9;

  UPPEnabled = self->_UPPEnabled;
  if (!UPPEnabled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", kMTUPPDisabled));
    v6 = dispatch_queue_create("UPPEnabled", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asyncValuePromiseOnQueue:", v6));
    v8 = (AMSPromise *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "thenWithBlock:", &stru_1004AA278));
    v9 = self->_UPPEnabled;
    self->_UPPEnabled = v8;

    UPPEnabled = self->_UPPEnabled;
  }
  return UPPEnabled;
}

- (void)syncCoreKeysIfDirty
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D6A7C;
    block[3] = &unk_1004A6200;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (void)syncSubscriptions
{
  void *v3;
  id v4;

  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController keyProcessorPairProvider](self, "keyProcessorPairProvider"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysAndProcessorsForSubscriptionsAndStationsSync"));

    -[MTSyncController syncMultipleKeysAndProcessors:shouldSyncCleanKeys:](self, "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:", v4, 1);
  }
}

- (BOOL)checkViabilityOfSyncLibraryAndUPP
{
  void *v3;
  unsigned __int8 v4;

  if (-[MTSyncController canScheduleSyncRequest](self, "canScheduleSyncRequest"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    v4 = objc_msgSend(v3, "isLibrarySyncEnabled");

    return v4;
  }
  else
  {
    -[MTSyncController resetToInitialStateIfNeeded](self, "resetToInitialStateIfNeeded");
    return 0;
  }
}

- (void)syncTermsVersion
{
  MTTimedOperation *v3;
  _QWORD v4[5];

  if (-[MTSyncController canScheduleSyncRequest](self, "canScheduleSyncRequest"))
  {
    v3 = objc_alloc_init(MTTimedOperation);
    -[MTTimedOperation setOperationType:](v3, "setOperationType:", 8);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000D6C2C;
    v4[3] = &unk_1004A6200;
    v4[4] = self;
    -[MTTimedOperation setMainBlock:](v3, "setMainBlock:", v4);
    -[MTSyncController addOperation:](self, "addOperation:", v3);

  }
  else
  {
    -[MTSyncController resetToInitialStateIfNeeded](self, "resetToInitialStateIfNeeded");
  }
}

- (void)syncNonFollowedShowsIfSyncDirty
{
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v3;

  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    v3 = objc_alloc_init(_TtC8Podcasts29NonFollowedShowsSyncProcessor);
    if (-[NonFollowedShowsSyncProcessor hasLocalChanges](v3, "hasLocalChanges"))
      -[MTSyncController syncNonFollowedShows](self, "syncNonFollowedShows");

  }
}

- (void)syncNonFollowedShows
{
  MTTimedOperation *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    objc_initWeak(&location, self);
    v3 = objc_opt_new(MTTimedOperation);
    -[MTTimedOperation setOperationType:](v3, "setOperationType:", 15);
    v4 = _NSConcreteStackBlock;
    v5 = 3221225472;
    v6 = sub_1000D6ED8;
    v7 = &unk_1004A7570;
    objc_copyWeak(&v8, &location);
    -[MTTimedOperation setMainBlock:](v3, "setMainBlock:", &v4);
    -[MTSyncController addOperation:](self, "addOperation:", v3, v4, v5, v6, v7);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v18;
  id v19;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "code");
  if (v9 != (id)-1001)
  {
    v10 = _MTLogCategoryCloudSync(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "transaction did fail with error: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  if (objc_msgSend(v8, "isAccountsChangedError"))
  {
    -[MTSyncController resetToInitialStateIfNeeded](self, "resetToInitialStateIfNeeded");
    -[MTSyncController syncEverything](self, "syncEverything");
LABEL_8:
    -[MTSyncController enableAssetDeletionIfPossible](self, "enableAssetDeletionIfPossible");
    v13 = 0;
    goto LABEL_12;
  }
  v12 = objc_msgSend(v8, "isRecoverableError");
  if ((v12 & 1) != 0)
    goto LABEL_8;
  v14 = _MTLogCategoryCloudSync(v12);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ Did fail with unrecoverable error. Cancelling all transactions", (uint8_t *)&v18, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController cloudSyncController](self, "cloudSyncController"));
  objc_msgSend(v16, "cancelAllTransactions");

  v13 = 1;
LABEL_12:

  return v13;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v6 = a5;
  v7 = _MTLogCategoryCloudSync(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);

  }
  -[MTSyncController enableAssetDeletionIfPossible](self, "enableAssetDeletionIfPossible");

}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "processor", a3));
  v6 = objc_opt_class(MTSubscriptionSyncProcessor);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    objc_msgSend(v8, "cleanUpOldHiddenPodcasts");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("MTSyncControllerSubscriptionSyncCompleted"), 0);

  }
  -[MTSyncController enableAssetDeletionIfPossible](self, "enableAssetDeletionIfPossible");
}

- (void)enableAssetDeletionIfPossible
{
  -[MTSyncController enableAssetDeletionIfPossible:](self, "enableAssetDeletionIfPossible:", 0);
}

- (void)enableAssetDeletionIfPossible:(unint64_t)a3
{
  NSUInteger v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSyncController cloudSyncController](self, "cloudSyncController"));
  if (objc_msgSend(v6, "isIdle"))
  {
    v5 = -[NSOperationQueue operationCount](self->_queue, "operationCount");

    if (v5 != a3)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](MTAssetRemovalProcessor, "sharedInstance"));
    objc_msgSend(v6, "enable");
  }

}

- (void)scheduleEpisodeStatePutWithFeedUrls:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  MTTimedOperation *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  MTSyncController *v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
  if ((_DWORD)v5)
  {
    v6 = _MTLogCategoryCloudSync(v5);
    v7 = (MTTimedOperation *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_DEFAULT, "Not scheduling episode sync PUT on HomePod.", buf, 2u);
    }
    goto LABEL_7;
  }
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP")
    && objc_msgSend(v4, "count"))
  {
    v7 = objc_opt_new(MTTimedOperation);
    -[MTTimedOperation setOperationType:](v7, "setOperationType:", 7);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1000D7534;
    v11 = &unk_1004A6640;
    v12 = self;
    v13 = v4;
    -[MTTimedOperation setMainBlock:](v7, "setMainBlock:", &v8);
    -[MTSyncController addOperation:](self, "addOperation:", v7, v8, v9, v10, v11, v12);

LABEL_7:
  }

}

- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3
{
  -[MTSyncController scheduleEpisodeStateGetWithFeedUrls:priority:](self, "scheduleEpisodeStateGetWithFeedUrls:priority:", a3, 0);
}

- (void)scheduleVeryHighPriorityEpisodeStateGetWithFeedUrls:(id)a3
{
  -[MTSyncController scheduleEpisodeStateGetWithFeedUrls:priority:](self, "scheduleEpisodeStateGetWithFeedUrls:priority:", a3, 8);
}

- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3 priority:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  MTTimedOperation *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  MTSyncController *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
  if ((_DWORD)v7)
  {
    v8 = _MTLogCategoryCloudSync(v7);
    v9 = (MTTimedOperation *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v9->super.super, OS_LOG_TYPE_DEFAULT, "Not scheduling episode sync GET on HomePod.", buf, 2u);
    }
    goto LABEL_7;
  }
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP")
    && objc_msgSend(v6, "count"))
  {
    v9 = objc_opt_new(MTTimedOperation);
    -[MTTimedOperation setOperationType:](v9, "setOperationType:", 6);
    -[MTTimedOperation setQueuePriority:](v9, "setQueuePriority:", a4);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1000D7768;
    v13 = &unk_1004A6640;
    v14 = self;
    v15 = v6;
    -[MTTimedOperation setMainBlock:](v9, "setMainBlock:", &v10);
    -[MTSyncController addOperation:](self, "addOperation:", v9, v10, v11, v12, v13, v14);

LABEL_7:
  }

}

- (id)expandFeedUrls:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController episodeSyncStorage](self, "episodeSyncStorage", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modernKeyFromFeedUrl:", v11));
        objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)syncCriticalBookkeeperKeysShouldSyncCleanKeys:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController keyProcessorPairProvider](self, "keyProcessorPairProvider"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keysAndProcessorsForCriticalBookkeeperKeys"));

    -[MTSyncController syncMultipleKeysAndProcessors:shouldSyncCleanKeys:](self, "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:", v6, v3);
  }
}

- (void)syncMultipleKeysAndProcessors:(id)a3 shouldSyncCleanKeys:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  MTMultiKeySyncProcessor *v7;
  MTTimedOperation *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  MTMultiKeySyncProcessor *v11;
  _QWORD v12[4];
  MTMultiKeySyncProcessor *v13;
  MTSyncController *v14;
  id v15;
  _QWORD v16[4];
  MTMultiKeySyncProcessor *v17;
  id v18;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = -[MTMultiKeySyncProcessor initWithKeysAndProcessors:]([MTMultiKeySyncProcessor alloc], "initWithKeysAndProcessors:", v6);
  objc_initWeak(&location, self);
  if (v4)
  {
    v8 = objc_alloc_init(MTTimedOperation);
    -[MTTimedOperation setOperationType:](v8, "setOperationType:", 16);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000D7BF0;
    v16[3] = &unk_1004A9A58;
    v17 = v7;
    objc_copyWeak(&v18, &location);
    -[MTTimedOperation setMainBlock:](v8, "setMainBlock:", v16);
    -[MTSyncController addOperation:](self, "addOperation:", v8);
    objc_destroyWeak(&v18);

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D7D30;
  v12[3] = &unk_1004AA2A0;
  v13 = v7;
  v11 = v7;
  objc_copyWeak(&v15, &location);
  v14 = self;
  dispatch_async(v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

+ (void)resetMetadataToInitialState
{
  MTEpisodeSyncStorage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v3 = objc_opt_new(MTEpisodeSyncStorage);
  -[MTEpisodeSyncStorage resetVersionForAllFeedUrls](v3, "resetVersionForAllFeedUrls");

  objc_msgSend(a1, "resetAllSubscriptionSyncVersion");
  objc_msgSend(a1, "resetPlaylistSyncVersion");
  +[MTBookmarksSyncStorage resetBookmarksSync](MTBookmarksSyncStorage, "resetBookmarksSync");
  +[MTUniversalPlaybackPositionDataSource resetUppLastSyncTimeAndDomainVersion](MTUniversalPlaybackPositionDataSource, "resetUppLastSyncTimeAndDomainVersion");
  +[NonFollowedShowsSyncStorage resetNonFollowedShowsSync](_TtC8Podcasts27NonFollowedShowsSyncStorage, "resetNonFollowedShowsSync");
  +[InterestSyncStorage resetInterestSync](_TtC8Podcasts19InterestSyncStorage, "resetInterestSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPrivacyUtil cloudSyncVersion](MTPrivacyUtil, "cloudSyncVersion"));

  if (v4)
    +[MTPrivacyUtil resetToInitialState](MTPrivacyUtil, "resetToInitialState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcastsDomainVersion"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v7, "setPodcastsDomainVersion:", 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
  objc_msgSend(v8, "unregisterPushNotifications");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance"));
  objc_msgSend(v9, "removeAllDonations");

  v11 = _MTLogCategoryCloudSync(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Clearing account identifier for last sync", v13, 2u);
  }

  objc_msgSend(a1, "resetAccountIdentifierForLastSync");
}

- (BOOL)resetToInitialStateIfNeeded
{
  return -[MTSyncController resetToInitialStateForced:](self, "resetToInitialStateForced:", 0);
}

- (void)_synchronousResetToInitialStateDatabase
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "importContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D8290;
  v6[3] = &unk_1004A6640;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (void)_synchronousResetToInitialStateMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  +[MTUniversalPlaybackPositionDataSource resetUppLastSyncTimeAndDomainVersion](MTUniversalPlaybackPositionDataSource, "resetUppLastSyncTimeAndDomainVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPrivacyUtil cloudSyncVersion](MTPrivacyUtil, "cloudSyncVersion"));

  if (v3)
    +[MTPrivacyUtil resetToInitialState](MTPrivacyUtil, "resetToInitialState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastsDomainVersion"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v6, "setPodcastsDomainVersion:", 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
  objc_msgSend(v7, "unregisterPushNotifications");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance"));
  objc_msgSend(v8, "removeAllDonations");

  v10 = _MTLogCategoryCloudSync(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing account identifier for last sync", v12, 2u);
  }

  objc_msgSend((id)objc_opt_class(self), "resetAccountIdentifierForLastSync");
}

- (void)_finaliseResetToInitial:(id)a3
{
  id v4;
  MTSyncController *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = _MTLogCategoryCloudSync(-[MTSyncController setResettingToInitialState:](v5, "setResettingToInitialState:", 0));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset to Initial State - Completed", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MTSyncControllerResetToInitialStateCompleted"), 0);

  objc_sync_exit(v5);
  global_queue = dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D89D8;
  v12[3] = &unk_1004A7028;
  v12[4] = v5;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, v12);

}

+ (void)didUpdateSubscriptionsSyncVersionForSyncType:(int64_t)a3
{
  char v3;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  unint64_t v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v6 = (unint64_t)objc_msgSend(v5, "syncVersionFlags");

  if (v6 != 3)
  {
    v7 = v6 | (1 << v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
    objc_msgSend(v8, "setSyncVersionFlags:", v7);

    v10 = _MTLogCategoryCloudSync(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting MTSyncController syncVersionFlags to %lld", (uint8_t *)&v12, 0xCu);
    }

  }
}

+ (void)resetAllSubscriptionSyncVersion
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v2, "resetSubscriptionsSyncVersionFor:", 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v3, "resetSubscriptionsSyncVersionFor:", 1);

}

- (BOOL)hasInterestSyncVersion
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interestSyncVersion"));
  v4 = v3 != 0;

  return v4;
}

- (void)setPlaylistSyncVersion:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(self), "setPlaylistSyncVersion:", v4);

}

+ (void)setPlaylistSyncVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v6, kMTPlaylistsKey);
  else
    objc_msgSend(v4, "removeObjectForKey:", kMTPlaylistsKey);

}

+ (void)resetPlaylistSyncVersion
{
  id v2;

  objc_msgSend(a1, "setPlaylistSyncVersion:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v2, "setIsPlaylistSyncDirty:", 1);

}

+ (void)setAccountIdentifierForLastSync:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountIdentifierForLastSync"));
  v7 = v6;
  if (v6 != v4)
  {
    v8 = objc_msgSend(v6, "isEqualToString:", v4);
    if ((v8 & 1) == 0)
    {
      v9 = _MTLogCategoryCloudSync(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Changing account identifier to %@ from %@", (uint8_t *)&v12, 0x16u);
      }

      if (objc_msgSend(v4, "length"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v11, "setObject:forKey:", v4, CFSTR("SSAccountIdentifier"));
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("SSAccountIdentifier"));
      }

    }
  }

  objc_sync_exit(v5);
}

+ (void)resetAccountIdentifierForLastSync
{
  objc_msgSend(a1, "setAccountIdentifierForLastSync:", 0);
}

+ (BOOL)hasAccountChangedSinceLastSync
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = a1;
  objc_sync_enter(v2);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountIdentifierForLastSync"));
  if (!-[NSObject length](v3, "length"))
  {
    v8 = _MTLogCategoryCloudSync(0);
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "hasAccountChangedSinceLastSync = NO since there was previously no account", buf, 2u);
    }
    goto LABEL_10;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeDsid"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  if (!-[NSObject length](v6, "length"))
  {
    v9 = _MTLogCategoryCloudSync(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "hasAccountChangedSinceLastSync = NO since there is currently no account", v12, 2u);
    }

    goto LABEL_10;
  }
  if (v3 == v6)
  {
LABEL_10:
    LOBYTE(v7) = 0;
    goto LABEL_11;
  }
  v7 = -[NSObject isEqualToString:](v3, "isEqualToString:", v6) ^ 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)hasAccountChangedSinceLastSync
{
  return objc_msgSend((id)objc_opt_class(self), "hasAccountChangedSinceLastSync");
}

- (void)updateAccountForLastSync
{
  MTSyncController *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v2 = self;
  v3 = objc_sync_enter(v2);
  v4 = _MTLogCategoryCloudSync(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating account for last sync", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeDsid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

  objc_msgSend((id)objc_opt_class(v2), "setAccountIdentifierForLastSync:", v8);
  objc_sync_exit(v2);

}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a4 && !a3)
  {
    if (-[MTSyncController isRunning](self, "isRunning"))
      -[MTSyncController syncCriticalBookkeeperKeysShouldSyncCleanKeys:](self, "syncCriticalBookkeeperKeysShouldSyncCleanKeys:", 1);
    else
      -[MTSyncController start](self, "start");
  }
}

- (BOOL)uppSyncDirtyFlag
{
  return self->_uppSyncDirtyFlag;
}

- (void)setUppSyncDirtyFlag:(BOOL)a3
{
  self->_uppSyncDirtyFlag = a3;
}

- (int64_t)syncVersionFlags
{
  return self->_syncVersionFlags;
}

- (void)setSyncVersionFlags:(int64_t)a3
{
  self->_syncVersionFlags = a3;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MTEpisodeSyncStorage)episodeSyncStorage
{
  return self->_episodeSyncStorage;
}

- (void)setEpisodeSyncStorage:(id)a3
{
  objc_storeStrong((id *)&self->_episodeSyncStorage, a3);
}

- (MTKeyProcessorPairProvider)keyProcessorPairProvider
{
  return self->_keyProcessorPairProvider;
}

- (void)setKeyProcessorPairProvider:(id)a3
{
  objc_storeStrong((id *)&self->_keyProcessorPairProvider, a3);
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, a3);
}

- (MTUniversalPlaybackPositionDataSource)uppDataSource
{
  return self->_uppDataSource;
}

- (void)setUppDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_uppDataSource, a3);
}

- (BOOL)resyncWhenDone
{
  return self->_resyncWhenDone;
}

- (void)setResyncWhenDone:(BOOL)a3
{
  self->_resyncWhenDone = a3;
}

- (NSMutableArray)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_episodeObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeObservers, 0);
  objc_storeStrong((id *)&self->_uppDataSource, 0);
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_keyProcessorPairProvider, 0);
  objc_storeStrong((id *)&self->_episodeSyncStorage, 0);
  objc_storeStrong((id *)&self->_cloudSyncController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_UPPStore, 0);
  objc_storeStrong((id *)&self->_UPPEnabled, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
