@implementation CLIndoorMaintenanceDelegate

- (CLIndoorMaintenanceDelegate)initWithService:(id)a3
{
  id v4;
  CLIndoorMaintenanceDelegate *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *q;
  CLIndoorMaintenanceDelegate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLIndoorMaintenanceDelegate;
  v5 = -[CLIndoorMaintenanceDelegate init](&v10, "init");
  if (v5
    && (v6 = dispatch_queue_create("com.apple.pipelined.maintenance", 0),
        q = v5->_q,
        v5->_q = (OS_dispatch_queue *)v6,
        q,
        v5->_q))
  {
    v5->_shutdown = 0;
    objc_storeWeak((id *)&v5->_serviceDelegate, v4);
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3
{
  CLIndoorTileEvictionPolicy *v3;
  double v4;
  double v5;
  void (**v6)(double);

  v6 = (void (**)(double))a3;
  v3 = objc_alloc_init(CLIndoorTileEvictionPolicy);
  -[CLIndoorTileEvictionPolicy maxModifiedAge](v3, "maxModifiedAge");
  v5 = v4;

  v6[2](v5);
}

- (void)prefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;

  v5 = a5;
  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  if (!+[Keybag afterFirstUserUnlock](Keybag, "afterFirstUserUnlock"))
  {
    if (qword_100417EF8 == -1)
    {
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v9[2](v9);
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406F48);
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
    }
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Attempt to request prefetch before first unlock - ignoring", (uint8_t *)&v17, 2u);
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100406F48);
  v11 = (id)qword_100417F00;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v10, "count");
    v13 = objc_msgSend(v8, "count");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v17 = 134349571;
    v18 = v12;
    v19 = 2050;
    v20 = v13;
    v21 = 2113;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}lu/%{public}lu requests unique. Full request: %{private}@", (uint8_t *)&v17, 0x20u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorMaintenanceDelegate serviceDelegate](self, "serviceDelegate"));
  objc_msgSend(v15, "prefetch:callback:when:", v10, v9, v5);

LABEL_11:
}

- (void)eraseAllData:(id)a3
{
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  CLIndoorTileEvictionPolicy *v9;
  void *v10;
  uint8_t v11[16];

  v5 = (void (**)(_QWORD))a3;
  if (qword_100417EF8 == -1)
  {
    v6 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100406F48);
  v6 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to eraseAllData", v11, 2u);
  }
LABEL_4:
  v5[2](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = +[CLIndoorServiceDelegate validateEntitlement:forConnection:forSelector:](CLIndoorServiceDelegate, "validateEntitlement:forConnection:forSelector:", CFSTR("maintenance"), v7, a2);

  if ((v8 & 1) != 0)
  {
    v9 = objc_alloc_init(CLIndoorTileEvictionPolicy);
    -[CLIndoorTileEvictionPolicy setMaxModifiedAge:](v9, "setMaxModifiedAge:", -1.79769313e308);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorMaintenanceDelegate serviceDelegate](self, "serviceDelegate"));
    objc_msgSend(v10, "cancelPrefetch");
    objc_msgSend(v10, "clearTiles:", v9);
    objc_msgSend(v10, "fullyVacuumAllDBs");

  }
}

- (void)clearTiles:(id)a3 withCallback:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  int v14;
  void *v15;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100406F48);
  v9 = (id)qword_100417F00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v14 = 138543362;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Request to evict tiles against policy %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v8[2](v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = +[CLIndoorServiceDelegate validateEntitlement:forConnection:forSelector:](CLIndoorServiceDelegate, "validateEntitlement:forConnection:forSelector:", CFSTR("maintenance"), v11, a2);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorMaintenanceDelegate serviceDelegate](self, "serviceDelegate"));
    objc_msgSend(v13, "clearTiles:", v7);

  }
}

- (void)shutdown
{
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  if (qword_100417EF8 == -1)
  {
    v4 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100406F48);
  v4 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request to shutdown", buf, 2u);
  }
LABEL_4:
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = +[CLIndoorServiceDelegate validateEntitlement:forConnection:forSelector:](CLIndoorServiceDelegate, "validateEntitlement:forConnection:forSelector:", CFSTR("maintenance"), v5, a2);

  if ((v6 & 1) == 0)
    return;
  if (self->_shutdown)
  {
    if (qword_100417EF8 == -1)
    {
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      goto LABEL_8;
    }
    dispatch_once(&qword_100417EF8, &stru_100406F48);
    v7 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    {
LABEL_8:
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "request to shut down but already shutting down", v11, 2u);
    }
  }
LABEL_9:
  self->_shutdown = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorMaintenanceDelegate serviceDelegate](self, "serviceDelegate"));
  objc_msgSend(v8, "shutdown");
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100406F48);
    v9 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Requesting graceful shutdown when no transaction remains active", v10, 2u);
  }
LABEL_12:
  xpc_transaction_exit_clean();

}

- (void)numFloors:(id)a3
{
  void (**v5)(id, id);
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  uint8_t v10[16];

  v5 = (void (**)(id, id))a3;
  if (qword_100417EF8 == -1)
  {
    v6 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100406F48);
  v6 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to return number of floors in the database", v10, 2u);
  }
LABEL_4:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = +[CLIndoorServiceDelegate validateEntitlement:forConnection:forSelector:](CLIndoorServiceDelegate, "validateEntitlement:forConnection:forSelector:", CFSTR("maintenance"), v7, a2);

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorMaintenanceDelegate serviceDelegate](self, "serviceDelegate"));
    v5[2](v5, objc_msgSend(v9, "numFloors"));

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD *v14;
  id to;
  id location;
  _QWORD v18[5];
  __int128 buf;
  void (*v20)(uint64_t);
  void *v21;
  id v22;

  v6 = a4;
  v7 = +[CLIndoorServiceDelegate validateEntitlement:forConnection:forSelector:](CLIndoorServiceDelegate, "validateEntitlement:forConnection:forSelector:", CFSTR("maintenance"), v6, a2);
  if (v7)
  {
    if (!self->_shutdown)
      goto LABEL_7;
    if (qword_100417EF8 == -1)
    {
      v8 = (id)qword_100417F00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_6:

LABEL_7:
        if (qword_100417EF8 == -1)
        {
          v9 = (id)qword_100417F00;
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
LABEL_10:

            objc_msgSend(v6, "_setQueue:", self->_q);
            v18[0] = objc_opt_class(CLPrefetchFloorRequest);
            v18[1] = objc_opt_class(NSArray);
            v18[2] = objc_opt_class(NSMutableArray);
            v18[3] = objc_opt_class(NSString);
            v18[4] = objc_opt_class(NSDate);
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 5));
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLIndoorMaintenanceProtocol));
            objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v12, "prefetch:callback:when:", 0, 0);
            objc_msgSend(v6, "setExportedInterface:", v13);
            objc_msgSend(v6, "setExportedObject:", self);
            objc_msgSend(v6, "setRemoteObjectInterface:", 0);
            objc_initWeak(&location, v6);
            objc_copyWeak(&to, &location);
            *(_QWORD *)&buf = _NSConcreteStackBlock;
            *((_QWORD *)&buf + 1) = 3321888768;
            v20 = sub_100324DC4;
            v21 = &unk_100406F68;
            objc_copyWeak(&v22, &to);
            v14 = objc_retainBlock(&buf);
            objc_destroyWeak(&v22);
            objc_msgSend(v6, "setInvalidationHandler:", v14);

            objc_destroyWeak(&to);
            objc_msgSend(v6, "resume");
            objc_destroyWeak(&location);

            goto LABEL_11;
          }
        }
        else
        {
          dispatch_once(&qword_100417EF8, &stru_100406F48);
          v9 = (id)qword_100417F00;
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            goto LABEL_10;
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorServiceDelegate versionString](CLIndoorServiceDelegate, "versionString"));
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "New XPC connection to pipelined maintenance %{public}@", (uint8_t *)&buf, 0xCu);

        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406F48);
      v8 = (id)qword_100417F00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    LODWORD(buf) = 67240192;
    DWORD1(buf) = objc_msgSend(v6, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connection request from %{public}d postponing shutdown", (uint8_t *)&buf, 8u);
    goto LABEL_6;
  }
LABEL_11:

  return v7;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
  objc_storeStrong((id *)&self->_q, a3);
}

- (CLIndoorServiceDelegate)serviceDelegate
{
  return (CLIndoorServiceDelegate *)objc_loadWeakRetained((id *)&self->_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serviceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceDelegate);
  objc_storeStrong((id *)&self->_q, 0);
}

@end
