@implementation TSDClockSync

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

- (TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4;
  TSDClockSync *v6;
  TSDClockSync *v7;
  uint64_t v8;
  NSPointerArray *updateClients;
  objc_class *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *notificationsQueue;
  id v19;
  void *v20;
  uint64_t v21;
  IOKService *service;
  IODConnection *v23;
  IODConnection *connection;
  uint64_t v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v4 = *(_QWORD *)&a4;
  v27.receiver = self;
  v27.super_class = (Class)TSDClockSync;
  v6 = -[TSDClockSync init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    v6->_referenceCount = 1;
    v6->_clockIdentifier = a3;
    v8 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    updateClients = v7->_updateClients;
    v7->_updateClients = (NSPointerArray *)v8;

    v7->_updateClientsLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class(v7);
    v11 = NSStringFromClass(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    if ((_DWORD)v4)
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification.%d"), v12, a3, v4);
    else
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification"), v12, a3, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = objc_retainAutorelease(v15);
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v17;

    if (v7->_notificationsQueue)
    {
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      v19 = objc_msgSend((id)objc_opt_class(v7), "iokitMatchingDictionaryForClockIdentifier:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v20));
      service = v7->_service;
      v7->_service = (IOKService *)v21;

      if (v7->_service)
      {
        v23 = -[IODConnection initWithService:andType:]([IODConnection alloc], "initWithService:andType:", v7->_service, 24);
        connection = v7->_connection;
        v7->_connection = v23;

        if (v7->_connection)
        {
          v7->_asyncCallbackRefcon = 0;
          -[TSDClockSync registerAsyncCallback](v7, "registerAsyncCallback");
LABEL_9:

          return v7;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v29 = "_connection != nil";
          v30 = 2048;
          v31 = 0;
          v32 = 2048;
          v33 = 0;
          v34 = 2080;
          v35 = "";
          v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
          v38 = 1024;
          v39 = 77;
          goto LABEL_17;
        }
LABEL_18:

        v7 = 0;
        goto LABEL_9;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 136316418;
      v29 = "_service != nil";
      v30 = 2048;
      v31 = 0;
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v38 = 1024;
      v39 = 74;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 136316418;
      v29 = "_notificationsQueue != nil";
      v30 = 2048;
      v31 = 0;
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v38 = 1024;
      v39 = 69;
    }
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_18;
  }
  return v7;
}

- (id)service
{
  os_unfair_lock_s *p_serviceLock;
  IOKService *v4;

  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  v4 = self->_service;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (id)connection
{
  os_unfair_lock_s *p_serviceLock;
  IODConnection *v4;

  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (void)_handleNotification:(int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSPointerArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  os_unfair_lock_s *v18;
  unint64_t v19;
  unint64_t v20;
  NSPointerArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  const char *v27;
  uint32_t v28;
  uint64_t v29;
  os_unfair_lock_s *lock;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  os_unfair_lock_s *p_updateClientsLock;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  _BYTE v48[10];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;

  if (a3 == 3001)
  {
    if (a5 == 7)
    {
      v34 = a4[1];
      v36 = *a4;
      v19 = a4[4];
      v32 = a4[3];
      v33 = a4[2];
      v20 = a4[6];
      lock = &self->_updateClientsLock;
      v31 = a4[5];
      os_unfair_lock_lock(&self->_updateClientsLock);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v21 = self->_updateClients;
      v22 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v26, "conformsToProtocol:", &OBJC_PROTOCOL___TSDClockSyncGeneralSyncClient))
            {
              LOWORD(v29) = v20;
              objc_msgSend(v26, "updateWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulativeScaledRate:grandmasterID:localPortNumber:", (v20 & 0xFF000000) != 0, BYTE2(v20), v33, v32, v19, v36, v34, v31, v29);
            }
          }
          v23 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v23);
      }

      v18 = lock;
      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v48 = "numArgs == 7";
      *(_WORD *)&v48[8] = 2048;
      v49 = 0;
      v50 = 2048;
      v51 = 0;
      v52 = 2080;
      v53 = "";
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v56 = 1024;
      v57 = 142;
      v27 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
      goto LABEL_34;
    }
  }
  else
  {
    if (a3 != 3000)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v48 = a3;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = a5;
      v27 = "TSDClockSync _handleNotification unhandled notification %u numArgs %u\n";
      v28 = 14;
      goto LABEL_28;
    }
    if (a5 == 4)
    {
      v8 = *a4;
      v9 = a4[1];
      v10 = a4[2];
      v11 = a4[3];
      p_updateClientsLock = &self->_updateClientsLock;
      os_unfair_lock_lock(&self->_updateClientsLock);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v12 = self->_updateClients;
      v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___TSDClockSyncGeneralSyncClient))
              objc_msgSend(v17, "updateTimeSyncTime:timeSyncInterval:domainTime:domainInterval:", v10, v8, v11, v9);
          }
          v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v14);
      }

      v18 = p_updateClientsLock;
LABEL_25:
      os_unfair_lock_unlock(v18);
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v48 = "numArgs == 4";
      *(_WORD *)&v48[8] = 2048;
      v49 = 0;
      v50 = 2048;
      v51 = 0;
      v52 = 2080;
      v53 = "";
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v56 = 1024;
      v57 = 123;
      v27 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
LABEL_34:
      v28 = 58;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
    }
  }
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDClockSync connection](self, "connection"));
  v5 = objc_msgSend(v4, "registerAsyncNotificationsWithSelector:callBack:refcon:callbackQueue:", 0, sub_1000080B8, self->_asyncCallbackRefcon, self->_notificationsQueue);

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
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v18 = 1024;
      v19 = 206;
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDClockSync connection](self, "connection"));
  LOBYTE(v3) = objc_msgSend(v4, "deregisterAsyncNotificationsWithSelector:", 1);

  return (char)v3;
}

- (void)addUpdateClient:(id)a3
{
  os_unfair_lock_s *p_updateClientsLock;
  id v5;

  p_updateClientsLock = &self->_updateClientsLock;
  v5 = a3;
  os_unfair_lock_lock(p_updateClientsLock);
  -[NSPointerArray addPointer:](self->_updateClients, "addPointer:", v5);

  -[NSPointerArray compact](self->_updateClients, "compact");
  os_unfair_lock_unlock(p_updateClientsLock);
}

- (void)removeUpdateClient:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_updateClientsLock);
  if (-[NSPointerArray count](self->_updateClients, "count"))
  {
    v4 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_updateClients, "pointerAtIndex:", v4) != v5)
    {
      if (++v4 >= -[NSPointerArray count](self->_updateClients, "count"))
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_updateClients, "removePointerAtIndex:", v4);
  }
LABEL_7:
  -[NSPointerArray compact](self->_updateClients, "compact");
  os_unfair_lock_unlock(&self->_updateClientsLock);

}

- (void)addReference
{
  ++self->_referenceCount;
}

- (unint64_t)releaseReference
{
  unint64_t v2;

  v2 = self->_referenceCount - 1;
  self->_referenceCount = v2;
  return v2;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_updateClients, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
}

@end
