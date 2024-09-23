@implementation TSXTranslationClock

- (TSXTranslationClock)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSXTranslationClock init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Do not call %@"), v4);

  return 0;
}

- (TSXTranslationClock)initWithClockIdentifier:(unint64_t)a3
{
  TSXTranslationClock *v4;
  TSXTranslationClock *v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSXTranslationClock;
  v4 = -[TSXTranslationClock init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_clockIdentifier = a3;
    v4->_validIndex = -1;
    mach_timebase_info(&v4->_timebaseInfo);
    v5->_updateLock._os_unfair_lock_opaque = 0;
    LODWORD(v6) = v5->_timebaseInfo.numer;
    LODWORD(v7) = v5->_timebaseInfo.denom;
    v5->_hostRateRatio = (double)v6 / (double)v7;
  }
  return v5;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 132;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 133;
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
      *v5++ = -[TSXTranslationClock machAbsoluteTicksToNanoseconds:](self, "machAbsoluteTicksToNanoseconds:", v9);
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 150;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 151;
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
      *v6++ = -[TSXTranslationClock machAbsoluteNanosecondsToTicks:](self, "machAbsoluteNanosecondsToTicks:", v9);
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a3)
    *a3 = self->_timebaseInfo.numer;
  if (a4)
    *a4 = self->_timebaseInfo.denom;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 201;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 202;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 215;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 216;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 228;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 229;
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
      *v5++ = -[TSXTranslationClock convertFromTimeSyncToDomainTime:](self, "convertFromTimeSyncToDomainTime:", v9);
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 246;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    v24 = 1024;
    v25 = 247;
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
      *v6++ = -[TSXTranslationClock convertFromDomainToTimeSyncTime:](self, "convertFromDomainToTimeSyncTime:", v9);
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 265;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 266;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 279;
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
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v15 = 1024;
      v16 = 280;
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
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      v19 = 1024;
      v20 = 293;
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

- (void)_updateLockState:(int)a3
{
  uint64_t v3;
  void *v5;
  BOOL v6;
  NSObject *v7;
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
    v11 = -[TSXTranslationClock clockIdentifier](self, "clockIdentifier");
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXTranslationClock(0x%016llx) updateLockState:%d", buf, 0x12u);
  }
  -[TSXTranslationClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    -[TSXTranslationClock setLockState:](self, "setLockState:", v3);
  }
  else
  {
    -[TSXTranslationClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__TSXTranslationClock__updateLockState___block_invoke;
    v8[3] = &unk_1E694BA50;
    v8[4] = self;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __40__TSXTranslationClock__updateLockState___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "setLockState:", *(unsigned int *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)_updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6
{
  os_unfair_lock_s *p_updateLock;
  uint64_t v12;
  Class *v13;

  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  v12 = (self->_validIndex + 1) & 7;
  v13 = &self->super.isa + 4 * v12;
  v13[1] = (Class)a3;
  v13[2] = (Class)a5;
  v13[3] = (Class)a4;
  v13[4] = (Class)a6;
  self->_validIndex = v12;
  os_unfair_lock_unlock(p_updateLock);
}

- (void)_changedClockMaster
{
  int v3;
  unint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = -[TSXTranslationClock clockIdentifier](self, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXTranslationClock(0x%016llx) changedClockMaster", (uint8_t *)&v3, 0xCu);
  }
  os_unfair_lock_lock(&self->_updateLock);
  self->_validIndex = -1;
  os_unfair_lock_unlock(&self->_updateLock);
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
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

- (NSString)clockName
{
  return self->_clockName;
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
  objc_storeStrong((id *)&self->_clockName, 0);
}

@end
