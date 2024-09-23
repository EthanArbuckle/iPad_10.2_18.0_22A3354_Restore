@implementation SBWakeLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_31);
  return (id)__loggerInstance;
}

void __30__SBWakeLogger_sharedInstance__block_invoke()
{
  SBWakeLogger *v0;
  void *v1;

  v0 = objc_alloc_init(SBWakeLogger);
  v1 = (void *)__loggerInstance;
  __loggerInstance = (uint64_t)v0;

}

+ (id)sharedInstanceIfExists
{
  return (id)__loggerInstance;
}

- (SBWakeLogger)init
{
  SBWakeLogger *v3;
  void *v4;
  void *v5;
  void *v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *wakeSouceToEventDict;
  objc_super v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v12.receiver = self;
  v12.super_class = (Class)SBWakeLogger;
  v3 = -[SBWakeLogger init](&v12, sel_init);
  if (v3)
  {
    v15 = CFSTR("IOPropertyMatch");
    v13 = CFSTR("backlight-control");
    v14 = *MEMORY[0x1E0C9AE50];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_homeButtonType = objc_msgSend(v6, "homeButtonType");

    v7 = *MEMORY[0x1E0CBBAA8];
    v8 = IOServiceMatching("AppleSPUTimesync");
    v3->_timesyncService = IOServiceGetMatchingService(v7, v8);
    if (MGGetBoolAnswer())
      IOMobileFramebufferGetMainDisplay();
    else
      v3->_backlightService = IOServiceGetMatchingService(v7, (CFDictionaryRef)v5);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    wakeSouceToEventDict = v3->_wakeSouceToEventDict;
    v3->_wakeSouceToEventDict = v9;

  }
  kdebug_trace();
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  IOObjectRelease(self->_timesyncService);
  IOObjectRelease(self->_backlightService);
  v3.receiver = self;
  v3.super_class = (Class)SBWakeLogger;
  -[SBWakeLogger dealloc](&v3, sel_dealloc);
}

- (NSString)activeWakeSourceDescription
{
  return (NSString *)SBWakeLoggerSourceDescription(self->_activeWakeLoggerSource);
}

- (void)wakeMayBegin:(int64_t)a3 withTimestamp:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  SBWakeEvent *v8;
  NSMutableDictionary *wakeSouceToEventDict;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v8 = -[SBWakeEvent initWithTimestamp:]([SBWakeEvent alloc], "initWithTimestamp:", a4);
  wakeSouceToEventDict = self->_wakeSouceToEventDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](wakeSouceToEventDict, "setObject:forKeyedSubscript:", v8, v10);

  os_unfair_lock_unlock(p_lock);
}

- (void)wakeDidBegin:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[SBWakeLogger _lock_wakeDidBegin:](self, "_lock_wakeDidBegin:", a3);
  self->_activeWakeLoggerSource = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)wakeDidEnd
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_trackingWake)
  {
    self->_trackingWake = 0;
    v4 = (void *)IORegistryEntrySearchCFProperty(self->_backlightService, "IOService", CFSTR("displayOnContinuousTimestamp"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    SBLogTailspinSignposts();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v6 = 134349056;
      v7 = objc_msgSend(v4, "unsignedLongLongValue");
      _os_signpost_emit_with_name_impl(&dword_18AB69000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT", "%{public,signpost.description:end_time}llu enableTelemetry=YES ", (uint8_t *)&v6, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)lockDidBegin
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary removeAllObjects](self->_wakeSouceToEventDict, "removeAllObjects");
  self->_activeWakeLoggerSource = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_wakeDidBegin:(int64_t)a3
{
  __int128 v5;
  io_registry_entry_t timesyncService;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v8;
  const __CFNumber *Value;
  Boolean v10;
  const __CFNumber *v11;
  unsigned __int8 v12;
  const __CFNumber *v13;
  Boolean v14;
  const __CFNumber *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t homeButtonType;
  NSObject *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  int64_t v46;
  NSMutableDictionary *obj;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 valuePtr;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE info[12];
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_backlightService)
  {
    v55 = 0;
    v56 = 0;
    mach_get_times();
    v5 = 0uLL;
    valuePtr = 0u;
    v54 = 0u;
    timesyncService = self->_timesyncService;
    if (timesyncService)
    {
      CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(timesyncService, CFSTR("timesync"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      if (CFProperty)
      {
        v8 = CFProperty;
        Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, CFSTR("ap"));
        v10 = CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
        v11 = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("ap-cont"));
        v12 = v10 & CFNumberGetValue(v11, kCFNumberLongLongType, (char *)&valuePtr + 8);
        v13 = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("spu"));
        v14 = CFNumberGetValue(v13, kCFNumberLongLongType, &v54);
        v15 = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("calendar"));
        v48 = v12 & (v14 & CFNumberGetValue(v15, kCFNumberLongLongType, (char *)&v54 + 8)) & 1;
        CFRelease(v8);
      }
      else
      {
        v48 = 0;
      }
      v5 = 0uLL;
    }
    else
    {
      v48 = 0;
    }
    v51 = v5;
    v52 = v5;
    v49 = v5;
    v50 = v5;
    obj = self->_wakeSouceToEventDict;
    v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v50;
      *(_QWORD *)&v17 = 134349056;
      v45 = v17;
      v46 = a3;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v20);
          -[NSMutableDictionary objectForKey:](self->_wakeSouceToEventDict, "objectForKey:", v21, v45);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "integerValue");
          v24 = objc_msgSend(v22, "eventRecvContTimestamp");
          v25 = objc_msgSend(v22, "eventAbsTimestamp");
          if (v23 <= 6)
          {
            v26 = v25;
            if (((1 << v23) & 0x66) != 0)
            {
              if (!v48)
                goto LABEL_33;
              v27 = valuePtr;
              v28 = v54;
              *(_QWORD *)info = 0;
              mach_timebase_info((mach_timebase_info_t)info);
              v29 = v26 * (unint64_t)*(unsigned int *)info / *(unsigned int *)&info[4];
              v30 = v28 - v27;
              goto LABEL_17;
            }
            if (v23 == 3)
            {
              homeButtonType = self->_homeButtonType;
              if (homeButtonType != 1)
              {
                if (homeButtonType)
                  goto LABEL_33;
                goto LABEL_23;
              }
              if (!v48)
                goto LABEL_33;
              v42 = valuePtr;
              v43 = v54;
              *(_QWORD *)info = 0;
              mach_timebase_info((mach_timebase_info_t)info);
              v29 = v26 * (unint64_t)*(unsigned int *)info / *(unsigned int *)&info[4];
              v30 = v43 - v42;
LABEL_17:
              v31 = (v30 + v29) / 0x3E8;
              *(_QWORD *)info = 0;
              mach_timebase_info((mach_timebase_info_t)info);
              v32 = v31 * *(unsigned int *)&info[4];
              a3 = v46;
              v33 = 1000 * v32 / *(unsigned int *)info;
            }
            else
            {
              if (v23 != 4)
                goto LABEL_33;
LABEL_23:
              v57 = 0;
              *(_QWORD *)info = 0;
              mach_get_times();
              v33 = v57 + v26 - *(_QWORD *)info;
            }
            if (v23 == a3)
            {
              self->_trackingWake = 1;
              SBLogTailspinSignposts();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v35))
              {
                SBWakeLoggerSourceDescription(a3);
                v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v37 = objc_msgSend(v36, "UTF8String");
                *(_DWORD *)info = 134349314;
                *(_QWORD *)&info[4] = v33;
                v59 = 2082;
                v60 = v37;
                _os_signpost_emit_with_name_impl(&dword_18AB69000, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT", "%{public,signpost.description:begin_time,public}llu WakeReason=%{public,signpost.telemetry:string1}s enableTelemetry=YES ", info, 0x16u);

              }
            }
            SBLogTailspinSignposts();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v38))
            {
              SBWakeLoggerSourceDescription(a3);
              v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v40 = objc_msgSend(v39, "UTF8String");
              *(_DWORD *)info = 134349314;
              *(_QWORD *)&info[4] = v33;
              v59 = 2082;
              v60 = v40;
              _os_signpost_emit_with_name_impl(&dword_18AB69000, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT_HID_LATENCY", "%{public,signpost.description:begin_time}llu WakeReason=%{public,signpost.telemetry:string1}s enableTelemetry=YES ", info, 0x16u);

            }
            SBLogTailspinSignposts();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v41))
            {
              *(_DWORD *)info = v45;
              *(_QWORD *)&info[4] = v24;
              _os_signpost_emit_with_name_impl(&dword_18AB69000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT_HID_LATENCY", "%{public,signpost.description:end_time}llu enableTelemetry=YES ", info, 0xCu);
            }

          }
LABEL_33:

          ++v20;
        }
        while (v18 != v20);
        v44 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        v18 = v44;
      }
      while (v44);
    }

    -[NSMutableDictionary removeAllObjects](self->_wakeSouceToEventDict, "removeAllObjects");
  }
}

- (BOOL)trackingWake
{
  return self->_trackingWake;
}

- (void)setTrackingWake:(BOOL)a3
{
  self->_trackingWake = a3;
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (unsigned)timesyncService
{
  return self->_timesyncService;
}

- (void)setTimesyncService:(unsigned int)a3
{
  self->_timesyncService = a3;
}

- (unsigned)backlightService
{
  return self->_backlightService;
}

- (void)setBacklightService:(unsigned int)a3
{
  self->_backlightService = a3;
}

- (NSMutableDictionary)wakeSouceToEventDict
{
  return self->_wakeSouceToEventDict;
}

- (void)setWakeSouceToEventDict:(id)a3
{
  objc_storeStrong((id *)&self->_wakeSouceToEventDict, a3);
}

- (int64_t)activeWakeLoggerSource
{
  return self->_activeWakeLoggerSource;
}

- (void)setActiveWakeLoggerSource:(int64_t)a3
{
  self->_activeWakeLoggerSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeSouceToEventDict, 0);
}

@end
