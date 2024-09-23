@implementation TSDDaemonService

- (void)handleNotification:(int)a3 clientID:(unsigned int)a4 result:(int)a5 withArgs:(unint64_t *)a6 ofCount:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *p_processCallbacksLock;
  NSMutableDictionary *processCallbacks;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int v17;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  p_processCallbacksLock = &self->_processCallbacksLock;
  os_unfair_lock_lock(&self->_processCallbacksLock);
  processCallbacks = self->_processCallbacks;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11));
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](processCallbacks, "objectForKey:", v15));

  os_unfair_lock_unlock(p_processCallbacksLock);
  if (v16)
  {
    ((void (**)(_QWORD, uint64_t, uint64_t, unint64_t *, uint64_t))v16)[2](v16, v10, v9, a6, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v17 = -[NSMutableDictionary count](self->_processCallbacks, "count");
    v18[0] = 67109632;
    v18[1] = v11;
    v19 = 1024;
    v20 = v10;
    v21 = 1024;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemonService NOT calling callback processID %u client %d process count %u\n", (uint8_t *)v18, 0x14u);
  }

}

- (BOOL)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(const unint64_t *)a5 scalarInputCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)a10 error:(id *)a11
{
  unsigned __int8 v17;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  _QWORD v23[2];
  _OWORD v24[7];

  if (a6 > 0xE)
    return 0;
  memset(v24, 0, sizeof(v24));
  v23[0] = a3;
  v23[1] = a4;
  if (a6)
    memcpy(v24, a5, 8 * a6);
  v17 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", 1, v23, a6 + 2, a7, a8, a9, a10, 0, 0, a11);
  if ((v17 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v20 = a3;
    v21 = 1024;
    v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemonService callMethodForDaemonClient failed clientID %u, clientMethodSelector %u\n", buf, 0xEu);
  }
  return v17;
}

+ (id)sharedDaemonService
{
  _QWORD block[5];

  if (qword_100047C78 != -1)
    dispatch_once(&qword_100047C78, &stru_10003C7F0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017ED8;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047C70, block);
  return (id)qword_100047C68;
}

+ (id)daemonService
{
  TSDDaemonService *v2;
  unsigned int v3;

  v2 = objc_alloc_init(TSDDaemonService);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSDDaemonService);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (TSDDaemonService)init
{
  TSDDaemonService *v2;
  TSDDaemonService *v3;
  uint64_t v4;
  NSMutableDictionary *processCallbacks;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  IOKConnection *v10;
  IOKConnection *connection;
  dispatch_queue_attr_t v12;
  NSObject *p_super;
  dispatch_queue_t v14;
  OS_dispatch_queue *notificationsQueue;
  IOKNotificationPort *v16;
  IOKNotificationPort *notificationPort;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v19.receiver = self;
  v19.super_class = (Class)TSDDaemonService;
  v2 = -[TSDDaemonService init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    v2->_asyncCallbackRefcon = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    processCallbacks = v3->_processCallbacks;
    v3->_processCallbacks = (NSMutableDictionary *)v4;

    v3->_processCallbacksLock._os_unfair_lock_opaque = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncDaemonService")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "propertyForKey:", CFSTR("IOTimeSyncDaemonClientEntryIDMatching")));
      v3->_supportsRegistryEntryIDDaemonClientMatching = v8 != 0;

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (v3->_supportsRegistryEntryIDDaemonClientMatching)
          v9 = "YES";
        else
          v9 = "NO";
        *(_DWORD *)buf = 136315138;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_supportsRegistryEntryIDDaemonClientMatching %s\n", buf, 0xCu);
      }
      v10 = (IOKConnection *)objc_msgSend(objc_alloc((Class)IOKConnection), "initWithService:andType:", v7, 42);
      connection = v3->_connection;
      v3->_connection = v10;

      if (v3->_connection)
      {
        v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
        p_super = objc_claimAutoreleasedReturnValue(v12);
        v14 = dispatch_queue_create("com.apple.TimeSync.daemon.service", p_super);
        notificationsQueue = v3->_notificationsQueue;
        v3->_notificationsQueue = (OS_dispatch_queue *)v14;

        if (v3->_notificationsQueue)
        {
          v16 = (IOKNotificationPort *)objc_msgSend(objc_alloc((Class)IOKNotificationPort), "initOnDispatchQueue:", v3->_notificationsQueue);
          notificationPort = v3->_notificationPort;
          v3->_notificationPort = v16;

          if (v3->_connection)
          {
            -[TSDDaemonService registerAsyncCallback](v3, "registerAsyncCallback");
LABEL_12:

            return v3;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
          *(_DWORD *)buf = 136316418;
          v21 = "_connection != nil";
          v22 = 2048;
          v23 = 0;
          v24 = 2048;
          v25 = 0;
          v26 = 2080;
          v27 = "";
          v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
          v30 = 1024;
          v31 = 131;
        }
        else
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_25:

            goto LABEL_26;
          }
          *(_DWORD *)buf = 136316418;
          v21 = "_notificationsQueue != nil";
          v22 = 2048;
          v23 = 0;
          v24 = 2048;
          v25 = 0;
          v26 = 2080;
          v27 = "";
          v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
          v30 = 1024;
          v31 = 128;
        }
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        goto LABEL_25;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "_connection != nil";
        v22 = 2048;
        v23 = 0;
        v24 = 2048;
        v25 = 0;
        v26 = 2080;
        v27 = "";
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
        v30 = 1024;
        v31 = 124;
        goto LABEL_18;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "service != nil";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      v30 = 1024;
      v31 = 118;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    p_super = &v3->super;
LABEL_26:
    v3 = 0;
    goto LABEL_12;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDDaemonService finalizeNotifications](self, "finalizeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)TSDDaemonService;
  -[TSDDaemonService dealloc](&v3, "dealloc");
}

- (void)finalizeNotifications
{
  IOKNotificationPort *notificationPort;

  -[TSDDaemonService deregisterAsyncCallback](self, "deregisterAsyncCallback");
  notificationPort = self->_notificationPort;
  self->_notificationPort = 0;

}

- (int)registerProcess:(int)a3 withCallback:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  int v9;
  void *v10;
  id v11;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;
  _QWORD v27[2];

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v27[0] = 0;
  v27[1] = (int)v6;
  v26 = 0;
  v13 = 1;
  if ((-[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, v27, 2, &v26, &v13, a5) & 1) != 0)
  {
    if (v26)
      v9 = 2;
    else
      v9 = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
    os_unfair_lock_lock(&self->_processCallbacksLock);
    v11 = objc_retainBlock(v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processCallbacks, "setObject:forKeyedSubscript:", v11, v10);

    os_unfair_lock_unlock(&self->_processCallbacksLock);
  }
  else
  {
    v9 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "methodResult == YES";
      v16 = 2048;
      v17 = 0;
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      v24 = 1024;
      v25 = 160;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)deregisterProcess:(int)a3 error:(id *)a4
{
  uint64_t v5;
  os_unfair_lock_s *p_processCallbacksLock;
  NSMutableDictionary *processCallbacks;
  void *v9;
  unsigned __int8 v10;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  _QWORD v25[2];

  v5 = *(_QWORD *)&a3;
  p_processCallbacksLock = &self->_processCallbacksLock;
  os_unfair_lock_lock(&self->_processCallbacksLock);
  processCallbacks = self->_processCallbacks;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary removeObjectForKey:](processCallbacks, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(p_processCallbacksLock);
  v12 = 0;
  v25[0] = 1;
  v25[1] = (int)v5;
  v10 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, v25, 2, 0, &v12, a4);
  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v14 = "result == YES";
    v15 = 2048;
    v16 = 0;
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
    v23 = 1024;
    v24 = 190;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v10;
}

- (unsigned)openDaemonClient:(int)a3 withRegistryEntryID:(unint64_t)a4 clientType:(unsigned int)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int result;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  _QWORD v30[2];
  unint64_t v31;
  uint64_t v32;

  v30[0] = 4;
  v30[1] = a3;
  v31 = a4;
  v32 = a5;
  v29 = 0;
  v16 = 1;
  if (!self->_supportsRegistryEntryIDDaemonClientMatching)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService entryIDMatching:](IOKService, "entryIDMatching:", a4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v8));

    if (!v9)
    {
      v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v15)
      {
        *(_DWORD *)buf = 136316418;
        v18 = "service != nil";
        v19 = 2048;
        v20 = 0;
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = "";
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
        v27 = 1024;
        v28 = 208;
        goto LABEL_15;
      }
      return result;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertyForKey:", CFSTR("IOTimeSyncDaemonServiceUniqueID")));
    if (!v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v18 = "uniqueIOServiceIDProp != nil";
        v19 = 2048;
        v20 = 0;
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = "";
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
        v27 = 1024;
        v28 = 211;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      return 0;
    }
    v11 = v10;
    v31 = objc_msgSend(v10, "unsignedIntValue");

  }
  if ((-[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", 0, v30, 4, 0, 0, &v29, &v16, 0, 0, a6) & 1) != 0)
  {
    if (v16 == 1)
      return v29;
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v14)
    {
      *(_DWORD *)buf = 136316418;
      v18 = "scalarOutInt64Count == 1";
      v19 = 2048;
      v20 = 0;
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      v27 = 1024;
      v28 = 218;
      goto LABEL_15;
    }
  }
  else
  {
    v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v13)
    {
      *(_DWORD *)buf = 136316418;
      v18 = "methodResult == YES";
      v19 = 2048;
      v20 = 0;
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      v27 = 1024;
      v28 = 217;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      return 0;
    }
  }
  return result;
}

- (BOOL)closeDaemonClient:(int)a3 daemonClientID:(unsigned int)a4 error:(id *)a5
{
  unsigned __int8 v5;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _QWORD v20[3];

  v20[0] = 5;
  v20[1] = a3;
  v20[2] = a4;
  v7 = 0;
  v5 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, v20, 3, 0, &v7, a5);
  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v9 = "result == YES";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
    v18 = 1024;
    v19 = 234;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v5;
}

- (BOOL)registerAsyncCallback
{
  void *v3;
  IOKNotificationPort *notificationPort;
  unint64_t asyncCallbackRefcon;
  unsigned __int8 v6;
  void *v8;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;
  _BYTE v23[8];
  void (*v24)(uint64_t, uint64_t, unsigned int *, unsigned int);
  unint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  self->_asyncCallbackRefcon = (unint64_t)objc_msgSend(v3, "allocateRefcon:", self);

  asyncCallbackRefcon = self->_asyncCallbackRefcon;
  notificationPort = self->_notificationPort;
  v24 = sub_100008264;
  v25 = asyncCallbackRefcon;
  v22 = 2;
  v9 = 0;
  v6 = -[IOKConnection callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, -[IOKNotificationPort machPort](notificationPort, "machPort"), v23, 8, &v22, 1, 0, &v9, 0);
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "result == YES";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      v20 = 1024;
      v21 = 313;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
    objc_msgSend(v8, "releaseRefcon:", self->_asyncCallbackRefcon);

  }
  return v6;
}

- (BOOL)deregisterAsyncCallback
{
  void *v3;
  unsigned __int8 v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = 3;
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  objc_msgSend(v3, "releaseRefcon:", self->_asyncCallbackRefcon);

  v4 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, &v19, 1, 0, &v6, 0);
  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "result == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
    v17 = 1024;
    v18 = 333;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_processCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
