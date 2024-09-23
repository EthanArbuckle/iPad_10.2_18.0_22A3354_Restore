@implementation TSgPTPManager

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
{
  +[_TSF_TSDgPTPManager notifyWhengPTPManagerIsAvailable:](_TSF_TSDgPTPManager, "notifyWhengPTPManagerIsAvailable:", a3);
}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
{
  +[_TSF_TSDgPTPManager notifyWhengPTPManagerIsUnavailable:](_TSF_TSDgPTPManager, "notifyWhengPTPManagerIsUnavailable:", a3);
}

+ (id)sharedgPTPManager
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  v3 = (void *)_sharedgPTPManager;
  if (!_sharedgPTPManager)
  {
    +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addgPTPServicesWithError:", 0);
    objc_msgSend(a1, "gPTPManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_sharedgPTPManager;
    _sharedgPTPManager = v5;

    v3 = (void *)_sharedgPTPManager;
  }
  v7 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  return v7;
}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  uint8_t v10[8];
  _QWORD v11[4];
  NSObject *v12;

  v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__TSgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke;
  v11[3] = &unk_1E694AF60;
  v6 = v5;
  v12 = v6;
  objc_msgSend(a1, "notifyWhengPTPManagerIsAvailable:", v11);
  v7 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to find gPTP manager within the timeout period.\n", v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "sharedgPTPManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

intptr_t __50__TSgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)gPTPManager
{
  TSgPTPManager *v2;
  unsigned int v3;

  v2 = objc_alloc_init(TSgPTPManager);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSgPTPManager);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (TSgPTPManager)init
{
  TSgPTPManager *v2;
  TSgPTPManager *v3;
  uint64_t v4;
  NSPointerArray *clients;
  _TSF_TSDgPTPManager *v6;
  _TSF_TSDgPTPManager *impl;
  void *v8;
  dispatch_queue_t v9;
  void *systemDomainQueue;
  objc_super v12;
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
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)TSgPTPManager;
  v2 = -[TSgPTPManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_clientLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v4 = objc_claimAutoreleasedReturnValue();
    clients = v3->_clients;
    v3->_clients = (NSPointerArray *)v4;

    v6 = objc_alloc_init(_TSF_TSDgPTPManager);
    impl = v3->_impl;
    v3->_impl = v6;

    if (v3->_impl)
    {
      +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addgPTPServicesWithError:", 0);

      v9 = dispatch_queue_create("com.apple.TimeSync.TSgPTPManager.systemDomain", 0);
      systemDomainQueue = v3->_systemDomainQueue;
      v3->_systemDomainQueue = (OS_dispatch_queue *)v9;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v14 = "_impl!= nil";
        v15 = 2048;
        v16 = 0;
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = "";
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPManager.m";
        v23 = 1024;
        v24 = 132;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      systemDomainQueue = v3;
      v3 = 0;
    }

  }
  return v3;
}

+ (id)keyPathsForValuesAffectingSystemDomain
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.systemDomainClockIdentifier"), 0);
}

- (TSgPTPClock)systemDomain
{
  NSObject *systemDomainQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__TSgPTPManager_systemDomain__block_invoke;
  v5[3] = &unk_1E694AF88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(systemDomainQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSgPTPClock *)v3;
}

void __29__TSgPTPManager_systemDomain__block_invoke(uint64_t a1)
{
  void *v2;
  TSgPTPClock *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = -[TSKernelClock initWithClockIdentifier:]([TSgPTPClock alloc], "initWithClockIdentifier:", objc_msgSend(*(id *)(a1 + 32), "systemDomainClockIdentifier"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

+ (id)keyPathsForValuesAffectingSystemDomainClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.systemDomainClockIdentifier"), 0);
}

- (unint64_t)systemDomainClockIdentifier
{
  return -[_TSF_TSDgPTPManager systemDomainClockIdentifier](self->_impl, "systemDomainClockIdentifier");
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPManager addPTPInstance:error:](self->_impl, "addPTPInstance:error:", a3, a4);
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPManager addTimeOfDayPTPInstance:error:](self->_impl, "addTimeOfDayPTPInstance:error:", a3, a4);
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPManager removePTPInstanceWithIdentifier:error:](self->_impl, "removePTPInstanceWithIdentifier:error:", a3, a4);
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPManager addAVBPTPInstanceIndex:identifier:error:](self->_impl, "addAVBPTPInstanceIndex:identifier:error:", a3, a4, a5);
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPManager removeAVBPTPInstanceWithIndex:error:](self->_impl, "removeAVBPTPInstanceWithIndex:error:", a3, a4);
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance0ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.avbPTPInstance0ClockIdentifier"), 0);
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  return -[_TSF_TSDgPTPManager avbPTPInstance0ClockIdentifier](self->_impl, "avbPTPInstance0ClockIdentifier");
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance1ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.avbPTPInstance1ClockIdentifier"), 0);
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  return -[_TSF_TSDgPTPManager avbPTPInstance1ClockIdentifier](self->_impl, "avbPTPInstance1ClockIdentifier");
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance2ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.avbPTPInstance2ClockIdentifier"), 0);
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  return -[_TSF_TSDgPTPManager avbPTPInstance2ClockIdentifier](self->_impl, "avbPTPInstance2ClockIdentifier");
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance3ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.avbPTPInstance3ClockIdentifier"), 0);
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  return -[_TSF_TSDgPTPManager avbPTPInstance3ClockIdentifier](self->_impl, "avbPTPInstance3ClockIdentifier");
}

+ (id)keyPathsForValuesAffectingAirPlayPTPInstanceClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.airPlayPTPInstanceClockIdentifier"), 0);
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  return -[_TSF_TSDgPTPManager airPlayPTPInstanceClockIdentifier](self->_impl, "airPlayPTPInstanceClockIdentifier");
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPManager addAirPlayPTPInstance:error:](self->_impl, "addAirPlayPTPInstance:error:", a3, a4);
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
{
  return -[_TSF_TSDgPTPManager removeAirPlayPTPInstanceWithError:](self->_impl, "removeAirPlayPTPInstanceWithError:", a3);
}

+ (id)keyPathsForValuesAffectingCopresencePTPInstanceClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.copresencePTPInstanceClockIdentifier"), 0);
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  return -[_TSF_TSDgPTPManager copresencePTPInstanceClockIdentifier](self->_impl, "copresencePTPInstanceClockIdentifier");
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPManager addCopresencePTPInstance:error:](self->_impl, "addCopresencePTPInstance:error:", a3, a4);
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
{
  return -[_TSF_TSDgPTPManager removeCopresencePTPInstanceWithError:](self->_impl, "removeCopresencePTPInstanceWithError:", a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removegPTPServicesWithError:", 0);

  v4.receiver = self;
  v4.super_class = (Class)TSgPTPManager;
  -[TSgPTPManager dealloc](&v4, sel_dealloc);
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClassName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@+%@\n"), v6, v8);

  objc_msgSend(v7, "appendFormat:", CFSTR("%@    System PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SystemDomainIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v9, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    AVB 0 PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVB0ClockID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v11, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    AVB 1 PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVB1ClockID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v12, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    AVB 2 PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVB2ClockID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v13, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    AVB 3 PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVB3ClockID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v14, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    AirPlay PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AirPlayClockID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v15, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    Copresence PTP Instance Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CopresenceClockID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v16;
  if (v16)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v16, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("        |"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PTPInstances"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        +[TSgPTPClock diagnosticDescriptionForInfo:withIndent:](TSgPTPClock, "diagnosticDescriptionForInfo:withIndent:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  return v7;
}

+ (id)diagnosticInfo
{
  return +[_TSF_TSDgPTPManager diagnosticInfo](_TSF_TSDgPTPManager, "diagnosticInfo");
}

- (void)addClient:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9) == v4)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (_QWORD)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);

}

- (void)removeClient:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v8 + v10, (_QWORD)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);

}

- (void)interruptedgPTPManager
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "interruptedConnectionForgPTPManager:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
  dispatch_get_global_queue(33, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__TSgPTPManager_interruptedgPTPManager__block_invoke;
  block[3] = &unk_1E694AF60;
  block[4] = self;
  dispatch_async(v10, block);

}

void __39__TSgPTPManager_interruptedgPTPManager__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  v3 = *(void **)(a1 + 32);
  if (v3 == (void *)_sharedgPTPManager)
  {
    _sharedgPTPManager = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  objc_autoreleasePoolPop(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_systemDomainQueue, 0);
  objc_storeStrong((id *)&self->_systemDomain, 0);
}

@end
