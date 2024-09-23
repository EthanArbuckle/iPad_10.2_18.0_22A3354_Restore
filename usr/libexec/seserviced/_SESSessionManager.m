@implementation _SESSessionManager

+ (id)sessionManager
{
  return +[_SESSessionManager sessionManagerWithMachServiceName:](_SESSessionManager, "sessionManagerWithMachServiceName:", CFSTR("com.apple.seserviced.session"));
}

+ (id)sessionManagerWithMachServiceName:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036E18;
  block[3] = &unk_100302AA0;
  v8 = a3;
  v3 = qword_10034BB98;
  v4 = v8;
  if (v3 != -1)
    dispatch_once(&qword_10034BB98, block);
  v5 = (id)qword_10034BB90;

  return v5;
}

- (id)init:(id)a3
{
  _SESSessionManager *v3;
  _SESSessionManager *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *xpcConnectionQueue;
  NSMutableArray *v13;
  NSMutableArray *activeSessions;
  uint64_t v15;
  _SESAppStateObserver *appStateObserver;
  OS_dispatch_queue *v17;
  _QWORD v19[4];
  _SESSessionManager *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_SESSessionManager;
  v3 = -[_SESSessionManager initWithMachServiceName:](&v21, "initWithMachServiceName:", a3);
  v4 = v3;
  if (v3)
  {
    -[_SESSessionManager setDelegate:](v3, "setDelegate:", v3);
    v4->_lock._os_unfair_lock_opaque = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.seserviced._session.queue", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.seserviced._session.xpc.queue", v10);
    xpcConnectionQueue = v4->_xpcConnectionQueue;
    v4->_xpcConnectionQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new(NSMutableArray);
    activeSessions = v4->_activeSessions;
    v4->_activeSessions = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[_SESSessionAppStateObserver observerWithDelegate:](_SESSessionAppStateObserver, "observerWithDelegate:", v4));
    appStateObserver = v4->_appStateObserver;
    v4->_appStateObserver = (_SESAppStateObserver *)v15;

    v17 = v4->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100036FC8;
    v19[3] = &unk_100302AC8;
    v20 = v4;
    os_state_add_handler(v17, v19);

  }
  return v4;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = SESDefaultLogObject(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting session server", v5, 2u);
  }

  -[_SESSessionManager resume](self, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t isKindOfClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[6];
  _QWORD v26[6];
  _BYTE buf[32];
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v6 = a3;
  v7 = a4;
  isKindOfClass = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("application-identifier")));
  v10 = (void *)isKindOfClass;
  if (isKindOfClass
    && (v11 = objc_opt_class(NSString),
        isKindOfClass = objc_opt_isKindOfClass(v10, v11),
        (isKindOfClass & 1) != 0))
  {
    v12 = SESDefaultLogObject(isKindOfClass, v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = objc_msgSend(v7, "processIdentifier");
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v10;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Added connection from PID %d (%@) %@", buf, 0x1Cu);
    }

    v31[0] = v10;
    v30[0] = &off_100322EC0;
    v30[1] = &off_100322ED8;
    v14 = objc_opt_new(NSMutableSet);
    v31[1] = v14;
    v30[2] = &off_100322EF0;
    v15 = objc_opt_new(NSMutableSet);
    v31[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16));
    objc_msgSend(v7, "setUserInfo:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SESSessionManagerCallbackInterface interface](SESSessionManagerCallbackInterface, "interface"));
    objc_msgSend(v7, "setRemoteObjectInterface:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SESSessionManagerInterface interface](SESSessionManagerInterface, "interface"));
    objc_msgSend(v7, "setExportedInterface:", v19);

    objc_msgSend(v7, "setExportedObject:", self);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = sub_1000373C8;
    v28 = sub_1000373D8;
    v20 = v7;
    v29 = v20;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000373E0;
    v26[3] = &unk_1003044E0;
    v26[4] = self;
    v26[5] = buf;
    objc_msgSend(v20, "setInvalidationHandler:", v26);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100037458;
    v25[3] = &unk_1003044E0;
    v25[4] = self;
    v25[5] = buf;
    objc_msgSend(v20, "setInterruptionHandler:", v25);
    objc_msgSend(v20, "_setQueue:", self->_xpcConnectionQueue);
    objc_msgSend(v20, "resume");
    _Block_object_dispose(buf, 8);

    v21 = 1;
  }
  else
  {
    v22 = SESDefaultLogObject(isKindOfClass, v9);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = CFSTR("application-identifier");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Missing or wrong type entitlement %@: %@", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

- (void)didCloseConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  _SESSessionManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037554;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)addSession:(id)a3 forConnection:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  OS_os_transaction *v16;
  OS_os_transaction *keepAlive;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_100322ED8));
  v11 = objc_msgSend(v10, "addObject:", v6);
  v13 = SESDefaultLogObject(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = -[NSMutableArray count](self->_activeSessions, "count");
    v18 = 138412546;
    v19 = v6;
    v20 = 2048;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Adding session %@ active sessions %lu", (uint8_t *)&v18, 0x16u);
  }

  -[NSMutableArray addObject:](self->_activeSessions, "addObject:", v6);
  if (!self->_keepAlive)
  {
    v16 = (OS_os_transaction *)os_transaction_create("com.apple.seserviced._session.ostransaction");
    keepAlive = self->_keepAlive;
    self->_keepAlive = v16;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeSession:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  OS_os_transaction *keepAlive;
  int v15;
  id v16;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeObject:](self->_activeSessions, "removeObject:", v5);
  objc_msgSend(v5, "releaseRemoteObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_100322ED8));

  objc_msgSend(v8, "removeObject:", v5);
  v11 = SESDefaultLogObject(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = -[NSMutableArray count](self->_activeSessions, "count");
    v15 = 134217984;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Active sessions %lu", (uint8_t *)&v15, 0xCu);
  }

  if (!-[NSMutableArray count](self->_activeSessions, "count"))
  {
    keepAlive = self->_keepAlive;
    self->_keepAlive = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)startSESACWGSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *queue;
  _QWORD v14[4];
  id v15;
  _SESSessionManager *v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "startSESACWGSession", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_SESACWGSession validateEntitlements:](_SESACWGSession, "validateEntitlements:", v11));
  if (v12)
  {
    v7[2](v7, 0, v12);
  }
  else
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100037D48;
    v14[3] = &unk_100304530;
    v15 = v6;
    v16 = self;
    v18 = v7;
    v17 = v11;
    dispatch_async(queue, v14);

  }
}

- (void)startSESDCKSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *queue;
  _QWORD v14[4];
  id v15;
  _SESSessionManager *v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "startSESDCKSession", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_SESDCKSession validateEntitlements:](_SESDCKSession, "validateEntitlements:", v11));
  if (v12)
  {
    v7[2](v7, 0, v12);
  }
  else
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000380D8;
    v14[3] = &unk_100304530;
    v15 = v6;
    v16 = self;
    v18 = v7;
    v17 = v11;
    dispatch_async(queue, v14);

  }
}

- (void)startSESRKESession:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  _QWORD v16[4];
  id v17;
  _SESSessionManager *v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD);
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "startSESRKESession", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x3032000000;
  v26 = sub_1000373C8;
  v27 = sub_1000373D8;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[_SESRKESession validateEntitlements:](_SESRKESession, "validateEntitlements:", v14));
  if (*((_QWORD *)v24 + 5))
  {
    v10[2](v10, 0);
  }
  else
  {
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000384E8;
    v16[3] = &unk_100304558;
    v17 = v14;
    v18 = self;
    v21 = v10;
    v19 = v9;
    v20 = v8;
    v22 = buf;
    dispatch_async(queue, v16);

  }
  _Block_object_dispose(buf, 8);

}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
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
  block[2] = sub_100038ABC;
  block[3] = &unk_100304490;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)getActiveDCKSessions
{
  os_unfair_lock_s *p_lock;
  id v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray copy](self->_activeSessions, "copy");
  v5 = Filter(v4, &stru_100304598);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)getActiveRKESessions
{
  os_unfair_lock_s *p_lock;
  id v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray copy](self->_activeSessions, "copy");
  v5 = Filter(v4, &stru_1003045B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)getActiveACWGSessions
{
  os_unfair_lock_s *p_lock;
  id v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray copy](self->_activeSessions, "copy");
  v5 = Filter(v4, &stru_1003045D8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)didCreateKey:(id)a3
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
  v7[2] = sub_100038F1C;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4
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
  block[2] = sub_10003911C;
  block[3] = &unk_100304490;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)getVehicleReports:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  _QWORD block[4];
  void (**v12)(id, _QWORD, void *);
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "getVehicleReports", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_SESDCKSession validateEntitlements:](_SESDCKSession, "validateEntitlements:", v8));
  if (v9)
  {
    v4[2](v4, 0, v9);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000393B0;
    block[3] = &unk_100303300;
    v12 = v4;
    dispatch_async(queue, block);

  }
}

- (void)startSESAssertion:(id)a3 withKeyIdentifier:(id)a4 withAppletIdentifier:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *queue;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(id, _QWORD, void *);
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  v18 = SESDefaultLogObject(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "startSESAssertion keyIdentifier %@ appletIdentifier %@ options %@", buf, 0x20u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_SESAssertion validateEntitlements:appletIdentifier:](_SESAssertion, "validateEntitlements:appletIdentifier:", v20, v14));
  if (v21)
  {
    v16[2](v16, 0, v21);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000396C8;
    block[3] = &unk_100304628;
    block[4] = self;
    v24 = v12;
    v25 = v13;
    v26 = v14;
    v27 = v15;
    v29 = v16;
    v28 = v20;
    dispatch_async(queue, block);

  }
}

- (void)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4 withAppletIdentifier:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *queue;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  _BYTE *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "doubleValue");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "pauseRangingForReaderIdentifier %@ duration %f", buf, 0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = sub_1000373C8;
  v28 = sub_1000373D8;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[_SESDCKSession validateEntitlements:](_SESDCKSession, "validateEntitlements:", v18));
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v13[2](v13);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039C50;
    block[3] = &unk_100304650;
    v21 = v11;
    v24 = v13;
    v22 = v12;
    v23 = v10;
    v25 = buf;
    dispatch_async(queue, block);

  }
  _Block_object_dispose(buf, 8);

}

- (void)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD);
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "resumeRangingForReaderIdentifier %@", (uint8_t *)&buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = sub_1000373C8;
  v24 = sub_1000373D8;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[_SESDCKSession validateEntitlements:](_SESDCKSession, "validateEntitlements:", v14));
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v10[2](v10);
  }
  else
  {
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100039FCC;
    v16[3] = &unk_100304678;
    v17 = v9;
    v18 = v8;
    p_buf = &buf;
    v19 = v10;
    dispatch_async(queue, v16);

  }
  _Block_object_dispose(&buf, 8);

}

- (os_state_data_s)dumpState
{
  NSMutableDictionary *v3;
  void *v4;
  _SESAssertion *currentAssertion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *i;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_state_data_s *v22;
  _SESSessionManager *v24;
  NSMutableDictionary *v25;
  NSMutableArray *obj;
  uint64_t v27;
  NSMutableArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_keepAlive != 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("isMarkedDirty"));

  currentAssertion = self->_currentAssertion;
  v25 = v3;
  if (currentAssertion)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SESAssertion connection](currentAssertion, "connection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_100322EC0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion %p client %@"), currentAssertion, v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("activeAssertion"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("activeAssertion"));
  }
  v28 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self;
  obj = self->_activeSessions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(_SESDCKSession);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          v15 = CFSTR("DCK");
        else
          v15 = CFSTR("RKE");
        v16 = objc_msgSend(v13, "isBackgrounded");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connection"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", &off_100322EC0));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Session %p backgrounded %d client %@"), v15, v13, v16, v19));
        -[NSMutableArray addObject:](v28, "addObject:", v20);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v28, CFSTR("activeSessions"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_SESAppStateObserver dumpState](v24->_appStateObserver, "dumpState"));
  -[NSMutableDictionary addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v21);
  v22 = (os_state_data_s *)sub_100015734((uint64_t)"sessessionmanager.state", (uint64_t)v25);

  return v22;
}

- (void)didAppEnterBackground:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_100322EC0));

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v23 = objc_msgSend(v3, "processIdentifier");
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Client application entered background PID %d (%@) %@", buf, 0x1Cu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", &off_100322ED8));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "setIsBackgrounded:", 1, (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)didAppGetSuspended:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_100322EC0));

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v23 = objc_msgSend(v3, "processIdentifier");
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Client application got suspended PID %d (%@) %@", buf, 0x1Cu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", &off_100322ED8));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "setIsBackgrounded:", 1, (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)didAppEnterForeground:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_100322EC0));

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v23 = objc_msgSend(v3, "processIdentifier");
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Client application entered foreground PID %d (%@) %@", buf, 0x1Cu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", &off_100322ED8));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "setIsBackgrounded:", 0, (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssertion, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
