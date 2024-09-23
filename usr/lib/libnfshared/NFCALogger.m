@implementation NFCALogger

+ (id)sharedCALogger
{
  if (qword_1ECFF6968 != -1)
    dispatch_once(&qword_1ECFF6968, &__block_literal_global);
  return (id)_MergedGlobals_0;
}

- (unsigned)getDurationFrom:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  mach_timebase_info info;

  v4 = mach_continuous_time();
  info = 0;
  mach_timebase_info(&info);
  if ((v4 - a3) * info.numer / (1000000 * (unint64_t)info.denom) >= 0xFFFFFFFF)
    LODWORD(v5) = -1;
  else
    return (v4 - a3) * info.numer / (1000000 * (unint64_t)info.denom);
  return v5;
}

- (void)postCAEventFor:(id)a3 eventInput:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  void (*v10)(id, _QWORD *);
  _Unwind_Exception *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__NFCALogger_postCAEventFor_eventInput___block_invoke;
    v12[3] = &unk_1E7D7F100;
    v13 = v6;
    v8 = v5;
    v9 = v12;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v10 = (void (*)(id, _QWORD *))off_1ECFF6970;
    v18 = off_1ECFF6970;
    if (!off_1ECFF6970)
    {
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
      v14[3] = &unk_1E7D7F128;
      v14[4] = &v15;
      __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)v14);
      v10 = (void (*)(id, _QWORD *))v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v10)
    {
      dlerror();
      v11 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v11);
    }
    v10(v8, v9);

  }
}

id __40__NFCALogger_postCAEventFor_eventInput___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __28__NFCALogger_sharedCALogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = v0;

}

- (NFCALogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFCALogger;
  return -[NFCALogger init](&v3, sel_init);
}

- (id)getCALoggerUserDefaults
{
  NSUserDefaults *userDefault;
  NSUserDefaults *v4;
  NSUserDefaults *v5;

  userDefault = self->_userDefault;
  if (!userDefault)
  {
    v4 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.stockholm.analytics"));
    v5 = self->_userDefault;
    self->_userDefault = v4;

    userDefault = self->_userDefault;
  }
  return userDefault;
}

- (id)generateDailyUUIDForCA
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[NFCALogger getCALoggerUserDefaults](self, "getCALoggerUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringForKey:", CFSTR("dailyDeviceUUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("uuidUpdateDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isDateInToday:", v5),
          v6,
          !v4)
      || (v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dailyDeviceUUID"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("uuidUpdateDate"));

        objc_msgSend(v3, "synchronize");
        v4 = (void *)v9;
      }
      else
      {
        v4 = 0;
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRestrictedMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[NFCALogger getCALoggerUserDefaults](self, "getCALoggerUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("eSEInRestrictedMode"));

    objc_msgSend(v5, "synchronize");
  }

}

- (BOOL)restrictedMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[NFCALogger getCALoggerUserDefaults](self, "getCALoggerUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("eSEInRestrictedMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "BOOLValue"))
      v6 = objc_msgSend(v5, "BOOLValue");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeRestrictedMode
{
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NFCALogger getCALoggerUserDefaults](self, "getCALoggerUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("eSEInRestrictedMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("eSEInRestrictedMode"));
      objc_msgSend(v5, "synchronize");
    }
    else
    {
      v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v9)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v13 = 45;
        if (isMetaClass)
          v13 = 43;
        v9(3, "%c[%{public}s %{public}s]:%i Restricted mode for eSE is NOT set!", v13, ClassName, Name, 177);
        v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v14 = dispatch_get_specific(v7);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v15 = (id)_NFSharedLogClient[(_QWORD)v14];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        *(_DWORD *)buf = 67109890;
        v20 = v17;
        v21 = 2082;
        v22 = object_getClassName(self);
        v23 = 2082;
        v24 = sel_getName(a2);
        v25 = 1024;
        v26 = 177;
        _os_log_impl(&dword_1C34DB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Restricted mode for eSE is NOT set!", buf, 0x22u);
      }

    }
  }

}

- (unsigned)getHardwareTypeForCA:(unsigned int)a3
{
  if (a3 - 5 > 0xF)
    return 0;
  else
    return dword_1C3503B0C[a3 - 5];
}

- (id)generateUUID
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", v4);

  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, 16);
}

+ (unsigned)getBatteryPercent
{
  IOPSGetPercentRemaining();
  return 100;
}

- (void)getCAUniversityCode:(id)a3 universityCodes:(unsigned int *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;

  v5 = a3;
  v6 = v5;
  *a4 = 0;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v11 = 0;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "NF_asHexString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scanHexInt:", &v11);
    v10 = 0;
    while (v11 < gUniversityCodes[v10] || v11 > gUniversityCodes[v10 + 1])
    {
      v10 += 3;
      if (v10 == 15)
        goto LABEL_9;
    }
    *a4 = LOWORD(gUniversityCodes[v10 + 2]);
LABEL_9:

  }
}

- (unint64_t)getMiddlewareExceptionCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NFCALogger getCALoggerUserDefaults](self, "getCALoggerUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerForKey:", CFSTR("middlewareExceptionCount"));
  else
    v4 = 0;

  return v4;
}

- (void)resetCALoadStackExceptionCount
{
  -[NFCALogger _incrementMiddlewareExceptionCountWithReset:](self, "_incrementMiddlewareExceptionCountWithReset:", 1);
}

- (BOOL)_incrementMiddlewareExceptionCountWithReset:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  -[NFCALogger getCALoggerUserDefaults](self, "getCALoggerUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (!v3)
  {
    v7 = -[NFCALogger getMiddlewareExceptionCount](self, "getMiddlewareExceptionCount");
    if (v7 <= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("middlewareExceptionCount"));

      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "setObject:forKey:", &unk_1E7D88538, CFSTR("middlewareExceptionCount"));
LABEL_6:
  v9 = 1;
LABEL_8:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefault, 0);
}

@end
