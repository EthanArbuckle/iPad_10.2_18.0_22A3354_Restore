@implementation ResourceManager

- (void)restoreResourceHints:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000064C0;
  v7[3] = &unk_100014520;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)createResourceHint:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ResourceManager *v18;
  id v19;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = (void *)os_transaction_create("com.apple.powerexperienced.resourcehint");
  -[ResourceManager setTransaction:](self, "setTransaction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  objc_msgSend(v6, "setUuid:", v10);
  v7[2](v7, v10);

  v11 = objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006844;
  v15[3] = &unk_100014548;
  v16 = v8;
  v17 = v6;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v6;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)updateResourceHint:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006B14;
  v13[3] = &unk_100014570;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, v13);

}

- (void)removeResourceHint:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEBUG))
    sub_10000CF94((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
  objc_msgSend(v12, "removeObjectForKey:", v4);

  -[ResourceManager evaluatePowerModes](self, "evaluatePowerModes");
  -[ResourceManager removeState:](self, "removeState:", v4);

}

- (void)monitorProcessExit:(int)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  int v12;

  v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager processMonitors](self, "processMonitors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, v8);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007010;
    v11[3] = &unk_100014598;
    v11[4] = self;
    v12 = a3;
    dispatch_source_set_event_handler(v9, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager processMonitors](self, "processMonitors"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v5);

    dispatch_resume(v9);
  }

}

- (void)handleProcessExit:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;

  v4 = a3;
  v5 = qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "process %@ exiting. Releasing resouce hints for this process", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pid"));
        if (v15 == v4)
          objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v27;
    *(_QWORD *)&v18 = 138412290;
    v25 = v18;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v21);
        v23 = qword_10001BE18;
        if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v25;
          v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removing resource hint %@", buf, 0xCu);
        }
        -[ResourceManager removeResourceHint:](self, "removeResourceHint:", v22, v25, (_QWORD)v26);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager processMonitors](self, "processMonitors"));
  objc_msgSend(v24, "removeObjectForKey:", v4);

  -[ResourceManager evaluatePowerModes](self, "evaluatePowerModes");
}

- (void)saveState:(id)a3
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
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("uuid"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pid"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("pid"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "state")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "resourceType")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("type"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("resources")));

  v14 = objc_msgSend(v13, "mutableCopy");
  if (!v14)
    v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v15);

  v16 = qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEBUG))
    sub_10000CFFC((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  objc_msgSend(v23, "setValue:forKey:", v14, CFSTR("resources"));

}

- (void)removeState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("resources")));

  v6 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v6, "removeObjectForKey:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("resources"));

}

- (void)restoreState
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  void *v14;
  ResourceHintWithProperties *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;

  v2 = qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "restoring state on init", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resources")));

  v5 = qword_10001BE18;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restoring %@", buf, 0xCu);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v23;
      *(_QWORD *)&v8 = 138412290;
      v19 = v8;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v13 = qword_10001BE18;
          if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v28 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "restoring resource with uuid %@", buf, 0xCu);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v12, v19));
          v15 = -[ResourceHintWithProperties initWithProperties:]([ResourceHintWithProperties alloc], "initWithProperties:", v14);
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties description](v15, "description"));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "no resources to restore", buf, 2u);
  }
  v18 = objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000078D0;
  block[3] = &unk_1000145C0;
  block[4] = self;
  dispatch_async(v18, block);

}

- (void)evaluatePowerModes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[PowerModesManager sharedInstance](PowerModesManager, "sharedInstance"));
  objc_msgSend(v2, "evaluatePowerModes");

}

- (ResourceManager)init
{
  ResourceManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *resourceHints;
  id v5;
  uint64_t v6;
  OS_dispatch_queue *mainQueue;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  NSUserDefaults *v11;
  NSUserDefaults *defaults;
  NSMutableDictionary *v13;
  NSMutableDictionary *processMonitors;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;

  v22.receiver = self;
  v22.super_class = (Class)ResourceManager;
  v2 = -[ResourceManager initWithMachServiceName:](&v22, "initWithMachServiceName:", CFSTR("com.apple.powerexperienced.resourceusage"));
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourceHints = v2->_resourceHints;
    v2->_resourceHints = v3;

    v5 = sub_1000090D4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    mainQueue = v2->_mainQueue;
    v2->_mainQueue = (OS_dispatch_queue *)v6;

    v8 = os_log_create("com.apple.powerexperienced", "resourcemanager");
    v9 = (void *)qword_10001BE18;
    qword_10001BE18 = (uint64_t)v8;

    v10 = qword_10001BE18;
    if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Listening for resource usage connections", buf, 2u);
    }
    v11 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.powerexperienced.resourcemanager"));
    defaults = v2->_defaults;
    v2->_defaults = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    processMonitors = v2->_processMonitors;
    v2->_processMonitors = v13;

    v15 = -[ResourceManager setDelegate:](v2, "setDelegate:", v2);
    if (MKBDeviceUnlockedSinceBoot(v15, v16))
      -[ResourceManager restoreState](v2, "restoreState");
    v17 = (void *)qword_10001BE18;
    if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](v2, "mainQueue"));
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Initialized ResourceManager with queue %@", buf, 0xCu);

    }
  }
  else
  {
    v20 = qword_10001BE18;
    if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_ERROR))
      sub_10000D064(v20);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10001BE28 != -1)
    dispatch_once(&qword_10001BE28, &stru_1000145E0);
  return (id)qword_10001BE20;
}

- (void)start
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "starting service", v4, 2u);
  }
  -[ResourceManager activate](self, "activate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v10[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____ResourceManagerProtocol));
  objc_msgSend(v5, "setExportedInterface:", v6);

  v7 = (void *)qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v5, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ResourceManager: listener: accepted new connection from pid %d", (uint8_t *)v10, 8u);

  }
  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (NSMutableDictionary)resourceHints
{
  return self->_resourceHints;
}

- (void)setResourceHints:(id)a3
{
  objc_storeStrong((id *)&self->_resourceHints, a3);
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMainQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)processMonitors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProcessMonitors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitors, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
  objc_storeStrong((id *)&self->_resourceHints, 0);
}

@end
