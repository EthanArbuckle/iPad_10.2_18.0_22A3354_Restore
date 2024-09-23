@implementation TSDCUserFilteredClock

- (TSDCUserFilteredClock)initWithKernelClock:(id)a3
{
  id v5;
  TSDCUserFilteredClock *v6;
  objc_super v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDCUserFilteredClock;
    v6 = -[TSDCKernelClock initWithKernelClock:](&v8, sel_initWithKernelClock_, v5);
    self = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_userFilteredClock, a3);
    self->_lastValidIndex = -1;
    self->_needTimeSyncTimeUpdate = 0;
  }

  return self;
}

- (BOOL)waitTimeSyncTimeUpdate
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_needTimeSyncTimeUpdate)
    return 1;
  v3 = (self->_lastValidIndex + 1) & 7;
  if (-[TSDCKernelClock validIndex](self, "validIndex") == v3)
  {
    v4 = 0;
    v5 = 1;
LABEL_8:
    if (v4 < 2)
      return 1;
  }
  else
  {
    v6 = -1;
    while (1)
    {
      usleep(0x2710u);
      if (v6 == 98)
        break;
      ++v6;
      if (-[TSDCKernelClock validIndex](self, "validIndex") == v3)
      {
        v5 = v6 < 0x63;
        v4 = v6 + 1;
        goto LABEL_8;
      }
    }
    v5 = 0;
    v4 = 100;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = 10000 * v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "waitTimeSyncTimeUpdate delayed %u us\n", (uint8_t *)v8, 8u);
  }
  return v5;
}

- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5
{
  self->_needTimeSyncTimeUpdate = 1;
  self->_lastValidIndex = -[TSDCKernelClock validIndex](self, "validIndex");
  return -[_TSF_TSDUserFilteredClock addTimestampWithMachAbsolute:andDomainTime:error:](self->_userFilteredClock, "addTimestampWithMachAbsolute:andDomainTime:error:", a3, a4, a5);
}

- (BOOL)resetSyncServiceWithError:(id *)a3
{
  return -[_TSF_TSDUserFilteredClock resetSyncServiceWithError:](self->_userFilteredClock, "resetSyncServiceWithError:", a3);
}

- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4
{
  return -[_TSF_TSDUserFilteredClock resetFilterToNominal:error:](self->_userFilteredClock, "resetFilterToNominal:error:", a3, a4);
}

- (unint64_t)nominalMachInterval
{
  return -[_TSF_TSDUserFilteredClock nominalMachInterval](self->_userFilteredClock, "nominalMachInterval");
}

- (unint64_t)nominalDomainInterval
{
  return -[_TSF_TSDUserFilteredClock nominalDomainInterval](self->_userFilteredClock, "nominalDomainInterval");
}

- (unsigned)filterShift
{
  return -[_TSF_TSDUserFilteredClock filterShift](self->_userFilteredClock, "filterShift");
}

- (BOOL)isAdaptive
{
  return -[_TSF_TSDUserFilteredClock isAdaptive](self->_userFilteredClock, "isAdaptive");
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      v13 = 136315138;
      v14 = "-[TSDCUserFilteredClock convertFromMachAbsoluteToDomainTime:]";
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v13, 0xCu);
    }
  }

  v8 = -[TSDCKernelClock convertFromTimeSyncToDomainTime:](self, "convertFromTimeSyncToDomainTime:", a3);
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      v13 = 136315650;
      v14 = "-[TSDCUserFilteredClock convertFromMachAbsoluteToDomainTime:]";
      v15 = 2048;
      v16 = a3;
      v17 = 2048;
      v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v9, OS_SIGNPOST_INTERVAL_END, v11, (const char *)&unk_1B571F9B9, "%s machAbsoluteTime=%llu domainTime=%llu", (uint8_t *)&v13, 0x20u);
    }
  }

  return v8;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      v13 = 136315138;
      v14 = "-[TSDCUserFilteredClock convertFromDomainToMachAbsoluteTime:]";
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1B571F9B9, "%s", (uint8_t *)&v13, 0xCu);
    }
  }

  v8 = -[TSDCKernelClock convertFromDomainToTimeSyncTime:](self, "convertFromDomainToTimeSyncTime:", a3);
  -[TSDCKernelClock getOsLog](self, "getOsLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[TSDCKernelClock getSignpostId](self, "getSignpostId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      v13 = 136315650;
      v14 = "-[TSDCUserFilteredClock convertFromDomainToMachAbsoluteTime:]";
      v15 = 2048;
      v16 = a3;
      v17 = 2048;
      v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1B56CB000, v9, OS_SIGNPOST_INTERVAL_END, v11, (const char *)&unk_1B571F9B9, "%s domainTime=%llu machAbsoluteTime=%llu", (uint8_t *)&v13, 0x20u);
    }
  }

  return v8;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  BOOL v7;
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
  v7 = -[TSDCKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](self, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", a3, a4, a5, a6, a7);
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136316418;
    v10 = "[self getTimeSyncTimeRateRatioNumerator:numerator denominator:denominator timeSyncAnchor:machAnchor andDomainA"
          "nchor:domainAnchor withError:error]";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCUserFilteredClock.m";
    v19 = 1024;
    v20 = 141;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFilteredClock, 0);
}

@end
