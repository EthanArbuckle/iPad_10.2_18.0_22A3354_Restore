@implementation MailScene

- (MFWindow)mf_window
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene delegate](self, "delegate"));
  v3 = objc_opt_class(MailSceneLifecycleController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  else
    v4 = 0;

  return (MFWindow *)v4;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, int);
  void *v15;
  id v16;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene ef_publicDescription](self, "ef_publicDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonBoosterWithDescription:", v6));
  -[MailScene setDaemonBooster:](self, "setDaemonBooster:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
  LODWORD(v5) = objc_msgSend(v8, "isInternal");

  if ((_DWORD)v5)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1000F35B4;
    v15 = &unk_10051E940;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMInternalPreferences observeChangesForPreference:usingBlock:](EMInternalPreferences, "observeChangesForPreference:usingBlock:", 14, &v12));
    -[MailScene setBackgroundMonitorOverrideObservation:](self, "setBackgroundMonitorOverrideObservation:", v9, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiskFreeSpaceMonitor defaultMonitor](MFDiskFreeSpaceMonitor, "defaultMonitor"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_freeDiskSpaceStatusDidChange:", CFSTR("MFDiskFreeSpaceMonitorDidChangeNotification"), v11);

}

- (void)mf_resetPreferredTitle
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailScene mf_window](self, "mf_window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mf_preferredTitle"));
  -[MailScene setTitle:](self, "setTitle:", v4);

}

- (BOOL)isInExpandedEnvironment
{
  void *v3;
  unsigned int v4;

  if (-[MailScene conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___SplitLayoutCapable))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene splitViewController](self, "splitViewController"));
    v4 = objc_msgSend(v3, "isCollapsed") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (EMDaemonInterface)daemonInterface
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "daemonInterface"));

  return (EMDaemonInterface *)v3;
}

- (void)setDaemonBooster:(id)a3
{
  objc_storeStrong((id *)&self->_daemonBooster, a3);
}

- (void)mailSceneWillEnterForeground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  -[MailScene endBackgroundMonitoring](self, "endBackgroundMonitoring");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonBooster](self, "daemonBooster"));

  if (!v3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene ef_publicDescription](self, "ef_publicDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonBoosterWithDescription:", v5));
    -[MailScene setDaemonBooster:](self, "setDaemonBooster:", v6);

  }
  -[MailScene mf_resetPreferredTitle](self, "mf_resetPreferredTitle");
  if (_os_feature_enabled_impl("Mail", "AppStoreReviewPrompt"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v7 = objc_msgSend(v9, "afterDelay:performBlock:", &stru_10051E960, 1.0);

  }
}

- (UIAlertController)lowDiskAlertController
{
  return self->_lowDiskAlertController;
}

- (void)endBackgroundMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene backgroundMonitors](self, "backgroundMonitors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene backgroundMonitors](self, "backgroundMonitors"));
  objc_msgSend(v5, "removeAllObjects");

  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping background monitors...", buf, 2u);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v16;
      *(_QWORD *)&v9 = 138543362;
      v14 = v9;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
          v13 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log", v14, (_QWORD)v15));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v14;
            v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Stopping monitor: %{public}@", buf, 0xCu);
          }

          objc_msgSend(v12, "endMonitoring");
          v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }

  }
}

- (NSString)ef_publicDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene session](self, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v3, v5));

  return (NSString *)v6;
}

- (EMDaemonBooster)daemonBooster
{
  return self->_daemonBooster;
}

- (NSMutableSet)backgroundMonitors
{
  NSMutableSet *backgroundMonitors;
  NSMutableSet *v4;
  NSMutableSet *v5;

  backgroundMonitors = self->_backgroundMonitors;
  if (!backgroundMonitors)
  {
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5 = self->_backgroundMonitors;
    self->_backgroundMonitors = v4;

    backgroundMonitors = self->_backgroundMonitors;
  }
  return backgroundMonitors;
}

- (void)mailSceneDidBecomeActive
{
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiskFreeSpaceMonitor defaultMonitor](MFDiskFreeSpaceMonitor, "defaultMonitor"));
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003BDC0;
    v3[3] = &unk_10051D4B8;
    v3[4] = a1;
    objc_msgSend(v2, "getFreeSpaceStatusWithCompletionHandler:", v3);

  }
}

+ (NSArray)menuCommands
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;

  v2 = (void *)qword_1005A9DC0;
  if (!qword_1005A9DC0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMenuCommand shortcutWithInput:flags:repeatable:menu:action:](MFMailMenuCommand, "shortcutWithInput:flags:repeatable:menu:action:", UIKeyInputEscape, 0, 0, 0, "_escapeShortcutInvoked:"));
    v7 = v3;
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    v5 = (void *)qword_1005A9DC0;
    qword_1005A9DC0 = v4;

    v2 = (void *)qword_1005A9DC0;
  }
  return (NSArray *)v2;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C740;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9DB8 != -1)
    dispatch_once(&qword_1005A9DB8, block);
  return (OS_os_log *)(id)qword_1005A9DB0;
}

- (void)mailSceneDidDisconnect
{
  -[MailScene setDaemonBooster:](self, "setDaemonBooster:", 0);
}

- (void)mailSceneDidEnterBackground
{
  -[MailScene beginBackgroundMonitoring](self, "beginBackgroundMonitoring");
  -[MailScene setDaemonBooster:](self, "setDaemonBooster:", 0);
}

- (void)mailSceneWillResignActive
{
  id v2;

  if (-[MailScene shouldUpdateWidgetWhenSceneResignsActive](self, "shouldUpdateWidgetWhenSceneResignsActive"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[MFWidgetController sharedController](MFWidgetController, "sharedController"));
    objc_msgSend(v2, "reloadTimelinesWithReason:", CFSTR("appBackgrounded"));

  }
}

+ (BOOL)wantsDeferredConnectionActions
{
  return 0;
}

- (MailExtendedLaunchTracker)extendedLaunchTracker
{
  return 0;
}

- (MFMailboxProvider)mailboxProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mailboxProvider"));

  return (MFMailboxProvider *)v3;
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "brandIndicatorProvider"));

  return (MUIBrandIndicatorProvider *)v3;
}

- (MFMailAssetViewerManager)assetViewerManager
{
  MFMailAssetViewerManager *assetViewerManager;

  assetViewerManager = self->_assetViewerManager;
  self->_assetViewerManager = 0;

  return self->_assetViewerManager;
}

- (MFAlertOverlayController)alertOverlayController
{
  MFAlertOverlayController *alertOverlayController;
  MFAlertOverlayController *v4;
  MFAlertOverlayController *v5;

  alertOverlayController = self->_alertOverlayController;
  if (!alertOverlayController)
  {
    v4 = (MFAlertOverlayController *)objc_msgSend(objc_alloc((Class)MFAlertOverlayController), "initWithWindowScene:", self);
    v5 = self->_alertOverlayController;
    self->_alertOverlayController = v4;

    alertOverlayController = self->_alertOverlayController;
  }
  return alertOverlayController;
}

- (BOOL)shouldUpdateWidgetWhenSceneResignsActive
{
  return 0;
}

- (void)_switchToComposeSceneWithContext:(id)a3 modifiedContentsURL:(id)a4 isReply:(BOOL)a5 composeType:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _BYTE v37[24];
  uint64_t v38;
  uint64_t v39;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc((Class)NSMutableDictionary);
  v38 = MSMailActivityHandoffTypeKey;
  v39 = MSMailActivityHandoffTypeComposeSansStreams;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  v14 = objc_msgSend(v12, "initWithDictionary:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subject"));
  if (v15
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageObjectID")),
        v17 = v16 != 0,
        v16,
        v15,
        v7 && v17))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, MSMailActivityHandoffComposeKeyComposeType);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageObjectID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "serializedRepresentation"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, MSMailActivityHandoffComposeKeyMessageObjectIDRepresentation);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subject"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, MSMailActivityHandoffComposeKeySubject);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "senderDisplayName"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, MSMailQuickLookActivityKeySenderDisplayName);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mailboxObjectID"));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mailboxObjectID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "serializedRepresentation"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, MSMailActivityHandoffComposeKeyMailboxObjectIDRepresentation);

    }
  }
  else
  {
    if (v7)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_100392A90();

    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_100541740, MSMailActivityHandoffComposeKeyComposeType);
  }
  if (v11)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v36 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mf_copyFileAtURLToContainer:securityScoped:preferredFileName:error:", v11, 1, 0, &v36));
    v29 = v36;

    if (v28)
    {
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "absoluteString"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v30, MSMailQuickLookActivityKeyContentURL);
    }
    else
    {
      v30 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v29, "ef_publicDescription"));
        sub_100392A4C(v31, (uint64_t)v37, v30);
      }
    }

  }
  else
  {
    v29 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_100392A20();
  }

  v32 = objc_alloc_init((Class)UIWindowSceneActivationRequestOptions);
  objc_msgSend(v32, "setRequestingScene:", self);
  objc_msgSend(v32, "setPreferredPresentationStyle:", 2);
  v33 = objc_alloc((Class)NSUserActivity);
  v34 = objc_msgSend(v33, "initWithActivityType:", MSMailActivityHandoffTypeComposeWithStreams);
  objc_msgSend(v34, "setUserInfo:", v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v35, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v34, v32, 0);

}

- (void)mailSceneOpenURLContexts:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anyObject"));
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene urlRouter](self, "urlRouter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest externalRequestWithOpenURLContext:](MFURLRoutingRequest, "externalRequestWithOpenURLContext:", v6));
    objc_msgSend(v4, "routeRequest:", v5);

  }
}

- (MFURLRouter)urlRouter
{
  MFURLRouter *urlRouter;
  MFURLRouter *v4;
  void *v5;
  MFURLRouter *v6;
  MFURLRouter *v7;

  urlRouter = self->_urlRouter;
  if (!urlRouter)
  {
    v4 = [MFURLRouter alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene _createURLRoutes](self, "_createURLRoutes"));
    v6 = -[MFURLRouter initWithRoutes:](v4, "initWithRoutes:", v5);
    v7 = self->_urlRouter;
    self->_urlRouter = v6;

    -[MFURLRouter setDelegate:](self->_urlRouter, "setDelegate:", self);
    urlRouter = self->_urlRouter;
  }
  return urlRouter;
}

- (id)_createURLRoutes
{
  MFOAuthRedirectURLRoute *v3;
  MFWorkspaceURLRoute *v4;
  MFStoreURLRoute *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[3];

  v3 = objc_alloc_init(MFOAuthRedirectURLRoute);
  v4 = objc_alloc_init(MFWorkspaceURLRoute);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F3FB8;
  v8[3] = &unk_10051E988;
  v8[4] = self;
  v5 = -[MFStoreURLRoute initWithPresenterProvider:]([MFStoreURLRoute alloc], "initWithPresenterProvider:", v8);
  v9[0] = v3;
  v9[1] = v5;
  v9[2] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));

  return v6;
}

- (unint64_t)urlRouter:(id)a3 decidePolicyForRoutingRequest:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  uint64_t v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v6 = objc_msgSend(v5, "mf_isOAuthRedirectURL");

  if ((v6 & 1) != 0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiskFreeSpaceMonitor defaultMonitor](MFDiskFreeSpaceMonitor, "defaultMonitor")),
        v8 = objc_msgSend(v7, "isFreeSpaceCritical"),
        v7,
        !v8))
  {
    v11 = 0;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100392ABC(v10, (uint64_t)&v13, v9);
    }

    v11 = 2;
  }

  return v11;
}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  -[MailScene doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailScene displayError:forAccount:mode:]", "MailScene.m", 265, "0");
}

- (void)mailSceneDebugGesturePerformed
{
  void *v3;
  MFMailDebugMenuController *v4;

  v4 = -[MFMailDebugMenuController initWithScene:]([MFMailDebugMenuController alloc], "initWithScene:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene mf_rootViewController](self, "mf_rootViewController"));
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)closeSceneWithAnimation:(int64_t)a3
{
  -[MailScene closeSceneWithAnimation:errorHandler:](self, "closeSceneWithAnimation:errorHandler:", a3, 0);
}

- (void)closeSceneWithAnimation:(int64_t)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
  objc_msgSend(v6, "setWindowDismissalAnimation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene session](self, "session"));
  objc_msgSend(v7, "requestSceneSessionDestruction:options:errorHandler:", v8, v6, v9);

}

- (id)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v4;
  NSUndoManager *v5;

  undoManager = self->_undoManager;
  if (!undoManager)
  {
    v4 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
    v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (id)undoManagerForWindow:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailScene undoManager](self, "undoManager", a3));
}

- (void)_escapeShortcutInvoked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[MailScene conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___SplitLayoutCapable))
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene splitViewController](self, "splitViewController"));
  else
    v4 = 0;
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

  if (v5)
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)addBackgroundMonitor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    if (-[MailScene allowsBackgroundMonitoring](self, "allowsBackgroundMonitoring"))
    {
      v5 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added background monitor: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene backgroundMonitors](self, "backgroundMonitors"));
      objc_msgSend(v6, "addObject:", v4);

      if (-[MailScene activationState](self, "activationState") == (id)2)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138543362;
          v10 = v4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scene is in the background. Starting monitor immediately: %{public}@", (uint8_t *)&v9, 0xCu);
        }

        objc_msgSend(v4, "beginMonitoringWithHandler:", self);
      }
    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "addBackgroundMonitor called with nil monitor. Ignoring.", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)beginBackgroundMonitoring
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];

  if (-[MailScene allowsBackgroundMonitoring](self, "allowsBackgroundMonitoring"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene backgroundMonitors](self, "backgroundMonitors"));
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting background monitors...", buf, 2u);
      }

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene backgroundMonitors](self, "backgroundMonitors"));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v7)
      {
        v9 = *(_QWORD *)v15;
        *(_QWORD *)&v8 = 138543362;
        v13 = v8;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
            v12 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log", v13));
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              v19 = v11;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting monitor: %{public}@", buf, 0xCu);
            }

            objc_msgSend(v11, "beginMonitoringWithHandler:", self);
            v10 = (char *)v10 + 1;
          }
          while (v7 != v10);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)monitor:(id)a3 requestsAction:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;

  v6 = a3;
  -[MailScene endBackgroundMonitoring](self, "endBackgroundMonitoring");
  if (-[MailScene allowsBackgroundMonitoring](self, "allowsBackgroundMonitoring"))
  {
    if (-[MailScene activationState](self, "activationState") == (id)2)
    {
      if (a4 == 1)
      {
        v9 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v12 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Monitor requested scene session close: %{public}@. Requesting from system now...", buf, 0xCu);
        }

        -[MailScene closeSceneWithAnimation:](self, "closeSceneWithAnimation:", 1);
      }
      else if (!a4)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v12 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Monitor requested scene session refresh: %{public}@. Requesting from system now...", buf, 0xCu);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000F496C;
        block[3] = &unk_10051AA98;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100392B00();

    }
  }

}

- (BOOL)allowsBackgroundMonitoring
{
  void *v2;
  int v3;
  unsigned int v4;
  char v5;
  char v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if ((objc_msgSend(v2, "launchedToTest") & 1) != 0)
    v3 = 1;
  else
    v3 = EFIsRunningUnitTests();

  v4 = +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 14);
  v5 = v3 | v4;
  if ((v3 | v4) == 1)
  {
    v6 = v4;
    v7 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100392B2C(v3, v6, v7);

  }
  return v5 ^ 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a4;
  if ("_escapeShortcutInvoked:" == a3)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if ("undo:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene undoManager](self, "undoManager"));
    v9 = objc_msgSend(v8, "canUndo");
LABEL_8:
    v7 = v9;

    goto LABEL_9;
  }
  if ("redo:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene undoManager](self, "undoManager"));
    v9 = objc_msgSend(v8, "canRedo");
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)MailScene;
  v7 = -[MailScene canPerformAction:withSender:](&v11, "canPerformAction:withSender:", a3, v6);
LABEL_9:

  return v7;
}

- (void)undo:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailScene undoManager](self, "undoManager", a3));
  objc_msgSend(v3, "undo");

}

- (void)redo:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailScene undoManager](self, "undoManager", a3));
  objc_msgSend(v3, "redo");

}

- (void)_freeDiskSpaceStatusDidChange:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4CB4;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)assetViewerManager:(id)a3 editCompletedForHandler:(id)a4 URL:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100392C34((uint64_t)v6, (uint64_t)v7, v8);

}

- (void)assetViewerManager:(id)a3 sceneClosedForHandler:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a4;
  v5 = objc_claimAutoreleasedReturnValue(+[MailScene log](MailScene, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asset Viewer sceneClosedForHandler %@", (uint8_t *)&v6, 0xCu);
  }

}

- (UIViewController)mf_rootViewController
{
  return self->mf_rootViewController;
}

- (void)setMf_rootViewController:(id)a3
{
  objc_storeStrong((id *)&self->mf_rootViewController, a3);
}

- (void)setBackgroundMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMonitors, a3);
}

- (EFCancelable)backgroundMonitorOverrideObservation
{
  return self->_backgroundMonitorOverrideObservation;
}

- (void)setBackgroundMonitorOverrideObservation:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMonitorOverrideObservation, a3);
}

- (void)setLowDiskAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_lowDiskAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowDiskAlertController, 0);
  objc_storeStrong((id *)&self->_backgroundMonitorOverrideObservation, 0);
  objc_storeStrong((id *)&self->_backgroundMonitors, 0);
  objc_storeStrong((id *)&self->_daemonBooster, 0);
  objc_storeStrong((id *)&self->_assetViewerManager, 0);
  objc_storeStrong((id *)&self->_urlRouter, 0);
  objc_storeStrong((id *)&self->_alertOverlayController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->mf_rootViewController, 0);
}

@end
