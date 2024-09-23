@implementation TSDKernelClock

- (IOKService)service
{
  os_unfair_lock_s *p_serviceLock;
  IOKService *v4;

  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  v4 = self->_service;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  void *v11;
  unsigned __int8 v12;
  int v14;
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
  int64x2_t v27;
  unint64_t v28;
  unint64_t v29;

  v27 = vdupq_n_s64(1uLL);
  v28 = -1;
  v29 = -1;
  v14 = 4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", a3, a4, a5, a6, a7));
  v12 = objc_msgSend(v11, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 8, 0, 0, &v27, &v14, 0);

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v25 = 1024;
    v26 = 370;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a3)
    *a3 = v27.i64[0];
  if (a4)
    *a4 = v27.u64[1];
  if (a5)
    *a5 = v28;
  if (a6)
    *a6 = v29;
  return v12;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  void *v11;
  unsigned __int8 v12;
  int v14;
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
  int64x2_t v27;
  unint64_t v28;
  unint64_t v29;

  v27 = vdupq_n_s64(1uLL);
  v28 = -1;
  v29 = -1;
  v14 = 4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", a3, a4, a5, a6, a7));
  v12 = objc_msgSend(v11, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 15, 0, 0, &v27, &v14, 0);

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v25 = 1024;
    v26 = 558;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a3)
    *a3 = v27.i64[0];
  if (a4)
    *a4 = v27.u64[1];
  if (a5)
    *a5 = v28;
  if (a6)
    *a6 = v29;
  return v12;
}

- (IODConnection)connection
{
  os_unfair_lock_s *p_serviceLock;
  IODConnection *v4;

  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (void)_handleNotification:(unsigned int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (a3 == 2007 && a5 == 7)
  {
    v18 = *(unsigned __int16 *)a4;
    v5 = a4[3];
    v16 = a4[2];
    v17 = a4[1];
    v6 = a4[4];
    v7 = a4[5];
    v8 = *((_DWORD *)a4 + 12);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock clients](self, "clients"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v14, "didGetStatsOfLocalPortNumber:mean:median:stddev:min:max:numberOfSamples:forClock:") & 1) != 0)
          {
            LODWORD(v15) = v8;
            objc_msgSend(v14, "didGetStatsOfLocalPortNumber:mean:median:stddev:min:max:numberOfSamples:forClock:", v18, v17, v16, v5, v6, v7, v15, self);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

  }
  else if (a5 == 2)
  {
    -[TSDKernelClock _handleNotification:withArg1:andArg2:](self, "_handleNotification:withArg1:andArg2:");
  }
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  void *i;
  void *v13;
  unsigned __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v15 = a5;
  if (a3 == 2001)
  {
    -[TSDKernelClock _refreshLockStateOnNotificationQueue](self, "_refreshLockStateOnNotificationQueue");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock clients](self, "clients"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      v11 = a3 - 2000;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          switch(v11)
          {
            case 0u:
              if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "didResetClock:") & 1) != 0)
                objc_msgSend(v13, "didResetClock:", self);
              break;
            case 2u:
              if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "didChangeClockMasterForClock:") & 1) != 0)objc_msgSend(v13, "didChangeClockMasterForClock:", self);
              break;
            case 3u:
              if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "didBeginClockGrandmasterChangeForClock:") & 1) != 0)objc_msgSend(v13, "didBeginClockGrandmasterChangeForClock:", self);
              if ((objc_opt_respondsToSelector(v13, "didBeginClockGrandmasterChangeWithGrandmasterID:localPort:forClock:") & 1) != 0)objc_msgSend(v13, "didBeginClockGrandmasterChangeWithGrandmasterID:localPort:forClock:", a4, v15, self);
              break;
            case 4u:
              if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "didEndClockGrandmasterChangeForClock:") & 1) != 0)objc_msgSend(v13, "didEndClockGrandmasterChangeForClock:", self);
              if ((objc_opt_respondsToSelector(v13, "didEndClockGrandmasterChangeWithGrandmasterID:localPort:forClock:") & 1) != 0)objc_msgSend(v13, "didEndClockGrandmasterChangeWithGrandmasterID:localPort:forClock:", a4, v15, self);
              break;
            case 5u:
              if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "didProcessSync:") & 1) != 0)
                objc_msgSend(v13, "didProcessSync:", self);
              break;
            case 6u:
              if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "didChangeLocalPortWithGrandmasterID:localPort:forClock:") & 1) != 0)objc_msgSend(v13, "didChangeLocalPortWithGrandmasterID:localPort:forClock:", a4, v15, self);
              break;
            default:
              continue;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
}

- (id)clients
{
  os_unfair_lock_s *p_clientsLock;
  void *v4;

  p_clientsLock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPointerArray allObjects](self->_clients, "allObjects"));
  os_unfair_lock_unlock(p_clientsLock);
  return v4;
}

- (int)lockState
{
  return self->_lockState;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

+ (id)availableKernelClockIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncService")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingServices:error:](IOKService, "matchingServices:error:", v3, 0));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019D34;
  v7[3] = &unk_10003C768;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "enumerateWithBlock:", v7);

  return v5;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("IOProviderClass");
  v9[1] = CFSTR("IOPropertyMatch");
  v10[0] = CFSTR("IOTimeSyncService");
  v7 = CFSTR("ClockIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  return v5;
}

- (TSDKernelClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4;
  TSDKernelClock *v6;
  TSDKernelClock *v7;
  uint64_t v8;
  NSPointerArray *clients;
  objc_class *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *notificationsQueue;
  OS_dispatch_queue *v19;
  id v20;
  void *v21;
  uint64_t v22;
  IOKService *service;
  IODConnection *v24;
  IODConnection *connection;
  id v26;
  void *v27;
  IOKNotificationPort *v28;
  IOKNotificationPort *notificationPort;
  IOKService *v30;
  IOKNotificationPort *v31;
  uint64_t v32;
  IOKInterestNotification *interestNotification;
  _QWORD v35[4];
  id v36;
  objc_super v37;
  _BYTE location[12];
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;

  v4 = *(_QWORD *)&a4;
  v37.receiver = self;
  v37.super_class = (Class)TSDKernelClock;
  v6 = -[TSDKernelClock init](&v37, "init");
  v7 = v6;
  if (v6)
  {
    v6->_clockIdentifier = a3;
    v8 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    clients = v7->_clients;
    v7->_clients = (NSPointerArray *)v8;

    v7->_clientsLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class(v7);
    v11 = NSStringFromClass(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    if ((int)v4 <= 0)
      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.TimeSync.%@.0x%016llx.notification"), v12, a3));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.TimeSync.%@.0x%016llx.notification.%d"), v12, a3, v4));
    v15 = (void *)v14;

    v16 = objc_retainAutorelease(v15);
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v17;

    v19 = v7->_notificationsQueue;
    if (v19)
    {
      objc_storeStrong((id *)&v7->_propertyUpdateQueue, v19);
      v7->_asyncCallbackRefcon = 0;
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      v20 = objc_msgSend((id)objc_opt_class(v7), "iokitMatchingDictionaryForClockIdentifier:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v21));
      service = v7->_service;
      v7->_service = (IOKService *)v22;

      if (v7->_service)
      {
        v24 = -[IODConnection initWithService:andType:]([IODConnection alloc], "initWithService:andType:", v7->_service, 42);
        connection = v7->_connection;
        v7->_connection = v24;

        if (v7->_connection)
        {
          v7->_lockState = -[TSDKernelClock _lockState](v7, "_lockState");
          if (v7->_notificationsQueue)
          {
            v26 = objc_alloc((Class)IOKNotificationPort);
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](v7, "notificationQueue"));
            v28 = (IOKNotificationPort *)objc_msgSend(v26, "initOnDispatchQueue:", v27);
            notificationPort = v7->_notificationPort;
            v7->_notificationPort = v28;

            if (v7->_notificationPort)
            {
              -[TSDKernelClock registerAsyncCallback](v7, "registerAsyncCallback");
              objc_initWeak((id *)location, v7);
              v30 = v7->_service;
              v31 = v7->_notificationPort;
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_10001A4B4;
              v35[3] = &unk_10003C658;
              objc_copyWeak(&v36, (id *)location);
              v32 = objc_claimAutoreleasedReturnValue(-[IOKService addInterestNotifcationOfType:usingNotificationPort:error:withHandler:](v30, "addInterestNotifcationOfType:usingNotificationPort:error:withHandler:", IOKGeneralInterest, v31, 0, v35));
              interestNotification = v7->_interestNotification;
              v7->_interestNotification = (IOKInterestNotification *)v32;

              objc_destroyWeak(&v36);
              objc_destroyWeak((id *)location);
LABEL_11:

              return v7;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316418;
              *(_QWORD *)&location[4] = "_notificationPort != nil";
              v39 = 2048;
              v40 = 0;
              v41 = 2048;
              v42 = 0;
              v43 = 2080;
              v44 = "";
              v45 = 2080;
              v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
              v47 = 1024;
              v48 = 140;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316418;
            *(_QWORD *)&location[4] = "_notificationsQueue != nil";
            v39 = 2048;
            v40 = 0;
            v41 = 2048;
            v42 = 0;
            v43 = 2080;
            v44 = "";
            v45 = 2080;
            v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
            v47 = 1024;
            v48 = 137;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136316418;
          *(_QWORD *)&location[4] = "_connection != nil";
          v39 = 2048;
          v40 = 0;
          v41 = 2048;
          v42 = 0;
          v43 = 2080;
          v44 = "";
          v45 = 2080;
          v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
          v47 = 1024;
          v48 = 133;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136316418;
        *(_QWORD *)&location[4] = "_service != nil";
        v39 = 2048;
        v40 = 0;
        v41 = 2048;
        v42 = 0;
        v43 = 2080;
        v44 = "";
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v47 = 1024;
        v48 = 130;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(_QWORD *)&location[4] = "_notificationsQueue != nil";
      v39 = 2048;
      v40 = 0;
      v41 = 2048;
      v42 = 0;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
      v47 = 1024;
      v48 = 122;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
    }

    v7 = 0;
    goto LABEL_11;
  }
  return v7;
}

- (TSDKernelClock)initWithClockIdentifier:(unint64_t)a3
{
  return -[TSDKernelClock initWithClockIdentifier:pid:](self, "initWithClockIdentifier:pid:", a3, 0);
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  _QWORD v19[2];
  _QWORD v20[2];

  v19[0] = -1;
  v19[1] = 0;
  v6 = 2;
  v20[0] = a3;
  v20[1] = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, v20, 2, v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 178;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19[0];
  else
    return -1;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  _QWORD v19[2];
  _QWORD v20[2];

  v19[0] = -1;
  v19[1] = 0;
  v6 = 2;
  v20[0] = a3;
  v20[1] = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, v20, 2, v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 200;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19[0];
  else
    return -1;
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  __int128 v5;
  uint64_t v6;
  BOOL v10;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v19;
  unsigned int v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v6 = *(_QWORD *)&a5;
  if (a5 < 0xC)
  {
    v15 = 0;
    v10 = 1;
    if (!a5)
      return v10;
    goto LABEL_11;
  }
  v20 = 12 * ((a5 - 12) / 0xC);
  v10 = 1;
  *(_QWORD *)&v5 = 136316418;
  v19 = v5;
  v11 = a4;
  v12 = a3;
  do
  {
    v21 = 12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    v14 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, v12, 12, v11, &v21, 0);

    if ((v14 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 222;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v10 = 0;
      }
    }
    v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    v21 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v17 = objc_msgSend(v16, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, &a3[v15], v6, &a4[v15], &v21, 0);

    if ((v17 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 236;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  __int128 v5;
  uint64_t v6;
  BOOL v10;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v19;
  unsigned int v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v6 = *(_QWORD *)&a5;
  if (a5 < 0xC)
  {
    v15 = 0;
    v10 = 1;
    if (!a5)
      return v10;
    goto LABEL_11;
  }
  v20 = 12 * ((a5 - 12) / 0xC);
  v10 = 1;
  *(_QWORD *)&v5 = 136316418;
  v19 = v5;
  v11 = a4;
  v12 = a3;
  do
  {
    v21 = 12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    v14 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 5, v12, 12, v11, &v21, 0);

    if ((v14 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 257;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v10 = 0;
      }
    }
    v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    v21 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v17 = objc_msgSend(v16, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 5, &a3[v15], v6, &a4[v15], &v21, 0);

    if ((v17 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 271;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  unint64_t v20;

  v19 = -1;
  v20 = a3;
  v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 9, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 292;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  unint64_t v20;

  v19 = -1;
  v20 = a3;
  v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 10, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 312;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (int)_lockState
{
  void *v2;
  unsigned __int8 v3;
  int result;
  _BOOL4 v5;
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
  int v19;

  v6 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v3 = objc_msgSend(v2, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, 0, 0, &v19, &v6, 0);

  if ((v3 & 1) != 0)
    return v19;
  v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 329;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return 0;
  }
  return result;
}

- (double)hostRateRatio
{
  void *v2;
  unsigned __int8 v3;
  double v4;
  int v6;
  _BYTE info[12];
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
  _QWORD v18[2];

  v6 = 2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v3 = objc_msgSend(v2, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, 0, 0, v18, &v6, 0);

  if ((v3 & 1) != 0)
  {
    *(_QWORD *)info = 0;
    mach_timebase_info((mach_timebase_info_t)info);
    return (double)(v18[0] / (unint64_t)*(unsigned int *)info)
         / (double)(v18[1] / (unint64_t)*(unsigned int *)&info[4]);
  }
  else
  {
    v4 = 1.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)info = 136316418;
      *(_QWORD *)&info[4] = "callResult == YES";
      v8 = 2048;
      v9 = 0;
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
      v16 = 1024;
      v17 = 346;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", info, 0x3Au);
    }
  }
  return v4;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  unint64_t v20;

  v19 = -1;
  v20 = a3;
  v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 11, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 409;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  unint64_t v20;

  v19 = -1;
  v20 = a3;
  v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 12, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 430;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  __int128 v5;
  uint64_t v6;
  BOOL v10;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v19;
  unsigned int v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v6 = *(_QWORD *)&a5;
  if (a5 < 0xC)
  {
    v15 = 0;
    v10 = 1;
    if (!a5)
      return v10;
    goto LABEL_11;
  }
  v20 = 12 * ((a5 - 12) / 0xC);
  v10 = 1;
  *(_QWORD *)&v5 = 136316418;
  v19 = v5;
  v11 = a4;
  v12 = a3;
  do
  {
    v21 = 12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    v14 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 13, v12, 12, v11, &v21, 0);

    if ((v14 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 451;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v10 = 0;
      }
    }
    v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    v21 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v17 = objc_msgSend(v16, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 13, &a3[v15], v6, &a4[v15], &v21, 0);

    if ((v17 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 465;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  __int128 v5;
  uint64_t v6;
  BOOL v10;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v19;
  unsigned int v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v6 = *(_QWORD *)&a5;
  if (a5 < 0xC)
  {
    v15 = 0;
    v10 = 1;
    if (!a5)
      return v10;
    goto LABEL_11;
  }
  v20 = 12 * ((a5 - 12) / 0xC);
  v10 = 1;
  *(_QWORD *)&v5 = 136316418;
  v19 = v5;
  v11 = a4;
  v12 = a3;
  do
  {
    v21 = 12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    v14 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 14, v12, 12, v11, &v21, 0);

    if ((v14 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 486;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v10 = 0;
      }
    }
    v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    v21 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v17 = objc_msgSend(v16, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 14, &a3[v15], v6, &a4[v15], &v21, 0);

    if ((v17 & 1) == 0)
    {
      v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        v24 = 2048;
        v25 = 0;
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        v32 = 1024;
        v33 = 500;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  unint64_t v20;

  v19 = -1;
  v20 = a3;
  v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 16, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 521;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  void *v3;
  unsigned int v4;
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
  unint64_t v20;

  v19 = -1;
  v20 = a3;
  v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 17, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 541;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (void)updateCoreAudioReanchors:(unsigned int)a3
{
  void *v5;
  unsigned __int8 v6;
  int v7;
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

  v19 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 67109120;
    LODWORD(v8) = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Updating Core Audio Reanchors += %u\n", (uint8_t *)&v7, 8u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v6 = objc_msgSend(v5, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 53, &v19, 1, 0, 0, 0);

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v17 = 1024;
    v18 = 591;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
  }
}

- (unsigned)getCoreAudioReanchors
{
  void *v2;
  unsigned __int8 v3;
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
  unsigned int v18;

  v5 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v3 = objc_msgSend(v2, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 54, 0, 0, &v18, &v5, 0);

  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "callResult == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    v16 = 1024;
    v17 = 600;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v18;
}

- (void)_refreshLockStateOnNotificationQueue
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[5];
  int v20;
  _BYTE v21[128];

  v3 = -[TSDKernelClock _lockState](self, "_lockState");
  v4 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue")),
        v7,
        v6,
        v5,
        v6 == v7))
  {
    if ((_DWORD)v3 != -[TSDKernelClock lockState](self, "lockState"))
      -[TSDKernelClock setLockState:](self, "setLockState:", v3);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C198;
    block[3] = &unk_10003CD00;
    v20 = v3;
    block[4] = self;
    dispatch_sync(v8, block);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock clients](self, "clients", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, "didChangeLockStateTo:forClock:") & 1) != 0)
          objc_msgSend(v14, "didChangeLockStateTo:forClock:", v3, self);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v11);
  }

}

- (void)_handleRefreshConnection
{
  -[TSDKernelClock _refreshLockStateOnNotificationQueue](self, "_refreshLockStateOnNotificationQueue");
}

- (BOOL)registerAsyncCallback
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  int v8;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  self->_asyncCallbackRefcon = (unint64_t)objc_msgSend(v3, "allocateRefcon:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v5 = objc_msgSend(v4, "registerAsyncNotificationsWithSelector:callBack:refcon:callbackQueue:", 6, sub_100008314, self->_asyncCallbackRefcon, self->_notificationsQueue);

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316418;
      v9 = "result == YES";
      v10 = 2048;
      v11 = 0;
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
      v18 = 1024;
      v19 = 797;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
    objc_msgSend(v7, "releaseRefcon:", self->_asyncCallbackRefcon);

  }
  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  objc_msgSend(v3, "releaseRefcon:", self->_asyncCallbackRefcon);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  LOBYTE(v3) = objc_msgSend(v4, "deregisterAsyncNotificationsWithSelector:", 7);

  return (char)v3;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  IODConnection *connection;
  IOKService *service;
  unsigned int v7;
  NSObject *v8;
  _QWORD v9[5];
  unsigned int v10;

  if (a3 == -536870608)
  {
    v7 = -[TSDKernelClock _lockState](self, "_lockState", *(_QWORD *)&a3, a4);
    v8 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    if (!v8)
      v8 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001C4B8;
    v9[3] = &unk_10003CD00;
    v10 = v7;
    v9[4] = self;
    dispatch_async(v8, v9);

  }
  else if (a3 == -536870896)
  {
    os_unfair_lock_lock(&self->_serviceLock);
    connection = self->_connection;
    self->_connection = 0;

    service = self->_service;
    self->_service = 0;

    os_unfair_lock_unlock(&self->_serviceLock);
  }
}

- (void)addClient:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSPointerArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    v6 = objc_msgSend(v5, "UTF8String");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDKernelClock description](self, "description")));
    *(_DWORD *)buf = 136315394;
    v19 = v6;
    v20 = 2080;
    v21 = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Adding Client %s to clock %s\n", buf, 0x16u);

  }
  -[NSPointerArray compact](self->_clients, "compact");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_clients;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12) == v4)
        {

          goto LABEL_13;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v10)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (_QWORD)v13);
LABEL_13:
  os_unfair_lock_unlock(&self->_clientsLock);

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSPointerArray *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    v6 = objc_msgSend(v5, "UTF8String");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDKernelClock description](self, "description")));
    *(_DWORD *)buf = 136315394;
    v21 = v6;
    v22 = 2080;
    v23 = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing Client %s from clock %s\n", buf, 0x16u);

  }
  -[NSPointerArray compact](self->_clients, "compact");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_clients;
  v9 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      v13 = 0;
      v14 = &v10[(_QWORD)v11];
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", &v13[(_QWORD)v11], (_QWORD)v15);
          goto LABEL_13;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }

LABEL_13:
  os_unfair_lock_unlock(&self->_clientsLock);

}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationsQueue;
}

- (NSString)clockName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ioClassName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ 0x%016llx"), v5, -[TSDKernelClock clockIdentifier](self, "clockIdentifier")));

  }
  else
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ 0x%016llx"), v4, -[TSDKernelClock clockIdentifier](self, "clockIdentifier")));
  }

  return (NSString *)v6;
}

- (void)finalizeNotifications
{
  IOKInterestNotification *interestNotification;
  IOKNotificationPort *notificationPort;

  -[TSDKernelClock deregisterAsyncCallback](self, "deregisterAsyncCallback");
  interestNotification = self->_interestNotification;
  self->_interestNotification = 0;

  notificationPort = self->_notificationPort;
  self->_notificationPort = 0;

}

+ (id)serviceForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v3));

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ioClassName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("ClassName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodProperties"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("IOUserClientClass"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("IOGeneralInterest"));
  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ClockIdentifier"));

  v7 = objc_msgSend((id)objc_opt_class(a1), "clockNameForClockIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("ClockName"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceForClockIdentifier:", a3));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "diagnosticInfoForService:", v9));
    objc_msgSend(v5, "addEntriesFromDictionary:", v10);

  }
  return v5;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceForClockIdentifier:"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ioClassName"));
  }
  else
  {
    v8 = (objc_class *)objc_opt_class(a1);
    v9 = NSStringFromClass(v8);
    v7 = objc_claimAutoreleasedReturnValue(v9);
  }
  v10 = (void *)v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ 0x%016llx"), v7, a3));

  return v11;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (void)setLockState:(int)a3
{
  self->_lockState = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_interestNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
