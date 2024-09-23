@implementation IPCServer

+ (id)sharedServer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003201F4;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2108 != -1)
    dispatch_once(&qword_1014D2108, block);
  return (id)qword_1014D2100;
}

- (IPCServer)init
{
  IPCServer *v2;
  void *v3;
  void *v4;
  BannerSource *v5;
  BannerSource *bannerSource;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPCServer;
  v2 = -[IPCServer init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sceneWillConnect", UISceneWillConnectNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sceneDidActivate:", UISceneDidActivateNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sceneWillDeactivate:", UISceneWillDeactivateNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sceneWillEnterForeground:", UISceneWillEnterForegroundNotification, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v4, "registerObserver:", v2);

    v5 = objc_opt_new(BannerSource);
    bannerSource = v2->_bannerSource;
    v2->_bannerSource = v5;

    v7 = +[MapsCarPlayExternalDeviceMonitor sharedInstance](MapsCarPlayExternalDeviceMonitor, "sharedInstance");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "unregisterObserver:", self);

  -[CLInUseAssertion invalidate](self->_coreLocationInUseAssertion, "invalidate");
  -[NSTimer invalidate](self->_waitingToRespondToMessageTimer, "invalidate");
  -[NSTimer invalidate](self->_waitingForKeyScenePollTimer, "invalidate");
  -[NSXPCConnection invalidate](self->_siriPluginConnection, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)IPCServer;
  -[IPCServer dealloc](&v5, "dealloc");
}

- (void)setState:(unint64_t)a3 withReason:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t state;

  state = self->_state;
  if (state != a3)
  {
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC IPCServer state is changing from %lu to %lu for reason %@"), a3, a4, v4, v5, v6, v7, state);
    self->_state = a3;
  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (!+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:"))
  {
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC _sceneWillDeactivate: %@"), v4, v5, v6, v7, v8, v9, (uint64_t)v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[IPCServer setLastSceneDeactivationTime:](self, "setLastSceneDeactivationTime:", v10);

    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  }

}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (!+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:"))
  {
    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
    -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
  }

}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (!+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:"))
  {
    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
    -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
  }

}

- (BOOL)_isMapsForegroundOnMainWindow
{
  if (+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", UIWindowSceneSessionRoleApplication))
  {
    return 1;
  }
  else
  {
    return +[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet);
  }
}

- (BOOL)_isMapsForegroundOnCarPlay
{
  return -[IPCServer _isAnySceneForegroundAndNotOccludedForRole:](self, "_isAnySceneForegroundAndNotOccludedForRole:", _UIWindowSceneSessionRoleCarPlay);
}

- (BOOL)_isMapsForegroundOnlyOnHybridIC
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));
  v5 = sub_10039E080(v4, &stru_1011B1A90);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10032083C;
  v14[3] = &unk_1011B1AB8;
  v14[4] = self;
  v7 = sub_10039E1FC(v6, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003208A4;
    v13[3] = &unk_1011B1AB8;
    v13[4] = self;
    v9 = sub_10039E1FC(v6, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10 == 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isAnySceneForegroundAndNotOccludedForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedScenes"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "role"));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14
          && !+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:", v11)&& !-[IPCServer _isSceneOccluded:](self, "_isSceneOccluded:", v11)&& -[IPCServer _isSceneForeground:](self, "_isSceneForeground:", v11))
        {
          v15 = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)_isSceneOccluded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  BOOL v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_FBSScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uiSettings"));
  v6 = objc_msgSend(v5, "deactivationReasons");

  v7 = objc_msgSend(v3, "activationState");
  v8 = v7 == (id)1 && (v6 & 0x80) != 0;

  return v8;
}

- (BOOL)_isSceneForeground:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "activationState") < 2;
}

- (BOOL)_isInBackground
{
  if (-[IPCServer _isMapsForegroundOnMainWindow](self, "_isMapsForegroundOnMainWindow"))
    return 0;
  else
    return !-[IPCServer _isMapsForegroundOnCarPlay](self, "_isMapsForegroundOnCarPlay");
}

- (id)activeCarPlayBannerViewController
{
  return -[BannerSource activeCarPlayBannerViewController](self->_bannerSource, "activeCarPlayBannerViewController");
}

- (id)activeBannerViewController
{
  return -[BannerSource activeBannerViewController](self->_bannerSource, "activeBannerViewController");
}

- (void)setSiriPluginListenerEndpoint:(id)a3
{
  NSXPCListenerEndpoint *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSXPCConnection *siriPluginConnection;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v5 = (NSXPCListenerEndpoint *)a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (self->_siriPluginListenerEndpoint != v5)
    {
      sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Changing siriPluginListenerEndpoint from %@ to %@"), v6, v7, v8, v9, v10, v11, (uint64_t)self->_siriPluginListenerEndpoint);
      objc_storeStrong((id *)&self->_siriPluginListenerEndpoint, a3);
      -[NSXPCConnection setInvalidationHandler:](self->_siriPluginConnection, "setInvalidationHandler:", 0);
      -[NSXPCConnection invalidate](self->_siriPluginConnection, "invalidate");
      siriPluginConnection = self->_siriPluginConnection;
      self->_siriPluginConnection = 0;

      if (v5)
      {
        v13 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v5);
        v14 = self->_siriPluginConnection;
        self->_siriPluginConnection = v13;

        -[NSXPCConnection setExportedObject:](self->_siriPluginConnection, "setExportedObject:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsSiriXPCInterface](NSXPCInterface, "_maps_mapsSiriXPCInterface"));
        -[NSXPCConnection setExportedInterface:](self->_siriPluginConnection, "setExportedInterface:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsSiriXPCClientInterface](NSXPCInterface, "_maps_mapsSiriXPCClientInterface"));
        -[NSXPCConnection setRemoteObjectInterface:](self->_siriPluginConnection, "setRemoteObjectInterface:", v16);

        -[NSXPCConnection _setQueue:](self->_siriPluginConnection, "_setQueue:", &_dispatch_main_q);
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100320D78;
        v18[3] = &unk_1011AD260;
        objc_copyWeak(&v19, &location);
        -[NSXPCConnection setInvalidationHandler:](self->_siriPluginConnection, "setInvalidationHandler:", v18);
        -[NSXPCConnection setInterruptionHandler:](self->_siriPluginConnection, "setInterruptionHandler:", &stru_1011B1AD8);
        -[NSXPCConnection resume](self->_siriPluginConnection, "resume");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_siriPluginConnection, "remoteObjectProxy"));
        objc_msgSend(v17, "establishConnection");

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)setCompanionDaemonListenerEndpoint:(id)a3
{
  NSXPCListenerEndpoint *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSXPCConnection *companionDaemonConnection;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v5 = (NSXPCListenerEndpoint *)a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (self->_companionDaemonListenerEndpoint != v5)
    {
      sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Changing companionDaemonListenerEndpoint from %@ to %@"), v6, v7, v8, v9, v10, v11, (uint64_t)self->_companionDaemonListenerEndpoint);
      objc_storeStrong((id *)&self->_companionDaemonListenerEndpoint, a3);
      -[NSXPCConnection setInvalidationHandler:](self->_companionDaemonConnection, "setInvalidationHandler:", 0);
      -[NSXPCConnection invalidate](self->_companionDaemonConnection, "invalidate");
      companionDaemonConnection = self->_companionDaemonConnection;
      self->_companionDaemonConnection = 0;

      if (v5)
      {
        v13 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v5);
        v14 = self->_companionDaemonConnection;
        self->_companionDaemonConnection = v13;

        -[NSXPCConnection setExportedObject:](self->_companionDaemonConnection, "setExportedObject:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsCompanionDaemonXPCInterface](NSXPCInterface, "_maps_mapsCompanionDaemonXPCInterface"));
        -[NSXPCConnection setExportedInterface:](self->_companionDaemonConnection, "setExportedInterface:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsCompanionDaemonXPCClientInterface](NSXPCInterface, "_maps_mapsCompanionDaemonXPCClientInterface"));
        -[NSXPCConnection setRemoteObjectInterface:](self->_companionDaemonConnection, "setRemoteObjectInterface:", v16);

        -[NSXPCConnection _setQueue:](self->_companionDaemonConnection, "_setQueue:", &_dispatch_main_q);
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100320FB4;
        v18[3] = &unk_1011AD260;
        objc_copyWeak(&v19, &location);
        -[NSXPCConnection setInvalidationHandler:](self->_companionDaemonConnection, "setInvalidationHandler:", v18);
        -[NSXPCConnection setInterruptionHandler:](self->_companionDaemonConnection, "setInterruptionHandler:", &stru_1011B1AF8);
        -[NSXPCConnection resume](self->_companionDaemonConnection, "resume");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_companionDaemonConnection, "remoteObjectProxy"));
        objc_msgSend(v17, "establishConnection");

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)setPushDaemonListenerEndpoint:(id)a3
{
  NSXPCListenerEndpoint *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSXPCConnection *pushDaemonConnection;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v5 = (NSXPCListenerEndpoint *)a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (self->_pushDaemonListenerEndpoint != v5)
    {
      sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Changing pushDaemonListenerEndpoint from %@ to %@"), v6, v7, v8, v9, v10, v11, (uint64_t)self->_pushDaemonListenerEndpoint);
      objc_storeStrong((id *)&self->_pushDaemonListenerEndpoint, a3);
      -[NSXPCConnection setInvalidationHandler:](self->_pushDaemonConnection, "setInvalidationHandler:", 0);
      -[NSXPCConnection invalidate](self->_pushDaemonConnection, "invalidate");
      pushDaemonConnection = self->_pushDaemonConnection;
      self->_pushDaemonConnection = 0;

      if (v5)
      {
        v13 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v5);
        v14 = self->_pushDaemonConnection;
        self->_pushDaemonConnection = v13;

        -[NSXPCConnection setExportedObject:](self->_pushDaemonConnection, "setExportedObject:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsPushDaemonXPCInterface](NSXPCInterface, "_maps_mapsPushDaemonXPCInterface"));
        -[NSXPCConnection setExportedInterface:](self->_pushDaemonConnection, "setExportedInterface:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsPushDaemonXPCClientInterface](NSXPCInterface, "_maps_mapsPushDaemonXPCClientInterface"));
        -[NSXPCConnection setRemoteObjectInterface:](self->_pushDaemonConnection, "setRemoteObjectInterface:", v16);

        -[NSXPCConnection _setQueue:](self->_pushDaemonConnection, "_setQueue:", &_dispatch_main_q);
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1003211F0;
        v18[3] = &unk_1011AD260;
        objc_copyWeak(&v19, &location);
        -[NSXPCConnection setInvalidationHandler:](self->_pushDaemonConnection, "setInvalidationHandler:", v18);
        -[NSXPCConnection setInterruptionHandler:](self->_pushDaemonConnection, "setInterruptionHandler:", &stru_1011B1B18);
        -[NSXPCConnection resume](self->_pushDaemonConnection, "resume");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_pushDaemonConnection, "remoteObjectProxy"));
        objc_msgSend(v17, "establishConnection");

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)handleTrafficeReroute:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s %@"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer handleTrafficeReroute:reply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032131C;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)dismissNavigationSafetyAlertWithReply:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a3;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s"), v4, v5, v6, v7, v8, v9, (uint64_t)"-[IPCServer dismissNavigationSafetyAlertWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003214FC;
  block[3] = &unk_1011ADA00;
  v12 = v3;
  v10 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)endNavigationWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s"), v5, v6, v7, v8, v9, v10, (uint64_t)"-[IPCServer endNavigationWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321600;
  block[3] = &unk_1011AE240;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)getGuidanceState:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s %@"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer getGuidanceState:reply:]");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003217A8;
  v16[3] = &unk_1011AECC0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  -[IPCServer checkNotificationSettingsAndPerformBlock:](self, "checkNotificationSettingsAndPerformBlock:", v16);

}

- (void)checkNotificationSettingsAndPerformBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_hasCheckedNotificationSettingsForManeuver)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100321AF8;
    v7[3] = &unk_1011B1B68;
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v6, "getNotificationSettingsWithCompletionHandler:", v7);

  }
}

- (void)repeatLastReroutePromptWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s"), v5, v6, v7, v8, v9, v10, (uint64_t)"-[IPCServer repeatLastReroutePromptWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321C60;
  block[3] = &unk_1011AE240;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)repeatLastGuidanceInstructionWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s"), v5, v6, v7, v8, v9, v10, (uint64_t)"-[IPCServer repeatLastGuidanceInstructionWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321E3C;
  block[3] = &unk_1011AE240;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)loadDirections:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s %@"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer loadDirections:reply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100322058;
  block[3] = &unk_1011B1BB8;
  v17 = v6;
  v18 = v7;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)startPreparedNavigation:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s %@"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer startPreparedNavigation:reply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100322238;
  block[3] = &unk_1011B1BB8;
  v17 = v6;
  v18 = v7;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)setNavigationMuted:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;

  v11 = a3;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s %@"), v4, v5, v6, v7, v8, v9, (uint64_t)"-[IPCServer setNavigationMuted:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100322328;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v13 = v11;
  v10 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)setNavigationVoiceVolume:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;

  v11 = a3;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC %s %@"), v4, v5, v6, v7, v8, v9, (uint64_t)"-[IPCServer setNavigationVoiceVolume:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100322410;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v13 = v11;
  v10 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_receivedTrafficIncidentAlert:(id)a3
{
  id v4;
  double v5;
  NSTimer *v6;
  NSTimer *trafficAlertTimer;
  MNTrafficIncidentAlert *trafficIncidentAlert;

  v4 = a3;
  if (self->_trafficAlertTimer)
    -[IPCServer _removeTrafficIncidentAlertFromTimer:](self, "_removeTrafficIncidentAlertFromTimer:");
  objc_msgSend(v4, "alertDisplayDuration");
  if (v5 > 0.0)
  {
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_removeTrafficIncidentAlertFromTimer:", v4, 0));
    trafficAlertTimer = self->_trafficAlertTimer;
    self->_trafficAlertTimer = v6;

  }
  trafficIncidentAlert = self->_trafficIncidentAlert;
  self->_trafficIncidentAlert = (MNTrafficIncidentAlert *)v4;

}

- (void)_updatedTrafficIncidentAlert:(id)a3
{
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged", a3);
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)_invalidatedTrafficIncidentAlert:(id)a3
{
  NSTimer *trafficAlertTimer;
  id v5;
  id v6;

  if (self->_trafficIncidentAlert == a3)
  {
    trafficAlertTimer = self->_trafficAlertTimer;
    v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSTimer userInfo](trafficAlertTimer, "userInfo"));

    if (v6 == v5)
      -[IPCServer _removeTrafficIncidentAlertFromTimer:](self, "_removeTrafficIncidentAlertFromTimer:", self->_trafficAlertTimer);
  }
}

- (void)_removeTrafficIncidentAlertFromTimer:(id)a3
{
  NSTimer *v4;
  MNTrafficIncidentAlert *trafficIncidentAlert;
  MNTrafficIncidentAlert *v6;
  MNTrafficIncidentAlert *v7;
  NSTimer *v8;
  NSTimer *v9;

  v4 = (NSTimer *)a3;
  trafficIncidentAlert = self->_trafficIncidentAlert;
  v9 = v4;
  v6 = (MNTrafficIncidentAlert *)objc_claimAutoreleasedReturnValue(-[NSTimer userInfo](v4, "userInfo"));

  if (trafficIncidentAlert == v6)
  {
    v7 = self->_trafficIncidentAlert;
    self->_trafficIncidentAlert = 0;

  }
  v8 = v9;
  if (self->_trafficAlertTimer == v9)
  {
    self->_trafficAlertTimer = 0;

    v8 = v9;
  }
  -[NSTimer invalidate](v8, "invalidate");

}

- (void)dismissTrafficIncidentAlert:(id)a3
{
  if (self->_trafficIncidentAlert == a3)
    -[IPCServer _removeTrafficIncidentAlertFromTimer:](self, "_removeTrafficIncidentAlertFromTimer:", self->_trafficAlertTimer);
}

- (void)_showNoGuidance
{
  -[IPCServer setState:withReason:](self, "setState:withReason:", 0, 0);
  self->_lastSeenManeuverAlert = 0;
  self->_waitingForDistanceAndTimeToManeuver = 0;
  -[IPCServer setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0);
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)showRecalculating
{
  self->_lastSeenManeuverAlert = 0;
  -[IPCServer setState:withReason:](self, "setState:withReason:", 2, 1);
  self->_waitingForDistanceAndTimeToManeuver = 0;
  -[IPCServer setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0);
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)setETA:(id)a3
{
  -[IPCServer set_latestETA:](self, "set_latestETA:", a3);
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
}

- (void)_setTimeToManeuver:(double)a3 distanceToManeuver:(double)a4 forStep:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a5;
  -[IPCServer set_timeToManeuver:](self, "set_timeToManeuver:", a3);
  -[IPCServer set_distanceToManeuver:](self, "set_distanceToManeuver:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentsForContext:", 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForDistance:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mkServerFormattedString"));
  -[IPCServer setDistanceText:](self, "setDistanceText:", v10);

  self->_waitingForDistanceAndTimeToManeuver = 0;
}

- (void)_sceneDidActivate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC _sceneDidActivate: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)_sceneWillConnect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if (self->_pendingLoadDirectionsMessage)
  {
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Scene connected while waiting for scene, check now"), v2, v3, v4, v5, v6, v7, v9);
    -[IPCServer _checkKeySceneInternal](self, "_checkKeySceneInternal");
  }
}

- (void)_noteGuidanceStateChanged
{
  -[IPCServer setNeedsGuidanceUpdate:](self, "setNeedsGuidanceUpdate:", 1);
}

- (void)_pushGuidanceState
{
  -[IPCServer _pushGuidanceStateIfChangedWithVibration:](self, "_pushGuidanceStateIfChangedWithVibration:", 0);
}

- (void)_pushGuidanceStateIfChangedWithVibration:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (!self->_waitingForDistanceAndTimeToManeuver)
  {
    if (-[IPCServer needsGuidanceUpdate](self, "needsGuidanceUpdate"))
    {
      -[IPCServer setNeedsGuidanceUpdate:](self, "setNeedsGuidanceUpdate:", 0);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100322ACC;
      v5[3] = &unk_1011ACE58;
      v5[4] = self;
      v6 = a3;
      -[IPCServer checkNotificationSettingsAndPerformBlock:](self, "checkNotificationSettingsAndPerformBlock:", v5);
    }
  }
}

- (void)_sendWeakLocationNotificationIfNeededWithGuidanceState:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (!self->_shownWeakLocationAlert && self->_hasPendingWeakLocationAlert)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "showInMainScreen");
    v5 = v7;
    if (v6)
    {
      self->_shownWeakLocationAlert = 1;
      -[IPCServer _postWeakLocationNotification](self, "_postWeakLocationNotification");
      v5 = v7;
    }
  }

}

- (void)_postWeakLocationNotification
{
  void *v2;
  void *v3;
  void *v4;
  UNMutableNotificationContent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  const __CFString *v20;
  const __CFString *v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v21 = CFSTR("MapsWeakLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v2, "removePendingNotificationRequestsWithIdentifiers:", v3);

  v20 = CFSTR("MapsWeakLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v2, "removeDeliveredNotificationsWithIdentifiers:", v4);

  v5 = objc_opt_new(UNMutableNotificationContent);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Weak Location] Title"), CFSTR("localized string not found"), 0));
  -[UNMutableNotificationContent setTitle:](v5, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Weak Location] Body"), CFSTR("localized string not found"), 0));
  -[UNMutableNotificationContent setBody:](v5, "setBody:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("MapsWeakLocation"), v5, 0));
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Sending request: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100322DC4;
  v18[3] = &unk_1011B1BE0;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v2, "addNotificationRequest:withCompletionHandler:", v17, v18);

}

- (BOOL)_guidanceAffectsDimming
{
  return -[IPCServer _transportType](self, "_transportType") != 2
      && -[IPCServer _transportType](self, "_transportType") != 1;
}

- (void)set_maneuverID:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  NSUUID *v8;
  NSUUID *maneuverID;
  id v10;

  v4 = a3;
  v5 = self->__maneuverID;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v10 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v10;
    if ((v7 & 1) == 0)
    {
      v8 = (NSUUID *)objc_msgSend(v10, "copy");
      maneuverID = self->__maneuverID;
      self->__maneuverID = v8;

      v6 = (unint64_t)v10;
      self->_hasCheckedNotificationSettingsForManeuver = 0;
    }
  }

}

- (id)_currentGuidanceStateMessageWithGuidanceCausedVibration:(BOOL)a3
{
  _BOOL4 v3;
  IPCGuidanceStateReply *v5;
  int transportType;
  void *v7;
  int AppBooleanValueWithContainer;
  __CFString *v9;
  id v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TransitAlightMessage *v25;
  NSUUID *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  IPCTrafficIncidentAlertMessage *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _UNKNOWN **v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL8 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  _BOOL4 v80;
  _BOOL4 v81;
  uint64_t v82;
  void *v83;
  _BOOL8 v84;
  char v85;
  void *v86;
  id v87;
  unsigned int v88;
  void *v89;
  void *v90;
  id v91;
  _BOOL4 isPersistentDisplay;
  void *v93;
  unsigned __int8 v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v104;
  void *v105;
  void *v106;
  void *v107;
  unsigned int v108;
  int v109;
  unint64_t v110;
  void *v111;
  void *v112;

  v3 = a3;
  v5 = objc_alloc_init(IPCGuidanceStateReply);
  -[IPCGuidanceStateReply setGuidanceState:](v5, "setGuidanceState:", -[IPCServer state](self, "state"));
  -[IPCGuidanceStateReply setAffectsDimming:](v5, "setAffectsDimming:", -[IPCServer _guidanceAffectsDimming](self, "_guidanceAffectsDimming") | v3);
  -[IPCGuidanceStateReply setTransportType:](v5, "setTransportType:", self->_transportType);
  transportType = self->_transportType;
  if (qword_1014D2118 != -1)
    dispatch_once(&qword_1014D2118, &stru_1011B1CD8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2110, "path"));
  AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer(CFSTR("VoiceIsMute"), CFSTR("com.apple.Maps"), v7, 0);

  v9 = CFSTR("Off Volume");
  if (AppBooleanValueWithContainer != 1)
  {
    if (qword_1014D2118 != -1)
      dispatch_once(&qword_1014D2118, &stru_1011B1CD8);
    v10 = (id)qword_1014D2110;
    if (transportType == 2)
    {
      v11 = MNHeadphonesAreInUse();
      v12 = CFSTR("VoiceVolumeForWalkingWithoutHeadphonesContext");
      if (v11)
        v12 = CFSTR("VoiceVolumeForWalkingWithHeadphonesContext");
      v13 = v12;
    }
    else
    {
      v13 = CFSTR("VoiceVolumeForDrivingContext");
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v15 = _CFPreferencesCopyAppValueWithContainer(v13, CFSTR("com.apple.Maps"), v14);

    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = CFSTR("Normal Volume");
    if (!v15 && transportType == 2)
    {
      if (MNHeadphonesAreInUse())
        v17 = CFSTR("Normal Volume");
      else
        v17 = CFSTR("Off Volume");
      v16 = v17;
    }

    v9 = (__CFString *)v16;
  }
  -[IPCGuidanceStateReply setNavVolumeSetting:](v5, "setNavVolumeSetting:", v9);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer lastSceneDeactivationTime](self, "lastSceneDeactivationTime"));
  -[IPCGuidanceStateReply setLastSceneDeactivationTime:](v5, "setLastSceneDeactivationTime:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentResponse"));
  if (objc_msgSend(v20, "hasSessionState"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sessionState"));
    -[IPCGuidanceStateReply setNavSessionData:](v5, "setNavSessionData:", v21);

  }
  v106 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "route"));
  -[IPCGuidanceStateReply setCurrentLegIndex:](v5, "setCurrentLegIndex:", objc_msgSend(v22, "legIndexForStepIndex:", objc_msgSend(v19, "stepIndex")));
  v105 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "legs"));
  -[IPCGuidanceStateReply setNumberOfLegs:](v5, "setNumberOfLegs:", objc_msgSend(v23, "count"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "arrivalInfo"));
  -[IPCGuidanceStateReply setArrivalInfo:](v5, "setArrivalInfo:", v24);

  if (self->_hasPendingAlight)
  {
    v25 = objc_opt_new(TransitAlightMessage);
    v26 = objc_opt_new(NSUUID);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v26, "UUIDString"));
    -[TransitAlightMessage setIdentifier:](v25, "setIdentifier:", v27);

    -[TransitAlightMessage setStopIndex:](v25, "setStopIndex:", -[MNTransitAlert stopIndex](self->_alightAlert, "stopIndex"));
    -[TransitAlightMessage setStepIndex:](v25, "setStepIndex:", -[MNTransitAlert stepIndex](self->_alightAlert, "stepIndex"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitAlert artwork](self->_alightAlert, "artwork"));
    -[TransitAlightMessage setArtwork:](v25, "setArtwork:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitAlert primaryString](self->_alightAlert, "primaryString"));
    -[TransitAlightMessage setTitle:](v25, "setTitle:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitAlert secondaryString](self->_alightAlert, "secondaryString"));
    -[TransitAlightMessage setDetail:](v25, "setDetail:", v30);

    -[IPCGuidanceStateReply setAlightMessage:](v5, "setAlightMessage:", v25);
    -[IPCGuidanceStateReply setAffectsDimming:](v5, "setAffectsDimming:", 1);
    self->_hasPendingAlight = 0;

  }
  if (self->_trafficIncidentAlert)
  {
    v31 = objc_alloc_init(IPCTrafficIncidentAlertMessage);
    -[IPCTrafficIncidentAlertMessage setType:](v31, "setType:", -[MNTrafficIncidentAlert alertType](self->_trafficIncidentAlert, "alertType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertTitles](self->_trafficIncidentAlert, "alertTitles"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
    -[IPCTrafficIncidentAlertMessage setTitle:](v31, "setTitle:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertDescriptions](self->_trafficIncidentAlert, "alertDescriptions"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstObject"));
    -[IPCTrafficIncidentAlertMessage setSubtitle:](v31, "setSubtitle:", v35);

    v36 = objc_alloc((Class)NSUUID);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertID](self->_trafficIncidentAlert, "alertID")));
    v38 = objc_msgSend(v36, "initWithUUIDBytes:", objc_msgSend(v37, "bytes"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));
    -[IPCTrafficIncidentAlertMessage setIdentifier:](v31, "setIdentifier:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert incident](self->_trafficIncidentAlert, "incident"));
    -[IPCTrafficIncidentAlertMessage setIncident:](v31, "setIncident:", v40);

    -[IPCGuidanceStateReply setTrafficIncidentAlert:](v5, "setTrafficIncidentAlert:", v31);
  }
  -[IPCGuidanceStateReply setIsRerouting:](v5, "setIsRerouting:", self->_isRerouting);
  switch(-[IPCServer state](self, "state"))
  {
    case 1uLL:
      -[IPCGuidanceStateReply setManeuver:](v5, "setManeuver:", -[IPCServer _maneuver](self, "_maneuver"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _maneuverID](self, "_maneuverID"));
      -[IPCGuidanceStateReply setManeuverID:](v5, "setManeuverID:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Arrived [Driving/Walking Navigation]"), CFSTR("localized string not found"), 0));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "mkServerFormattedString"));
      v111 = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v111, 1));
      -[IPCGuidanceStateReply setPrimaryInstructions:](v5, "setPrimaryInstructions:", v45);

      break;
    case 2uLL:
      v46 = MKPlaceCollectionsLogicController_ptr;
      goto LABEL_32;
    case 3uLL:
      v46 = MKPlaceCollectionsLogicController_ptr;
      -[IPCServer _distanceToRoute](self, "_distanceToRoute");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[IPCGuidanceStateReply setDistance:](v5, "setDistance:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer distanceText](self, "distanceText"));
      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer distanceText](self, "distanceText"));
        v112 = v49;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v112, 1));

        -[IPCGuidanceStateReply setPrimaryInstructions:](v5, "setPrimaryInstructions:", v50);
      }
LABEL_32:
      v51 = v46[370];
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _latestETA](self, "_latestETA"));
      objc_msgSend(v52, "remainingDistance");
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "numberWithDouble:"));
      -[IPCGuidanceStateReply setRemainingDistanceOnRoute:](v5, "setRemainingDistanceOnRoute:", v53);

      v54 = v46[370];
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _latestETA](self, "_latestETA"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v55, "remainingMinutes")));
      -[IPCGuidanceStateReply setRemainingMinutesOnRoute:](v5, "setRemainingMinutesOnRoute:", v56);

      -[IPCGuidanceStateReply setIsAlerting:](v5, "setIsAlerting:", 1);
      break;
    case 4uLL:
      -[IPCGuidanceStateReply setManeuver:](v5, "setManeuver:", -[IPCServer _maneuver](self, "_maneuver"));
      -[IPCGuidanceStateReply setDrivingSide:](v5, "setDrivingSide:", -[IPCServer _drivingSide](self, "_drivingSide"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer junction](self, "junction"));
      -[IPCGuidanceStateReply setJunction:](v5, "setJunction:", v57);

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer artworkOverride](self, "artworkOverride"));
      -[IPCGuidanceStateReply setArtworkOverride:](v5, "setArtworkOverride:", v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer maneuverInstructions](self, "maneuverInstructions"));
      -[IPCGuidanceStateReply setPrimaryInstructions:](v5, "setPrimaryInstructions:", v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer secondaryManeuverInstructions](self, "secondaryManeuverInstructions"));
      -[IPCGuidanceStateReply setSecondaryInstructions:](v5, "setSecondaryInstructions:", v60);

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _maneuverID](self, "_maneuverID"));
      -[IPCGuidanceStateReply setManeuverID:](v5, "setManeuverID:", v61);

      -[IPCServer _distanceToManeuver](self, "_distanceToManeuver");
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[IPCGuidanceStateReply setDistance:](v5, "setDistance:", v62);

      -[IPCServer _timeToManeuver](self, "_timeToManeuver");
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[IPCGuidanceStateReply setTimeToNextManeuver:](v5, "setTimeToNextManeuver:", v63);

      v64 = self->_spokenEventProcessing || self->_isStickySignal;
      -[IPCGuidanceStateReply setIsAlerting:](v5, "setIsAlerting:", v64);
      -[IPCGuidanceStateReply setCurrentSpokenEventID:](v5, "setCurrentSpokenEventID:", self->_currentSpokenEventID);
      *(_WORD *)&self->_isStickySignal = 0;
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _latestETA](self, "_latestETA"));
      objc_msgSend(v65, "remainingDistance");
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[IPCGuidanceStateReply setRemainingDistanceOnRoute:](v5, "setRemainingDistanceOnRoute:", v66);

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _latestETA](self, "_latestETA"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "remainingMinutes")));
      -[IPCGuidanceStateReply setRemainingMinutesOnRoute:](v5, "setRemainingMinutesOnRoute:", v68);

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer shieldInfo](self, "shieldInfo"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[IPCShieldInfoMessage ipcMessageForShieldInfo:](IPCShieldInfoMessage, "ipcMessageForShieldInfo:", v69));
      -[IPCGuidanceStateReply setShieldInfo:](v5, "setShieldInfo:", v70);

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer laneGuidanceInfo](self, "laneGuidanceInfo"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[IPCLaneGuidanceInfoReply ipcReplyForLaneGuidanceInfo:](IPCLaneGuidanceInfoReply, "ipcReplyForLaneGuidanceInfo:", v71));
      -[IPCGuidanceStateReply setLaneGuidanceInfo:](v5, "setLaneGuidanceInfo:", v72);

      break;
    default:
      break;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer notificationSettings](self, "notificationSettings"));
  v74 = objc_msgSend(v73, "authorizationStatus");
  v75 = objc_msgSend(v73, "alertSetting");
  v76 = objc_msgSend(v73, "carPlaySetting");
  v77 = -[IPCServer state](self, "state");
  v110 = -[IPCServer state](self, "state");
  v78 = objc_msgSend(v19, "isInNavigatingState");
  if (-[IPCServer etaOnlyNavMode](self, "etaOnlyNavMode"))
    v79 = 0;
  else
    v79 = v78 & ~-[IPCServer routePreviewGuidanceNavMode](self, "routePreviewGuidanceNavMode");
  v104 = v78;
  if (!v110 && -[IPCServer _transportType](self, "_transportType") != 1)
    v79 = 0;
  v80 = v74 == (id)2;
  v81 = v75 != (id)1 && v74 == (id)2;
  v96 = v76 == (id)1;
  v82 = v81 & v79;
  if (v96)
    v80 = 0;
  v109 = v80 & v79;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](v5, "alightMessage"));

  v84 = -[IPCServer _isMapsForegroundOnMainWindow](self, "_isMapsForegroundOnMainWindow");
  v108 = -[IPCServer _isMapsForegroundOnCarPlay](self, "_isMapsForegroundOnCarPlay");
  v85 = !v84;
  if (v83)
    v85 = 1;
  v107 = v19;
  if ((_DWORD)v82 == 1 && (v85 & 1) != 0)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    -[IPCGuidanceStateReply setShowInMainScreen:](v5, "setShowInMainScreen:", objc_msgSend(v86, "isCurrentlyConnectedToCarAppScene") ^ 1);

  }
  else
  {
    v87 = -[IPCGuidanceStateReply setShowInMainScreen:](v5, "setShowInMainScreen:", 0);
  }
  if (SBUIIsSystemApertureEnabled(v87))
    -[IPCGuidanceStateReply setShowInMainScreen:](v5, "setShowInMainScreen:", v79);
  -[IPCGuidanceStateReply setIsMapsForegroundOnMainScreen:](v5, "setIsMapsForegroundOnMainScreen:", v84);
  v88 = -[IPCServer _isMapsForegroundOnlyOnHybridIC](self, "_isMapsForegroundOnlyOnHybridIC");
  if (!v109)
    goto LABEL_62;
  if (!v108)
    goto LABEL_60;
  if (!v88)
  {
LABEL_62:
    -[IPCGuidanceStateReply setShowInCarPlay:](v5, "setShowInCarPlay:", 0);
    goto LABEL_65;
  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficIncidentAlert](v5, "trafficIncidentAlert"));
  if (!v77)
  {
    -[IPCGuidanceStateReply setShowInCarPlay:](v5, "setShowInCarPlay:", 0);
    goto LABEL_64;
  }
LABEL_60:
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarPlayExternalDeviceMonitor sharedInstance](MapsCarPlayExternalDeviceMonitor, "sharedInstance"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "carPlayExternalDevice"));
  -[IPCGuidanceStateReply setShowInCarPlay:](v5, "setShowInCarPlay:", v90 != 0);

  if (v108)
LABEL_64:

LABEL_65:
  v91 = objc_msgSend(v73, "alertStyle");
  isPersistentDisplay = self->_isPersistentDisplay;
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v94 = objc_msgSend(v93, "BOOLForKey:", CFSTR("__internal_MapsDebugForceStickyBanners"));

  if ((v94 & 1) != 0)
  {
    v95 = 1;
  }
  else
  {
    v96 = v91 != (id)2 || !isPersistentDisplay;
    v95 = !v96;
  }
  -[IPCGuidanceStateReply setIsSticky:](v5, "setIsSticky:", v95);
  -[IPCGuidanceStateReply setIsNavigating:](v5, "setIsNavigating:", v104);
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC allowBannersOnPhone: %d, allowBannersOnCarplay: %d due to notificationsAllowed: %d, bannerNotificationsAllowed: %d, hasIPCState:%d, isDriving: %d, isFullGuidanceNavigation: %d; stickyBannersAllowed: %d, bannerShouldStick: %d isMapsForegroundOnMainWindow: %d isMapsForegroundOnCarPlay: %d hasAlightMessage: %d"),
    v97,
    v98,
    v99,
    v100,
    v101,
    v102,
    v82);

  return v5;
}

- (void)_startWaitingToSendResponse
{
  NSTimer *v3;
  NSTimer *waitingToRespondToMessageTimer;

  -[NSTimer invalidate](self->_waitingToRespondToMessageTimer, "invalidate");
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_timedOutWaitingToSendResponse", 0, 0, 60.0));
  waitingToRespondToMessageTimer = self->_waitingToRespondToMessageTimer;
  self->_waitingToRespondToMessageTimer = v3;

}

- (void)_timedOutWaitingToSendResponse
{
  NSTimer *waitingToRespondToMessageTimer;
  void *v4;
  CLInUseAssertion *coreLocationInUseAssertion;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  IPCLoadDirectionsReply *v10;
  IPCNavigationActionReply *v11;

  -[NSTimer invalidate](self->_waitingToRespondToMessageTimer, "invalidate");
  waitingToRespondToMessageTimer = self->_waitingToRespondToMessageTimer;
  self->_waitingToRespondToMessageTimer = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer loadDirectionsDelayedReply](self, "loadDirectionsDelayedReply"));
  if (v4)
  {
    -[CLInUseAssertion invalidate](self->_coreLocationInUseAssertion, "invalidate");
    coreLocationInUseAssertion = self->_coreLocationInUseAssertion;
    self->_coreLocationInUseAssertion = 0;

    v10 = objc_alloc_init(IPCLoadDirectionsReply);
    -[IPCLoadDirectionsReply setNavigationState:](v10, "setNavigationState:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 4610, 0));
    -[IPCLoadDirectionsReply setError:](v10, "setError:", v6);

    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IPCServer loadDirectionsDelayedReply](self, "loadDirectionsDelayedReply"));
    ((void (**)(_QWORD, IPCLoadDirectionsReply *))v7)[2](v7, v10);

    -[IPCServer setLoadDirectionsDelayedReply:](self, "setLoadDirectionsDelayedReply:", 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer startNavigationDelayedReply](self, "startNavigationDelayedReply"));

    if (v8)
    {
      v11 = objc_alloc_init(IPCNavigationActionReply);
      -[IPCNavigationActionReply setSuccess:](v11, "setSuccess:", 0);
      -[IPCNavigationActionReply setNavigationActionError:](v11, "setNavigationActionError:", 3);
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IPCServer startNavigationDelayedReply](self, "startNavigationDelayedReply"));
      ((void (**)(_QWORD, IPCNavigationActionReply *))v9)[2](v9, v11);

      -[IPCServer setStartNavigationDelayedReply:](self, "setStartNavigationDelayedReply:", 0);
    }
  }
}

- (unint64_t)_maximumScenePollCount
{
  unsigned int v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = -[IPCLoadDirectionsMessage originIsWatch](self->_pendingLoadDirectionsMessage, "originIsWatch");
  if (v2)
    v3 = &MapsConfig_IPCServerWatchPollCount;
  else
    v3 = &MapsConfig_IPCServerSiriPollCount;
  v4 = &off_1014B4EA8;
  if (!v2)
    v4 = &off_1014B4E98;
  return GEOConfigGetUInteger(*v3, *v4);
}

- (void)_startWaitingToHandleMessage:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSTimer *v11;
  NSTimer *waitingForKeyScenePollTimer;
  id v13;

  objc_storeStrong((id *)&self->_pendingLoadDirectionsMessage, a3);
  v13 = a3;
  self->_keyScenePollCount = 0;
  -[NSTimer invalidate](self->_waitingForKeyScenePollTimer, "invalidate");
  -[IPCServer _maximumScenePollCount](self, "_maximumScenePollCount");
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Start waiting for a scene to service message, will poll every %#.1lfs up to %lu times"), v5, v6, v7, v8, v9, v10, 0x3FB999999999999ALL);
  v11 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_checkKeyOrApplicationScene", 0, 1, 0.1));
  waitingForKeyScenePollTimer = self->_waitingForKeyScenePollTimer;
  self->_waitingForKeyScenePollTimer = v11;

}

- (void)_checkKeyOrApplicationScene
{
  ++self->_keyScenePollCount;
  -[IPCServer _checkKeySceneInternal](self, "_checkKeySceneInternal");
}

- (void)_checkKeySceneInternal
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t keyScenePollCount;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSTimer *waitingForKeyScenePollTimer;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  IPCLoadDirectionsMessage *pendingLoadDirectionsMessage;
  uint64_t v28;
  id v29;

  v29 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_applicationScenes](UIApplication, "_maps_applicationScenes"));
  if (v29)
  {
    v4 = v29;
  }
  else
  {
    if (!objc_msgSend(v3, "count"))
    {
      keyScenePollCount = self->_keyScenePollCount;
      if (keyScenePollCount <= -[IPCServer _maximumScenePollCount](self, "_maximumScenePollCount"))
      {
        sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Waiting for key scene to connect... %lu"), v12, v13, v14, v15, v16, v17, self->_keyScenePollCount);
        goto LABEL_12;
      }
    }
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  }
  v18 = v4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Ready-or-not sending pending directions message to %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  self->_keyScenePollCount = 0;
  -[NSTimer invalidate](self->_waitingForKeyScenePollTimer, "invalidate");
  waitingForKeyScenePollTimer = self->_waitingForKeyScenePollTimer;
  self->_waitingForKeyScenePollTimer = 0;

  if (self->_pendingLoadDirectionsMessage)
  {
    if (v18)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer backgroundNavigationDelegate](self, "backgroundNavigationDelegate"));
      objc_msgSend(v26, "prepareBackgroundNavigationWithMessage:", self->_pendingLoadDirectionsMessage);

    }
    else
    {
      sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Cancelling prepareBackgroundNavigation, no scene available"), v20, v21, v22, v23, v24, v25, v28);
      -[IPCServer navigationStateDidChangeTo:reason:](self, "navigationStateDidChangeTo:reason:", 2, CFSTR("Couldn't service request to start navigation."));
    }
    pendingLoadDirectionsMessage = self->_pendingLoadDirectionsMessage;
    self->_pendingLoadDirectionsMessage = 0;

  }
LABEL_12:

}

- (void)setNeedsToDisplaySafetyWarning
{
  self->_pendingSafetyWarning = 1;
}

- (void)navigationStateDidChangeTo:(unint64_t)a3 reason:(id)a4
{
  -[IPCServer navigationStateDidChangeTo:reason:error:](self, "navigationStateDidChangeTo:reason:error:", a3, a4, 0);
}

- (void)navigationStateDidChangeTo:(unint64_t)a3 reason:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  NSTimer *waitingToRespondToMessageTimer;
  CLInUseAssertion *coreLocationInUseAssertion;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  IPCLoadDirectionsReply *v34;
  CLInUseAssertion *v35;
  void *v36;
  IPCNavigationActionReply *v37;
  void (**v38)(_QWORD, _QWORD);
  void (**v39)(_QWORD, _QWORD);
  CLInUseAssertion *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD block[5];
  id v44;
  id v45;
  unint64_t v46;

  v8 = a4;
  v9 = a5;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (a3 >= 5)
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("?? - %lu"), a3));
    else
      v16 = off_1011B1D28[a3];
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Received a navigation state change to %@ for reason %@."), v10, v11, v12, v13, v14, v15, (uint64_t)v16);

    -[NSTimer invalidate](self->_waitingToRespondToMessageTimer, "invalidate");
    waitingToRespondToMessageTimer = self->_waitingToRespondToMessageTimer;
    self->_waitingToRespondToMessageTimer = 0;

    if (a3)
    {
      -[CLInUseAssertion invalidate](self->_coreLocationInUseAssertion, "invalidate");
      coreLocationInUseAssertion = self->_coreLocationInUseAssertion;
      self->_coreLocationInUseAssertion = 0;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer loadDirectionsDelayedReply](self, "loadDirectionsDelayedReply"));
    if (v19)
    {

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer startNavigationDelayedReply](self, "startNavigationDelayedReply"));

      if (!v26)
      {
        sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Siri/Watch is NOT waiting for us."), v20, v21, v22, v23, v24, v25, v41);
        goto LABEL_25;
      }
    }
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Siri/Watch was waiting for us."), v20, v21, v22, v23, v24, v25, v41);
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Sending reply so Siri/Watch can handle the change."), v27, v28, v29, v30, v31, v32, v42);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer loadDirectionsDelayedReply](self, "loadDirectionsDelayedReply"));

    if (v33)
    {
      v34 = objc_alloc_init(IPCLoadDirectionsReply);
      -[IPCLoadDirectionsReply setNavigationState:](v34, "setNavigationState:", a3);
      -[IPCLoadDirectionsReply setError:](v34, "setError:", v9);
      if (a3)
      {
        -[CLInUseAssertion invalidate](self->_coreLocationInUseAssertion, "invalidate");
        v35 = self->_coreLocationInUseAssertion;
        self->_coreLocationInUseAssertion = 0;

      }
      else if (self->_pendingSafetyWarning)
      {
        -[IPCLoadDirectionsReply setSafetyWarningType:](v34, "setSafetyWarningType:", 1);
        self->_pendingSafetyWarning = 0;
      }
      v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IPCServer loadDirectionsDelayedReply](self, "loadDirectionsDelayedReply"));
      ((void (**)(_QWORD, IPCLoadDirectionsReply *))v38)[2](v38, v34);

      -[IPCServer setLoadDirectionsDelayedReply:](self, "setLoadDirectionsDelayedReply:", 0);
      goto LABEL_24;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer startNavigationDelayedReply](self, "startNavigationDelayedReply"));

    if (a3 && v36)
    {
      v37 = objc_alloc_init(IPCNavigationActionReply);
      v34 = (IPCLoadDirectionsReply *)v37;
      if (a3 == 1)
      {
        -[IPCNavigationActionReply setSuccess:](v37, "setSuccess:", 1);
      }
      else
      {
        -[IPCNavigationActionReply setSuccess:](v37, "setSuccess:", 0);
        -[IPCLoadDirectionsReply setNavigationActionError:](v34, "setNavigationActionError:", 3);
      }
      v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IPCServer startNavigationDelayedReply](self, "startNavigationDelayedReply"));
      ((void (**)(_QWORD, IPCLoadDirectionsReply *))v39)[2](v39, v34);

      -[IPCServer setStartNavigationDelayedReply:](self, "setStartNavigationDelayedReply:", 0);
      -[CLInUseAssertion invalidate](self->_coreLocationInUseAssertion, "invalidate");
      v40 = self->_coreLocationInUseAssertion;
      self->_coreLocationInUseAssertion = 0;

LABEL_24:
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100324214;
    block[3] = &unk_1011B1C08;
    block[4] = self;
    v46 = a3;
    v44 = v8;
    v45 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
LABEL_25:

}

- (void)_vibrateForRerouteWithService:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[IPCServer setState:withReason:](self, "setState:withReason:", 3, 2);
  self->_waitingForDistanceAndTimeToManeuver = 0;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003242F0;
  v5[3] = &unk_1011AD4F0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "vibrateForPrompt:completion:", 3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7;
  GuidanceETA *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  GuidanceETA *v14;
  GuidanceETA *latestETA;
  id v16;

  v7 = a3;
  v8 = [GuidanceETA alloc];
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayEtaInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remainingDistanceInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "batteryChargeInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "upcomingStop"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timezone"));
  v13 = objc_msgSend(v7, "navigationTransportType");

  v14 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v8, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v16, v9, v10, v12, v13);
  latestETA = self->_latestETA;
  self->_latestETA = v14;

}

- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  void *v8;
  unsigned int v9;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3, a5, a6));
  v9 = objc_msgSend(v8, "navigationState");

  if (v9 != 5)
  {
    self->_lastSeenManeuverAlert = 0;
    -[IPCServer setState:withReason:](self, "setState:withReason:", 3, 3);
    -[IPCServer set_distanceToRoute:](self, "set_distanceToRoute:", a4);
    self->_waitingForDistanceAndTimeToManeuver = 0;
    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "route"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "steps"));
  v12 = objc_msgSend(v11, "count");

  if ((unint64_t)v12 > a6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "route"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "steps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", a6));

    -[IPCServer _setTimeToManeuver:distanceToManeuver:forStep:](self, "_setTimeToManeuver:distanceToManeuver:forStep:", v15, a5, a4);
    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");

  }
}

- (void)navigationService:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged", a3, a4);
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10;
  uint64_t v12;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v10 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a6;
  v25 = a4;
  v15 = a7;
  v16 = sub_10039DCD4(a5, &stru_1011B1C48);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if ((id)-[IPCServer state](self, "state") != (id)4
    || (v18 = objc_msgSend(v25, "maneuverType"), v18 != -[IPCServer _maneuver](self, "_maneuver"))
    || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer secondaryManeuverInstructions](self, "secondaryManeuverInstructions")),
        v20 = objc_msgSend(v19, "isEqualToArray:", v17),
        v19,
        (v20 & 1) == 0))
  {
    -[IPCServer setState:withReason:](self, "setState:withReason:", 4, 4);
    -[IPCServer set_maneuver:](self, "set_maneuver:", objc_msgSend(v25, "maneuverType"));
    if ((objc_msgSend(v25, "hasJunctionType") & 1) != 0)
    {
      v21 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithType:maneuver:drivingSide:elements:count:", objc_msgSend(v25, "junctionType"), objc_msgSend(v25, "maneuverType"), v10, objc_msgSend(v25, "junctionElements"), objc_msgSend(v25, "junctionElementsCount"));
      -[IPCServer setJunction:](self, "setJunction:", v21);

    }
    else
    {
      -[IPCServer setJunction:](self, "setJunction:", 0);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "artworkOverride"));
    -[IPCServer setArtworkOverride:](self, "setArtworkOverride:", v22);

    -[IPCServer set_drivingSide:](self, "set_drivingSide:", v10);
    -[IPCServer setManeuverInstructions:](self, "setManeuverInstructions:", 0);
    -[IPCServer setSecondaryManeuverInstructions:](self, "setSecondaryManeuverInstructions:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[IPCServer set_maneuverID:](self, "set_maneuverID:", v23);

    self->_lastSeenManeuverAlert = 0;
    if ((_DWORD)v12)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v12, 0, v15));
      -[IPCServer setShieldInfo:](self, "setShieldInfo:", v24);

    }
    else
    {
      -[IPCServer setShieldInfo:](self, "setShieldInfo:", 0);
    }
    -[IPCServer set_timeToManeuver:](self, "set_timeToManeuver:", 0.0);
    -[IPCServer set_distanceToManeuver:](self, "set_distanceToManeuver:", 0.0);
    self->_waitingForDistanceAndTimeToManeuver = 1;
    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  }

}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  int v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  v4 = a4;
  v6 = a3;
  v7 = 3;
  v8 = 2;
  if ((unsigned __int16)v4 != 4)
    v8 = 0;
  if ((unsigned __int16)v4 != 5)
    v7 = v8;
  v9 = (unsigned __int16)v4 != 3 && (unsigned __int16)v4 == 5;
  if ((unsigned __int16)v4 == 3)
    v10 = 1;
  else
    v10 = v7;
  v11 = (void *)(v10 | *(_QWORD *)&v4 & 0x10000);
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100324A34;
  v13[3] = &unk_1011B1C70;
  objc_copyWeak(v14, &location);
  v14[1] = v11;
  v12 = objc_retainBlock(v13);
  if (v9
    && LOWORD(self->_lastSeenManeuverAlert) != 3
    && -[IPCServer _transportType](self, "_transportType") == 2
    && -[IPCServer _isInBackground](self, "_isInBackground"))
  {
    objc_msgSend(v6, "vibrateForPrompt:completion:", MNInstructionsShortPromptTypeForManeuver(-[IPCServer _maneuver](self, "_maneuver"), -[IPCServer _drivingSide](self, "_drivingSide")), v12);
  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v12[2])(v12, 0);
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100324BD4;
  v12[3] = &unk_1011AD4F0;
  objc_copyWeak(&v13, &location);
  v9 = objc_retainBlock(v12);
  if (-[IPCServer _transportType](self, "_transportType") == 2 && -[IPCServer _isInBackground](self, "_isInBackground"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100324C38;
    v10[3] = &unk_1011B1B90;
    v11 = v9;
    objc_msgSend(v7, "vibrateForPrompt:completion:", 4, v10);

  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v9[2])(v9, 0);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  if (!a4)
  {
    -[IPCServer setState:withReason:](self, "setState:withReason:", 0, 5);
    self->_lastSeenManeuverAlert = 0;
  }
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  -[IPCServer _receivedTrafficIncidentAlert:](self, "_receivedTrafficIncidentAlert:", a4);
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  -[IPCServer _updatedTrafficIncidentAlert:](self, "_updatedTrafficIncidentAlert:", a4);
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  -[IPCServer _invalidatedTrafficIncidentAlert:](self, "_invalidatedTrafficIncidentAlert:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6;
  unsigned int v8;
  id v9;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v8 = -[IPCServer _transportType](self, "_transportType");
  if ((_DWORD)v6 == 2 && !v8 && -[IPCServer _isInBackground](self, "_isInBackground"))
    objc_msgSend(v9, "vibrateForPrompt:completion:", 5, &stru_1011B1C90);
  -[IPCServer set_transportType:](self, "set_transportType:", v6);

}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  id v9;

  v9 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    -[IPCServer set_transportType:](self, "set_transportType:", objc_msgSend(v9, "desiredTransportType"));
  }
  else if (!a5)
  {
    if (self->_trafficAlertTimer)
      -[IPCServer _removeTrafficIncidentAlertFromTimer:](self, "_removeTrafficIncidentAlertFromTimer:");
    -[IPCServer _showNoGuidance](self, "_showNoGuidance");
  }

}

- (void)navigationServiceWillReroute:(id)a3
{
  self->_isRerouting = 1;
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged", a3);
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  self->_isRerouting = 0;
  -[BannerSource resetExcludingJindo](self->_bannerSource, "resetExcludingJindo", a3, a4, a5);
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  self->_isRerouting = 0;
  -[IPCServer _showNoGuidance](self, "_showNoGuidance", a3);
}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  self->_isRerouting = 0;
  -[IPCServer _showNoGuidance](self, "_showNoGuidance", a3, a4);
}

- (void)navigationService:(id)a3 didFailWithError:(id)a4
{
  id v5;

  v5 = a3;
  -[IPCServer _showNoGuidance](self, "_showNoGuidance");
  if (-[IPCServer _transportType](self, "_transportType") == 2 && (id)-[IPCServer state](self, "state") == (id)2)
    -[IPCServer _vibrateForRerouteWithService:](self, "_vibrateForRerouteWithService:", v5);

}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  id v6;

  v6 = a3;
  if (-[IPCServer _transportType](self, "_transportType") == 2)
  {
    if (a4 == 5)
    {
      -[IPCServer showRecalculating](self, "showRecalculating");
      goto LABEL_8;
    }
    if ((id)-[IPCServer state](self, "state") == (id)2)
      -[IPCServer _vibrateForRerouteWithService:](self, "_vibrateForRerouteWithService:", v6);
  }
  if (!a4)
  {
    -[BannerSource reset](self->_bannerSource, "reset");
    self->_isRerouting = 0;
    *(_WORD *)&self->_shownWeakLocationAlert = 0;
  }
LABEL_8:

}

- (void)navigationService:(id)a3 didChangeGuidanceState:(id)a4
{
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged", a3, a4);
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged", a3, a4);
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;

  v51 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
  if (v5)
  {

    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "secondarySign"));

  if (v6)
  {
LABEL_4:
    v7 = objc_alloc((Class)MKServerFormattedStringParameters);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
    v9 = objc_msgSend(v8, "distanceDetailLevel");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "variableOverrides"));
    v12 = objc_msgSend(v7, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v9, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titles"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10032549C;
    v54[3] = &unk_1011B1CB8;
    v15 = v12;
    v55 = v15;
    v16 = sub_10039DCD4(v14, v54);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "details"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1003254F0;
    v52[3] = &unk_1011B1CB8;
    v20 = v15;
    v53 = v20;
    v21 = sub_10039DCD4(v19, v52);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if ((id)-[IPCServer state](self, "state") != (id)4)
      goto LABEL_13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "junction"));
    v25 = objc_msgSend(v24, "maneuverType");
    if (v25 == -[IPCServer _maneuver](self, "_maneuver"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer maneuverInstructions](self, "maneuverInstructions"));
      if (objc_msgSend(v26, "isEqualToArray:", v17))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer secondaryManeuverInstructions](self, "secondaryManeuverInstructions"));
        if (objc_msgSend(v27, "isEqualToArray:", v22))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[IPCServer _maneuverID](self, "_maneuverID"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "uniqueID"));
          v50 = objc_msgSend(v28, "isEqual:", v29);

          if ((v50 & 1) != 0)
          {
LABEL_17:
            objc_msgSend(v51, "timeUntilPrimarySign_SIRI_USE_ONLY");
            -[IPCServer set_timeToManeuver:](self, "set_timeToManeuver:");
            objc_msgSend(v51, "primaryDistance_SIRI_USE_ONLY");
            -[IPCServer set_distanceToManeuver:](self, "set_distanceToManeuver:");
            self->_waitingForDistanceAndTimeToManeuver = 0;
            -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");

            goto LABEL_18;
          }
LABEL_13:
          -[IPCServer setState:withReason:](self, "setState:withReason:", 4, 4);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "junction"));
          -[IPCServer set_maneuver:](self, "set_maneuver:", objc_msgSend(v31, "maneuverType"));

          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "junction"));
          if (v33)
          {
            v34 = objc_alloc((Class)MKJunction);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "junction"));
            v37 = objc_msgSend(v34, "initWithJunction:", v36);
            -[IPCServer setJunction:](self, "setJunction:", v37);

          }
          else
          {
            -[IPCServer setJunction:](self, "setJunction:", 0);
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "artworkOverride"));
          -[IPCServer setArtworkOverride:](self, "setArtworkOverride:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uniqueID"));
          -[IPCServer set_maneuverID:](self, "set_maneuverID:", v41);

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "junction"));
          -[IPCServer set_drivingSide:](self, "set_drivingSide:", objc_msgSend(v43, "drivingSide"));

          -[IPCServer setManeuverInstructions:](self, "setManeuverInstructions:", v17);
          -[IPCServer setSecondaryManeuverInstructions:](self, "setSecondaryManeuverInstructions:", v22);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "primarySign"));
          v45 = objc_msgSend(v44, "shieldID");
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "shieldStringID"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "shieldText"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v45, v46, v47));
          -[IPCServer setShieldInfo:](self, "setShieldInfo:", v48);

          goto LABEL_17;
        }

      }
    }

    goto LABEL_13;
  }
LABEL_18:

}

- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a4));
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Updated usePersistentDisplay : %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  self->_isPersistentDisplay = a4;
  self->_isStickySignal = a4;
  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v5;
  NavSignLaneGuidanceInfo *v6;

  v5 = a4;
  v6 = -[NavSignLaneGuidanceInfo initWithGuidanceLaneInfo:]([NavSignLaneGuidanceInfo alloc], "initWithGuidanceLaneInfo:", v5);

  -[IPCServer setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", v6);
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  -[IPCServer setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0, a4);
}

- (void)navigationService:(id)a3 willProcessSpeechEvent:(id)a4
{
  NSUUID *v5;
  NSUUID *currentSpokenEventID;

  self->_spokenEventProcessing = 1;
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueID", a3));
  currentSpokenEventID = self->_currentSpokenEventID;
  self->_currentSpokenEventID = v5;

  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 didProcessSpeechEvent:(id)a4
{
  NSUUID *currentSpokenEventID;

  self->_spokenEventProcessing = 0;
  currentSpokenEventID = self->_currentSpokenEventID;
  self->_currentSpokenEventID = 0;

  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 didReceiveTransitAlert:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_storeStrong((id *)&self->_alightAlert, a4);
  v6 = a4;
  self->_hasPendingAlight = 1;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MAPS IPC Enqueued alight alert: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)self->_alightAlert);

  -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
  -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
}

- (void)navigationService:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  void *v6;
  unsigned int v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("NavigationEnableWeakLocationNotification"));

  if (v7)
  {
    self->_hasPendingWeakLocationAlert = a4 == 2;
    -[IPCServer _noteGuidanceStateChanged](self, "_noteGuidanceStateChanged");
    -[IPCServer _pushGuidanceState](self, "_pushGuidanceState");
  }
}

- (int)_drivingSide
{
  return self->_drivingSide;
}

- (void)set_drivingSide:(int)a3
{
  self->_drivingSide = a3;
}

- (int)_maneuver
{
  return self->_maneuver;
}

- (void)set_maneuver:(int)a3
{
  self->_maneuver = a3;
}

- (double)_distanceToManeuver
{
  return self->_distanceToManeuver;
}

- (void)set_distanceToManeuver:(double)a3
{
  self->_distanceToManeuver = a3;
}

- (double)_timeToManeuver
{
  return self->_timeToManeuver;
}

- (void)set_timeToManeuver:(double)a3
{
  self->_timeToManeuver = a3;
}

- (GuidanceETA)_latestETA
{
  return self->_latestETA;
}

- (void)set_latestETA:(id)a3
{
  objc_storeStrong((id *)&self->_latestETA, a3);
}

- (double)_distanceToRoute
{
  return self->_distanceToRoute;
}

- (void)set_distanceToRoute:(double)a3
{
  self->_distanceToRoute = a3;
}

- (int)_transportType
{
  return self->_transportType;
}

- (void)set_transportType:(int)a3
{
  self->_transportType = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (ExternalGuidanceSource)externalGuidanceSource
{
  return (ExternalGuidanceSource *)objc_loadWeakRetained((id *)&self->_externalGuidanceSource);
}

- (void)setExternalGuidanceSource:(id)a3
{
  objc_storeWeak((id *)&self->_externalGuidanceSource, a3);
}

- (BackgroundNavigationDelegate)backgroundNavigationDelegate
{
  return (BackgroundNavigationDelegate *)objc_loadWeakRetained((id *)&self->_backgroundNavigationDelegate);
}

- (void)setBackgroundNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundNavigationDelegate, a3);
}

- (BOOL)etaOnlyNavMode
{
  return self->_etaOnlyNavMode;
}

- (void)setEtaOnlyNavMode:(BOOL)a3
{
  self->_etaOnlyNavMode = a3;
}

- (BOOL)routePreviewGuidanceNavMode
{
  return self->_routePreviewGuidanceNavMode;
}

- (void)setRoutePreviewGuidanceNavMode:(BOOL)a3
{
  self->_routePreviewGuidanceNavMode = a3;
}

- (VirtualGarageSource)virtualGarageSource
{
  return (VirtualGarageSource *)objc_loadWeakRetained((id *)&self->_virtualGarageSource);
}

- (void)setVirtualGarageSource:(id)a3
{
  objc_storeWeak((id *)&self->_virtualGarageSource, a3);
}

- (NSXPCListenerEndpoint)siriPluginListenerEndpoint
{
  return self->_siriPluginListenerEndpoint;
}

- (NSXPCListenerEndpoint)companionDaemonListenerEndpoint
{
  return self->_companionDaemonListenerEndpoint;
}

- (NSXPCListenerEndpoint)pushDaemonListenerEndpoint
{
  return self->_pushDaemonListenerEndpoint;
}

- (MKJunction)junction
{
  return self->_junction;
}

- (void)setJunction:(id)a3
{
  objc_storeStrong((id *)&self->_junction, a3);
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (MKServerFormattedString)distanceText
{
  return self->_distanceText;
}

- (void)setDistanceText:(id)a3
{
  objc_storeStrong((id *)&self->_distanceText, a3);
}

- (NSArray)maneuverInstructions
{
  return self->_maneuverInstructions;
}

- (void)setManeuverInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)secondaryManeuverInstructions
{
  return self->_secondaryManeuverInstructions;
}

- (void)setSecondaryManeuverInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSUUID)_maneuverID
{
  return self->__maneuverID;
}

- (NavSignShieldInfo)shieldInfo
{
  return self->_shieldInfo;
}

- (void)setShieldInfo:(id)a3
{
  objc_storeStrong((id *)&self->_shieldInfo, a3);
}

- (BOOL)needsGuidanceUpdate
{
  return self->_needsGuidanceUpdate;
}

- (void)setNeedsGuidanceUpdate:(BOOL)a3
{
  self->_needsGuidanceUpdate = a3;
}

- (UNNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSDate)lastSceneDeactivationTime
{
  return self->_lastSceneDeactivationTime;
}

- (void)setLastSceneDeactivationTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSceneDeactivationTime, a3);
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
}

- (id)loadDirectionsDelayedReply
{
  return self->_loadDirectionsDelayedReply;
}

- (void)setLoadDirectionsDelayedReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (id)startNavigationDelayedReply
{
  return self->_startNavigationDelayedReply;
}

- (void)setStartNavigationDelayedReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startNavigationDelayedReply, 0);
  objc_storeStrong(&self->_loadDirectionsDelayedReply, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_lastSceneDeactivationTime, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_shieldInfo, 0);
  objc_storeStrong((id *)&self->__maneuverID, 0);
  objc_storeStrong((id *)&self->_secondaryManeuverInstructions, 0);
  objc_storeStrong((id *)&self->_maneuverInstructions, 0);
  objc_storeStrong((id *)&self->_distanceText, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_pushDaemonListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_companionDaemonListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_siriPluginListenerEndpoint, 0);
  objc_destroyWeak((id *)&self->_virtualGarageSource);
  objc_destroyWeak((id *)&self->_backgroundNavigationDelegate);
  objc_destroyWeak((id *)&self->_externalGuidanceSource);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_alightAlert, 0);
  objc_storeStrong((id *)&self->_pendingLoadDirectionsMessage, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_pushDaemonConnection, 0);
  objc_storeStrong((id *)&self->_companionDaemonConnection, 0);
  objc_storeStrong((id *)&self->_siriPluginConnection, 0);
  objc_storeStrong((id *)&self->_waitingForKeyScenePollTimer, 0);
  objc_storeStrong((id *)&self->_waitingToRespondToMessageTimer, 0);
  objc_storeStrong((id *)&self->_trafficAlertTimer, 0);
  objc_storeStrong((id *)&self->_coreLocationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_currentSpokenEventID, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlert, 0);
}

@end
