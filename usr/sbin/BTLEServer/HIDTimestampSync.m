@implementation HIDTimestampSync

- (HIDTimestampSync)initWithBtClockMask:(unint64_t)a3
{
  HIDTimestampSync *v4;
  HIDTimestampSync *v5;
  char *v6;
  const __CFDictionary *v7;
  uint64_t MatchingServices;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  HIDTimestampSync *v25;
  io_object_t v27;
  NSObject *v28;
  HIDTimestampSyncErrorHandler *v29;
  HIDTimestampSyncErrorHandler *reportErrorHandler;
  HIDTimestampSyncErrorHandler *v31;
  HIDTimestampSyncErrorHandler *btSyncErrorHandler;
  __int16 v33[6];
  io_iterator_t existing;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HIDTimestampSync;
  v4 = -[HIDTimestampSync init](&v35, "init");
  v5 = v4;
  if (v4)
  {
    v4->_btClockMask = a3;
    v6 = -[HIDTimestampSync convertBTClockToMicrosec:](v4, "convertBTClockToMicrosec:", a3);
    v5->_btSyncCompensation = (unint64_t)&v6[-[HIDTimestampSync convertBTClockToMicrosec:](v5, "convertBTClockToMicrosec:", 1)];
    v5->_syncService = 0;
    v7 = IOServiceNameMatching("AppleMultitouchTimestampSync");
    if (v7)
    {
      existing = 0;
      MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v7, &existing);
      if ((_DWORD)MatchingServices)
      {
        v9 = MatchingServices;
        v10 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006DD08(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      else
      {
        v27 = IOIteratorNext(existing);
        if (v27)
        {
          v5->_syncService = v27;
          v28 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            v33[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found AppleMultitouchTimestampSync driver", (uint8_t *)v33, 2u);
          }
        }
        if (existing)
          IOObjectRelease(existing);
        if (v5->_syncService)
        {
          v29 = -[HIDTimestampSyncErrorHandler initWithSubType:]([HIDTimestampSyncErrorHandler alloc], "initWithSubType:", CFSTR("InterruptReportTimestampErrors"));
          reportErrorHandler = v5->_reportErrorHandler;
          v5->_reportErrorHandler = v29;

          v31 = -[HIDTimestampSyncErrorHandler initWithSubType:]([HIDTimestampSyncErrorHandler alloc], "initWithSubType:", CFSTR("TimestampSyncErrors"));
          btSyncErrorHandler = v5->_btSyncErrorHandler;
          v5->_btSyncErrorHandler = v31;

          v25 = v5;
          goto LABEL_9;
        }
      }
    }
    else
    {
      v17 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006DC98(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  v25 = 0;
LABEL_9:

  return v25;
}

- (void)dealloc
{
  io_object_t syncService;
  objc_super v4;

  syncService = self->_syncService;
  if (syncService)
  {
    IOObjectRelease(syncService);
    self->_syncService = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HIDTimestampSync;
  -[HIDTimestampSync dealloc](&v4, "dealloc");
}

- (unint64_t)convertBTClockToMicrosec:(unint64_t)a3
{
  return 312500 * (self->_btClockMask & a3) / 0x3E8;
}

- (void)processTimestampSync:(unsigned int)a3 phase:(unsigned int)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v6 = -[HIDTimestampSync convertBTClockToMicrosec:](self, "convertBTClockToMicrosec:", a3);
  v11 = 0;
  v12 = 0;
  if (-[HIDTimestampSync obtainTimestampFromDriver:count:period:](self, "obtainTimestampFromDriver:count:period:", &v12, &v11, &self->_periodMs))
  {
    v7 = v6 + a4;
    v8 = 1000 * v12;
    if (-[HIDTimestampSync timestampSyncIsValid:hostTimestamp:btSyncTimestampUs:](self, "timestampSyncIsValid:hostTimestamp:btSyncTimestampUs:", 1000 * v12, v11, v7))
    {
      self->_lastBTSyncTimestampUs = v7;
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    self->_lastBTSyncTimestampUsValid = v9;
    v10 = v11;
    self->_lastHostTimestampUs = v8;
    self->_lastHostTimestampCount = v10;
  }
}

- (BOOL)obtainTimestampFromDriver:(unint64_t *)a3 count:(unint64_t *)a4 period:(unsigned int *)a5
{
  io_registry_entry_t syncService;
  const __CFNumber *CFProperty;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  _BOOL4 v16;

  syncService = self->_syncService;
  if (!syncService)
  {
    v16 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
    if (!v16)
      return v16;
    sub_10006DD6C();
    goto LABEL_21;
  }
  if (a3)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(syncService, CFSTR("Last Timestamp Sync"), kCFAllocatorDefault, 0);
    if (!CFProperty)
    {
      v16 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
      if (!v16)
        return v16;
      sub_10006DDF0();
      goto LABEL_21;
    }
    v11 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt64Type, a3);
    CFRelease(v11);
  }
  if (a4)
  {
    v12 = (const __CFNumber *)IORegistryEntryCreateCFProperty(self->_syncService, CFSTR("Timestamp Sync Count"), kCFAllocatorDefault, 0);
    if (!v12)
    {
      v16 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
      if (!v16)
        return v16;
      sub_10006DDC4();
      goto LABEL_21;
    }
    v13 = v12;
    CFNumberGetValue(v12, kCFNumberSInt64Type, a4);
    CFRelease(v13);
  }
  if (!a5)
  {
LABEL_11:
    LOBYTE(v16) = 1;
    return v16;
  }
  v14 = (const __CFNumber *)IORegistryEntryCreateCFProperty(self->_syncService, CFSTR("Timestamp Sync Period"), kCFAllocatorDefault, 0);
  if (v14)
  {
    v15 = v14;
    CFNumberGetValue(v14, kCFNumberSInt32Type, a5);
    CFRelease(v15);
    goto LABEL_11;
  }
  v16 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
  if (!v16)
    return v16;
  sub_10006DD98();
LABEL_21:
  LOBYTE(v16) = 0;
  return v16;
}

- (BOOL)isTimestampSyncEnabled
{
  int *p_periodMs;
  unint64_t v4;
  NSObject *v5;
  NSObject *v7;
  uint8_t v8[12];
  int v9;

  p_periodMs = (int *)&self->_periodMs;
  if (self->_periodMs)
  {
    v4 = -[HIDTimestampSync machTimeToMicrosec:](self, "machTimeToMicrosec:", mach_absolute_time())
       - self->_lastHostTimestampUs;
    if (v4 < 2000 * self->_periodMs)
      return 1;
    v9 = 0;
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006DE1C(p_periodMs, v4, v5);
    if (-[HIDTimestampSync obtainTimestampFromDriver:count:period:](self, "obtainTimestampFromDriver:count:period:", 0, 0, &v9))
    {
      if (v9)
        return 1;
      *p_periodMs = 0;
      v7 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Timestamp sync is disabled.", v8, 2u);
      }
    }
  }
  return 0;
}

- (unint64_t)applyTimestampOffset:(unsigned int)a3 precise:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t btSyncCompensation;
  int64_t v10;
  unint64_t v11;
  NSObject *v12;
  unint64_t lastBTSyncTimestampUs;
  unsigned int periodMs;
  int v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unsigned int v21;

  v4 = a4;
  if (!-[HIDTimestampSync isTimestampSyncEnabled](self, "isTimestampSyncEnabled"))
    return 0;
  v7 = -[HIDTimestampSync convertBTClockToMicrosec:](self, "convertBTClockToMicrosec:", a3);
  if (v4)
  {
    v8 = 2000 * self->_periodMs;
    btSyncCompensation = self->_btSyncCompensation;
  }
  else
  {
    btSyncCompensation = self->_btSyncCompensation;
    v8 = btSyncCompensation;
  }
  v10 = -[HIDTimestampSync calculateTimestampDifference:current:threshold:compensation:errorHandler:](self, "calculateTimestampDifference:current:threshold:compensation:errorHandler:", self->_lastBTSyncTimestampUs, v7, v8, btSyncCompensation, self->_reportErrorHandler);
  if (!v10 && self->_lastBTSyncTimestampUs != v7)
  {
    if (!-[HIDTimestampSyncErrorHandler isMuted](self->_reportErrorHandler, "isMuted"))
    {
      v12 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        lastBTSyncTimestampUs = self->_lastBTSyncTimestampUs;
        periodMs = self->_periodMs;
        v16 = 134218496;
        v17 = v7;
        v18 = 2048;
        v19 = lastBTSyncTimestampUs;
        v20 = 1024;
        v21 = periodMs;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Packet timestamp (%llu) is out of sync with BT (ts=%lluus, period=%ums). Ignoring.", (uint8_t *)&v16, 0x1Cu);
      }
    }
    return 0;
  }
  v11 = self->_lastHostTimestampUs + v10;
  -[HIDTimestampSyncErrorHandler reportSuccess](self->_reportErrorHandler, "reportSuccess");
  return v11;
}

- (unint64_t)applyInverseTimestampOffset:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t lastHostTimestampUs;
  unint64_t lastBTSyncTimestampUs;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;

  if (!-[HIDTimestampSync isTimestampSyncEnabled](self, "isTimestampSyncEnabled"))
    return 0;
  if (!self->_lastBTSyncTimestampUsValid)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006DEA0();
    return 0;
  }
  v5 = a3 - self->_lastHostTimestampUs;
  v6 = self->_lastBTSyncTimestampUs + v5;
  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    lastBTSyncTimestampUs = self->_lastBTSyncTimestampUs;
    lastHostTimestampUs = self->_lastHostTimestampUs;
    v11 = 134219008;
    v12 = lastHostTimestampUs;
    v13 = 2048;
    v14 = a3;
    v15 = 2048;
    v16 = v5;
    v17 = 2048;
    v18 = lastBTSyncTimestampUs;
    v19 = 2048;
    v20 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Diff from last host tsync (%7lluµs) to current packet host tstamp (%7lluµs) = %+5lldµs. Applied to last BT tsync (%7lldµs) results in packet BT tstamp = %7lldµs", (uint8_t *)&v11, 0x34u);
  }
  return v6;
}

- (int64_t)calculateTimestampDifference:(unint64_t)a3 current:(unint64_t)a4 threshold:(unint64_t)a5 compensation:(unint64_t)a6 errorHandler:(id)a7
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  NSString *v15;
  void *v16;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;

  v11 = a7;
  if (a6 < a5 || (v12 = a6 - a3, a6 < a3) || (v13 = a6 - a4, a6 < a4))
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Compensation should be equal or larger than timestamps and threshold.(compensation=%llu, threshold=%llu, previous=%llu, current=%llu)"), a6, a5, a3, a4, v19);
LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v11, "reportFailure:", v16);

    v14 = 0;
    goto LABEL_9;
  }
  if ((uint64_t)(a4 - a3) > (uint64_t)a5 || (uint64_t)(a4 - a3) < -(uint64_t)a5)
  {
    if (a4 <= a3)
    {
      v14 = v12 + a4;
      if ((uint64_t)(v12 + a4) > (uint64_t)a5)
      {
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timestamp going backwards (%llu=>%llu, diff=%lld). This is not a rollover(threshold=%llu, compensation=%llu)."), a3, a4, a4 - a3, a5, a6);
        goto LABEL_8;
      }
      v18 = qword_1000C9178;
      if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
    }
    else
    {
      v14 = v13 + a3;
      if ((uint64_t)(v13 + a3) > (uint64_t)a5)
      {
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Compensation should be equal or larger than timestamps and threshold.Timestamp jump (%llu=>%llu, diff=%lld). This is not a rollover(threshold=%llu, compensation=%llu)."), a3, a4, a4 - a3, a5, a6);
        goto LABEL_8;
      }
      v18 = qword_1000C9178;
      if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
    }
    *(_DWORD *)buf = 134219008;
    v21 = a3;
    v22 = 2048;
    v23 = a4;
    v24 = 2048;
    v25 = v14;
    v26 = 2048;
    v27 = a5;
    v28 = 2048;
    v29 = a6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rollover detected (%llu=>%llu). Return diff=%lld (threshold=%llu, compensation=%llu)", buf, 0x34u);
    goto LABEL_9;
  }
  v14 = a4 - a3;
LABEL_9:

  return v14;
}

- (BOOL)timestampSyncIsValid:(unint64_t)a3 hostTimestamp:(unint64_t)a4 btSyncTimestampUs:(unint64_t)a5
{
  unint64_t lastHostTimestampCount;
  HIDTimestampSyncErrorHandler *btSyncErrorHandler;
  void *v11;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  unint64_t lastHostTimestampUs;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t lastBTSyncTimestampUs;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;

  lastHostTimestampCount = self->_lastHostTimestampCount;
  if (lastHostTimestampCount)
  {
    if (a4 != 1 && lastHostTimestampCount + 1 != a4)
    {
      btSyncErrorHandler = self->_btSyncErrorHandler;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Host timestamp jump detected (%llu:%llu -> %llu:%llu). Discard this BTSync packet."), lastHostTimestampCount, self->_lastHostTimestampUs, a4, a3));
      -[HIDTimestampSyncErrorHandler reportFailure:](btSyncErrorHandler, "reportFailure:", v11);

      kdebug_trace(730595792, self->_lastHostTimestampCount, self->_lastHostTimestampUs, a4, a3);
      return 0;
    }
    if (a4 < 2)
    {
      v19 = 0;
    }
    else
    {
      lastHostTimestampUs = self->_lastHostTimestampUs;
      v18 = -[HIDTimestampSync calculateTimestampDifference:current:threshold:compensation:errorHandler:](self, "calculateTimestampDifference:current:threshold:compensation:errorHandler:", self->_lastBTSyncTimestampUs, a5, 2000 * self->_periodMs, self->_btSyncCompensation, self->_btSyncErrorHandler);
      v19 = a3 - lastHostTimestampUs - v18;
      if (self->_lastHostTimestampUs && self->_lastBTSyncTimestampUs)
        kdebug_trace(730595788, v19, 0, 0, 0);
      if (v18 || self->_lastBTSyncTimestampUs == a5)
        -[HIDTimestampSyncErrorHandler reportSuccess](self->_btSyncErrorHandler, "reportSuccess");
    }
    v20 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_lastHostTimestampUs;
      v21 = self->_lastHostTimestampCount;
      lastBTSyncTimestampUs = self->_lastBTSyncTimestampUs;
      *(_DWORD *)buf = 134219520;
      v25 = v21;
      v26 = 2048;
      v27 = v22;
      v28 = 2048;
      v29 = a4;
      v30 = 2048;
      v31 = a3;
      v32 = 2048;
      v33 = lastBTSyncTimestampUs;
      v34 = 2048;
      v35 = a5;
      v36 = 2048;
      v37 = v19;
      v14 = "New timestamp sync (Host=%llu:%llu->%llu:%llu, BT=%llu->%llu, drift=%lld)";
      v15 = v20;
      v16 = 72;
      goto LABEL_17;
    }
  }
  else
  {
    v13 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v25 = a4;
      v26 = 2048;
      v27 = a3;
      v28 = 2048;
      v29 = a5;
      v14 = "First timestamp sync (Host=%llu:%llu, BT=%llu)";
      v15 = v13;
      v16 = 32;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  return 1;
}

- (unint64_t)machTimeToMicrosec:(unint64_t)a3
{
  unsigned int v4;

  v4 = dword_1000C90C4;
  if (!dword_1000C90C4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000C90C0);
    v4 = dword_1000C90C4;
  }
  return a3 / v4 * dword_1000C90C0 / 0x3E8;
}

- (unint64_t)microsecToMachTime:(unint64_t)a3
{
  unsigned int v4;

  v4 = dword_1000C90CC;
  if (!dword_1000C90CC)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000C90C8);
    v4 = dword_1000C90CC;
  }
  return 1000 * a3 * v4 / dword_1000C90C8;
}

- (unint64_t)btClockMask
{
  return self->_btClockMask;
}

- (void)setBtClockMask:(unint64_t)a3
{
  self->_btClockMask = a3;
}

- (unint64_t)btSyncCompensation
{
  return self->_btSyncCompensation;
}

- (void)setBtSyncCompensation:(unint64_t)a3
{
  self->_btSyncCompensation = a3;
}

- (unsigned)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(unsigned int)a3
{
  self->_syncService = a3;
}

- (unsigned)periodMs
{
  return self->_periodMs;
}

- (void)setPeriodMs:(unsigned int)a3
{
  self->_periodMs = a3;
}

- (unint64_t)lastBTSyncTimestampUs
{
  return self->_lastBTSyncTimestampUs;
}

- (void)setLastBTSyncTimestampUs:(unint64_t)a3
{
  self->_lastBTSyncTimestampUs = a3;
}

- (BOOL)lastBTSyncTimestampUsValid
{
  return self->_lastBTSyncTimestampUsValid;
}

- (void)setLastBTSyncTimestampUsValid:(BOOL)a3
{
  self->_lastBTSyncTimestampUsValid = a3;
}

- (unint64_t)lastHostTimestampUs
{
  return self->_lastHostTimestampUs;
}

- (void)setLastHostTimestampUs:(unint64_t)a3
{
  self->_lastHostTimestampUs = a3;
}

- (unint64_t)lastHostTimestampCount
{
  return self->_lastHostTimestampCount;
}

- (void)setLastHostTimestampCount:(unint64_t)a3
{
  self->_lastHostTimestampCount = a3;
}

- (HIDTimestampSyncErrorHandler)reportErrorHandler
{
  return self->_reportErrorHandler;
}

- (void)setReportErrorHandler:(id)a3
{
  objc_storeStrong((id *)&self->_reportErrorHandler, a3);
}

- (HIDTimestampSyncErrorHandler)btSyncErrorHandler
{
  return self->_btSyncErrorHandler;
}

- (void)setBtSyncErrorHandler:(id)a3
{
  objc_storeStrong((id *)&self->_btSyncErrorHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btSyncErrorHandler, 0);
  objc_storeStrong((id *)&self->_reportErrorHandler, 0);
}

@end
