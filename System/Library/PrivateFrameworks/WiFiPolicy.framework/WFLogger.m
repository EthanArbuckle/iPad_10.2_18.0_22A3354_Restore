@implementation WFLogger

void __26__WFLogger_WFLog_message___block_invoke_2(_QWORD *a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1[4] + 8), "WFLog:privacy:cfStrMsg:", a1[6], *(_QWORD *)(a1[4] + 24), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  v2 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
}

void __26__WFLogger_WFLog_message___block_invoke(uint64_t a1)
{
  const void *v2;

  +[WFLoggerOsLog WFLogOsLog:cfStrMsg:](WFLoggerOsLog, "WFLogOsLog:cfStrMsg:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)WFLog:(unint64_t)a3 message:(const char *)a4
{
  const __CFAllocator *v7;
  const __CFString *v8;
  CFStringRef v9;
  __CFString *Mutable;
  uint64_t v11;
  CFStringRef v12;
  NSObject *dispatchQueue;
  NSObject *v14;
  _QWORD v15[7];
  _QWORD block[6];
  timeval v17;
  tm v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  va_list v23;
  uint64_t v24;

  objc_sync_enter(self);
  if (self->_loggerBase && self->_destination != 1)
  {
    v22 = 0;
    v23 = (va_list)&v24;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 0x8000100u);
    if (v8 || (v8 = CFStringCreateWithCString(v7, a4, 0)) != 0)
    {
      if (self->_destination == 2)
      {
        v9 = CFStringCreateWithFormatAndArguments(v7, 0, v8, v23);
        v20[3] = (uint64_t)v9;
      }
      else
      {
        memset(&v18, 0, sizeof(v18));
        v17.tv_sec = 0;
        *(_QWORD *)&v17.tv_usec = 0;
        gettimeofday(&v17, 0);
        localtime_r(&v17.tv_sec, &v18);
        Mutable = CFStringCreateMutable(v7, 0);
        v20[3] = (uint64_t)Mutable;
        CFStringAppendFormat(Mutable, 0, CFSTR("%02d/%02d/%04d %2d:%02d:%02d.%03d "), (v18.tm_mon + 1), v18.tm_mday, (v18.tm_year + 1900), v18.tm_hour, v18.tm_min, v18.tm_sec, (v17.tv_usec / 1000));
        CFStringAppendFormatAndArguments((CFMutableStringRef)v20[3], 0, v8, v23);
      }
      v11 = MEMORY[0x1E0C809B0];
      if (self->_destination != 2
        && (!self->_wflRunningOnWatchClassDevice || self->_wflEnableDualLoggingOnWatchClassDevice))
      {
        *(_QWORD *)&v18.tm_sec = 0;
        *(_QWORD *)&v18.tm_hour = &v18;
        *(_QWORD *)&v18.tm_mon = 0x2020000000;
        *(_QWORD *)&v18.tm_wday = 0;
        v12 = CFStringCreateWithFormatAndArguments(v7, 0, v8, v23);
        *(_QWORD *)(*(_QWORD *)&v18.tm_hour + 24) = v12;
        dispatchQueue = self->_dispatchQueue;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __26__WFLogger_WFLog_message___block_invoke;
        block[3] = &unk_1E881D880;
        block[4] = &v18;
        block[5] = a3;
        dispatch_async(dispatchQueue, block);
        _Block_object_dispose(&v18, 8);
      }
      CFRelease(v8);
      v14 = self->_dispatchQueue;
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __26__WFLogger_WFLog_message___block_invoke_2;
      v15[3] = &unk_1E881D8A8;
      v15[4] = self;
      v15[5] = &v19;
      v15[6] = a3;
      dispatch_async(v14, v15);
    }
    _Block_object_dispose(&v19, 8);
  }
  objc_sync_exit(self);
}

+ (id)sharedWFLoggerSingleton
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  v4 = (id)_sharedWFLoggerSingleton;
  if (!_sharedWFLoggerSingleton)
  {
    v4 = objc_alloc_init((Class)a1);
    _sharedWFLoggerSingleton = (uint64_t)v4;
  }
  objc_sync_exit(v3);
  return v4;
}

- (WFLogger)init
{
  WFLogger *result;
  WFLogger *v4;
  WFLogger *v5;
  objc_super v6;

  result = (WFLogger *)_sharedWFLoggerSingleton;
  if (!_sharedWFLoggerSingleton)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFLogger;
    v4 = -[WFLogger init](&v6, sel_init);
    if (v4)
    {
      v5 = v4;
      v4->_destination = 1;
      v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wflogger", 0);
      -[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:](v5, "setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:", CFSTR("com.apple.WiFiPolicy"), &stru_1E881F240, 7, 3, 2);
      _sharedWFLoggerSingleton = (uint64_t)v5;
      v5->_wflRunningOnWatchClassDevice = MGGetSInt32Answer() == 6;
      v5->_wflEnableDualLoggingOnWatchClassDevice = 1;
    }
    return (WFLogger *)_sharedWFLoggerSingleton;
  }
  return result;
}

- (unint64_t)getDestination
{
  return self->_destination;
}

- (id)loggerBase
{
  return self->_loggerBase;
}

- (void)setDestinationCircularBuffer
{
  WFLoggerBase *loggerBase;
  WFLoggerCircularBuffer *v4;

  if (self->_destination != 4)
  {
    loggerBase = self->_loggerBase;
    if (loggerBase)
    {

      self->_loggerBase = 0;
    }
    v4 = objc_alloc_init(WFLoggerCircularBuffer);
    if (v4)
    {
      self->_loggerBase = &v4->super;
      self->_destination = 4;
    }
  }
}

- (void)setDestinationFile:(__CFString *)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9
{
  void *v16;
  WFLoggerBase *loggerBase;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *dispatchQueue;
  _QWORD block[11];
  unsigned __int8 v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEmpty](a3, "isEmpty"))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s filePath is empty"), "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v16, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else if (self->_destination != 3
         || (loggerBase = self->_loggerBase) == 0
         || (v18 = (const __CFString *)-[WFLoggerBase getLogFilePath](loggerBase, "getLogFilePath")) == 0
         || CFStringCompare(a3, v18, 4uLL))
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Logging destination will change to file: %s"), "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]", -[__CFString UTF8String](a3, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v19, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (self->_wflRunningOnWatchClassDevice)
    {
      if (!self->_wflEnableDualLoggingOnWatchClassDevice)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Dual logging suppressed on watch class device. WiFi logs will not be present in the system log while file logging is configured"), "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v20, "UTF8String")), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v26 = v21;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__WFLogger_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke;
    block[3] = &unk_1E881D808;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    v24 = a6;
    block[8] = a7;
    block[9] = a8;
    block[10] = a9;
    dispatch_sync(dispatchQueue, block);
  }
}

void __109__WFLogger_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke(uint64_t a1)
{
  void *v2;
  WFLoggerFile *v3;
  WFLoggerFile *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    objc_msgSend(v2, "stopWatchingLogFile");
  v3 = -[WFLoggerFile initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]([WFLoggerFile alloc], "initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v5)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    }
    -[WFLoggerFile schedule:](v4, "schedule:", 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v4;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Logging destination changed to file: %s"), "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]_block_invoke", objc_msgSend(*(id *)(a1 + 40), "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v6, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setDestinationFileLocation:(__CFString *)a3 fileNamePrefix:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10
{
  void *v17;
  WFLoggerBase *loggerBase;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *dispatchQueue;
  _QWORD block[12];
  unsigned __int8 v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEmpty](a3, "isEmpty"))
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s dirPath is empty"), "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
LABEL_6:
    *(_DWORD *)buf = 136446210;
    v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v17, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    return;
  }
  if (-[__CFString isEmpty](a4, "isEmpty"))
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s fileNamePrefix is empty"), "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    goto LABEL_6;
  }
  if (self->_destination != 3
    || (loggerBase = self->_loggerBase) == 0
    || (v19 = (__CFString *)-[WFLoggerBase getLogDirPath](loggerBase, "getLogDirPath"),
        v20 = -[WFLoggerBase getLogFileNamePrefix](self->_loggerBase, "getLogFileNamePrefix"),
        !v19)
    || (v21 = (__CFString *)v20) == 0
    || (-[__CFString isEmpty](v19, "isEmpty") & 1) != 0
    || (-[__CFString isEmpty](v21, "isEmpty") & 1) != 0
    || CFStringCompare(a3, v19, 4uLL)
    || CFStringCompare(a4, v21, 4uLL))
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Logging destination will change to directory: %s FileNamePrefix: %s"), "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]", -[__CFString UTF8String](a3, "UTF8String"), -[__CFString UTF8String](a4, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v22, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (self->_wflRunningOnWatchClassDevice && !self->_wflEnableDualLoggingOnWatchClassDevice)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Dual logging suppressed on watch class device. WiFi logs will not be present in the system log while file logging is configured"), "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v23, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v29 = v24;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__WFLogger_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke;
    block[3] = &unk_1E881D830;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    v27 = a7;
    block[8] = a6;
    block[9] = a8;
    block[10] = a9;
    block[11] = a10;
    dispatch_sync(dispatchQueue, block);
  }
}

void __132__WFLogger_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke(uint64_t a1)
{
  void *v2;
  WFLoggerFile *v3;
  WFLoggerFile *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    objc_msgSend(v2, "stopWatchingLogFile");
  v3 = -[WFLoggerFile initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]([WFLoggerFile alloc], "initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v5)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    }
    -[WFLoggerFile schedule:](v4, "schedule:", 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v4;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Logging destination changed to directory: %s FileNamePrefix: %s"), "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]_block_invoke", objc_msgSend(*(id *)(a1 + 40), "UTF8String"), objc_msgSend(*(id *)(a1 + 48), "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v6, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setDestinationOsLog:(__CFString *)a3 category:(__CFString *)a4 logLifespanInDays:(unint64_t)a5 logLevel:(unint64_t)a6 logPrivacy:(unint64_t)a7
{
  void *v13;
  NSObject *dispatchQueue;
  _QWORD block[10];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEmpty](a3, "isEmpty"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s subSystem is empty"), "-[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v13, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else if (self->_destination != 2)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__WFLogger_setDestinationOsLog_category_logLifespanInDays_logLevel_logPrivacy___block_invoke;
    block[3] = &unk_1E881D858;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    block[9] = a7;
    dispatch_sync(dispatchQueue, block);
  }
}

id __79__WFLogger_setDestinationOsLog_category_logLifespanInDays_logLevel_logPrivacy___block_invoke(uint64_t a1)
{
  void *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    objc_msgSend(v2, "stopWatchingLogFile");
  result = -[WFLoggerOsLog init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:]([WFLoggerOsLog alloc], "init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 8))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Logging destination changed to system wide logging (os_log)"), "-[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]_block_invoke");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v6, "UTF8String")), "UTF8String");
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v5 + 8) = v4;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 2;
    result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getLogPrivacy");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  }
  return result;
}

- (void)dump
{
  WFLoggerBase *loggerBase;

  loggerBase = self->_loggerBase;
  if (loggerBase)
    -[WFLoggerBase dump](loggerBase, "dump");
}

- (NSNumber)getLogLifespanInDays
{
  NSNumber *result;

  result = (NSNumber *)self->_loggerBase;
  if (result)
    return (NSNumber *)-[NSNumber getLogLifespanInDays](result, "getLogLifespanInDays");
  return result;
}

- (unint64_t)getLogPrivacy
{
  WFLoggerBase *loggerBase;

  loggerBase = self->_loggerBase;
  if (loggerBase)
    return -[WFLoggerBase getLogPrivacy](loggerBase, "getLogPrivacy");
  else
    return 1;
}

- (unint64_t)getLogLevelEnable
{
  WFLoggerBase *loggerBase;

  loggerBase = self->_loggerBase;
  if (loggerBase)
    return -[WFLoggerBase getLogLevelEnable](loggerBase, "getLogLevelEnable");
  else
    return 3;
}

- (unint64_t)getLogLevelPersist
{
  WFLoggerBase *loggerBase;

  loggerBase = self->_loggerBase;
  if (loggerBase)
    return -[WFLoggerBase getLogLevelPersist](loggerBase, "getLogLevelPersist");
  else
    return 3;
}

- (unint64_t)getMaxFileSizeInMB
{
  unint64_t result;

  result = (unint64_t)self->_loggerBase;
  if (result)
    return objc_msgSend((id)result, "getMaxFileSizeInMB");
  return result;
}

@end
