@implementation IODConnection

+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  _QWORD v17[4];
  id v18;
  uint8_t *v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  _OWORD v27[8];

  v9 = *(_QWORD *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
  v10 = (void *)qword_100047C18;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));

  if (v12)
  {
    v13 = *(_QWORD *)(v12 + 40);
    v14 = *(_QWORD *)(v12 + 48);
    v15 = *(id *)(v12 + 24);
    v16 = v14 != 0;
  }
  else
  {
    v15 = 0;
    v13 = 0;
    v16 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
  if (a6 <= 0x10 && v15 && v13 && v16)
  {
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0xA010000000;
    v26 = &unk_10003A49B;
    memset(v27, 0, sizeof(v27));
    __memmove_chk(v27, a5, 8 * a6, 128);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000907C;
    v17[3] = &unk_10003C578;
    v20 = v13;
    v18 = (id)v12;
    v19 = buf;
    v21 = a4;
    v22 = a6;
    dispatch_async(v15, v17);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnection NO CONNECTION callback clientID %u\n", buf, 8u);
  }

}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  uint64_t v8;
  uint64_t v10;
  IOKConnection *iokConnection;
  uint64_t clientID;

  v8 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
    return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](iokConnection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", *(_QWORD *)&a3, a4, v8, a6, a7, a8);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    return objc_msgSend((id)qword_100047C00, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v10, a4, v8, 0, 0, a6, a7, a8);
  else
    return 0;
}

- (IODConnection)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[IODConnection init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Do not call %@"), v3);

  return 0;
}

- (IODConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  IODConnection *v7;
  IODConnection *v8;
  IOKNotificationPort *asyncCallbackPort;
  OS_dispatch_queue *asyncCallbackQueue;
  id v11;
  unsigned int v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IODConnection;
  v7 = -[IODConnection init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_clientID = 0;
    asyncCallbackPort = v7->_asyncCallbackPort;
    v7->_asyncCallbackPort = 0;

    asyncCallbackQueue = v8->_asyncCallbackQueue;
    v8->_asyncCallbackQueue = 0;

    v8->_asyncCallback = 0;
    v8->_refcon = 0;
    if (qword_100047C08 != -1)
      dispatch_once(&qword_100047C08, &stru_10003C510);
    v11 = objc_msgSend(v6, "entryID");
    v12 = objc_msgSend((id)qword_100047C00, "openDaemonClient:withRegistryEntryID:clientType:error:", dword_100047C10, v11, v4, 0);
    v8->_clientID = v12;
    if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnectionDaemon failed to open service with registryEntryID %llu\n", buf, 0xCu);
    }
  }

  return v8;
}

- (IODConnection)initWithService:(id)a3
{
  return -[IODConnection initWithService:andType:](self, "initWithService:andType:", a3, 0);
}

- (void)dealloc
{
  IOKConnection *iokConnection;
  uint64_t clientID;
  objc_super v5;

  iokConnection = self->_iokConnection;
  self->_iokConnection = 0;

  clientID = self->_clientID;
  if ((_DWORD)clientID)
    objc_msgSend((id)qword_100047C00, "closeDaemonClient:daemonClientID:error:", dword_100047C10, clientID, 0);
  v5.receiver = self;
  v5.super_class = (Class)IODConnection;
  -[IODConnection dealloc](&v5, "dealloc");
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v12;
  uint64_t v14;
  IOKConnection *iokConnection;
  uint64_t clientID;

  v12 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
    return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](iokConnection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", *(_QWORD *)&a3, a4, v12, a6, a7, a8, a9, 0, 0, a10);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    return objc_msgSend((id)qword_100047C00, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v14, a4, v12, a6, a7, a8, a9, a10);
  else
    return 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7;
  IOKConnection *iokConnection;
  uint64_t clientID;

  v7 = *(_QWORD *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
    return -[IOKConnection callMethodWithSelector:structInput:structInputSize:structOutput:structOutputSize:error:](iokConnection, "callMethodWithSelector:structInput:structInputSize:structOutput:structOutputSize:error:", *(_QWORD *)&a3, a4, a5, 0, 0, a6);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    return objc_msgSend((id)qword_100047C00, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v7, 0, 0, a4, a5, 0, 0, a6);
  else
    return 0;
}

- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6
{
  uint64_t v9;
  id v11;
  IOKNotificationPort *v12;
  IOKNotificationPort *asyncCallbackPort;
  IOKNotificationPort *v14;
  unsigned __int8 v15;
  uint64_t clientID;
  void *v17;
  void *v18;
  unsigned int v19;
  uint8_t buf[4];
  unsigned int v22;
  void *v23;
  const char *v24;

  v9 = *(_QWORD *)&a3;
  v11 = a6;
  objc_storeStrong((id *)&self->_asyncCallbackQueue, a6);
  if (!self->_asyncCallbackQueue)
    goto LABEL_10;
  if (!self->_iokConnection)
  {
    clientID = self->_clientID;
    if ((_DWORD)clientID)
    {
      if (objc_msgSend((id)qword_100047C00, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v9, 0, 0, 0, 0, 0, 0, 0))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
        self->_asyncCallback = a4;
        self->_refcon = a5;
        v17 = (void *)qword_100047C18;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_clientID));
        objc_msgSend(v17, "setObject:forKey:", self, v18);

        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
        v15 = 1;
        goto LABEL_11;
      }
      v15 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v19 = self->_clientID;
      *(_DWORD *)buf = 67109634;
      v22 = v19;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v9;
      HIWORD(v23) = 2080;
      v24 = "fail";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnection::registerAsyncNotificationsWithSelector clientID %u selector %u result %s\n", buf, 0x18u);
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v12 = (IOKNotificationPort *)objc_msgSend(objc_alloc((Class)IOKNotificationPort), "initOnDispatchQueue:", v11);
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = v12;

  v14 = self->_asyncCallbackPort;
  if (!v14)
    goto LABEL_10;
  v23 = a4;
  v24 = (const char *)a5;
  v15 = -[IOKConnection callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_iokConnection, "callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", v9, -[IOKNotificationPort machPort](v14, "machPort"), buf, 8, 0, 0, 0, 0, 0);
LABEL_11:

  return v15;
}

- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3
{
  uint64_t v3;
  IOKConnection *iokConnection;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  BOOL v9;
  IOKNotificationPort *asyncCallbackPort;
  OS_dispatch_queue *asyncCallbackQueue;

  v3 = *(_QWORD *)&a3;
  iokConnection = self->_iokConnection;
  if (iokConnection)
  {
    v6 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](iokConnection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", *(_QWORD *)&a3, 0, 0, 0, 0, 0);
  }
  else
  {
    if (!self->_clientID)
    {
      v9 = 0;
      goto LABEL_6;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&dword_100047CE8);
    v7 = (void *)qword_100047C18;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_clientID));
    objc_msgSend(v7, "removeObjectForKey:", v8);

    self->_asyncCallback = 0;
    self->_refcon = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_100047CE8);
    v6 = objc_msgSend((id)qword_100047C00, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", self->_clientID, v3, 0, 0, 0, 0, 0, 0, 0);
  }
  v9 = v6;
LABEL_6:
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = 0;

  asyncCallbackQueue = self->_asyncCallbackQueue;
  self->_asyncCallbackQueue = 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncCallbackPort, 0);
  objc_storeStrong((id *)&self->_asyncCallbackQueue, 0);
  objc_storeStrong((id *)&self->_iokConnection, 0);
}

@end
