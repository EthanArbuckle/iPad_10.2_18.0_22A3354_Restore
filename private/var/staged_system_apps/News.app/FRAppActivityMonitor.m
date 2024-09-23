@implementation FRAppActivityMonitor

- (void)activityObservingApplicationWillEnterForeground
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DD80();
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "activityObservingApplicationWillEnterForeground") & 1) != 0)
          objc_msgSend(v9, "activityObservingApplicationWillEnterForeground");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_checkForNeedToResetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LODWORD(v5) = objc_msgSend(v7, "BOOLForKey:", CFSTR("reset_identifier"));

  if ((_DWORD)v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "setBool:forKey:", 0, CFSTR("reset_identifier"));

    -[FRAppActivityMonitor _closeAppSessionForReason:startNewSession:resetUserID:forSceneID:](self, "_closeAppSessionForReason:startNewSession:resetUserID:forSceneID:", 4, 1, 1, v9);
  }

}

- (void)activityObservingApplicationDidBecomeActiveWithURL:(id)a3 sourceApplication:(id)a4 sceneID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _BYTE v32[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DC28();
  }
  -[FRAppActivityMonitor setIsActive:](self, "setIsActive:", 1);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000FFD0;
  v31[3] = &unk_1000DBB20;
  v31[4] = self;
  v11 = objc_retainBlock(v31);
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor analyticsReferralFactory](self, "analyticsReferralFactory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "analyticsReferralForURL:sourceApplication:", v8, v9));
    -[FRAppActivityMonitor setAppSessionStartReferral:](self, "setAppSessionStartReferral:", v13);

  }
  -[FRAppActivityMonitor _checkForNeedToResetIdentifier](self, "_checkForNeedToResetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor analyticsController](self, "analyticsController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionStartReferral](self, "appSessionStartReferral"));
  objc_msgSend(v14, "startSessionIfNeededWithReferral:sceneID:", v15, v10);

  -[FRAppActivityMonitor setAppSessionStartReferral:](self, "setAppSessionStartReferral:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
  v17 = objc_opt_respondsToSelector(v16, "activityObservingApplicationDidBecomeActive");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
    objc_msgSend(v18, "activityObservingApplicationDidBecomeActive");

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v19);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v21 = objc_msgSend(v20, "copy");

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v26, "activityObservingApplicationDidBecomeActive") & 1) != 0)
          objc_msgSend(v26, "activityObservingApplicationDidBecomeActive");
        ((void (*)(_QWORD *, void *))v11[2])(v11, v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v23);
  }

}

- (FRAppActivityObserving)appSessionCloseObserver
{
  return (FRAppActivityObserving *)objc_loadWeakRetained((id *)&self->_appSessionCloseObserver);
}

- (FRAppActivityMonitor)initWithAnalyticsController:(id)a3 appActivityMonitor:(id)a4 cloudContext:(id)a5 window:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FRAppActivityMonitor *v15;
  FRAppActivityMonitor *v16;
  uint64_t v17;
  NSHashTable *observers;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)FRAppActivityMonitor;
  v15 = -[FRAppActivityMonitor init](&v25, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_analyticsController, a3);
    objc_msgSend(v12, "addObserver:", v16);
    objc_storeStrong((id *)&v16->_cloudContext, a5);
    v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v16, "applicationWillResignActive:", UIApplicationWillResignActiveNotification, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, "applicationWillTerminate:", UIApplicationWillTerminateNotification, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor cloudContext](v16, "cloudContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "readingHistory"));
    objc_msgSend(v22, "addObserver:", v16);

    v23 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", 0, 0);
    objc_msgSend(v23, "setMinimumPressDuration:", 0.001);
    objc_msgSend(v23, "setDelegate:", v16);
    objc_msgSend(v14, "addGestureRecognizer:", v23);

  }
  return v16;
}

- (void)activityObservingApplicationDidFinishLaunching
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v3 = objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "activityObservingApplicationDidFinishLaunching") & 1) != 0)
          objc_msgSend(v8, "activityObservingApplicationDidFinishLaunching");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DE2C();
  }
  -[FRAppActivityMonitor setWindowIsForeground:](self, "setWindowIsForeground:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "activityObservingApplicationWindowDidBecomeForeground") & 1) != 0)
          objc_msgSend(v9, "activityObservingApplicationWindowDidBecomeForeground");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setWindowIsForeground:(BOOL)a3
{
  self->windowIsForeground = a3;
}

- (BOOL)hasBeenNotifiedOfApplicationLaunch
{
  return self->_hasBeenNotifiedOfApplicationLaunch;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007D8B0((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers"));
    objc_msgSend(v7, "addObject:", v4);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007D7F4();
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void)setHasBeenNotifiedOfApplicationLaunch:(BOOL)a3
{
  self->_hasBeenNotifiedOfApplicationLaunch = a3;
}

- (void)setAppSessionStartReferral:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionStartReferral, a3);
}

- (void)setAnalyticsReferralFactory:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReferralFactory, a3);
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)applicationWillFinishLaunching
{
  if (-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DAD0();
  }
  -[FRAppActivityMonitor setHasBeenNotifiedOfApplicationLaunch:](self, "setHasBeenNotifiedOfApplicationLaunch:", 1);
}

- (FRAnalyticsReferral)appSessionStartReferral
{
  return self->_appSessionStartReferral;
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));

    if (v5 == v4)
    {
      -[FRAppActivityMonitor setAppSessionCloseObserver:](self, "setAppSessionCloseObserver:", 0);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers"));
      v7 = objc_msgSend(v6, "containsObject:", v4);

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers"));
        objc_msgSend(v8, "removeObject:", v4);

      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007D968();
  }

}

- (void)addAppSessionCloseObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007DA24();
  }
  else
  {
    -[FRAppActivityMonitor setAppSessionCloseObserver:](self, "setAppSessionCloseObserver:", v4);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor cloudContext](self, "cloudContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingHistory"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)FRAppActivityMonitor;
  -[FRAppActivityMonitor dealloc](&v6, "dealloc");
}

+ (void)saveViewAppearanceDateForObserver:(id)a3
{
  char v3;
  void *v4;
  id AssociatedObject;
  void *v6;
  void *v7;
  id object;

  object = a3;
  v3 = objc_opt_respondsToSelector(object, "recordExposureEventWithStartDate:");
  v4 = object;
  if ((v3 & 1) != 0)
  {
    AssociatedObject = objc_getAssociatedObject(object, "FRViewAppearanceDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (!v6)
    {
      if ((objc_opt_respondsToSelector(object, "startRecordingExposure") & 1) != 0)
        objc_msgSend(object, "startRecordingExposure");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_setAssociatedObject(object, "FRViewAppearanceDate", v7, (void *)0x301);

    }
    v4 = object;
  }

}

+ (void)recordExposureEventForObserver:(id)a3
{
  id AssociatedObject;
  void *v4;
  id object;

  object = a3;
  if ((objc_opt_respondsToSelector(object, "recordExposureEventWithStartDate:") & 1) != 0)
  {
    AssociatedObject = objc_getAssociatedObject(object, "FRViewAppearanceDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (v4)
    {
      objc_msgSend(object, "recordExposureEventWithStartDate:", v4);
      objc_setAssociatedObject(object, "FRViewAppearanceDate", 0, (void *)0x301);
    }

  }
}

+ (id)recordedExposureDateForObserver:(id)a3
{
  id v3;
  id AssociatedObject;
  void *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "recordExposureEventWithStartDate:") & 1) == 0
    || (AssociatedObject = objc_getAssociatedObject(v3, "FRViewAppearanceDate"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject)) == 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  }

  return v5;
}

- (void)applicationWillResignActive:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", a3, 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "activityObservingApplicationWillResignActive") & 1) != 0)
          objc_msgSend(v9, "activityObservingApplicationWillResignActive");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)applicationWillTerminate:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch", a3)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DB7C();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "activityObservingApplicationWillTerminate") & 1) != 0)
          objc_msgSend(v10, "activityObservingApplicationWillTerminate");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)readingHistoryDidClear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key_window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIdentifier"));

  -[FRAppActivityMonitor _closeAppSessionForReason:startNewSession:resetUserID:forSceneID:](self, "_closeAppSessionForReason:startNewSession:resetUserID:forSceneID:", 1, 1, 1, v8);
}

- (void)_closeAppSessionForReason:(int64_t)a3 startNewSession:(BOOL)a4 resetUserID:(BOOL)a5 forSceneID:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v11 = (id)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor analyticsController](self, "analyticsController"));
  objc_msgSend(v11, "endSessionForReason:byStartingNewSession:resetUserID:forSceneID:", a3, v7, v6, v10);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", a3, 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "activityObservingUserDidPerformAction") & 1) != 0)
          objc_msgSend(v9, "activityObservingUserDidPerformAction");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return 0;
}

- (void)activityObservingApplicationWillResignActiveWithSceneID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "activityObservingApplicationWillResignActive") & 1) != 0)
          objc_msgSend(v11, "activityObservingApplicationWillResignActive");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor analyticsController](self, "analyticsController"));
  objc_msgSend(v12, "resignSessionForSceneID:", v4);

}

- (void)activityObservingApplicationDidEnterBackgroundWithSceneID:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE v24[128];

  v4 = a3;
  if (!-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DCD4();
  }
  if (-[FRAppActivityMonitor isActive](self, "isActive"))
  {
    -[FRAppActivityMonitor setIsActive:](self, "setIsActive:", 0);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100040C18;
    v23[3] = &unk_1000DBB20;
    v23[4] = self;
    v5 = objc_retainBlock(v23);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
    v7 = objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v12, "activityObservingApplicationDidEnterBackground") & 1) != 0)
            objc_msgSend(v12, "activityObservingApplicationDidEnterBackground");
          ((void (*)(_QWORD *, void *))v5[2])(v5, v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v9);
    }

    v13 = objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
      v16 = objc_opt_respondsToSelector(v15, "activityObservingApplicationDidEnterBackground");

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
        objc_msgSend(v17, "activityObservingApplicationDidEnterBackground");

      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor appSessionCloseObserver](self, "appSessionCloseObserver"));
    ((void (*)(_QWORD *, void *))v5[2])(v5, v18);

    -[FRAppActivityMonitor _closeAppSessionForReason:startNewSession:resetUserID:forSceneID:](self, "_closeAppSessionForReason:startNewSession:resetUserID:forSceneID:", 2, 0, 0, v4);
  }

}

- (void)activityObservingApplicationWindowDidBecomeBackground
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!-[FRAppActivityMonitor hasBeenNotifiedOfApplicationLaunch](self, "hasBeenNotifiedOfApplicationLaunch")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007DED8();
  }
  -[FRAppActivityMonitor setWindowIsForeground:](self, "setWindowIsForeground:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppActivityMonitor observers](self, "observers", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "activityObservingApplicationWindowDidBecomeBackground") & 1) != 0)
          objc_msgSend(v9, "activityObservingApplicationWindowDidBecomeBackground");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)isWindowForeground
{
  return self->windowIsForeground;
}

- (void)setAppSessionCloseObserver:(id)a3
{
  objc_storeWeak((id *)&self->_appSessionCloseObserver, a3);
}

- (unint64_t)activationCount
{
  return self->_activationCount;
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsController, a3);
}

- (FRURLAnalyticsReferralFactory)analyticsReferralFactory
{
  return self->_analyticsReferralFactory;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_analyticsReferralFactory, 0);
  objc_storeStrong((id *)&self->_appSessionStartReferral, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_destroyWeak((id *)&self->_appSessionCloseObserver);
}

@end
