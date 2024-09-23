@implementation LPPushRegistrar

+ (id)sharedInstance
{
  if (qword_100010EA0 != -1)
    dispatch_once(&qword_100010EA0, &stru_10000C3B8);
  return (id)qword_100010EA8;
}

- (LPPushRegistrar)init
{
  LPPushRegistrar *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *apsdQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *dictionaryMutationQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *bundleIdentifierToApplication;
  NSObject *v9;
  id *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD handler[4];
  id *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)LPPushRegistrar;
  v2 = -[LPPushRegistrar init](&v26, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.locationpushd", 0);
    apsdQueue = v2->_apsdQueue;
    v2->_apsdQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.locationpushd.ivar", 0);
    dictionaryMutationQueue = v2->_dictionaryMutationQueue;
    v2->_dictionaryMutationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIdentifierToApplication = v2->_bundleIdentifierToApplication;
    v2->_bundleIdentifierToApplication = v7;

    v9 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](v2, "apsdQueue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005BA0;
    handler[3] = &unk_10000C3E0;
    v10 = v2;
    v25 = v10;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v9, handler);

    v11 = objc_alloc((Class)APSConnection);
    v12 = APSEnvironmentProduction;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apsdQueue"));
    v14 = objc_msgSend(v11, "initWithEnvironmentName:namedDelegatePort:queue:", v12, CFSTR("com.apple.aps.locationpushd.production"), v13);
    v15 = v10[2];
    v10[2] = v14;

    objc_msgSend(v10[2], "setDelegate:", v10);
    v16 = objc_alloc((Class)APSConnection);
    v17 = APSEnvironmentDevelopment;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apsdQueue"));
    v19 = objc_msgSend(v16, "initWithEnvironmentName:namedDelegatePort:queue:", v17, CFSTR("com.apple.aps.locationpushd.development"), v18);
    v20 = v10[3];
    v10[3] = v19;

    objc_msgSend(v10[3], "setDelegate:", v10);
    v21 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.locationpushd.pushregistration"));
    v22 = v10[1];
    v10[1] = v21;

    objc_msgSend(v10[1], "setDelegate:", v10);
    objc_msgSend(v10[1], "resume");

  }
  return v2;
}

- (id)_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v19 = objc_alloc_init((Class)NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = APSEnvironmentDevelopment;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8);
        v10 = objc_msgSend((id)objc_opt_class(self), "bundleIdFromTopic:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = objc_alloc((Class)LSApplicationRecord);
        v22 = 0;
        v13 = objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, &v22);
        v14 = v22;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entitlements"));
        v16 = objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("aps-environment"), objc_opt_class(NSString));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if ((objc_msgSend(v17, "isEqualToString:", v7) & 1) == 0)
          objc_msgSend(v19, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return v19;
}

- (void)_removeUnneededSandboxTopicsFromDevelopmentConnection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection opportunisticTopics](self->_developmentAPSConnection, "opportunisticTopics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection ignoredTopics](self->_developmentAPSConnection, "ignoredTopics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:](self, "_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:", v4));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:](self, "_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:", v5));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
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
        if (qword_100010D10 != -1)
          dispatch_once(&qword_100010D10, &stru_10000C450);
        v14 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing topic from sandbox environment %{public}@", buf, 0xCu);
        }
        -[LPPushRegistrar _removeTopic:forConnection:](self, "_removeTopic:forConnection:", v13, self->_developmentAPSConnection);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LPPushTokenServerProtocol));
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.locationpushd.pushtokenregistration")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
    objc_msgSend(v5, "resume");
  else
    objc_msgSend(v5, "invalidate");

  return v8;
}

- (void)connectionDidReconnect:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v5 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "APSConnection: %{public}@ did reconnect", (uint8_t *)&v6, 0xCu);
  }
  -[LPPushRegistrar _removeUnneededSandboxTopicsFromDevelopmentConnection](self, "_removeUnneededSandboxTopicsFromDevelopmentConnection");

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v7 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "APSConnection: %{public}@ did receive publicToken", (uint8_t *)&v8, 0xCu);
  }

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v14 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138544130;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "for connection: %{public}@ token: %{public}@ topic: %{public}@ identifier: %{public}@", (uint8_t *)&v20, 0x2Au);
  }
  v15 = objc_msgSend((id)objc_opt_class(self), "bundleIdFromTopic:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:](self, "_findOrCreateApplicationWithBundleIdentifier:", v16));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "deliverToken:", v11);
  }
  else
  {
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C450);
    v19 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Could not find installed app for %{public}@, maybe it was offloaded?", (uint8_t *)&v20, 0xCu);
    }
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  _BYTE v21[10];
  void *v22;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  v8 = objc_msgSend((id)objc_opt_class(self), "bundleIdFromTopic:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v10 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138543875;
    v19 = v6;
    v20 = 2114;
    *(_QWORD *)v21 = v9;
    *(_WORD *)&v21[8] = 2113;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Incoming message has topic: %{public}@ bundleID: %{public}@ userInfo %{private}@", (uint8_t *)&v18, 0x20u);
  }
  v11 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, 0);
  if (objc_msgSend(v11, "isPlaceholder"))
  {
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C450);
    v12 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543362;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Dropping push on the floor because it seems like the app is in the midst of updating or has been offloaded. bundleID: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:](self, "_findOrCreateApplicationWithBundleIdentifier:", v9));
    v14 = objc_msgSend(v13, "hasLocationPushEntitlement");
    v15 = objc_msgSend(v13, "hasLocationPushServiceExtension");
    v16 = v15;
    if (v14 && v15)
    {
      objc_msgSend(v13, "deliverLocationPayloadToExtension:", v7);
    }
    else
    {
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C450);
      v17 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543874;
        v19 = v6;
        v20 = 1026;
        *(_DWORD *)v21 = v14;
        *(_WORD *)&v21[4] = 1026;
        *(_DWORD *)&v21[6] = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Incoming message for %{public}@ caused push token deregistration because entitlement is %{public}d or extension is %{public}d", (uint8_t *)&v18, 0x18u);
      }
      -[LPPushRegistrar _unregisterLocationPushApplication:](self, "_unregisterLocationPushApplication:", v9);
    }

  }
}

- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3
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
  v15 = sub_100006928;
  v16 = sub_100006938;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar dictionaryMutationQueue](self, "dictionaryMutationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006940;
  block[3] = &unk_10000C408;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)registerForPushToken:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSErrorDomain v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v8 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to register bundle ID %{public}@ for location pushes", buf, 0xCu);
  }
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:](self, "_findOrCreateApplicationWithBundleIdentifier:", v6));
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "hasLocationPushEntitlement") & 1) != 0)
      {
        if ((objc_msgSend(v10, "hasLocationPushServiceExtension") & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apsEnvironment"));
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _apsConnectionForEnvironment:](self, "_apsConnectionForEnvironment:", v11));
            v13 = objc_msgSend((id)objc_opt_class(self), "topicFromBundleId:", v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            objc_msgSend(v10, "addPendingTokenReply:", v7);
            v15 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](self, "apsdQueue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100006F90;
            block[3] = &unk_10000C330;
            block[4] = self;
            v16 = v12;
            v26 = v16;
            v27 = v6;
            dispatch_sync(v15, block);

            if (qword_100010D10 != -1)
              dispatch_once(&qword_100010D10, &stru_10000C450);
            v17 = qword_100010D18;
            if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v14;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Requesting token for topic %@", buf, 0xCu);
            }
            objc_msgSend(v16, "requestTokenForTopic:identifier:", v14, &stru_10000C630);

          }
          else
          {
            if (qword_100010D10 != -1)
              dispatch_once(&qword_100010D10, &stru_10000C450);
            v24 = qword_100010D18;
            if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v6;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because no valid aps-environment present for %@", buf, 0xCu);
            }
            v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CLLocationPushServiceErrorDomain, 2, 0));
            v7[2](v7, 0, v16);
          }

          goto LABEL_36;
        }
        if (qword_100010D10 != -1)
          dispatch_once(&qword_100010D10, &stru_10000C450);
        v23 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because no Location Push Service Extension present for %@", buf, 0xCu);
        }
        v20 = CLLocationPushServiceErrorDomain;
        v21 = 1;
      }
      else
      {
        if (qword_100010D10 != -1)
          dispatch_once(&qword_100010D10, &stru_10000C450);
        v22 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Ignoring registerBundleIdentifier: request because location push entitlement is missing from  %{public}@", buf, 0xCu);
        }
        v20 = CLLocationPushServiceErrorDomain;
        v21 = 3;
      }
    }
    else
    {
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C450);
      v19 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because application is not valid", buf, 2u);
      }
      v20 = NSPOSIXErrorDomain;
      v21 = 22;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, v21, 0));
    v7[2](v7, 0, v11);
LABEL_36:

    goto LABEL_37;
  }
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v18 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because bundle identifier is nil", buf, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  v7[2](v7, 0, v10);
LABEL_37:

}

- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  LPPushRegistrar *v19;
  id v20;
  id v21;
  BOOL v22;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:](self, "_findOrCreateApplicationWithBundleIdentifier:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apsEnvironment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _apsConnectionForEnvironment:](self, "_apsConnectionForEnvironment:", v11));

  v13 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](self, "apsdQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000070C8;
  block[3] = &unk_10000C430;
  v18 = v12;
  v19 = self;
  v22 = a3;
  v20 = v8;
  v21 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v12;
  dispatch_async(v13, block);

}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  LPPushRegistrar *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](self, "apsdQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000071A4;
  v7[3] = &unk_10000C2E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_unregisterLocationPushApplication:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;

  v4 = a3;
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v5 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Unregistering application %{public}@ from Location Pushes", buf, 0xCu);
  }
  v6 = objc_msgSend((id)objc_opt_class(self), "topicFromBundleId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:](self, "_findOrCreateApplicationWithBundleIdentifier:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "apsEnvironment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _apsConnectionForEnvironment:](self, "_apsConnectionForEnvironment:", v9));

  if (v10)
  {
    -[LPPushRegistrar _invalidateTokenForTopic:fromConnection:](self, "_invalidateTokenForTopic:fromConnection:", v7, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar productionAPSConnection](self, "productionAPSConnection"));
    -[LPPushRegistrar _invalidateTokenForTopic:fromConnection:](self, "_invalidateTokenForTopic:fromConnection:", v7, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar developmentAPSConnection](self, "developmentAPSConnection"));
    -[LPPushRegistrar _invalidateTokenForTopic:fromConnection:](self, "_invalidateTokenForTopic:fromConnection:", v7, v12);

  }
  v13 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar dictionaryMutationQueue](self, "dictionaryMutationQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007524;
  v15[3] = &unk_10000C2E0;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_sync(v13, v15);

}

- (void)_invalidateTokenForTopic:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[LPPushRegistrar _removeTopic:forConnection:](self, "_removeTopic:forConnection:", v7, v6);
  objc_msgSend(v6, "invalidateTokenForTopic:identifier:", v7, &stru_10000C630);

}

- (void)_removeTopic:(id)a3 forConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "opportunisticTopics"));
  v10 = objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v6);
  objc_msgSend(v5, "_setOpportunisticTopics:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ignoredTopics"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v6);
  objc_msgSend(v5, "_setIgnoredTopics:", v9);

}

- (void)_addOrMoveTopic:(id)a3 forConnection:(id)a4 toList:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  unint64_t v43;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "opportunisticTopics"));
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if (v10)
  {
    if (a5 == 1)
    {
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C450);
      v11 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 68289282;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2114;
        v39 = (unint64_t)v7;
        v12 = "{\"msg%{public}.0s\":\"Not adding to OpportunisticTopics since it's already an added topic\", \"topic\":%{"
              "public, location:escape_only}@}";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v34, 0x1Cu);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C450);
    v15 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 68289794;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2114;
      v39 = (unint64_t)v7;
      v40 = 2114;
      v41 = v8;
      v42 = 2050;
      v43 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Moving topic from opportunisitic list connection\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@, \"toList\":%{public}lu}", (uint8_t *)&v34, 0x30u);
    }
    v16 = v8;
    v17 = v7;
    v18 = 1;
LABEL_33:
    objc_msgSend(v16, "moveTopic:fromList:toList:", v17, v18, a5);
    goto LABEL_42;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ignoredTopics"));
  v14 = objc_msgSend(v13, "containsObject:", v7);

  if (!v14)
  {
    if (a5 == 2)
    {
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C450);
      v27 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 68289538;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2114;
        v39 = (unint64_t)v7;
        v40 = 2114;
        v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Adding topic to ignored list\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@}", (uint8_t *)&v34, 0x26u);
      }
      v20 = objc_alloc_init((Class)NSMutableSet);
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ignoredTopics"));
      v29 = (void *)v28;
      v30 = &__NSArray0__struct;
      if (v28)
        v30 = (void *)v28;
      v31 = v30;

      objc_msgSend(v20, "addObjectsFromArray:", v31);
      objc_msgSend(v20, "addObject:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
      objc_msgSend(v8, "_setIgnoredTopics:", v25);
    }
    else
    {
      if (a5 != 1)
      {
        if (qword_100010D10 != -1)
          dispatch_once(&qword_100010D10, &stru_10000C450);
        v32 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_FAULT))
        {
          v34 = 68289282;
          v35 = 0;
          v36 = 2082;
          v37 = "";
          v38 = 2050;
          v39 = a5;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Not adding topic due to unknown list\", \"toList\":%{public}lu}", (uint8_t *)&v34, 0x1Cu);
        }
        if (qword_100010D10 != -1)
          dispatch_once(&qword_100010D10, &stru_10000C450);
        v33 = qword_100010D18;
        if (os_signpost_enabled((os_log_t)qword_100010D18))
        {
          v34 = 68289282;
          v35 = 0;
          v36 = 2082;
          v37 = "";
          v38 = 2050;
          v39 = a5;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Not adding topic due to unknown list", "{\"msg%{public}.0s\":\"Not adding topic due to unknown list\", \"toList\":%{public}lu}", (uint8_t *)&v34, 0x1Cu);
        }
        goto LABEL_42;
      }
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C450);
      v19 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 68289538;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2114;
        v39 = (unint64_t)v7;
        v40 = 2114;
        v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Adding topic to opportunistic list\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@}", (uint8_t *)&v34, 0x26u);
      }
      v20 = objc_alloc_init((Class)NSMutableSet);
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "opportunisticTopics"));
      v22 = (void *)v21;
      v23 = &__NSArray0__struct;
      if (v21)
        v23 = (void *)v21;
      v24 = v23;

      objc_msgSend(v20, "addObjectsFromArray:", v24);
      objc_msgSend(v20, "addObject:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
      objc_msgSend(v8, "_setOpportunisticTopics:", v25);
    }

    goto LABEL_42;
  }
  if (a5 != 2)
  {
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C450);
    v26 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 68289794;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2114;
      v39 = (unint64_t)v7;
      v40 = 2114;
      v41 = v8;
      v42 = 2050;
      v43 = a5;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Moving topic from ignored list connection\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@, \"toList\":%{public}lu}", (uint8_t *)&v34, 0x30u);
    }
    v16 = v8;
    v17 = v7;
    v18 = 2;
    goto LABEL_33;
  }
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v11 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 68289282;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2114;
    v39 = (unint64_t)v7;
    v12 = "{\"msg%{public}.0s\":\"Not adding to IgnoredTopics since it's already an added topic\", \"topic\":%{public, lo"
          "cation:escape_only}@}";
    goto LABEL_13;
  }
LABEL_42:

}

- (BOOL)_setTopicEnabled:(BOOL)a3 forConnection:(id)a4 appBundleIdentifier:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  id v18;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend((id)objc_opt_class(self), "topicFromBundleId:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:](self, "_findOrCreateApplicationWithBundleIdentifier:", v9));
  v13 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "hasLocationPushEntitlement"))
    {
      if (v6)
        v14 = 1;
      else
        v14 = 2;
      -[LPPushRegistrar _addOrMoveTopic:forConnection:toList:](self, "_addOrMoveTopic:forConnection:toList:", v11, v8, v14);
    }
    else
    {
      -[LPPushRegistrar _removeTopic:forConnection:](self, "_removeTopic:forConnection:", v11, v8);
    }
  }
  else
  {
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C450);
    v15 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Ignoring setLocationPushesActive: request because application %{public}@ is not valid", (uint8_t *)&v17, 0xCu);
    }
  }

  return v13 != 0;
}

- (id)_apsConnectionForEnvironment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", APSEnvironmentProduction))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar productionAPSConnection](self, "productionAPSConnection"));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", APSEnvironmentDevelopment))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar developmentAPSConnection](self, "developmentAPSConnection"));
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

+ (id)bundleIdFromTopic:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 0, (char *)objc_msgSend(v3, "length")+ ~(unint64_t)objc_msgSend(CFSTR("location-query"), "length")));

  return v4;
}

+ (id)topicFromBundleId:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), a3, CFSTR("location-query"));
}

- (NSXPCListener)locationPushRegistrationServer
{
  return self->_locationPushRegistrationServer;
}

- (APSConnection)productionAPSConnection
{
  return self->_productionAPSConnection;
}

- (APSConnection)developmentAPSConnection
{
  return self->_developmentAPSConnection;
}

- (OS_dispatch_queue)apsdQueue
{
  return self->_apsdQueue;
}

- (NSMutableDictionary)bundleIdentifierToApplication
{
  return self->_bundleIdentifierToApplication;
}

- (OS_dispatch_queue)dictionaryMutationQueue
{
  return self->_dictionaryMutationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryMutationQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToApplication, 0);
  objc_storeStrong((id *)&self->_apsdQueue, 0);
  objc_storeStrong((id *)&self->_developmentAPSConnection, 0);
  objc_storeStrong((id *)&self->_productionAPSConnection, 0);
  objc_storeStrong((id *)&self->_locationPushRegistrationServer, 0);
}

@end
