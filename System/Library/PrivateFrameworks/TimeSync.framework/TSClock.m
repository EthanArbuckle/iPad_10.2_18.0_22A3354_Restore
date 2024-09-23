@implementation TSClock

- (TSClock)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSClock init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (TSClock)initWithClockIdentifier:(unint64_t)a3
{
  TSClock *v4;
  TSClock *v5;
  uint64_t v6;
  NSPointerArray *clients;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *notificationsQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSClock;
  v4 = -[TSClock init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_clockIdentifier = a3;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v6 = objc_claimAutoreleasedReturnValue();
    clients = v5->_clients;
    v5->_clients = (NSPointerArray *)v6;

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.TimeSync.%@.0x%016llx.notification"), v10, a3);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    notificationsQueue = v5->_notificationsQueue;
    v5->_notificationsQueue = (OS_dispatch_queue *)v12;

    if (!v5->_notificationsQueue)
    {

      return 0;
    }
  }
  return v5;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return -1;
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return -1;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = -1;
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TSErrorDomain"), -536870201, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return -1;
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return -1;
}

- (BOOL)updateCoreAudioReanchors:(unsigned int)a3
{
  return 0;
}

- (unsigned)getCoreAudioReanchors
{
  return 0;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = -1;
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TSErrorDomain"), -536870201, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)addClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");
    -[TSClock description](self, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v13 = v6;
    v14 = 2080;
    v15 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding Client %s to clock %s\n", buf, 0x16u);

  }
  -[TSClock notificationQueue](self, "notificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __21__TSClock_addClient___block_invoke;
  v10[3] = &unk_1E694B118;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, v10);

}

void __21__TSClock_addClient___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "compact");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7))
        {

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addPointer:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
LABEL_11:
  objc_autoreleasePoolPop(v2);
}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");
    -[TSClock description](self, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v13 = v6;
    v14 = 2080;
    v15 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removing Client %s from clock %s\n", buf, 0x16u);

  }
  -[TSClock notificationQueue](self, "notificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __24__TSClock_removeClient___block_invoke;
  v10[3] = &unk_1E694B118;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, v10);

}

void __24__TSClock_removeClient___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
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
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      v9 = v6 + v5;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8))
        {

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removePointerAtIndex:", v6 + v8, (_QWORD)v10);
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }

LABEL_11:
  objc_autoreleasePoolPop(v2);
}

- (NSMutableArray)clients
{
  void *v3;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPointerArray compact](self->_clients, "compact");
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
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8))
          objc_msgSend(v3, "addObject:", (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSMutableArray *)v3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationsQueue;
}

- (double)hostRateRatio
{
  return 1.0;
}

- (NSString)clockName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ 0x%016llx"), v5, -[TSClock clockIdentifier](self, "clockIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ClockName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@%@\n"), v6, v9);

  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Clock Identifier: "), v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ClockIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v8, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v10, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));

  return v8;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ 0x%016llx"), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (int)lockState
{
  return self->_lockState;
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
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
