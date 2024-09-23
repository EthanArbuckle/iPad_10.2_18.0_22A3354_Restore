@implementation TSDgPTPManager

- (BOOL)logInterfaceStatisticsWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v5 = 0;
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 9, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v16 = 1024;
    v17 = 431;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

+ (id)sharedgPTPManager
{
  _QWORD block[5];

  if (qword_100047CB0 != -1)
    dispatch_once(&qword_100047CB0, &stru_10003CE30);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000092D4;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047CA8, block);
  return (id)qword_100047CA0;
}

+ (void)initialize
{
  TSDKextNotifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  if ((id)objc_opt_class(TSDgPTPManager) == a1)
  {
    v2 = objc_alloc_init(TSDKextNotifier);
    v3 = (void *)qword_100047C98;
    qword_100047C98 = (uint64_t)v2;

    v4 = qword_100047C98;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncgPTPManager")));
    LOBYTE(v4) = objc_msgSend((id)v4, "startNotificationsWithMatchingDictionary:", v5);

    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136316418;
      v7 = "startedNotifier";
      v8 = 2048;
      v9 = 0;
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      v16 = 1024;
      v17 = 54;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)qword_100047C98;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EEC4;
  v6[3] = &unk_10003CE10;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsAvailable:", v6);

}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)qword_100047C98;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EF4C;
  v6[3] = &unk_10003CE10;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsUnavailable:", v6);

}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  uint8_t v9[8];
  _QWORD v10[4];
  NSObject *v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F0B8;
  v10[3] = &unk_10003C4B0;
  v5 = dispatch_semaphore_create(0);
  v11 = v5;
  objc_msgSend(a1, "notifyWhengPTPManagerIsAvailable:", v10);
  v6 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to find gPTP manager within the timeout period.\n", v9, 2u);
    }
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedgPTPManager"));
  }

  return v7;
}

+ (id)gPTPManager
{
  TSDgPTPManager *v2;
  unsigned int v3;

  v2 = objc_alloc_init(TSDgPTPManager);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSDgPTPManager);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (TSDgPTPManager)init
{
  TSDgPTPManager *v2;
  void *v3;
  uint64_t v4;
  IOKService *service;
  IODConnection *v6;
  IODConnection *connection;
  TSDgPTPManager *v8;
  TSDgPTPManager *v9;
  uint64_t v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *systemDomainQueue;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v14.receiver = self;
  v14.super_class = (Class)TSDgPTPManager;
  v2 = -[TSDgPTPManager init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncgPTPManager")));
    v4 = objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v3));
    service = v2->_service;
    v2->_service = (IOKService *)v4;

    if (v2->_service)
    {
      v6 = -[IODConnection initWithService:andType:]([IODConnection alloc], "initWithService:andType:", v2->_service, 42);
      connection = v2->_connection;
      v2->_connection = v6;

      if (v2->_connection)
      {
        v8 = (TSDgPTPManager *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](v2->_service, "iodPropertyForKey:", CFSTR("SystemDomainIdentifier")));
        v9 = v8;
        if (v8)
          v10 = (uint64_t)-[TSDgPTPManager unsignedLongLongValue](v8, "unsignedLongLongValue");
        else
          v10 = -1;
        v2->_systemDomainClockIdentifier = v10;
        v11 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.systemDomain", 0);
        systemDomainQueue = v2->_systemDomainQueue;
        v2->_systemDomainQueue = (OS_dispatch_queue *)v11;

        goto LABEL_8;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v16 = "_connection != nil";
        v17 = 2048;
        v18 = 0;
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
        v25 = 1024;
        v26 = 147;
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "_service != nil";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      v25 = 1024;
      v26 = 144;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v9 = v2;
    v2 = 0;
LABEL_8:

  }
  return v2;
}

- (TSDgPTPClock)systemDomain
{
  OS_dispatch_queue *systemDomainQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001F440;
  v10 = sub_10001F450;
  v11 = 0;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F458;
  v5[3] = &unk_10003CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)systemDomainQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSDgPTPClock *)v3;
}

- (BOOL)addDomain:(unint64_t *)a3 error:(id *)a4
{
  return -[TSDgPTPManager addPTPInstance:error:](self, "addPTPInstance:error:", a3, a4);
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
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
  unint64_t v20;

  if (!a3)
    return 0;
  v7 = 1;
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, 0, 0, &v20, &v7, a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 196;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
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
  unint64_t v20;

  if (!a3)
    return 0;
  v7 = 1;
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 6, 0, 0, &v20, &v7, a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 214;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)removeDomainWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return -[TSDgPTPManager removePTPInstanceWithIdentifier:error:](self, "removePTPInstanceWithIdentifier:error:", a3, a4);
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  BOOL v4;
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
  unint64_t v19;

  v6 = 0;
  v19 = a3;
  v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, &v19, 1, 0, &v6, a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v17 = 1024;
    v18 = 237;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addAVBDomainIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  return -[TSDgPTPManager addAVBPTPInstanceIndex:identifier:error:](self, "addAVBPTPInstanceIndex:identifier:error:", a3, a4, a5);
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  BOOL v6;
  int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  unint64_t v21;
  uint64_t v22;

  if (!a4)
    return 0;
  v22 = a3;
  v8 = 1;
  v6 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, &v22, 1, &v21, &v8, a5);
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v10 = "result == YES";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v19 = 1024;
    v20 = 258;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v21;
  return v6;
}

- (BOOL)removeAVBDomainWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  return -[TSDgPTPManager removeAVBPTPInstanceWithIndex:error:](self, "removeAVBPTPInstanceWithIndex:error:", a3, a4);
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  BOOL v4;
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

  v6 = 0;
  v19 = a3;
  v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, &v19, 1, 0, &v6, a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v17 = 1024;
    v18 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB0ClockID")));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB1ClockID")));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB2ClockID")));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB3ClockID")));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AirPlayClockID")));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
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
  unint64_t v20;

  if (!a3)
    return 0;
  v7 = 1;
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, 0, 0, &v20, &v7, a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 361;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v5 = 0;
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 5, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v16 = 1024;
    v17 = 376;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("CopresenceClockID")));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
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
  unint64_t v20;

  if (!a3)
    return 0;
  v7 = 1;
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 7, 0, 0, &v20, &v7, a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 404;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v5 = 0;
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 8, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    v16 = 1024;
    v17 = 419;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](TSDClockManager, "sharedClockManager"));
  objc_msgSend(v3, "removegPTPServicesWithError:", 0);

  v4.receiver = self;
  v4.super_class = (Class)TSDgPTPManager;
  -[TSDgPTPManager dealloc](&v4, "dealloc");
}

+ (id)diagnosticInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncgPTPManager")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v2));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "service != nil";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      v29 = 1024;
      v30 = 446;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_26:
    v4 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncgPTPManager")) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "[service conformsToIOClassName:@kIOTimeSyncgPTPManagerClass]";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      v29 = 1024;
      v30 = 447;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ioClassName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("ClassName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("SystemDomainIdentifier")));
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SystemDomainIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("AVB0ClockID")));

  if (v7)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("AVB0ClockID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("AVB1ClockID")));

  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("AVB1ClockID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("AVB2ClockID")));

  if (v9)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("AVB2ClockID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("AVB3ClockID")));

  if (v10)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("AVB3ClockID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("AirPlayClockID")));

  if (v11)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("AirPlayClockID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("CopresenceClockID")));

  if (v12)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("CopresenceClockID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childIteratorInServicePlaneWithError:", 0));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100020610;
  v17[3] = &unk_10003C768;
  v15 = v13;
  v18 = v15;
  objc_msgSend(v14, "enumerateWithBlock:", v17);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("PTPInstances"));

LABEL_20:
  return v4;
}

- (unint64_t)systemDomainClockIdentifier
{
  return self->_systemDomainClockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDomainQueue, 0);
  objc_storeStrong((id *)&self->_systemDomain, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
