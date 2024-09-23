@implementation KmlSession

- (KmlSession)initWithRemoteObject:(id)a3 connection:(id)a4 andQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  KmlSession *v12;
  KmlSession *v13;
  NSTimer *backgroundTimer;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)KmlSession;
  v12 = -[KmlSession init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_remoteObject, a3);
    objc_storeStrong((id *)&v13->_connection, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
    v13->_isStarted = 0;
    backgroundTimer = v13->_backgroundTimer;
    v13->_backgroundTimer = 0;

  }
  return v13;
}

- (id)clientName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection userInfo](self->_connection, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClientName")));

  return v3;
}

- (id)dumpState
{
  return 0;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlSession dealloc]", 74, CFSTR("Session released"), v2, v3, v4, v5, (uint64_t)v7.receiver);
  v7.receiver = self;
  v7.super_class = (Class)KmlSession;
  -[KmlSession dealloc](&v7, "dealloc");
}

- (void)stopWithError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id Property;
  KmlSession *v10;
  id v11;

  v11 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlSession stopWithError:]", 79, CFSTR("%@"), v4, v5, v6, v7, (uint64_t)v11);
  if (self)
    Property = objc_getProperty(self, v8, 48, 1);
  else
    Property = 0;
  objc_msgSend(Property, "didEnd:", v11);
  v10 = self;
  objc_sync_enter(v10);
  v10->_isStarted = 0;
  objc_sync_exit(v10);

}

- (void)start
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  KmlPowerAssertion *v6;
  KmlPowerAssertion *v7;
  KmlPowerAssertion *pwrAssertion;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  KmlSession *v13;
  SEL v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_10023FB04((uint64_t)KmlPowerAssertion, v5);
  v7 = (KmlPowerAssertion *)objc_claimAutoreleasedReturnValue(v6);
  pwrAssertion = self->_pwrAssertion;
  self->_pwrAssertion = v7;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSession start]", 91, &stru_100316BD0, v9, v10, v11, v12, v22);
  v13 = self;
  objc_sync_enter(v13);
  v13->_isStarted = 1;
  objc_sync_exit(v13);

  objc_msgSend(objc_getProperty(v13, v14, 48, 1), "didStart:", 1);
  v23 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection userInfo](v13->_connection, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("BackGroundClient")));
  LODWORD(v5) = objc_msgSend(v15, "BOOLValue");

  if ((_DWORD)v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ClientIsDaemon")));
    if (objc_msgSend(v16, "BOOLValue"))
      v17 = 600.0;
    else
      v17 = 10.0;

    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSession start]", 99, CFSTR("Kill this session started by background client after %f seconds"), v18, v19, v20, v21, *(uint64_t *)&v17);
    sub_10023778C((uint64_t)v13, v17);
  }

}

- (void)startBackGroundTimer
{
  sub_10023778C((uint64_t)self, 10.0);
}

- (void)cancelBackGroundTimer
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100237ACC;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100237C00;
  block[3] = &unk_10030F398;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_backgroundTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pwrAssertion, 0);
}

@end
