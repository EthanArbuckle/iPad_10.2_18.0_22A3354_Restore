@implementation CCDGatekeeper

- (CCDGatekeeper)init
{
  CCDGatekeeper *v2;
  CCDGatekeeper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCDGatekeeper;
  v2 = -[CCDGatekeeper init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CCDGatekeeper resetIdleTimer](v2, "resetIdleTimer");
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CCDServicer *v12;
  void *v13;
  CCDServicer *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v5 = a4;
  -[CCDGatekeeper resetIdleTimer](self, "resetIdleTimer");
  isKindOfClass = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", kCCServiceEntitlement));
  v9 = (void *)isKindOfClass;
  if (isKindOfClass
    && (v10 = objc_opt_class(NSNumber),
        isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0)
    && (isKindOfClass = (uint64_t)objc_msgSend(v9, "BOOLValue"), (isKindOfClass & 1) != 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DEPXPCProtocol));
    objc_msgSend(v5, "setExportedInterface:", v11);

    v12 = [CCDServicer alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CCDGatekeeper server](self, "server"));
    v14 = -[CCDServicer initWithXPCConnection:server:](v12, "initWithXPCConnection:server:", v5, v13);
    objc_msgSend(v5, "setExportedObject:", v14);

    v15 = objc_msgSend(v5, "resume");
    v18 = *(NSObject **)(DEPLogObjects(v15, v16, v17) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Accepted new connection.", v22, 2u);
    }
    v19 = 1;
  }
  else
  {
    v20 = *(NSObject **)(DEPLogObjects(isKindOfClass, v7, v8) + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "rejecting connection because it is not entitled to use this service!", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (void)idleTimerDidFire:(id)a3
{
  NSObject *v3;
  __CFRunLoop *Main;
  uint8_t v5[16];

  v3 = *(NSObject **)(DEPLogObjects(self, a2, a3) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "idling", v5, 2u);
  }
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

- (void)resetIdleTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007768;
  block[3] = &unk_100018978;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CCDServer)server
{
  return (CCDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (NSTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (double)machTimeScaleFactor
{
  return self->_machTimeScaleFactor;
}

- (void)setMachTimeScaleFactor:(double)a3
{
  self->_machTimeScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_destroyWeak((id *)&self->_server);
}

@end
