@implementation MSDTestInterface

+ (id)sharedInstance
{
  if (qword_1001751E8 != -1)
    dispatch_once(&qword_1001751E8, &stru_10013DE88);
  return (id)qword_1001751E0;
}

- (void)start
{
  dispatch_queue_t v3;
  id v4;
  void *v5;
  id v6;

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v3 = dispatch_queue_create("com.apple.msdTestQueue", 0);
    -[MSDTestInterface setTestQueue:](self, "setTestQueue:", v3);

    -[MSDTestInterface setDefaultLogLevel:](self, "setDefaultLogLevel:", 1);
  }
  v4 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.msdtest.service"));
  -[MSDTestInterface setXpcListener:](self, "setXpcListener:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcListener](self, "xpcListener"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcListener](self, "xpcListener"));
  objc_msgSend(v6, "resume");

}

- (id)getTimeStamp
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (void)pushTestEvent:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, v5, 0));

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("TestNotification"), 0, v7);
}

- (void)sendTestEvents:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcConnection](self, "xpcConnection"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[MSDTestInterface testQueue](self, "testQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100023FB0;
    v7[3] = &unk_10013DE28;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  unsigned int v18;

  v5 = a4;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v5;
    v17 = 1024;
    v18 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received new connection.:%{public}@ procID:%d", (uint8_t *)&v15, 0x12u);
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.mobilestoredemo.testInterface")));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "BOOLValue"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MSDSendTestCommand));
      objc_msgSend(v5, "setExportedInterface:", v10);

      objc_msgSend(v5, "setExportedObject:", self);
      v11 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MSDPushTestLog));
      objc_msgSend(v5, "setRemoteObjectInterface:", v11);
      -[MSDTestInterface setXpcConnection:](self, "setXpcConnection:", v5);
      objc_msgSend(v5, "resume");
      v12 = 1;
    }
    else
    {
      v13 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "client does not have entitlement.:%{public}@", (uint8_t *)&v15, 0xCu);
      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)sendCommandsToDemod:(id)a3 replyFromDemod:(id)a4
{
  id v6;
  void (**v7)(id, const __CFString *);
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v6 = a3;
  v7 = (void (**)(id, const __CFString *))a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("getNotifications")));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("getNotifications")));
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v13 = objc_alloc_init((Class)NSOperationQueue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100024340;
      v19[3] = &unk_10013D8D8;
      v19[4] = self;
      v14 = objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("TestNotification"), 0, v13, v19);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("totalDownloadThreads")));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "operationQueue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("totalDownloadThreads")));
    objc_msgSend(v17, "setMaxConcurrentOperationCount:", objc_msgSend(v18, "integerValue"));

  }
  v7[2](v7, CFSTR("commands accepted"));

}

- (void)pushTestLog:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTestInterface sanitizeTestLog:](self, "sanitizeTestLog:", a3));
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcConnection](self, "xpcConnection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
    objc_msgSend(v5, "pushTestLog:", v6);

  }
}

- (id)sanitizeTestLog:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testLogLevel")));
  v7 = objc_msgSend(v6, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testLogLevel")));
  if (v8
    && (v9 = -[MSDTestInterface defaultLogLevel](self, "defaultLogLevel"), v8, (unint64_t)v7 <= v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testQueue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCInterface)xpcInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)defaultLogLevel
{
  return self->_defaultLogLevel;
}

- (void)setDefaultLogLevel:(unint64_t)a3
{
  self->_defaultLogLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
