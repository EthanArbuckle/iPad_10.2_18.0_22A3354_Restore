@implementation FRAnalyticsController

- (void)addAppSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController appSessionObservers](self, "appSessionObservers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)startSessionIfNeededWithReferral:(id)a3 sceneID:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!-[FRAnalyticsController sessionInProgressForID:](self, "sessionInProgressForID:", v6))
    -[FRAnalyticsController _startSessionWithReferral:sceneID:restartAllSessions:](self, "_startSessionWithReferral:sceneID:restartAllSessions:", v7, v6, 0);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController observers](self, "observers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)sessionInProgressForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](self, "sceneSessionDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6 != 0;
}

- (void)loadOrRegenerateUserID
{
  OS_dispatch_group *v3;
  void *v4;
  void *v5;
  OS_dispatch_group *v6;
  _QWORD v7[5];
  OS_dispatch_group *v8;

  v3 = self->_userIDDeterminationGroup;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000772A8();
  dispatch_group_enter((dispatch_group_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController cloudContext](self, "cloudContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001877C;
  v7[3] = &unk_1000D97A8;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "loadFeldsparIDWithCompletion:", v7);

}

- (void)loadOrRegenerateUserStartDate
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
  v4 = objc_msgSend(v3, "isPrivateDataSyncingEnabled");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController cloudContext](self, "cloudContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userStartDate"));

  if (!v7)
  {
    if ((v4 & 1) != 0)
    {
      -[FRAnalyticsController syncUserStartDate](self, "syncUserStartDate");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController lastAppOpenDate](self, "lastAppOpenDate"));

      if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000771EC();
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController lastAppOpenDate](self, "lastAppOpenDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController cloudContext](self, "cloudContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      objc_msgSend(v11, "setUserStartDate:", v9);

    }
  }
}

- (FRAnalyticsController)initWithCloudContext:(id)a3
{
  id v5;
  FRAnalyticsController *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  AAAccessQueue *v10;
  AAAccessQueue *accessQueue;
  NSMutableDictionary *v12;
  NSMutableDictionary *sceneSessionDictionary;
  dispatch_group_t v14;
  OS_dispatch_group *userIDDeterminationGroup;
  void *v16;
  uint64_t v17;
  NSDate *lastAppOpenDate;
  uint64_t v19;
  NSHashTable *observers;
  uint64_t v21;
  NSHashTable *appSessionObservers;
  objc_super v24;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100076EF8();
  v24.receiver = self;
  v24.super_class = (Class)FRAnalyticsController;
  v6 = -[FRAnalyticsController init](&v24, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.news.analytics", v8);

    v10 = (AAAccessQueue *)objc_msgSend(objc_alloc((Class)AAAccessQueue), "initWithQueue:", v9);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sceneSessionDictionary = v6->_sceneSessionDictionary;
    v6->_sceneSessionDictionary = v12;

    objc_storeStrong((id *)&v6->_cloudContext, a3);
    v6->_isUserIDLoaded = 0;
    v14 = dispatch_group_create();
    userIDDeterminationGroup = v6->_userIDDeterminationGroup;
    v6->_userIDDeterminationGroup = (OS_dispatch_group *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    objc_msgSend(v16, "addObserver:", v6);
    v17 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastAppOpenDate = v6->_lastAppOpenDate;
    v6->_lastAppOpenDate = (NSDate *)v17;

    -[FRAnalyticsController loadOrRegenerateUserID](v6, "loadOrRegenerateUserID");
    -[FRAnalyticsController loadOrRegenerateUserStartDate](v6, "loadOrRegenerateUserStartDate");
    v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    appSessionObservers = v6->_appSessionObservers;
    v6->_appSessionObservers = (NSHashTable *)v21;

  }
  return v6;
}

- (void)_startSessionWithReferral:(id)a3 sceneID:(id)a4 restartAllSessions:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  char **v23;
  void *v24;
  char **v25;
  char *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _BYTE v39[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](self, "sceneSessionDictionary"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001A2D4;
    v38[3] = &unk_1000D97D0;
    v38[4] = self;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v38);

    -[FRAnalyticsController _restartAllSessions](self, "_restartAllSessions");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](self, "sceneSessionDictionary"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "referringURL"));
    if (v14)
    {
      v15 = objc_alloc((Class)NSURL);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "referringURL"));
      v33 = objc_msgSend(v15, "initWithString:", v16);

    }
    else
    {
      v33 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController observers](self, "observers", v8));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      v23 = &selRef_resourceManager;
      while (2)
      {
        v24 = 0;
        v25 = v23;
        v26 = v23[64];
        do
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v19);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v24);
          if ((objc_opt_respondsToSelector(v27, v26) & 1) != 0)
          {
            v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sceneSessionIdentifier"));

            if (v28 == v9)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](self, "sceneSessionDictionary"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v9));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "referringApplication"));
              objc_msgSend(v27, "sessionDidStartWithSessionID:sourceApplication:url:", v30, v31, v33);

              goto LABEL_17;
            }
          }
          v24 = (char *)v24 + 1;
        }
        while (v21 != v24);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        v23 = v25;
        if (v21)
          continue;
        break;
      }
    }
LABEL_17:

    v8 = v32;
  }

}

- (NSMutableDictionary)sceneSessionDictionary
{
  return self->_sceneSessionDictionary;
}

- (void)setIsUserIDLoaded:(BOOL)a3
{
  self->_isUserIDLoaded = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NSHashTable)appSessionObservers
{
  return self->_appSessionObservers;
}

- (AAAccessQueue)accessQueue
{
  return self->_accessQueue;
}

- (FRAnalyticsController)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRAnalyticsController init]";
    v7 = 2080;
    v8 = "FRAnalyticsController.m";
    v9 = 1024;
    v10 = 61;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRAnalyticsController init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController cloudContext](self, "cloudContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)FRAnalyticsController;
  -[FRAnalyticsController dealloc](&v5, "dealloc");
}

- (NTPBSession)currentSession
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100076FB4();
  return 0;
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  _QWORD v5[5];

  if (a4)
  {
    if (-[FRAnalyticsController isUserIDLoaded](self, "isUserIDLoaded", a3))
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000199DC;
      v5[3] = &unk_1000D9758;
      v5[4] = self;
      FCPerformBlockOnMainThread(v5);
    }
  }
}

- (void)notifyWhenUserIDHasBeenDeterminedWithBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077074();
  v5 = objc_claimAutoreleasedReturnValue(-[FRAnalyticsController userIDDeterminationGroup](self, "userIDDeterminationGroup"));
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)syncUserStartDate
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController cloudContext](self, "cloudContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019B70;
  v5[3] = &unk_1000D9780;
  v5[4] = self;
  objc_msgSend(v4, "syncWithCompletion:", v5);

}

- (void)resignSessionForSceneID:(id)a3
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
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController observers](self, "observers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "sessionWillResignActive") & 1) != 0)
        {
          v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sceneSessionIdentifier", (_QWORD)v14));

          if (v13 == v4)
            objc_msgSend(v12, "performSelector:withObject:", "sessionWillResignActive", v4);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)endSessionForReason:(int64_t)a3 byStartingNewSession:(BOOL)a4 resetUserID:(BOOL)a5 forSceneID:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char **v20;
  void *v21;
  char *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  v6 = a5;
  v7 = a4;
  v10 = a6;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](self, "sceneSessionDictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

    if (v12)
    {
      v13 = a3 == 4 && v7;
      if (!v13 && !v6)
      {
        v29 = v7;
        v30 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController observers](self, "observers"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v32;
          v20 = &selRef_cachedEditorialItems;
          while (2)
          {
            v21 = 0;
            v22 = v20[254];
            do
            {
              if (*(_QWORD *)v32 != v19)
                objc_enumerationMutation(v16);
              v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v21);
              if ((objc_opt_respondsToSelector(v23, v22) & 1) != 0)
              {
                v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sceneSessionIdentifier"));

                if (v24 == v10)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
                  objc_msgSend(v23, "performSelector:withObject:withObject:", v22, v26, v10);

                  goto LABEL_23;
                }
              }
              v21 = (char *)v21 + 1;
            }
            while (v18 != v21);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            v20 = &selRef_cachedEditorialItems;
            if (v18)
              continue;
            break;
          }
        }
LABEL_23:

        v25 = 0;
        v12 = v30;
        v6 = 0;
        v7 = v29;
        goto LABEL_24;
      }
LABEL_21:
      -[FRAnalyticsController _endAllSessionsWithReason:forSceneID:](self, "_endAllSessionsWithReason:forSceneID:", a3, v10);
      v25 = 1;
LABEL_24:
      v27 = FCAnalyticsLog;
      if (os_log_type_enabled(FCAnalyticsLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v10;
        v37 = 2112;
        v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Ending analytics session with scene ID session ID: %@, %@", buf, 0x16u);
      }
      if (v6)
        -[FRAnalyticsController _resetUserID](self, "_resetUserID");
      if ((v25 | v7) == 1)
      {
        -[FRAnalyticsController _startSessionWithReferral:sceneID:restartAllSessions:](self, "_startSessionWithReferral:sceneID:restartAllSessions:", 0, v10, v25);
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](self, "sceneSessionDictionary"));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, v10);

      }
      goto LABEL_33;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100077364();
      if (v6)
        goto LABEL_21;
    }
    else if (v6)
    {
      goto LABEL_21;
    }
    sub_10001A104();
LABEL_33:

    goto LABEL_34;
  }
  sub_10001A0A0();
LABEL_34:

}

- (void)_endAllSessionsWithReason:(int64_t)a3 forSceneID:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  +[NSThread isMainThread](NSThread, "isMainThread", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController appSessionObservers](self, "appSessionObservers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "endAppSessionWithEndReason:") & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, (_QWORD)v15));
          objc_msgSend(v13, "performSelector:withObject:", "endAppSessionWithEndReason:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_restartAllSessions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  FRAnalyticsController *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  +[NSThread isMainThread](NSThread, "isMainThread");
  v27 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController appSessionObservers](self, "appSessionObservers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "startAppSessionWithUserIDReset:") & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
          objc_msgSend(v10, "performSelector:withObject:", "startAppSessionWithUserIDReset:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }
  v26 = v5;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController observers](v27, "observers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sceneSessionIdentifier", v26));
        if ((objc_opt_respondsToSelector(v19, "sessionDidStartWithSessionID:sourceApplication:url:") & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](v27, "sceneSessionDictionary"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
          v23 = objc_msgSend(v22, "containsObject:", v20);

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController sceneSessionDictionary](v27, "sceneSessionDictionary"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v20));
            objc_msgSend(v19, "sessionDidStartWithSessionID:sourceApplication:url:", v25, 0, 0);

          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

}

- (void)_resetUserID
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRAnalyticsController cloudContext](self, "cloudContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  objc_msgSend(v2, "resetUserIDs");

}

- (void)setSceneSessionDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSessionDictionary, a3);
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (BOOL)isUserIDLoaded
{
  return self->_isUserIDLoaded;
}

- (NSDate)lastAppOpenDate
{
  return self->_lastAppOpenDate;
}

- (void)setLastAppOpenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_group)userIDDeterminationGroup
{
  return self->_userIDDeterminationGroup;
}

- (void)setUserIDDeterminationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_userIDDeterminationGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSessionObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userIDDeterminationGroup, 0);
  objc_storeStrong((id *)&self->_lastAppOpenDate, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_sceneSessionDictionary, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
