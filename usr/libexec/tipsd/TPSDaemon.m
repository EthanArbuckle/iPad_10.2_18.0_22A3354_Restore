@implementation TPSDaemon

- (void)logDaemonActiveEventWithReason:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = atomic_load(byte_1000261B0);
    if ((v5 & 1) != 0)
    {
      v7 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventDaemonActive eventWithReason:alreadyRunning:](TPSAnalyticsEventDaemonActive, "eventWithReason:alreadyRunning:", v4, self->_alreadyRunning));
      objc_msgSend(v6, "log");

      v4 = v7;
      self->_alreadyRunning = 1;
    }
  }

}

- (void)contentWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  v5 = objc_msgSend(v4, "hasWidgetDocument") ^ 1;

  -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](self, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 0, 0, v5, 0, 0, 0, v6);
}

- (id)deliveryInfoVersion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rulesVersion"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSTipsManager rulesVersion](TPSTipsManager, "rulesVersion"));
  }
  return v5;
}

- (TPSTipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)reloadAppGroupDefaults
{
  void *v3;
  id v4;
  void *v5;
  TPSTipStatusController *v6;
  TPSTipStatusController *tipStatusController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v4 = objc_msgSend(v3, "reloadAppGroupDefaults");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v6 = (TPSTipStatusController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tipStatusController"));
  tipStatusController = self->_tipStatusController;
  self->_tipStatusController = v6;

  -[TPSDiscoverabilityController setTipStatusController:](self->_discoverabilityController, "setTipStatusController:", self->_tipStatusController);
}

- (void)tipsAppActive
{
  NSObject *v3;
  void *v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100014C14();

  -[TPSDaemon reloadAppGroupDefaults](self, "reloadAppGroupDefaults");
  -[TPSDaemon processAppInteractedByUser](self, "processAppInteractedByUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  objc_msgSend(v4, "clearNotificationCache");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  objc_msgSend(v5, "clearNotificationCount");

}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)processAppInteractedByUser
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User launched the app", v9, 2u);
  }

  if (-[TPSWelcome stopWelcomeNotification](self->_welcome, "stopWelcomeNotification"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifier"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
    objc_msgSend(v7, "notifiedCollection:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
  -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v8);

}

- (BOOL)_appXPCConnectionContainsConnection:(id)a3
{
  id v4;
  NSObject *appConnectionQueue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v20[2];
  char v21;

  v4 = a3;
  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x2020000000;
  v21 = 0;
  appConnectionQueue = self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007160;
  block[3] = &unk_100020C50;
  v18 = &v19;
  block[4] = self;
  v6 = v4;
  v17 = v6;
  dispatch_sync(appConnectionQueue, block);
  v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100014B50((uint64_t)v20, v7, v8, v9, v10, v11, v12, v13);

  v14 = *(_BYTE *)(v20[0] + 24);
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)_addAppXPCConnection:(id)a3
{
  id v4;
  NSObject *appConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  appConnectionQueue = self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058FC;
  block[3] = &unk_100020C78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(appConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)tipsAppInstalled
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier"));
  v4 = +[TPSCommonDefines isAppValidWithBundleIdentifier:](TPSCommonDefines, "isAppValidWithBundleIdentifier:", v3);

  return v4 & !-[TPSDaemon multiuserModeOn](self, "multiuserModeOn");
}

- (BOOL)multiuserModeOn
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if (objc_msgSend(v2, "isMultiUser"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));
    v5 = objc_msgSend(v4, "userType") == (id)1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)tipsManager:(id)a3 eligibilityCompletedWithTipIdentifiers:(id)a4 contextualTipIdentifiers:(id)a5 tipsDeliveryInfoMap:(id)a6 deliveryInfoMap:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", a4));
  objc_msgSend(v16, "minusSet:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon usageEventManager](self, "usageEventManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
  objc_msgSend(v14, "updateContextualInfoForIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:", v15, v12, v11);

}

- (void)unregisterDarwinNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
      self->_notificationTimingDarwinNotificationRegistered = 0;
    v7 = objc_retainAutorelease(v4);
    xpc_set_event("com.apple.notifyd.matching", objc_msgSend(v7, "cStringUsingEncoding:", 4), 0);
    v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregister for %@.", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)updateContentFromOrigin:(BOOL)a3 contextualEligibility:(BOOL)a4 widgetEligibility:(BOOL)a5 notificationEligibility:(BOOL)a6 preferredNotificationIdentifiers:(id)a7 shouldDeferBlock:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  unsigned int (**v16)(_QWORD);
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  unsigned int v33;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v15 = a7;
  v16 = (unsigned int (**)(_QWORD))a8;
  v17 = a9;
  if (!v16 || !v16[2](v16))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    v20 = objc_msgSend(v19, "isNotificationSettingValid") ^ 1;

    v21 = -[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled");
    v22 = v21;
    if ((v20 & 1) != 0 || (v21 & 1) == 0)
    {
      if (v10)
      {
        v26 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v31 = v20;
          v32 = 1024;
          v33 = v22;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Skip checking notification. Notification disabled %d Tips app installed %d", buf, 0xEu);
        }

      }
      v25 = objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      -[NSObject clearNotificationCache](v25, "clearNotificationCache");
    }
    else
    {
      if (!v10)
      {
LABEL_16:
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10000578C;
        v28[3] = &unk_100020B88;
        v28[4] = self;
        v29 = v17;
        objc_msgSend(v27, "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", v13, v12, v12, v11, v10, v15, v16, v28);

        goto LABEL_17;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon welcome](self, "welcome"));
      v24 = objc_msgSend(v23, "shouldShowWelcomeNotification");

      if (!v24)
      {
        v10 = 1;
        goto LABEL_16;
      }
      v25 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Skip checking notification. Welcome notification in progress", buf, 2u);
      }
    }

    v10 = 0;
    goto LABEL_16;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", TPSTipsManagerErrorDomain, 4, 0));
  (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v18);

LABEL_17:
}

- (void)indexContentPackage:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;

  v3 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100007150;
  v16[4] = sub_10000ABE4;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[TPSOSTransaction transactionWithName:](TPSOSTransaction, "transactionWithName:", CFSTR("com.apple.tips.index-content-package")));
  v4 = objc_alloc((Class)TPSAsyncBlockOperation);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006338;
  v14[3] = &unk_100020BD8;
  v5 = v3;
  v15 = v5;
  v6 = objc_msgSend(v4, "initWithAsyncBlock:", v14);
  v7 = objc_alloc((Class)TPSAsyncBlockOperation);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000ACA0;
  v12[3] = &unk_100020BD8;
  v8 = v5;
  v13 = v8;
  v9 = objc_msgSend(v7, "initWithAsyncBlock:", v12);
  v10 = objc_alloc_init((Class)NSOperationQueue);
  objc_msgSend(v10, "setName:", CFSTR("com.apple.tips.index-content-package"));
  objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v10, "setSuspended:", 1);
  objc_msgSend(v6, "setName:", CFSTR("indexTipsOperation"));
  objc_msgSend(v10, "addOperation:", v6);
  objc_msgSend(v9, "setName:", CFSTR("indexUserGuideOperation"));
  objc_msgSend(v10, "addOperation:", v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000058E8;
  v11[3] = &unk_100020C00;
  v11[4] = v16;
  objc_msgSend(v10, "addBarrierBlock:", v11);
  objc_msgSend(v10, "setSuspended:", 0);

  _Block_object_dispose(v16, 8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id from;
  id location;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  unsigned int v58;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = atomic_load(byte_1000261B0);
  if ((v9 & 1) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.tipsd.access")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.tipsd.tips-app-access")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.tipsd.discoverability")));
    v12 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v37, v12) & 1) != 0)
      v13 = objc_msgSend(v37, "BOOLValue");
    else
      v13 = 0;
    v14 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v36, v14) & 1) != 0)
      v15 = objc_msgSend(v36, "BOOLValue");
    else
      v15 = 0;
    v16 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
      v17 = objc_msgSend(v11, "BOOLValue");
    else
      v17 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceName"));
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.tipsd.assistant"));

    v20 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v50 = v8;
      v51 = 1024;
      v52 = v13;
      v53 = 1024;
      v54 = v15;
      v55 = 1024;
      v56 = v17;
      v57 = 1024;
      v58 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "New connection coming in: %@, standardAccess %d, appAccess %d, discoverability access %d, device expert access %d", buf, 0x24u);
    }

    if (v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.tipsd.assistant")));
      v22 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0 && objc_msgSend(v21, "BOOLValue"))
      {
        if (-[TPSDaemon _assistantXPCConnectionContainsConnection:](self, "_assistantXPCConnectionContainsConnection:", v8))
        {
          v23 = 0;
        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface assistantSupportInterface](NSXPCInterface, "assistantSupportInterface"));
          objc_msgSend(v8, "setExportedInterface:", v31);

          objc_msgSend(v8, "setExportedObject:", self);
          v23 = TPSAnalyticsDaemonActiveReasonAssistantConnection;
          -[TPSDaemon _addAssistantXPCConnection:](self, "_addAssistantXPCConnection:", v8);
          objc_initWeak(&location, self);
          objc_initWeak(&from, v8);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_10000C078;
          v44[3] = &unk_100020CA0;
          objc_copyWeak(&v45, &location);
          objc_copyWeak(&v46, &from);
          objc_msgSend(v8, "setInvalidationHandler:", v44);
          v32 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v8;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Device Expert connection established. %@", buf, 0xCu);
          }

          objc_destroyWeak(&v46);
          objc_destroyWeak(&v45);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }

        goto LABEL_43;
      }

LABEL_32:
      objc_msgSend(v8, "setInterruptionHandler:", &stru_100020D00);
      v30 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v8;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Connection denied %@.", buf, 0xCu);
      }

      v10 = 0;
      v23 = 0;
      goto LABEL_46;
    }
    if ((v13 | v15) == 1)
    {
      if (!-[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled"))
        goto LABEL_32;
      v24 = TPSXPCServerInterface();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v8, "setExportedInterface:", v25);

      objc_msgSend(v8, "setExportedObject:", self);
      if (v15)
      {
        if (!-[TPSDaemon _appXPCConnectionContainsConnection:](self, "_appXPCConnectionContainsConnection:", v8))
        {
          v23 = TPSAnalyticsDaemonActiveReasonTipsAppConnection;
          -[TPSDaemon _addAppXPCConnection:](self, "_addAppXPCConnection:", v8);
          objc_initWeak(&location, self);
          objc_initWeak(&from, v8);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10000C114;
          v41[3] = &unk_100020CA0;
          objc_copyWeak(&v42, &location);
          objc_copyWeak(&v43, &from);
          objc_msgSend(v8, "setInvalidationHandler:", v41);
          v26 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v8;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "App connection established. %@", buf, 0xCu);
          }

          objc_destroyWeak(&v43);
          objc_destroyWeak(&v42);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
          goto LABEL_43;
        }
      }
      else
      {
        objc_msgSend(v8, "setInvalidationHandler:", &stru_100020CE0);
        v33 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          sub_100014BE8();

      }
    }
    else
    {
      if (!v17)
        goto LABEL_32;
      if (!-[TPSDaemon _discoverabilityXPCConnectionContainsConnection:](self, "_discoverabilityXPCConnectionContainsConnection:", v8))
      {
        v27 = TPSMiniTipContentManagerServiceInterfaceServerInterface();
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        objc_msgSend(v8, "setExportedInterface:", v28);

        objc_msgSend(v8, "setExportedObject:", self);
        v23 = TPSAnalyticsDaemonActiveReasonTipKitConnection;
        -[TPSDaemon _addDiscoverabilityXPCConnection:](self, "_addDiscoverabilityXPCConnection:", v8);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000C21C;
        v38[3] = &unk_100020CA0;
        objc_copyWeak(&v39, &location);
        objc_copyWeak(&v40, &from);
        objc_msgSend(v8, "setInvalidationHandler:", v38);
        v29 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v8;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Discoverability connection established. %@", buf, 0xCu);
        }

        objc_destroyWeak(&v40);
        objc_destroyWeak(&v39);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
        goto LABEL_43;
      }
    }
    v23 = 0;
LABEL_43:
    objc_msgSend(v8, "setInterruptionHandler:", &stru_100020D00);
    v34 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "xpc connection resume", buf, 2u);
    }

    objc_msgSend(v8, "resume");
    v10 = 1;
LABEL_46:
    -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v23);

    goto LABEL_47;
  }
  v10 = 0;
LABEL_47:

  return v10;
}

- (TPSFullTipUsageEventManager)usageEventManager
{
  return self->_usageEventManager;
}

- (NSString)notificationTimingDarwinKey
{
  return self->_notificationTimingDarwinKey;
}

- (NSMutableSet)appConnections
{
  return self->_appConnections;
}

- (TPSDaemon)init
{
  TPSDaemon *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TPSAnalyticsDataProvider *v7;
  TPSAnalyticsDataProvider *analyticsDataProvider;
  TPSAnalyticsDataProvider *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSString *notificationTimingDarwinKey;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *discoverabilityConnectionQueue;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *appConnectionQueue;
  dispatch_queue_attr_t v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *assistantConnectionQueue;
  uint64_t v31;
  NSMutableSet *discoverabilityConnections;
  uint64_t v33;
  NSMutableSet *appConnections;
  uint64_t v35;
  NSMutableSet *assistantConnections;
  NSObject *v37;
  unsigned __int8 v38;
  NSObject *v39;
  _QWORD block[4];
  TPSDaemon *v42;
  uint8_t buf[16];
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)TPSDaemon;
  v2 = -[TPSDaemon init](&v44, "init");
  if (v2)
  {
    +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded](TPSPersonaUtilities, "_adoptPersonaForContainerLookupIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionHandler sharedInstance](TPSURLSessionHandler, "sharedInstance"));
    objc_msgSend(v3, "setExcludeCachingDataTypes:", 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionHandler sharedInstance](TPSURLSessionHandler, "sharedInstance"));
    objc_msgSend(v4, "setDelegate:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
    objc_msgSend(v5, "setDelegate:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
    objc_msgSend(v6, "setDefaultSessionDelegate:", v4);

    v7 = (TPSAnalyticsDataProvider *)objc_msgSend(objc_alloc((Class)TPSAnalyticsDataProvider), "initWithDataSource:", v2);
    analyticsDataProvider = v2->_analyticsDataProvider;
    v2->_analyticsDataProvider = v7;

    v9 = v2->_analyticsDataProvider;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventController sharedInstance](TPSAnalyticsEventController, "sharedInstance"));
    objc_msgSend(v10, "setDataProvider:", v9);

    if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionACAuthContext defaultContext](TPSURLSessionACAuthContext, "defaultContext"));
      v12 = objc_msgSend(v11, "copy");

      objc_msgSend(v12, "setInteractivityMode:", TPSURLSessionAuthInteractivitySilentOnly);
      v13 = objc_msgSend(objc_alloc((Class)TPSURLSessionACAuthHandler), "initWithAuthenticationContext:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
      objc_msgSend(v14, "setAuthenticationHandler:", v13);

    }
    v15 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tips Daemon Starting.", buf, 2u);
    }

    if (MKBDeviceFormattedForContentProtection())
    {
      atomic_store((int)MKBDeviceUnlockedSinceBoot() > 0, byte_1000261B0);
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DeviceFormattedForContentProtection not needed", buf, 2u);
      }

    }
    v17 = objc_claimAutoreleasedReturnValue(+[TPSNotificationController displayDarwinNotificationKey](TPSNotificationController, "displayDarwinNotificationKey"));
    notificationTimingDarwinKey = v2->_notificationTimingDarwinKey;
    v2->_notificationTimingDarwinKey = (NSString *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.tipsd.discoverabilityConnectionQueue", v20);
    discoverabilityConnectionQueue = v2->_discoverabilityConnectionQueue;
    v2->_discoverabilityConnectionQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_create("com.apple.tipsd.appConnectionQueue", v24);
    appConnectionQueue = v2->_appConnectionQueue;
    v2->_appConnectionQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = dispatch_queue_create("com.apple.tipsd.assistantConnectionQueue", v28);
    assistantConnectionQueue = v2->_assistantConnectionQueue;
    v2->_assistantConnectionQueue = (OS_dispatch_queue *)v29;

    v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    discoverabilityConnections = v2->_discoverabilityConnections;
    v2->_discoverabilityConnections = (NSMutableSet *)v31;

    v33 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    appConnections = v2->_appConnections;
    v2->_appConnections = (NSMutableSet *)v33;

    v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    assistantConnections = v2->_assistantConnections;
    v2->_assistantConnections = (NSMutableSet *)v35;

    if (-[TPSDaemon multiuserModeOn](v2, "multiuserModeOn"))
    {
      v37 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "EDU mode on", buf, 2u);
      }

    }
    else
    {
      v38 = atomic_load(byte_1000261B0);
      if ((v38 & 1) != 0)
      {
        -[TPSDaemon initialize](v2, "initialize");
      }
      else if (-[TPSDaemon setupCompleted](v2, "setupCompleted"))
      {
        v39 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "User has not perform first unlock", buf, 2u);
        }

        -[TPSDaemon registerForMobileKeyBagLockStatusNotify](v2, "registerForMobileKeyBagLockStatusNotify");
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000866C;
    block[3] = &unk_1000209E0;
    v42 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  return v2;
}

- (void)initialize
{
  unsigned __int8 v2;
  id v4;
  void *v5;
  TPSTipStatusController *v6;
  TPSTipStatusController *tipStatusController;
  TPSTipsManager *v8;
  TPSTipsManager *tipsManager;
  TPSDiscoverabilityController *v10;
  TPSDiscoverabilityController *discoverabilityController;
  TPSFullTipUsageEventManager *v12;
  TPSFullTipUsageEventManager *usageEventManager;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v26;
  NSObject *v27;
  _BOOL4 v28;
  TPSNotificationController *v29;
  TPSNotificationController *notificationController;
  TPSWelcome *v31;
  TPSWelcome *welcome;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;

  if (!self->_initialized)
  {
    v2 = atomic_load(byte_1000261B0);
    if ((v2 & 1) != 0)
    {
      self->_initialized = 1;
      -[TPSDaemon resetAllDataIfNeeded](self, "resetAllDataIfNeeded");
      v4 = +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
      v6 = (TPSTipStatusController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tipStatusController"));
      tipStatusController = self->_tipStatusController;
      self->_tipStatusController = v6;

      v8 = (TPSTipsManager *)objc_msgSend(objc_alloc((Class)TPSTipsManager), "initWithTipStatusController:", self->_tipStatusController);
      tipsManager = self->_tipsManager;
      self->_tipsManager = v8;

      -[TPSTipsManager setDelegate:](self->_tipsManager, "setDelegate:", self);
      v10 = (TPSDiscoverabilityController *)objc_msgSend(objc_alloc((Class)TPSDiscoverabilityController), "initWithTipStatusController:", self->_tipStatusController);
      discoverabilityController = self->_discoverabilityController;
      self->_discoverabilityController = v10;

      -[TPSDiscoverabilityController setDelegate:](self->_discoverabilityController, "setDelegate:", self);
      v12 = (TPSFullTipUsageEventManager *)objc_alloc_init((Class)TPSFullTipUsageEventManager);
      usageEventManager = self->_usageEventManager;
      self->_usageEventManager = v12;

      v14 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController debugDescription](self->_tipStatusController, "debugDescription"));
        v37 = 138412290;
        v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tips status controller %@", (uint8_t *)&v37, 0xCu);

      }
      v16 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDiscoverabilityController debugDescription](self->_discoverabilityController, "debugDescription"));
        v37 = 138412290;
        v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "discoverability controller %@", (uint8_t *)&v37, 0xCu);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController tipStatusMap](self->_tipStatusController, "tipStatusMap"));
      if (!objc_msgSend(v18, "count"))
      {
        v19 = objc_alloc((Class)TPSAnalyticsProcessingController);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allValues"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon contextualInfoMap](self, "contextualInfoMap"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDiscoverabilityController eventsHistoryController](self->_discoverabilityController, "eventsHistoryController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contextualEventsForIdentifiers"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsManager experiment](self->_tipsManager, "experiment"));
        v25 = objc_msgSend(v19, "initWithAllTipStatus:contextualInfoMap:eventHistoryMap:experiment:", v20, v21, v23, v24);

        objc_msgSend(v25, "resetAnalytics");
      }
      -[TPSDaemon cancelLegacyBackgroundTaskIfNeeded](self, "cancelLegacyBackgroundTaskIfNeeded");
      v26 = -[TPSDaemon tipsInValidState](self, "tipsInValidState");
      v27 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Tips app is in a valid state.", (uint8_t *)&v37, 2u);
        }

        v29 = (TPSNotificationController *)objc_alloc_init((Class)TPSNotificationController);
        notificationController = self->_notificationController;
        self->_notificationController = v29;

        -[TPSNotificationController setDelegate:](self->_notificationController, "setDelegate:", self);
        -[TPSTipsManager setNotificationController:](self->_tipsManager, "setNotificationController:", self->_notificationController);
        v31 = -[TPSWelcome initWithDelegate:tipsManager:notificationController:]([TPSWelcome alloc], "initWithDelegate:tipsManager:notificationController:", self, self->_tipsManager, self->_notificationController);
        welcome = self->_welcome;
        self->_welcome = v31;

        -[TPSWelcome reconnectWelcomeIfNeeded:](self->_welcome, "reconnectWelcomeIfNeeded:", 1);
        -[TPSDaemon registerImmediateNotifications](self, "registerImmediateNotifications");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));

        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "notificationCache"));

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
          if (v35)
            -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", v36);
          else
            -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v36);

        }
        if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
          -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", BYSetupAssistantExitedDarwinNotification);
        else
          -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", BYSetupAssistantExitedDarwinNotification);
      }
      else
      {
        if (v28)
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Tips app is not in a valid state, skip registration for notifications.", (uint8_t *)&v37, 2u);
        }

      }
      -[TPSTipsManager updateContentIfOverrideImmediately:](self->_tipsManager, "updateContentIfOverrideImmediately:", 0);
      -[TPSDaemon appRemovalCleanupIfNeeded](self, "appRemovalCleanupIfNeeded");

    }
  }
}

- (void)registerForMobileKeyBagLockStatusNotify
{
  unsigned __int8 v2;
  const char *v3;
  id v4;
  _QWORD handler[4];
  id v6;
  int out_token;
  id location;

  objc_initWeak(&location, self);
  v2 = atomic_load(byte_1000261B0);
  if ((v2 & 1) == 0)
  {
    out_token = -1;
    v3 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    v4 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100008BD4;
    handler[3] = &unk_100020A08;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

- (id)xpcActivitySetStateBlockForIdentifier:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008D58;
  v6[3] = &unk_100020A30;
  v7 = a3;
  v3 = v7;
  v4 = objc_retainBlock(v6);

  return v4;
}

- (id)shouldDeferBlockForXPCActivity:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008FD0;
  v6[3] = &unk_100020A58;
  v7 = a3;
  v8 = v9;
  v3 = v7;
  v4 = objc_retainBlock(v6);

  _Block_object_dispose(v9, 8);
  return v4;
}

- (void)updateContentWithActivity:(id)a3 identifier:(id)a4 preferredNotificationIdentifiers:(id)a5 multiuserModeOn:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t (**v18)(_QWORD);
  void (**v19)(_QWORD, _QWORD, _QWORD);
  int v20;
  unsigned __int8 v21;
  NSObject *v22;
  unsigned __int8 v23;
  _BOOL4 v24;
  _QWORD v25[4];
  id v26;
  uint64_t (**v27)(_QWORD);
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;
  BOOL v30;
  uint8_t buf[4];
  _BYTE v32[10];
  __int16 v33;
  int v34;

  v24 = a8;
  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Update content with event %@.", buf, 0xCu);
  }

  v18 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[TPSDaemon shouldDeferBlockForXPCActivity:](self, "shouldDeferBlockForXPCActivity:", v14));
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[TPSDaemon xpcActivitySetStateBlockForIdentifier:](self, "xpcActivitySetStateBlockForIdentifier:", v15));
  v20 = v18[2](v18);
  if (((v20 | v10) & 1) != 0
    || (v21 = atomic_load(byte_1000261B0), (v21 & 1) == 0)
    || !-[TPSDaemon setupCompleted](self, "setupCompleted"))
  {
    v22 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = atomic_load(byte_1000261B0);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v32 = v20;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v10;
      v33 = 1024;
      v34 = v23 & 1;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Update content skipped. deferBlock %d, multiuserModeOn %d, deviceUnlockedSinceBoot %d", buf, 0x14u);
    }

    goto LABEL_11;
  }
  if (!((unsigned int (*)(_QWORD, id, uint64_t))v19[2])(v19, v14, 4))
  {
LABEL_11:
    ((void (**)(_QWORD, id, uint64_t))v19)[2](v19, v14, 5);
    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100009310;
  v25[3] = &unk_100020A80;
  objc_copyWeak(&v29, (id *)buf);
  v30 = a9;
  v27 = v18;
  v28 = v19;
  v26 = v14;
  -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](self, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 1, v9, v24, a9, v16, v27, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
LABEL_12:

}

- (BOOL)contentUpdatePostProcessingContentPackage:(id)a3 shouldUpdateNotification:(BOOL)a4 shouldDeferBlock:(id)a5 error:(id)a6
{
  _BOOL4 v8;
  id v10;
  uint64_t (**v11)(_QWORD);
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v10 = a3;
  v11 = (uint64_t (**)(_QWORD))a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
  if (objc_msgSend(v13, "isEqualToString:", TPSTipsManagerErrorDomain))
    v14 = objc_msgSend(v12, "code") == (id)4;
  else
    v14 = 0;

  if (v14 || !v8 || (-[TPSDaemon updateNotificationStatus](self, "updateNotificationStatus"), !v11))
  {
    if (!v14)
      goto LABEL_8;
LABEL_12:
    v19 = 1;
    goto LABEL_13;
  }
  if ((v11[2](v11) & 1) != 0)
    goto LABEL_12;
LABEL_8:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon welcome](self, "welcome"));
  v16 = objc_msgSend(v15, "isReminderCompleted");

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    v18 = objc_msgSend(v17, "welcomeDocumentFromContentPackage:", v10);

  }
  v19 = 0;
LABEL_13:

  return v19;
}

- (void)registerXPCEventHandlers
{
  unsigned __int8 v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unsigned __int8 v11;
  _QWORD v12[4];
  id v13;
  unsigned __int8 v14;
  _QWORD v15[4];
  id v16;
  unsigned __int8 v17;
  _QWORD v18[4];
  id v19;
  unsigned __int8 v20;
  _QWORD handler[5];
  id v22;
  unsigned __int8 v23;
  id location[2];

  v3 = -[TPSDaemon multiuserModeOn](self, "multiuserModeOn");
  objc_initWeak(location, self);
  v4 = (const char *)objc_msgSend(CFSTR("com.apple.tipsd.postInstall-utility"), "UTF8String");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000097A0;
  handler[3] = &unk_100020AA8;
  objc_copyWeak(&v22, location);
  handler[4] = self;
  v23 = v3;
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, handler);
  v5 = (const char *)objc_msgSend(CFSTR("com.apple.tipsd.update-content"), "UTF8String");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100009980;
  v18[3] = &unk_100020AD0;
  objc_copyWeak(&v19, location);
  v20 = v3;
  xpc_activity_register(v5, XPC_ACTIVITY_CHECK_IN, v18);
  v6 = (const char *)objc_msgSend(CFSTR("com.apple.tipsd.analytics-maintenance"), "UTF8String");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009A18;
  v15[3] = &unk_100020AD0;
  objc_copyWeak(&v16, location);
  v17 = v3;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, v15);
  v7 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  v8 = &_dispatch_main_q;
  xpc_set_event_stream_handler(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100020B10);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009CA0;
  v12[3] = &unk_100020AD0;
  objc_copyWeak(&v13, location);
  v14 = v3;
  xpc_set_event_stream_handler("com.apple.coreduetcontext.client_event_stream", (dispatch_queue_t)&_dispatch_main_q, v12);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009E50;
  v9[3] = &unk_100020AA8;
  objc_copyWeak(&v10, location);
  v11 = v3;
  v9[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(location);
}

- (BOOL)tipsInValidState
{
  void *v3;
  unsigned int v4;

  if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
    return -[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier"));
  v4 = +[TPSCommonDefines isAppRestrictedWithBundleIdentifier:](TPSCommonDefines, "isAppRestrictedWithBundleIdentifier:", v3);

  if (v4)
    return -[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled");
  else
    return 1;
}

- (BOOL)setupCompleted
{
  int HasCompletedInitialRun;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  int v8;

  HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(self, a2);
  v3 = BYSetupAssistantNeedsToRun();
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = HasCompletedInitialRun;
    v7 = 1024;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy setup completed: %d, buddy needs to run %d", (uint8_t *)v6, 0xEu);
  }

  return HasCompletedInitialRun & (v3 ^ 1);
}

- (void)registerForNotificationTimingDarwinNotification
{
  NSObject *v2;
  id v4;
  uint8_t buf[16];

  if (self->_notificationTimingDarwinNotificationRegistered)
  {
    v2 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Already registered for lock screen.", buf, 2u);
    }

  }
  else
  {
    self->_notificationTimingDarwinNotificationRegistered = 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
    -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", v4);

  }
}

- (void)registerDarwinNotification:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  xpc_object_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4);
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "Notification", v6);
    xpc_set_event("com.apple.notifyd.matching", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Register for %@.", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)registerImmediateNotifications
{
  id v3;
  uint64_t v4;
  id v5;

  if ((+[TPSTipsManager needImmediateNotificationForType:](TPSTipsManager, "needImmediateNotificationForType:", 0) & 1) != 0|| +[TPSTipsManager needImmediateNotificationForType:](TPSTipsManager, "needImmediateNotificationForType:", 1))
  {
    v3 = -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", CFSTR("com.apple.bluetooth.pairing"));
  }
  else
  {
    v3 = -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", CFSTR("com.apple.bluetooth.pairing"));
  }
  v4 = TPSHMManagerSpeakersConfiguredChangedNotificationString(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (+[TPSTipsManager needImmediateNotificationForType:](TPSTipsManager, "needImmediateNotificationForType:", 2))-[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", v5);
  else
    -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v5);

}

- (void)unregisterImmediateNotifications
{
  uint64_t v3;
  id v4;

  v3 = TPSHMManagerSpeakersConfiguredChangedNotificationString(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v4);
  -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", CFSTR("com.apple.bluetooth.pairing"));

}

- (void)prepareForNotifications
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));

  if (v3)
    -[TPSDaemon registerForNotificationTimingDarwinNotification](self, "registerForNotificationTimingDarwinNotification");
  else
    -[TPSDaemon showNewTipNotification](self, "showNewTipNotification");
}

- (void)updateNotificationStatus
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  TPSDaemon *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationCache"));

  if (v4)
  {
    if (+[TPSNotificationController supportsRemoteIcon](TPSNotificationController, "supportsRemoteIcon"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10000A718;
      v6[3] = &unk_100020B38;
      v7 = v4;
      v8 = self;
      objc_msgSend(v5, "fetchNotificationAssetIfNeededCompletionHandler:", v6);

    }
    else
    {
      -[TPSDaemon prepareForNotifications](self, "prepareForNotifications");
    }
  }

}

- (void)showNewTipNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Show new tip notification.", (uint8_t *)buf, 2u);
  }

  if (-[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled"))
  {
    objc_initWeak(buf, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A950;
    v6[3] = &unk_100020B60;
    objc_copyWeak(&v7, buf);
    objc_msgSend(v4, "showNotificationWithCompletionHandler:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    objc_msgSend(v5, "clearNotificationCache");

  }
}

- (void)cancelLegacyBackgroundTaskIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("TPSDidCancelLegacyBackgroundTask")) & 1) == 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling legacy discretionary background task", v10, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.tipsd.checkNewTips")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier"));
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v6);

    objc_msgSend(v5, "setHTTPCookieStorage:", 0);
    objc_msgSend(v5, "setDiscretionary:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v5, self, v7));
    -[TPSDaemon setTipsFeedURLSession:](self, "setTipsFeedURLSession:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsFeedURLSession](self, "tipsFeedURLSession"));
    objc_msgSend(v9, "invalidateAndCancel");

  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8;
  uint64_t v9;
  void (**v10)(id, id);
  NSObject *v11;

  v8 = a5;
  v9 = TPSAnalyticsDaemonActiveReasonContentCheck;
  v10 = (void (**)(id, id))a6;
  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v9);
  v11 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100014934(v8, v11);

  v10[2](v10, v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsFeedURLSession](self, "tipsFeedURLSession"));

  if (v6 == v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cleaned up legacy discretionary background task", v9, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "setBool:forKey:", 1, CFSTR("TPSDidCancelLegacyBackgroundTask"));
    objc_msgSend(v8, "synchronize");
    -[TPSDaemon setTipsFeedURLSession:](self, "setTipsFeedURLSession:", 0);

  }
}

- (void)resetAllDataIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", CFSTR("TPSLastMajorVersion")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorVersion"));

  v6 = objc_msgSend(v31, "isEqualToString:", v5);
  v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  v8 = v6 ^ 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Should reset due to version change: %d", buf, 8u);
  }

  v9 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(".")));
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v12 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
    v12 = objc_msgSend(v11, "integerValue");

  }
  v13 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_100014AD4();

  if ((unint64_t)objc_msgSend(v10, "count") < 2 || v12)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_100014AA8();

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("TPSNeedsResetOnMajorGM"));
  }
  else
  {
    v14 = (uint64_t)objc_msgSend(v3, "BOOLForKey:", CFSTR("TPSNeedsResetOnMajorGM"));
    v15 = +[TPSUserTypesValidation isBetaBuild](TPSUserTypesValidation, "isBetaBuild");
    v16 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v17)
        sub_1000149E8(v14, v16, v18, v19, v20, v21, v22, v23);

      if ((v14 & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        v34 = buf;
        v35 = 0x2020000000;
        v36 = 1;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10000B600;
        v32[3] = &unk_100020C28;
        v32[4] = buf;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v32);
        if (v34[24])
        {
          v24 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            sub_1000149BC();

          objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("TPSNeedsResetOnMajorGM"));
        }
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      if (v17)
        sub_100014A7C();

      if ((_DWORD)v14)
      {
        v30 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          sub_100014A50();

        objc_msgSend(v3, "removeObjectForKey:", CFSTR("TPSNeedsResetOnMajorGM"));
        v8 = 1;
      }
    }
  }
  objc_msgSend(v3, "synchronize");
  v26 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Should reset %d", buf, 8u);
  }

  if (v8)
  {
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("TPSLastMajorVersion"));
    objc_msgSend(v3, "synchronize");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
    -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v27);

    -[TPSDaemon resetBasicDefaults](self, "resetBasicDefaults");
    +[TPSWelcome resetWelcomeNotifications](TPSWelcome, "resetWelcomeNotifications");
    +[TPSDataMigrator performMigrationIfNeeded](TPSDataMigrator, "performMigrationIfNeeded");
    +[TPSTipsManager removeExperimentCache](TPSTipsManager, "removeExperimentCache");
    +[TPSTipsManager removeWelcomeDocumentCache](TPSTipsManager, "removeWelcomeDocumentCache");
    +[TPSTipsManager removeWidgetUpdateDate](TPSTipsManager, "removeWidgetUpdateDate");
    +[TPSNotificationController removeNotificationCache](TPSNotificationController, "removeNotificationCache");
    +[TPSNotificationController removeAssetCacheDirectory](TPSNotificationController, "removeAssetCacheDirectory");
    +[TPSDiscoverabilityController removeContextualInfoCache](TPSDiscoverabilityController, "removeContextualInfoCache");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
    objc_msgSend(v29, "setLastMajorVersionUpdateDate:", v28);

  }
  +[TPSDataMigrator revertTipStatusArchivalIfNeeded](TPSDataMigrator, "revertTipStatusArchivalIfNeeded");

}

- (void)resetBasicDefaults
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", TPSWidgetShownDocuments);
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSWidgetShownTips"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSFeedLastModified"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("onPause"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPastCollectionIdentifiers"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPendingCollectionActivationForIdentifier"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSWaitingToShowNewTipNotification"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPreferredLanguageForCurrentRequest"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSNotificationsIgnoreCount"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSFeedDoNotNotify"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPendingNotificationTip"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPendingCollectionActivationNotificationTips"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSInvalidTargetedTipIDs"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSNotificationQuietPeriodEndTime"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPendingNotifiedTipIDs"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("kTipsdNotifiedTipsIDs"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSDLastPublishedNotificationID"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSDLastPublisherBulletinID"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TipsdUserLaunchesAppAfterNotifications"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSViewedTipIdentifiers"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPendingNotificationTipText"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSPendingNotificationTipID"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TipsdFeedLastNotifiedTipId"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TipsdRegisteredForNotificationKey"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TipsdWaitingToShowNotification"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TipsdWelcomeNotificationNaggingState"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("validPairedDevices"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSOfflineLastProcessedRemoteContentIdentifier"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSOfflineLastProcessedLocalContentIdentifier"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TPSOfflineContentMap"));
  objc_msgSend(v4, "synchronize");
  if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
    v3 = +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");

}

- (BOOL)_assistantXPCConnectionContainsConnection:(id)a3
{
  id v4;
  NSObject *assistantConnectionQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B95C;
  block[3] = &unk_100020C50;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(assistantConnectionQueue, block);
  LOBYTE(assistantConnectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)assistantConnectionQueue;
}

- (void)_addAssistantXPCConnection:(id)a3
{
  id v4;
  NSObject *assistantConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BA60;
  block[3] = &unk_100020C78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(assistantConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeAssistantXPCConnection:(id)a3
{
  id v4;
  NSObject *assistantConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BB64;
  block[3] = &unk_100020C78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(assistantConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_discoverabilityXPCConnectionContainsConnection:(id)a3
{
  id v4;
  NSObject *assistantConnectionQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BCA0;
  block[3] = &unk_100020C50;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(assistantConnectionQueue, block);
  LOBYTE(assistantConnectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)assistantConnectionQueue;
}

- (void)_addDiscoverabilityXPCConnection:(id)a3
{
  id v4;
  NSObject *discoverabilityConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  discoverabilityConnectionQueue = self->_discoverabilityConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BDA4;
  block[3] = &unk_100020C78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(discoverabilityConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeDiscoverabilityXPCConnection:(id)a3
{
  id v4;
  NSObject *discoverabilityConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  discoverabilityConnectionQueue = self->_discoverabilityConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BEA8;
  block[3] = &unk_100020C78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(discoverabilityConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeAppXPCConnection:(id)a3
{
  id v4;
  NSObject *appConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  appConnectionQueue = self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BFEC;
  block[3] = &unk_100020C78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(appConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)appRemovalCleanupIfNeeded
{
  void *v3;
  _BOOL8 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = -[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled");
  if (v4)
  {
LABEL_6:
    objc_msgSend(v3, "setBool:forKey:", v4, CFSTR("TPSTipsAppInstalled"));
    objc_msgSend(v3, "synchronize");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("TPSTipsAppInstalled")))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "app removal clean up", v8, 2u);
    }

    -[TPSDaemon unregisterImmediateNotifications](self, "unregisterImmediateNotifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppDeleted event](TPSAnalyticsEventAppDeleted, "event"));
    objc_msgSend(v6, "log");

    -[TPSDaemon resetBasicDefaults](self, "resetBasicDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    objc_msgSend(v7, "removeAllNotifications");

    goto LABEL_6;
  }
LABEL_7:

}

- (void)contentViewedForIdentifier:(id)a3
{
  TPSDiscoverabilityController *discoverabilityController;
  id v5;

  discoverabilityController = self->_discoverabilityController;
  v5 = a3;
  -[TPSDiscoverabilityController updateContentViewedForIdentifier:](discoverabilityController, "updateContentViewedForIdentifier:", v5);
  -[TPSDaemon removeNotificationForIdentifier:](self, "removeNotificationForIdentifier:", v5);

}

- (void)removeNotificationForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  objc_msgSend(v5, "removeNotificationWithIdentifier:", v4);

}

- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5
{
  TPSDiscoverabilityController *discoverabilityController;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  discoverabilityController = self->_discoverabilityController;
  v8 = a4;
  v12 = a3;
  -[TPSDiscoverabilityController addHintDisplayedForIdentifier:context:](discoverabilityController, "addHintDisplayedForIdentifier:context:", v12, a5);
  if (v8)
    v9 = v8;
  else
    v9 = v12;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](TPSCloudController, "sharedInstance"));
  objc_msgSend(v11, "hintDisplayedForContentID:", v10);

}

- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  TPSDiscoverabilityController *discoverabilityController;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((unint64_t)(a6 - 6) > 4)
    v13 = (id *)&TPSAnalyticsDismissTypeUnknown;
  else
    v13 = (id *)*(&off_100020E70 + a6 - 6);
  v14 = *v13;
  -[TPSDiscoverabilityController updateHintDismissedForIdentifier:dismissType:context:](self->_discoverabilityController, "updateHintDismissedForIdentifier:dismissType:context:", v10, v14, v12);
  if ((-[TPSTipStatusController isHintInelgibileForIdentifier:](self->_tipStatusController, "isHintInelgibileForIdentifier:", v10) & 1) != 0)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](TPSLogger, "discoverability"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v10;
      v16 = "Hint already marked as ineligible for %@";
      v17 = v15;
      v18 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    }
  }
  else
  {
    discoverabilityController = self->_discoverabilityController;
    v25 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    -[TPSDiscoverabilityController markHintIneligibleForIdentifiers:bundleID:context:reason:](discoverabilityController, "markHintIneligibleForIdentifiers:bundleID:context:reason:", v20, v11, v12, a6);

    v15 = objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](TPSLogger, "discoverability"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v14;
      v16 = "Hint %@ marked ineligible with dismissType %@";
      v17 = v15;
      v18 = 22;
      goto LABEL_9;
    }
  }

}

- (void)restartTrackingForContentIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](TPSLogger, "discoverability"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restartTrackingForContentIdentifiers %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
  objc_msgSend(v6, "restartTriggerTrackingIfNotDisplayedForIdentifiers:", v4);

}

- (void)logAnalyticsEvent:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = TPSAnalyticsDaemonActiveReasonRealTimeAnalytics;
  v5 = a3;
  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventController sharedInstance](TPSAnalyticsEventController, "sharedInstance"));
  objc_msgSend(v6, "logAnalyticsEvent:", v5);

}

- (void)logAnalyticsEvents:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = TPSAnalyticsDaemonActiveReasonRealTimeAnalytics;
  v5 = a3;
  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventController sharedInstance](TPSAnalyticsEventController, "sharedInstance"));
  objc_msgSend(v6, "logAnalyticsEvents:", v5);

}

- (void)handleLanguageDidChangeNotification
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;

  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", TPSAnalyticsDaemonActiveReasonLanguageChange);
  if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](NSLocale, "tps_userLanguageCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userLanguage"));
    v6 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received language did change notification. New language: %@, current language: %@", buf, 0x16u);
    }

    if (objc_msgSend(v4, "isEqualToString:", v5))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current user language has not change, skip.", buf, 2u);
      }

    }
    else
    {
      objc_msgSend(v3, "clearDataCache");
      objc_msgSend(v3, "setUserLanguage:", v4);
      +[TPSTipsManager removeWelcomeDocumentCache](TPSTipsManager, "removeWelcomeDocumentCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      objc_msgSend(v9, "clearNotificationCache");

      +[TPSNotificationController removeAssetCacheDirectory](TPSNotificationController, "removeAssetCacheDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
      -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v10);

      -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](self, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 1, 0, 1, 0, 0, 0, &stru_100020D40);
    }

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User is still in set up, exit.", buf, 2u);
    }

    xpc_transaction_exit_clean();
  }
}

- (void)handleDeviceFirstUnlockNotification
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t buf[16];

  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", TPSAnalyticsDaemonActiveReasonFirstUnlock);
  if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
  {
    -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](self, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 1, 1, 0, 0, 0, 0, &stru_100020D60);
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User is still in set up, exit.", buf, 2u);
    }

    xpc_transaction_exit_clean(v4, v5);
  }
}

- (void)immediateNotificationForIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request immediate notification for %@", buf, 0xCu);

  }
  if (objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notificationCache"));
    v9 = (char *)objc_msgSend(v8, "type");

    if (-[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled") && (unint64_t)(v9 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_initWeak((id *)buf, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000D0A8;
      v17[3] = &unk_100020D88;
      objc_copyWeak(&v19, (id *)buf);
      v18 = v4;
      -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](self, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 0, 0, 0, 1, v18, 0, v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "notificationCache"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionIdentifier"));
      v13 = objc_msgSend(v4, "containsObject:", v12);

      if ((v13 & 1) == 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
        objc_msgSend(v14, "activatedCollections:", v15);

        v16 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping immediate collection notification", buf, 2u);
        }

      }
    }
  }

}

- (void)userGuideMapWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id buf[2];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieve user guide map.", (uint8_t *)buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastFetchedLanguage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](NSLocale, "tps_userLanguageCode"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(v10, "clearCachedUserGuides");
LABEL_9:

    objc_initWeak(buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000D518;
    v13[3] = &unk_100020DB0;
    objc_copyWeak(&v15, buf);
    v14 = v4;
    -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](self, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 0, 0, 0, 0, 0, 0, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cachedUserGuideMap"));

  if (!v12 || !objc_msgSend(v12, "count"))
  {
    v11 = v12;
    goto LABEL_9;
  }
  (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v12, 0);

LABEL_10:
}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  v15 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D748;
  v12[3] = &unk_100020DD8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "contentForVariantIdentifiers:completionHandler:", v9, v12);

}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100014D58();

  v8 = objc_alloc_init((Class)NSOperationQueue);
  objc_msgSend(v8, "setSuspended:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheIdentifierForType:", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v5, 0));
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    v11 = objc_msgSend(objc_alloc((Class)TPSAssetsDownloadOperation), "initWithAssetIdentifier:assetURLPath:", v9, v10);
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheIdentifierForType:", 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v5, 1));
  if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
    v14 = objc_msgSend(objc_alloc((Class)TPSAssetsDownloadOperation), "initWithAssetIdentifier:assetURLPath:", v12, v13);
  else
    v14 = 0;
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_10000DB0C;
  v23 = &unk_100020E00;
  v15 = v11;
  v24 = v15;
  v16 = v14;
  v25 = v16;
  v26 = v5;
  v27 = v6;
  v17 = v6;
  v18 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v20));
  if (v15)
  {
    objc_msgSend(v8, "addOperation:", v15, v20, v21, v22, v23, v24, v25, v26, v27);
    objc_msgSend(v19, "addDependency:", v15);
  }
  if (v16)
  {
    objc_msgSend(v8, "addOperation:", v16);
    objc_msgSend(v19, "addDependency:", v16);
  }
  objc_msgSend(v8, "addOperation:", v19, v20, v21, v22, v23);
  objc_msgSend(v8, "setSuspended:", 0);

}

- (BOOL)isContentIneligibleDueToViewOnOtherDevices:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController statusForIdentifier:](self->_tipStatusController, "statusForIdentifier:", a3));
  if ((objc_msgSend(v3, "isHintDisplayed") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isHintDisplayedOnCloudDevices");

  return v4;
}

- (int64_t)statusCheckForHintIneligibleReasonWithContentID:(id)a3
{
  id v4;
  int64_t v5;
  unsigned __int8 v6;
  TPSDiscoverabilityController *discoverabilityController;
  NSObject *v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = (int64_t)-[TPSTipStatusController hintInelgibileReasonForIdentifier:](self->_tipStatusController, "hintInelgibileReasonForIdentifier:", v4);
  if ((v5 & 0xFFFFFFFFFFFFFFF7) == 0)
  {
    v6 = -[TPSTipStatusController isPreconditionMatchedForIdentifier:](self->_tipStatusController, "isPreconditionMatchedForIdentifier:", v4);
    discoverabilityController = self->_discoverabilityController;
    if ((v6 & 1) != 0)
    {
      if ((-[TPSDiscoverabilityController isContextualInfoExistForIdentifier:](discoverabilityController, "isContextualInfoExistForIdentifier:", v4) & 1) == 0)goto LABEL_10;
      if (-[TPSDaemon isContentIneligibleDueToViewOnOtherDevices:](self, "isContentIneligibleDueToViewOnOtherDevices:", v4))
      {
        if (!+[TPSDefaultsManager ignoreCloud](TPSDefaultsManager, "ignoreCloud"))
        {
          v5 = 5;
          goto LABEL_12;
        }
        v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Overriding ineligibility due to content %@ already seen on other devices", (uint8_t *)&v10, 0xCu);
        }

      }
      if (-[TPSTipsManager contextualTipsInactive](self->_tipsManager, "contextualTipsInactive"))
      {
LABEL_10:
        -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:](self->_discoverabilityController, "restartTriggerTrackingIfNotDisplayedForIdentifier:", v4);
        v5 = 4;
      }
    }
    else
    {
      -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:](discoverabilityController, "restartTriggerTrackingIfNotDisplayedForIdentifier:", v4);
      v5 = 15;
    }
  }
LABEL_12:

  return v5;
}

- (int64_t)displayStatusCheckForHintIneligibleReasonWithContent:(id)a3 context:(id)a4 bypassExperiment:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  _BOOL4 v23;
  uint8_t buf[4];
  void *v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](NSLocale, "tps_userLanguageCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userLanguageCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v13 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking language changes for %@", buf, 0xCu);
  }

  if (v10 && (objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
  {
    if (-[TPSDiscoverabilityController isContentHintDisplayMaxDisplayedCountExceededForIdentifier:](self->_discoverabilityController, "isContentHintDisplayMaxDisplayedCountExceededForIdentifier:", v12))
    {
      -[TPSDiscoverabilityController updateHintDismissedForIdentifier:dismissType:context:](self->_discoverabilityController, "updateHintDismissedForIdentifier:dismissType:context:", v12, TPSAnalyticsDismissTypeHintMaxDisplayedCountExceeded, v9);
      v14 = 20;
    }
    else
    {
      v23 = v5;
      v16 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking preconditions for %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preconditions"));
      v19 = objc_msgSend(v17, "isPreconditionValidForIdentifier:preconditionDictionary:", v12, v18);

      if (v19)
        v14 = 0;
      else
        v14 = 15;
      if (!v23 && v19)
      {
        v20 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v12;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Checking experiment camp for %@", buf, 0xCu);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
        v22 = objc_msgSend(v21, "isContentIdentifierHoldoutCamp:", v12);

        if (v22)
        {
          -[TPSDiscoverabilityController updateHintWouldHaveBeenDisplayedForIdentifier:context:](self->_discoverabilityController, "updateHintWouldHaveBeenDisplayedForIdentifier:context:", v12, v9);
          v14 = 22;
        }
        else
        {
          v14 = 0;
        }
      }
    }
  }
  else
  {
    -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:](self->_discoverabilityController, "restartTriggerTrackingIfNotDisplayedForIdentifier:", v12);
    v14 = 11;
  }

  return v14;
}

- (void)donateHintIneligibleReason:(int64_t)a3 contentID:(id)a4 bundleID:(id)a5 context:(id)a6
{
  TPSDiscoverabilityController *discoverabilityController;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  discoverabilityController = self->_discoverabilityController;
  v20 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  -[TPSDiscoverabilityController markHintIneligibleForIdentifiers:bundleID:context:reason:](discoverabilityController, "markHintIneligibleForIdentifiers:bundleID:context:reason:", v14, v12, v11, a3, v20);

  v15 = objc_alloc((Class)TPSAnalyticsEventTipNotDisplayed);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDiscoverabilityController tipStatusController](self->_discoverabilityController, "tipStatusController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "correlationIdentifierForIdentifier:", v13));
  v18 = objc_msgSend(v15, "initWithTipID:correlationID:bundleID:reason:context:date:", v13, v17, v12, a3, v11, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventController sharedInstance](TPSAnalyticsEventController, "sharedInstance"));
  objc_msgSend(v19, "logAnalyticsEvent:", v18);

}

- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5
{
  TPSDiscoverabilityController *discoverabilityController;
  id v9;
  id v10;
  id v11;

  discoverabilityController = self->_discoverabilityController;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:](discoverabilityController, "restartTriggerTrackingIfNotDisplayedForIdentifier:", v11);
  -[TPSDaemon donateHintIneligibleReason:contentID:bundleID:context:](self, "donateHintIneligibleReason:contentID:bundleID:context:", 21, v11, v10, v9);

}

- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 skipUsageCheck:(BOOL)a6 completionHandler:(id)a7
{
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v7 = a7;
  v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "validateAndPrepareContentForDisplay", v9, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
}

- (id)miniTipMetadataForContent:(id)a3 bundleID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  BOOL v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  void *v48;

  v8 = a3;
  v42 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "miniContent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bodyText"));
  if (v12)
  {

    goto LABEL_4;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bodyContent"));

  if (v13)
  {
LABEL_4:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](NSLocale, "tps_userLanguageCode", v42));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "language"));
    if (objc_msgSend(v15, "length"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "language"));
      v17 = objc_msgSend(v16, "isEqualToString:", v14);

      if (v17)
      {
        v18 = 0;
        v19 = TPSTipsManagerErrorDomain;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {

    }
    v20 = objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](TPSLogger, "discoverability"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "language"));
      *(_DWORD *)buf = 138412546;
      v46 = v21;
      v47 = 2112;
      v48 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Content language code (%@) does not match user preferred language (%@)", buf, 0x16u);

    }
    v19 = TPSTipsManagerErrorDomain;
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", TPSTipsManagerErrorDomain, 3, 0));
    goto LABEL_11;
  }
  v39 = objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](TPSLogger, "discoverability"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Content does not contain body text", buf, 2u);
  }

  if (v11)
    v40 = v8 == 0;
  else
    v40 = 0;
  if (v40)
    v41 = 2;
  else
    v41 = 1;
  v19 = TPSTipsManagerErrorDomain;
  v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", TPSTipsManagerErrorDomain, v41, 0, v42));
LABEL_12:
  v22 = objc_msgSend(objc_alloc((Class)TPSMiniTipMetadata), "initWithContent:", v8);
  -[NSObject setError:](v22, "setError:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v18, "domain"));
  v24 = objc_msgSend(v23, "isEqualToString:", v19);

  if (v24)
  {
    v25 = -[NSObject code](v18, "code");
    v26 = 13;
    if (v25 != (id)3)
      v26 = 1;
    if (v25 == (id)2)
      v27 = 14;
    else
      v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    objc_msgSend(v28, "restartTriggerTrackingIfNotDisplayedForIdentifier:", v10);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    v44 = v10;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    objc_msgSend(v29, "markHintIneligibleForIdentifiers:bundleID:context:reason:", v30, v43, v9, v27);

  }
  if (v18
    || objc_msgSend(v8, "isLocalContent")
    && (v33 = -[TPSDaemon displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:](self, "displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:", v8, v9, 1), (v33 & 0xFFFFFFFFFFFFFFF7) != 0)&& (v18 = objc_claimAutoreleasedReturnValue(-[TPSDaemon _errorForHintIneligibleReason:contentID:](self, "_errorForHintIneligibleReason:contentID:", v33, v10)), -[TPSDaemon donateHintIneligibleReason:contentID:bundleID:context:](self, "donateHintIneligibleReason:contentID:bundleID:context:", 21, v10, v43, v9),
        v18))
  {
    v31 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v18;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Mini tip is not valid due to %@", buf, 0xCu);
    }

  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusController](self, "tipStatusController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "userInfoForIdentifier:", v10));
    -[NSObject setUserInfo:](v22, "setUserInfo:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    -[NSObject setCustomizationID:](v22, "setCustomizationID:", objc_msgSend(v36, "customizationIDForContentID:", v10));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "monitoringEventsForContentID:", v10));
    -[NSObject setMonitoringEvents:](v22, "setMonitoringEvents:", v38);

    v18 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Mini tip metadata %@", buf, 0xCu);
    }
  }

  return v22;
}

- (void)donateContentRetrieved:(id)a3 bundleID:(id)a4 context:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  if (a6)
  {
    v12 = a6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
    v14 = objc_msgSend(v12, "code");

    a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld"), v13, v14));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusController](self, "tipStatusController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "correlationIdentifierForIdentifier:", v18));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentRetrieved eventWithTipID:correlationID:bundleID:context:serviceError:](TPSAnalyticsEventContentRetrieved, "eventWithTipID:correlationID:bundleID:context:serviceError:", v18, v16, v10, v11, a6));
  objc_msgSend(v17, "log");

}

- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id obj;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = a6;
  v13 = objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](TPSLogger, "discoverability"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetching for content %@", buf, 0xCu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v36;
    v26 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v18 = -[TPSDaemon statusCheckForHintIneligibleReasonWithContentID:](self, "statusCheckForHintIneligibleReasonWithContentID:", v17);
        if ((v18 & 0xFFFFFFFFFFFFFFF7) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon _errorForHintIneligibleReason:contentID:](self, "_errorForHintIneligibleReason:contentID:", v18, v17));
          -[TPSDaemon donateContentRetrieved:bundleID:context:error:](self, "donateContentRetrieved:bundleID:context:error:", v17, v11, v12, v19);
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController variantIdentifierForIdentifier:](self->_tipStatusController, "variantIdentifierForIdentifier:", v17));
          if (v19)
          {
            objc_msgSend(v27, "addObject:", v19);
          }
          else
          {
            v39 = NSLocalizedDescriptionKey;
            v40 = CFSTR("Invalid Content ID");
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, 5, v20));

            -[TPSDaemon donateContentRetrieved:bundleID:context:error:](self, "donateContentRetrieved:bundleID:context:error:", v17, v11, v12, v21);
          }
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v27, "count"))
  {
    objc_initWeak((id *)buf, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000ED8C;
    v29[3] = &unk_100020E28;
    objc_copyWeak(&v34, (id *)buf);
    v29[4] = self;
    v30 = v11;
    v31 = v12;
    v32 = v24;
    v33 = v25;
    objc_msgSend(v22, "contentForVariantIdentifiers:completionHandler:", v27, v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else if (v24)
  {
    v23 = objc_msgSend(v24, "copy");
    (*((void (**)(id, id, _QWORD))v25 + 2))(v25, v23, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v25 + 2))(v25, 0, 0);
  }

}

- (id)_errorForHintIneligibleReason:(int64_t)a3 contentID:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSErrorUserInfoKey v15;
  __CFString *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v5 = a4;
  if (v5)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFF7) == 0)
    {
      v13 = 0;
      v7 = 0;
      goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:](TPSAnalyticsCommonDefines, "ineligibleReasonStringForReason:", a3));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Content (%@) ineligible due to reason: %@"), v5, v6));

    v8 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    v15 = NSLocalizedDescriptionKey;
    v16 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v10 = v8;
    v11 = 2;
  }
  else
  {
    v12 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    v7 = CFSTR("Invalid Content ID");
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("Invalid Content ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v10 = v12;
    v11 = 1;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, v11, v9));

LABEL_7:
  return v13;
}

- (void)welcome:(id)a3 contentAvailableRemotelyWithCompletionHandler:(id)a4
{
  id v4;
  _QWORD v5[4];
  TPSDaemon *v6;
  id v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F188;
  v5[3] = &unk_100020B88;
  v6 = self;
  v7 = a4;
  v4 = v7;
  -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:](v6, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 1, 0, 1, 0, 0, 0, v5);

}

- (void)welcome:(id)a3 notifyWelcomeDocument:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v7 = objc_msgSend(v5, "updateNotificationCacheWithCollectionIdentifier:document:type:extensionPayload:", v6, v8, 1, 0);

  -[TPSDaemon updateNotificationStatus](self, "updateNotificationStatus");
}

- (id)contextualInfoMap
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  TPSDiscoverabilityController *discoverabilityController;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon usageEventManager](self, "usageEventManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextualInfoMap"));
  v6 = objc_msgSend(v3, "initWithDictionary:", v5);

  discoverabilityController = self->_discoverabilityController;
  if (!discoverabilityController)
    discoverabilityController = (TPSDiscoverabilityController *)TPSDiscoverabilityController;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDiscoverabilityController contextualInfoMap](discoverabilityController, "contextualInfoMap"));
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);
  v9 = objc_msgSend(v6, "copy");

  return v9;
}

- (id)analyticsExperiment
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experiment"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSTipsManager experiment](TPSTipsManager, "experiment"));
  }
  return v5;
}

- (id)tipStatusForIdentifier:(id)a3
{
  return -[TPSTipStatusController statusForIdentifier:](self->_tipStatusController, "statusForIdentifier:", a3);
}

- (id)contextualInfoForIdentifier:(id)a3
{
  TPSDiscoverabilityController *discoverabilityController;
  id v4;
  void *v5;
  id v6;

  discoverabilityController = self->_discoverabilityController;
  if (discoverabilityController)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDiscoverabilityController contextualInfoForIdentifier:](discoverabilityController, "contextualInfoForIdentifier:", v4));
  }
  else
  {
    v6 = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[TPSDiscoverabilityController contextualInfoMap](TPSDiscoverabilityController, "contextualInfoMap"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));

  }
  return v5;
}

- (id)displayTypeForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusForIdentifier:](self, "tipStatusForIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", objc_msgSend(v3, "displayType")));

  return v4;
}

- (id)experimentCampID
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon analyticsExperiment](self, "analyticsExperiment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon experimentCampIDStringForCamp:](self, "experimentCampIDStringForCamp:", objc_msgSend(v3, "camp")));

  return v4;
}

- (id)experimentID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon analyticsExperiment](self, "analyticsExperiment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v2, "identifier")));

  return v3;
}

- (id)experimentCampIDStringForCamp:(int64_t)a3
{
  return +[TPSAnalyticsCommonDefines experimentCampIDStringForCamp:](TPSAnalyticsCommonDefines, "experimentCampIDStringForCamp:", a3);
}

- (id)bundleIDForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayBundleID"));

  return v4;
}

- (id)correlationIDForIdentifier:(id)a3
{
  return -[TPSTipStatusController correlationIdentifierForIdentifier:](self->_tipStatusController, "correlationIdentifierForIdentifier:", a3);
}

- (id)contextForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusForIdentifier:](self, "tipStatusForIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastDisplayContext"));

  return v4;
}

- (unint64_t)hintDisplayedCountForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusForIdentifier:](self, "tipStatusForIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hintDisplayedDates"));
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (void)tipsManager:(id)a3 contextualEligibilityWithTipIdentifiers:(id)a4 tipsDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 experimentCampChangesToAll:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
  objc_msgSend(v14, "contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:", v13, v12, v11, v7);

}

- (void)tipsManagerContentUpdateOverrideCompleted:(id)a3 contentPackage:(id)a4 shouldUpdateNotification:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;

  v7 = a5;
  v10 = a4;
  v9 = a6;
  if (v10)
    -[TPSDaemon indexContentPackage:](self, "indexContentPackage:", v10);
  -[TPSDaemon contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:](self, "contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:", v10, v7, 0, v9);

}

- (BOOL)canCheckForNewTipNotification:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon welcome](self, "welcome", a3));
  v4 = objc_msgSend(v3, "shouldShowWelcomeNotification") ^ 1;

  return v4;
}

- (id)currentExperimentWithDiscoverabilityController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experiment"));

  return v4;
}

- (void)notificationController:(id)a3 markIdentifier:(id)a4 type:(int64_t)a5 ineligibleWithReason:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a3;
  v11 = a4;
  if (a5 == 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
    objc_msgSend(v14, "notifiedCollection:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tipStatusController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "correlationIdentifierForIdentifier:", v11));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentIneligible eventWithTipID:correlationID:bundleID:context:displayType:reason:date:](TPSAnalyticsEventContentIneligible, "eventWithTipID:correlationID:bundleID:context:displayType:reason:date:", v11, v16, 0, 0, 0, a6, 0));
    objc_msgSend(v17, "log");

    goto LABEL_5;
  }
  if (a5 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    v18 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    objc_msgSend(v12, "markHintIneligibleForIdentifiers:context:reason:", v13, 0, a6);

LABEL_5:
  }

}

- (void)notificationController:(id)a3 registrableEventReceivedForDocumentIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[TPSDaemon immediateNotificationForIdentifiers:](self, "immediateNotificationForIdentifiers:", v6);

  }
}

- (void)performQuery:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[TPSSearchQueryManager shared](TPSSearchQueryManager, "shared"));
  objc_msgSend(v7, "performQuery:completion:", v6, v5);

}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[TPSSearchQueryManager shared](TPSSearchQueryManager, "shared"));
  objc_msgSend(v4, "cancelQueryWithIdentifier:", v3);

}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "reindex all searchableItems request from extension", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  objc_msgSend(v6, "reindexAllSearchableItemsWithCompletionHandler:", v4);

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "reindex reindexSearchableItemsWithIdentifiers request from extension: %lu", (uint8_t *)&v10, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  objc_msgSend(v9, "reindexSearchableItemsWithIdentifiers:completionHandler:", v6, v7);

}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "delete all searchableItems request from extension", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  objc_msgSend(v6, "deleteAllSearchableItemsWithCompletionHandler:", v4);

}

- (void)setTipsManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)discoverabilityConnectionQueue
{
  return self->_discoverabilityConnectionQueue;
}

- (void)setDiscoverabilityConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_discoverabilityConnectionQueue, a3);
}

- (OS_dispatch_queue)appConnectionQueue
{
  return self->_appConnectionQueue;
}

- (void)setAppConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_appConnectionQueue, a3);
}

- (OS_dispatch_queue)assistantConnectionQueue
{
  return self->_assistantConnectionQueue;
}

- (void)setAssistantConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assistantConnectionQueue, a3);
}

- (NSURLSession)tipsFeedURLSession
{
  return self->_tipsFeedURLSession;
}

- (void)setTipsFeedURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_tipsFeedURLSession, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSMutableSet)discoverabilityConnections
{
  return self->_discoverabilityConnections;
}

- (void)setDiscoverabilityConnections:(id)a3
{
  objc_storeStrong((id *)&self->_discoverabilityConnections, a3);
}

- (void)setAppConnections:(id)a3
{
  objc_storeStrong((id *)&self->_appConnections, a3);
}

- (NSMutableSet)assistantConnections
{
  return self->_assistantConnections;
}

- (void)setAssistantConnections:(id)a3
{
  objc_storeStrong((id *)&self->_assistantConnections, a3);
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (void)setTipStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_tipStatusController, a3);
}

- (TPSDiscoverabilityController)discoverabilityController
{
  return self->_discoverabilityController;
}

- (void)setDiscoverabilityController:(id)a3
{
  objc_storeStrong((id *)&self->_discoverabilityController, a3);
}

- (void)setNotificationController:(id)a3
{
  objc_storeStrong((id *)&self->_notificationController, a3);
}

- (void)setUsageEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_usageEventManager, a3);
}

- (TPSWelcome)welcome
{
  return self->_welcome;
}

- (void)setWelcome:(id)a3
{
  objc_storeStrong((id *)&self->_welcome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_welcome, 0);
  objc_storeStrong((id *)&self->_usageEventManager, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_discoverabilityController, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_assistantConnections, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
  objc_storeStrong((id *)&self->_discoverabilityConnections, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_tipsFeedURLSession, 0);
  objc_storeStrong((id *)&self->_assistantConnectionQueue, 0);
  objc_storeStrong((id *)&self->_appConnectionQueue, 0);
  objc_storeStrong((id *)&self->_discoverabilityConnectionQueue, 0);
  objc_storeStrong((id *)&self->_notificationTimingDarwinKey, 0);
  objc_storeStrong((id *)&self->_tipsManager, 0);
  objc_storeStrong((id *)&self->_analyticsDataProvider, 0);
}

- (void)findMatchingResultIdFromContexts:(id)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  TPSDaemon *v9;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for ResultContext(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100013BE8(v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v8);
}

- (void)availableUserGuideIdentifiersWithReply:(id)a3
{
  void *v4;
  TPSDaemon *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100013ED4((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)fetchDocumentWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  TPSDaemon *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_1000108E8(&qword_1000267C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = swift_allocObject(&unk_100020FD8, 24, 7);
  *(_QWORD *)(v14 + 16) = v10;
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_100021000, 72, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = sub_100013AC4;
  v16[6] = v14;
  v16[7] = v11;
  v16[8] = v13;
  v17 = self;
  swift_retain(v14);
  swift_bridgeObjectRetain(v13);
  v18 = sub_100012434((uint64_t)v9, (uint64_t)&unk_1000267E8, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

@end
