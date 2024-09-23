@implementation NDChronoKitLauncher

- (void)removePendingLaunchForBundleID:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AA58;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_onqueue_removePendingLaunchForBundleID:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingLaunches, "objectForKeyedSubscript:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v9)
  {
    v10 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing wake request for independent extension %@ for session %@", (uint8_t *)&v14, 0x16u);
    }
    objc_msgSend(v9, "invalidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingLaunches, "objectForKeyedSubscript:", v6));
    objc_msgSend(v11, "removeObjectForKey:", v7);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingLaunches, "objectForKeyedSubscript:", v6));
    v13 = objc_msgSend(v12, "count") == 0;

    if (v13)
      -[NSMutableDictionary removeObjectForKey:](self->_pendingLaunches, "removeObjectForKey:", v6);
  }

}

+ (id)sharedLauncher
{
  if (qword_1000C7150 != -1)
    dispatch_once(&qword_1000C7150, &stru_1000B2150);
  return (id)qword_1000C7148;
}

- (NDChronoKitLauncher)init
{
  NDChronoKitLauncher *v2;
  CHSNSURLSessiondService *v3;
  CHSNSURLSessiondService *service;
  uint64_t v5;
  NSMutableDictionary *pendingLaunches;
  uint64_t v7;
  NSMutableDictionary *observers;
  uint64_t v9;
  NSMutableSet *monitoredBundleIDs;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NDChronoKitLauncher;
  v2 = -[NDChronoKitLauncher init](&v18, "init");
  if (v2)
  {
    v3 = (CHSNSURLSessiondService *)objc_alloc_init((Class)CHSNSURLSessiondService);
    service = v2->_service;
    v2->_service = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingLaunches = v2->_pendingLaunches;
    v2->_pendingLaunches = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    monitoredBundleIDs = v2->_monitoredBundleIDs;
    v2->_monitoredBundleIDs = (NSMutableSet *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.nsurlsessiond.NDExtension-queue", v14);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;

  }
  return v2;
}

- (void)addObserver:(id)a3 forExtension:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062D04;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)removeObserver:(id)a3 forExtension:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062CAC;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)startMonitoringBundleID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062C6C;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062C60;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)wakeUpExtension:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5 wakeRequirement:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062C4C;
  block[3] = &unk_1000B2178;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

  return 1;
}

- (void)_onqueue_wakeUpExtension:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5 wakeRequirement:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    v34 = 1024;
    v35 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Issuing wake request for independent extension %@ for session %@ with uuid %@ and requirement %d", buf, 0x26u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingLaunches, "objectForKeyedSubscript:", v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v11));
  v16 = v15 == 0;

  if (v16)
    goto LABEL_8;
  v17 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Wake request already exists for independent extension %@ for session %@ with uuid %@", buf, 0x20u);
  }
  if (a6 == 2)
  {
    -[NDChronoKitLauncher _onqueue_removePendingLaunchForBundleID:sessionID:](self, "_onqueue_removePendingLaunchForBundleID:sessionID:", v10, v11);
LABEL_8:
    if (&CHSNSURLSessiondServiceInfoKeyIsHighPriority)
      v18 = &CHSNSURLSessiondServiceInfoKeySessionIdentifier == 0;
    else
      v18 = 1;
    if (v18)
    {
      v20 = 0;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a6 == 2, CHSNSURLSessiondServiceInfoKeySessionIdentifier, CHSNSURLSessiondServiceInfoKeyIsHighPriority, v11));
      v27[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, &v26, 2));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHSNSURLSessiondService URLSessionDidCompleteForExtensionWithBundleIdentifier:info:](self->_service, "URLSessionDidCompleteForExtensionWithBundleIdentifier:info:", v10, v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingLaunches, "objectForKeyedSubscript:", v10));
    v23 = v22 == 0;

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingLaunches, "setObject:forKeyedSubscript:", v24, v10);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingLaunches, "objectForKeyedSubscript:", v10));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v11);

  }
}

- (BOOL)extension:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIDs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingLaunches, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
