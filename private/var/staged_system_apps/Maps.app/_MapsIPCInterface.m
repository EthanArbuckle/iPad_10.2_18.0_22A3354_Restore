@implementation _MapsIPCInterface

- (_MapsIPCInterface)initWithListenerEndpointIdentifier:(id)a3
{
  id v4;
  _MapsIPCInterface *v5;
  NSString *v6;
  NSString *endpointIdentifier;
  NSString *v8;
  id v9;
  const char *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *messagingQueue;
  id v15;
  const char *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *connectionQueue;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MapsIPCInterface;
  v5 = -[_MapsIPCInterface init](&v22, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    endpointIdentifier = v5->_endpointIdentifier;
    v5->_endpointIdentifier = v6;

    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Maps.IPCInterface.%@"), objc_opt_class(v5));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create(v10, v12);
    messagingQueue = v5->_messagingQueue;
    v5->_messagingQueue = (OS_dispatch_queue *)v13;

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR(".connection"))));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create(v16, v18);
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v19;

    -[_MapsIPCInterface initializeBrokerConnectionIfNeeded](v5, "initializeBrokerConnectionIfNeeded");
  }

  return v5;
}

- (void)initializeBrokerConnectionIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSXPCConnection *v9;
  NSXPCConnection *brokerConnection;
  void *v11;
  void *v12;
  NSXPCListener *v13;
  NSXPCListener *xpcListener;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsIPCInterface initializeBrokerConnectionIfNeeded"), v2, v3, v4, v5, v6, v7, v23);
  if (!self->_brokerConnection)
  {
    v9 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection _maps_mapsConnectionBrokerEndpointRecorderConnection](NSXPCConnection, "_maps_mapsConnectionBrokerEndpointRecorderConnection"));
    brokerConnection = self->_brokerConnection;
    self->_brokerConnection = v9;

    -[NSXPCConnection setExportedObject:](self->_brokerConnection, "setExportedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsConnectionBrokerEndpointSourceInterface](NSXPCInterface, "_maps_mapsConnectionBrokerEndpointSourceInterface"));
    -[NSXPCConnection setExportedInterface:](self->_brokerConnection, "setExportedInterface:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsConnectionBrokerEndpointRecorderInterface](NSXPCInterface, "_maps_mapsConnectionBrokerEndpointRecorderInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](self->_brokerConnection, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100821F18;
    v27[3] = &unk_1011AD260;
    objc_copyWeak(&v28, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_brokerConnection, "setInvalidationHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100821F6C;
    v25[3] = &unk_1011AD260;
    objc_copyWeak(&v26, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_brokerConnection, "setInterruptionHandler:", v25);
    -[NSXPCConnection resume](self->_brokerConnection, "resume");
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    v13 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v13;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsIPCInterface Initializing broker connection."), v15, v16, v17, v18, v19, v20, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_brokerConnection, "remoteObjectProxy"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](self->_xpcListener, "endpoint"));
    objc_msgSend(v21, "listenerEndpointDidChange:forIdentifier:", v22, self->_endpointIdentifier);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsIPCInterface Tear down broker connection."), v3, v4, v5, v6, v7, v8, (uint64_t)v10.receiver);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_brokerConnection, "remoteObjectProxy"));
  objc_msgSend(v9, "listenerEndpointDidChange:forIdentifier:", 0, self->_endpointIdentifier);

  -[NSXPCConnection invalidate](self->_brokerConnection, "invalidate");
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v10.receiver = self;
  v10.super_class = (Class)_MapsIPCInterface;
  -[_MapsIPCInterface dealloc](&v10, "dealloc");
}

- (BOOL)_isMapsRunning
{
  id v2;
  unsigned int v3;

  v2 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  v3 = objc_msgSend(v2, "applicationStateForApplication:", CFSTR("com.apple.Maps"));

  return (v3 & 1) == 0 && v3 != 0;
}

- (BOOL)_isMapsActive
{
  id v2;
  unsigned int v3;

  v2 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  v3 = objc_msgSend(v2, "applicationStateForApplication:", CFSTR("com.apple.Maps"));

  return (v3 & 3) == 0 && v3 != 0;
}

- (BOOL)canReceiveMessages
{
  return -[_MapsIPCInterface _isMapsActive](self, "_isMapsActive");
}

- (void)performWithMapsRunning:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  if (qword_1014D3568 != -1)
    dispatch_once(&qword_1014D3568, &stru_1011CA298);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", qword_1014D3560));
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsIPCInterface performWithMapsRunning calling openApplication"), v6, v7, v8, v9, v10, v11, v13);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008222D0;
  v14[3] = &unk_1011BCA78;
  v15 = v3;
  v12 = v3;
  objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.Maps"), v5, v14);

}

- (NSXPCConnection)connection
{
  NSObject *connectionQueue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD block[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_messagingQueue);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1008224B0;
  v28 = sub_1008224C0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1008224B0;
  v22 = sub_1008224C0;
  v23 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008224C8;
  block[3] = &unk_1011CA2C0;
  block[4] = self;
  block[5] = &v24;
  block[6] = &v18;
  dispatch_sync(connectionQueue, block);
  v10 = v19[5];
  if (v10)
  {
    v11 = dispatch_walltime(0, 20000000000);
    dispatch_group_wait(v10, v11);
    v12 = self->_connectionQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100822634;
    v16[3] = &unk_1011ADF48;
    v16[4] = self;
    v16[5] = &v24;
    dispatch_sync(v12, v16);
  }
  else
  {
    sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsIPCInterface Didn't get a dispatchGroup to wait on"), v4, v5, v6, v7, v8, v9, v15);
  }
  v13 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return (NSXPCConnection *)v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSXPCListener *xpcListener;
  NSObject *connectionQueue;
  id v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD block[4];
  id v21;
  _MapsIPCInterface *v22;
  _QWORD v23[4];
  id v24;
  id location;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsIPCInterface %s %@ %@"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[_MapsIPCInterface listener:shouldAcceptNewConnection:]");
  xpcListener = self->_xpcListener;
  if (xpcListener == v6)
  {
    -[_MapsIPCInterface _configureIncomingConnection:](self, "_configureIncomingConnection:", v7);
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100822890;
    v23[3] = &unk_1011AD260;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v23);
    objc_msgSend(v7, "setInterruptionHandler:", &stru_1011CA2E0);
    connectionQueue = self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10082295C;
    block[3] = &unk_1011AC8B0;
    v16 = v7;
    v21 = v16;
    v22 = self;
    dispatch_sync(connectionQueue, block);
    objc_msgSend(v16, "resume");
    v17 = self->_connectionQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1008229A0;
    v19[3] = &unk_1011AC860;
    v19[4] = self;
    dispatch_async(v17, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return xpcListener == v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionGroup, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_brokerConnection, 0);
  objc_storeStrong((id *)&self->_messagingQueue, 0);
}

@end
