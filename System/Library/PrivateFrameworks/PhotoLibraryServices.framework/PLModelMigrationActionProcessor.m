@implementation PLModelMigrationActionProcessor

- (PLModelMigrationActionProcessor)initWithUUID:(id)a3 pathManager:(id)a4 migrationActionType:(int64_t)a5 analyticsEventManager:(id)a6 logger:(id)a7 progressUnitCount:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  PLModelMigrationActionProcessor *v18;
  PLModelMigrationActionProcessor *v19;
  void *v20;
  uint64_t v21;
  NSString *uuidTruncated;
  uint64_t v23;
  NSProgress *progress;
  PLTimedPerfCheck *lifetimePerfCheck;
  PLFileBackedLogger *v26;
  PLFileBackedLogger *logger;
  id v29;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v29 = a6;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PLModelMigrationActionProcessor;
  v18 = -[PLModelMigrationActionProcessor init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_success = 1;
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_msgSend(v15, "substringToIndex:", 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    uuidTruncated = v19->_uuidTruncated;
    v19->_uuidTruncated = (NSString *)v21;

    objc_storeStrong((id *)&v19->_pathManager, a4);
    v19->_type = a5;
    objc_storeStrong((id *)&v19->_analyticsEventManager, a6);
    v19->_tag = 1;
    v19->_pid = getpid();
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", a8);
      v23 = objc_claimAutoreleasedReturnValue();
      progress = v19->_progress;
      v19->_progress = (NSProgress *)v23;
    }
    else
    {
      progress = v19->_progress;
      v19->_progress = 0;
    }

    lifetimePerfCheck = v19->_lifetimePerfCheck;
    v19->_lifetimePerfCheck = 0;

    v19->_loggerCloseRequired = v17 == 0;
    if (v17)
    {
      v26 = (PLFileBackedLogger *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D731E0], "setupWithLibraryIdentifier:type:", 0, 1);
      v26 = (PLFileBackedLogger *)objc_claimAutoreleasedReturnValue();
    }
    logger = v19->_logger;
    v19->_logger = v26;

    -[PLModelMigrationActionProcessor _initialLog](v19, "_initialLog");
  }

  return v19;
}

- (void)_initialLog
{
  PLTimedPerfCheck *v3;
  PLTimedPerfCheck *lifetimePerfCheck;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 *v15;
  id v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  __int128 *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  dev_t st_dev;
  __int16 v27;
  __darwin_ino64_t st_ino;
  __int16 v29;
  int st_mode;
  __int16 v31;
  char *v32;
  __int16 v33;
  int st_nlink;
  __int16 v35;
  uid_t st_uid;
  __int16 v37;
  gid_t st_gid;
  __int16 v39;
  dev_t st_rdev;
  __int16 v41;
  off_t st_size;
  __int16 v43;
  __darwin_time_t tv_sec;
  __int16 v45;
  __darwin_time_t v46;
  __int16 v47;
  __darwin_time_t v48;
  __int16 v49;
  __darwin_time_t v50;
  __int16 v51;
  blksize_t st_blksize;
  __int16 v53;
  blkcnt_t st_blocks;
  __int16 v55;
  __uint32_t st_flags;
  char __bp[16];
  stat v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  self->_lifetimeToken = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0D73300], "start");
  v3 = (PLTimedPerfCheck *)objc_claimAutoreleasedReturnValue();
  lifetimePerfCheck = self->_lifetimePerfCheck;
  self->_lifetimePerfCheck = v3;

  -[PLModelMigrationActionProcessor _generateActionMarker](self, "_generateActionMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_logger)
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      PLMigrationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      v9 = (unint64_t)(self->_type - 1) >= 5 ? CFSTR("schema") : CFSTR("post migration");
      v10 = v9;
      objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromPLMigrationActionTypeShort(self->_type);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v58.st_dev = 138544386;
      *(_QWORD *)&v58.st_mode = v5;
      WORD2(v58.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&v58.st_ino + 6) = (__darwin_ino64_t)v10;
      HIWORD(v58.st_gid) = 2114;
      *(_QWORD *)&v58.st_rdev = v11;
      LOWORD(v58.st_atimespec.tv_sec) = 2114;
      *(__darwin_time_t *)((char *)&v58.st_atimespec.tv_sec + 2) = (__darwin_time_t)v12;
      WORD1(v58.st_atimespec.tv_nsec) = 2114;
      *(uint64_t *)((char *)&v58.st_atimespec.tv_nsec + 4) = (uint64_t)v14;
      LODWORD(v22) = 52;
      v15 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActionProcessor.m", 132, 0, &v58, v22);
      if (v15 != &v59)
        free(v15);
    }
  }
  memset(&v58, 0, sizeof(v58));
  if (!self->_type)
  {
    -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = stat((const char *)objc_msgSend(v16, "fileSystemRepresentation"), &v58);

    if (!v17)
    {
      __bp[11] = 0;
      strcpy(__bp, "          ");
      strmode(v58.st_mode, __bp);
      __bp[10] = 0;
      if (self->_logger)
      {
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          PLMigrationGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          v23 = 138547458;
          v24 = v5;
          v25 = 1024;
          st_dev = v58.st_dev;
          v27 = 2048;
          st_ino = v58.st_ino;
          v29 = 1024;
          st_mode = v58.st_mode;
          v31 = 2080;
          v32 = __bp;
          v33 = 1024;
          st_nlink = v58.st_nlink;
          v35 = 1024;
          st_uid = v58.st_uid;
          v37 = 1024;
          st_gid = v58.st_gid;
          v39 = 1024;
          st_rdev = v58.st_rdev;
          v41 = 2048;
          st_size = v58.st_size;
          v43 = 2048;
          tv_sec = v58.st_atimespec.tv_sec;
          v45 = 2048;
          v46 = v58.st_mtimespec.tv_sec;
          v47 = 2048;
          v48 = v58.st_ctimespec.tv_sec;
          v49 = 2048;
          v50 = v58.st_birthtimespec.tv_sec;
          v51 = 1024;
          st_blksize = v58.st_blksize;
          v53 = 2048;
          st_blocks = v58.st_blocks;
          v55 = 1024;
          st_flags = v58.st_flags;
          LODWORD(v22) = 140;
          v21 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActionProcessor.m", 140, 0, &v23, v22);
          if (v21 != &v59)
            free(v21);
        }
      }
    }
  }

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  double lifetimeToken;
  double v12;
  double v13;
  PLTimedPerfCheck *lifetimePerfCheck;
  __CFString *v15;
  void *v16;
  _OWORD *v17;
  uint64_t v18;
  objc_super v19;
  int v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  _OWORD v32[32];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PLTimedPerfCheck stop](self->_lifetimePerfCheck, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
  if (self->_logger)
  {
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      memset(v32, 0, sizeof(v32));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      -[PLModelMigrationActionProcessor _generateActionMarker](self, "_generateActionMarker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (unint64_t)(self->_type - 1) >= 5 ? CFSTR("schema") : CFSTR("post migration");
      v9 = v8;
      PLStringFromPLMigrationActionTypeShort(self->_type);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      lifetimeToken = self->_lifetimeToken;
      v12 = CFAbsoluteTimeGetCurrent() - lifetimeToken;
      v13 = lifetimeToken <= 0.0 ? 0.0 : v12;
      lifetimePerfCheck = self->_lifetimePerfCheck;
      if (lifetimePerfCheck)
      {
        -[PLTimedPerfCheck perfCheckLogStringWithPerfCheckInfo:](lifetimePerfCheck, "perfCheckLogStringWithPerfCheckInfo:", v3);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = CFSTR(", <perf check disabled>");
      }
      -[PLModelMigrationActionProcessor _progressLogMessage](self, "_progressLogMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544642;
      v21 = v7;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      v26 = 2048;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      LODWORD(v18) = 62;
      v17 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActionProcessor.m", 147, 0, &v20, v18);
      if (v17 != v32)
        free(v17);
    }
  }
  if (self->_loggerCloseRequired)
    -[PLFileBackedLogger close](self->_logger, "close");

  v19.receiver = self;
  v19.super_class = (Class)PLModelMigrationActionProcessor;
  -[PLModelMigrationActionProcessor dealloc](&v19, sel_dealloc);
}

- (id)_generateActionMarkerBase
{
  unint64_t v2;
  const __CFString *v3;

  v2 = self->_type - 1;
  if (v2 > 4)
    v3 = CFSTR("sc");
  else
    v3 = off_1E3666008[v2];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_uuidTruncated, v3);
}

- (id)_generateActionMarker
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PLModelMigrationActionProcessor _generateActionMarkerBase](self, "_generateActionMarkerBase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("tag:%@     "), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_generateActionTagMarker
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLModelMigrationActionProcessor _generateActionMarkerBase](self, "_generateActionMarkerBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("tag:%@:%04d"), v4, self->_tag);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_startLogEntryWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  _OWORD *v12;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  id v20;
  _OWORD v21[32];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_token = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0D73300], "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_logger)
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      memset(v21, 0, sizeof(v21));
      PLMigrationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      -[PLModelMigrationActionProcessor _generateActionTagMarker](self, "_generateActionTagMarker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(self->_type - 1) >= 5)
        v10 = CFSTR("schema");
      else
        v10 = CFSTR("post migration");
      v11 = v10;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v4;
      LODWORD(v14) = 32;
      v12 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v12, "PLModelMigrationActionProcessor.m", 172, 0, &v15, v14);
      if (v12 != v21)
        free(v12);
    }
  }

  return v5;
}

- (void)_stopLogEntryWithPerfCheck:(id)a3
{
  id v4;
  double token;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  _OWORD *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  void *v28;
  _OWORD v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  token = self->_token;
  v6 = CFAbsoluteTimeGetCurrent() - token;
  if (token <= 0.0)
    v7 = 0.0;
  else
    v7 = v6;
  objc_msgSend(v4, "stop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_logger)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      memset(v29, 0, sizeof(v29));
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      -[PLModelMigrationActionProcessor _generateActionTagMarker](self, "_generateActionTagMarker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(self->_type - 1) >= 5)
        v13 = CFSTR("schema");
      else
        v13 = CFSTR("post migration");
      v14 = v13;
      if (v4)
      {
        objc_msgSend(v4, "perfCheckLogStringWithPerfCheckInfo:", v8);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = CFSTR(", <perf check disabled>");
      }
      -[PLModelMigrationActionProcessor _progressLogMessage](self, "_progressLogMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v12;
      v21 = 2114;
      v22 = v14;
      v23 = 2048;
      v24 = v7;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      LODWORD(v18) = 52;
      v17 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActionProcessor.m", 179, 0, &v19, v18);
      if (v17 != v29)
        free(v17);
    }
  }

}

- (id)_progressLogMessage
{
  NSProgress *progress;
  __CFString *v4;

  progress = self->_progress;
  if (progress)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", action progress:(%.2lf %%)"), (double)-[NSProgress completedUnitCount](progress, "completedUnitCount")* 100.0/ (double)-[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E36789C0;
  }
  return v4;
}

- (void)performActionWithName:(id)a3 ifRequired:(id)a4 block:(id)a5
{
  -[PLModelMigrationActionProcessor _performActionWithName:ifRequired:recordTimedCoreAnalyticsEvent:coreAnalyticsEventKey:block:](self, "_performActionWithName:ifRequired:recordTimedCoreAnalyticsEvent:coreAnalyticsEventKey:block:", a3, a4.var0, 0, 0, a5);
}

- (void)performActionWithName:(id)a3 ifRequired:(id)a4 recordTimedCoreAnalyticsEvent:(id)a5 coreAnalyticsEventKey:(id)a6 block:(id)a7
{
  -[PLModelMigrationActionProcessor _performActionWithName:ifRequired:recordTimedCoreAnalyticsEvent:coreAnalyticsEventKey:block:](self, "_performActionWithName:ifRequired:recordTimedCoreAnalyticsEvent:coreAnalyticsEventKey:block:", a3, a4.var0, a5, a6, a7);
}

- (void)_performActionWithName:(id)a3 ifRequired:(id)a4 recordTimedCoreAnalyticsEvent:(id)a5 coreAnalyticsEventKey:(id)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t (**v15)(_QWORD);
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __int128 *v23;
  PLModelMigrationActionProcessor *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  __int128 *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  __int128 *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (uint64_t (**)(_QWORD))a7;
  if (a4.var0)
  {
    if (-[PLModelMigrationActionProcessor isSuccess](self, "isSuccess"))
    {
      -[PLModelMigrationActionProcessor _startLogEntryWithName:](self, "_startLogEntryWithName:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLModelMigrationActionProcessor setSuccess:](self, "setSuccess:", v15[2](v15));
      if (!-[PLModelMigrationActionProcessor isSuccess](self, "isSuccess"))
      {
        if (self->_logger)
        {
          PLMigrationGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

          if (v18)
          {
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            PLMigrationGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
            -[PLModelMigrationActionProcessor _generateActionTagMarker](self, "_generateActionTagMarker");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (unint64_t)(self->_type - 1) >= 5 ? CFSTR("schema") : CFSTR("post migration");
            v22 = v21;
            v43 = 138543618;
            v44 = v20;
            v45 = 2114;
            v46 = v22;
            LODWORD(v41) = 22;
            v23 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionProcessor.m", 206, 16, &v43, v41);
            if (v23 != &v49)
              free(v23);
          }
        }
      }
      v24 = self;
      if (!-[PLModelMigrationActionProcessor ignoreProgressUpdates](v24, "ignoreProgressUpdates"))
      {
        -[PLModelMigrationActionProcessor progress](v24, "progress");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v27 = objc_msgSend(v25, "completedUnitCount");
          if (v27 >= objc_msgSend(v26, "totalUnitCount"))
          {
            -[PLModelMigrationActionProcessor logger](v24, "logger");
            v35 = objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = (void *)v35;
              PLMigrationGetLog();
              v37 = objc_claimAutoreleasedReturnValue();
              HIDWORD(v42) = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);

              if (HIDWORD(v42))
              {
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v75 = 0u;
                v76 = 0u;
                v73 = 0u;
                v74 = 0u;
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v67 = 0u;
                v68 = 0u;
                v65 = 0u;
                v66 = 0u;
                v63 = 0u;
                v64 = 0u;
                v61 = 0u;
                v62 = 0u;
                v59 = 0u;
                v60 = 0u;
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v53 = 0u;
                v54 = 0u;
                v51 = 0u;
                v52 = 0u;
                v49 = 0u;
                v50 = 0u;
                PLMigrationGetLog();
                v38 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
                v43 = 138543362;
                v44 = v26;
                LODWORD(v42) = 12;
                v39 = (__int128 *)_os_log_send_and_compose_impl();

                -[PLModelMigrationActionProcessor logger](v24, "logger", &v43, v42);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActionProcessor.m", 82, 0);

                if (v39 != &v49)
                  free(v39);
              }
            }
          }
          else
          {
            objc_msgSend(v26, "setCompletedUnitCount:", objc_msgSend(v26, "completedUnitCount") + 1);
          }
        }

      }
      -[PLModelMigrationActionProcessor _stopLogEntryWithPerfCheck:](v24, "_stopLogEntryWithPerfCheck:", v16);
      if (v13 && v14)
        -[PLCoreAnalyticsEventManager stopRecordingTimedEventWithToken:forKey:onEventWithName:](v24->_analyticsEventManager, "stopRecordingTimedEventWithToken:forKey:onEventWithName:", v14, v13, v24->_token);

    }
    else if (self->_logger)
    {
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        PLMigrationGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        -[PLModelMigrationActionProcessor _generateActionTagMarker](self, "_generateActionTagMarker");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (unint64_t)(self->_type - 1) >= 5 ? CFSTR("schema") : CFSTR("post migration");
        v33 = v32;
        v43 = 138543874;
        v44 = v31;
        v45 = 2114;
        v46 = v33;
        v47 = 2114;
        v48 = v12;
        LODWORD(v41) = 32;
        v34 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionProcessor.m", 215, 16, &v43, v41);
        if (v34 != &v49)
          free(v34);
      }
    }
  }
  ++self->_tag;

}

- (BOOL)isSuccess
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)ignoreProgressUpdates
{
  return self->_ignoreProgressUpdates;
}

- (void)setIgnoreProgressUpdates:(BOOL)a3
{
  self->_ignoreProgressUpdates = a3;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLFileBackedLogger)logger
{
  return (PLFileBackedLogger *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lifetimePerfCheck, 0);
  objc_storeStrong((id *)&self->_analyticsEventManager, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_uuidTruncated, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
