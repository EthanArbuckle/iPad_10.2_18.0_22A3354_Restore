@implementation PRRangingService

- (PRRangingService)initWithQueue:(id)a3
{
  id v6;
  PRRangingService *v7;
  NSMutableSet *v8;
  NSMutableSet *xpcSessions;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingService.mm"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PRRangingService;
  v7 = -[PRRangingService init](&v12, "init");
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    xpcSessions = v7->_xpcSessions;
    v7->_xpcSessions = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3;
  PRRangingService *v4;

  v3 = a3;
  v4 = -[PRRangingService initWithQueue:]([PRRangingService alloc], "initWithQueue:", v3);

  return v4;
}

- (NSArray)machServicesNames
{
  return (NSArray *)&off_10082BCB0;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  PRRangingServiceProxy *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  PRRangingServiceProxy *v14;
  PRRangingServiceProxy *v15;
  _QWORD v17[4];
  PRRangingServiceProxy *v18;
  id v19;
  int v20;
  _QWORD v21[4];
  PRRangingServiceProxy *v22;
  id v23;
  int v24;
  id location;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003CB770(v5);
  v6 = objc_msgSend(v4, "processIdentifier");
  v7 = -[PRRangingService validateClientEntitlements:](self, "validateClientEntitlements:", v4);
  v8 = qword_10085F520;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003C8BC0(v6, v8);
    v9 = -[PRRangingServiceProxy initWithConnection:queue:]([PRRangingServiceProxy alloc], "initWithConnection:queue:", v4, self->_queue);
    -[NSMutableSet addObject:](self->_xpcSessions, "addObject:", v9);
    v10 = sub_100178B10();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v4, "setRemoteObjectInterface:", v11);

    v12 = sub_1001788B0();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v4, "setExportedInterface:", v13);

    objc_msgSend(v4, "setExportedObject:", v9);
    objc_msgSend(v4, "_setQueue:", self->_queue);
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002AFD4;
    v21[3] = &unk_1007FA8E8;
    v24 = v6;
    objc_copyWeak(&v23, &location);
    v14 = v9;
    v22 = v14;
    objc_msgSend(v4, "setInterruptionHandler:", v21);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002B0B0;
    v17[3] = &unk_1007FA8E8;
    v20 = v6;
    objc_copyWeak(&v19, &location);
    v15 = v14;
    v18 = v15;
    objc_msgSend(v4, "setInvalidationHandler:", v17);
    objc_msgSend(v4, "resume");

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003C8C30(v6, v8);
  }

  return v7;
}

- (void)handleXPCDisconnection:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  unsigned int v14;

  v5 = a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingService.mm"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxy"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientInfo"));
  if (v6)
  {
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", PRProcessNameKey));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", PRProcessIdentifierKey));
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 1024;
      v14 = objc_msgSend(v9, "intValue");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PRGenericRangingService: XPC connection teardown. Process name: %@, pid: %d", buf, 0x12u);

    }
  }
  objc_msgSend(v5, "terminate");
  -[NSMutableSet removeObject:](self->_xpcSessions, "removeObject:", v5);

}

- (BOOL)validateClientEntitlements:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.nearbyd.xpc")));
  v6 = 0;
  if (v4)
  {
    v5 = objc_opt_class(NSNumber, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->machServicesNames, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcSessions, 0);
}

@end
