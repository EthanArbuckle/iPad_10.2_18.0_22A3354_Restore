@implementation TSDCKernelClock

+ (id)clockWithIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  __objc2_class **v6;
  void *v7;
  char isKindOfClass;

  +[_TSF_TSDClockManager sharedClockManager](_TSF_TSDClockManager, "sharedClockManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockWithClockIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = off_1E694A7A8;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v6 = off_1E694A790;
      if ((isKindOfClass & 1) != 0)
        v6 = off_1E694A7A0;
    }
    v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithKernelClock:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TSDCKernelClock)initWithKernelClock:(id)a3
{
  id v5;
  TSDCKernelClock *v6;
  TSDCKernelClock *v7;
  void *v8;
  uint64_t v9;
  TSClock *translationClock;
  void *v11;
  uint64_t v12;
  _TSF_TSDClockSync *clockSync;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSDCKernelClock;
  v6 = -[TSDCKernelClock init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_updateLock._os_unfair_lock_opaque = 0;
    v6->_clockIdentifier = objc_msgSend(v5, "clockIdentifier");
    v7->_hostRateRatio = 1.0;
    v7->_validIndex = -1;
    +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "translationClock");
    v9 = objc_claimAutoreleasedReturnValue();
    translationClock = v7->_translationClock;
    v7->_translationClock = (TSClock *)v9;

    objc_storeStrong((id *)&v7->_kernelClock, a3);
    -[_TSF_TSDKernelClock addClient:](v7->_kernelClock, "addClient:", v7);
    +[_TSF_TSDClockSyncManager sharedClockSyncManager](_TSF_TSDClockSyncManager, "sharedClockSyncManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clockSyncForClockIdentifier:pid:", -[_TSF_TSDKernelClock clockIdentifier](v7->_kernelClock, "clockIdentifier"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    clockSync = v7->_clockSync;
    v7->_clockSync = (_TSF_TSDClockSync *)v12;

    -[_TSF_TSDClockSync addUpdateClient:](v7->_clockSync, "addUpdateClient:", v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[TSDCKernelClock _getInitialSyncInfo](v7, "_getInitialSyncInfo");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_TSF_TSDClockSync removeUpdateClient:](self->_clockSync, "removeUpdateClient:", self);
  +[_TSF_TSDClockSyncManager sharedClockSyncManager](_TSF_TSDClockSyncManager, "sharedClockSyncManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseClockSyncForClockIdentifier:", -[_TSF_TSDKernelClock clockIdentifier](self->_kernelClock, "clockIdentifier"));

  -[_TSF_TSDKernelClock finalizeNotifications](self->_kernelClock, "finalizeNotifications");
  -[_TSF_TSDKernelClock removeClient:](self->_kernelClock, "removeClient:", self);
  v4.receiver = self;
  v4.super_class = (Class)TSDCKernelClock;
  -[TSDCKernelClock dealloc](&v4, sel_dealloc);
}

- (NSString)clockName
{
  return 0;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      v15 = 136315138;
      v16 = "-[TSDCKernelClock convertFromMachAbsoluteToDomainTime:]";
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v15, 0xCu);
    }
  }

  v8 = -[TSClock convertFromMachAbsoluteToDomainTime:](self->_translationClock, "convertFromMachAbsoluteToDomainTime:", a3);
  v9 = -[TSClock convertFromDomainToTimeSyncTime:](self->_translationClock, "convertFromDomainToTimeSyncTime:", v8);
  v10 = -[TSDCKernelClock convertFromTimeSyncToDomainTime:](self, "convertFromTimeSyncToDomainTime:", v9);
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      v15 = 136316162;
      v16 = "-[TSDCKernelClock convertFromMachAbsoluteToDomainTime:]";
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      v23 = 2048;
      v24 = v10;
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v11, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1B571F9B9, "%s MachAbsoluteTime=%llu intermediateTime=%llu timeSyncTime=%llu  domainTime=%llu", (uint8_t *)&v15, 0x34u);
    }
  }

  return v10;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      v15 = 136315138;
      v16 = "-[TSDCKernelClock convertFromDomainToMachAbsoluteTime:]";
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v15, 0xCu);
    }
  }

  v8 = -[TSDCKernelClock convertFromDomainToTimeSyncTime:](self, "convertFromDomainToTimeSyncTime:", a3);
  v9 = -[TSClock convertFromTimeSyncToDomainTime:](self->_translationClock, "convertFromTimeSyncToDomainTime:", v8);
  v10 = -[TSClock convertFromDomainToMachAbsoluteTime:](self->_translationClock, "convertFromDomainToMachAbsoluteTime:", v9);
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      v15 = 136316162;
      v16 = "-[TSDCKernelClock convertFromDomainToMachAbsoluteTime:]";
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      v23 = 2048;
      v24 = v10;
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v11, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1B571F9B9, "%s domainTime=%llu timeSyncTime=%llu intermediateTime=%llu MachAbsoluteTime=%llu", (uint8_t *)&v15, 0x34u);
    }
  }

  return v10;
}

- (id)getOsLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__TSDCKernelClock_getOsLog__block_invoke;
  block[3] = &unk_1E694AF60;
  block[4] = self;
  if (getOsLog_onceToken != -1)
    dispatch_once(&getOsLog_onceToken, block);
  return (id)getOsLog_clockLog;
}

void __27__TSDCKernelClock_getOsLog__block_invoke()
{
  objc_class *v0;
  os_log_t v1;
  void *v2;
  id v3;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("TimeSync", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)getOsLog_clockLog;
  getOsLog_clockLog = (uint64_t)v1;

}

- (unint64_t)getSignpostId
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__TSDCKernelClock_getSignpostId__block_invoke;
  block[3] = &unk_1E694AF60;
  block[4] = self;
  if (getSignpostId_onceToken != -1)
    dispatch_once(&getSignpostId_onceToken, block);
  return getSignpostId_signpostId;
}

void __32__TSDCKernelClock_getSignpostId__block_invoke(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "getOsLog");
  v1 = objc_claimAutoreleasedReturnValue();
  getSignpostId_signpostId = os_signpost_id_generate(v1);

}

- (os_unfair_lock_s)getUpdateLock
{
  return &self->_updateLock;
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  BOOL result;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v14 = 136316418;
    v15 = "machAbsoluteTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 189;
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  v5 = a4;
  if (!a4)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v14 = 136316418;
    v15 = "domainTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 190;
    v12 = MEMORY[0x1E0C81028];
LABEL_12:
    _os_log_impl(&dword_1B56CB000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a3;
    v8 = a5;
    do
    {
      v9 = *v6++;
      *v5++ = -[TSDCKernelClock convertFromMachAbsoluteToDomainTime:](self, "convertFromMachAbsoluteToDomainTime:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  BOOL result;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v14 = 136316418;
    v15 = "machAbsoluteTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 207;
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  v5 = a3;
  if (!a3)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v14 = 136316418;
    v15 = "domainTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 208;
    v12 = MEMORY[0x1E0C81028];
LABEL_12:
    _os_log_impl(&dword_1B56CB000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a4;
    v8 = a5;
    do
    {
      v9 = *v5++;
      *v6++ = -[TSDCKernelClock convertFromDomainToMachAbsoluteTime:](self, "convertFromDomainToMachAbsoluteTime:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return -[TSDCKernelClock convertFromTimeSyncTimeIntervalToDomainInterval:](self, "convertFromTimeSyncTimeIntervalToDomainInterval:", -[TSClock convertFromDomainIntervalToTimeSyncTimeInterval:](self->_translationClock, "convertFromDomainIntervalToTimeSyncTimeInterval:", -[TSClock convertFromMachAbsoluteIntervalToDomainInterval:](self->_translationClock, "convertFromMachAbsoluteIntervalToDomainInterval:", a3)));
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return -[TSClock convertFromDomainIntervalToMachAbsoluteInterval:](self->_translationClock, "convertFromDomainIntervalToMachAbsoluteInterval:", -[TSClock convertFromTimeSyncTimeIntervalToDomainInterval:](self->_translationClock, "convertFromTimeSyncTimeIntervalToDomainInterval:", -[TSDCKernelClock convertFromDomainIntervalToTimeSyncTimeInterval:](self, "convertFromDomainIntervalToTimeSyncTimeInterval:", a3)));
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  BOOL result;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = -1;
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  v16 = 0;
  if (!-[TSDCKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](self, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", &v22, &v21, &v20))
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v12)
      return result;
    *(_DWORD *)buf = 136316418;
    v24 = "[self getTimeSyncTimeRateRatioNumerator:&thisNumer denominator:&thisDenom timeSyncAnchor:&thisTSAnchor andDoma"
          "inAnchor:domainAnchor withError:error]";
    v25 = 2048;
    v26 = 0;
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v33 = 1024;
    v34 = 260;
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_22;
  }
  if (!-[TSClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](self->_translationClock, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", &v19, &v18, 0, 0, 0))
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14)
      return result;
    *(_DWORD *)buf = 136316418;
    v24 = "[_translationClock getTimeSyncTimeRateRatioNumerator:&transNumer denominator:&transDenom timeSyncAnchor:nil an"
          "dDomainAnchor:nil withError:nil]";
    v25 = 2048;
    v26 = 0;
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v33 = 1024;
    v34 = 262;
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_22;
  }
  if (!-[TSClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](self->_translationClock, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", &v17, &v16, 0, 0, 0))
  {
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v15)
      return result;
    *(_DWORD *)buf = 136316418;
    v24 = "[_translationClock getMachAbsoluteRateRatioNumerator:&machNumer denominator:&machDenom machAnchor:nil andDomai"
          "nAnchor:nil withError:nil]";
    v25 = 2048;
    v26 = 0;
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v33 = 1024;
    v34 = 264;
    v13 = MEMORY[0x1E0C81028];
LABEL_22:
    _os_log_impl(&dword_1B56CB000, v13, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return 0;
  }
  __C(v22, v19, v17, v21, v18, v16, a3, a4);
  if (a5)
    *a5 = -[TSClock convertFromDomainToMachAbsoluteTime:](self->_translationClock, "convertFromDomainToMachAbsoluteTime:", -[TSClock convertFromTimeSyncToDomainTime:](self->_translationClock, "convertFromTimeSyncToDomainTime:", v20));
  return 1;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  uint64_t validIndex;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "TSInvalidTime != timeSyncTime";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 287;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  else
  {
    validIndex = self->_validIndex;
    if (validIndex < 8)
      return TSTimeXtoTimeY(a3, self->_timeInfo[validIndex].timeSyncTime, self->_timeInfo[validIndex].timeSyncTimeInterval, self->_timeInfo[validIndex].domainTime, self->_timeInfo[validIndex].domainTimeInterval);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "workingIndex < INFO_ENTRY_COUNT";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 288;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  return -1;
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  uint64_t validIndex;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "TSInvalidTime != domainTime";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 301;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  else
  {
    validIndex = self->_validIndex;
    if (validIndex < 8)
      return TSTimeXtoTimeY(a3, self->_timeInfo[validIndex].domainTime, self->_timeInfo[validIndex].domainTimeInterval, self->_timeInfo[validIndex].timeSyncTime, self->_timeInfo[validIndex].timeSyncTimeInterval);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "workingIndex < INFO_ENTRY_COUNT";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 302;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  return -1;
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  BOOL result;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v14 = 136316418;
    v15 = "timeSyncTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 314;
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  v5 = a4;
  if (!a4)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v14 = 136316418;
    v15 = "domainTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 315;
    v12 = MEMORY[0x1E0C81028];
LABEL_12:
    _os_log_impl(&dword_1B56CB000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a3;
    v8 = a5;
    do
    {
      v9 = *v6++;
      *v5++ = -[TSDCKernelClock convertFromTimeSyncToDomainTime:](self, "convertFromTimeSyncToDomainTime:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  BOOL result;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v14 = 136316418;
    v15 = "timeSyncTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 332;
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  v5 = a3;
  if (!a3)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v14 = 136316418;
    v15 = "domainTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v24 = 1024;
    v25 = 333;
    v12 = MEMORY[0x1E0C81028];
LABEL_12:
    _os_log_impl(&dword_1B56CB000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a4;
    v8 = a5;
    do
    {
      v9 = *v5++;
      *v6++ = -[TSDCKernelClock convertFromDomainToTimeSyncTime:](self, "convertFromDomainToTimeSyncTime:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  uint64_t validIndex;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "TSInvalidTime != timeSyncInterval";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 351;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  else
  {
    validIndex = self->_validIndex;
    if (validIndex < 8)
      return TSIntervalXtoIntervalY(a3, self->_timeInfo[validIndex].timeSyncTimeInterval, self->_timeInfo[validIndex].domainTimeInterval);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "workingIndex < INFO_ENTRY_COUNT";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 352;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  return -1;
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  uint64_t validIndex;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "TSInvalidTime != domainInterval";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 365;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  else
  {
    validIndex = self->_validIndex;
    if (validIndex < 8)
      return TSIntervalXtoIntervalY(a3, self->_timeInfo[validIndex].domainTimeInterval, self->_timeInfo[validIndex].timeSyncTimeInterval);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "workingIndex < INFO_ENTRY_COUNT";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v15 = 1024;
      v16 = 366;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  return -1;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t validIndex;
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
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  validIndex = self->_validIndex;
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = -1;
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = "workingIndex < INFO_ENTRY_COUNT";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      v19 = 1024;
      v20 = 396;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
  }
  else
  {
    if (a3)
      *a3 = self->_timeInfo[validIndex].timeSyncTimeInterval;
    if (a4)
      *a4 = self->_timeInfo[validIndex].domainTimeInterval;
    if (a5)
      *a5 = self->_timeInfo[validIndex].timeSyncTime;
    if (a6)
      *a6 = self->_timeInfo[validIndex].domainTime;
  }
  return validIndex < 8;
}

- (void)_getInitialSyncInfo
{
  id v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "description");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = 136315138;
  v2 = objc_msgSend(v0, "UTF8String");
  _os_log_error_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error getting initial sync info \"%s\", (uint8_t *)&v1, 0xCu);

}

- (void)postLockStateChange:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  unint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v11 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) postLockStateChange:%d", buf, 0x12u);
  }
  -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__TSDCKernelClock_postLockStateChange___block_invoke;
    v8[3] = &unk_1E694B1B0;
    v8[4] = self;
    v9 = v3;
    dispatch_async(v6, v8);

  }
  else
  {
    -[TSDCKernelClock setLockState:](self, "setLockState:", v3);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  objc_msgSend(WeakRetained, "didChangeLockStateTo:", v3);

}

void __39__TSDCKernelClock_postLockStateChange___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "setLockState:", *(unsigned int *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)updateLockState:(int)a3
{
  uint64_t v3;
  int v5;
  unint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218240;
    v6 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) updateLockState:%d", (uint8_t *)&v5, 0x12u);
  }
  os_unfair_lock_lock(&self->_updateLock);
  self->_internalLockState = v3;
  if ((_DWORD)v3 == 2)
  {
    if (self->_validIndex >= 8)
      v3 = 1;
    else
      v3 = 2;
  }
  os_unfair_lock_unlock(&self->_updateLock);
  -[TSDCKernelClock postLockStateChange:](self, "postLockStateChange:", v3);
}

- (void)updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6
{
  int v11;
  unsigned int v12;
  uint64_t v13;
  Class *v14;
  double v15;
  void *v16;
  NSObject *v17;
  int internalLockState;
  unsigned int v20;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[6];
  mach_timebase_info info;
  unint64_t v26;
  unint64_t v27;
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

  v40 = *MEMORY[0x1E0C80C00];
  v11 = -[TSDCKernelClock lockState](self, "lockState");
  if (a3 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136316418;
    v29 = "timeSyncTime != TSInvalidTime";
    v30 = 2048;
    v31 = 0;
    v32 = 2048;
    v33 = 0;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v38 = 1024;
    v39 = 496;
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  if (a5 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136316418;
    v29 = "domainTime != TSInvalidTime";
    v30 = 2048;
    v31 = 0;
    v32 = 2048;
    v33 = 0;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v38 = 1024;
    v39 = 497;
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136316418;
    v29 = "timeSyncInterval > 0";
    v30 = 2048;
    v31 = 0;
    v32 = 2048;
    v33 = 0;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v38 = 1024;
    v39 = 498;
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  if (!a6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136316418;
    v29 = "domainInterval > 0";
    v30 = 2048;
    v31 = 0;
    v32 = 2048;
    v33 = 0;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    v38 = 1024;
    v39 = 499;
    v23 = MEMORY[0x1E0C81028];
LABEL_31:
    _os_log_impl(&dword_1B56CB000, v23, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return;
  }
  v12 = v11;
  os_unfair_lock_lock(&self->_updateLock);
  v13 = (self->_validIndex + 1) & 7;
  v14 = &self->super.isa + 4 * v13;
  v14[1] = (Class)a3;
  v14[2] = (Class)a5;
  v14[3] = (Class)a4;
  v14[4] = (Class)a6;
  self->_validIndex = v13;
  v26 = 0;
  v27 = 0;
  -[TSDCKernelClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](self, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", &v27, &v26, 0, 0, 0);
  info = 0;
  mach_timebase_info(&info);
  v26 /= info.denom;
  v27 /= info.numer;
  v15 = (double)v27 / (double)v26;
  -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__TSDCKernelClock_updateTimeSyncTime_timeSyncInterval_domainTime_domainInterval___block_invoke;
    block[3] = &unk_1E694B1D8;
    block[4] = self;
    *(double *)&block[5] = v15;
    dispatch_async(v17, block);

  }
  else
  {
    -[TSDCKernelClock setHostRateRatio:](self, "setHostRateRatio:", v15);
  }
  internalLockState = self->_internalLockState;
  if (v12 != 1 && internalLockState == 1)
    v20 = 1;
  else
    v20 = v12;
  if (v12 != 2 && internalLockState == 2)
    v22 = 2;
  else
    v22 = v20;
  os_unfair_lock_unlock(&self->_updateLock);
  if (v12 != (_DWORD)v22)
    -[TSDCKernelClock postLockStateChange:](self, "postLockStateChange:", v22);
}

void __81__TSDCKernelClock_updateTimeSyncTime_timeSyncInterval_domainTime_domainInterval___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "setHostRateRatio:", *(double *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)didResetClock:(id)a3
{
  id WeakRetained;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) didResetClock", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  objc_msgSend(WeakRetained, "didResetClock");

}

- (void)didChangeClockMasterForClock:(id)a3
{
  id WeakRetained;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) didChangeClockMasterForClock", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  objc_msgSend(WeakRetained, "didChangeClockMaster");

}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) didChangeLockStateTo", (uint8_t *)&v6, 0xCu);
  }
  -[TSDCKernelClock updateLockState:](self, "updateLockState:", v4);
}

- (void)updateCoreAudioReanchors:(unsigned int)a3
{
  -[_TSF_TSDKernelClock updateCoreAudioReanchors:](self->_kernelClock, "updateCoreAudioReanchors:", *(_QWORD *)&a3);
}

- (unsigned)getCoreAudioReanchors
{
  return -[_TSF_TSDKernelClock getCoreAudioReanchors](self->_kernelClock, "getCoreAudioReanchors");
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

- (double)hostRateRatio
{
  return self->_hostRateRatio;
}

- (void)setHostRateRatio:(double)a3
{
  self->_hostRateRatio = a3;
}

- (unsigned)validIndex
{
  return self->_validIndex;
}

- (void)setValidIndex:(unsigned int)a3
{
  self->_validIndex = a3;
}

- (TSClock)translationClock
{
  return self->_translationClock;
}

- (void)setTranslationClock:(id)a3
{
  objc_storeStrong((id *)&self->_translationClock, a3);
}

- (os_unfair_lock_s)updateLock
{
  return self->_updateLock;
}

- (void)setUpdateLock:(os_unfair_lock_s)a3
{
  self->_updateLock = a3;
}

- (int)internalLockState
{
  return self->_internalLockState;
}

- (void)setInternalLockState:(int)a3
{
  self->_internalLockState = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, a3);
}

- (TSKernelClock)client
{
  return (TSKernelClock *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_clockSync, 0);
  objc_storeStrong((id *)&self->_kernelClock, 0);
}

@end
