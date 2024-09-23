@implementation TSKernelClock

+ (id)availableKernelClockIdentifiers
{
  return +[_TSF_TSDKernelClock availableKernelClockIdentifiers](_TSF_TSDKernelClock, "availableKernelClockIdentifiers");
}

- (TSKernelClock)initWithImplDC:(id)a3
{
  id v5;
  void *v6;
  TSKernelClock *v7;
  TSKernelClock *v8;
  id *p_impl;
  void *v10;
  uint64_t v11;
  objc_super v13;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "kernelClock != nil";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSKernelClock.m";
      v25 = 1024;
      v26 = 71;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = 0;
    goto LABEL_4;
  }
  v14.receiver = self;
  v14.super_class = (Class)TSKernelClock;
  v7 = -[TSClock initWithClockIdentifier:](&v14, sel_initWithClockIdentifier_, objc_msgSend(v5, "clockIdentifier"));
  v8 = v7;
  if (v7)
  {
    p_impl = (id *)&v7->_impl;
    objc_storeStrong((id *)&v7->_impl, a3);
    v13.receiver = v8;
    v13.super_class = (Class)TSKernelClock;
    -[TSClock propertyUpdateQueue](&v13, sel_propertyUpdateQueue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_impl, "setPropertyUpdateQueue:", v10);

    objc_msgSend(*p_impl, "setClient:", v8);
    v8->_clientLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v11 = objc_claimAutoreleasedReturnValue();
    self = (TSKernelClock *)v8->_clients;
    v8->_clients = (NSPointerArray *)v11;
LABEL_4:

  }
  return v8;
}

- (TSKernelClock)initWithClockIdentifier:(unint64_t)a3
{
  void *v4;
  TSKernelClock *v5;
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

  v19 = *MEMORY[0x1E0C80C00];
  +[TSDCKernelClock clockWithIdentifier:](TSDCKernelClock, "clockWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[TSKernelClock initWithImplDC:](self, "initWithImplDC:", v4);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "kernelClock";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSKernelClock.m";
      v17 = 1024;
      v18 = 92;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }

    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDCKernelClock setClient:](self->_impl, "setClient:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSKernelClock;
  -[TSKernelClock dealloc](&v3, sel_dealloc);
}

- (void)setPropertyUpdateQueue:(id)a3
{
  void *v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKernelClock;
  -[TSClock setPropertyUpdateQueue:](&v6, sel_setPropertyUpdateQueue_, a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKernelClock;
  -[TSClock propertyUpdateQueue](&v5, sel_propertyUpdateQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDCKernelClock setPropertyUpdateQueue:](self->_impl, "setPropertyUpdateQueue:", v4);

}

+ (id)keyPathsforvaluesaffectingLockState
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.lockState"), 0);
}

- (int)lockState
{
  return -[TSDCKernelClock lockState](self->_impl, "lockState");
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromMachAbsoluteToDomainTime:](self->_impl, "convertFromMachAbsoluteToDomainTime:", a3);
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromDomainToMachAbsoluteTime:](self->_impl, "convertFromDomainToMachAbsoluteTime:", a3);
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSDCKernelClock convertFromMachAbsoluteTime:toDomainTime:withCount:](self->_impl, "convertFromMachAbsoluteTime:toDomainTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSDCKernelClock convertFromDomainTime:toMachAbsoluteTime:withCount:](self->_impl, "convertFromDomainTime:toMachAbsoluteTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromMachAbsoluteIntervalToDomainInterval:](self->_impl, "convertFromMachAbsoluteIntervalToDomainInterval:", a3);
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromDomainIntervalToMachAbsoluteInterval:](self->_impl, "convertFromDomainIntervalToMachAbsoluteInterval:", a3);
}

+ (id)keyPathsForValuesAffectingHostRateRatio
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hostRateRatio"), 0);
}

- (double)hostRateRatio
{
  double result;

  -[TSDCKernelClock hostRateRatio](self->_impl, "hostRateRatio");
  return result;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSDCKernelClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](self->_impl, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", a3, a4, a5, a6, a7);
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromTimeSyncToDomainTime:](self->_impl, "convertFromTimeSyncToDomainTime:", a3);
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromDomainToTimeSyncTime:](self->_impl, "convertFromDomainToTimeSyncTime:", a3);
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSDCKernelClock convertFromTimeSyncTime:toDomainTime:withCount:](self->_impl, "convertFromTimeSyncTime:toDomainTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSDCKernelClock convertFromDomainTime:toTimeSyncTime:withCount:](self->_impl, "convertFromDomainTime:toTimeSyncTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromTimeSyncTimeIntervalToDomainInterval:](self->_impl, "convertFromTimeSyncTimeIntervalToDomainInterval:", a3);
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromDomainIntervalToTimeSyncTimeInterval:](self->_impl, "convertFromDomainIntervalToTimeSyncTimeInterval:", a3);
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSDCKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](self->_impl, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", a3, a4, a5, a6, a7);
}

- (BOOL)updateCoreAudioReanchors:(unsigned int)a3
{
  -[TSDCKernelClock updateCoreAudioReanchors:](self->_impl, "updateCoreAudioReanchors:", *(_QWORD *)&a3);
  return 1;
}

- (unsigned)getCoreAudioReanchors
{
  return -[TSDCKernelClock getCoreAudioReanchors](self->_impl, "getCoreAudioReanchors");
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
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TSKernelClock;
  -[TSClock addClient:](&v14, sel_addClient_, v4);
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v8 + v10);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);
  v12.receiver = self;
  v12.super_class = (Class)TSKernelClock;
  -[TSClock removeClient:](&v12, sel_removeClient_, v4);

}

+ (id)keyPathsForValuesAffectingClockName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockName"), 0);
}

- (id)clockName
{
  return -[TSDCKernelClock clockName](self->_impl, "clockName");
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
  int v12;
  const __CFString *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClassName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@+%@\n"), v6, v8);

  objc_msgSend(v7, "appendFormat:", CFSTR("%@    Clock Identifier: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClockIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v7, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v9, "unsignedLongLongValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    Lock State: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClockLockState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v11, "intValue");
    if (v12 == 2)
    {
      v13 = CFSTR("Locked\n");
    }
    else if (v12 == 1)
    {
      v13 = CFSTR("Locking\n");
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("Unknown (%d)\n"), objc_msgSend(v11, "intValue"));
        goto LABEL_13;
      }
      v13 = CFSTR("Not Locking\n");
    }
  }
  else
  {
    v13 = CFSTR(" Could not read property\n");
  }
  objc_msgSend(v7, "appendString:", v13);
LABEL_13:

  return v7;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return +[_TSF_TSDKernelClock clockNameForClockIdentifier:](_TSF_TSDKernelClock, "clockNameForClockIdentifier:", a3);
}

- (void)didResetClock
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didResetClock:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeClockMaster
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didChangeClockMasterForClock:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeLockStateTo:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_clients;
  v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "didChangeLockStateTo:forClock:", v3, self, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didBeginClockGrandmasterChange
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didBeginClockGrandmasterChangeForClock:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4
{
  uint64_t v4;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_unfair_lock_t lock;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didBeginClockGrandmasterChangeWithGrandmasterID:localPort:forClock:", a3, v4, self);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)didEndClockGrandmasterChange
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didEndClockGrandmasterChangeForClock:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4
{
  uint64_t v4;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_unfair_lock_t lock;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didEndClockGrandmasterChangeWithGrandmasterID:localPort:forClock:", a3, v4, self);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)didProcessSync
{
  os_unfair_lock_s *p_clientLock;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didProcessSync:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4
{
  uint64_t v4;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_unfair_lock_t lock;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didChangeLocalPortWithGrandmasterID:localPort:forClock:", a3, v4, self);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)interruptedConnection
{
  void *v3;
  void (**v4)(id, TSKernelClock *);

  -[TSKernelClock interruptionHandler](self, "interruptionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TSKernelClock interruptionHandler](self, "interruptionHandler");
    v4 = (void (**)(id, TSKernelClock *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
