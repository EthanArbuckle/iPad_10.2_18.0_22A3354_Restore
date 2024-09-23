@implementation TSClockManager

+ (id)frameworkClassNameForDaemonClassName:(id)a3
{
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_TSF_TSD"), CFSTR("TS"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
  +[_TSF_TSDClockManager notifyWhenClockManagerIsAvailable:](_TSF_TSDClockManager, "notifyWhenClockManagerIsAvailable:", a3);
}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
  +[_TSF_TSDClockManager notifyWhenClockManagerIsUnavailable:](_TSF_TSDClockManager, "notifyWhenClockManagerIsUnavailable:", a3);
}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATSAC:%016llx"), a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _sharedClockManagerLock = 0;
}

+ (id)sharedClockManager
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedClockManagerLock);
  v3 = (void *)_sharedClockManager;
  if (!_sharedClockManager)
  {
    objc_msgSend(a1, "clockManager");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_sharedClockManager;
    _sharedClockManager = v4;

    v3 = (void *)_sharedClockManager;
  }
  v6 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedClockManagerLock);
  return v6;
}

+ (id)sharedClockManagerSyncWithTimeout:(unint64_t)a3
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
  v11[2] = __52__TSClockManager_sharedClockManagerSyncWithTimeout___block_invoke;
  v11[3] = &unk_1E694B080;
  v6 = v5;
  v12 = v6;
  objc_msgSend(a1, "notifyWhenClockManagerIsAvailable:", v11);
  v7 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to find clock manager within the timeout period.\n", v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "sharedClockManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

intptr_t __52__TSClockManager_sharedClockManagerSyncWithTimeout___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)clockManager
{
  TSClockManager *v2;
  unsigned int v3;

  v2 = objc_alloc_init(TSClockManager);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSClockManager);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (TSClockManager)init
{
  TSClockManager *v2;
  TSClockManager *v3;
  uint64_t v4;
  NSPointerArray *clients;
  _TSF_TSDClockManager *v6;
  _TSF_TSDClockManager *impl;
  _TSF_TSDKernelClock *v8;
  TSDCTranslationClock *v9;
  TSTranslationClock *v10;
  void *v11;
  uint64_t v12;
  TSClock *translationClock;
  TSTimeSyncClock *v14;
  void *timeSyncClock;
  TSClockManager *v16;
  NSObject *v18;
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
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)TSClockManager;
  v2 = -[TSClockManager init](&v19, sel_init);
  v3 = v2;
  if (!v2)
    return 0;
  v2->_clientLock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v4 = objc_claimAutoreleasedReturnValue();
  clients = v3->_clients;
  v3->_clients = (NSPointerArray *)v4;

  mach_timebase_info(&v3->_timebaseInfo);
  v6 = objc_alloc_init(_TSF_TSDClockManager);
  impl = v3->_impl;
  v3->_impl = v6;

  if (v3->_impl)
  {
    v8 = -[_TSF_TSDKernelClock initWithClockIdentifier:]([_TSF_TSDKernelClock alloc], "initWithClockIdentifier:", -[_TSF_TSDClockManager translationClockIdentifier](v3->_impl, "translationClockIdentifier"));
    if (v8)
    {
      v9 = -[TSDCTranslationClock initWithClockIdentifier:]([TSDCTranslationClock alloc], "initWithClockIdentifier:", -[_TSF_TSDClockManager translationClockIdentifier](v3->_impl, "translationClockIdentifier"));
      if (v9)
      {
        objc_storeStrong((id *)&v3->_translationClockDC, v9);
        v10 = [TSTranslationClock alloc];
        -[TSDCTranslationClock translationClock](v9, "translationClock");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[TSTranslationClock initWithTranslationClock:](v10, "initWithTranslationClock:", v11);
        translationClock = v3->_translationClock;
        v3->_translationClock = (TSClock *)v12;

        v14 = -[TSTimeSyncClock initWithClockIdentifier:translationClock:]([TSTimeSyncClock alloc], "initWithClockIdentifier:translationClock:", -[_TSF_TSDClockManager timeSyncTimeClockIdentifier](v3->_impl, "timeSyncTimeClockIdentifier"), v3->_translationClock);
        timeSyncClock = v3->_timeSyncClock;
        v3->_timeSyncClock = &v14->super;
        v16 = v3;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v21 = "translationClockDC";
          v22 = 2048;
          v23 = 0;
          v24 = 2048;
          v25 = 0;
          v26 = 2080;
          v27 = "";
          v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
          v30 = 1024;
          v31 = 279;
          _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        }
        v16 = 0;
        timeSyncClock = v3;
      }

      v3 = (TSClockManager *)v8;
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "kernelClock";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
      v30 = 1024;
      v31 = 276;
      v18 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v21 = "_impl != nil";
    v22 = 2048;
    v23 = 0;
    v24 = 2048;
    v25 = 0;
    v26 = 2080;
    v27 = "";
    v28 = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
    v30 = 1024;
    v31 = 273;
    v18 = MEMORY[0x1E0C81028];
LABEL_14:
    _os_log_impl(&dword_1B56CB000, v18, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  v16 = 0;
LABEL_7:

  return v16;
}

+ (id)keyPathsForValuesAffectingTimeSyncTimeClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.timeSyncTimeClockIdentifier"), 0);
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return -[_TSF_TSDClockManager timeSyncTimeClockIdentifier](self->_impl, "timeSyncTimeClockIdentifier");
}

+ (id)keyPathsForValuesAffectingTimeSyncTimeIsMachAbsoluteTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.timeSyncTimeIsMachAbsoluteTime"), 0);
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return -[_TSF_TSDClockManager timeSyncTimeIsMachAbsoluteTime](self->_impl, "timeSyncTimeIsMachAbsoluteTime");
}

+ (id)keyPathsForValuesAffectingTranslationClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.translationClockIdentifier"), 0);
}

- (unint64_t)translationClockIdentifier
{
  return -[_TSF_TSDClockManager translationClockIdentifier](self->_impl, "translationClockIdentifier");
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
{
  return -[_TSF_TSDClockManager nextAvailableDynamicClockID:error:](self->_impl, "nextAvailableDynamicClockID:error:", a3, a4);
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
{
  return -[_TSF_TSDClockManager releaseDynamicClockID:error:](self->_impl, "releaseDynamicClockID:error:", a3, a4);
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  return -[_TSF_TSDClockManager addMappingFromClockID:toCoreAudioClockDomain:error:](self->_impl, "addMappingFromClockID:toCoreAudioClockDomain:error:", a3, a4, a5);
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
{
  return -[_TSF_TSDClockManager removeMappingFromClockIDToCoreAudioClockDomainForClockID:error:](self->_impl, "removeMappingFromClockIDToCoreAudioClockDomainForClockID:error:", a3, a4);
}

- (BOOL)addgPTPServicesWithError:(id *)a3
{
  return -[_TSF_TSDClockManager addgPTPServicesWithError:](self->_impl, "addgPTPServicesWithError:", a3);
}

- (BOOL)removegPTPServicesWithError:(id *)a3
{
  return -[_TSF_TSDClockManager removegPTPServicesWithError:](self->_impl, "removegPTPServicesWithError:", a3);
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
{
  return -[_TSF_TSDClockManager addTSNCaptureServicesWithError:](self->_impl, "addTSNCaptureServicesWithError:", a3);
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
{
  return -[_TSF_TSDClockManager removeTSNCaptureServicesWithError:](self->_impl, "removeTSNCaptureServicesWithError:", a3);
}

- (id)availableClockIdentifiers
{
  -[_TSF_TSDClockManager availableClockIdentifiers](self->_impl, "availableClockIdentifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  __objc2_class **v8;
  char isKindOfClass;

  if (-[TSClockManager timeSyncTimeClockIdentifier](self, "timeSyncTimeClockIdentifier") == a3)
  {
    -[TSClockManager timeSyncClock](self, "timeSyncClock");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    return v6;
  }
  if (-[TSClockManager translationClockIdentifier](self, "translationClockIdentifier") == a3)
  {
    -[TSClockManager translationClock](self, "translationClock");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[TSDCKernelClock clockWithIdentifier:](TSDCKernelClock, "clockWithIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = off_1E694A850;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = off_1E694A7C0;
    if ((isKindOfClass & 1) != 0)
      v8 = off_1E694A830;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v8), "initWithImplDC:", v7);

  return v6;
}

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  return -[_TSF_TSDClockManager addUserFilteredClockWithMachInterval:domainInterval:usingFilterShift:isAdaptive:error:](self->_impl, "addUserFilteredClockWithMachInterval:domainInterval:usingFilterShift:isAdaptive:error:", a3, a4, a5, a6, a7);
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return -[_TSF_TSDClockManager removeUserFilteredClockWithIdentifier:error:](self->_impl, "removeUserFilteredClockWithIdentifier:error:", a3, a4);
}

- (BOOL)getConnectionForClockWithClockIdentifier:(unint64_t)a3 daemonClockClassName:(id *)a4 endpoint:(id *)a5
{
  *a4 = 0;
  *a5 = 0;
  return 0;
}

- (BOOL)getConnectionForPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4 daemonPortClassName:(id *)a5 endpoint:(id *)a6
{
  *a5 = 0;
  *a6 = 0;
  return 0;
}

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer;
  uint64_t v5;
  __int128 v7;
  unint64_t v8[2];

  numer = self->_timebaseInfo.numer;
  if ((_DWORD)numer != self->_timebaseInfo.denom)
  {
    *(_QWORD *)&v7 = IOTS_uint64mul(a3, numer);
    *((_QWORD *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
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
    *(_QWORD *)&v7 = IOTS_uint64mul(a3, denom);
    *((_QWORD *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
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

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClassName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@+%@\n"), v6, v8);

  objc_msgSend(v7, "appendFormat:", CFSTR("%@    TimeSyncTime Clock Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeSyncTimeClockID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v9, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    TimeSyncTime CoreAudio Clock Domain: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeSyncTimeCoreAudioClockDomain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%08x\n"), objc_msgSend(v11, "unsignedIntValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));

  return v7;
}

+ (id)diagnosticInfo
{
  +[_TSF_TSDClockManager diagnosticInfo](_TSF_TSDClockManager, "diagnosticInfo");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)diagnosticDescriptionForClockIdentifier:(unint64_t)a3 withIndent:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  id v13;

  v6 = a4;
  v13 = 0;
  +[_TSF_TSDClockManager diagnosticInfoForClockIdentifier:daemonClassName:](_TSF_TSDClockManager, "diagnosticInfoForClockIdentifier:daemonClassName:", a3, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(a1, "frameworkClassNameForDaemonClassName:", v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    -[objc_class diagnosticDescriptionForInfo:withIndent:](NSClassFromString(v9), "diagnosticDescriptionForInfo:withIndent:", v7, v6);
  else
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Could not find class to describe service\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3
{
  +[_TSF_TSDClockManager diagnosticInfoForClockIdentifier:daemonClassName:](_TSF_TSDClockManager, "diagnosticInfoForClockIdentifier:daemonClassName:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addClient:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8) == v4)
        {

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (_QWORD)v9);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v7 + v9, (_QWORD)v11);
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);

}

- (void)interruptedClockManager
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "interruptedConnectionForClockManager:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_clientLock);
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__TSClockManager_interruptedClockManager__block_invoke;
  block[3] = &unk_1E694B080;
  block[4] = self;
  dispatch_async(v9, block);

}

void __41__TSClockManager_interruptedClockManager__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedClockManagerLock);
  v3 = *(void **)(a1 + 32);
  if (v3 == (void *)_sharedClockManager)
  {
    _sharedClockManager = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedClockManagerLock);
  objc_autoreleasePoolPop(v2);
}

- (TSClock)timeSyncClock
{
  return self->_timeSyncClock;
}

- (TSClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_translationClockDC, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
