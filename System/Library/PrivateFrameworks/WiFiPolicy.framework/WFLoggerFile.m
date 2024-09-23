@implementation WFLoggerFile

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
  -[WFLoggerFile writeToFile:cfStrMsg:](self, "writeToFile:cfStrMsg:", a3, a5);
}

- (void)writeToFile:(unint64_t)a3 cfStrMsg:(__CFString *)a4
{
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_filePtr)
  {
    SCPrint();
  }
  else
  {
    if (writeToFile_cfStrMsg__onceToken != -1)
      dispatch_once(&writeToFile_cfStrMsg__onceToken, &__block_literal_global_5);
    v5 = (void *)MEMORY[0x1D17AC818]();
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a4);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    objc_autoreleasePoolPop(v5);
  }
}

- (__CFString)getLogFilePath
{
  return self->_logFilePath;
}

- (__CFString)getLogDirPath
{
  return self->_directoryPath;
}

- (__CFString)getLogFileNamePrefix
{
  return self->_fileNamePrefix;
}

- (id)mapLogLevelEnum:(unint64_t)a3
{
  if (a3 == 4)
    return CFSTR("ERROR");
  else
    return CFSTR("NOTICE");
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  void *v9;
  id v10;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a5);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v9, a6);
  -[WFLoggerFile writeToFile:cfStrMsg:](self, "writeToFile:cfStrMsg:", a3, v10);

}

void __37__WFLoggerFile_writeToFile_cfStrMsg___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint8_t buf[4];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D17AC818]();
  v1 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s FAILED. _filePtr is nil"), "-[WFLoggerFile writeToFile:cfStrMsg:]_block_invoke");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v3 = v1;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_autoreleasePoolPop(v0);
}

- (void)dealloc
{
  NSObject *loggingTimer;
  FILE *filePtr;
  __CFString *logFilePath;
  __CFString *presetFilePath;
  __CFString *directoryPath;
  __CFString *fileNamePrefix;
  __CFDate *fileCreationDate;
  objc_super v10;

  -[WFLoggerFile stopWatchingLogFile](self, "stopWatchingLogFile");
  loggingTimer = self->_loggingTimer;
  if (loggingTimer)
  {
    dispatch_source_cancel(loggingTimer);
    dispatch_release((dispatch_object_t)self->_loggingTimer);
    self->_loggingTimer = 0;
  }
  filePtr = self->_filePtr;
  if (filePtr)
  {
    fclose(filePtr);
    self->_filePtr = 0;
  }
  logFilePath = self->_logFilePath;
  if (logFilePath)
  {
    CFRelease(logFilePath);
    self->_logFilePath = 0;
  }
  presetFilePath = self->_presetFilePath;
  if (presetFilePath)
  {
    CFRelease(presetFilePath);
    self->_presetFilePath = 0;
  }
  directoryPath = self->_directoryPath;
  if (directoryPath)
  {
    CFRelease(directoryPath);
    self->_directoryPath = 0;
  }
  fileNamePrefix = self->_fileNamePrefix;
  if (fileNamePrefix)
  {
    CFRelease(fileNamePrefix);
    self->_fileNamePrefix = 0;
  }
  fileCreationDate = self->_fileCreationDate;
  if (fileCreationDate)
  {
    CFRelease(fileCreationDate);
    self->_fileCreationDate = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFLoggerFile;
  -[WFLoggerFile dealloc](&v10, sel_dealloc);
}

- (WFLoggerFile)initWithDirectoryPath:(id)a3 dirPath:(__CFString *)a4 fileNamePrefix:(__CFString *)a5 runLoopRef:(__CFRunLoop *)a6 runLoopMode:(__CFString *)a7 classC:(unsigned __int8)a8 dateFormatter:(__CFDateFormatter *)a9 maxFileSizeInMB:(unint64_t)a10 logLifespanInDays:(unint64_t)a11 dispatchQueue:(id)a12
{
  unsigned int v12;
  WFLoggerFile *v18;
  WFLoggerFile *v19;
  const __CFAllocator *v20;
  void *v21;
  uint64_t v22;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v12 = a8;
  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)WFLoggerFile;
  v18 = -[WFLoggerFile init](&v24, sel_init);
  v19 = v18;
  if (a9 && a7 && a6 && a5 && a4 && a3 && v18)
  {
    v18->_presetFilePath = 0;
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v18->_directoryPath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4);
    v19->_fileNamePrefix = (__CFString *)CFStringCreateCopy(v20, a5);
    v19->super._dispatchQueue = (OS_dispatch_queue *)a12;
    -[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:](v19, "init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:", a3, a6, a7, v12, a9, a10, a11);
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17AC818]();
    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Failed to init: %p %p %p %p %p %p %p"), "-[WFLoggerFile initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]", v19, a3, a4, a5, a6, a7, a9);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    objc_autoreleasePoolPop(v21);

    return 0;
  }
  return v19;
}

- (WFLoggerFile)initWithFilePath:(id)a3 filePath:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10 dispatchQueue:(id)a11
{
  uint64_t v12;
  WFLoggerFile *v17;
  void *v18;
  const __CFAllocator *v19;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v21;
  FILE *v22;
  uint64_t v23;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v12 = a7;
  v28 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)WFLoggerFile;
  v17 = -[WFLoggerFile init](&v25, sel_init);
  v18 = (void *)MEMORY[0x1D17AC818]();
  if (a8 && a6 && a5 && a4 && a3 && v17)
  {
    v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v17->_presetFilePath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4);
    v17->_directoryPath = (__CFString *)CFStringCreateCopy(v19, (CFStringRef)-[__CFString stringByDeletingLastPathComponent](a4, "stringByDeletingLastPathComponent"));
    v17->super._dispatchQueue = (OS_dispatch_queue *)a11;
    objc_autoreleasePoolPop(v18);
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a4);
    v21 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0xC9C35C4uLL);
    CFStringGetFileSystemRepresentation(a4, v21, MaximumSizeOfFileSystemRepresentation);
    if (v21)
    {
      v22 = fopen(v21, "a");
      if (v22)
        fclose(v22);
      free(v21);
    }
    -[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:](v17, "init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:", a3, a5, a6, v12, a8, a9, a10);
  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Failed to init: %p %p %p %p %p %p"), "-[WFLoggerFile initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]", v17, a3, a4, a5, a6, a8);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    objc_autoreleasePoolPop(v18);

    return 0;
  }
  return v17;
}

- (void)init:(id)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9
{
  unint64_t v11;
  unint64_t v12;
  void *v13;
  OS_dispatch_source *v14;
  NSObject *loggingTimer;
  dispatch_time_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->super._ctxt = (WFLogger *)a3;
  self->_runLoopRef = a4;
  self->_runLoopMode = a5;
  self->_classC = a6;
  self->_privacy = 2;
  self->_level = 3;
  self->_fileCreationDate = 0;
  self->_dateFormatter = a7;
  self->_logLifespanInDays = (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a9);
  v11 = 5000000;
  if (a8 - 6 >= 0xFFFFFFFFFFFFFFFBLL)
    v11 = 1000000 * a8;
  self->_maxFileSizeInBytes = v11;
  self->_timerInterval = 600;
  v12 = -[NSNumber unsignedLongValue](self->_logLifespanInDays, "unsignedLongValue");
  self->_fileAgeOutInterval = 86400 * v12;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: _timerInterval %lu  _fileAgeOutInterval %lu"), "-[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]", self->_timerInterval, 86400 * v12);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v13, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
  self->_loggingTimer = v14;
  if (v14)
  {
    dispatch_set_context((dispatch_object_t)v14, self);
    dispatch_source_set_event_handler_f((dispatch_source_t)self->_loggingTimer, (dispatch_function_t)WFLoggerTimerTmoCallBack);
    loggingTimer = self->_loggingTimer;
    v16 = dispatch_time(0, 1000000000 * self->_timerInterval);
    dispatch_source_set_timer(loggingTimer, v16, 1000000000 * self->_timerInterval, 0);
    self->_loggingTimerStarted = 1;
    dispatch_activate((dispatch_object_t)self->_loggingTimer);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17AC818]();
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FILE LOGGING TIMER NOT CREATED"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    objc_autoreleasePoolPop(v17);
  }
  if (-[WFLoggerFile checkLogFileUpdate:](self, "checkLogFileUpdate:", 0))
  {
    v19 = -[WFLoggerFile changeLogFile:](self, "changeLogFile:", self->_classC);
    if (v19)
      CFRelease(v19);
  }
}

- (void)schedule:(unsigned __int8)a3
{
  NSObject *loggingTimer;
  dispatch_time_t v5;
  const char *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!self->_loggingTimerStarted)
    {
      loggingTimer = self->_loggingTimer;
      v5 = dispatch_time(0, 1000000000 * self->_timerInterval);
      dispatch_source_set_timer(loggingTimer, v5, 1000000000 * self->_timerInterval, 0);
      self->_loggingTimerStarted = 1;
    }
    v6 = "started";
  }
  else
  {
    dispatch_source_set_timer((dispatch_source_t)self->_loggingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    self->_loggingTimerStarted = 0;
    v6 = "stopped";
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: WFLoggerTimer %s."), "-[WFLoggerFile schedule:]", v6);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v7, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (__CFString)createDateString
{
  const __CFAllocator *v2;
  __CFDateFormatter *v3;
  __CFDateFormatter *v4;
  CFAbsoluteTime Current;
  __CFString *StringWithAbsoluteTime;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, kCFDateFormatterShortStyle, kCFDateFormatterMediumStyle);
  if (v3)
  {
    v4 = v3;
    CFDateFormatterSetFormat(v3, CFSTR("MM-dd-yyyy__HH:mm:ss"));
    Current = CFAbsoluteTimeGetCurrent();
    StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v2, v4, Current);
    CFRelease(v4);
    return StringWithAbsoluteTime;
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: null wifiLoggingDateFormatter"), "-[WFLoggerFile createDateString]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v8, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    return 0;
  }
}

- (__CFString)generateLogFileName
{
  __CFString *v3;
  __CFString *v4;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[WFLoggerFile createDateString](self, "createDateString");
  v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%s/%s-%@%s"), -[__CFString UTF8String](self->_directoryPath, "UTF8String"), -[__CFString UTF8String](self->_fileNamePrefix, "UTF8String"), v3, ".log");
  if (v3)
    CFRelease(v3);
  if (!v4)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: null logFileName"), "-[WFLoggerFile generateLogFileName]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v6, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  return v4;
}

- (void)startWatchingLogFile
{
  __CFString *logFilePath;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v5;
  char *v6;
  int v7;
  unsigned int v8;
  void *v9;
  OS_dispatch_source *v10;
  NSObject *eventSource;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  unsigned int v23;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  logFilePath = self->_logFilePath;
  if (logFilePath)
  {
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(logFilePath);
    v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0xDDA354C6uLL);
    if (v5)
    {
      v6 = v5;
      CFStringGetFileSystemRepresentation(self->_logFilePath, v5, MaximumSizeOfFileSystemRepresentation);
      v7 = open(v6, 0x8000);
      if (v7 <= 0)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Invalid log file descriptor for %@"), "-[WFLoggerFile startWatchingLogFile]", self->_logFilePath);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        *(_DWORD *)buf = 136446210;
        v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v21, "UTF8String")), "UTF8String");
        v16 = MEMORY[0x1E0C81028];
        v17 = OS_LOG_TYPE_ERROR;
      }
      else
      {
        v8 = v7;
        if (self->_eventSource)
        {
          v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Already watching log file, resetting..."), "-[WFLoggerFile startWatchingLogFile]");
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v9, "UTF8String")), "UTF8String");
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          dispatch_release((dispatch_object_t)self->_eventSource);
          self->_eventSource = 0;
          -[WFLoggerFile schedule:](self, "schedule:", 0);
        }
        v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v8, 1uLL, (dispatch_queue_t)self->super._dispatchQueue);
        self->_eventSource = v10;
        if (!v10)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: dispatch_source_create failed"), "-[WFLoggerFile startWatchingLogFile]");
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v18, "UTF8String")), "UTF8String");
            *(_DWORD *)buf = 136446210;
            v26 = v19;
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }
          close(v8);
          goto LABEL_15;
        }
        -[WFLoggerFile schedule:](self, "schedule:", 1);
        eventSource = self->_eventSource;
        v12 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __36__WFLoggerFile_startWatchingLogFile__block_invoke;
        handler[3] = &unk_1E881CAE0;
        handler[4] = self;
        dispatch_source_set_event_handler(eventSource, handler);
        v13 = self->_eventSource;
        v22[0] = v12;
        v22[1] = 3221225472;
        v22[2] = __36__WFLoggerFile_startWatchingLogFile__block_invoke_55;
        v22[3] = &__block_descriptor_36_e5_v8__0l;
        v23 = v8;
        dispatch_source_set_cancel_handler(v13, v22);
        dispatch_resume((dispatch_object_t)self->_eventSource);
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Watching log file %s"), "-[WFLoggerFile startWatchingLogFile]", v6);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:
          free(v6);
          return;
        }
        v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v14, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v26 = v15;
        v16 = MEMORY[0x1E0C81028];
        v17 = OS_LOG_TYPE_DEFAULT;
      }
      _os_log_impl(&dword_1CC44E000, v16, v17, "%{public}s", buf, 0xCu);
      goto LABEL_15;
    }
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Memory alloc failed"), "-[WFLoggerFile startWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      *(_DWORD *)buf = 136446210;
      v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v20, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: No log file specified"), "-[WFLoggerFile startWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_20;
  }
}

void __36__WFLoggerFile_startWatchingLogFile__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Log file deletion detected, cleaning up and re-creating..."), "-[WFLoggerFile startWatchingLogFile]_block_invoke");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v2, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 120))
  {
    fclose(*(FILE **)(v3 + 120));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    v3 = *(_QWORD *)(a1 + 32);
  }
  v4 = (const void *)objc_msgSend((id)v3, "changeLogFile:", *(unsigned __int8 *)(v3 + 64));
  if (v4)
    CFRelease(v4);
}

uint64_t __36__WFLoggerFile_startWatchingLogFile__block_invoke_55(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopWatchingLogFile
{
  void *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_eventSource)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Stopped watching log file"), "-[WFLoggerFile stopWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v3, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->_eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0;
    -[WFLoggerFile schedule:](self, "schedule:", 0);
  }
}

- (unsigned)checkLogFileUpdate:(__CFString *)a3
{
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17AC818](self, a2);
  v6 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = 1;
  if (a3)
  {
    if (self->_fileCreationDate)
    {
      v8 = (void *)v6;
      if (-[WFLoggerFile doesLogFileExist:](self, "doesLogFileExist:", a3))
      {
        v9 = objc_msgSend((id)objc_msgSend(v8, "attributesOfItemAtPath:error:", a3, 0), "fileSize");
        if (v9 >= 0x4C4B41)
        {
          v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s File Size: %llu File path is %@"), "-[WFLoggerFile checkLogFileUpdate:]", v9, a3);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v10, "UTF8String")), "UTF8String");
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
        v11 = (void *)MEMORY[0x1D17AC818]();
        v12 = objc_msgSend((id)objc_msgSend(v8, "attributesOfItemAtPath:error:", a3, 0), "fileCreationDate");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", v12);
        v7 = v13 >= (double)(86400 * -[NSNumber unsignedIntValue](self->_logLifespanInDays, "unsignedIntValue"))
          || v9 > 0x4C4B40;
        objc_autoreleasePoolPop(v11);
      }
    }
  }
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (__CFString)changeLogFile:(unsigned __int8)a3
{
  uint64_t v3;
  __CFString *presetFilePath;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  presetFilePath = self->_presetFilePath;
  if (presetFilePath)
    v6 = (__CFString *)CFRetain(presetFilePath);
  else
    v6 = -[WFLoggerFile generateLogFileName](self, "generateLogFileName");
  v7 = v6;
  if (-[WFLoggerFile doesLogFileExist:](self, "doesLogFileExist:", v6) && self->_filePtr)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logfile exists. Given Path: %@ KnownPath: %@"), v7, self->_logFilePath);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v8, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    -[WFLoggerFile rotateLogFile:](self, "rotateLogFile:", v7);
  }
  else
  {
    -[WFLoggerFile createLogFile:fileClassC:](self, "createLogFile:fileClassC:", v7, v3);
    v9 = "YES";
    if (!(_DWORD)v3)
      v9 = "NO";
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Current log file: %@, new log file: %@, class C file: %s"), "-[WFLoggerFile changeLogFile:]", self->_logFilePath, v7, v9);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v10, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  return v7;
}

- (void)cleanStaleLogs
{
  -[WFLoggerFile removeLogFilesFromDir:](self, "removeLogFilesFromDir:", -[__CFString UTF8String](self->_directoryPath, "UTF8String"));
}

- (void)removeLogFilesFromDir:(const char *)a3
{
  DIR *v5;
  DIR *v6;
  dirent *i;
  void *v8;
  char __str[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = opendir(a3);
  if (v5)
  {
    v6 = v5;
    for (i = readdir(v5); i; i = readdir(v6))
    {
      snprintf(__str, 0x100uLL, "%s/%s", a3, i->d_name);
      if (strstr(__str, ".log"))
        -[WFLoggerFile removeLogFile:maxAge:](self, "removeLogFile:maxAge:", __str, (double)self->_fileAgeOutInterval);
    }
    closedir(v6);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Can't open %s"), "-[WFLoggerFile removeLogFilesFromDir:]", a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136446210;
      v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v8, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)__str, 0xCu);
    }
  }
}

- (void)createLogFile:(__CFString *)a3 fileClassC:(unsigned __int8)a4
{
  int v4;
  void *v7;
  __CFString *v8;
  __CFString *directoryPath;
  const __CFAllocator *v10;
  char v11;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v13;
  __CFString *logFilePath;
  char v15;
  int v16;
  FILE *v17;
  void *v18;
  __sFILE *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  FILE *v23;
  void *v24;
  uint64_t v25;
  CFAbsoluteTime Current;
  __CFDate *fileCreationDate;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int *v36;
  void *v37;
  int *v38;
  int *v39;
  uint64_t v40;
  stat v41;
  uint8_t buf[4];
  uint64_t v43;
  char v44[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  memset(&v41, 0, sizeof(v41));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  *(_OWORD *)v44 = 0u;
  v45 = 0u;
  v7 = (void *)MEMORY[0x1D17AC818](self, a2);
  v8 = (__CFString *)-[__CFString stringByDeletingLastPathComponent](a3, "stringByDeletingLastPathComponent");
  if (-[__CFString UTF8String](v8, "UTF8String"))
  {
    -[__CFString UTF8String](v8, "UTF8String");
    __strlcpy_chk();
  }
  directoryPath = self->_directoryPath;
  if (directoryPath)
  {
    CFRelease(directoryPath);
    self->_directoryPath = 0;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  self->_directoryPath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
  objc_autoreleasePoolPop(v7);
  if (!v44[0] || stat(v44, &v41) != -1)
  {
    v11 = 0;
    goto LABEL_8;
  }
  if (!mkdir(v44, 0x1FDu))
  {
    v33 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Re-created missing log directory %s"), "-[WFLoggerFile createLogFile:fileClassC:]", v44);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v33, "UTF8String")), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v43 = v34;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v11 = 1;
LABEL_8:
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
    v13 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0xE913C251uLL);
    CFStringGetFileSystemRepresentation(a3, v13, MaximumSizeOfFileSystemRepresentation);
    if (v4 && (self->_isFileLoggingEnabled || !MKBUserUnlockedSinceBoot()))
      goto LABEL_35;
    logFilePath = self->_logFilePath;
    if (logFilePath)
    {
      v15 = CFEqual(a3, logFilePath) ? v11 : 1;
      if ((v15 & 1) == 0 && self->_filePtr)
        goto LABEL_35;
    }
    if (v4)
    {
      v16 = open_dprotected_np(v13, 514, 3, 0, 384);
      if (v16 < 0)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        v36 = __error();
        v37 = (void *)objc_msgSend(v35, "stringWithFormat:", CFSTR("%s: open_dprotected_np failed with %s (%s)"), "-[WFLoggerFile createLogFile:fileClassC:]", v13, strerror(*v36));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_46;
      }
      else
      {
        v17 = fdopen(v16, "ab");
        v18 = (void *)MEMORY[0x1E0CB3940];
        if (v17)
        {
          v19 = v17;
          v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Device unlocked since boot, will log to class C file: %s"), "-[WFLoggerFile createLogFile:fileClassC:]", v13);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          goto LABEL_28;
        }
        v38 = __error();
        v37 = (void *)objc_msgSend(v18, "stringWithFormat:", CFSTR("%s: fdopen failed %s (%s)"), "-[WFLoggerFile createLogFile:fileClassC:]", v13, strerror(*v38));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_46;
      }
    }
    else
    {
      v23 = fopen(v13, "a");
      v24 = (void *)MEMORY[0x1E0CB3940];
      if (v23)
      {
        v19 = v23;
        v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Will log to file: %s"), "-[WFLoggerFile createLogFile:fileClassC:]", v13);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:
          v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v20, "UTF8String")), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v43 = v25;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
LABEL_28:
        Current = CFAbsoluteTimeGetCurrent();
        fileCreationDate = self->_fileCreationDate;
        if (fileCreationDate)
        {
          CFRelease(fileCreationDate);
          self->_fileCreationDate = 0;
        }
        self->_fileCreationDate = CFDateCreate(v10, Current);
        self->_isFileLoggingEnabled = 1;
        self->_filePtr = v19;
        v28 = self->_logFilePath;
        if (v28)
        {
          CFRelease(v28);
          self->_logFilePath = 0;
        }
        self->_logFilePath = (__CFString *)CFStringCreateCopy(v10, a3);
        -[WFLoggerFile stopWatchingLogFile](self, "stopWatchingLogFile");
        -[WFLoggerFile startWatchingLogFile](self, "startWatchingLogFile");
        v29 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: fileCreationDate %@"), "-[WFLoggerFile createLogFile:fileClassC:]", self->_fileCreationDate);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        v30 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v29, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v43 = v30;
        v31 = MEMORY[0x1E0C81028];
        v32 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_34;
      }
      v39 = __error();
      v37 = (void *)objc_msgSend(v24, "stringWithFormat:", CFSTR("%s: fopen failed %s (%s)"), "-[WFLoggerFile createLogFile:fileClassC:]", v13, strerror(*v39));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_46:
        v40 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v37, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v43 = v40;
        v31 = MEMORY[0x1E0C81028];
        v32 = OS_LOG_TYPE_ERROR;
LABEL_34:
        _os_log_impl(&dword_1CC44E000, v31, v32, "%{public}s", buf, 0xCu);
      }
    }
LABEL_35:
    if (v13)
      free(v13);
    goto LABEL_37;
  }
  v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Failed to create directory %s, errno = %d"), "-[WFLoggerFile createLogFile:fileClassC:]", v44, *__error());
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v21, "UTF8String")), "UTF8String");
    *(_DWORD *)buf = 136446210;
    v43 = v22;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
LABEL_37:
  -[WFLoggerFile cleanStaleLogs](self, "cleanStaleLogs");
}

- (void)removeLogFile:(const char *)a3 maxAge:(double)a4
{
  time_t v6;
  std::error_code *v7;
  stat v8;

  memset(&v8, 0, sizeof(v8));
  if (!stat(a3, &v8))
  {
    v6 = time(0);
    if (difftime(v6, v8.st_mtimespec.tv_sec) > a4)
      remove((const std::__fs::filesystem::path *)a3, v7);
  }
}

- (unsigned)doesLogFileExist:(__CFString *)a3
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v5;
  char *v6;
  unsigned __int8 v7;
  stat v9;

  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
  v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x413F253DuLL);
  if (!v5)
    return 0;
  v6 = v5;
  CFStringGetFileSystemRepresentation(a3, v5, MaximumSizeOfFileSystemRepresentation);
  memset(&v9, 0, sizeof(v9));
  v7 = stat(v6, &v9) == 0;
  free(v6);
  return v7;
}

- (void)rotateLogFile:(__CFString *)a3
{
  unint64_t maxFileSizeInBytes;
  unsigned __int8 isFileLoggingEnabled;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v8;
  char *v9;
  void *v10;
  int *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  off_t v16;
  void *v17;
  uint64_t v18;
  FILE *v19;
  FILE *v20;
  void *v21;
  int *v22;
  char *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int *v27;
  FILE *v28;
  FILE *v29;
  size_t v30;
  size_t v31;
  void *v32;
  int *v33;
  stat v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  maxFileSizeInBytes = self->_maxFileSizeInBytes;
  memset(&v34, 0, sizeof(v34));
  isFileLoggingEnabled = self->_isFileLoggingEnabled;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
  v8 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x5F1979B5uLL);
  if (v8)
  {
    v9 = v8;
    CFStringGetFileSystemRepresentation(a3, v8, MaximumSizeOfFileSystemRepresentation);
    if (stat(v9, &v34))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = __error();
      v12 = (void *)objc_msgSend(v10, "stringWithFormat:", CFSTR("%s: #error File status on %s returned non-zero (%s)"), "-[WFLoggerFile rotateLogFile:]", v9, strerror(*v11));
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        free(v9);
        self->_isFileLoggingEnabled = isFileLoggingEnabled;
        return;
      }
LABEL_4:
      v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v12, "UTF8String")), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v36 = v13;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      goto LABEL_5;
    }
    v15 = self->_maxFileSizeInBytes;
    if (!v15)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: #error Max size is 0"), "-[WFLoggerFile rotateLogFile:]");
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      goto LABEL_4;
    }
    if (v34.st_size < v15)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: #error Nothing to do. CurrentSize:%lld MaxSize:%lu"), "-[WFLoggerFile rotateLogFile:]", v34.st_size, v15);
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      goto LABEL_4;
    }
    v16 = llround((double)maxFileSizeInBytes * 0.5);
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Rotating log file %s from %lld to %ld bytes"), "-[WFLoggerFile rotateLogFile:]", v9, v34.st_size, v16);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v17, "UTF8String")), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v36 = v18;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    self->_isFileLoggingEnabled = 0;
    v19 = fopen(v9, "r");
    if (!v19)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = __error();
      v12 = (void *)objc_msgSend(v26, "stringWithFormat:", CFSTR("%s: #error opening log file %s (%s) for reading"), "-[WFLoggerFile rotateLogFile:]", v9, strerror(*v27));
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      goto LABEL_4;
    }
    v20 = v19;
    if (fseek(v19, -v16, 2))
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = __error();
      v23 = strerror(*v22);
      v24 = (void *)objc_msgSend(v21, "stringWithFormat:", CFSTR("%s: #error fseeking log file %s (%s), file size %lld, SEEK_END offset %ld"), "-[WFLoggerFile rotateLogFile:]", v9, v23, v34.st_size, v16);
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        fclose(v20);
        goto LABEL_5;
      }
    }
    else
    {
      v28 = fopen(v9, "r+");
      if (v28)
      {
        v29 = v28;
        v30 = fread(buf, 1uLL, 0x400uLL, v20);
        if (v30)
        {
          v31 = v30;
          do
          {
            fwrite(buf, 1uLL, v31, v29);
            v31 = fread(buf, 1uLL, 0x400uLL, v20);
          }
          while (v31);
        }
        fclose(v20);
        fflush(v29);
        fclose(v29);
        truncate(v9, v16);
        goto LABEL_5;
      }
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = __error();
      v24 = (void *)objc_msgSend(v32, "stringWithFormat:", CFSTR("%s: #error opening log file %s (%s) for writing"), "-[WFLoggerFile rotateLogFile:]", v9, strerror(*v33));
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
    }
    v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v24, "UTF8String")), "UTF8String");
    *(_DWORD *)buf = 136446210;
    v36 = v25;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    goto LABEL_21;
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: alloc failed"), "-[WFLoggerFile rotateLogFile:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v14, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (void)setMaxFileSizeInMB:(unint64_t)a3
{
  void *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerFile setMaxFileSizeInMB:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getMaxFileSizeInMB
{
  return self->_maxFileSizeInBytes / 0xF4240;
}

- (void)setLogLifespanInDays:(id)a3
{
  void *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerFile setLogLifespanInDays:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (id)getLogLifespanInDays
{
  return self->_logLifespanInDays;
}

- (void)setLogPrivacy:(unint64_t)a3
{
  void *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerFile setLogPrivacy:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getLogPrivacy
{
  return self->_privacy;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
  void *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerFile setLogLevelEnable:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getLogLevelEnable
{
  return self->_level;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
  void *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerFile setLogLevelPersist:]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getLogLevelPersist
{
  void *v2;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s not applicable"), "-[WFLoggerFile getLogLevelPersist]");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v2, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  return 3;
}

@end
