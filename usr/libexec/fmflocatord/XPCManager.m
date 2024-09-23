@implementation XPCManager

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_1000697D0 != -1)
    dispatch_once(&qword_1000697D0, &stru_100056468);
  v2 = (void *)qword_1000697C8;
  if (!qword_1000697C8)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The XPCManager singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_1000697C8;
  }
  return v2;
}

- (XPCManager)init
{
  id v3;
  NSObject *v4;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100035630(v4);

  return 0;
}

- (id)initSingleton
{
  XPCManager *v2;
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
  v13.super_class = (Class)XPCManager;
  v2 = -[XPCManager init](&v13, "init");
  if (v2)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10003566C(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)&qword_1000697C8, v2);
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100034C70(self, v4);

  v5 = (void *)qword_1000697C8;
  qword_1000697C8 = 0;

  v6.receiver = self;
  v6.super_class = (Class)XPCManager;
  -[XPCManager dealloc](&v6, "dealloc");
}

- (void)initializeXPC
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Initializing XPC...", v9, 2u);
  }

  v5 = objc_alloc((Class)NSXPCListener);
  v6 = objc_msgSend(v5, "initWithMachServiceName:", off_100068E58);
  -[XPCManager setNsxpcListener:](self, "setNsxpcListener:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[XPCManager nsxpcListener](self, "nsxpcListener"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[XPCManager nsxpcListener](self, "nsxpcListener"));
  objc_msgSend(v8, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  __objc2_prot *v7;
  XPCServer *v8;
  void *v9;
  int v11;
  id v12;

  v4 = a4;
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received new XPC connection %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = &OBJC_PROTOCOL___XPCServerProtocol;
  v8 = objc_opt_new(XPCServer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", v7));
  objc_msgSend(v4, "setExportedInterface:", v9);

  objc_msgSend(v4, "setExportedObject:", v8);
  objc_msgSend(v4, "resume");

  return 1;
}

- (NSXPCListener)nsxpcListener
{
  return self->_nsxpcListener;
}

- (void)setNsxpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_nsxpcListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsxpcListener, 0);
}

@end
