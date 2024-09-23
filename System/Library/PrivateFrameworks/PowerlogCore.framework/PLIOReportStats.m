@implementation PLIOReportStats

- (__IOReportSubscriptionCF)subscription
{
  return self->_subscription;
}

- (NSDate)sampleTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)ioReportSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSampleTimePrevious:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setSampleTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setIoReportSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)subscribedChannels
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)sampleTimePrevious
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (id)_init
{
  PLIOReportStats *v2;
  PLIOReportStats *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLIOReportStats;
  v2 = -[PLIOReportStats init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PLIOReportStats setDriverName:](v2, "setDriverName:", CFSTR("ApplePMGR"));
    -[PLIOReportStats setSubscription:](v3, "setSubscription:", 0);
    -[PLIOReportStats setSubscribedChannels:](v3, "setSubscribedChannels:", 0);
  }
  return v3;
}

- (PLIOReportStats)initWithDriverName:(id)a3 withGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PLIOReportStats *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[PLIOReportStats _init](self, "_init");
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setDriverName:", v6);
    v10 = 0;
    if (objc_msgSend(v9, "subscribeToGroup:andSubGroup:withChannelIDs:", v7, 0, 0))
      v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4
{
  return -[PLIOReportStats initWithGroup:andSubGroup:withChannelIDs:](self, "initWithGroup:andSubGroup:withChannelIDs:", a3, a4, 0);
}

- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5
{
  return -[PLIOReportStats initWithGroup:andSubGroup:withChannelIDs:manualChannelOnly:](self, "initWithGroup:andSubGroup:withChannelIDs:manualChannelOnly:", a3, a4, a5, 0);
}

- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5 manualChannelOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PLIOReportStats *v15;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[PLIOReportStats _init](self, "_init");
  v14 = v13;
  if (v13
    && objc_msgSend(v13, "subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:", v10, v11, v12, v6))
  {
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  if (-[PLIOReportStats subscription](self, "subscription"))
    CFRelease(-[PLIOReportStats subscription](self, "subscription"));
  v3.receiver = self;
  v3.super_class = (Class)PLIOReportStats;
  -[PLIOReportStats dealloc](&v3, sel_dealloc);
}

- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4
{
  return -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:](self, "subscribeToGroup:andSubGroup:withChannelIDs:", a3, a4, 0);
}

- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5
{
  return -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:](self, "subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:", a3, a4, a5, 0);
}

- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5 manualChannelOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  char v18;
  NSObject *v20;
  id v21;
  CFMutableDictionaryRef v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  const void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  id v52;
  id v53;
  CFTypeRef v54[2];
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v6 = a6;
  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1BCC9E9B4](-[PLIOReportStats clearSubscription](self, "clearSubscription"));
  v54[0] = 0;
  v54[1] = 0;
  v48 = MEMORY[0x1E0C809B0];
  v49 = 3221225472;
  v50 = __81__PLIOReportStats_subscribeToGroup_andSubGroup_withChannelIDs_manualChannelOnly___block_invoke;
  v51 = &unk_1E6A538D0;
  v14 = v10;
  v52 = v14;
  v15 = v11;
  v53 = v15;
  v16 = (void *)IOReportCopyFilteredChannels();
  v17 = v16;
  if (!objc_msgSend(v16, "count") && !v6)
    goto LABEL_5;
  if (!v17)
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v57 = v14;
    v58 = 2112;
    v59 = v15;
    v60 = 2112;
    v61 = v17;
    _os_log_debug_impl(&dword_1B6AB6000, v20, OS_LOG_TYPE_DEBUG, "Retrieved channels from group(%@) subgroup(%@) = %@\n", buf, 0x20u);
  }

  if (v12 && objc_msgSend(v12, "count"))
  {
    v40 = v15;
    v41 = v14;
    v42 = v13;
    -[PLIOReportStats driverName](self, "driverName");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = IOServiceMatching((const char *)objc_msgSend(v21, "UTF8String"));

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v43 = v12;
    v23 = v12;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v28, "unsignedLongLongValue");
          v29 = IOReportCopyChannelsWithID();
          if (v29)
          {
            v30 = (const void *)v29;
            PLLogCommon();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:].cold.4(buf, v28, (uint64_t *)&v57, v31);

            IOReportMergeChannels();
            CFRelease(v30);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      }
      while (v25);
    }

    CFRelease(v22);
    v13 = v42;
    v12 = v43;
    v15 = v40;
    v14 = v41;
  }
  -[PLIOReportStats setSubscription:](self, "setSubscription:", IOReportCreateSubscription());
  LOBYTE(v11) = v54[0] == 0;
  if (v54[0])
  {
    PLLogCommon();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:].cold.3((uint64_t)v54, v32, v33, v34, v35, v36, v37, v38);

    CFRelease(v54[0]);
  }
  else
  {
    if (!-[PLIOReportStats subscription](self, "subscription"))
    {
LABEL_5:
      v18 = 0;
      goto LABEL_6;
    }
    -[PLIOReportStats setSubscribedChannels:](self, "setSubscribedChannels:", 0);

    PLLogCommon();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:].cold.2(self);

  }
  v18 = 1;
LABEL_6:

  objc_autoreleasePoolPop(v13);
  return v18 & v11;
}

uint64_t __81__PLIOReportStats_subscribeToGroup_andSubGroup_withChannelIDs_manualChannelOnly___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  IOReportChannelGetGroup();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IOReportChannelGetSubGroup();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (v4
    && (objc_msgSend(v4, "isEqualToString:", v2)
     && *(_QWORD *)(a1 + 40)
     && (objc_msgSend(v3, "isEqualToString:") & 1) != 0
     || (v5 = *(void **)(a1 + 32)) != 0
     && objc_msgSend(v5, "isEqualToString:", v2)
     && !*(_QWORD *)(a1 + 40)))
  {
    v6 = 0;
  }
  else
  {
    v6 = 16;
  }

  return v6;
}

- (void)clearSubscription
{
  -[PLIOReportStats setSubscribedChannels:](self, "setSubscribedChannels:", 0);
  if (-[PLIOReportStats subscription](self, "subscription"))
  {
    CFRelease(-[PLIOReportStats subscription](self, "subscription"));
    -[PLIOReportStats setSubscription:](self, "setSubscription:", 0);
  }
}

- (id)getCurrentStats
{
  void *Samples;
  void *v3;
  void *v4;

  Samples = self;
  if (self)
  {
    if (-[PLIOReportStats subscription](self, "subscription")
      && (objc_msgSend(Samples, "subscribedChannels"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      objc_msgSend(Samples, "subscription");
      objc_msgSend(Samples, "subscribedChannels");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      Samples = (void *)IOReportCreateSamples();

    }
    else
    {
      Samples = 0;
    }
  }
  return Samples;
}

- (id)getDeltaStats
{
  void *v3;
  void *v4;
  void *v5;

  -[PLIOReportStats getCurrentStats](self, "getCurrentStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportStats ioReportSample](self, "ioReportSample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportStats _calculateDeltaFromPreviousStats:toCurrentStats:](self, "_calculateDeltaFromPreviousStats:toCurrentStats:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)getSampleDuration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PLIOReportStats sampleTimePrevious](self, "sampleTimePrevious");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLIOReportStats sampleTime](self, "sampleTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportStats sampleTimePrevious](self, "sampleTimePrevious");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (BOOL)updateStats
{
  return -[PLIOReportStats updateStatsWithBlock:](self, "updateStatsWithBlock:", &__block_literal_global_15);
}

id __30__PLIOReportStats_updateStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

- (BOOL)updateStatsWithBlock:(id)a3
{
  void (**v4)(id, PLIOReportStats *, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (void (**)(id, PLIOReportStats *, void *, void *))a3;
  -[PLIOReportStats ioReportSample](self, "ioReportSample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportStats setPreviousIOReportSample:](self, "setPreviousIOReportSample:", v5);

  -[PLIOReportStats getCurrentStats](self, "getCurrentStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = v8 != 0;
    if (v8)
    {
      -[PLIOReportStats setIoReportSample:](self, "setIoReportSample:", v8);
      -[PLIOReportStats sampleTime](self, "sampleTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLIOReportStats setSampleTimePrevious:](self, "setSampleTimePrevious:", v9);

      -[PLIOReportStats setSampleTime:](self, "setSampleTime:", v7);
      v7 = (void *)v8;
    }

  }
  return (char)v6;
}

- (id)parseIOReportSample
{
  void *v3;
  void *v4;
  void *v5;

  -[PLIOReportStats ioReportSample](self, "ioReportSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLIOReportStats ioReportSample](self, "ioReportSample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportStats _parseIOReportSampleFromStats:convertingUnitToUnityScale:](self, "_parseIOReportSampleFromStats:convertingUnitToUnityScale:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)parseSimpleDeltaSample
{
  void *v3;
  void *v4;
  void *v5;

  -[PLIOReportStats ioReportSample](self, "ioReportSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLIOReportStats getDeltaStats](self, "getDeltaStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportStats _parseIOReportSampleFromStats:convertingUnitToUnityScale:](self, "_parseIOReportSampleFromStats:convertingUnitToUnityScale:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)calculateDeltaFromPreviousSamples
{
  return -[PLIOReportStats calculateDeltaFromPreviousSamplesConvertingUnitToUnityScale:](self, "calculateDeltaFromPreviousSamplesConvertingUnitToUnityScale:", 0);
}

- (id)calculateDeltaFromPreviousSamplesConvertingUnitToUnityScale:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  -[PLIOReportStats ioReportSample](self, "ioReportSample");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PLIOReportStats previousIOReportSample](self, "previousIOReportSample"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[PLIOReportStats previousIOReportSample](self, "previousIOReportSample");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportStats ioReportSample](self, "ioReportSample");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportStats _calculateDeltaFromPreviousStats:toCurrentStats:](self, "_calculateDeltaFromPreviousStats:toCurrentStats:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLIOReportStats _parseIOReportSampleFromStats:convertingUnitToUnityScale:](self, "_parseIOReportSampleFromStats:convertingUnitToUnityScale:", v10, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_calculateDeltaFromPreviousStats:(id)a3 toCurrentStats:(id)a4
{
  void *SamplesDelta;

  SamplesDelta = 0;
  if (a3 && a4)
    SamplesDelta = (void *)IOReportCreateSamplesDelta();
  return SamplesDelta;
}

- (id)_parseIOReportSampleFromStats:(id)a3 convertingUnitToUnityScale:(BOOL)a4
{
  void *v4;
  id v5;
  id v6;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  IOReportIterate();

  v6 = v8;
  return v6;
}

void __76__PLIOReportStats__parseIOReportSampleFromStats_convertingUnitToUnityScale___block_invoke(uint64_t a1)
{
  void *v2;
  int Format;
  int v4;
  void *v5;
  uint64_t IntegerValue;
  uint64_t Unit;
  uint64_t v8;
  uint64_t Count;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *context;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  Format = IOReportChannelGetFormat();
  if (Format == 2)
  {
    context = v2;
    Count = IOReportStateGetCount();
    IOReportChannelGetChannelName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)Count >= 1)
    {
      v11 = 0;
      v12 = 0x1E0CB3000uLL;
      do
      {
        IOReportStateGetNameForIndex();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("%d"), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("%@_%@"), v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        IOReportStateGetDutyCycle();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = &unk_1E6ABACA0;
        if (v15)
          v17 = (void *)v15;
        v18 = v17;

        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v14);
        v19 = IOReportStateGetInTransitions();
        if (v19 != 0x8000000000000000)
        {
          v20 = v19;
          objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("%@_transitions"), v14);
          v21 = v10;
          v22 = Count;
          v23 = v12;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v25, v24);

          v12 = v23;
          Count = v22;
          v10 = v21;
        }

        v11 = (v11 + 1);
      }
      while ((_DWORD)Count != (_DWORD)v11);
    }

    v2 = context;
  }
  else
  {
    v4 = Format;
    if (Format == 1)
    {
      IOReportChannelGetChannelName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IntegerValue = IOReportSimpleGetIntegerValue();
      Unit = IOReportChannelGetUnit();
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "_convertValue:toUnityScaleFromUnit:", IntegerValue, Unit);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IntegerValue);
      }
      v8 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v8;
      if (v8)
        v28 = (void *)v8;
      else
        v28 = &unk_1E6ABACA0;
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v28, v5);

    }
    else
    {
      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __76__PLIOReportStats__parseIOReportSampleFromStats_convertingUnitToUnityScale___block_invoke_cold_1(v4, v26);

    }
  }
  objc_autoreleasePoolPop(v2);
}

- (double)_convertValue:(int64_t)a3 toUnityScaleFromUnit:(unint64_t)a4
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a4 & 0xFFFFFFFFFFFFFFLL;
  if ((a4 & 0xFFFFFFFFFFFFFFLL) <= 0x7BFFFFFFFFLL)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFLL) > 0x75FFFFFFFFLL)
    {
      if (v4 == 0x7600000000)
      {
        v7 = (double)a3;
        v8 = 1000000000.0;
      }
      else
      {
        if (v4 != 0x7900000000)
          return (double)a3;
        v7 = (double)a3;
        v8 = 1000000.0;
      }
    }
    else
    {
      if (v4 != 0x7300000000)
        return (double)a3;
      v7 = (double)a3;
      v8 = 1.0e12;
    }
  }
  else
  {
    if ((a4 & 0xFFFFFFFFFFFFFFLL) > 0x84FFFFFFFFLL)
    {
      switch(v4)
      {
        case 0x8500000000uLL:
          v5 = (double)a3;
          v6 = 1000000.0;
          return v5 * v6;
        case 0x8800000000uLL:
          v5 = (double)a3;
          v6 = 1000000000.0;
          return v5 * v6;
        case 0x8B00000000uLL:
          v5 = (double)a3;
          v6 = 1.0e12;
          return v5 * v6;
      }
      return (double)a3;
    }
    if (v4 != 0x7C00000000)
    {
      if (v4 == 0x8200000000)
      {
        v5 = (double)a3;
        v6 = 1000.0;
        return v5 * v6;
      }
      return (double)a3;
    }
    v7 = (double)a3;
    v8 = 1000.0;
  }
  return v7 / v8;
}

- (id)currentValueForSimpleChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  if (v4)
  {
    -[PLIOReportStats getCurrentStats](self, "getCurrentStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    IOReportIterate();

    v6 = (void *)v11[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __48__PLIOReportStats_currentValueForSimpleChannel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  if (IOReportChannelGetFormat() == 1)
  {
    IOReportChannelGetChannelName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      if (v4)
        v6 = (void *)v4;
      else
        v6 = &unk_1E6ABACA0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

    }
  }
  objc_autoreleasePoolPop(v2);
}

- (id)deltaValueForSimpleChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  if (v4)
  {
    -[PLIOReportStats getDeltaStats](self, "getDeltaStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    IOReportIterate();

    v6 = (void *)v11[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__PLIOReportStats_deltaValueForSimpleChannel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  if (IOReportChannelGetFormat() == 1)
  {
    IOReportChannelGetChannelName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      if (v4)
        v6 = (void *)v4;
      else
        v6 = &unk_1E6ABACA0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

    }
  }
  objc_autoreleasePoolPop(v2);
}

- (id)currentValueForStateChannel:(id)a3 atIndex:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  if (v5)
  {
    -[PLIOReportStats getCurrentStats](self, "getCurrentStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    IOReportIterate();

    v7 = (void *)v12[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __55__PLIOReportStats_currentValueForStateChannel_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  if (IOReportChannelGetFormat() == 2)
  {
    IOReportChannelGetChannelName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      IOReportStateGetDutyCycle();
      objc_msgSend(v4, "numberWithDouble:");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = (void *)v5;
      else
        v7 = &unk_1E6ABACA0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);

    }
  }
  objc_autoreleasePoolPop(v2);
}

- (id)deltaValueForStateChannel:(id)a3 atIndex:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  if (v5)
  {
    -[PLIOReportStats getDeltaStats](self, "getDeltaStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    IOReportIterate();

    v7 = (void *)v12[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __53__PLIOReportStats_deltaValueForStateChannel_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  if (IOReportChannelGetFormat() == 2)
  {
    IOReportChannelGetChannelName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      IOReportStateGetDutyCycle();
      objc_msgSend(v4, "numberWithDouble:");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = (void *)v5;
      else
        v7 = &unk_1E6ABACA0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);

    }
  }
  objc_autoreleasePoolPop(v2);
}

- (void)setSubscription:(__IOReportSubscriptionCF *)a3
{
  self->_subscription = a3;
}

- (void)setSubscribedChannels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)driverName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)previousIOReportSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreviousIOReportSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousIOReportSample, 0);
  objc_storeStrong((id *)&self->_driverName, 0);
  objc_storeStrong((id *)&self->_subscribedChannels, 0);
  objc_storeStrong((id *)&self->_sampleTimePrevious, 0);
  objc_storeStrong((id *)&self->_sampleTime, 0);
  objc_storeStrong((id *)&self->_ioReportSample, 0);
}

- (void)subscribeToGroup:(void *)a1 andSubGroup:withChannelIDs:manualChannelOnly:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "subscription");
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v1, v2, "IOReportSubscriptionRef returned subscription = %@ in PLIOReportStats", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)subscribeToGroup:(void *)a1 andSubGroup:withChannelIDs:manualChannelOnly:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "subscribedChannels");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v2, v3, "Subscribed to channels %@\n", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)subscribeToGroup:(uint64_t)a3 andSubGroup:(uint64_t)a4 withChannelIDs:(uint64_t)a5 manualChannelOnly:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, a2, a3, "IOReportCreateSubscription returned error = %@ in PLIOReportStats", a5, a6, a7, a8, 2u);
}

- (void)subscribeToGroup:(uint8_t *)a1 andSubGroup:(void *)a2 withChannelIDs:(uint64_t *)a3 manualChannelOnly:(NSObject *)a4 .cold.4(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "unsignedLongLongValue");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B6AB6000, a4, OS_LOG_TYPE_DEBUG, "Add manual channel with ID 0x%llx@\n", a1, 0xCu);
}

- (void)subscribeToGroup:(uint64_t)a3 andSubGroup:(uint64_t)a4 withChannelIDs:(uint64_t)a5 manualChannelOnly:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, a2, a3, "IOReportCopyFilteredChannels returned error = %@ in PLIOReportStats", a5, a6, a7, a8, 2u);
}

void __76__PLIOReportStats__parseIOReportSampleFromStats_convertingUnitToUnityScale___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Failed to parse: unsupported IOReport channel format %u", (uint8_t *)v2, 8u);
}

@end
