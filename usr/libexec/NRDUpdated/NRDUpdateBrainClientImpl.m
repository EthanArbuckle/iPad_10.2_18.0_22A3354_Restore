@implementation NRDUpdateBrainClientImpl

- (NRDUpdateBrainClientImpl)init
{
  NRDUpdateBrainClientImpl *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRDUpdateBrainClientImpl;
  result = -[NRDUpdateBrainClientImpl init](&v3, "init");
  if (result)
  {
    result->_brainProtocol = (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate;
    result->_brainProtocolVersion = 1;
  }
  return result;
}

- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3
{
  NRDUpdateBrainClientImpl *result;

  result = -[NRDUpdateBrainClientImpl init](self, "init");
  if (result)
    result->_delegate = (NRDUpdateBrainDelegateInterface *)a3;
  return result;
}

- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3
{
  NRDUpdateBrainClientImpl *v4;
  NRDUpdateBrainClientImpl *result;
  id v6;

  v4 = -[NRDUpdateBrainClientImpl init](self, "init");
  result = 0;
  if (a3)
  {
    if (v4)
    {
      v4->_serverEndpoint = (NSXPCListenerEndpoint *)a3;
      v6 = a3;
      return v4;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
  self->_delegate = 0;

  v3.receiver = self;
  v3.super_class = (Class)NRDUpdateBrainClientImpl;
  -[NRDUpdateBrainClientImpl dealloc](&v3, "dealloc");
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  -[NRDUpdateBrainClientImpl connectToServerIfNecessary](self, "connectToServerIfNecessary");
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_serverConnection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void)_invalidateConnection_nolock
{
  NSXPCConnection *serverConnection;

  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](serverConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", 0);
    -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");

    self->_serverConnection = 0;
    self->_connected = 0;
  }
}

- (void)_invalidateConnection
{
  objc_sync_enter(self);
  -[NRDUpdateBrainClientImpl _invalidateConnection_nolock](self, "_invalidateConnection_nolock");
  objc_sync_exit(self);
}

- (void)_connectToServerIfNecessary_nolock
{
  NSXPCListenerEndpoint *serverEndpoint;
  id v4;
  NSXPCConnection *v5;
  NSObject *v6;
  NSXPCInterface *v7;
  NSXPCInterface *v8;
  NSXPCInterface *v9;
  NSXPCInterface *v10;
  NRDUpdateBrainDelegateInterface *delegate;
  uint64_t v12;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];

  if (!self->_connected)
  {
    -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    serverEndpoint = self->_serverEndpoint;
    v4 = objc_alloc((Class)NSXPCConnection);
    if (serverEndpoint)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", self->_serverEndpoint);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithServiceName:options:", CFSTR("com.apple.NRD.UpdateBrainService"), 0);
    self->_serverConnection = v5;
    v6 = dispatch_queue_create("com.apple.NRDUpdateBrainClient.serverConnectionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    -[NSXPCConnection _setQueue:](self->_serverConnection, "_setQueue:", v6);
    dispatch_release(v6);
    v7 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2);
    v8 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NRDUpdateBrainDelegateInterface);
    v9 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NRDBackgroundActivitySchedulerInterface);
    v10 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NRDRemoteableBlockInterface);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v9, "setInterface:forSelector:argumentIndex:ofReply:", v10, "scheduleWithRemoteableBlock:", 0, 0);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v9, "setInterface:forSelector:argumentIndex:ofReply:", v10, "setCheckInHandler:", 0, 0);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v7, "setInterface:forSelector:argumentIndex:ofReply:", v10, "downloadNeRDUpdate:options:progress:completion:", 2, 0);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v7, "setInterface:forSelector:argumentIndex:ofReply:", v10, "installNeRDUpdate:options:progress:completion:", 2, 0);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v7, "setInterface:forSelector:argumentIndex:ofReply:", v10, "finishNeRDUpdate:", 0, 1);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, "newSchedulerWithIdentifier:reply:", 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v7);
    delegate = self->_delegate;
    if (delegate)
    {
      -[NSXPCConnection setExportedInterface:](self->_serverConnection, "setExportedInterface:", v8);
      -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self->_delegate);
      delegate = self->_delegate;
    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3052000000;
    v15[3] = __Block_byref_object_copy_;
    v15[4] = __Block_byref_object_dispose_;
    v15[5] = self;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3052000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    v14[5] = delegate;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v13[3] = &unk_100014508;
    v13[4] = v15;
    v13[5] = v14;
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:", v13, _NSConcreteStackBlock, 3221225472, __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_136, &unk_100014508, v15, v14);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", &v12);
    -[NSXPCConnection resume](self->_serverConnection, "resume");
    self->_connected = 1;
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);
  }
}

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const __CFString *v5;

  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.NRD.UpdateBrainService");
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connection to %@ invalidated", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "noteConnectionDropped");
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    result = objc_opt_respondsToSelector(result, "connectionInvalidated");
    if ((result & 1) != 0)
      return (uint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "connectionInvalidated");
  }
  return result;
}

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_136(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const __CFString *v5;

  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.NRD.UpdateBrainService");
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connection to %@ interrupted", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "noteConnectionDropped");
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    result = objc_opt_respondsToSelector(result, "connectionInterrupted");
    if ((result & 1) != 0)
      return (uint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "connectionInterrupted");
  }
  return result;
}

- (void)connectToServerIfNecessary
{
  objc_sync_enter(self);
  -[NRDUpdateBrainClientImpl _connectToServerIfNecessary_nolock](self, "_connectToServerIfNecessary_nolock");
  objc_sync_exit(self);
}

- (void)noteConnectionDropped
{
  objc_sync_enter(self);
  self->_connected = 0;
  objc_sync_exit(self);
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    v9 = nrdSharedLogger();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10)
        -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:].cold.2((uint64_t)a4, (uint64_t)a3, v9);
    }
    else if (v10)
    {
      -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:].cold.1((uint64_t)a3, v9, v11, v12, v13, v14, v15, v16);
    }
    -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)ping:(id)a3
{
  NSObject *v5;
  void *v6;
  NSDate *v7;
  NSDate *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  _QWORD v24[7];
  _QWORD v25[8];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  timespec buf;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain...", (uint8_t *)&buf, 2u);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke;
  v25[3] = &unk_100014558;
  v25[4] = self;
  v25[5] = a3;
  v25[6] = &v26;
  v25[7] = "-[NRDUpdateBrainClientImpl ping:]";
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_139;
  v24[3] = &unk_1000145D0;
  v24[4] = self;
  v24[5] = a3;
  v24[6] = &v26;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v25), "ping:", v24);
  v21 = __33__NRDUpdateBrainClientImpl_ping___block_invoke_160;
  v22 = &unk_1000145F8;
  v23 = &v26;
  v6 = objc_autoreleasePoolPush();
  v7 = +[NSDate date](NSDate, "date", _NSConcreteStackBlock, 3221225472);
  do
  {
    v8 = +[NSDate date](NSDate, "date");
    -[NSRunLoop runUntilDate:](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "runUntilDate:", -[NSDate dateByAddingTimeInterval:](v8, "dateByAddingTimeInterval:", 0.125));
    -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", v8);
    if (v9 < 0.125)
    {
      v10 = 0.125 - v9;
      buf.tv_sec = (uint64_t)v10;
      buf.tv_nsec = (uint64_t)((v10 - (double)(uint64_t)v10) * 1000000000.0);
      nanosleep(&buf, 0);
    }
    if ((v21((uint64_t)&v20) & 1) != 0)
      break;
    -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", v7);
  }
  while (v11 < 30.0);
  objc_autoreleasePoolPop(v6);
  if (!*((_BYTE *)v27 + 24))
  {
    v12 = nrdSharedLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NRDUpdateBrainClientImpl ping:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v31 = NSDebugDescriptionErrorKey;
    v32 = CFSTR("timeout connecting to brain endpoint");
    (*((void (**)(id, NSError *))a3 + 2))(a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 101, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1)));
  }
  _Block_object_dispose(&v26, 8);
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_2;
  v5[3] = &unk_100014530;
  v5[4] = a2;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v5);
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke_139(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  void *v13;
  _QWORD v14[6];
  __int128 v15;
  uint8_t buf[16];

  v4 = nrdSharedLogger();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __33__NRDUpdateBrainClientImpl_ping___block_invoke_139_cold_1(a2, v5, v6, v7, v8, v9, v10, v11);
    result = (id)(*(uint64_t (**)(void))(a1[5] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain succeeded", buf, 2u);
    }
    v13 = (void *)a1[4];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_140;
    v14[3] = &unk_1000145A8;
    v14[4] = v13;
    v14[5] = 0;
    v15 = *(_OWORD *)(a1 + 5);
    return objc_msgSend(v13, "getListenerEndpoint:", v14);
  }
  return result;
}

NRDUpdateBrainClientImpl *__33__NRDUpdateBrainClientImpl_ping___block_invoke_140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  NRDUpdateBrainClientImpl *result;
  NRDUpdateBrainClientImpl *v6;
  __int128 v7;
  uint8_t v8[8];
  _QWORD v9[4];
  __int128 v10;
  NRDUpdateBrainClientImpl *v11;
  __int128 v12;

  if (a3)
  {
    v4 = nrdSharedLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not probe for NRDUpdateBrainInterfacePrivate2.", v8, 2u);
    }
    result = (NRDUpdateBrainClientImpl *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v6 = -[NRDUpdateBrainClientImpl initWithEndpoint:]([NRDUpdateBrainClientImpl alloc], "initWithEndpoint:", a2);
    v9[1] = 3221225472;
    v7 = *(_OWORD *)(a1 + 48);
    v10 = *(_OWORD *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_146;
    v9[3] = &unk_100014580;
    v12 = v7;
    v11 = v6;
    -[NRDUpdateBrainClientImpl ping:reply:](v6, "ping:reply:", &off_100015AC8, v9);
    return v6;
  }
  return result;
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke_146(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = nrdSharedLogger();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NeRD update brain does not support NRDUpdateBrainInterfacePrivate2.", v11, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NeRD update brain supports NRDUpdateBrainInterfacePrivate2.", buf, 2u);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BrainVersion"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BrainTimeStamp"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BrainUUID"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("DylibUUID"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2;
    v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("__BrainProtocolVersion"));
    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("__BrainProtocolVersion")), "unsignedIntValue");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateConnection");
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_160(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)ping:(id)a3 reply:(id)a4
{
  NSObject *v7;
  void *v8;
  NSDate *v9;
  NSDate *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  _QWORD v26[6];
  _QWORD v27[8];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  timespec buf;
  _QWORD v33[3];
  _QWORD v34[3];

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v7 = nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Probing NeRD update brain for NRDUpdateBrainInterfacePrivate2...", (uint8_t *)&buf, 2u);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke;
  v27[3] = &unk_100014558;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = &v28;
  v27[7] = "-[NRDUpdateBrainClientImpl ping:reply:]";
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3;
  v26[3] = &unk_100014620;
  v26[4] = a4;
  v26[5] = &v28;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v27), "ping:reply:", a3, v26);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v23 = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4;
  v24 = &unk_1000145F8;
  v25 = &v28;
  v8 = objc_autoreleasePoolPush();
  v9 = +[NSDate date](NSDate, "date");
  do
  {
    v10 = +[NSDate date](NSDate, "date");
    -[NSRunLoop runUntilDate:](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "runUntilDate:", -[NSDate dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", 0.125));
    -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", v10);
    if (v11 < 0.125)
    {
      v12 = 0.125 - v11;
      buf.tv_sec = (uint64_t)v12;
      buf.tv_nsec = (uint64_t)((v12 - (double)(uint64_t)v12) * 1000000000.0);
      nanosleep(&buf, 0);
    }
    if ((v23((uint64_t)v22) & 1) != 0)
      break;
    -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", v9);
  }
  while (v13 < 30.0);
  objc_autoreleasePoolPop(v8);
  if (!*((_BYTE *)v29 + 24))
  {
    v14 = nrdSharedLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NRDUpdateBrainClientImpl ping:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v33[0] = NSDebugDescriptionErrorKey;
    v33[1] = CFSTR("Protocol");
    v34[0] = CFSTR("timeout connecting to brain endpoint");
    v34[1] = CFSTR("NRDUpdateBrainInterfacePrivate2");
    v33[2] = CFSTR("Non-fatal");
    v34[2] = &__kCFBooleanTrue;
    (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 101, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3)));
  }
  _Block_object_dispose(&v28, 8);
}

id __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2;
  v5[3] = &unk_100014530;
  v5[4] = a2;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v5);
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)run:(unint64_t)a3 callback:(id)a4
{
  -[NRDUpdateBrainClientImpl run:options:callback:](self, "run:options:callback:", a3, 0, a4);
}

- (void)run:(unint64_t)a3 options:(id)a4 callback:(id)a5
{
  id v9;
  _QWORD v10[7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke;
  v10[3] = &unk_100014670;
  v10[5] = a5;
  v10[6] = "-[NRDUpdateBrainClientImpl run:options:callback:]";
  v10[4] = self;
  v9 = -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v10);
  if (protocol_isEqual(self->_brainProtocol, (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2))
    objc_msgSend(v9, "run:options:callback:", a3, a4, a5);
  else
    objc_msgSend(v9, "run:callback:", a3, a5);
}

id __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getListenerEndpoint:(id)a3
{
  _QWORD v3[7];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke;
  v3[3] = &unk_100014670;
  v3[5] = a3;
  v3[6] = "-[NRDUpdateBrainClientImpl getListenerEndpoint:]";
  v3[4] = self;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v3), "getListenerEndpoint:", a3);
}

id __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6
{
  _QWORD v6[7];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke;
  v6[3] = &unk_100014670;
  v6[5] = a6;
  v6[6] = "-[NRDUpdateBrainClientImpl queryNeRDUpdate:build:options:callback:]";
  v6[4] = self;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v6), "queryNeRDUpdate:build:options:callback:", a3, a4, a5, a6);
}

id __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  NRDRemoteableBlock *v11;
  NRDRemoteableBlock *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[7];
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100014670;
  v15[5] = a6;
  v15[6] = "-[NRDUpdateBrainClientImpl downloadNeRDUpdate:options:progress:completion:]";
  v15[4] = self;
  v10 = -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100014698;
  v14[4] = a5;
  v11 = -[NRDRemoteableBlock initWithProgressBlock:]([NRDRemoteableBlock alloc], "initWithProgressBlock:", v14);
  v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_1000146C0;
    v13[4] = a6;
    objc_msgSend(v10, "downloadNeRDUpdate:options:progress:completion:", a3, a4, v11, v13);
  }
  else
  {
    v16 = NSDebugDescriptionErrorKey;
    v17 = CFSTR("no remote object connection");
    (*((void (**)(id, NSError *))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 105, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
  }
}

id __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (double)(unint64_t)objc_msgSend(a2, "unsignedIntegerValue") / 100.0);
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)installNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  NRDRemoteableBlock *v11;
  NRDRemoteableBlock *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[7];
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100014670;
  v15[5] = a6;
  v15[6] = "-[NRDUpdateBrainClientImpl installNeRDUpdate:options:progress:completion:]";
  v15[4] = self;
  v10 = -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100014698;
  v14[4] = a5;
  v11 = -[NRDRemoteableBlock initWithProgressBlock:]([NRDRemoteableBlock alloc], "initWithProgressBlock:", v14);
  v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_1000146C0;
    v13[4] = a6;
    objc_msgSend(v10, "installNeRDUpdate:options:progress:completion:", a3, a4, v11, v13);
  }
  else
  {
    v16 = NSDebugDescriptionErrorKey;
    v17 = CFSTR("no remote object connection");
    (*((void (**)(id, NSError *))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 105, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
  }
}

id __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (double)(unint64_t)objc_msgSend(a2, "unsignedIntegerValue") / 100.0);
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)purgeNeRDUpdate:(id)a3
{
  _QWORD v3[7];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke;
  v3[3] = &unk_100014670;
  v3[5] = a3;
  v3[6] = "-[NRDUpdateBrainClientImpl purgeNeRDUpdate:]";
  v3[4] = self;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v3), "purgeNeRDUpdate:", a3);
}

id __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)finishNeRDUpdate:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke;
  v4[3] = &unk_100014670;
  v4[5] = a3;
  v4[6] = "-[NRDUpdateBrainClientImpl finishNeRDUpdate:]";
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3;
  v3[3] = &unk_100014750;
  v3[4] = a3;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v4), "finishNeRDUpdate:", v3);
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void **v3;
  uint64_t v4;
  id (*v5)(uint64_t);
  void *v6;
  uint64_t v7;

  v3 = _NSConcreteStackBlock;
  v4 = 3221225472;
  v5 = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4;
  v6 = &unk_100014728;
  v7 = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "execute:", &__block_literal_global_1);
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_5(id a1, int a2)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "sending NRD update brain the all-clear.", v3, 2u);
  }
}

- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke;
  v4[3] = &unk_100014670;
  v4[5] = a4;
  v4[6] = "-[NRDUpdateBrainClientImpl calculateCurrentRequiredSpace:callback:]";
  v4[4] = self;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v4), "calculateCurrentRequiredSpace:callback:", a3, a4);
}

id __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke;
  v4[3] = &unk_100014670;
  v4[5] = a4;
  v4[6] = "-[NRDUpdateBrainClientImpl cancelNeRDUpdate:callback:]";
  v4[4] = self;
  objc_msgSend(-[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v4), "cancelNeRDUpdate:callback:", a3, a4);
}

id __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2;
  v6[3] = &unk_100014648;
  v2 = (void *)a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2, v3, v6);
}

uint64_t __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSString)brainTimeStamp
{
  return self->_brainTimeStamp;
}

- (NSString)brainUUID
{
  return self->_brainUUID;
}

- (NSString)dylibUUID
{
  return self->_dylibUUID;
}

- (void)handleConnectionError:(uint64_t)a3 method:(uint64_t)a4 handler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a2, a3, "connection error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)handleConnectionError:(uint64_t)a1 method:(uint64_t)a2 handler:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - connection error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)ping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Pinging NeRD update brain timed out.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Pinging NeRD update brain failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_139_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a2, a3, "Pinging NeRD update brain failed with error:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)ping:(uint64_t)a3 reply:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Probing NeRD update brain for NRDUpdateBrainInterfacePrivate2 timed out.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
