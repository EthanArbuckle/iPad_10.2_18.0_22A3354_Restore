@implementation PLFileBackedLogger

- (PLFileBackedLogger)init
{
  id v2;

  PLMethodNotImplementedException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PLFileBackedLogger)initWithLogFileURL:(id)a3 logRotate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PLFileBackedLogger *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  PLAppleArchiveLoggerRecord *lock_loggerRecord;
  PLAppleArchiveLoggerRecord *v16;
  NSObject *v17;
  void *v18;
  PLAppleArchiveLoggerRecord *v19;
  uint64_t v20;
  PLAppleArchiveLoggerRecord *v21;
  NSObject *v22;
  int v23;
  objc_super v25;
  uint8_t buf[4];
  _DWORD v27[7];

  v4 = a4;
  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PLFileBackedLogger;
  v7 = -[PLFileBackedLogger init](&v25, sel_init);
  if (v7)
  {
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    -[NSDateFormatter setDateFormat:](v7->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS "));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v7->_dateFormatter, "setLocale:", v10);
    v7->_enableAutoFlush = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
    v11 = (void *)s_lock_loggers;
    if (!s_lock_loggers)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = (void *)s_lock_loggers;
      s_lock_loggers = (uint64_t)v12;

      v11 = (void *)s_lock_loggers;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    lock_loggerRecord = v7->_lock_loggerRecord;
    v7->_lock_loggerRecord = (PLAppleArchiveLoggerRecord *)v14;

    v16 = v7->_lock_loggerRecord;
    if (!v16)
    {
      PLBackendGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v27 = v6;
        _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEFAULT, "PLFileBackedLogger: open url backed logger: %{public}@", buf, 0xCu);
      }

      +[PLFileBackedLogger openLoggerAtURL:logRotate:](PLFileBackedLogger, "openLoggerAtURL:logRotate:", v6, v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PLAppleArchiveLoggerRecord initWithURL:logger:]([PLAppleArchiveLoggerRecord alloc], "initWithURL:logger:", v6, v18);
      objc_msgSend((id)s_lock_loggers, "setObject:forKeyedSubscript:", v19, v6);
      objc_msgSend((id)s_lock_loggers, "objectForKeyedSubscript:", v6);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v7->_lock_loggerRecord;
      v7->_lock_loggerRecord = (PLAppleArchiveLoggerRecord *)v20;

      v16 = v7->_lock_loggerRecord;
    }
    -[PLAppleArchiveLoggerRecord setRefCount:](v16, "setRefCount:", -[PLAppleArchiveLoggerRecord refCount](v16, "refCount") + 1);
    v7->_lock_closed = 0;
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = -[PLAppleArchiveLoggerRecord refCount](v7->_lock_loggerRecord, "refCount");
      *(_DWORD *)buf = 67109378;
      v27[0] = v23;
      LOWORD(v27[1]) = 2114;
      *(_QWORD *)((char *)&v27[1] + 2) = v6;
      _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_INFO, "PLFileBackedLogger: url backed logger ref count %d for log %{public}@", buf, 0x12u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  }

  return v7;
}

- (void)close
{
  PLAppleArchiveLoggerRecord *lock_loggerRecord;
  PLAppleArchiveLoggerRecord *v5;
  uint64_t v6;
  NSObject *p_super;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  if (!self->_lock_closed)
  {
    lock_loggerRecord = self->_lock_loggerRecord;
    if (lock_loggerRecord)
    {
      if (-[PLAppleArchiveLoggerRecord refCount](lock_loggerRecord, "refCount") <= 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PLAppleArchiveLoggerRecord refCount](self->_lock_loggerRecord, "refCount");
        -[PLAppleArchiveLoggerRecord url](self->_lock_loggerRecord, "url");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFileBackedLog.m"), 184, CFSTR("already closed. Ref count: %d. url: %@"), v17, v18);

      }
      v5 = self->_lock_loggerRecord;
      v6 = -[PLAppleArchiveLoggerRecord refCount](v5, "refCount") - 1;
      -[PLAppleArchiveLoggerRecord setRefCount:](v5, "setRefCount:", v6);
      if ((_DWORD)v6)
      {
        -[PLFileBackedLogger _inlock_flush](self, "_inlock_flush");
        PLBackendGetLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          v8 = -[PLAppleArchiveLoggerRecord refCount](self->_lock_loggerRecord, "refCount");
          -[PLAppleArchiveLoggerRecord url](self->_lock_loggerRecord, "url");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v20[0] = v8;
          LOWORD(v20[1]) = 2114;
          *(_QWORD *)((char *)&v20[1] + 2) = v10;
          _os_log_impl(&dword_199DF7000, p_super, OS_LOG_TYPE_INFO, "PLFileBackedLogger: decrement logger ref count to %d for log: %{public}@", buf, 0x12u);

        }
      }
      else
      {
        PLBackendGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[PLAppleArchiveLoggerRecord url](self->_lock_loggerRecord, "url");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v20 = v12;
          _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_DEFAULT, "PLFileBackedLogger: close url backed logger: %{public}@", buf, 0xCu);

        }
        -[PLAppleArchiveLoggerRecord logger](self->_lock_loggerRecord, "logger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "close:", 0);

        v14 = (void *)s_lock_loggers;
        -[PLAppleArchiveLoggerRecord url](self->_lock_loggerRecord, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v15);

        p_super = &self->_lock_loggerRecord->super;
        self->_lock_loggerRecord = 0;
      }

      self->_lock_closed = 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[PLFileBackedLogger close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)PLFileBackedLogger;
  -[PLFileBackedLogger dealloc](&v3, sel_dealloc);
}

- (void)flush
{
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  -[PLFileBackedLogger _inlock_flush](self, "_inlock_flush");
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
}

- (void)_inlock_flush
{
  id v3;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_lock);
  if (-[PLAppleArchiveLoggerRecord refCount](self->_lock_loggerRecord, "refCount") >= 1)
  {
    -[PLAppleArchiveLoggerRecord logger](self->_lock_loggerRecord, "logger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flush:", 0);

  }
}

- (void)logWithMessage:(const char *)a3 fromCodeLocation:(id)a4 type:(unsigned __int8)a5
{
  int v5;
  uint64_t v6;
  char *var0;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  id v16;
  NSDateFormatter *dateFormatter;
  void *v18;
  void *v19;
  const char *v20;
  PLAppleArchiveLoggerRecord *lock_loggerRecord;
  void *v22;
  id v23;
  char v24;
  id v25;
  PLAppleArchiveLoggerRecord *v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  __uint64_t v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v5 = a5;
  v6 = *(_QWORD *)&a4.var1;
  var0 = a4.var0;
  v33 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  pthread_threadid_np(0, &v30);
  v10 = getpid();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "UTF8String");

  if (var0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", var0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("unknown");
  }
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  dateFormatter = self->_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:", v19);

  if (v5 <= 1)
  {
    if (!v5)
    {
      v20 = "Default";
      goto LABEL_16;
    }
    if (v5 == 1)
    {
      v20 = "Info";
      goto LABEL_16;
    }
  }
  else
  {
    switch(v5)
    {
      case 2:
        v20 = "Debug";
        goto LABEL_16;
      case 16:
        v20 = "Error";
        goto LABEL_16;
      case 17:
        v20 = "Fault";
        goto LABEL_16;
    }
  }
  v20 = "Unknown";
LABEL_16:
  objc_msgSend(v16, "appendFormat:", CFSTR("0x%-8llx %-8s %8d %s: %@:%-5d "), v30, v20, v10, v13, v15, v6);
  if (self->_tag)
    objc_msgSend(v16, "appendFormat:", CFSTR("id:%@ "), self->_tag);
  objc_msgSend(v16, "appendFormat:", CFSTR("%s\n"), a3);
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  lock_loggerRecord = self->_lock_loggerRecord;
  if (lock_loggerRecord)
  {
    -[PLAppleArchiveLoggerRecord logger](lock_loggerRecord, "logger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_retainAutorelease(v16);
    v29 = 0;
    v24 = objc_msgSend(v22, "encodeBuffer:size:error:", objc_msgSend(v23, "cStringUsingEncoding:", 4), objc_msgSend(v23, "lengthOfBytesUsingEncoding:", 4), &v29);
    v25 = v29;

    if ((v24 & 1) != 0)
    {
      if (self->_enableAutoFlush)
      {
        v26 = self->_lock_loggerRecord;
        v27 = -[PLAppleArchiveLoggerRecord autoFlushCounter](v26, "autoFlushCounter") + 1;
        -[PLAppleArchiveLoggerRecord setAutoFlushCounter:](v26, "setAutoFlushCounter:", v27);
        if (v27 >= 0xB)
        {
          -[PLFileBackedLogger _inlock_flush](self, "_inlock_flush");
          -[PLAppleArchiveLoggerRecord setAutoFlushCounter:](self->_lock_loggerRecord, "setAutoFlushCounter:", 0);
        }
      }
    }
    else
    {
      PLBackendGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_199DF7000, v28, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Failed while logging to archive logger: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v25 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);

}

- (int)fileRefCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  LODWORD(self) = -[PLAppleArchiveLoggerRecord refCount](self->_lock_loggerRecord, "refCount");
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  return (int)self;
}

- (BOOL)isClosed
{
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  LOBYTE(self) = self->_lock_closed;
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  return (char)self;
}

- (BOOL)enableAutoFlush
{
  return self->_enableAutoFlush;
}

- (void)setEnableAutoFlush:(BOOL)a3
{
  self->_enableAutoFlush = a3;
}

- (char)loggerType
{
  return self->_loggerType;
}

- (void)setLoggerType:(char)a3
{
  self->_loggerType = a3;
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_lock_loggerRecord, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

+ (id)setupWithLibraryIdentifier:(id)a3 type:(char)a4
{
  uint64_t v4;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _DWORD v18[2];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) != 0)
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v7 = CFSTR("PhotosUpgrade");
  if ((_DWORD)v4 != 1)
    v7 = 0;
  if ((_DWORD)v4 == 2)
    v8 = CFSTR("PhotosSearch");
  else
    v8 = v7;
  if (!v8)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 67109120;
      v18[1] = v4;
      _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "failed to obtain name for file backed log for type: %d", (uint8_t *)v18, 8u);
    }

    goto LABEL_12;
  }
  objc_msgSend(CFSTR("Logs/com.apple.assetsd"), "stringByAppendingPathComponent:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingPathComponent:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("aapbz"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  objc_msgSend(a1, "_setupWithLibraryIdentifier:type:logURL:", v6, v4, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_setupWithLibraryIdentifier:(id)a3 type:(char)a4 logURL:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  PLFileBackedLogger *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (v8)
    v9 = -[PLFileBackedLogger initWithLogFileURL:logRotate:]([PLFileBackedLogger alloc], "initWithLogFileURL:logRotate:", v8, 1);
  else
    v9 = 0;
  -[PLFileBackedLogger setLoggerType:](v9, "setLoggerType:", v6);
  if ((unint64_t)objc_msgSend(v7, "length") < 9)
  {
    if (v7)
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = v7;
        _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_DEFAULT, "PLFileBackedLogger: Tag length shorter than expected for identifier %{public}@", (uint8_t *)&v14, 0xCu);
      }

    }
    v10 = (void *)objc_msgSend(v7, "copy");
    -[PLFileBackedLogger setTag:](v9, "setTag:", v10);
  }
  else
  {
    objc_msgSend(v7, "substringToIndex:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[PLFileBackedLogger setTag:](v9, "setTag:", v11);

  }
  return v9;
}

+ (id)openLoggerAtURL:(id)a3 logRotate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  unint64_t v35;
  char v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  char v42;
  NSObject *v43;
  void *v44;
  int v45;
  int *v46;
  char *v47;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  _BYTE v57[18];
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v53);
    v9 = v53;

    if ((v8 & 1) == 0)
    {
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "URLByDeletingLastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v55 = v25;
        v56 = 2112;
        *(_QWORD *)v57 = v9;
        _os_log_impl(&dword_199DF7000, v23, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Unable to create a log file directory at %@, error:%@", buf, 0x16u);

      }
      goto LABEL_35;
    }
    if (!v4)
    {
LABEL_30:
      v41 = v9;
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750A0]), "initWithArchiveURL:", v5);
      v49 = v9;
      v42 = -[NSObject openForWriting:](v23, "openForWriting:", &v49);
      v9 = v49;

      if ((v42 & 1) != 0)
      {
        v23 = v23;
        v22 = v23;
LABEL_36:

        goto LABEL_37;
      }
      PLBackendGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "path");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *__error();
        v46 = __error();
        v47 = strerror(*v46);
        *(_DWORD *)buf = 138412802;
        v55 = v44;
        v56 = 1024;
        *(_DWORD *)v57 = v45;
        *(_WORD *)&v57[4] = 2080;
        *(_QWORD *)&v57[6] = v47;
        _os_log_impl(&dword_199DF7000, v43, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Unable to write-open file descriptor at %@: Error (%d):%s", buf, 0x1Cu);

      }
LABEL_35:
      v22 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v5, "URLByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("log"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("old"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

    if (!v15)
    {
LABEL_22:
      objc_msgSend(v5, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v13, "fileExistsAtPath:", v31);

      if (v32
        && (objc_msgSend(v5, "path"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "attributesOfItemAtPath:error:", v33, 0),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v35 = objc_msgSend(v34, "fileSize"),
            v34,
            v33,
            v35 >> 22 >= 0x19))
      {
        v50 = v9;
        v36 = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v5, v12, &v50);
        v37 = v50;

        if ((v36 & 1) == 0)
        {
          PLBackendGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "path");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "path");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v55 = v39;
            v56 = 2112;
            *(_QWORD *)v57 = v40;
            *(_WORD *)&v57[8] = 2112;
            *(_QWORD *)&v57[10] = v37;
            _os_log_impl(&dword_199DF7000, v38, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: cannot rotate %@ to %@: %@", buf, 0x20u);

          }
        }
      }
      else
      {
        v37 = v9;
      }

      v9 = v37;
      goto LABEL_30;
    }
    objc_msgSend(v12, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "fileExistsAtPath:", v16);

    if (v17)
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v11, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v19;
      v56 = 2112;
      *(_QWORD *)v57 = v20;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: cannot rotate %@ to %@: destination exists", buf, 0x16u);

    }
    else
    {
      v52 = v9;
      v26 = objc_msgSend(MEMORY[0x1E0D750A0], "encodeFile:destination:error:", v11, v12, &v52);
      v27 = v52;

      if ((v26 & 1) == 0)
      {
        PLBackendGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "path");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v55 = v29;
          v56 = 2112;
          *(_QWORD *)v57 = v30;
          *(_WORD *)&v57[8] = 2112;
          *(_QWORD *)&v57[10] = v27;
          _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: cannot rotate %@ to %@: %@", buf, 0x20u);

        }
        v9 = v27;
        goto LABEL_21;
      }
      v51 = v27;
      v28 = objc_msgSend(v13, "removeItemAtURL:error:", v11, &v51);
      v9 = v51;

      if ((v28 & 1) != 0)
        goto LABEL_22;
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      objc_msgSend(v11, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v19;
      v56 = 2112;
      *(_QWORD *)v57 = v9;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: error removing legacy log file %@: %@", buf, 0x16u);
    }

    goto LABEL_21;
  }
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v21;
    _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging requires a file URL. Url specified %{public}@", buf, 0xCu);

  }
  v22 = 0;
LABEL_37:

  return v22;
}

@end
