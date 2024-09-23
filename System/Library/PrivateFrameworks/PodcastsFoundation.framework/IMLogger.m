@implementation IMLogger

- (void)logFile:(const char *)a3 lineNumber:(int)a4 format:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v8, &v14);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@:%d] %@"), v10, v5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLogger logString:](self, "logString:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@:%d] <nil>"), v10, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLogger logString:](self, "logString:", v13);

  }
}

- (void)logString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _opaque_pthread_t *v8;
  id v9;
  void *v10;
  NSString *procName;
  uint64_t pid;
  _opaque_pthread_t *v13;
  void *v14;
  NSFileHandle *fileHandle;
  void *v16;
  uint8_t buf[4];
  mach_port_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_filter || objc_msgSend(v4, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_fileHandle && self->_logTofileOnly)
      goto LABEL_10;
    if (IMInitializeLogCategories_onceToken != -1)
      dispatch_once(&IMInitializeLogCategories_onceToken, &__block_literal_global);
    v6 = (void *)IMLogCategoryDefault;
    if (os_log_type_enabled((os_log_t)IMLogCategoryDefault, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = pthread_self();
      *(_DWORD *)buf = 67109378;
      v18 = pthread_mach_thread_np(v8);
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A904E000, v7, OS_LOG_TYPE_DEFAULT, "(%x) %@\n", buf, 0x12u);

    }
    if (self->_fileHandle)
    {
LABEL_10:
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      IMTimeStamp();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      procName = self->_procName;
      pid = self->_pid;
      v13 = pthread_self();
      v14 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ %@[%d:%x] %@\n"), v10, procName, pid, pthread_mach_thread_np(v13), v5);

      fileHandle = self->_fileHandle;
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSFileHandle writeData:](fileHandle, "writeData:", v16);

    }
  }

}

- (BOOL)shouldOverrideCondition:(id)a3 file:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[IMLogger runtimeOverride](self, "runtimeOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    goto LABEL_4;
  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMLogger runtimeOverride](self, "runtimeOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "rangeOfString:options:", v6, 1) != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_8;
  }
  -[IMLogger runtimeOverride](self, "runtimeOverride");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1;
  v15 = objc_msgSend(v13, "rangeOfString:options:", v11, 1);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    if (!self->_runtimeOverrideRegex)
    {
      v14 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v7, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_runtimeOverrideRegex, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_runtimeOverrideRegex, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:

      goto LABEL_11;
    }
LABEL_8:
    v14 = 1;
    goto LABEL_9;
  }
LABEL_11:

  return v14;
}

- (NSString)runtimeOverride
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

+ (id)sharedLogger
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__IMLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLogger_onceToken[0] != -1)
    dispatch_once(sharedLogger_onceToken, block);
  return (id)sharedLogger__sharedLogger;
}

void __24__IMLogger_sharedLogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedLogger__sharedLogger;
  sharedLogger__sharedLogger = v0;

}

- (IMLogger)init
{
  IMLogger *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *procName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSRegularExpression *runtimeOverrideRegex;
  IMLogger *v18;
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IMLogger;
  v2 = -[IMLogger init](&v21, sel_init);
  if (v2)
  {
    v2->_pid = getpid();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AE88]);
    v5 = objc_claimAutoreleasedReturnValue();
    procName = v2->_procName;
    v2->_procName = (NSString *)v5;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("IMLogFilter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("IMLogFilter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMLogger setFilter:](v2, "setFilter:", v10);

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("IMLogRuntimeOverride"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("IMLogRuntimeOverride"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMLogger setRuntimeOverride:](v2, "setRuntimeOverride:", v12);

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("IMLogRuntimeOverridePattern"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("IMLogRuntimeOverridePattern"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v14, 0, &v20);
      v16 = v20;
      runtimeOverrideRegex = v2->_runtimeOverrideRegex;
      v2->_runtimeOverrideRegex = (NSRegularExpression *)v15;

      if (!v2->_runtimeOverrideRegex)
        -[IMLogger logFile:lineNumber:format:](v2, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Logging/IMLogger.m", 75, CFSTR("Invalid RegexPattern: %@ -- Error: %@"), v14, v16);

    }
    v18 = v2;

  }
  return v2;
}

- (void)setAuxPath:(id)a3
{
  NSFileHandle *fileHandle;
  id v6;
  NSFileHandle *v7;
  NSFileHandle *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_auxPath, a3);
  -[NSFileHandle closeFile](self->_fileHandle, "closeFile");
  fileHandle = self->_fileHandle;
  self->_fileHandle = 0;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if ((objc_msgSend(v6, "fileExistsAtPath:", self->_auxPath) & 1) == 0)
    objc_msgSend(v6, "createFileAtPath:contents:attributes:", self->_auxPath, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", self->_auxPath);
  v7 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
  v8 = self->_fileHandle;
  self->_fileHandle = v7;

  -[NSFileHandle seekToEndOfFile](self->_fileHandle, "seekToEndOfFile");
}

- (id)auxPath
{
  return self->_auxPath;
}

- (void)setLogToFileOnly:(BOOL)a3
{
  self->_logTofileOnly = a3;
}

- (BOOL)logTofileOnly
{
  return self->_logTofileOnly;
}

- (void)logFunction:(const char *)a3 format:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v6, &v10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLogger logString:](self, "logString:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s <nil>"), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLogger logString:](self, "logString:", v9);

  }
}

- (void)addRuntimeOverride:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IMLogger runtimeOverride](self, "runtimeOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[IMLogger runtimeOverride](self, "runtimeOverride");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E5500770;
  }

  if (-[__CFString rangeOfString:](v5, "rangeOfString:", v7) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLogger setRuntimeOverride:](self, "setRuntimeOverride:", v6);

  }
}

- (void)removeRuntimeOverride:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMLogger runtimeOverride](self, "runtimeOverride");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_1E5500770);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMLogger setRuntimeOverride:](self, "setRuntimeOverride:", v5);
}

+ (id)rolledLogPrefix
{
  return CFSTR("Rolled-");
}

+ (void)rollLogPath:(id)a3 maxSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v18, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    if (v9 >= a4)
    {
      objc_msgSend(v18, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[IMLogger rolledLogPrefix](IMLogger, "rolledLogPrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IMTimeStamp();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@-%@"), v12, v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMLogger sharedLogger](IMLogger, "sharedLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Logging/IMLogger.m", 228, CFSTR("Rolling Log: %@ -> %@"), v18, v16);

      objc_msgSend(v5, "moveItemAtPath:toPath:error:", v18, v16, 0);
    }
  }

}

+ (void)deleteRolledLogsForLogPath:(id)a3 maxAge:(double)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v5, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v26 = v9;
    v27 = *MEMORY[0x1E0CB2A88];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        +[IMLogger rolledLogPrefix](IMLogger, "rolledLogPrefix");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "hasPrefix:", v15))
        {
          v16 = objc_msgSend(v14, "hasSuffix:", v7);

          if (!v16)
            goto LABEL_13;
          objc_msgSend(v8, "stringByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "attributesOfItemAtPath:error:", v15, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17)
          {
            objc_msgSend(v18, "timeIntervalSinceNow");
            if (-v20 >= a4)
            {
              +[IMLogger sharedLogger](IMLogger, "sharedLogger");
              v21 = v8;
              v22 = v7;
              v23 = v6;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Logging/IMLogger.m", 247, CFSTR("Deleting Rolled Log: %@"), v15);

              v6 = v23;
              v7 = v22;
              v8 = v21;
              v9 = v26;
              objc_msgSend(v6, "removeItemAtPath:error:", v15, 0);
            }
          }

        }
LABEL_13:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

}

- (NSString)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setRuntimeOverride:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeOverrideRegex, 0);
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_runtimeOverride, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_auxPath, 0);
}

@end
