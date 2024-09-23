@implementation _TSF_TSDClockSync

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IOProviderClass");
  v9[1] = CFSTR("IOPropertyMatch");
  v10[0] = CFSTR("IOTimeSyncService");
  v7 = CFSTR("ClockIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_TSF_TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4;
  _TSF_TSDClockSync *v6;
  _TSF_TSDClockSync *v7;
  uint64_t v8;
  NSPointerArray *updateClients;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *notificationsQueue;
  void *v18;
  void *v19;
  uint64_t v20;
  IOKService *service;
  _TSF_IODConnection *v22;
  _TSF_IODConnection *connection;
  NSObject *v25;
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
  uint64_t v40;

  v4 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_TSF_TSDClockSync;
  v6 = -[_TSF_TSDClockSync init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_referenceCount = 1;
    v6->_clockIdentifier = a3;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v8 = objc_claimAutoreleasedReturnValue();
    updateClients = v7->_updateClients;
    v7->_updateClients = (NSPointerArray *)v8;

    v7->_updateClientsLock._os_unfair_lock_opaque = 0;
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if ((_DWORD)v4)
      objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification.%d"), v12, a3, v4);
    else
      objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification"), v12, a3, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v16;

    if (v7->_notificationsQueue)
    {
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      v18 = (void *)MEMORY[0x1E0D39F08];
      objc_msgSend((id)objc_opt_class(), "iokitMatchingDictionaryForClockIdentifier:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "matchingService:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      service = v7->_service;
      v7->_service = (IOKService *)v20;

      if (v7->_service)
      {
        v22 = -[_TSF_IODConnection initWithService:andType:]([_TSF_IODConnection alloc], "initWithService:andType:", v7->_service, 24);
        connection = v7->_connection;
        v7->_connection = v22;

        if (v7->_connection)
        {
          v7->_asyncCallbackRefcon = 0;
          -[_TSF_TSDClockSync registerAsyncCallback](v7, "registerAsyncCallback");
LABEL_9:

          return v7;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
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
          v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
          v38 = 1024;
          v39 = 77;
          v25 = MEMORY[0x1E0C81028];
          goto LABEL_17;
        }
LABEL_18:

        v7 = 0;
        goto LABEL_9;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
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
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      v38 = 1024;
      v39 = 74;
      v25 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
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
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      v38 = 1024;
      v39 = 69;
      v25 = MEMORY[0x1E0C81028];
    }
LABEL_17:
    _os_log_impl(&dword_1B56CB000, v25, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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
  _TSF_IODConnection *v4;

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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  os_unfair_lock_s *v18;
  unint64_t v19;
  unint64_t v20;
  NSPointerArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  uint64_t v30;
  os_unfair_lock_s *lock;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_unfair_lock_s *p_updateClientsLock;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  _BYTE v49[10];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (a3 == 3001)
  {
    if (a5 == 7)
    {
      v35 = a4[1];
      v37 = *a4;
      v19 = a4[4];
      v33 = a4[3];
      v34 = a4[2];
      v20 = a4[6];
      lock = &self->_updateClientsLock;
      v32 = a4[5];
      os_unfair_lock_lock(&self->_updateClientsLock);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v21 = self->_updateClients;
      v22 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if (objc_msgSend(v26, "conformsToProtocol:", &unk_1EF12F898))
            {
              LOWORD(v30) = v20;
              objc_msgSend(v26, "updateWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulativeScaledRate:grandmasterID:localPortNumber:", (v20 & 0xFF000000) != 0, BYTE2(v20), v34, v33, v19, v37, v35, v32, v30);
            }
          }
          v23 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v23);
      }

      v18 = lock;
      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v49 = "numArgs == 7";
      *(_WORD *)&v49[8] = 2048;
      v50 = 0;
      v51 = 2048;
      v52 = 0;
      v53 = 2080;
      v54 = "";
      v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      v57 = 1024;
      v58 = 142;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
      goto LABEL_34;
    }
  }
  else
  {
    if (a3 != 3000)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v49 = a3;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = a5;
      v27 = MEMORY[0x1E0C81028];
      v28 = "TSDClockSync _handleNotification unhandled notification %u numArgs %u\n";
      v29 = 14;
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
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v12 = self->_updateClients;
      v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v43 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EF12F898))
              objc_msgSend(v17, "updateTimeSyncTime:timeSyncInterval:domainTime:domainInterval:", v10, v8, v11, v9);
          }
          v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v14);
      }

      v18 = p_updateClientsLock;
LABEL_25:
      os_unfair_lock_unlock(v18);
      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v49 = "numArgs == 4";
      *(_WORD *)&v49[8] = 2048;
      v50 = 0;
      v51 = 2048;
      v52 = 0;
      v53 = 2080;
      v54 = "";
      v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      v57 = 1024;
      v58 = 123;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
LABEL_34:
      v29 = 58;
LABEL_28:
      _os_log_impl(&dword_1B56CB000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
    }
  }
}

- (BOOL)registerAsyncCallback
{
  void *v3;
  void *v4;
  char v5;
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
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_asyncCallbackRefcon = objc_msgSend(v3, "allocateRefcon:", self);

  -[_TSF_TSDClockSync connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "registerAsyncNotificationsWithSelector:callBack:refcon:callbackQueue:", 0, asyncNotificationsCallback_1, self->_asyncCallbackRefcon, self->_notificationsQueue);

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
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
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      v18 = 1024;
      v19 = 206;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "releaseRefcon:", self->_asyncCallbackRefcon);

  }
  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  void *v3;
  void *v4;

  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseRefcon:", self->_asyncCallbackRefcon);

  -[_TSF_TSDClockSync connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
