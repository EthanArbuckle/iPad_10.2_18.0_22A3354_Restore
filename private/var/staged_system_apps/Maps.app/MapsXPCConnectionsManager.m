@implementation MapsXPCConnectionsManager

+ (id)sharedManager
{
  if (qword_1014D3CB0 != -1)
    dispatch_once(&qword_1014D3CB0, &stru_1011DFBF8);
  return (id)qword_1014D3CA8;
}

- (MapsXPCConnectionsManager)init
{
  MapsXPCConnectionsManager *v2;
  uint64_t v3;
  NSXPCConnection *brokerConnection;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MapsXPCConnectionsManager;
  v2 = -[MapsXPCConnectionsManager init](&v13, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSXPCConnection _maps_mapsConnectionBrokerEndpointProviderConnection](NSXPCConnection, "_maps_mapsConnectionBrokerEndpointProviderConnection"));
    brokerConnection = v2->_brokerConnection;
    v2->_brokerConnection = (NSXPCConnection *)v3;

    -[NSXPCConnection setExportedObject:](v2->_brokerConnection, "setExportedObject:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsConnectionBrokerEndpointConsumerInterface](NSXPCInterface, "_maps_mapsConnectionBrokerEndpointConsumerInterface"));
    -[NSXPCConnection setExportedInterface:](v2->_brokerConnection, "setExportedInterface:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface _maps_mapsConnectionBrokerEndpointProviderInterface](NSXPCInterface, "_maps_mapsConnectionBrokerEndpointProviderInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v2->_brokerConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, v2);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A1C1DC;
    v10[3] = &unk_1011AD260;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_brokerConnection, "setInvalidationHandler:", v10);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A1C208;
    v8[3] = &unk_1011AD260;
    objc_copyWeak(&v9, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_brokerConnection, "setInterruptionHandler:", v8);
    -[NSXPCConnection resume](v2->_brokerConnection, "resume");
    -[MapsXPCConnectionsManager _fetchListenerEndpoints](v2, "_fetchListenerEndpoints");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_brokerConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MapsXPCConnectionsManager;
  -[MapsXPCConnectionsManager dealloc](&v3, "dealloc");
}

- (void)_handleConnectionInvalidated
{
  _QWORD *v2;
  _QWORD block[4];
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A1C3AC;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    ((void (*)(_QWORD *))v2[2])(v2);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A1C3F8;
    block[3] = &unk_1011ADA00;
    v4 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_fetchListenerEndpoints
{
  _QWORD *v2;
  _QWORD block[4];
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A1C518;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    ((void (*)(_QWORD *))v2[2])(v2);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A1C820;
    block[3] = &unk_1011ADA00;
    v4 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)listenerEndpointDidChange:(id)a3 forIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void ***v14;
  void **v15;
  void **v16;
  void **v17;

  v5 = a3;
  v6 = a4;
  sub_100B0AAF0(OS_LOG_TYPE_INFO, CFSTR("MapsXPCConnectionsManager %s %@ %@"), v7, v8, v9, v10, v11, v12, (uint64_t)"-[MapsXPCConnectionsManager listenerEndpointDidChange:forIdentifier:]");
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kSiriPluginXPCEndpointIdentifier")))
  {
    v17 = _NSConcreteStackBlock;
    v13 = sub_100A1C950;
    v14 = &v17;
LABEL_7:
    v14[1] = (void **)3221225472;
    v14[2] = (void **)v13;
    v14[3] = (void **)&unk_1011AC860;
    v14[4] = (void **)v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kCompanionDaemonXPCEndpointIdentifier")))
  {
    v16 = _NSConcreteStackBlock;
    v13 = sub_100A1C994;
    v14 = &v16;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kPushDaemonXPCEndpointIdentifier")))
  {
    v15 = _NSConcreteStackBlock;
    v13 = sub_100A1C9D8;
    v14 = &v15;
    goto LABEL_7;
  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brokerConnection, 0);
}

@end
