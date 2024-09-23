@implementation SUCoreSplunkHistory

- (SUCoreSplunkHistory)init
{
  SUCoreSplunkHistory *v2;
  SUCoreSplunkHistory *v3;
  NSString *lastUUID;
  id v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *splunkHistoryQueue;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  int v30;
  SUCoreSplunkHistory *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  void *v36;
  int v37;
  id v39;
  objc_super v40;
  _QWORD v41[3];
  _QWORD v42[3];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)SUCoreSplunkHistory;
  v2 = -[SUCoreSplunkHistory init](&v40, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_15;
  v2->_lockFD = -1;
  lastUUID = v2->_lastUUID;
  v2->_lastUUID = 0;

  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SUCore sharedCore](SUCore, "sharedCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease((id)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@"), v7, CFSTR("core.splunk.history")));
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v9, v10);
  splunkHistoryQueue = v3->_splunkHistoryQueue;
  v3->_splunkHistoryQueue = (OS_dispatch_queue *)v11;

  if (!v3->_splunkHistoryQueue)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "commonDomain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("unable to create dispatch queue domain(%@.%@)"), v27, CFSTR("core.splunk.history"));
    objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[SPLUNK_HISTORY] INIT"), v28, 8100, 0);

LABEL_22:
    v31 = 0;
    goto LABEL_23;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "commonDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v16;
    v45 = 2114;
    v46 = CFSTR("core.splunk.history");
    _os_log_impl(&dword_1B05B8000, v14, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] DISPATCH | created dispatch queue domain(%{public}@.%{public}@)", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fileExistsAtPath:", CFSTR("/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"));

  if ((v18 & 1) == 0)
  {
    v19 = *MEMORY[0x1E0CB2A58];
    v41[0] = *MEMORY[0x1E0CB2A98];
    v41[1] = v19;
    v42[0] = CFSTR("mobile");
    v42[1] = CFSTR("mobile");
    v41[2] = *MEMORY[0x1E0CB2AD8];
    v42[2] = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"), 1, v20, &v39);
    v22 = v39;

    if (v22)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SUCoreSplunkHistory init].cold.1((uint64_t)v22, v24);

      goto LABEL_21;
    }

  }
  objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"), "stringByAppendingPathComponent:", CFSTR("SUCoreSplunkHistory.lock"));
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = (const char *)objc_msgSend(v20, "cStringUsingEncoding:", 4);
  if (!v29)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "[SPLUNK_HISTORY] INIT | failed creating file lock";
      v34 = v22;
      v35 = 2;
LABEL_20:
      _os_log_impl(&dword_1B05B8000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    }
LABEL_21:

    goto LABEL_22;
  }
  v30 = open(v29, 521, 420);
  v3->_lockFD = v30;
  if (v30 == -1)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v37;
      v33 = "[SPLUNK_HISTORY] INIT | failed opening lock file, errno:%d";
      v34 = v22;
      v35 = 8;
      goto LABEL_20;
    }
    goto LABEL_21;
  }

LABEL_15:
  v31 = v3;
LABEL_23:

  return v31;
}

- (void)dealloc
{
  int lockFD;
  objc_super v4;

  -[SUCoreSplunkHistory releaseSharedLock](self, "releaseSharedLock");
  lockFD = self->_lockFD;
  if (lockFD != -1)
  {
    close(lockFD);
    self->_lockFD = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUCoreSplunkHistory;
  -[SUCoreSplunkHistory dealloc](&v4, sel_dealloc);
}

+ (id)sharedHistory
{
  if (sharedHistory_reporterOnce != -1)
    dispatch_once(&sharedHistory_reporterOnce, &__block_literal_global_1);
  return (id)sharedHistory_logger;
}

void __36__SUCoreSplunkHistory_sharedHistory__block_invoke()
{
  SUCoreSplunkHistory *v0;
  void *v1;

  v0 = objc_alloc_init(SUCoreSplunkHistory);
  v1 = (void *)sharedHistory_logger;
  sharedHistory_logger = (uint64_t)v0;

}

+ (void)logEventUUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SUCoreSplunkHistory sharedHistory](SUCoreSplunkHistory, "sharedHistory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeWriteEventUUID:", v3);

}

- (void)acquireSharedLock
{
  flock(self->_lockFD, 2);
}

- (void)releaseSharedLock
{
  flock(self->_lockFD, 8);
}

- (int)setupLogFile
{
  id v2;
  const char *v3;
  const std::__fs::filesystem::path *v4;
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  const std::__fs::filesystem::path *v18;
  std::error_code *v19;
  int v20;
  void *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v27;
  int v29;
  void *v30;
  NSObject *v31;
  int v32;
  stat v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"), "stringByAppendingPathComponent:", CFSTR("SUCoreSplunkHistory.log"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);
  if (!v3)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "[SPLUNK_HISTORY] SETUP | failed creating file name";
      v13 = v11;
      v14 = 2;
LABEL_10:
      _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
LABEL_11:

LABEL_22:
    v6 = -1;
    goto LABEL_23;
  }
  v4 = (const std::__fs::filesystem::path *)v3;
  v5 = open(v3, 521, 420);
  if (v5 == -1)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *__error();
      *(_DWORD *)buf = 67109120;
      v35 = v16;
      v12 = "[SPLUNK_HISTORY] SETUP | failed opening log file, errno:%d";
      v13 = v11;
      v14 = 8;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v6 = v5;
  memset(&v33, 0, sizeof(v33));
  if (fstat(v5, &v33))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *__error();
      *(_DWORD *)buf = 67109120;
      v35 = v9;
      _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] SETUP | failed to get file stats, errno:%d", buf, 8u);
    }
    goto LABEL_21;
  }
  if (v33.st_size >= 0x40000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v2, CFSTR(".1"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = -[NSObject cStringUsingEncoding:](v8, "cStringUsingEncoding:", 4);
    if (v17)
    {
      v18 = (const std::__fs::filesystem::path *)v17;
      close(v6);
      rename(v4, v18, v19);
      if (!v20)
      {
        v29 = open((const char *)v4, 521, 420);
        if (v29 != -1)
        {
          v6 = v29;

          goto LABEL_23;
        }
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "oslog");
        v31 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *__error();
          *(_DWORD *)buf = 67109120;
          v35 = v32;
          _os_log_impl(&dword_1B05B8000, v31, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] SETUP | failed opening new log file, errno:%d", buf, 8u);
        }

        goto LABEL_22;
      }
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "oslog");
      v22 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v23 = *__error();
      *(_DWORD *)buf = 67109120;
      v35 = v23;
      v24 = "[SPLUNK_HISTORY] SETUP | failed moving old file, errno:%d";
      v25 = v22;
      v26 = 8;
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "oslog");
      v22 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

LABEL_21:
        close(v6);
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      v24 = "[SPLUNK_HISTORY] SETUP | failed creating file name";
      v25 = v22;
      v26 = 2;
    }
    _os_log_impl(&dword_1B05B8000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_20;
  }
LABEL_23:

  return v6;
}

- (void)safeWriteEventUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  v6 = (void *)v5;
  if (!v4 || !v5)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] WRITE | wrong format for event UUID %@", buf, 0xCu);
    }

  }
  -[SUCoreSplunkHistory splunkHistoryQueue](self, "splunkHistoryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SUCoreSplunkHistory_safeWriteEventUUID___block_invoke;
  v11[3] = &unk_1E611BF60;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __42__SUCoreSplunkHistory_safeWriteEventUUID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  int v4;
  int v5;
  id v6;
  const char *v7;
  size_t v8;
  ssize_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "acquireSharedLock");
    v4 = objc_msgSend(*(id *)(a1 + 32), "setupLogFile");
    if (v4 == -1)
    {
LABEL_15:
      objc_msgSend(*(id *)(a1 + 32), "releaseSharedLock");
      return;
    }
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), *(_QWORD *)(a1 + 40));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
    v8 = strlen(v7);
    v9 = write(v5, v7, v8);
    if (v9 < 0)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "oslog");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = *__error();
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        v24 = 1024;
        v25 = v13;
        v14 = "[SPLUNK_HISTORY] WRITE | failed writing event UUID %@, errno:%d";
        v15 = v11;
        v16 = 18;
LABEL_10:
        _os_log_impl(&dword_1B05B8000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if (v9 == v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "setLastUUID:", *(_QWORD *)(a1 + 40));
LABEL_12:
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "oslog");
        v20 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v23 = v21;
          _os_log_impl(&dword_1B05B8000, v20, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] WRITE | Wrote UUID %@", buf, 0xCu);
        }

        close(v5);
        goto LABEL_15;
      }
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "oslog");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        v14 = "[SPLUNK_HISTORY] WRITE | failed writing complete event UUID %@";
        v15 = v11;
        v16 = 12;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
}

- (OS_dispatch_queue)splunkHistoryQueue
{
  return self->_splunkHistoryQueue;
}

- (NSString)lastUUID
{
  return self->_lastUUID;
}

- (void)setLastUUID:(id)a3
{
  objc_storeStrong((id *)&self->_lastUUID, a3);
}

- (int)lockFD
{
  return self->_lockFD;
}

- (void)setLockFD:(int)a3
{
  self->_lockFD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUUID, 0);
  objc_storeStrong((id *)&self->_splunkHistoryQueue, 0);
}

- (void)init
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1B05B8000, a2, OS_LOG_TYPE_ERROR, "[SPLUNK_HISTORY] INIT | failed to create history directory at path: %@, error: %@", (uint8_t *)&v2, 0x16u);
}

@end
