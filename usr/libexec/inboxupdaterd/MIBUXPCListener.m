@implementation MIBUXPCListener

+ (id)sharedInstance
{
  if (qword_100068918 != -1)
    dispatch_once(&qword_100068918, &stru_1000577F8);
  return (id)qword_100068910;
}

- (MIBUXPCListener)init
{
  MIBUXPCListener *v2;
  id v3;
  void *v4;
  void *v5;
  MIBUXPCListener *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MIBUXPCListener;
  v2 = -[MIBUXPCListener init](&v16, "init");
  if (!v2)
    goto LABEL_4;
  v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.inboxupdaterd"));
  -[MIBUXPCListener setListener:](v2, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUXPCListener listener](v2, "listener"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUXPCListener listener](v2, "listener"));
    objc_msgSend(v5, "setDelegate:", v2);

LABEL_4:
    v6 = v2;
    goto LABEL_10;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057818);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003CE34(v7, v8, v9, v10, v11, v12, v13, v14);
  v6 = 0;
LABEL_10:

  return v6;
}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MIBUXPCListener listener](self, "listener"));
  objc_msgSend(v2, "resume");

}

- (void)terminate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MIBUXPCListener listener](self, "listener"));
  objc_msgSend(v2, "invalidate");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MIBUXPCResponder *v11;
  BOOL v12;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  _BYTE v19[24];

  v5 = a3;
  v6 = a4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057838);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received a new xpc connection!", v19, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.mobileinboxupdater.xpc")));
  if (!v8)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057858);
    v14 = qword_100068950;
    if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)&v19[4] = "-[MIBUXPCListener listener:shouldAcceptNewConnection:]";
    v15 = "%s: connection does not have entitlements needed.";
    v16 = v14;
    v17 = 12;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, v19, v17);
    goto LABEL_19;
  }
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057878);
    v18 = qword_100068950;
    if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)&v19[4] = "-[MIBUXPCListener listener:shouldAcceptNewConnection:]";
    *(_WORD *)&v19[12] = 2112;
    *(_QWORD *)&v19[14] = v8;
    v15 = "%s: format not correct: %@";
    v16 = v18;
    v17 = 22;
    goto LABEL_18;
  }
  if (!objc_msgSend(v8, "BOOLValue"))
  {
LABEL_19:
    objc_msgSend(v6, "invalidate", *(_OWORD *)v19, *(_QWORD *)&v19[16]);
    v12 = 0;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MIBUXPCProtocol));
  objc_msgSend(v6, "setExportedInterface:", v10);

  v11 = objc_alloc_init(MIBUXPCResponder);
  -[MIBUXPCResponder setXpcConnection:](v11, "setXpcConnection:", v6);
  objc_msgSend(v6, "setExportedObject:", v11);
  objc_msgSend(v6, "resume");

  v12 = 1;
LABEL_9:

  return v12;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
