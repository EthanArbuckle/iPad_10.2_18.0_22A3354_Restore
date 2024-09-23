@implementation TSDClockManager

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer;
  uint64_t v5;
  __int128 v7;
  unint64_t v8[2];

  numer = self->_timebaseInfo.numer;
  if ((_DWORD)numer != self->_timebaseInfo.denom)
  {
    *(_QWORD *)&v7 = sub_100009348(a3, numer);
    *((_QWORD *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return sub_100008EBC(&v7, v8);
  }
  return a3;
}

+ (id)sharedClockManager
{
  _QWORD block[5];

  if (qword_100047CD0 != -1)
    dispatch_once(&qword_100047CD0, &stru_10003CEA8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009280;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047CC8, block);
  return (id)qword_100047CC0;
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

  if ((id)objc_opt_class(TSDClockManager) == a1)
  {
    v2 = objc_alloc_init(TSDKextNotifier);
    v3 = (void *)qword_100047CB8;
    qword_100047CB8 = (uint64_t)v2;

    v4 = qword_100047CB8;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncClockManager")));
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
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v16 = 1024;
      v17 = 60;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)qword_100047CB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000208EC;
  v6[3] = &unk_10003CE88;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsAvailable:", v6);

}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)qword_100047CB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002098C;
  v6[3] = &unk_10003CE88;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsUnavailable:", v6);

}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ATSAC:%016llx"), a3);
}

+ (id)clockManager
{
  TSDClockManager *v2;
  unsigned int v3;

  v2 = objc_alloc_init(TSDClockManager);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSDClockManager);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

+ (id)defaultClockPersonalities
{
  id v2;
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];

  v2 = objc_alloc_init((Class)NSMutableArray);
  v20[0] = CFSTR("IOClassName");
  v20[1] = CFSTR("ProbeScore");
  v21[0] = CFSTR("IOTimeSyncService");
  v21[1] = &off_10003F228;
  v20[2] = CFSTR("ClassName");
  v3 = (objc_class *)objc_opt_class(TSDKernelClock);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
  objc_msgSend(v2, "addObject:", v6);

  v18[0] = CFSTR("IOClassName");
  v18[1] = CFSTR("ProbeScore");
  v19[0] = CFSTR("IOTimeSyncDomain");
  v19[1] = &off_10003F240;
  v18[2] = CFSTR("ClassName");
  v7 = (objc_class *)objc_opt_class(TSDgPTPClock);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  objc_msgSend(v2, "addObject:", v10);

  v16[0] = CFSTR("IOClassName");
  v16[1] = CFSTR("ProbeScore");
  v17[0] = CFSTR("IOTimeSyncUserFilteredService");
  v17[1] = &off_10003F240;
  v16[2] = CFSTR("ClassName");
  v11 = (objc_class *)objc_opt_class(TSDUserFilteredClock);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
  objc_msgSend(v2, "addObject:", v14);

  return v2;
}

- (TSDClockManager)init
{
  return -[TSDClockManager initWithPid:](self, "initWithPid:", 0);
}

- (TSDClockManager)initWithPid:(int)a3
{
  TSDClockManager *v4;
  TSDClockManager *v5;
  void *v6;
  void *v7;
  IODConnection *v8;
  IODConnection *connection;
  TSDKernelClock *v10;
  TSDKernelClock *translationClock;
  NSMutableArray *v12;
  void *clockPersonalities;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v15.receiver = self;
  v15.super_class = (Class)TSDClockManager;
  v4 = -[TSDClockManager init](&v15, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    mach_timebase_info(&v4->_timebaseInfo);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncClockManager")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v6));

    if (v7)
    {
      v8 = -[IODConnection initWithService:andType:]([IODConnection alloc], "initWithService:andType:", v7, 42);
      connection = v5->_connection;
      v5->_connection = v8;

      if (v5->_connection)
      {
        -[TSDClockManager getTimeSyncTimeClockID:error:](v5, "getTimeSyncTimeClockID:error:", &v5->_timeSyncTimeClockIdentifier, 0);
        v5->_translationClockIdentifier = v5->_timeSyncTimeClockIdentifier + 1;
        -[TSDClockManager getTimeSyncTimeIsMachAbsolute:error:](v5, "getTimeSyncTimeIsMachAbsolute:error:", &v5->_timeSyncTimeIsMachAbsoluteTime, 0);
        v10 = -[TSDKernelClock initWithClockIdentifier:]([TSDKernelClock alloc], "initWithClockIdentifier:", v5->_translationClockIdentifier);
        translationClock = v5->_translationClock;
        v5->_translationClock = v10;

        v12 = (NSMutableArray *)objc_msgSend((id)objc_opt_class(v5), "defaultClockPersonalities");
        clockPersonalities = v5->_clockPersonalities;
        v5->_clockPersonalities = v12;
LABEL_5:

        return v5;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = "_connection != nil";
        v18 = 2048;
        v19 = 0;
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = "";
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
        v26 = 1024;
        v27 = 159;
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v17 = "service != nil";
      v18 = 2048;
      v19 = 0;
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v26 = 1024;
      v27 = 156;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    clockPersonalities = v5;
    v5 = 0;
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4
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
  v20 = 0;
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v18 = 1024;
    v19 = 194;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4
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
  uint64_t v20;

  if (!a3)
    return 0;
  v7 = 1;
  v20 = 0;
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 11, 0, 0, &v20, &v7, a4);
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v18 = 1024;
    v19 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20 != 0;
  return v5;
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
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
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, 0, 0, &v20, &v7, a4);
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v18 = 1024;
    v19 = 230;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
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
  v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, &v19, 1, 0, &v6, a4);
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v17 = 1024;
    v18 = 248;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  BOOL v6;
  int v8;
  unint64_t v9;
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

  v9 = a3;
  if (!a3)
    return 0;
  v8 = 1;
  v6 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, &v9, 1, &v22, &v8, a5);
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v20 = 1024;
    v21 = 263;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v22;
  return v6;
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
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
  v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, &v19, 1, 0, &v6, a4);
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v17 = 1024;
    v18 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addgPTPServicesWithError:(id *)a3
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 293;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removegPTPServicesWithError:(id *)a3
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
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 6, 0, 0, 0, &v5, a3);
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 305;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 317;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
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
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 10, 0, 0, 0, &v5, a3);
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 329;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (id)availableClockIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = 0;
  if (-[TSDClockManager getTimeSyncTimeClockID:error:](self, "getTimeSyncTimeClockID:error:", &v6, 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDKernelClock availableKernelClockIdentifiers](TSDKernelClock, "availableKernelClockIdentifiers"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
  return v3;
}

- (id)classNameForClockService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  signed int v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  signed int v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v4 = a3;
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_clockPersonalities;
    v5 = 0;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      v8 = -1;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IOClassName")));
          v12 = objc_msgSend(v4, "conformsToIOClassName:", v11);

          if (v12)
          {
            if (v5)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProbeScore")));
              v14 = objc_msgSend(v13, "intValue");

              if (v14 > v8)
              {
                v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ClassName")));

                v5 = (void *)v15;
                v8 = v14;
              }
            }
            else
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProbeScore")));
              v8 = objc_msgSend(v16, "intValue");

              v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ClassName")));
            }
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "service != nil";
      v26 = 2048;
      v27 = 0;
      v28 = 2048;
      v29 = 0;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v34 = 1024;
      v35 = 358;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v5 = 0;
  }

  return v5;
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  __int128 v5;
  int v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  const char *v12;
  uint32_t v13;
  id v14;
  __int128 v15;
  uint8_t buf[4];
  unint64_t v17;

  if (-[TSDClockManager timeSyncTimeClockIdentifier](self, "timeSyncTimeClockIdentifier") == a3)
    return 0;
  if (-[TSDClockManager translationClockIdentifier](self, "translationClockIdentifier") == a3)
    return (id)objc_claimAutoreleasedReturnValue(-[TSDClockManager translationClock](self, "translationClock"));
  v7 = 1;
  *(_QWORD *)&v5 = 67109120;
  v15 = v5;
  while (1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3, v15));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v8));

    if (v9)
      break;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v15;
      LODWORD(v17) = v7;
      v12 = "TSDClockManager clockWithClockIdentifier unable to find service retry = %d\n";
      v13 = 8;
      goto LABEL_11;
    }
LABEL_12:
    usleep(0x2710u);

    if (++v7 == 11)
      return 0;
  }
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[TSDClockManager classNameForClockService:](self, "classNameForClockService:", v9));
  v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      v12 = "Could not find class match for clock identifier: 0x%016llx\n";
      v13 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v14 = objc_msgSend(objc_alloc(NSClassFromString(v10)), "initWithClockIdentifier:pid:", a3, self->_pid);

  return v14;
}

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  unsigned int v7;
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
  unint64_t v22;
  _QWORD v23[4];

  v9 = 1;
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  v7 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 7, v23, 4, &v22, &v9, a7);
  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "callResult == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v20 = 1024;
    v21 = 450;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7)
    return v22;
  else
    return -1;
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
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
  v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 8, &v19, 1, 0, &v6, a4);
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    v17 = 1024;
    v18 = 469;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom;
  uint64_t v5;
  __int128 v7;
  unint64_t v8[2];

  denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != (_DWORD)denom)
  {
    *(_QWORD *)&v7 = sub_100009348(a3, denom);
    *((_QWORD *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return sub_100008EBC(&v7, v8);
  }
  return a3;
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
  int v10;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncClockManager")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v2));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = "service != nil";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v20 = 1024;
      v21 = 521;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
    }
LABEL_10:
    v4 = 0;
    goto LABEL_4;
  }
  if ((objc_msgSend(v3, "conformsToIOClassName:", CFSTR("IOTimeSyncClockManager")) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = "[service conformsToIOClassName:@kIOTimeSyncClockManagerClass]";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v20 = 1024;
      v21 = 522;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ioClassName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("ClassName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("TimeSyncTimeClockID")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("TimeSyncTimeClockID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("TranslationClockID")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("TranslationClockID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("TimeSyncTimeCoreAudioClockDomain")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("TimeSyncTimeCoreAudioClockDomain"));

LABEL_4:
  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  id v10;
  void *v11;
  id v12;
  int v14;
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

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedClockManager"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "classNameForClockService:", v7));

    if (v9)
    {
      v10 = -[objc_class diagnosticInfoForService:](NSClassFromString(v9), "diagnosticInfoForService:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
    v11 = 0;
    if (a4)
    {
LABEL_6:
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316418;
      v15 = "service != nil";
      v16 = 2048;
      v17 = 0;
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v24 = 1024;
      v25 = 542;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    }
    v9 = 0;
    v11 = 0;
  }
LABEL_7:
  v12 = v11;

  return v12;
}

+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedClockManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "classNameForClockService:", v5));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = "service != nil";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      v19 = 1024;
      v20 = 565;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return self->_timeSyncTimeClockIdentifier;
}

- (unint64_t)translationClockIdentifier
{
  return self->_translationClockIdentifier;
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return self->_timeSyncTimeIsMachAbsoluteTime;
}

- (TSDKernelClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_clockPersonalities, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
