@implementation FMDXPCManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  FMDFMIPXPCServer *v12;
  void *v13;
  int v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received new XPC connection %@", (uint8_t *)&v15, 0xCu);
  }

  v10 = (id)objc_claimAutoreleasedReturnValue(-[FMDXPCManager fmdXPCListener](self, "fmdXPCListener"));
  if (v10 == v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FMDFMIPProtocol));
    objc_msgSend(v6, "setExportedInterface:", v11);

    v12 = objc_opt_new(FMDFMIPXPCServer);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCManager protectedIDSManager](self, "protectedIDSManager"));
    -[FMDFMIPXPCServer setProtectedIDSManager:](v12, "setProtectedIDSManager:", v13);

    objc_msgSend(v6, "setExportedObject:", v12);
  }
  objc_msgSend(v6, "resume");

  return 1;
}

- (FMNanoIDSManager)protectedIDSManager
{
  return self->_protectedIDSManager;
}

- (NSXPCListener)fmdXPCListener
{
  return self->_fmdXPCListener;
}

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_1003064F8 != -1)
    dispatch_once(&qword_1003064F8, &stru_1002C2418);
  v2 = (void *)qword_1003064F0;
  if (!qword_1003064F0)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The FMDXPCManager singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_1003064F0;
  }
  return v2;
}

- (FMDXPCManager)init
{
  id v3;
  NSObject *v4;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100227208(v4);

  return 0;
}

- (id)initSingleton
{
  FMDXPCManager *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMDXPCManager;
  v2 = -[FMDXPCManager init](&v13, "init");
  if (v2)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100227244(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)&qword_1003064F0, v2);
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100225550(self, v4);

  v5 = (void *)qword_1003064F0;
  qword_1003064F0 = 0;

  v6.receiver = self;
  v6.super_class = (Class)FMDXPCManager;
  -[FMDXPCManager dealloc](&v6, "dealloc");
}

- (void)initializeXPC
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing XPC...", v12, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration"));
  v6 = objc_msgSend(objc_alloc((Class)FMNanoIDSManager), "initWithServiceId:minimumVersion:", CFSTR("com.apple.private.alloy.findmydeviced.aoverc"), 3);
  objc_msgSend(v6, "start");
  -[FMDXPCManager setProtectedIDSManager:](self, "setProtectedIDSManager:", v6);
  v7 = objc_alloc((Class)NSXPCListener);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  v9 = objc_msgSend(v7, "initWithMachServiceName:", v8);
  -[FMDXPCManager setFmdXPCListener:](self, "setFmdXPCListener:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCManager fmdXPCListener](self, "fmdXPCListener"));
  objc_msgSend(v10, "setDelegate:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCManager fmdXPCListener](self, "fmdXPCListener"));
  objc_msgSend(v11, "resume");

}

- (void)setFmdXPCListener:(id)a3
{
  objc_storeStrong((id *)&self->_fmdXPCListener, a3);
}

- (NSXPCListener)fmdUserAgentXPCListener
{
  return self->_fmdUserAgentXPCListener;
}

- (void)setFmdUserAgentXPCListener:(id)a3
{
  objc_storeStrong((id *)&self->_fmdUserAgentXPCListener, a3);
}

- (void)setProtectedIDSManager:(id)a3
{
  objc_storeStrong((id *)&self->_protectedIDSManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedIDSManager, 0);
  objc_storeStrong((id *)&self->_fmdUserAgentXPCListener, 0);
  objc_storeStrong((id *)&self->_fmdXPCListener, 0);
}

@end
