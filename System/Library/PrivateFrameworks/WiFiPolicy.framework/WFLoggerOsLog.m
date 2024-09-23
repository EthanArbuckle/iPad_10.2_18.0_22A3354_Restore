@implementation WFLoggerOsLog

+ (void)WFLogOsLog:(unint64_t)a3 cfStrMsg:(__CFString *)a4
{
  os_log_type_t v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = +[WFLoggerOsLog convertWFLogLevelToOsLogLevel:](WFLoggerOsLog, "convertWFLogLevelToOsLogLevel:", a3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], v5))
  {
    v6 = 138543362;
    v7 = a4;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], v5, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

+ (unsigned)convertWFLogLevelToOsLogLevel:(unint64_t)a3
{
  unint64_t v3;

  v3 = 0x111000010200uLL >> (8 * a3);
  if (a3 >= 6)
    LOBYTE(v3) = 0;
  return v3;
}

- (id)init:(id)a3 subSystem:(__CFString *)a4 category:(__CFString *)a5 logLifespanInDays:(unint64_t)a6 logLevel:(unint64_t)a7 logPrivacy:(unint64_t)a8 dispatchQueue:(id)a9
{
  WFLoggerOsLog *v15;
  WFLoggerOsLog *v16;
  NSString *v17;
  unint64_t v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *context;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)WFLoggerOsLog;
  v15 = -[WFLoggerOsLog init](&v35, sel_init);
  v16 = v15;
  if (a5 && a4 && a3 && v15)
  {
    v15->super._ctxt = (WFLogger *)a3;
    v15->_subSystem = a4;
    v15->_category = a5;
    v15->super._dispatchQueue = (OS_dispatch_queue *)a9;
    v15->_osLog = (OS_os_log *)MEMORY[0x1E0C81028];
    v17 = -[WFLoggerOsLog getProfileFilePath](v15, "getProfileFilePath");
    if (!-[WFLoggerOsLog doesProfileExist:](v16, "doesProfileExist:", v17))
      -[WFLoggerOsLog createOsLogProfile](v16, "createOsLogProfile");
    if (a6 >= 0x1E)
      v18 = 30;
    else
      v18 = a6;
    v16->_logLifeSpanInDays = v18;
    -[WFLoggerOsLog setLogLifespanInDays:](v16, "setLogLifespanInDays:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
    -[WFLoggerOsLog setLogLevelEnable:](v16, "setLogLevelEnable:", a7);
    -[WFLoggerOsLog setLogLevelPersist:](v16, "setLogLevelPersist:", a7);
    -[WFLoggerOsLog setLogPrivacy:](v16, "setLogPrivacy:", a8);
    v16->_osLog = (OS_os_log *)os_log_create((const char *)-[__CFString UTF8String](v16->_subSystem, "UTF8String"), (const char *)-[__CFString UTF8String](v16->_category, "UTF8String"));
    if (-[WFLoggerOsLog doesProfileExist:](v16, "doesProfileExist:", v17))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v17);
      v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isReadableFileAtPath:", v17);
      v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isWritableFileAtPath:", v17);
      context = (void *)MEMORY[0x1D17AC818]();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = -[NSString UTF8String](v17, "UTF8String");
      if (v20)
        v24 = "YES";
      else
        v24 = "NO";
      if (v21)
        v25 = "YES";
      else
        v25 = "NO";
      v26 = objc_msgSend(v22, "stringWithFormat:", CFSTR("OSLog Profile is %s. Readable:%s Writable:%s Custom settings: levelEnabled:%s levelPersist:%s ttlDays:%d privacy:%s"), v23, v24, v25, objc_msgSend(-[WFLoggerOsLog getLevelEnabled:category:](v16, "getLevelEnabled:category:", v19, CFSTR("DEFAULT-OPTIONS")), "UTF8String"), objc_msgSend(-[WFLoggerOsLog getLevelPersist:category:](v16, "getLevelPersist:category:", v19, CFSTR("DEFAULT-OPTIONS")),
                "UTF8String"),
              objc_msgSend(-[WFLoggerOsLog getTtlDays:category:](v16, "getTtlDays:category:", v19, CFSTR("DEFAULT-OPTIONS")), "unsignedIntValue"), objc_msgSend(-[WFLoggerOsLog getPrivacy:category:](v16, "getPrivacy:category:", v19, CFSTR("DEFAULT-OPTIONS")), "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v26;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      objc_autoreleasePoolPop(context);
      v27 = (void *)MEMORY[0x1D17AC818]();
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v28;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      objc_autoreleasePoolPop(v27);
      v16->_currentLevel = -[WFLoggerOsLog getLogLevelEnable](v16, "getLogLevelEnable");

    }
    else
    {
      v31 = (void *)MEMORY[0x1D17AC818]();
      v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OSLog Profile %s doesn't exist"), -[NSString UTF8String](v17, "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v32;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      objc_autoreleasePoolPop(v31);
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1D17AC818]();
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Failed to init: %p %p %p %p"), "-[WFLoggerOsLog init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:]", v16, a3, a4, a5);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v30;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    objc_autoreleasePoolPop(v29);

    return 0;
  }
  return v16;
}

- (void)dealloc
{
  OS_os_log *osLog;
  objc_super v4;

  osLog = self->_osLog;
  if (osLog)
  {

    self->_osLog = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFLoggerOsLog;
  -[WFLoggerOsLog dealloc](&v4, sel_dealloc);
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  unsigned __int8 v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  NSObject *osLog;
  _BOOL4 v16;
  const char *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = -[WFLoggerOsLog convertLogLevel:](self, "convertLogLevel:");
  if (self->_currentLevel <= a3 && self->_category)
  {
    v12 = v11;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a5);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v13, a6);
    osLog = self->_osLog;
    v16 = os_log_type_enabled(osLog, v12);
    if (a4 == 2)
    {
      if (v16)
      {
        v18 = 138543362;
        v19 = v14;
        v17 = "%{public}@";
LABEL_8:
        _os_log_impl(&dword_1CC44E000, osLog, v12, v17, (uint8_t *)&v18, 0xCu);
      }
    }
    else if (v16)
    {
      v18 = 138477827;
      v19 = v14;
      v17 = "%{private}@";
      goto LABEL_8;
    }

  }
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
  os_log_type_t v9;
  os_log_type_t v10;
  NSObject *osLog;
  _BOOL4 v12;
  const char *v13;
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = -[WFLoggerOsLog convertLogLevel:](self, "convertLogLevel:");
  if (self->_currentLevel <= a3 && self->_category)
  {
    v10 = v9;
    osLog = self->_osLog;
    v12 = os_log_type_enabled(osLog, v9);
    if (a4 == 2)
    {
      if (!v12)
        return;
      v14 = 138543362;
      v15 = a5;
      v13 = "%{public}@";
    }
    else
    {
      if (!v12)
        return;
      v14 = 138477827;
      v15 = a5;
      v13 = "%{private}@";
    }
    _os_log_impl(&dword_1CC44E000, osLog, v10, v13, (uint8_t *)&v14, 0xCu);
  }
}

- (unsigned)convertLogLevel:(unint64_t)a3
{
  return +[WFLoggerOsLog convertWFLogLevelToOsLogLevel:](WFLoggerOsLog, "convertWFLogLevelToOsLogLevel:", a3);
}

- (id)formatOsLogProfile:(id)a3 levelEnabled:(id)a4 levelPersist:(id)a5 ttlDays:(id)a6 privacy:(id)a7
{
  void *v11;
  void *v12;
  void *v13;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4, a5, a6);
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", a4, CFSTR("Enable"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", a5, CFSTR("Persist"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("Level"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("TTL"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", a7, CFSTR("Default-Privacy-Setting"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("Enable-Oversize-Messages"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(a3, "UTF8String")));
  return v11;
}

- (id)getLevelEnabled:(id)a3 category:(id)a4
{
  if (a3 && a4)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", CFSTR("Level")), "objectForKeyedSubscript:", CFSTR("Enable"));
  else
    return 0;
}

- (id)getLevelPersist:(id)a3 category:(id)a4
{
  if (a3 && a4)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", CFSTR("Level")), "objectForKeyedSubscript:", CFSTR("Persist"));
  else
    return 0;
}

- (id)getTtlDays:(id)a3 category:(id)a4
{
  if (a3 && a4)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", CFSTR("TTL")), "objectForKeyedSubscript:", CFSTR("Default"));
  else
    return 0;
}

- (id)getPrivacy:(id)a3 category:(id)a4
{
  if (a3 && a4)
    return (id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", CFSTR("Default-Privacy-Setting"));
  else
    return 0;
}

- (unsigned)writeDictToFile:(id)a3 idStr:(id)a4
{
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  if ((objc_msgSend(a3, "writeToFile:atomically:", -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath"), 1) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1D17AC818]();
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s NOT updated"), objc_msgSend(a4, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    objc_autoreleasePoolPop(v6);
    return 0;
  }
  return v5;
}

- (unsigned)setLevelEnabled:(id)a3 category:(id)a4 value:(id)a5
{
  id v6;

  if (a3
    && a4
    && a5
    && (v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:](self, "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:", a4, a5, -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:"), -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", a3, a4), -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", a3, a4))) != 0)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, CFSTR("LevelEnabled"));
  }
  else
  {
    return 0;
  }
}

- (unsigned)setLevelPersist:(id)a3 category:(id)a4 value:(id)a5
{
  id v6;

  if (a3
    && a4
    && a5
    && (v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:](self, "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:", a4, -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:"), a5, -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", a3, a4), -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", a3, a4))) != 0)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, CFSTR("LevelPersist"));
  }
  else
  {
    return 0;
  }
}

- (unsigned)setTtlDays:(id)a3 category:(id)a4 value:(id)a5
{
  id v6;

  if (a3
    && a4
    && a5
    && (v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:](self, "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:", a4, -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:"), -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:", a3, a4), a5, -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", a3, a4))) != 0)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, CFSTR("TtlDays"));
  }
  else
  {
    return 0;
  }
}

- (unsigned)setPrivacy:(id)a3 category:(id)a4 value:(id)a5
{
  id v6;

  if (a3
    && a4
    && a5
    && (v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:](self, "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:", a4, -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:"), -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:", a3, a4), -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", a3, a4), a5)) != 0)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, CFSTR("Privacy"));
  }
  else
  {
    return 0;
  }
}

- (void)createOsLogProfile
{
  const __CFString *v3;
  id v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[WFLoggerBase WFIsInternalInstall](self, "WFIsInternalInstall"))
    v3 = CFSTR("Debug");
  else
    v3 = CFSTR("Default");
  v4 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:](self, "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:", CFSTR("DEFAULT-OPTIONS"), v3, v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0), CFSTR("Public"));
  v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    v6 = (void *)MEMORY[0x1D17AC818]();
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File %s already exists"), -[NSString UTF8String](v5, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      v8 = MEMORY[0x1E0C81028];
LABEL_19:
      _os_log_impl(&dword_1CC44E000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    v14 = 0;
    if (v4)
      v9 = v4;
    else
      v9 = (id)MEMORY[0x1E0C9AA70];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9), 200, 0, 0), "writeToFile:options:error:", v5, 1, &v14) & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1D17AC818]();
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File %s created with defaults"), -[NSString UTF8String](v5, "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_19;
      }
    }
    else
    {
      if (v14)
      {
        v11 = (void *)MEMORY[0x1D17AC818]();
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v14);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        objc_autoreleasePoolPop(v11);
      }
      v6 = (void *)MEMORY[0x1D17AC818]();
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File NOT created %s"), -[NSString UTF8String](v5, "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v13;
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_19;
      }
    }
  }
  objc_autoreleasePoolPop(v6);
}

- (NSString)getProfileFilePath
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("/Library/Preferences/Logging/Subsystems/"));
  return (NSString *)objc_msgSend(v3, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.plist"), -[__CFString UTF8String](self->_subSystem, "UTF8String")));
}

- (unsigned)doesProfileExist:(id)a3
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", a3);
}

- (void)setLogLifespanInDays:(id)a3
{
  NSString *v5;
  id v6;

  v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v5);
    -[WFLoggerOsLog setTtlDays:category:value:](self, "setTtlDays:category:value:", v6, CFSTR("DEFAULT-OPTIONS"), a3);

  }
}

- (id)getLogLifespanInDays
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3))
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v3);
  v5 = -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", v4, CFSTR("DEFAULT-OPTIONS"));

  return v5;
}

- (void)setLogPrivacy:(unint64_t)a3
{
  NSString *v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;

  v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v5);
    v8 = (id)v6;
    if (a3 == 2)
      v7 = CFSTR("Public");
    else
      v7 = CFSTR("Private");
    -[WFLoggerOsLog setPrivacy:category:value:](self, "setPrivacy:category:value:", v6, CFSTR("DEFAULT-OPTIONS"), v7);

  }
}

- (unint64_t)getLogPrivacy
{
  NSString *v3;
  void *v4;
  unint64_t v5;

  v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3))
    return 2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v3);
  if (objc_msgSend(-[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", v4, CFSTR("DEFAULT-OPTIONS")), "isEqualToString:", CFSTR("Public")))v5 = 2;
  else
    v5 = 1;

  return v5;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
  NSString *v5;
  id v6;

  v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v5);
    -[WFLoggerOsLog setLevelEnabled:category:value:](self, "setLevelEnabled:category:value:", v6, CFSTR("DEFAULT-OPTIONS"), -[WFLoggerOsLog mapLogLevelEnum:](self, "mapLogLevelEnum:", a3));
    self->_currentLevel = -[WFLoggerOsLog getLogLevelEnable](self, "getLogLevelEnable");

  }
}

- (unint64_t)getLogLevelEnable
{
  NSString *v3;
  void *v4;
  unint64_t v5;

  v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3))
    return 3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v3);
  v5 = -[WFLoggerOsLog mapLogLevelStr:](self, "mapLogLevelStr:", -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:", v4, CFSTR("DEFAULT-OPTIONS")));

  return v5;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
  NSString *v5;
  id v6;

  v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v5);
    -[WFLoggerOsLog setLevelPersist:category:value:](self, "setLevelPersist:category:value:", v6, CFSTR("DEFAULT-OPTIONS"), -[WFLoggerOsLog mapLogLevelEnum:](self, "mapLogLevelEnum:", a3));

  }
}

- (unint64_t)getLogLevelPersist
{
  NSString *v3;
  void *v4;
  unint64_t v5;

  v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3))
    return 3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v3);
  v5 = -[WFLoggerOsLog mapLogLevelStr:](self, "mapLogLevelStr:", -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:", v4, CFSTR("DEFAULT-OPTIONS")));

  return v5;
}

- (id)mapLogLevelEnum:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Default");
  if (a3 == 2)
    v3 = CFSTR("Info");
  if (a3 == 1)
    return CFSTR("Debug");
  else
    return (id)v3;
}

- (unint64_t)mapLogLevelStr:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Debug")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Info")) & 1) != 0)
    return 2;
  objc_msgSend(a3, "isEqualToString:", CFSTR("Default"));
  return 3;
}

- (void)setMaxSizeInKb:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17AC818](self, a2, a3);
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerOsLog setMaxSizeInKb:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_autoreleasePoolPop(v3);
}

- (unint64_t)getMaxFileSizeInMB
{
  void *v2;
  uint64_t v3;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17AC818](self, a2);
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerOsLog getMaxFileSizeInMB]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_autoreleasePoolPop(v2);
  return 0;
}

@end
