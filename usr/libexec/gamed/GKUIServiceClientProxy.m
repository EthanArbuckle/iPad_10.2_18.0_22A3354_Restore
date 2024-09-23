@implementation GKUIServiceClientProxy

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  objc_msgSend(v3, "setViewService:", 0);

  -[GKUIServiceClientProxy setHostClient:](self, "setHostClient:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GKUIServiceClientProxy;
  -[GKClientProxy dealloc](&v4, "dealloc");
}

- (BOOL)isUIService
{
  return 1;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid attempt to set extension proxy(%@) on viewService(%@)"), a4, a3, self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUIServiceClientProxy.m"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKUIServiceClientProxy setExtensionProxy:forBundleID:]", objc_msgSend(v6, "UTF8String"), 35));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
}

- (void)terminateWithCompletionHandler:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001233D8;
    block[3] = &unk_1002BB540;
    v7 = v3;
    dispatch_barrier_async(v5, block);

  }
}

- (void)handleNewHostClient:(id)a3
{
  objc_msgSend(a3, "setViewService:", self);
}

- (void)setHostPID:(int)a3 reply:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[5];
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[4];
  GKUIServiceClientProxy *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForProcessIdentifier:](GKClientProxy, "clientForProcessIdentifier:", v4));
  v8 = (void *)v7;
  if (!v7)
  {
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(0);
    v20 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_100123BA8(v4, v20);
      if (v6)
        goto LABEL_13;
    }
    else if (v6)
    {
      goto LABEL_13;
    }
    v16 = 0;
    goto LABEL_15;
  }
  -[GKUIServiceClientProxy setHostClient:](self, "setHostClient:", v7);
  v9 = -[GKUIServiceClientProxy handleNewHostClient:](self, "handleNewHostClient:", v8);
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v9);
  v11 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = v8;
    v31 = 1024;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Associating view service %@ with client %@ : pid(%d)", buf, 0x1Cu);
  }
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentGame"));
  v14 = objc_msgSend(v8, "environment");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001236D8;
  v25[3] = &unk_1002BBBD8;
  v15 = v12;
  v26 = v15;
  -[GKClientProxy setCurrentGame:serverEnvironment:reply:](self, "setCurrentGame:serverEnvironment:reply:", v13, v14, v25);

  dispatch_group_enter(v15);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001236E0;
  v23[3] = &unk_1002C4540;
  v23[4] = self;
  v16 = v15;
  v24 = v16;
  objc_msgSend(v8, "getAuthenticatedLocalPlayersWithStatus:handler:", 1, v23);

  if (v6)
  {
    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100123760;
      v21[3] = &unk_1002BB540;
      v22 = v6;
      dispatch_group_notify(v16, v17, v21);

      v18 = v22;
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    v18 = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    dispatch_async(v18, v6);
    v16 = 0;
    goto LABEL_14;
  }
LABEL_15:

}

- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = *(_QWORD *)&a3;
  v17 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForProcessIdentifier:](GKClientProxy, "clientForProcessIdentifier:", v6));
  -[GKUIServiceClientProxy setHostClient:](self, "setHostClient:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  v11 = objc_msgSend(v10, "isExtension");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hostClient"));

    v9 = (void *)v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "credentialForPlayer:", v17));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transportWithCredential:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  -[GKClientProxy getServicesWithTransport:forClient:reply:](self, "getServicesWithTransport:forClient:reply:", v15, v16, v8);

}

- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, "pid") != a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUIServiceClientProxy.m"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (hostClient.pid == pid)\n[%s (%s:%d)]"), v12, "-[GKUIServiceClientProxy getPrivateServicesForPID:localPlayer:reply:]", objc_msgSend(v14, "UTF8String"), 129));

      +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
    v17 = objc_msgSend(v16, "isExtension");

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hostClient"));

      v11 = (void *)v19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "credentialForPlayer:", v8));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transportWithCredential:", v20));
    -[GKClientProxy getPrivateServicesWithTransport:forClient:reply:](self, "getPrivateServicesWithTransport:forClient:reply:", v21, v11, v9);

  }
  else
  {
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(0);
    v23 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100123C1C(v23);
    v24 = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100123AE0;
    block[3] = &unk_1002BB540;
    v26 = v9;
    dispatch_async(v24, block);

    v11 = v26;
  }

}

- (GKClientProxy)hostClient
{
  return (GKClientProxy *)objc_loadWeakRetained((id *)&self->_hostClient);
}

- (void)setHostClient:(id)a3
{
  objc_storeWeak((id *)&self->_hostClient, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostClient);
}

@end
