@implementation TSDCgPTPClock

- (TSDCgPTPClock)initWithKernelClock:(id)a3
{
  id v5;
  TSDCgPTPClock *v6;
  TSDCgPTPClock *v7;
  void *v8;
  uint64_t v9;
  TSClock *timeSyncClock;
  objc_super v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)TSDCgPTPClock;
    v6 = -[TSDCKernelClock initWithKernelClock:](&v12, sel_initWithKernelClock_, v5);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_gPTPClock, a3);
      +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeSyncClock");
      v9 = objc_claimAutoreleasedReturnValue();
      timeSyncClock = v7->_timeSyncClock;
      v7->_timeSyncClock = (TSClock *)v9;

      -[_TSF_TSDgPTPClock addImplClock:](v7->_gPTPClock, "addImplClock:", v7);
      -[TSDCgPTPClock _getInitialSyncInfo](v7, "_getInitialSyncInfo");
    }
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_TSF_TSDgPTPClock removeImplClock:](self->_gPTPClock, "removeImplClock:", self);
  v3.receiver = self;
  v3.super_class = (Class)TSDCgPTPClock;
  -[TSDCKernelClock dealloc](&v3, sel_dealloc);
}

- (id)clockName
{
  return 0;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return -[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:](self, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", a3, 0, 0);
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return -[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:](self, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:", a3, 0, 0);
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 143;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 144;
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
      *v5++ = -[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:](self, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", v9, 0, 0);
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 161;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 162;
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
      *v6++ = -[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:](self, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:", v9, 0, 0);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[TSDCKernelClock translationClock](self, "translationClock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "convertFromMachAbsoluteIntervalToDomainInterval:", a3);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "convertFromDomainIntervalToTimeSyncTimeInterval:", v6);

  return -[TSDCgPTPClock convertFromTimeSyncTimeIntervalToDomainInterval:](self, "convertFromTimeSyncTimeIntervalToDomainInterval:", v8);
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = -[TSDCgPTPClock convertFromDomainIntervalToTimeSyncTimeInterval:](self, "convertFromDomainIntervalToTimeSyncTimeInterval:", a3);
  -[TSDCKernelClock translationClock](self, "translationClock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "convertFromTimeSyncTimeIntervalToDomainInterval:", v4);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "convertFromDomainIntervalToMachAbsoluteInterval:", v6);

  return v8;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSDCgPTPClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a3, a4, a5, a6, 0, 0, a7);
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return -[TSDCgPTPClock convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:", a3, 0, 0);
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return -[TSDCgPTPClock convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3, 0, 0);
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL result;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
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
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v16 = 136316418;
    v17 = "timeSyncTime != NULL";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v26 = 1024;
    v27 = 210;
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v5 = a4;
  if (!a4)
  {
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v15)
      return result;
    v16 = 136316418;
    v17 = "domainTime != NULL";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v26 = 1024;
    v27 = 211;
    v14 = MEMORY[0x1E0C81028];
LABEL_14:
    _os_log_impl(&dword_1B56CB000, v14, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a3;
    v8 = a5;
    do
    {
      v10 = *v6++;
      v9 = v10;
      v11 = -1;
      if (v10)
        v11 = -[TSDCgPTPClock convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:", v9, 0, 0);
      *v5++ = v11;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 235;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 236;
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
      *v6++ = -[TSDCgPTPClock convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:", v9, 0, 0);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  unsigned int v5;
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
  v5 = -[TSDCKernelClock validIndex](self, "validIndex");
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "TSInvalidTime != timeSyncInterval";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      v17 = 1024;
      v18 = 254;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  else
  {
    if (v5 < 8)
      return scaledInterval(a3, self->_timeInfo[(unint64_t)v5].cumulativeScaledRate);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "workingIndex < INFO_ENTRY_COUNT";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      v17 = 1024;
      v18 = 255;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  return -1;
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  unsigned int v5;
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
  v5 = -[TSDCKernelClock validIndex](self, "validIndex");
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "TSInvalidTime != domainInterval";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      v17 = 1024;
      v18 = 268;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  else
  {
    if (v5 < 8)
      return scaledInterval(a3, self->_timeInfo[(unint64_t)v5].inverseCumulativeScaledRate);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "workingIndex < INFO_ENTRY_COUNT";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      v17 = 1024;
      v18 = 269;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  return -1;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSDCgPTPClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a3, a4, a5, a6, 0, 0, a7);
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  int v15;
  int v17;
  const char *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v17 = 136315138;
    v18 = "-[TSDCgPTPClock gPTPTimeFromMachAbsoluteTime:]";
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v17, 0xCu);
  }

  -[TSDCKernelClock translationClock](self, "translationClock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "convertFromMachAbsoluteToDomainTime:", a3);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "convertFromDomainToTimeSyncTime:", v8);

  -[TSDCgPTPClock gPTPTimeFromTimeSyncTime:](self, "gPTPTimeFromTimeSyncTime:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(v11, "seconds");
    v15 = objc_msgSend(v11, "nanoseconds");
    v17 = 136316418;
    v18 = "-[TSDCgPTPClock gPTPTimeFromMachAbsoluteTime:]";
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = v8;
    v23 = 2048;
    v24 = v10;
    v25 = 2048;
    v26 = v14;
    v27 = 1024;
    v28 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v12, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1B571F9B9, "%s MachAbsoluteTime=%llu intermediateTime=%llu timeSyncTime=%llu gPTPTime.seconds=%llu gPTPTime.nanoseconds=%u", (uint8_t *)&v17, 0x3Au);
  }

  return v11;
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  int v15;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v17 = 136315138;
    v18 = "-[TSDCgPTPClock machAbsoluteFromgPTPTime:]";
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v17, 0xCu);
  }

  v7 = -[TSDCgPTPClock timeSyncTimeFromgPTPTime:](self, "timeSyncTimeFromgPTPTime:", v4);
  -[TSDCKernelClock translationClock](self, "translationClock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "convertFromTimeSyncToDomainTime:", v7);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "convertFromDomainToMachAbsoluteTime:", v9);

  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(v4, "seconds");
    v15 = objc_msgSend(v4, "nanoseconds");
    v17 = 136316418;
    v18 = "-[TSDCgPTPClock machAbsoluteFromgPTPTime:]";
    v19 = 2048;
    v20 = v14;
    v21 = 1024;
    v22 = v15;
    v23 = 2048;
    v24 = v7;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v11;
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v12, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1B571F9B9, "%s gPTPTime.seconds=%llu gPTPTime.nanoseconds=%u timeSyncTime=%llu intermediateTime=%llu MachAbsoluteTime=%llu", (uint8_t *)&v17, 0x3Au);
  }

  return v11;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  os_signpost_id_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v15 = 136315138;
    v16 = "-[TSDCgPTPClock convertFrom32BitASToMachAbsoluteTime:]";
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v15, 0xCu);
  }

  v7 = -[TSDCgPTPClock convertFrom32BitASToTimeSyncTime:](self, "convertFrom32BitASToTimeSyncTime:", v3);
  -[TSDCKernelClock translationClock](self, "translationClock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "convertFromTimeSyncToDomainTime:", v7);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "convertFromDomainToMachAbsoluteTime:", v9);

  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = 136316162;
    v16 = "-[TSDCgPTPClock convertFrom32BitASToMachAbsoluteTime:]";
    v17 = 1024;
    v18 = v3;
    v19 = 2048;
    v20 = v7;
    v21 = 2048;
    v22 = v9;
    v23 = 2048;
    v24 = v11;
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v12, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1B571F9B9, "%s domainTime=%u timeSyncTime=%llu intermediateTime=%llu MachAbsoluteTime=%llu", (uint8_t *)&v15, 0x30u);
  }

  return v11;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unsigned int *v6;
  uint64_t v8;
  unsigned int v9;
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
    v15 = "domain32Time != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 327;
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
    v15 = "machAbsoluteTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 328;
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
      *v5++ = -[TSDCgPTPClock convertFrom32BitASToMachAbsoluteTime:](self, "convertFrom32BitASToMachAbsoluteTime:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  int v19;
  const char *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v19 = 136315138;
    v20 = "-[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:]";
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v19, 0xCu);
  }

  -[TSDCKernelClock translationClock](self, "translationClock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "convertFromMachAbsoluteToDomainTime:", a3);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "convertFromDomainToTimeSyncTime:", v12);

  v15 = -[TSDCgPTPClock convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:", v14, a4, a5);
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v19 = 136316162;
    v20 = "-[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:]";
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = v12;
    v25 = 2048;
    v26 = v14;
    v27 = 2048;
    v28 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v16, OS_SIGNPOST_INTERVAL_END, v17, (const char *)&unk_1B571F9B9, "%s machAbsoluteTime=%llu intermediateTime=%llu timeSyncTime=%llu domainTime=%llu", (uint8_t *)&v19, 0x34u);
  }

  return v15;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  NSObject *v9;
  os_signpost_id_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  int v19;
  const char *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v19 = 136315138;
    v20 = "-[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]";
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v19, 0xCu);
  }

  v11 = -[TSDCgPTPClock convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3, a4, a5);
  -[TSDCKernelClock translationClock](self, "translationClock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "convertFromTimeSyncToDomainTime:", v11);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "convertFromDomainToMachAbsoluteTime:", v13);

  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v19 = 136316162;
    v20 = "-[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]";
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = v11;
    v25 = 2048;
    v26 = v13;
    v27 = 2048;
    v28 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B56CB000, v16, OS_SIGNPOST_INTERVAL_END, v17, (const char *)&unk_1B571F9B9, "%s domainTime=%llu timeSyncTime=%llu intermediateTime=%llu  machAbsoluteTime=%llu", (uint8_t *)&v19, 0x34u);
  }

  return v15;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  BOOL result;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = -1;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  if (!-[TSDCgPTPClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", &v30, &v29, &v28, a9))
  {
    v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v20)
      return result;
    *(_DWORD *)buf = 136316418;
    v32 = "[self getTimeSyncTimeRateRatioNumerator:&thisNumer denominator:&thisDenom timeSyncAnchor:&thisTSAnchor andDoma"
          "inAnchor:domainAnchor forGrandmasterIdentity:grandmasterIdentity portNumber:portNumber withError:error]";
    v33 = 2048;
    v34 = 0;
    v35 = 2048;
    v36 = 0;
    v37 = 2080;
    v38 = "";
    v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v41 = 1024;
    v42 = 392;
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_22;
  }
  -[TSDCKernelClock translationClock](self, "translationClock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", &v27, &v26, 0, 0, 0);

  if ((v14 & 1) == 0)
  {
    v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v22)
      return result;
    *(_DWORD *)buf = 136316418;
    v32 = "[self.translationClock getTimeSyncTimeRateRatioNumerator:&transNumer denominator:&transDenom timeSyncAnchor:ni"
          "l andDomainAnchor:nil withError:nil]";
    v33 = 2048;
    v34 = 0;
    v35 = 2048;
    v36 = 0;
    v37 = 2080;
    v38 = "";
    v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v41 = 1024;
    v42 = 394;
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_22;
  }
  -[TSDCKernelClock translationClock](self, "translationClock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", &v25, &v24, 0, 0, 0);

  if ((v16 & 1) == 0)
  {
    v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v23)
      return result;
    *(_DWORD *)buf = 136316418;
    v32 = "[self.translationClock getMachAbsoluteRateRatioNumerator:&machNumer denominator:&machDenom machAnchor:nil andD"
          "omainAnchor:nil withError:nil]";
    v33 = 2048;
    v34 = 0;
    v35 = 2048;
    v36 = 0;
    v37 = 2080;
    v38 = "";
    v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v41 = 1024;
    v42 = 396;
    v21 = MEMORY[0x1E0C81028];
LABEL_22:
    _os_log_impl(&dword_1B56CB000, v21, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return 0;
  }
  __C(v30, v27, v25, v29, v26, v24, a3, a4);
  if (a5)
  {
    -[TSDCKernelClock translationClock](self, "translationClock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDCKernelClock translationClock](self, "translationClock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v17, "convertFromDomainToMachAbsoluteTime:", objc_msgSend(v18, "convertFromTimeSyncToDomainTime:", v28));

  }
  return 1;
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock addLinkLayerPortOnInterfaceNamed:allocatedPortNumber:error:](self->_gPTPClock, "addLinkLayerPortOnInterfaceNamed:allocatedPortNumber:error:", a3, a4, a5);
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPClock removeLinkLayerPortFromInterfaceNamed:error:](self->_gPTPClock, "removeLinkLayerPortFromInterfaceNamed:error:", a3, a4);
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addUnicastUDPv4PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_gPTPClock, "addUnicastUDPv4PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, *(_QWORD *)&a4, a5, a6);
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeUnicastUDPv4PtPPortFromInterfaceNamed:withDestinationAddress:error:](self->_gPTPClock, "removeUnicastUDPv4PtPPortFromInterfaceNamed:withDestinationAddress:error:", a3, *(_QWORD *)&a4, a5);
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addUnicastUDPv6PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_gPTPClock, "addUnicastUDPv6PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeUnicastUDPv6PtPPortFromInterfaceNamed:withDestinationAddress:error:](self->_gPTPClock, "removeUnicastUDPv6PtPPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addUnicastLinkLayerPtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_gPTPClock, "addUnicastLinkLayerPtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeUnicastLinkLayerPtPPortFromInterfaceNamed:withDestinationAddress:error:](self->_gPTPClock, "removeUnicastLinkLayerPtPPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_gPTPClock, "addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, *(_QWORD *)&a4, a5, a6);
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:](self->_gPTPClock, "removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:", a3, *(_QWORD *)&a4, a5);
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_gPTPClock, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:](self->_gPTPClock, "removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_gPTPClock, "addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeUnicastLinkLayerEtEPortFromInterfaceNamed:withDestinationAddress:error:](self->_gPTPClock, "removeUnicastLinkLayerEtEPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (NSArray)ports
{
  return -[_TSF_TSDgPTPClock ports](self->_gPTPClock, "ports");
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  return -[_TSF_TSDgPTPClock portWithPortNumber:](self->_gPTPClock, "portWithPortNumber:", a3);
}

- (id)getMetrics
{
  -[_TSF_TSDgPTPClock getMetrics](self->_gPTPClock, "getMetrics");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getMetricsWithDelta:(id)a3
{
  -[_TSF_TSDgPTPClock getMetricsWithDelta:](self->_gPTPClock, "getMetricsWithDelta:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  -[TSDCKernelClock translationClock](self, "translationClock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "convertFromMachAbsoluteToDomainTime:", a3);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "convertFromDomainToTimeSyncTime:", v10);

  v13 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:", v12, a4, a5);
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v6 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3.var0, a3.var1, a4, a5);
  -[TSDCKernelClock translationClock](self, "translationClock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "convertFromTimeSyncToDomainTime:", v6);

  -[TSDCKernelClock translationClock](self, "translationClock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "convertFromDomainToMachAbsoluteTime:", v8);

  return v10;
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  TSgPTPTime *v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  TSgPTPTime *v13;
  uint64_t v15;
  unint64_t v16[5];
  uint64_t v17[2];
  __int128 v18;
  unsigned __int16 v19;
  uint64_t v20;
  unint64_t v21;

  v20 = 0;
  v21 = 0;
  v19 = 0;
  v3 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:flags:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:flags:", a3, &v20, &v19, &v21);
  v5 = 0;
  if (v3 != -1 || v4 != -1)
  {
    v7 = v21 & 1;
    v8 = (v21 >> 1) & 1;
    v9 = (v21 >> 2) & 1;
    *(_QWORD *)&v18 = v4;
    *((_QWORD *)&v18 + 1) = v3;
    *(_OWORD *)v16 = xmmword_1B571F740;
    v17[0] = IOTS_U128::operator/(&v18, v16);
    v17[1] = v10;
    operator*(v17, 1000000000, (uint64_t)v16);
    v11 = v16[0];
    v12 = v18;
    v13 = [TSgPTPTime alloc];
    LOBYTE(v15) = v9;
    v5 = -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:](v13, "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", v17[0], (v12 - v11), v20, v19, v7, v8, v15);
  }
  return v5;
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a3;
  v5 = IOTS_uint64mul(objc_msgSend(v4, "seconds"), 1000000000);
  v7 = v6;
  v8 = objc_msgSend(v4, "nanoseconds");
  LODWORD(v9) = __CFADD__(v5, v8);
  if (v5 + v8 < v5)
    v9 = 1;
  else
    v9 = v9;
  v10 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", v7 + v9);

  return v10;
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  unint64_t v4;
  const char *v5;
  const char *v6;
  unint64_t v7;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  unint64_t v34;
  unint64_t v35;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v40 = -1;
  v39 = -1;
  v34 = -[TSClock convertFromMachAbsoluteToDomainTime:](self->_timeSyncClock, "convertFromMachAbsoluteToDomainTime:", mach_absolute_time());
  v4 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:");
  v35 = v4;
  v6 = v5;
  v7 = -1;
  if (v4 == -1 && v5 == (const char *)-1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return v7;
    *(_DWORD *)buf = 136316418;
    v42 = "tsNow.hi != TSInvalidTime || tsNow.lo != TSInvalidTime";
    v43 = 2048;
    v44 = 0;
    v45 = 2048;
    v46 = 0;
    v47 = 2080;
    v48 = "";
    v49 = 2080;
    v50 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v51 = 1024;
    LODWORD(v52) = 581;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
    v32 = 58;
    goto LABEL_64;
  }
  v9 = (unint64_t)v5 & 0xFFFFFFFF00000000 | a3;
  v10 = (unint64_t)v5 >> 32 == 0;
  v11 = v9 - 0x100000000;
  v12 = v9 + 0x100000000;
  v13 = v9 > 0xFFFFFFFEFFFFFFFFLL;
  if (v9 <= 0xFFFFFFFEFFFFFFFFLL)
    v14 = v4;
  else
    v14 = v4 + 1;
  if (v9 <= (unint64_t)v5)
    v15 = (unint64_t)&v5[-v9];
  else
    v15 = v9 - (_QWORD)v5;
  v16 = (__PAIR128__(v4, (unint64_t)v5 >> 32) - 1) >> 64;
  if (v11 <= (unint64_t)v5)
    v10 = 1;
  if ((__PAIR128__(v4, (unint64_t)v5 >> 32) - 1) >> 64 <= v4 && v10)
    v17 = (unint64_t)&v5[-v11];
  else
    v17 = v11 - (_QWORD)v5;
  if (v12 <= (unint64_t)v5)
    v13 = 1;
  if (v14 <= v4 && v13)
    v18 = (unint64_t)&v5[-v12];
  else
    v18 = v12 - (_QWORD)v5;
  v38 = -1;
  v37 = -1;
  if (v15 <= v17 && v15 <= v18)
  {
    if (v15 <= 0x59682EFF)
    {
      v25 = 0;
      goto LABEL_48;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219008;
      v42 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
      v43 = 2048;
      v44 = 1500;
      v45 = 2048;
      v46 = v15;
      v47 = 2048;
      v48 = (const char *)v17;
      v49 = 2048;
      v50 = (const char *)v18;
      v22 = MEMORY[0x1E0C81028];
      v23 = "TSDCgPTPClock(0x%016llx): Converted a 32 time with spliced which is more than %llu milliseconds from now. no"
            "wSplicedDiffMag %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n";
      v24 = 52;
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  if (v17 > v15 || v17 > v18)
  {
    if (v18 > v15 || v18 > v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v42 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
        v43 = 2048;
        v44 = v15;
        v45 = 2048;
        v46 = v17;
        v47 = 2048;
        v48 = (const char *)v18;
        v22 = MEMORY[0x1E0C81028];
        v23 = "TSDCgPTPClock(0x%016llx): Converted a 32 time which didn't match a closest one condition. nowSplicedDiffMa"
              "g %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n";
        v24 = 42;
LABEL_41:
        _os_log_impl(&dword_1B56CB000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
      }
LABEL_42:
      v25 = 1;
LABEL_48:
      v16 = v35;
      goto LABEL_57;
    }
    if (v18 <= 0x59682EFF)
    {
      v25 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
        *(_DWORD *)buf = 134219008;
        v42 = (const char *)v27;
        v43 = 2048;
        v44 = 1500;
        v45 = 2048;
        v46 = v15;
        v47 = 2048;
        v48 = (const char *)v17;
        v49 = 2048;
        v50 = (const char *)v18;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 32 time with future which is more than %llu milliseconds from now. nowSplicedDiffMag %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n", buf, 0x34u);
      }
      v25 = 1;
    }
    v16 = v14;
    v9 += 0x100000000;
  }
  else
  {
    if (v17 <= 0x59682EFF)
    {
      v25 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
        *(_DWORD *)buf = 134219008;
        v42 = (const char *)v26;
        v43 = 2048;
        v44 = 1500;
        v45 = 2048;
        v46 = v15;
        v47 = 2048;
        v48 = (const char *)v17;
        v49 = 2048;
        v50 = (const char *)v18;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 32 time with past which is more than %llu milliseconds from now. nowSplicedDiffMag %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n", buf, 0x34u);
      }
      v25 = 1;
    }
    v9 -= 0x100000000;
  }
LABEL_57:
  v7 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", v16, v9, &v38, &v37);
  if ((v40 != v38 || v39 != v37) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v28 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    *(_DWORD *)buf = 134218496;
    v42 = (const char *)v28;
    v43 = 2048;
    v44 = v40;
    v45 = 2048;
    v46 = v38;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 32 time with the expansion performed on a different GrandMaster 0x%016llx than the conversion 0x%016llx.\n", buf, 0x20u);
  }
  if (v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v29 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    *(_DWORD *)buf = 134220288;
    v42 = (const char *)v29;
    v43 = 2048;
    v44 = (uint64_t)v6;
    v45 = 2048;
    v46 = v35;
    v47 = 2048;
    v48 = v6;
    v49 = 2048;
    v50 = (const char *)v34;
    v51 = 2048;
    v52 = v9;
    v53 = 2048;
    v54 = v16;
    v55 = 2048;
    v56 = v9;
    v57 = 2048;
    v58 = v7;
    v59 = 2048;
    v60 = &v6[-v9];
    v30 = MEMORY[0x1E0C81028];
    v31 = "TSDCgPTPClock(0x%016llx): Now gPTP %llu (%llx.%016llx) now mach %llu convert gPTP %llu (%llx.%016llx) mach %llu diff %lld\n";
    v32 = 102;
LABEL_64:
    _os_log_impl(&dword_1B56CB000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
  }
  return v7;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  unint64_t *v5;
  unsigned int *v6;
  uint64_t v8;
  unsigned int v9;
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
    v15 = "domain32Time != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 661;
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
    v15 = "timeSyncTime != NULL";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v24 = 1024;
    v25 = 662;
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
      *v5++ = -[TSDCgPTPClock convertFrom32BitASToTimeSyncTime:](self, "convertFrom32BitASToTimeSyncTime:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5;

  -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:", a3, a4, a5);
  return v5;
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  BOOL v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  BOOL v23;
  BOOL v25;
  char v26;
  BOOL v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v35;
  const char *v36;
  unsigned __int16 v39;
  unint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  const char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v42 = -1;
  v41 = -1;
  v35 = -[TSClock convertFromMachAbsoluteToDomainTime:](self->_timeSyncClock, "convertFromMachAbsoluteToDomainTime:", mach_absolute_time());
  v7 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:");
  v9 = v7;
  v10 = v8;
  v11 = -1;
  if (v7 != -1 || v8 != (const char *)-1)
  {
    v13 = a3 - (_QWORD)v8;
    v36 = &v8[-a3];
    if ((unint64_t)v8 >= a3)
      v14 = (unint64_t)&v8[-a3];
    else
      v14 = a3 - (_QWORD)v8;
    if (v7)
    {
      v15 = (unint64_t)v8 >= a3;
      if (v7 == -1)
      {
        if ((unint64_t)v8 < a3)
          v17 = -2;
        else
          v17 = -1;
        v13 = (unint64_t)&v8[-a3];
        v16 = (unint64_t)&v8[-a3];
LABEL_20:
        v40 = -1;
        v39 = -1;
        if (v15)
          v18 = 1;
        else
          v18 = v16 >= v14;
        if (v18)
        {
          if (v17)
            v19 = 1;
          else
            v19 = v13 >= v14;
          if (v19)
          {
            if (v14 <= 0x8BB2C96FFFLL)
            {
              v31 = 0;
              goto LABEL_70;
            }
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
LABEL_68:
              v31 = 1;
LABEL_70:
              v28 = v9;
              goto LABEL_71;
            }
            *(_DWORD *)buf = 134219776;
            v44 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
            v45 = 2048;
            v46 = 600000;
            v47 = 2048;
            v48 = 0;
            v49 = 2048;
            v50 = (const char *)v14;
            v51 = 2048;
            v52 = (const char *)v15;
            v53 = 2048;
            v54 = v16;
            v55 = 2048;
            v56 = v17;
            v57 = 2048;
            v58 = v13;
            v20 = MEMORY[0x1E0C81028];
            v21 = "TSDCgPTPClock(0x%016llx): Converted a 64 time with spliced which is more than %llu milliseconds from n"
                  "ow. nowSplicedDiffMag %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
            v22 = 82;
LABEL_67:
            _os_log_impl(&dword_1B56CB000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
            goto LABEL_68;
          }
          if (v15)
            v23 = 0;
          else
            v23 = v14 >= v16;
          if (v23 && v13 >= v16)
          {
LABEL_59:
            v28 = v7 - 1;
            if (v16 > 0x8BB2C96FFFLL)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134219776;
                v44 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
                v45 = 2048;
                v46 = 600000;
                v47 = 2048;
                v48 = 0;
                v49 = 2048;
                v50 = (const char *)v14;
                v51 = 2048;
                v52 = (const char *)v15;
                v53 = 2048;
                v54 = v16;
                v55 = 2048;
                v56 = v17;
                v57 = 2048;
                v58 = v13;
                v29 = MEMORY[0x1E0C81028];
                v30 = "TSDCgPTPClock(0x%016llx): Converted a 64 time with past which is more than %llu milliseconds from "
                      "now. nowSplicedDiffMag %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
                goto LABEL_62;
              }
              goto LABEL_63;
            }
            goto LABEL_64;
          }
        }
        else if (v17 == v15)
        {
          if (v13 >= v16)
            goto LABEL_59;
        }
        else if (v17 > v15)
        {
          goto LABEL_59;
        }
        if (v15)
          v25 = 1;
        else
          v25 = v16 >= v13;
        v26 = !v25;
        if (v17)
          v27 = 0;
        else
          v27 = v14 >= v13;
        if (v27 && (v26 & 1) == 0)
        {
          v28 = v7 + 1;
          if (v13 > 0x8BB2C96FFFLL)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134219776;
              v44 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
              v45 = 2048;
              v46 = 600000;
              v47 = 2048;
              v48 = 0;
              v49 = 2048;
              v50 = (const char *)v14;
              v51 = 2048;
              v52 = (const char *)v15;
              v53 = 2048;
              v54 = v16;
              v55 = 2048;
              v56 = 0;
              v57 = 2048;
              v58 = v13;
              v29 = MEMORY[0x1E0C81028];
              v30 = "TSDCgPTPClock(0x%016llx): Converted a 64 time with future which is more than %llu milliseconds from "
                    "now. nowSplicedDiffMag %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
LABEL_62:
              _os_log_impl(&dword_1B56CB000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x52u);
            }
LABEL_63:
            v31 = 1;
LABEL_71:
            v11 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", v28, a3, &v40, &v39);
            if ((v42 != v40 || (unsigned __int16)v41 != v39)
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v32 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
              *(_DWORD *)buf = 134218496;
              v44 = (const char *)v32;
              v45 = 2048;
              v46 = v42;
              v47 = 2048;
              v48 = v40;
              _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 64 time with the expansion performed on a different GrandMaster 0x%016llx than the conversion 0x%016llx.\n", buf, 0x20u);
            }
            if (v31 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v33 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
              *(_DWORD *)buf = 134220288;
              v44 = (const char *)v33;
              v45 = 2048;
              v46 = (uint64_t)v10;
              v47 = 2048;
              v48 = v9;
              v49 = 2048;
              v50 = v10;
              v51 = 2048;
              v52 = (const char *)v35;
              v53 = 2048;
              v54 = a3;
              v55 = 2048;
              v56 = v28;
              v57 = 2048;
              v58 = a3;
              v59 = 2048;
              v60 = v11;
              v61 = 2048;
              v62 = v36;
              _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Now gPTP %llu (%llx.%016llx) now mach %llu convert gPTP %llu (%llx.%016llx) mach %llu diff %lld\n", buf, 0x66u);
            }
            if (a4)
              *a4 = v40;
            if (a5)
              *a5 = v39;
            return v11;
          }
LABEL_64:
          v31 = 0;
          goto LABEL_71;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        *(_DWORD *)buf = 134219520;
        v44 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
        v45 = 2048;
        v46 = 0;
        v47 = 2048;
        v48 = v14;
        v49 = 2048;
        v50 = (const char *)v15;
        v51 = 2048;
        v52 = (const char *)v16;
        v53 = 2048;
        v54 = v17;
        v55 = 2048;
        v56 = v13;
        v20 = MEMORY[0x1E0C81028];
        v21 = "TSDCgPTPClock(0x%016llx): Converted a 64 time which didn't match a closest one condition. nowSplicedDiffMa"
              "g %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
        v22 = 72;
        goto LABEL_67;
      }
      v16 = (unint64_t)&v8[-a3];
    }
    else
    {
      if ((unint64_t)v8 > a3)
        v15 = -2;
      else
        v15 = -1;
      v16 = a3 - (_QWORD)v8;
    }
    v17 = (unint64_t)v8 <= a3;
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v44 = "tsNow.hi != TSInvalidTime || tsNow.lo != TSInvalidTime";
    v45 = 2048;
    v46 = 0;
    v47 = 2048;
    v48 = 0;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v53 = 1024;
    LODWORD(v54) = 691;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v11;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  unsigned int v16;
  unsigned int v17;
  int v19;
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
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v16 = -[TSDCKernelClock validIndex](self, "validIndex");
  v17 = v16;
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = -1;
  if (a7)
    *a7 = -1;
  if (a8)
    *a8 = -1;
  if (v16 >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316418;
      v20 = "workingIndex < INFO_ENTRY_COUNT";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      v29 = 1024;
      v30 = 803;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v19, 0x3Au);
    }
  }
  else
  {
    if (a3)
      *a3 = self->_timeInfo[(unint64_t)v16].cumulativeScaledRate;
    if (a4)
      *a4 = 0x20000000000;
    if (a5)
      *a5 = self->_timeInfo[(unint64_t)v16].timeSyncTime;
    if (a6)
      *a6 = self->_timeInfo[(unint64_t)v16].domainTime.lo;
    if (a7)
      *a7 = self->_timeInfo[(unint64_t)v16].grandmasterID;
    if (a8)
      *a8 = self->_timeInfo[(unint64_t)v16].localPortNumber;
  }
  return v17 < 8;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5;
  unint64_t v6;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v5 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:flags:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:flags:", a3, a4, a5, 0);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5 flags:(unint64_t *)a6
{
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v15;
  unint64_t v16;
  $D23876D9C6E9C834D747CE0E6328BA34 *timeInfo;
  unint64_t *v18;
  $D23876D9C6E9C834D747CE0E6328BA34 *v19;
  unint64_t timeSyncTime;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t *p_lo;
  unint64_t hi;
  unint64_t v26;
  BOOL v27;
  unsigned __int128 v28;
  _BOOL4 v29;
  uint64_t v30;
  unsigned __int16 *v31;
  _BOOL4 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  $D23876D9C6E9C834D747CE0E6328BA34 *v36;
  unint64_t v37;
  unsigned int syncFlags;
  unint64_t v39;
  uint64_t v40;
  unsigned __int16 *v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = -1;
  v12 = -[TSDCKernelClock validIndex](self, "validIndex");
  v13 = v12;
  if (a3 == -1 || v12 == -1)
  {
    if (v12 == -1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Attempting to convert from Mach but index == -1\n", buf, 0xCu);
    }
    if (a4)
      *a4 = -1;
    if (a5)
      *a5 = -1;
    if (!a6)
      goto LABEL_33;
    goto LABEL_14;
  }
  timeInfo = self->_timeInfo;
  if (!self->_timeInfo[(unint64_t)v12].syncInfoValid)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v43 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
      v44 = 1024;
      LODWORD(v45) = v13;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Attempting to convert from Mach but sync info at index %u is not valid\n", buf, 0x12u);
    }
    if (a4)
      *a4 = -1;
    if (a5)
      *a5 = -1;
    if (!a6)
    {
LABEL_33:
      v16 = -1;
      goto LABEL_53;
    }
LABEL_14:
    v15 = 0x8000000000000000;
    v16 = -1;
LABEL_52:
    *a6 = v15;
    goto LABEL_53;
  }
  v41 = a5;
  v18 = a6;
  v40 = v12;
  v19 = &timeInfo[(unint64_t)v12];
  timeSyncTime = v19->timeSyncTime;
  if (timeSyncTime <= a3)
    v21 = a3 - timeSyncTime;
  else
    v21 = timeSyncTime - a3;
  v22 = scaledInterval(v21, v19->cumulativeScaledRate);
  v23 = v22;
  p_lo = &v19->domainTime.lo;
  hi = v19->domainTime.hi;
  if (timeSyncTime <= a3)
  {
    v11 = *p_lo + v22;
    v29 = __CFADD__(*p_lo, v22);
    v30 = v11 < *p_lo || v29;
    v16 = hi + v30;
    a6 = v18;
    goto LABEL_41;
  }
  v26 = *p_lo;
  if (hi)
    v27 = 1;
  else
    v27 = v26 > v22;
  a6 = v18;
  if (v27)
  {
    v28 = __PAIR128__(hi, v26) - v22;
    v16 = *((_QWORD *)&v28 + 1);
    v11 = v28;
LABEL_41:
    v31 = v41;
    goto LABEL_45;
  }
  v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  v31 = v41;
  if (v32)
  {
    v33 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v34 = -[TSClock convertFromMachAbsoluteToDomainTime:](self->_timeSyncClock, "convertFromMachAbsoluteToDomainTime:", mach_absolute_time());
    v35 = *p_lo;
    *(_DWORD *)buf = 134219008;
    v43 = v33;
    v44 = 2048;
    v45 = a3;
    v46 = 2048;
    v47 = v34;
    v48 = 2048;
    v49 = v23;
    v50 = 2048;
    v51 = v35;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Trying to convert from a timesync time nanosecond time %llu (%llu) that would result in a negative gPTP time %llu %llu\n", buf, 0x34u);
  }
  v16 = -1;
LABEL_45:
  if (a4)
    *a4 = timeInfo[v40].grandmasterID;
  if (v31)
    *v31 = timeInfo[v40].localPortNumber;
  if (a6)
  {
    v36 = &timeInfo[v40];
    v37 = ((unint64_t)v36->syncFlags >> 3) & 1;
    *a6 = v37;
    syncFlags = v36->syncFlags;
    if ((syncFlags & 0x30) != 0)
    {
      v15 = (syncFlags >> 3) & 6 | v37;
      goto LABEL_52;
    }
  }
LABEL_53:
  v39 = v11;
  result.var1 = v39;
  result.var0 = v16;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t var1;
  unint64_t var0;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  $D23876D9C6E9C834D747CE0E6328BA34 *timeInfo;
  uint64_t v14;
  $D23876D9C6E9C834D747CE0E6328BA34 *v15;
  unint64_t lo;
  unint64_t hi;
  BOOL v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  unint64_t v22;
  unint64_t *p_timeSyncTime;
  unint64_t timeSyncTime;
  unint64_t v25;
  unsigned __int16 localPortNumber;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  var1 = a3.var1;
  var0 = a3.var0;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = -1;
  v11 = -[TSDCKernelClock validIndex](self, "validIndex");
  v12 = v11;
  if (var0 == -1)
  {
    if (var1 == -1 || v11 == -1)
    {
      if (v11 != -1)
        goto LABEL_21;
      goto LABEL_14;
    }
  }
  else if (v11 == -1)
  {
LABEL_14:
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v31 = 134217984;
    v32 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v19 = MEMORY[0x1E0C81028];
    v20 = "TSDCgPTPClock(0x%016llx): Attempting to convert to Mach but index == -1\n";
    v21 = 12;
    goto LABEL_20;
  }
  timeInfo = self->_timeInfo;
  if (!self->_timeInfo[(unint64_t)v11].syncInfoValid)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v31 = 134218240;
    v32 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v33 = 1024;
    LODWORD(v34) = v12;
    v19 = MEMORY[0x1E0C81028];
    v20 = "TSDCgPTPClock(0x%016llx): Attempting to convert to Mach but sync info at index %u is not valid\n";
    v21 = 18;
LABEL_20:
    _os_log_impl(&dword_1B56CB000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v31, v21);
LABEL_21:
    if (a4)
      *a4 = -1;
    if (a5)
    {
      localPortNumber = -1;
LABEL_31:
      *a5 = localPortNumber;
      return v10;
    }
    return v10;
  }
  v14 = v11;
  v15 = &timeInfo[(unint64_t)v11];
  lo = v15->domainTime.lo;
  hi = v15->domainTime.hi;
  if (hi > var0 || (hi == var0 ? (v18 = lo > var1) : (v18 = 0), v18))
  {
    v22 = scaledInterval(lo - var1, v15->inverseCumulativeScaledRate);
    timeSyncTime = v15->timeSyncTime;
    p_timeSyncTime = &v15->timeSyncTime;
    v25 = timeSyncTime - v22;
    if (timeSyncTime <= v22)
    {
      v27 = v22;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v28 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
        v29 = *p_timeSyncTime;
        v31 = 134219520;
        v32 = v28;
        v33 = 2048;
        v34 = var0;
        v35 = 2048;
        v36 = var1;
        v37 = 2048;
        v38 = var1;
        v39 = 2048;
        v40 = v27;
        v41 = 2048;
        v42 = v29;
        v43 = 2048;
        v44 = mach_absolute_time();
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Trying to convert from a gPTP time %llx.%016llx (%llu) that would result in a negative mach_absolute time %llu %llu %llu\n", (uint8_t *)&v31, 0x48u);
      }
    }
    else
    {
      v10 = v25;
    }
  }
  else
  {
    v10 = timeInfo[(unint64_t)v11].timeSyncTime
        + scaledInterval(var1 - lo, timeInfo[(unint64_t)v11].inverseCumulativeScaledRate);
  }
  if (a4)
    *a4 = timeInfo[v14].grandmasterID;
  if (a5)
  {
    localPortNumber = timeInfo[v14].localPortNumber;
    goto LABEL_31;
  }
  return v10;
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPClock addReverseSyncOnInterfaceNamed:withDomainNumner:syncInterval:error:](self->_gPTPClock, "addReverseSyncOnInterfaceNamed:withDomainNumner:syncInterval:error:", a3, a4, *(_QWORD *)&a5, a6);
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPClock removeReverseSyncFromInterfaceNamed:withDomainNumner:error:](self->_gPTPClock, "removeReverseSyncFromInterfaceNamed:withDomainNumner:error:", a3, a4, a5);
}

- (void)_getInitialSyncInfo
{
  id *p_gPTPClock;
  uint64_t v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint8_t buf[4];
  unint64_t v22;
  uint8_t v23[4];
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
  v20 = 0;
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v17 = 0;
  v14 = 0;
  v15 = 0;
  v13 = 0;
  p_gPTPClock = (id *)&self->_gPTPClock;
  v4 = -[_TSF_TSDKernelClock lockState](self->_gPTPClock, "lockState");
  v5 = *p_gPTPClock;
  v12 = 0;
  v6 = objc_msgSend(v5, "getSyncInfoWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulativeScaledRate:grandmasterID:localPortNumber:error:", (char *)&v20 + 1, &v20, &v19, &v18, &v17, &v16, &v15, &v14, &v13, &v12);
  v7 = v12;
  objc_msgSend(*p_gPTPClock, "gptpPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 136316418;
      v24 = "success == YES";
      v25 = 2048;
      v26 = 0;
      v27 = 2048;
      v28 = 0;
      v29 = 2080;
      v30 = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      v33 = 1024;
      v34 = 1070;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v23, 0x3Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[TSDCTranslationClock getInitialSyncInfo].cold.1(objc_msgSend(v10, "UTF8String"), v23, v10);
    }
    v4 = 0;
    v18 = -1;
    v19 = -1;
    v16 = 1;
    v17 = -1;
    v15 = 1;
    v14 = -1;
    v13 = -1;
    v20 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    *(_DWORD *)buf = 134217984;
    v22 = v9;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) _getInitialSyncInfo: response", buf, 0xCu);
  }
  LOWORD(v11) = v13;
  -[TSDCgPTPClock updateWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulativeScaledRate:grandmasterID:localPortNumber:](self, "updateWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulativeScaledRate:grandmasterID:localPortNumber:", HIBYTE(v20), v20, v19, v18, v17, v16, v15, v14, v11);
  -[TSDCgPTPClock updateGrandmasterIdentity:andgPTPPath:](self, "updateGrandmasterIdentity:andgPTPPath:", v14, v8);
  -[TSDCgPTPClock updateLockState:](self, "updateLockState:", v4);

}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v12 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v13 = 2048;
    v14 = a3;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) didBeginClockGrandmasterChangeWithGrandmasterID:0x%016llx localPort:%hu", (uint8_t *)&v11, 0x1Cu);
  }
  -[TSDCKernelClock client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didBeginClockGrandmasterChange");

  -[TSDCKernelClock client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didBeginClockGrandmasterChangeWithGrandmasterID:localPort:", a3, v5);

}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v12 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v13 = 2048;
    v14 = a3;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) didEndClockGrandmasterChangeWithGrandmasterID:0x%016llx localPort:%hu", (uint8_t *)&v11, 0x1Cu);
  }
  -[TSDCKernelClock client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didEndClockGrandmasterChange");

  -[TSDCKernelClock client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didEndClockGrandmasterChangeWithGrandmasterID:localPort:", a3, v5);

}

- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v5 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218496;
    v11 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v12 = 2048;
    v13 = a3;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) didChangeLocalPortWithGrandmasterID:0x%016llx localPort:%hu", (uint8_t *)&v10, 0x1Cu);
  }
  -[TSDCKernelClock client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didChangeLocalPortWithGrandmasterID:localPort:", a3, v5);

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
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) updateLockState:%d", (uint8_t *)&v5, 0x12u);
  }
  os_unfair_lock_lock(-[TSDCKernelClock getUpdateLock](self, "getUpdateLock"));
  -[TSDCKernelClock setInternalLockState:](self, "setInternalLockState:", v3);
  if (-[TSDCKernelClock internalLockState](self, "internalLockState") == 2)
  {
    if (-[TSDCKernelClock validIndex](self, "validIndex") >= 8)
      v3 = 1;
    else
      v3 = v3;
  }
  os_unfair_lock_unlock(-[TSDCKernelClock getUpdateLock](self, "getUpdateLock"));
  -[TSDCKernelClock postLockStateChange:](self, "postLockStateChange:", v3);
}

- (void)updateWithSyncInfoValid:(BOOL)a3 syncFlags:(unsigned __int8)a4 timeSyncTime:(unint64_t)a5 domainTimeHi:(unint64_t)a6 domainTimeLo:(unint64_t)a7 cumulativeScaledRate:(unint64_t)a8 inverseCumulativeScaledRate:(unint64_t)a9 grandmasterID:(unint64_t)a10 localPortNumber:(unsigned __int16)a11
{
  uint64_t v17;
  uint64_t v18;
  $D23876D9C6E9C834D747CE0E6328BA34 *v19;
  double v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[6];
  unint64_t v25;
  unint64_t v26;
  _BYTE info[12];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v17 = -[TSDCKernelClock lockState](self, "lockState", a3);
  v25 = 0;
  v26 = 0;
  if (a5 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)info = 136316418;
    *(_QWORD *)&info[4] = "timeSyncTime != TSInvalidTime";
    v28 = 2048;
    v29 = 0;
    v30 = 2048;
    v31 = 0;
    v32 = 2080;
    v33 = "";
    v34 = 2080;
    v35 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v36 = 1024;
    v37 = 1144;
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_16;
  }
  if (a6 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)info = 136316418;
    *(_QWORD *)&info[4] = "domainTimeHi != TSInvalidTime";
    v28 = 2048;
    v29 = 0;
    v30 = 2048;
    v31 = 0;
    v32 = 2080;
    v33 = "";
    v34 = 2080;
    v35 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    v36 = 1024;
    v37 = 1145;
    v23 = MEMORY[0x1E0C81028];
LABEL_16:
    _os_log_impl(&dword_1B56CB000, v23, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", info, 0x3Au);
    return;
  }
  v18 = v17;
  os_unfair_lock_lock(-[TSDCKernelClock getUpdateLock](self, "getUpdateLock"));
  v19 = &self->_timeInfo[(unint64_t)((-[TSDCKernelClock validIndex](self, "validIndex") + 1) & 7)];
  v19->syncInfoValid = 1;
  v19->syncFlags = a4;
  v19->timeSyncTime = a5;
  v19->domainTime.lo = a7;
  v19->domainTime.hi = a6;
  v19->cumulativeScaledRate = a8;
  v19->inverseCumulativeScaledRate = a9;
  v19->grandmasterID = a10;
  v19->localPortNumber = a11;
  -[TSDCKernelClock setValidIndex:](self, "setValidIndex:");
  -[TSDCgPTPClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](self, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", &v26, &v25, 0, 0, 0);
  mach_timebase_info((mach_timebase_info_t)info);
  v25 /= *(unsigned int *)&info[4];
  v26 /= *(unsigned int *)info;
  v20 = (double)v26 / (double)v25;
  -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __169__TSDCgPTPClock_updateWithSyncInfoValid_syncFlags_timeSyncTime_domainTimeHi_domainTimeLo_cumulativeScaledRate_inverseCumulativeScaledRate_grandmasterID_localPortNumber___block_invoke;
    v24[3] = &unk_1E694B3B8;
    v24[4] = self;
    *(double *)&v24[5] = v20;
    dispatch_async(v22, v24);

  }
  else
  {
    -[TSDCKernelClock setHostRateRatio:](self, "setHostRateRatio:", v20);
  }
  if (-[TSDCKernelClock internalLockState](self, "internalLockState") == 2 && (_DWORD)v18 != 2)
    v18 = -[TSDCKernelClock internalLockState](self, "internalLockState");
  os_unfair_lock_unlock(-[TSDCKernelClock getUpdateLock](self, "getUpdateLock"));
  if ((_DWORD)v18 != -[TSDCKernelClock lockState](self, "lockState"))
    -[TSDCKernelClock postLockStateChange:](self, "postLockStateChange:", v18);
}

void __169__TSDCgPTPClock_updateWithSyncInfoValid_syncFlags_timeSyncTime_domainTimeHi_domainTimeLo_cumulativeScaledRate_inverseCumulativeScaledRate_grandmasterID_localPortNumber___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "setHostRateRatio:", *(double *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)updateGrandmasterIdentity:(unint64_t)a3 andgPTPPath:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = -[TSDCKernelClock clockIdentifier](self, "clockIdentifier");
    v15 = 2048;
    v16 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) updateGrandmasterIdentity:0x%016llx andgPTPPath:...", buf, 0x16u);
  }
  -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    -[TSDCgPTPClock setGrandmasterIdentity:](self, "setGrandmasterIdentity:", a3);
    -[TSDCgPTPClock setGptpPath:](self, "setGptpPath:", v6);
  }
  else
  {
    -[TSDCKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__TSDCgPTPClock_updateGrandmasterIdentity_andgPTPPath___block_invoke;
    block[3] = &unk_1E694B3E0;
    block[4] = self;
    v12 = a3;
    v11 = v6;
    dispatch_async(v9, block);

  }
}

void __55__TSDCgPTPClock_updateGrandmasterIdentity_andgPTPPath___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "setGrandmasterIdentity:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setGptpPath:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (NSArray)gptpPath
{
  return self->_gptpPath;
}

- (void)setGptpPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 872);
}

- (unint64_t)grandmasterIdentity
{
  return self->_grandmasterIdentity;
}

- (void)setGrandmasterIdentity:(unint64_t)a3
{
  self->_grandmasterIdentity = a3;
}

- (unsigned)clockPriority1
{
  return self->_clockPriority1;
}

- (void)setClockPriority1:(unsigned __int8)a3
{
  self->_clockPriority1 = a3;
}

- (unsigned)clockPriority2
{
  return self->_clockPriority2;
}

- (void)setClockPriority2:(unsigned __int8)a3
{
  self->_clockPriority2 = a3;
}

- (unsigned)clockClass
{
  return self->_clockClass;
}

- (void)setClockClass:(unsigned __int8)a3
{
  self->_clockClass = a3;
}

- (unsigned)clockAccuracy
{
  return self->_clockAccuracy;
}

- (void)setClockAccuracy:(unsigned __int8)a3
{
  self->_clockAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gptpPath, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_gPTPClock, 0);
}

- (id).cxx_construct
{
  uint64_t i;
  _QWORD *v3;

  for (i = 0; i != 512; i += 64)
  {
    v3 = (char *)self + i + 360;
    *v3 = 0;
    v3[1] = 0;
  }
  return self;
}

@end
