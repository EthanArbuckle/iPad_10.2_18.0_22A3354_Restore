@implementation UARPPersonalizationHelper

- (UARPPersonalizationHelper)initWithMachServiceName:(id)a3 updaterName:(id)a4
{
  id v6;
  id v7;
  UARPPersonalizationHelper *v8;
  NSString *v9;
  NSString *serviceName;
  NSString *v11;
  NSString *updaterName;
  os_log_t v13;
  OS_os_log *log;
  NSMutableArray *v15;
  NSMutableArray *pendingRequests;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPPersonalizationHelper;
  v8 = -[UARPPersonalizationHelper init](&v18, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    updaterName = v8->_updaterName;
    v8->_updaterName = v11;

    v13 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v8->_log;
    v8->_log = (OS_os_log *)v13;

    v15 = objc_opt_new(NSMutableArray);
    pendingRequests = v8->_pendingRequests;
    v8->_pendingRequests = v15;

  }
  return v8;
}

- (void)start
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  NSXPCInterface *v5;
  NSXPCInterface *xpcInterface;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  id proxy;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", self->_serviceName, 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  v5 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UARPPersonalizationProtocol));
  xpcInterface = self->_xpcInterface;
  self->_xpcInterface = v5;

  v15[0] = objc_opt_class(NSArray);
  v15[1] = objc_opt_class(NSDictionary);
  v15[2] = objc_opt_class(NSString);
  v15[3] = objc_opt_class(NSNumber);
  v15[4] = objc_opt_class(NSData);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](self->_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v8, "getOutstandingPersonalizationRequests:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](self->_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v8, "personalizationResponse:updaterName:", 0, 0);
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", self->_xpcInterface);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004E04;
  v14[3] = &unk_100008288;
  v14[4] = self;
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004E64;
  v13[3] = &unk_100008288;
  v13[4] = self;
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v13);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  v9 = self->_xpcConnection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004EC4;
  v12[3] = &unk_1000082B0;
  v12[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
  proxy = self->_proxy;
  self->_proxy = v10;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UARPPersonalizationHelper;
  -[UARPPersonalizationHelper dealloc](&v3, "dealloc");
}

- (void)queryOutstandingTssRequests
{
  id proxy;
  NSString *updaterName;
  OS_os_log *log;
  NSMutableArray *pendingRequests;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  NSMutableArray *v15;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100005100;
  v12 = sub_100005110;
  v13 = 0;
  proxy = self->_proxy;
  updaterName = self->_updaterName;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005118;
  v7[3] = &unk_1000082D8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(proxy, "getOutstandingPersonalizationRequests:reply:", updaterName, v7);
  -[NSMutableArray addObjectsFromArray:](self->_pendingRequests, "addObjectsFromArray:", v9[5]);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    pendingRequests = self->_pendingRequests;
    *(_DWORD *)buf = 138412290;
    v15 = pendingRequests;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Pending Tatsu Requests are %@", buf, 0xCu);
  }
  _Block_object_dispose(&v8, 8);

}

- (NSMutableArray)tssRequests
{
  return (NSMutableArray *)-[NSMutableArray copy](self->_pendingRequests, "copy");
}

- (void)completedTssResponse:(id)a3
{
  id v4;
  OS_os_log *log;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[UARPPersonalizationHelper completedTssResponse:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: Tatsu Response is %@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(self->_proxy, "personalizationResponse:updaterName:", v4, self->_updaterName);

}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_proxy, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_updaterName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
