@implementation PowerModesService

+ (id)sharedInstance
{
  if (qword_10001BE58 != -1)
    dispatch_once(&qword_10001BE58, &stru_100014648);
  return (id)qword_10001BE50;
}

- (PowerModesService)init
{
  PowerModesService *v2;
  NSObject *v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PowerModesService;
  v2 = -[PowerModesService initWithMachServiceName:](&v10, "initWithMachServiceName:", CFSTR("com.apple.powerexperienced.powermodesservice"));
  if (v2)
  {
    v3 = qword_10001BE60;
    if (os_log_type_enabled((os_log_t)qword_10001BE60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "starting service", v9, 2u);
    }
    -[PowerModesService setDelegate:](v2, "setDelegate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[PowerModesService setClients:](v2, "setClients:", v4);

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.powerexperienced.powermodesservice", v6);
    -[PowerModesService setQueue:](v2, "setQueue:", v7);

  }
  return v2;
}

- (void)start
{
  -[PowerModesService activate](self, "activate");
  notify_post("com.apple.powerexperienced.restart");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _DWORD v11[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____ContextualPowerModesProtocol));
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____ContextualPowerModesCallbackProtocol));
  objc_msgSend(v5, "setRemoteObjectInterface:", v7);

  v8 = (void *)qword_10001BE60;
  if (os_log_type_enabled((os_log_t)qword_10001BE60, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v11[0] = 67109120;
    v11[1] = objc_msgSend(v5, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PowerModesManager: listener: accepted new connection from pid %d", (uint8_t *)v11, 8u);

  }
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)updateClientsforMode:(id)a3 withState:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[PowerModesService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008A70;
  block[3] = &unk_100014698;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)registerWithIdentifier:(id)a3 forModes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  PowerModesService *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = objc_claimAutoreleasedReturnValue(-[PowerModesService queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008DD8;
  v13[3] = &unk_100014548;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = self;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v13);

}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
