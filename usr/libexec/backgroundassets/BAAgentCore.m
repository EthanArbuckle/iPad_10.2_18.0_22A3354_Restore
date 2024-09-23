@implementation BAAgentCore

+ (id)sharedCore
{
  if (qword_100065590 != -1)
    dispatch_once(&qword_100065590, &stru_100058FD8);
  return (id)qword_100065588;
}

- (BAAgentCore)init
{
  BAAgentCore *v2;
  dispatch_queue_t v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BAAgentDownloadRulesEngine *v15;
  id v16;
  NSObject *v17;
  BAAgentCore *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  BAAgentCore *v36;
  int v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  NSObject *v43;
  _QWORD v45[4];
  BAAgentCore *v46;
  uint8_t buf[8];
  _QWORD block[4];
  BAAgentCore *v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)BAAgentCore;
  v2 = -[BAAgentCore init](&v50, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.backgroundassets.agentcore.clientnotification.async", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    -[BAAgentCore setAsyncClientNotificationQueue:](v2, "setAsyncClientNotificationQueue:", v3);

    v4 = dispatch_queue_create("com.apple.backgroundassets.agentcore.connectionqueue", 0);
    -[BAAgentCore setConnectionQueue:](v2, "setConnectionQueue:", v4);

    v5 = dispatch_queue_create("com.apple.backgroundassets.agentcore.workqueue", 0);
    -[BAAgentCore setWorkQueue:](v2, "setWorkQueue:", v5);

    v6 = dispatch_queue_create("com.apple.backgroundassets.agentcore.telemetryQueue", 0);
    -[BAAgentCore setTelemetryQueue:](v2, "setTelemetryQueue:", v6);

    v7 = dispatch_queue_create("com.apple.backgroundassets.agentcore.lockdown", 0);
    -[BAAgentCore setLockDownQueue:](v2, "setLockDownQueue:", v7);

    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 32);
    -[BAAgentCore setConnections:](v2, "setConnections:", v8);

    v9 = objc_alloc_init((Class)NSMutableDictionary);
    -[BAAgentCore setExtensionConnections:](v2, "setExtensionConnections:", v9);

    v10 = objc_alloc_init((Class)NSMutableDictionary);
    -[BAAgentCore setDownloadQueuesByClientIdentifier:](v2, "setDownloadQueuesByClientIdentifier:", v10);

    v11 = objc_alloc_init((Class)NSMutableDictionary);
    -[BAAgentCore setTelemetryByDownloadUniqueIdentifier:](v2, "setTelemetryByDownloadUniqueIdentifier:", v11);

    v12 = objc_alloc_init((Class)NSMutableArray);
    -[BAAgentCore setApplicationState:](v2, "setApplicationState:", v12);

    v13 = objc_alloc_init((Class)NSMutableDictionary);
    -[BAAgentCore setConnectionReplyQueue:](v2, "setConnectionReplyQueue:", v13);

    v14 = objc_alloc_init((Class)NSMutableArray);
    -[BAAgentCore setUnhandledDownloadEvents:](v2, "setUnhandledDownloadEvents:", v14);

    v15 = -[BAAgentDownloadRulesEngine initWithDelegate:]([BAAgentDownloadRulesEngine alloc], "initWithDelegate:", v2);
    -[BAAgentCore setRulesEngine:](v2, "setRulesEngine:", v15);

    v16 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
    -[BAAgentCore setTelephonyClient:](v2, "setTelephonyClient:", v16);

    v17 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](v2, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018E48;
    block[3] = &unk_100058998;
    v18 = v2;
    v49 = v18;
    dispatch_async(v17, block);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100018E70, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v18, "_backgroundActivityStateDidChange", NSProcessInfoPowerStateDidChangeNotification, 0);

    v21 = objc_alloc((Class)NSXPCListener);
    v22 = objc_msgSend(v21, "initWithMachServiceName:", off_1000652E8[0]);
    -[BAAgentCore setListener:](v18, "setListener:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore listener](v18, "listener"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connectionQueue](v18, "connectionQueue"));
    objc_msgSend(v23, "_setQueue:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore listener](v18, "listener"));
    objc_msgSend(v25, "setDelegate:", v18);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore listener](v18, "listener"));
    objc_msgSend(v26, "resume");

    v27 = objc_alloc((Class)NSXPCListener);
    v28 = objc_msgSend(v27, "initWithMachServiceName:", off_1000652E0[0]);
    -[BAAgentCore setSpiListener:](v18, "setSpiListener:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore spiListener](v18, "spiListener"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connectionQueue](v18, "connectionQueue"));
    objc_msgSend(v29, "_setQueue:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore spiListener](v18, "spiListener"));
    objc_msgSend(v31, "setDelegate:", v18);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore spiListener](v18, "spiListener"));
    objc_msgSend(v32, "resume");

    v33 = sub_1000128F4();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Started listening for clients.", buf, 2u);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore lockDownQueue](v18, "lockDownQueue"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100018EA4;
    v45[3] = &unk_100059000;
    v36 = v18;
    v46 = v36;
    v37 = lockdown_checkin_xpc("com.apple.backgroundassets.lockdownservice", 0, v35, v45);

    v38 = sub_1000128F4();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    v40 = v39;
    if (v37)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_100035E38(v37, v40);
    }
    else if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Started listening for lockdown clients.", buf, 2u);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore rulesEngine](v36, "rulesEngine"));
    objc_msgSend(v41, "resume");

    v42 = sub_1000128F4();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Started listening for xpc activity.", buf, 2u);
    }

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  id v14;
  NSObject *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
  v9 = objc_msgSend(v8, "isEqualToString:", off_1000652E8[0]);

  if (v9)
  {
    v10 = -[BAAgentCore listener:shouldAcceptNewClientConnection:](self, "listener:shouldAcceptNewClientConnection:", v6, v7);
LABEL_5:
    v13 = v10;
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
  v12 = objc_msgSend(v11, "isEqualToString:", off_1000652E0[0]);

  if (v12)
  {
    v10 = -[BAAgentCore listener:shouldAcceptNewSPIConnection:](self, "listener:shouldAcceptNewSPIConnection:", v6, v7);
    goto LABEL_5;
  }
  v14 = sub_1000129D4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100035EA8(v7, v15);

  v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewClientConnection:(id)a4
{
  id v5;
  BAAgentClientConnection *v6;
  id v7;
  NSObject *v8;
  id v9;
  BAAgentClientConnection *v10;
  _QWORD v12[4];
  BAAgentClientConnection *v13;
  id v14;
  BAAgentCore *v15;
  id v16;

  v5 = a4;
  v16 = 0;
  v6 = -[BAAgentClientConnection initWithNSXPCConnection:error:]([BAAgentClientConnection alloc], "initWithNSXPCConnection:error:", v5, &v16);
  v7 = v16;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019170;
  v12[3] = &unk_100058E30;
  v13 = v6;
  v14 = v5;
  v15 = self;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v12);

  return v10 != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewSPIConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BAAgentSystemConnection *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  _QWORD block[4];
  BAAgentSystemConnection *v20;
  BAAgentCore *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;

  v5 = a4;
  v6 = sub_1000129D4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v26 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "New SPI connection from pid:%{public}d", buf, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.backgroundassets.system")));
  if (objc_msgSend(v8, "BOOLValue"))
  {

LABEL_6:
    v24 = 0;
    v11 = -[BAAgentSystemConnection initWithNSXPCConnection:error:]([BAAgentSystemConnection alloc], "initWithNSXPCConnection:error:", v5, &v24);
    v12 = v24;
    v13 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000195F8;
    block[3] = &unk_100059050;
    v20 = v11;
    v21 = self;
    v22 = v5;
    v23 = v12;
    v14 = v12;
    v15 = v11;
    dispatch_async(v13, block);

    v16 = v15 != 0;
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.backgroundassets.appstore")));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
    goto LABEL_6;
  v17 = sub_1000129D4();
  v15 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100035F78(v5);
  v16 = 0;
LABEL_10:

  return v16;
}

- (void)connectionDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000197A0;
    v6[3] = &unk_100058A10;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)extensionDisconnectedWithIdentifier:(id)a3 connectionProxy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v12));

    if (v10 == v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
      objc_msgSend(v11, "removeObjectForKey:", v12);

      objc_msgSend(v7, "extensionExited");
    }

    objc_sync_exit(v8);
  }

}

- (id)downloaderExtensionForApplicationIdentifier:(id)a3 cacheOnly:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v6));
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100019B4C;
  v19 = sub_100019B5C;
  v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019B64;
  v11[3] = &unk_100059078;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(v7, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)_downloaderExtensionForApplicationIdentifier:(id)a3 cacheOnly:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BADownloaderExtensionProxy *v12;
  id v13;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  BADownloaderExtensionProxy *v21;
  unsigned int v22;
  NSObject *p_super;
  void *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _BOOL4 v40;
  NSObject *v41;
  id v42;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v6));
  if ((objc_msgSend(v7, "allowsBackgroundActivity") & 1) == 0)
  {
    v13 = sub_100012964();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000363AC();
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

  if (!v10)
  {
    objc_sync_exit(v8);

    if (a4)
    {
      v12 = 0;
      goto LABEL_8;
    }
    if ((objc_msgSend(v7, "shouldLaunchExtension") & 1) != 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "extensionIdentity"));
      if (v11)
      {
        v15 = objc_opt_new(_EXHostConfiguration);
        -[NSObject setExtensionIdentity:](v15, "setExtensionIdentity:", v11);
        v42 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[_EXExtensionProcess extensionProcessWithConfiguration:error:](_EXExtensionProcess, "extensionProcessWithConfiguration:error:", v15, &v42));
        v17 = v42;
        v18 = v17;
        if (v16)
        {
          v41 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "makeXPCConnectionWithError:", &v41));
          v20 = v41;

          if (v19)
          {
            v21 = -[BADownloaderExtensionProxy initWithExtension:XPCConnection:applicationInfo:]([BADownloaderExtensionProxy alloc], "initWithExtension:XPCConnection:applicationInfo:", v16, v19, v7);
            v22 = -[BAAgentCore _checkConnection:hasAllowedTeamIDForIdentifier:](self, "_checkConnection:hasAllowedTeamIDForIdentifier:", v19, v6);
            if (v21 && v22)
            {
              p_super = objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
              objc_sync_enter(p_super);
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore extensionConnections](self, "extensionConnections"));
              objc_msgSend(v24, "setObject:forKey:", v21, v6);

              objc_sync_exit(p_super);
            }
            else
            {
              v39 = sub_100012964();
              p_super = objc_claimAutoreleasedReturnValue(v39);
              v40 = os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR);
              if (v21)
              {
                if (v40)
                  sub_100036244(v19, p_super);

                -[BADownloaderExtensionProxy invalidate](v21, "invalidate");
                p_super = &v21->super;
              }
              else if (v40)
              {
                sub_1000362C8(v19, p_super);
              }
              v21 = 0;
            }

            v12 = v21;
          }
          else
          {
            v29 = sub_100012964();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
            if (v20)
            {
              if (v31)
                sub_1000361B8(v20, v30);

              v12 = 0;
            }
            else
            {
              if (v31)
                sub_100036188(v30, v32, v33, v34, v35, v36, v37, v38);
              v12 = 0;
              v20 = v30;
            }
          }
        }
        else
        {
          v27 = sub_100012964();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            sub_1000360FC(v18, v28);

          v12 = 0;
          v20 = v18;
        }

      }
      else
      {
        v26 = sub_100012964();
        v15 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10003609C();
        v12 = 0;
      }

      goto LABEL_7;
    }
    v25 = sub_100012964();
    v11 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10003634C();
    goto LABEL_6;
  }
  v11 = v10;
  objc_sync_exit(v8);

  v12 = (BADownloaderExtensionProxy *)v11;
LABEL_7:

LABEL_8:
  return v12;
}

- (int64_t)applicationExtensionStateForIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", a3));
  v4 = objc_msgSend(v3, "applicationExtensionState");

  return (int64_t)v4;
}

- (int64_t)applicationStateForIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", a3));
  v4 = objc_msgSend(v3, "applicationState");

  return (int64_t)v4;
}

- (void)saveApplicationState
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_not_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A034;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)_deleteDownloadQueueForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

- (id)_downloadQueueForIdentifier:(id)a3 create:(BOOL)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  BADownloadQueue *v11;
  BADownloadQueue *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  v11 = (BADownloadQueue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));

  if (!v11)
  {
    if (a4)
    {
      v12 = -[BADownloadQueue initWithApplicationIdentifier:delegate:]([BADownloadQueue alloc], "initWithApplicationIdentifier:delegate:", v8, self);
      if (v12)
      {
        v11 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
        objc_msgSend(v13, "setObject:forKey:", v11, v8);

        goto LABEL_11;
      }
      if (a5)
      {
        v14 = -104;
        goto LABEL_9;
      }
    }
    else if (a5)
    {
      v14 = -105;
LABEL_9:
      v15 = sub_1000272FC(v14);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_11;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)applicationInfoForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BAApplicationInfo *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v13 = -[BAApplicationInfo initWithIdentifier:]([BAApplicationInfo alloc], "initWithIdentifier:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_msgSend(v14, "addObject:", v13);

  -[BAAgentCore _updateProcessMonitor](self, "_updateProcessMonitor");
  -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
LABEL_12:
  objc_sync_exit(v5);

  return v13;
}

- (id)applicationInfoIfExistsForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (void)applicationPrepareWithDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A58C;
  v7[3] = &unk_100058A10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)applicationPlaceholderReadyWithIdentifier:(id)a3 placeholderBundleURL:(id)a4 userInitiated:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BAAgentCore *v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001A6EC;
  v13[3] = &unk_1000590A0;
  v17 = a5;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)applicationInstallCanceledWithIdentifier:(id)a3 userInitiated:(BOOL)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;

  v5 = a3;
  v6 = sub_100012964();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Event (Canceled) received for client (%{public}s)", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoIfExistsForIdentifier:](self, "applicationInfoIfExistsForIdentifier:", v5));
  if (v8)
  {
    v17 = 0;
    v9 = -[BAAgentCore removeAppWithAppInfo:error:](self, "removeAppWithAppInfo:error:", v8, &v17);
    v10 = v17;
    if ((v9 & 1) != 0)
    {
      v11 = dispatch_time(0, 5000000000);
      v12 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001AA4C;
      v16[3] = &unk_100058998;
      v16[4] = self;
      dispatch_after(v11, v12, v16);

    }
    else
    {
      v14 = sub_100012964();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10003646C();

    }
  }
  else
  {
    v13 = sub_100012964();
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003640C();
  }

}

- (void)_requestNetworkConsentWithApplication:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationIdentifier"));
    if (objc_msgSend(v7, "setAwaitingNetworkConsent:", 1))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore telephonyClient](self, "telephonyClient"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001AB30;
      v10[3] = &unk_1000590C8;
      v11 = v8;
      v12 = v7;
      objc_msgSend(v9, "performNetworkAccessFlowIfAllowed:ignoreForeground:completion:", v11, 1, v10);

    }
  }

}

- (id)updateApplicationInformationForIdentifier:(id)a3 bundleURLPath:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  __CFString *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSBundle), "_initUniqueWithURL:", v7);
    v9 = v8;
    if (v8)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[NSObject infoDictionary](v8, "infoDictionary"));
      if (v10)
      {
        v11 = (id)v10;
        v12 = objc_alloc((Class)LSApplicationRecord);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bundleURL](v9, "bundleURL"));
        v43 = 0;
        v14 = objc_msgSend(v12, "initWithURL:allowPlaceholder:error:", v13, 1, &v43);
        v15 = v43;

        if (v14)
        {
          v16 = v11;
          v11 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v6));
LABEL_15:

          v26 = sub_100012964();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = CFSTR("N/A");
            if (v7)
              v28 = v7;
            *(_DWORD *)buf = 138543618;
            v45 = v6;
            v46 = 2114;
            v47 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Application info for (%{public}@) is being updated based on URL:(%{public}@)", buf, 0x16u);
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue(+[BAApplicationConfigurationOverrides overridesForAppBundleIdentifier:](BAApplicationConfigurationOverrides, "overridesForAppBundleIdentifier:", v6));
          objc_msgSend(v11, "updateApplicationWithInfoDictionary:applicationRecord:overrides:", v16, v14, v29);
          -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
          v11 = v11;

          v30 = v11;
          goto LABEL_36;
        }
        v33 = sub_100012964();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject bundleURL](v9, "bundleURL"));
          *(_DWORD *)buf = 138543874;
          v45 = v6;
          v46 = 2114;
          v47 = v41;
          v48 = 2114;
          v49 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Unable to update application info. LSApplicationRecord from URL failed (bundle identifier: %{public}@, URL: %{public}@) %{public}@", buf, 0x20u);

        }
        v30 = 0;
        v14 = v9;
        goto LABEL_36;
      }
      v32 = sub_100012964();
      v14 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100036668();
    }
    else
    {
      v31 = sub_100012964();
      v14 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100036600();
    }
    v30 = 0;
    v11 = v9;
    goto LABEL_36;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v6));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
  if (!v14
    || (v17 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithPersistentIdentifier:", v14)) == 0)
  {
    v18 = sub_100012964();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Unable to use persistent identifier to update application info. Falling back to bundle identifier lookup. (bundle identifier: %{public}@)", buf, 0xCu);
    }

    v42 = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v42));
    v21 = v42;
    if (v17)
    {
      v22 = objc_opt_class(LSApplicationRecord, v20);
      if ((objc_opt_isKindOfClass(v17, v22) & 1) != 0)
      {

        goto LABEL_13;
      }
      v39 = sub_100012964();
      v36 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_1000365A0();
    }
    else
    {
      v35 = sub_100012964();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_1000364D8();
    }

    v30 = 0;
    goto LABEL_36;
  }
LABEL_13:
  v23 = objc_alloc((Class)NSBundle);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URL](v17, "URL"));
  v15 = objc_msgSend(v23, "_initUniqueWithURL:", v24);

  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "infoDictionary"));
  if (v25)
  {
    v16 = (void *)v25;
    v9 = v14;
    v14 = v17;
    goto LABEL_15;
  }
  v37 = sub_100012964();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    sub_100036540();

  v30 = 0;
  v14 = v17;
LABEL_36:

  return v30;
}

- (void)handleApplicationEvent:(int64_t)a3 identifier:(id)a4 bundleURLPath:(id)a5 userInitiated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  BAManifestDownload *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  _QWORD v50[5];
  NSObject *v51;
  _QWORD v52[4];
  id v53;
  NSObject *v54;
  NSObject *v55;
  int64_t v56;
  _QWORD block[5];
  id v58;
  id v59;
  NSObject *v60;
  _QWORD v61[4];
  id v62;
  NSObject *v63;
  _QWORD v64[4];
  id v65;
  NSObject *v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  id v70;

  v6 = a6;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore updateApplicationInformationForIdentifier:bundleURLPath:](self, "updateApplicationInformationForIdentifier:bundleURLPath:", v10, a5));
  v12 = v11;
  if (v11)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "manifestURL"));
    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationSecurityGroups"));
      if (-[NSObject count](v14, "count"))
      {
        v15 = os_transaction_create("com.apple.backgroundassets.handle-application-event");
        switch(a3)
        {
          case 1:
            v16 = v12;
            v17 = 0;
            goto LABEL_22;
          case 2:
            v16 = v12;
            v17 = 1;
LABEL_22:
            objc_msgSend(v16, "applicationInstallingWithUpdateInstall:", v17);
            -[BAAgentCore invalidateExtensionWithAppInfo:](self, "invalidateExtensionWithAppInfo:", v12);
            -[BAAgentCore _updateProcessMonitor](self, "_updateProcessMonitor");
            -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
            goto LABEL_29;
          case 3:
            v21 = sub_100012964();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              v68 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Event (Restoring) received for client (%{public}s)", buf, 0xCu);
            }

            -[BAAgentCore _updateProcessMonitor](self, "_updateProcessMonitor");
            -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
            break;
          case 4:
            v23 = sub_100012964();
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              v68 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Event (Paused) received for client (%{public}s)", buf, 0xCu);
            }

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationIdentifier"));
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_10001B930;
            v64[3] = &unk_1000590F0;
            v65 = v10;
            v15 = v15;
            v66 = v15;
            -[BAAgentCore pauseQueueWithIdentifier:completionBlock:](self, "pauseQueueWithIdentifier:completionBlock:", v25, v64);

            v26 = v65;
            goto LABEL_40;
          case 5:
            v27 = sub_100012964();
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              v68 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Event (Resumed) received for client (%{public}s)", buf, 0xCu);
            }

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationIdentifier"));
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_10001B994;
            v61[3] = &unk_1000590F0;
            v62 = v10;
            v15 = v15;
            v63 = v15;
            -[BAAgentCore resumeQueueWithIdentifier:completionBlock:](self, "resumeQueueWithIdentifier:completionBlock:", v29, v61);

            v26 = v62;
            goto LABEL_40;
          case 6:
            v30 = objc_msgSend(v12, "receivedInstalledNotification");
            v31 = sub_100012964();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            v33 = v32;
            if (v30)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                sub_100036834(v10, v33);
              goto LABEL_33;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              v68 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Event (Installed) received for client (%{public}s)", buf, 0xCu);
            }

            -[BAAgentCore invalidateExtensionWithAppInfo:](self, "invalidateExtensionWithAppInfo:", v12);
            v48 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10001B9F8;
            block[3] = &unk_100059050;
            block[4] = self;
            v58 = v10;
            v59 = v12;
            v15 = v15;
            v60 = v15;
            dispatch_async(v48, block);

            -[BAAgentCore _updateProcessMonitor](self, "_updateProcessMonitor");
            v26 = v58;
LABEL_40:

            break;
          case 7:
            v34 = sub_100012964();
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              v68 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Event (Periodic) received for client (%{public}s", buf, 0xCu);
            }

LABEL_29:
            if (-[BAAgentCore _applicationIdentifierAllowsBackgroundActivity:](self, "_applicationIdentifierAllowsBackgroundActivity:", v10))
            {
              -[BAAgentCore _requestNetworkConsentWithApplication:userInitiated:](self, "_requestNetworkConsentWithApplication:userInitiated:", v12, v6);
              v36 = [BAManifestDownload alloc];
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v14, "firstObject"));
              v49 = sub_10000B1A8(v36, (uint64_t)v13, a3, v37, v12);

              v38 = sub_100012964();
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
                *(_DWORD *)buf = 134218242;
                v68 = (id)a3;
                v69 = 2082;
                v70 = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Event (%ld) for client (%{public}s) is scheduling manifest for download.", buf, 0x16u);
              }

              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationIdentifier"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
              v52[0] = _NSConcreteStackBlock;
              v52[1] = 3221225472;
              v52[2] = sub_10001BA58;
              v52[3] = &unk_100059118;
              v56 = a3;
              v53 = v10;
              v54 = v13;
              v43 = v15;
              v55 = v43;
              v33 = v49;
              -[BAAgentCore scheduleDownload:forClientIdentifier:notifyQueue:completionBlock:](self, "scheduleDownload:forClientIdentifier:notifyQueue:completionBlock:", v49, v41, v42, v52);

              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_10001BABC;
              v50[3] = &unk_100058A10;
              v50[4] = self;
              v15 = v43;
              v51 = v15;
              v44 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
              objc_msgSend(v12, "performAfterNetworkConsentProvided:queue:", v50, v44);

LABEL_33:
            }
            else
            {
              v45 = sub_100012964();
              v46 = objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                v47 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
                *(_DWORD *)buf = 134218242;
                v68 = (id)a3;
                v69 = 2082;
                v70 = v47;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Event (%ld) ignored for client (%{public}s) because background activity is not allowed.", buf, 0x16u);
              }

            }
            break;
          default:
            break;
        }
      }
      else
      {
        v20 = sub_100012964();
        v15 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1000367C8();
      }

    }
    else
    {
      v19 = sub_100012964();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10003673C();
    }

  }
  else
  {
    v18 = sub_100012964();
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000366D0();
  }

}

- (BOOL)__schedulingPermittedWithIdentifier:(id)a3 downloadQueue:(id *)a4 appInfo:(id *)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v18;

  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore _downloadQueueForIdentifier:create:error:](self, "_downloadQueueForIdentifier:create:error:", v10, 1, a6));
  v13 = v12;
  if (v12)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v10));
    v15 = v14;
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    if ((objc_msgSend(v15, "hasLaunchedApplication") & 1) != 0
      || (objc_msgSend(v15, "permittedForInitialBackgroundActivity") & 1) != 0)
    {
      v16 = 1;
    }
    else if (a6)
    {
      v18 = sub_1000272FC(206);
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    if (a4)
      *a4 = 0;
    v16 = 0;
    if (a5)
      *a5 = 0;
  }

  return v16;
}

- (void)scheduleDownload:(id)a3 forClientIdentifier:(id)a4 notifyQueue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BCE4;
  block[3] = &unk_100059168;
  block[4] = self;
  v20 = v11;
  v22 = v10;
  v23 = v13;
  v21 = v12;
  v15 = v10;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(v14, block);

}

- (void)startForegroundDownload:(id)a3 forClientIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001C20C;
  v15[3] = &unk_100059208;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)pauseQueueWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C680;
  block[3] = &unk_1000591B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)resumeQueueWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C7D8;
  block[3] = &unk_1000591B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)removeAppWithAppInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  char v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  BAAgentCore *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_not_V2(v7);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100019B4C;
  v24 = sub_100019B5C;
  v25 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10001C9F0;
  v15 = &unk_100059230;
  v9 = v6;
  v16 = v9;
  v17 = self;
  v18 = &v20;
  v19 = &v26;
  dispatch_async_and_wait(v8, &v12);

  -[BAAgentCore invalidateExtensionWithAppInfo:](self, "invalidateExtensionWithAppInfo:", v9, v12, v13, v14, v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (void)cancelDownload:(id)a3 forClientIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CD34;
  block[3] = &unk_100059208;
  block[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(v11, block);

}

- (id)downloadForIdentifier:(id)a3 forClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100019B4C;
  v20 = sub_100019B5C;
  v21 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CF3C;
  block[3] = &unk_100059258;
  v15 = &v16;
  block[4] = self;
  v9 = v7;
  v14 = v9;
  dispatch_sync(v8, block);

  v10 = (void *)v17[5];
  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadWithUniqueIdentifier:", v6));
  else
    v11 = 0;

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)downloadsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100019B4C;
  v16 = sub_100019B5C;
  v17 = &__NSArray0__struct;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D090;
  block[3] = &unk_100059280;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_updateProcessMonitor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id obj;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[5];
  uint8_t v43[4];
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D580;
  block[3] = &unk_100058998;
  block[4] = self;
  if (qword_1000655A0 != -1)
    dispatch_once(&qword_1000655A0, block);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(v4);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i));
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationIdentifier"));
        v33 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v14, 1, &v33));
        v16 = v33;

        v18 = objc_opt_class(LSApplicationRecord, v17);
        if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationIdentifier"));
          v20 = objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v19));

          objc_msgSend(v9, "addObject:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "extensionIdentity"));
          v22 = v21;
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundleIdentifier"));
            v24 = objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v23));

            objc_msgSend(v9, "addObject:", v24);
          }
          else
          {
            v27 = sub_1000128F4();
            v24 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              sub_100036A28(v43, v13, &v44, v24);
          }

        }
        else
        {
          v25 = sub_1000128F4();
          v20 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationIdentifier"));
            *(_DWORD *)buf = 138543618;
            v46 = v26;
            v47 = 2112;
            v48 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Cannot observe app with identifier (%{public}@), because the app is not installed. %@", buf, 0x16u);

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v10);
  }

  v28 = (void *)qword_100065598;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001D6CC;
  v31[3] = &unk_1000592D0;
  v32 = v9;
  v29 = v9;
  objc_msgSend(v28, "updateConfiguration:", v31);

}

- (void)_processRunningBoardStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  _QWORD block[5];
  id v35;
  id v36;
  uint64_t v37;
  id v38;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bundle"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "state"));
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endowmentNamespaces"));
      v11 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

      switch(objc_msgSend(v9, "taskState"))
      {
        case 1u:
          v12 = 1;
          break;
        case 2u:
        case 4u:
          if (v11)
            v12 = 5;
          else
            v12 = 4;
          break;
        case 3u:
          v12 = 3;
          break;
        default:
          v12 = 0;
          break;
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "exitEvent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "context"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "status"));
      v16 = objc_msgSend(v15, "code");

      if (v16 != (id)3735943697)
      {
LABEL_25:

        goto LABEL_26;
      }
      v12 = 2;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v38 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v17, 0, &v38));
    v19 = v38;

    if (v18)
    {
      v21 = objc_opt_class(LSApplicationExtensionRecord, v20);
      if ((objc_opt_isKindOfClass(v18, v21) & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "containingBundleRecord"));
        v24 = objc_opt_class(LSApplicationRecord, v23);
        if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
        {
          v25 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001DA00;
          block[3] = &unk_100058C48;
          block[4] = self;
          v35 = v7;
          v36 = v22;
          v37 = v12;
          dispatch_async(v25, block);

        }
        else
        {
          v29 = sub_100012964();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_100036B18();

        }
      }
      else
      {
        v28 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10001DA68;
        v31[3] = &unk_1000592F8;
        v31[4] = self;
        v32 = v7;
        v33 = v12;
        dispatch_async(v28, v31);

      }
    }
    else
    {
      v26 = sub_1000128F4();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100036A9C();

    }
    goto LABEL_25;
  }
LABEL_26:

}

- (void)_updateStateForAppExtensionBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 state:(int64_t)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", a4));
  objc_msgSend(v6, "setApplicationExtensionState:", a5);

}

- (void)_updateStateForAppBundleIdentifier:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  int v28;
  id v29;
  __int16 v30;
  const __CFString *v31;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v6));
  v8 = objc_msgSend(v7, "applicationState");
  objc_msgSend(v7, "setApplicationState:", a4);
  if (v8 != (id)a4)
  {
    if ((unint64_t)(a4 - 1) > 1)
    {
      if (a4 == 3)
      {
        if (v8)
        {
          v12 = sub_1000128F4();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 138543362;
            v29 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) is backgrounded.", (uint8_t *)&v28, 0xCu);
          }

          v14 = objc_msgSend(v7, "allowsBackgroundActivity");
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore _downloadQueueForIdentifier:create:error:](self, "_downloadQueueForIdentifier:create:error:", v6, 0, 0));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allDownloads"));
          v17 = objc_msgSend(v16, "count");

          if (v14)
          {
            if (v17)
            {
              v18 = sub_1000128F4();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v28 = 138543362;
                v29 = v6;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) allows BG activity, pausing any foreground downloads for background demotion.", (uint8_t *)&v28, 0xCu);
              }

              objc_msgSend(v15, "demoteAllForegroundDownloads");
            }
            goto LABEL_35;
          }
          if (!v17)
          {
LABEL_35:

            goto LABEL_36;
          }
          v27 = sub_1000128F4();
          v26 = objc_claimAutoreleasedReturnValue(v27);
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
LABEL_34:

            objc_msgSend(v15, "cancelAllDownloads");
            goto LABEL_35;
          }
          v28 = 138543362;
          v29 = v6;
LABEL_33:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) does NOT allow BG activity, canceling all active downloads.", (uint8_t *)&v28, 0xCu);
          goto LABEL_34;
        }
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        v20 = sub_1000128F4();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = CFSTR("NO");
          if (a4 == 5)
            v22 = CFSTR("YES");
          v28 = 138543618;
          v29 = v6;
          v30 = 2114;
          v31 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) is active. (Foreground = %{public}@)", (uint8_t *)&v28, 0x16u);
        }

        -[BAAgentCore __handleApplicationLaunchedWithInfo:](self, "__handleApplicationLaunchedWithInfo:", v7);
      }
    }
    else if (v8)
    {
      v9 = sub_1000128F4();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (a4 == 2)
      {
        if (v11)
        {
          v28 = 138543362;
          v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) was quit by the user.", (uint8_t *)&v28, 0xCu);
        }

        objc_msgSend(v7, "setUserForceQuitApp:", 1);
      }
      else
      {
        if (v11)
        {
          v28 = 138543362;
          v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) has terminated.", (uint8_t *)&v28, 0xCu);
        }

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore _downloadQueueForIdentifier:create:error:](self, "_downloadQueueForIdentifier:create:error:", v6, 0, 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allDownloads"));
      v24 = objc_msgSend(v23, "count");

      if (!v24 || (objc_msgSend(v7, "allowsBackgroundActivity") & 1) != 0)
        goto LABEL_35;
      v25 = sub_1000128F4();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v28 = 138543362;
      v29 = v6;
      goto LABEL_33;
    }
  }
LABEL_36:

}

- (void)handleApplicationLaunched:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DF50;
  v7[3] = &unk_100058A10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleApplicationLaunchedWithInfo:(id)a3
{
  objc_msgSend(a3, "applicationLaunched");
  -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
}

- (void)_pokeScheduler
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id obj;
  id obja;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v33 = (void *)os_transaction_create("com.apple.backgroundassets.pokeScheduler");
  -[BAAgentCore _scheduleDownloads](self, "_scheduleDownloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v5)
  {
    v6 = v5;
    v37 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "download"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionsForApplicationIdentifier:](self, "_connectionsForApplicationIdentifier:", v10));
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v43;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v43 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j), "isActive") & 1) != 0)
              {
                v17 = 1;
                goto LABEL_16;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
            if (v14)
              continue;
            break;
          }
        }
        v17 = 0;
LABEL_16:

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoIfExistsForIdentifier:](self, "applicationInfoIfExistsForIdentifier:", v10));
        if ((objc_msgSend(v18, "receivedInstalledNotification") & 1) != 0
          || (objc_msgSend(v18, "receivedInstallingNotification") & 1) == 0)
        {
          if ((v17 & 1) != 0
            || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore _downloaderExtensionForApplicationIdentifier:cacheOnly:](self, "_downloaderExtensionForApplicationIdentifier:cacheOnly:", v10, 0)), v19, v19))
          {
            objc_msgSend(v36, "addObject:", v8);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v6);
  }

  obja = objc_msgSend(v36, "count");
  if (obja)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));
    objc_msgSend(v20, "removeObjectsInArray:", v36);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = v36;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)k);
        if (objc_msgSend(v26, "type") == (id)1)
        {
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "download"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "download"));
          v30 = sub_100030230(v28, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          -[BAAgentCore download:finishedWithFileURL:](self, "download:finishedWithFileURL:", v27, v31);

LABEL_34:
          goto LABEL_37;
        }
        if (objc_msgSend(v26, "type") == (id)2)
        {
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "download"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "eventError"));
          -[BAAgentCore download:failedWithError:](self, "download:failedWithError:", v27, v28);
          goto LABEL_34;
        }
        v32 = sub_1000128F4();
        v27 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Dropping unknown unhandled event type in list: %{public}@", buf, 0xCu);
        }
LABEL_37:

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v23);
  }

  if (obja)
    -[BAAgentCore _serializeUndeliveredEvents](self, "_serializeUndeliveredEvents");

}

- (void)_scheduleDownloads
{
  NSObject *v3;
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return;
  v24 = (void *)os_transaction_create("com.apple.backgroundassets.scheduleDownloads");
  v6 = -[BAAgentCore _downloadsInProgress](self, "_downloadsInProgress");
  if (v6 >= 0x32)
  {
    v7 = sub_1000128F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v32 = v6;
      v33 = 2048;
      v34 = 50;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Daemon has reached maximum active download limit. (Active Downloads: %lu, Daemon Limit: %lu)", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", &stru_100059338));

  v11 = 0;
  while (2)
  {
    v26 = v11;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v25;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (!v12)
    {
LABEL_22:

      break;
    }
    v13 = v12;
    v14 = *(_QWORD *)v28;
LABEL_8:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
      if ((uint64_t)objc_msgSend(v16, "numberOfWaitingDownloads") < 1)
        goto LABEL_17;
      v17 = objc_msgSend(v16, "numberOfActiveDownloads");
      if ((unint64_t)v17 >= 0x19)
      {
        v18 = (uint64_t)v17;
        v19 = sub_1000128F4();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          *(_DWORD *)buf = 138543874;
          v32 = (unint64_t)v21;
          v33 = 2048;
          v34 = v18;
          v35 = 2048;
          v36 = 25;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Download queue (%{public}@ has reached its limit. (Active Downloads: %lu, Queue Limit: %lu)", buf, 0x20u);

        }
        goto LABEL_17;
      }
      v22 = objc_autoreleasePoolPush();
      v23 = objc_msgSend(v16, "startNextDownload");
      objc_autoreleasePoolPop(v22);
      if ((v23 & 1) != 0)
        break;
LABEL_17:
      if (v13 == (id)++v15)
      {
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v13)
          goto LABEL_8;
        goto LABEL_22;
      }
    }
    v11 = v26 + 1;

    if (v26 + 1 < (uint64_t)(50 - v6))
      continue;
    break;
  }
LABEL_23:

}

- (void)downloadDidBegin:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BAAgentCore *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v5));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E8CC;
  v10[3] = &unk_100059050;
  v11 = v4;
  v12 = self;
  v13 = v5;
  v14 = (id)os_transaction_create("com.apple.backgroundassets.BAAgentCore.downloadDidBegin");
  v7 = v14;
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

- (void)downloadDidPause:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BAAgentCore *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v5));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001ED18;
  v10[3] = &unk_100059050;
  v11 = v4;
  v12 = self;
  v13 = v5;
  v14 = (id)os_transaction_create("com.apple.backgroundassets.BAAgentCore.downloadDidPause");
  v7 = v14;
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

- (void)download:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v11));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001F1C0;
  v18[3] = &unk_1000593B0;
  v18[4] = self;
  v19 = v11;
  v20 = v8;
  v21 = v9;
  v22 = (id)os_transaction_create("com.apple.backgroundassets.BAAgentCore.didReceiveChallenge");
  v23 = v10;
  v13 = v10;
  v14 = v22;
  v15 = v9;
  v16 = v8;
  v17 = v11;
  dispatch_async(v12, v18);

}

- (void)download:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  _QWORD block[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100019B4C;
  v28[4] = sub_100019B5C;
  v29 = 0;
  v12 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FAB0;
  block[3] = &unk_100059258;
  v27 = v28;
  block[4] = self;
  v13 = v11;
  v26 = v13;
  dispatch_async_and_wait(v12, block);

  v14 = (void *)os_transaction_create("com.apple.backgroundassets.BAAgentCore.didWriteBytes");
  v15 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v13));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001FAEC;
  v18[3] = &unk_1000593D8;
  v21 = v28;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v19 = v10;
  v20 = v14;
  v16 = v14;
  v17 = v10;
  dispatch_async(v15, v18);

  _Block_object_dispose(v28, 8);
}

- (void)download:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  BAUnhandledDownloadEvent *v17;
  BAUnhandledDownloadEvent *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  BAUnhandledDownloadEvent *v23;
  id v24;
  BAAgentCore *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  BAUnhandledDownloadEvent *v31;
  BAAgentCore *v32;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryQueue](self, "telemetryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FE70;
  block[3] = &unk_100058E30;
  block[4] = self;
  v9 = v6;
  v35 = v9;
  v10 = v7;
  v36 = v10;
  dispatch_async(v8, block);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v11));
  v14 = (void *)os_transaction_create("com.apple.backgroundassets.BAAgentCore.failedWithError");
  if (objc_msgSend(v13, "receivedInstallingNotification")
    && (objc_msgSend(v13, "receivedInstalledNotification") & 1) == 0)
  {
    v18 = -[BAUnhandledDownloadEvent initWithEventType:download:error:]([BAUnhandledDownloadEvent alloc], "initWithEventType:download:error:", 2, v9, v10);
    v19 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001FE80;
    v29[3] = &unk_100059050;
    v30 = v11;
    v31 = v18;
    v32 = self;
    v33 = v14;
    v20 = v14;
    v17 = v18;
    v21 = v11;
    dispatch_async(v19, v29);

  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001FF5C;
    v22[3] = &unk_100058C70;
    v23 = (BAUnhandledDownloadEvent *)v9;
    v24 = v10;
    v25 = self;
    v26 = v11;
    v27 = v14;
    v28 = v13;
    v15 = v14;
    v16 = v11;
    dispatch_async(v12, v22);

    v17 = v23;
  }

}

- (void)download:(id)a3 finishedWithFileURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  BAUnhandledDownloadEvent *v14;
  void *v15;
  NSObject *v16;
  id *v17;
  id v18;
  BAUnhandledDownloadEvent *v19;
  BAUnhandledDownloadEvent *v20;
  BAUnhandledDownloadEvent *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[2];
  BAUnhandledDownloadEvent *v26;
  id v27;
  _QWORD v28[4];
  BAUnhandledDownloadEvent *v29;
  BAUnhandledDownloadEvent *v30;
  BAAgentCore *v31;
  id v32;
  _QWORD block[5];
  id v34;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(BAManifestDownload, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100036D94();
    qword_1000654C8 = (uint64_t)"BUG IN BackgroundAssets: BAAgentCore received a finished file that was a BAManifestDownlo"
                               "ad. This is invalid.";
    __break(1u);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryQueue](self, "telemetryQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020AF4;
    block[3] = &unk_100058A10;
    block[4] = self;
    v11 = v6;
    v34 = v11;
    dispatch_async(v10, block);

    v12 = (void *)os_transaction_create("com.apple.backgroundassets.BAAgentCore.finishedWithFileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationIdentifier"));
    v14 = (BAUnhandledDownloadEvent *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v13));

    if (-[BAUnhandledDownloadEvent receivedInstallingNotification](v14, "receivedInstallingNotification")
      && (-[BAUnhandledDownloadEvent receivedInstalledNotification](v14, "receivedInstalledNotification") & 1) == 0)
    {
      v21 = -[BAUnhandledDownloadEvent initWithEventType:download:error:]([BAUnhandledDownloadEvent alloc], "initWithEventType:download:error:", 1, v11, 0);
      v22 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100020B04;
      v28[3] = &unk_100059050;
      v17 = (id *)&v29;
      v29 = v14;
      v30 = v21;
      v31 = self;
      v32 = v12;
      v23 = v12;
      v19 = v21;
      v16 = v14;
      dispatch_async(v22, v28);

      v20 = v30;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent applicationIdentifier](v14, "applicationIdentifier"));
      v16 = objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v15));

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100020BFC;
      v24[3] = &unk_100059050;
      v17 = (id *)v25;
      v25[0] = v11;
      v25[1] = self;
      v26 = v14;
      v27 = v12;
      v18 = v12;
      v19 = v14;
      dispatch_async(v16, v24);

      v20 = v26;
    }

  }
}

- (id)_essentialAssetsProgressDescriptorWithAppInfo:(id)a3 essentialAssetState:(int64_t)a4 sizeDownloaded:(int64_t)a5 totalDownloadSize:(int64_t)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;

  v9 = a3;
  v10 = v9;
  switch(a4)
  {
    case 1:
      a5 = -1;
      v11 = 2;
      goto LABEL_4;
    case 2:
      a6 = (int64_t)objc_msgSend(v9, "essentialAssetDownloadAllowance");
      v12 = objc_msgSend(v10, "optionalAssetDownloadAllowance");
      if ((unint64_t)v12 > a6)
        a6 = (int64_t)v12;
      v11 = 3;
      break;
    case 3:
      a6 = -1;
      v11 = 4;
      break;
    case 4:
      v11 = 5;
      break;
    case 5:
      v11 = 6;
      break;
    default:
      a5 = -1;
      v11 = 1;
LABEL_4:
      a6 = -1;
      break;
  }
  v13 = sub_10000B988([BAAppStoreProgressInfoDescriptor alloc], v11, a5, a6);

  return v13;
}

- (id)essentialAssetsProgressDescriptorWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100019B4C;
  v16 = sub_100019B5C;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021CBC;
  block[3] = &unk_100059280;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)downloadQueue:(id)a3 manifest:(id)a4 finishedWithFileURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BAAgentCore *v21;
  id v22;
  id v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore _connectionReplyQueueForIdentifier:](self, "_connectionReplyQueueForIdentifier:", v11));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100021F10;
  v18[3] = &unk_100058C70;
  v19 = v8;
  v20 = v7;
  v21 = self;
  v22 = (id)os_transaction_create("com.apple.backgroundassets.BAAgentCore.manifest:finishedWithFileURL");
  v23 = v10;
  v24 = v12;
  v13 = v12;
  v14 = v10;
  v15 = v22;
  v16 = v7;
  v17 = v8;
  dispatch_async(v13, v18);

}

- (void)downloadQueue:(id)a3 essentialAssetState:(int64_t)a4 bytesWritten:(int64_t)a5 totalBytes:(int64_t)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;

  v10 = a3;
  v11 = (void *)os_transaction_create("com.apple.backgroundassets.BAAgentCore.downloadQueue.essentialAssetState");
  v12 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022E6C;
  v15[3] = &unk_100059590;
  v15[4] = self;
  v16 = v10;
  v19 = a5;
  v20 = a6;
  v17 = v11;
  v18 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

- (BOOL)downloadQueue:(id)a3 permittedToStartDownloadsWithNecessity:(int64_t)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  unsigned __int8 v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoIfExistsForIdentifier:](self, "applicationInfoIfExistsForIdentifier:", v6));

  if (v7 && (objc_msgSend(v7, "awaitingNetworkConsent") & 1) == 0)
  {
    if ((objc_msgSend(v7, "receivedInstallingNotification") & 1) != 0
      || objc_msgSend(v7, "receivedInstalledNotification"))
    {
      if (a4 == 1)
        v9 = objc_msgSend(v7, "receivedInstallingNotification");
      else
        v9 = objc_msgSend(v7, "receivedInstalledNotification");
      v8 = v9;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setContentRequestTelemetry:(id)a3 forDownloads:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryQueue](self, "telemetryQueue"));
  dispatch_assert_queue_V2(v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryByDownloadUniqueIdentifier](self, "telemetryByDownloadUniqueIdentifier", (_QWORD)v17));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));
        objc_msgSend(v15, "setObject:forKey:", v6, v16);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)updateContentRequestTelemetryForCompletedDownload:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryQueue](self, "telemetryQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryByDownloadUniqueIdentifier](self, "telemetryByDownloadUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  if (v10)
  {
    objc_msgSend(v10, "recordDownloadCompletion:error:", v13, v6);
    if (objc_msgSend(v10, "allDownloadsCompleted"))
      +[BATelemetrySender sendContentRequestTelemetryEvent:](BATelemetrySender, "sendContentRequestTelemetryEvent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore telemetryByDownloadUniqueIdentifier](self, "telemetryByDownloadUniqueIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
}

- (void)downloadTimeValidityDidChange
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023398;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)doPeriodicUpdateCheck
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  v5 = objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "shouldDoPeriodicCheck", (_QWORD)v12) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
          -[BAAgentCore handleApplicationEvent:identifier:bundleURLPath:userInitiated:](self, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:", 7, v11, 0, 0);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)_checkIdentifierHasExtension:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;

  v3 = a3;
  v34 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v34));
  v6 = v34;
  if (v4)
  {
    v7 = objc_opt_class(LSApplicationRecord, v5);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationExtensionRecords"));
      if (-[NSObject count](v9, "count"))
      {
        v28 = v6;
        v29 = v3;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = v9;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "extensionPointRecord", v28));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
              v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.background-asset-downloader-extension"));

              if ((v17 & 1) != 0)
              {
                v19 = 1;
                goto LABEL_27;
              }
            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            if (v12)
              continue;
            break;
          }
        }

        v18 = sub_1000128F4();
        v10 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v3 = v29;
          v37 = v29;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bundle for %{public}@ does not have a downloader extension. Blocking.", buf, 0xCu);
          v19 = 0;
        }
        else
        {
          v19 = 0;
LABEL_27:
          v3 = v29;
        }
        v6 = v28;
      }
      else
      {
        v26 = sub_1000128F4();
        v10 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v37 = v3;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bundle for %{public}@ does not have a extension record. Blocking.", buf, 0xCu);
        }
        v19 = 0;
      }
      goto LABEL_29;
    }
    v24 = objc_opt_class(LSApplicationExtensionRecord, v8);
    if ((objc_opt_isKindOfClass(v4, v24) & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extensionPointRecord"));
      v10 = objc_claimAutoreleasedReturnValue(-[NSObject identifier](v9, "identifier"));
      v19 = -[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.background-asset-downloader-extension"));
LABEL_29:

      goto LABEL_30;
    }
    v25 = sub_1000128F4();
    v9 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v3;
      v21 = "Bundle for %{public}@ is not application or extension. Blocking.";
      v22 = v9;
      v23 = 12;
      goto LABEL_20;
    }
  }
  else
  {
    v20 = sub_1000128F4();
    v9 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v3;
      v38 = 2114;
      v39 = v6;
      v21 = "Failed to get bundle record for identifier: %{public}@ error: %{public}@";
      v22 = v9;
      v23 = 22;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
  }
  v19 = 0;
LABEL_30:

  return v19;
}

- (BOOL)_checkConnection:(id)a3 hasAllowedTeamIDForIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", off_1000652F0[0]));

  v10 = objc_opt_class(NSString, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationTeamIdentifier"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationTeamIdentifier"));
      v13 = objc_msgSend(v12, "isEqualToString:", v8);

    }
    else
    {
      objc_msgSend(v7, "setApplicationTeamIdentifier:", v8);
      -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_setClearBeforeShutdown
{
  -[BAAgentCore setDebugClearState:](self, "setDebugClearState:", 1);
}

- (void)_clearState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, 0));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", off_1000652E8[0]));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("ApplicationState.bin")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("DownloadQueues.bin")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("UndeliveredEvents.bin")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v8, "removeItemAtURL:error:", v5, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v9, "removeItemAtURL:error:", v6, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v10, "removeItemAtURL:error:", v7, 0);

  }
  if (!+[BAApplicationConfigurationOverrides clearAllOverrides](BAApplicationConfigurationOverrides, "clearAllOverrides"))
  {
    v11 = sub_1000128F4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100037148(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)_debugShutdown
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000128F4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Debug shutdown called. Preparing to exit", v5, 2u);
  }

  -[BAAgentCore _shutdownAgent](self, "_shutdownAgent");
}

- (void)_printDebugState
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023C8C;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)_systemConnections
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connections](self, "connections", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(BAAgentSystemConnection, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          objc_msgSend(v3, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)invalidateExtensionWithAppInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *__ptr32 *v11;
  void *v12;
  BATerminationAssertion *v13;
  id v14;
  NSObject *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  dispatch_semaphore_t v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  _QWORD v33[4];
  id v34;
  dispatch_semaphore_t v35;
  id v36;
  uint8_t buf[4];
  void *v38;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloaderExtensionForApplicationIdentifier:cacheOnly:](self, "downloaderExtensionForApplicationIdentifier:cacheOnly:", v6, 1));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "extensionWillTerminate");
    objc_msgSend(v8, "invalidate");
    -[BAAgentCore extensionDisconnectedWithIdentifier:connectionProxy:](self, "extensionDisconnectedWithIdentifier:connectionProxy:", v6, v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extensionIdentity"));
  v10 = v9;
  v11 = &off_100042000;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v13 = -[BATerminationAssertion initWithBundleIdentifier:]([BATerminationAssertion alloc], "initWithBundleIdentifier:", v12);
    v14 = sub_1000128F4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Acquiring termination assertion for extension: %{public}@", buf, 0xCu);
    }

    v36 = 0;
    v16 = -[BATerminationAssertion acquireAssertionSync:](v13, "acquireAssertionSync:", &v36);
    v30 = v36;
    if ((v16 & 1) == 0)
    {
      v17 = sub_1000128F4();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100037178();

    }
    v19 = dispatch_semaphore_create(0);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create("com.apple.BackgroundAssets.launch_removal_queue", v21);

    v23 = objc_retainAutorelease(v12);
    v24 = objc_msgSend(v23, "UTF8String");
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100024B1C;
    v33[3] = &unk_1000595B8;
    v34 = v23;
    v35 = v19;
    v25 = v19;
    v26 = v23;
    v27 = v24;
    v11 = &off_100042000;
    launch_remove_external_service(v27, 0, v22, v33);
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    -[BATerminationAssertion invalidate](v13, "invalidate");

  }
  v28 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = *((_QWORD *)v11 + 412);
  block[2] = sub_100024C00;
  block[3] = &unk_100058A10;
  block[4] = self;
  v32 = v6;
  v29 = v6;
  dispatch_async(v28, block);

}

- (id)_connectionsForApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connections](self, "connections", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(BAAgentClientConnection, v9);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationBundleIdentifier"));
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if (v16)
            objc_msgSend(v6, "addObject:", v13);
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "sortUsingComparator:", &stru_1000595F8);
  return v6;
}

- (void)_pauseDownloads
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "pauseAllDownloads", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_deserializeState
{
  id v3;

  v3 = (id)os_transaction_create("baagent.deserializestate");
  -[BAAgentCore _deserializeApplicationList](self, "_deserializeApplicationList");
  -[BAAgentCore _deserializeDownloadQueues](self, "_deserializeDownloadQueues");
  -[BAAgentCore _deserializeUndeliveredEvents](self, "_deserializeUndeliveredEvents");

}

- (void)_deserializeApplicationList
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  char v61[16];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[BAApplicationInfo extensionContainingApplicationList](BAApplicationInfo, "extensionContainingApplicationList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v60 = 0;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v60));
  v3 = v60;

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "URLByAppendingPathComponent:", off_1000652E8[0]));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "URLByAppendingPathComponent:", CFSTR("ApplicationState.bin")));
  if (!v41)
  {
    v26 = sub_1000128F4();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    sub_100037238();
LABEL_36:
    v28 = v27;
    goto LABEL_41;
  }
  v37 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithContentsOfURL:](NSMutableData, "dataWithContentsOfURL:"));
  if (!v37)
  {
    v29 = sub_1000128F4();
    v27 = objc_claimAutoreleasedReturnValue(v29);
    v28 = v27;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    sub_100037298();
    goto LABEL_36;
  }
  v59 = v3;
  v36 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v37, &v59);
  v34 = v59;

  objc_msgSend(v36, "setDecodingFailurePolicy:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAApplicationInfo classesForSerialization](BAApplicationInfo, "classesForSerialization"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "decodeObjectOfClasses:forKey:", v4, CFSTR("Application State")));

  obj = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_msgSend(v5, "removeAllObjects");

  if (v44)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v42 = v38;
    v6 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v6)
    {
      v43 = *(_QWORD *)v56;
      do
      {
        v45 = v6;
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v43)
            objc_enumerationMutation(v42);
          v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v9 = v44;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v52;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(_QWORD *)v52 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationIdentifier"));
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationIdentifier"));
                v16 = objc_msgSend(v14, "isEqualToString:", v15);

                if (v16)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
                  objc_msgSend(v17, "addObject:", v13);

                  goto LABEL_19;
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
              if (v10)
                continue;
              break;
            }
          }

          v9 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
          objc_msgSend(v9, "addObject:", v8);
LABEL_19:

        }
        v6 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v6);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = v44;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k);
          if ((objc_msgSend(v22, "receivedInstallingNotification") & 1) == 0)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
            v24 = objc_msgSend(v23, "containsObject:", v22);

            if ((v24 & 1) == 0)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
              objc_msgSend(v25, "addObject:", v22);

            }
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      }
      while (v19);
    }
  }
  else
  {
    v30 = sub_1000128F4();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "error"));
      sub_1000372F8(v32, (uint64_t)v61, v31);
    }

    v18 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
    v33 = objc_msgSend(v38, "mutableCopy");
    objc_msgSend(v18, "addObjectsFromArray:", v33);

  }
  objc_sync_exit(obj);

  -[BAAgentCore _updateProcessMonitor](self, "_updateProcessMonitor");
  v3 = v34;
  v28 = (void *)v37;
LABEL_41:

}

- (void)_deserializeDownloadQueues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v31 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v31));
  v6 = v31;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", off_1000652E8[0]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("DownloadQueues.bin")));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithContentsOfURL:](NSMutableData, "dataWithContentsOfURL:", v8));
    if (v9)
    {
      v10 = v9;
      v30 = v6;
      v11 = -[BAAgentKeyedUnarchiver initForReadingFromData:error:]([BAAgentKeyedUnarchiver alloc], "initForReadingFromData:error:", v9, &v30);
      v12 = v30;

      objc_msgSend(v11, "setAgentCore:", self);
      objc_msgSend(v11, "setDecodingFailurePolicy:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BADownloadQueue classesForSerialization](BADownloadQueue, "classesForSerialization"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v13, CFSTR("Queues")));

      if (v14)
      {
        v24 = v12;
        v25 = v5;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "setDelegate:", self);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          }
          while (v17);
        }

        v20 = objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
        -[NSObject addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v14);
        v12 = v24;
        v5 = v25;
      }
      else
      {
        v23 = sub_1000128F4();
        v20 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_100037404(v11, v20);
      }

      v6 = v12;
    }
    else
    {
      v22 = sub_1000128F4();
      v10 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000373A4();
    }
  }
  else
  {
    v21 = sub_1000128F4();
    v10 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100037344();
  }

}

- (void)_deserializeUndeliveredEvents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v24));
  v6 = v24;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", off_1000652E8[0]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("UndeliveredEvents.bin")));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithContentsOfURL:](NSMutableData, "dataWithContentsOfURL:", v8));
    if (v9)
    {
      v10 = v9;
      v23 = v6;
      v11 = -[BAAgentKeyedUnarchiver initForReadingFromData:error:]([BAAgentKeyedUnarchiver alloc], "initForReadingFromData:error:", v9, &v23);
      v12 = v23;

      objc_msgSend(v11, "setAgentCore:", self);
      objc_msgSend(v11, "setDecodingFailurePolicy:", 1);
      v14 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSArray, v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BAUnhandledDownloadEvent classesForSerialization](BAUnhandledDownloadEvent, "classesForSerialization"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "setByAddingObjectsFromSet:", v16));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v17, CFSTR("Undelivered Events")));
      if (v18)
      {
        v19 = objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));
        -[NSObject addObjectsFromArray:](v19, "addObjectsFromArray:", v18);
      }
      else
      {
        v22 = sub_1000128F4();
        v19 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100037544(v11, v19);
      }

      v6 = v12;
    }
    else
    {
      v21 = sub_1000128F4();
      v10 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000374E4();
    }
  }
  else
  {
    v20 = sub_1000128F4();
    v10 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100037484();
  }

}

- (void)_serializeState
{
  id v3;

  v3 = (id)os_transaction_create("baagent.serializestate");
  -[BAAgentCore _serializeApplicationState](self, "_serializeApplicationState");
  -[BAAgentCore _serializeDownloadQueues](self, "_serializeDownloadQueues");
  -[BAAgentCore _serializeUndeliveredEvents](self, "_serializeUndeliveredEvents");

}

- (void)_serializeDownloadQueues
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;

  v3 = (void *)os_transaction_create("baagent.serializestate.downloadqueues");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));

  if (v4)
  {
    v5 = -[BAAgentKeyedArchiver initRequiringSecureCoding:]([BAAgentKeyedArchiver alloc], "initRequiringSecureCoding:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
    objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("Queues"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v21));
    v9 = v21;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", off_1000652E8[0]));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v20 = v9;
    objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v20);
    v12 = v20;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("DownloadQueues.bin")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encodedData"));
    v19 = v12;
    v15 = objc_msgSend(v14, "writeToURL:options:error:", v13, 1, &v19);
    v16 = v19;

    if ((v15 & 1) == 0)
    {
      v17 = sub_1000128F4();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000375C4();

    }
    v3 = 0;
  }

}

- (void)_serializeApplicationState
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;

  v3 = (void *)os_transaction_create("baagent.serializestate.applicationstates");
  v4 = -[BAAgentKeyedArchiver initRequiringSecureCoding:]([BAAgentKeyedArchiver alloc], "initRequiringSecureCoding:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Application State"));

    objc_sync_exit(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v22));
    v10 = v22;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", off_1000652E8[0]));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = v10;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v21);
    v13 = v21;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("ApplicationState.bin")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
    v20 = v13;
    v16 = objc_msgSend(v15, "writeToURL:options:error:", v14, 1, &v20);
    v17 = v20;

    if ((v16 & 1) == 0)
    {
      v18 = sub_1000128F4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100037624();

    }
  }
  else
  {

    objc_sync_exit(v5);
  }

}

- (void)_serializeUndeliveredEvents
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v20 = (id)os_transaction_create("baagent.serializestate.undeliveredevents");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));

  if (v4)
  {
    v5 = objc_autoreleasePoolPush();
    v6 = -[BAAgentKeyedArchiver initRequiringSecureCoding:]([BAAgentKeyedArchiver alloc], "initRequiringSecureCoding:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore unhandledDownloadEvents](self, "unhandledDownloadEvents"));
    objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("Undelivered Events"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v23));
    v10 = v23;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", off_1000652E8[0]));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22 = v10;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v22);
    v13 = v22;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("UndeliveredEvents.bin")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodedData"));
    v21 = v13;
    v16 = objc_msgSend(v15, "writeToURL:options:error:", v14, 1, &v21);
    v17 = v21;

    if ((v16 & 1) == 0)
    {
      v18 = sub_1000128F4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100037624();

    }
    objc_autoreleasePoolPop(v5);

  }
  else
  {

  }
}

- (void)_asyncAwaitLockdownClientMessage:(_lockdown_connection *)a3 waitQueue:(id)a4
{
  NSObject *v6;
  _QWORD block[5];
  id v8;
  _lockdown_connection *v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026290;
  block[3] = &unk_1000592F8;
  v8 = a4;
  v9 = a3;
  block[4] = self;
  v6 = v8;
  dispatch_async(v6, block);

}

- (void)_processLockdownClientMessage:(id)a3 withConnection:(_lockdown_connection *)a4 withQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  BADeveloperDebugServerMessageVersionCheck *v11;
  const __CFString *v12;
  uint64_t v13;
  BADeveloperDebugServerMessageVersionCheck *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BAAgentCore *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BADeveloperDebugServerMessageVersionCheck *v34;
  id v35;
  NSObject *v36;
  id v37;

  v8 = a3;
  v9 = a5;
  switch((unint64_t)objc_msgSend(v8, "messageOperation"))
  {
    case 1uLL:
      v10 = objc_msgSend(v8, "messageVersion");
      v11 = [BADeveloperDebugServerMessageVersionCheck alloc];
      if ((unint64_t)v10 < 2)
      {
        v13 = 1;
        v12 = 0;
      }
      else
      {
        v12 = CFSTR("The tool being used to debug Background Assets is newer and unsupported on the connected device's OS version.");
        v13 = 0;
      }
      v34 = -[BADeveloperDebugServerMessageVersionCheck initWithVersionAllowed:failureExplanation:](v11, "initWithVersionAllowed:failureExplanation:", v13, v12);
      v14 = v34;
      if (!v34)
        goto LABEL_14;
      v37 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugMessage archivedRepresentationWithError:](v34, "archivedRepresentationWithError:", &v37));
      v18 = v37;
      if (v20)
      {
        if (!lockdown_send_message(a4, v20, 200))
          goto LABEL_10;
      }
      else
      {
        v35 = sub_1000128F4();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_100037684();

      }
      lockdown_disconnect(a4);

      goto LABEL_25;
    case 2uLL:
      v14 = (BADeveloperDebugServerMessageVersionCheck *)v8;
      v16 = objc_opt_class(BADeveloperDebugClientMessageApplicationInstalled, v15);
      if ((objc_opt_isKindOfClass(v14, v16) & 1) == 0)
        goto LABEL_15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[BAAppStorePrepareDescriptor descriptorWithAppBundleIdentifier:appStoreMetadata:client:](BAAppStorePrepareDescriptor, "descriptorWithAppBundleIdentifier:appStoreMetadata:client:", v17, &__NSDictionary0__struct, 3));

      objc_msgSend(v18, "setCellularPolicy:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appBundleIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v19));

      objc_msgSend(v20, "applicationPrepareWithDescriptor:", v18);
      objc_msgSend(v20, "resetExtensionRuntime");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
      v22 = self;
      v23 = 1;
      goto LABEL_9;
    case 3uLL:
      v14 = (BADeveloperDebugServerMessageVersionCheck *)v8;
      v25 = objc_opt_class(BADeveloperDebugClientMessageApplicationUpdated, v24);
      if ((objc_opt_isKindOfClass(v14, v25) & 1) == 0)
        goto LABEL_15;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[BAAppStorePrepareDescriptor descriptorWithAppBundleIdentifier:appStoreMetadata:client:](BAAppStorePrepareDescriptor, "descriptorWithAppBundleIdentifier:appStoreMetadata:client:", v26, &__NSDictionary0__struct, 3));

      objc_msgSend(v18, "setCellularPolicy:", 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appBundleIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v27));

      objc_msgSend(v20, "applicationPrepareWithDescriptor:", v18);
      objc_msgSend(v20, "resetExtensionRuntime");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
      v22 = self;
      v23 = 2;
LABEL_9:
      -[BAAgentCore handleApplicationEvent:identifier:bundleURLPath:userInitiated:](v22, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:", v23, v21, 0, 1);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
      -[BAAgentCore handleApplicationEvent:identifier:bundleURLPath:userInitiated:](self, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:", 6, v28, 0, 1);

LABEL_10:
      goto LABEL_13;
    case 4uLL:
      v14 = (BADeveloperDebugServerMessageVersionCheck *)v8;
      v30 = objc_opt_class(BADeveloperDebugClientMessageApplicationPeriodicCheck, v29);
      if ((objc_opt_isKindOfClass(v14, v30) & 1) != 0)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:", v31));

        objc_msgSend(v32, "resetExtensionRuntime");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck appBundleIdentifier](v14, "appBundleIdentifier"));
        -[BAAgentCore handleApplicationEvent:identifier:bundleURLPath:userInitiated:](self, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:", 7, v33, 0, 1);

LABEL_13:
LABEL_14:
        -[BAAgentCore _asyncAwaitLockdownClientMessage:waitQueue:](self, "_asyncAwaitLockdownClientMessage:waitQueue:", a4, v9);
      }
      else
      {
LABEL_15:
        lockdown_disconnect(a4);
LABEL_25:

      }
      return;
    default:
      lockdown_disconnect(a4);
      goto LABEL_14;
  }
}

- (void)_shutdownAgent
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1000128F4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Serializing state and shutting down.", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026850;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_sync(v5, block);

  if (-[BAAgentCore debugClearState](self, "debugClearState"))
  {
    v6 = sub_1000128F4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Clear state set, will clear state..", buf, 2u);
    }

    -[BAAgentCore _clearState](self, "_clearState");
  }
  exit(0);
}

- (void)_debugDownloadTime:(BOOL)a3 clear:(BOOL)a4
{
  unsigned int v4;
  uint64_t v5;
  id v6;

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  if (a4)
    v5 = 0;
  else
    v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentCore rulesEngine](self, "rulesEngine"));
  objc_msgSend(v6, "setDebugValidityTimeOverride:", v5);

}

- (void)_backgroundActivityStateDidChange
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026910;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)_connectionReplyQueueForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_queue_t v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connections](self, "connections"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connectionReplyQueue](self, "connectionReplyQueue"));
  v7 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (!v7)
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.backgroundassets.%@.reply"), v4)));
    v7 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore connectionReplyQueue](self, "connectionReplyQueue"));
    objc_msgSend(v9, "setObject:forKey:", v7, v4);

  }
  objc_sync_exit(v5);

  return v7;
}

- (BOOL)_applicationIdentifierAllowsBackgroundActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  id v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState"));
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore applicationState](self, "applicationState", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          LOBYTE(v7) = objc_msgSend(v10, "allowsBackgroundActivity");
          v13 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  objc_sync_exit(v5);
  if (v13)
  {
    v14 = sub_1000128F4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000376E4();

    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (unint64_t)_downloadsInProgress
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        if (v12)
          v7 += (unint64_t)objc_msgSend(v12, "numberOfActiveDownloads");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_downloadsInProgressForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentCore workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentCore downloadQueuesByClientIdentifier](self, "downloadQueuesByClientIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (v7)
    v8 = objc_msgSend(v7, "numberOfActiveDownloads");
  else
    v8 = 0;

  return (unint64_t)v8;
}

- (OS_dispatch_queue)asyncClientNotificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAsyncClientNotificationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)connectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)telemetryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTelemetryQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)lockDownQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLockDownQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 56, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSXPCListener)spiListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSpiListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTelephonyClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableArray)applicationState
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApplicationState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)connectionReplyQueue
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnectionReplyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)unhandledDownloadEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUnhandledDownloadEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)extensionConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExtensionConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BAAgentDownloadRulesEngine)rulesEngine
{
  return (BAAgentDownloadRulesEngine *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRulesEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)downloadQueuesByClientIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDownloadQueuesByClientIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableDictionary)telemetryByDownloadUniqueIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTelemetryByDownloadUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)debugClearState
{
  return self->_debugClearState;
}

- (void)setDebugClearState:(BOOL)a3
{
  self->_debugClearState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryByDownloadUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadQueuesByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_rulesEngine, 0);
  objc_storeStrong((id *)&self->_extensionConnections, 0);
  objc_storeStrong((id *)&self->_unhandledDownloadEvents, 0);
  objc_storeStrong((id *)&self->_connectionReplyQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_spiListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_lockDownQueue, 0);
  objc_storeStrong((id *)&self->_telemetryQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_asyncClientNotificationQueue, 0);
}

@end
