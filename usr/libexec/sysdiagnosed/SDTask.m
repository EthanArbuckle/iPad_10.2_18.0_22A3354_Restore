@implementation SDTask

+ (id)createLaunchConstraintData
{
  if (qword_1000B9890 != -1)
    dispatch_once(&qword_1000B9890, &stru_100099C20);
  return objc_msgSend((id)qword_1000B9888, "externalRepresentation");
}

- (void)SDTaskPOSIXSpawnAttributes
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[12];
  sigset_t v22;
  uint8_t buf[4];
  posix_spawnattr_t v24;

  v24 = 0;
  if (posix_spawnattr_init(&v24))
  {
    v3 = sub_100026C34();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to initialize spawn attr", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to initialize spawn attr"));

    return 0;
  }
  else
  {
    v22 = -1;
    *(_DWORD *)buf = 0;
    if (posix_spawnattr_setsigmask(&v24, (const sigset_t *)buf))
    {
      v7 = sub_100026C34();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to setsigmask on spawn attr when launching SDTask", v21, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v9, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to setsigmask on spawn attr when launching SDTask"));

    }
    if (posix_spawnattr_setsigdefault(&v24, &v22))
    {
      v10 = sub_100026C34();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to setsigdefault on spawn attr when launching SDTask", v21, 2u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v12, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to setsigdefault on spawn attr when launching SDTask"));

    }
    v13 = posix_spawnattr_setflags(&v24, 142);
    if (self->_targetUid == -1)
    {
      v17 = v13;
    }
    else if (posix_spawnattr_set_uid_np(&v24))
    {
      v14 = sub_100026C34();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to set target uid when launching SDTask.", v21, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v16, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to set target uid when launching SDTask."));

      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    posix_spawnattr_setjetsam_ext(&v24, 12, 80, -[SDTask activeLimit](self, "activeLimit"), -[SDTask inactiveLimit](self, "inactiveLimit"));
    if (v17)
    {
      v18 = sub_100026C34();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to setflags on spawn attr when launching SDTask", v21, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v20, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to setflags on spawn attr when launching SDTask"));

    }
    amfi_launch_constraint_set_spawnattr(&v24, -[NSData bytes](self->_launchConstraintData, "bytes"), -[NSData length](self->_launchConstraintData, "length"));
    posix_spawnattr_set_launch_type_np(&v24, 2);
    return v24;
  }
}

- (SDTask)init
{
  SDTask *v3;
  SDTask *v4;
  NSString *launchPath;
  NSArray *arguments;
  NSString *stdoutPath;
  NSString *stderrPath;
  NSString *destination;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *taskFileHandleArray;
  NSDate *startDate;
  uint64_t v14;
  NSData *launchConstraintData;
  objc_super v17;

  if (qword_1000B9898 != -1)
    dispatch_once(&qword_1000B9898, &stru_100099C40);
  v17.receiver = self;
  v17.super_class = (Class)SDTask;
  v3 = -[SDTask init](&v17, "init");
  v4 = v3;
  if (v3)
  {
    launchPath = v3->_launchPath;
    v3->_launchPath = 0;

    arguments = v4->_arguments;
    v4->_arguments = 0;

    stdoutPath = v4->_stdoutPath;
    v4->_stdoutPath = 0;

    stderrPath = v4->_stderrPath;
    v4->_stderrPath = 0;

    destination = v4->_destination;
    v4->_destination = 0;

    v4->_started = 0;
    v4->_stopped = 0;
    v4->_running = 0;
    v4->_slowTimeout = 0;
    v4->_terminationStatus = -1;
    v4->_processIdentifier = -1;
    v10 = objc_alloc((Class)NSMutableArray);
    v11 = (NSMutableArray *)objc_msgSend(v10, "initWithObjects:", qword_1000B98A0, qword_1000B98A0, 0);
    taskFileHandleArray = v4->_taskFileHandleArray;
    v4->_taskFileHandleArray = v11;

    v4->_executionTime = 0.0;
    v4->_targetUid = -1;
    v4->_activeLimit = 0;
    v4->_inactiveLimit = 0;
    startDate = v4->_startDate;
    v4->_startDate = 0;

    v4->_cpuTimeUsedNS = 0;
    v14 = objc_claimAutoreleasedReturnValue(+[SDTask createLaunchConstraintData](SDTask, "createLaunchConstraintData"));
    launchConstraintData = v4->_launchConstraintData;
    v4->_launchConstraintData = (NSData *)v14;

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask arguments](self, "arguments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v3, v4));

  return v5;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5
{
  id v7;
  id v8;
  id v9;
  SDTask *v10;
  SDTask *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(SDTask);
  v11 = v10;
  if (v10)
  {
    -[SDTask setArguments:](v10, "setArguments:", v8);
    -[SDTask setLaunchPath:](v11, "setLaunchPath:", v7);
    -[SDTask setStdoutPath:](v11, "setStdoutPath:", v9);
  }

  return v11;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5 withRuntimeChecks:(unint64_t)a6
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", a3, a4, a5));
  objc_msgSend(v7, "setRuntimeChecks:", a6);
  return v7;
}

+ (id)shellTaskWithCommand:(id)a3 outputFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[0] = CFSTR("-c");
  v10[1] = a3;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/bash"), v7, v5));

  return v8;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 inBootstrapDomainOfUID:(unsigned int)a5 outputFile:(id)a6
{
  return +[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", a3, a4, a6);
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 asUID:(unsigned int)a5 outputFile:(id)a6
{
  uint64_t v6;
  void *v7;

  v6 = *(_QWORD *)&a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", a3, a4, a6));
  objc_msgSend(v7, "setTargetUid:", v6);
  return v7;
}

- (id)fileHandleForOutput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  NSFileAttributeKey v27;
  _UNKNOWN **v28;
  NSFileAttributeKey v29;
  _UNKNOWN **v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outputDirectory"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask destination](self, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    v11 = objc_msgSend(v10, "isAbsolutePath");

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v12));

      v4 = (void *)v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByDeletingLastPathComponent"));
    if ((objc_msgSend(v14, "isEqualToString:", v6) & 1) == 0)
    {
      v29 = NSFilePosixPermissions;
      v30 = &off_1000ACE78;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v26 = 0;
      v16 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, v15, &v26);
      v17 = v26;

      if ((v16 & 1) == 0)
      {
        v20 = sub_100026C34();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100060A98();

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v22, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to create dir at %@, err: %@"), v14, v17);

        goto LABEL_16;
      }

    }
    if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) != 0
      || (v27 = NSFilePosixPermissions,
          v28 = &off_1000ACE90,
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1)), v19 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v4, 0, v18), v18, (v19 & 1) != 0))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v4));
      objc_msgSend(v9, "seekToEndOfFile");
LABEL_17:

      goto LABEL_18;
    }
    v23 = sub_100026C34();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100060A34();

    v17 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v17, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to create file for writing at path: %@"), v4);
LABEL_16:

    v9 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

- (id)fileHandleForError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSFileAttributeKey v15;
  _UNKNOWN **v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  if (objc_msgSend(v3, "fileExistsAtPath:", v4))
  {

LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v8));

    objc_msgSend(v9, "seekToEndOfFile");
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  v15 = NSFilePosixPermissions;
  v16 = &off_1000ACE90;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v7 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v5, 0, v6);

  if ((v7 & 1) != 0)
    goto LABEL_4;
  v10 = sub_100026C34();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_100060AF8(self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  objc_msgSend(v12, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to create error file for writing at path: %@"), v13);

  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)canLaunch
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  _OWORD v33[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask arguments](self, "arguments"));
  v5 = v3;
  if (!v5)
    sub_100060B70(&v32, v33);
  v6 = v5;

  if (objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" ")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, v7));
    -[SDTask setExecutionLine:](self, "setExecutionLine:", v8);

  }
  else
  {
    -[SDTask setExecutionLine:](self, "setExecutionLine:", v6);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v9, "isExecutableFileAtPath:", v6) & 1) == 0)
  {
    v17 = sub_100026C34();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100060DE8();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Launch path '%@' not accessible"), v6);
    goto LABEL_31;
  }
  if ((sub_100045E60() & 1) == 0)
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("/usr/local/")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = sub_100026C34();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100060D84();

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Error: Blocked launching %@ on this build."), v6);
      goto LABEL_31;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/bin/launchctl"))
      && (unint64_t)objc_msgSend(v4, "count") >= 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 2));
      if (((objc_msgSend(v10, "isEqualToString:", CFSTR("asuser")) & 1) != 0
         || objc_msgSend(v10, "isEqualToString:", CFSTR("bsexec")))
        && objc_msgSend(v11, "rangeOfString:", CFSTR("/usr/local/")) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = sub_100026C34();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_100060D24();

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v31, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Error: Blocked launchctl %@ %@ on this build."), v10, v11);

        goto LABEL_32;
      }

    }
  }
  if (!objc_msgSend(CFSTR("/bin/bash"), "isEqualToString:", v6))
  {
    if ((objc_msgSend(v9, "fileExistsAtPath:", v6) & 1) != 0)
      goto LABEL_24;
    v22 = sub_100026C34();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100060CC0();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("File '%@' does not exist; will not execute."),
      v6);
    goto LABEL_31;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-c ")));

  if (!v13 || (unint64_t)objc_msgSend(v13, "count") < 2)
    goto LABEL_19;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(" ")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));

  if ((objc_msgSend(v9, "fileExistsAtPath:", v16) & 1) == 0)
  {
    v25 = sub_100026C34();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100060C18((uint64_t)v16, v13, v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 1));
    objc_msgSend(v27, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("File '%@' does not exist; will not execute %@."),
      v16,
      v28);

LABEL_31:
LABEL_32:
    v19 = 0;
    goto LABEL_33;
  }

LABEL_19:
LABEL_24:
  v19 = 1;
LABEL_33:

  return v19;
}

- (void)createFileHandles
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int *v8;
  char *v9;
  void *v10;
  void *v11;
  int *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  char *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));

  if (!v3)
    -[SDTask setStdoutPath:](self, "setStdoutPath:", CFSTR("error_log.txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask fileHandleForOutput](self, "fileHandleForOutput"));
  if (!v4)
  {
    v5 = sub_100026C34();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      v30 = 2080;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Can't create file '%@' to store output: %s.  Continuing...", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    v12 = __error();
    objc_msgSend(v10, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Can't create file '%@' to store output: %s.  Continuing..."), v11, strerror(*v12));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
      v17 = v4;
    else
      v17 = 0;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "outputDirectory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("errors")));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("_stderr.txt")));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v22));
    -[SDTask setStderrPath:](self, "setStderrPath:", v23);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[SDTask fileHandleForError](self, "fileHandleForError"));
  }
  v24 = v4;
  if (!v4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, 1);

  if (!v4)
  {

  }
  v26 = v17;
  if (!v17)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 2));
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  objc_msgSend(v27, "setObject:atIndexedSubscript:", v26, 2);

  if (!v17)
  {

  }
}

- (void)closeFileHandles
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesOfItemAtPath:error:", v7, 0));

  v9 = objc_msgSend(v8, "fileSize");
  if (v8 && !v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
    objc_msgSend(v6, "removeItemAtPath:error:", v10, 0);

  }
  v11 = qword_1000B98A0;
  v12 = v13;
  if (v13 && v13 != (id)qword_1000B98A0)
  {
    objc_msgSend(v13, "closeFile");
    v12 = v13;
    v11 = qword_1000B98A0;
  }
  if (v12 != v5 && v5 && v5 != (id)v11)
    objc_msgSend(v5, "closeFile");

}

- (BOOL)createChildProcess
{
  void *v3;
  void *v4;
  id v5;
  char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int *v27;
  int v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  char *v42;
  char ***v43;
  int v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  char *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  posix_spawnattr_t v56;
  posix_spawn_file_actions_t v57;
  pid_t v58;
  uint8_t buf[4];
  _QWORD v60[3];
  _BYTE v61[128];

  v58 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask arguments](self, "arguments"));
  v56 = 0;
  v57 = 0;
  -[SDTask setStarted:](self, "setStarted:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SDTask setStartDate:](self, "setStartDate:", v4);

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath")));
  v6 = (char *)objc_msgSend(v5, "fileSystemRepresentation");

  v7 = sub_100026C34();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
    *(_DWORD *)buf = 138412290;
    v60[0] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Executing '%@'", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
  objc_msgSend(v10, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Executing '%@'"), v11);

  v12 = malloc_type_malloc(8 * (_QWORD)objc_msgSend(v3, "count") + 16, 0x10040436913F5uLL);
  if (v12)
  {
    v13 = v12;
    v50 = v6;
    v51 = v3;
    *v12 = v6;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v14 = v3;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v53;
      v18 = 1;
      do
      {
        v19 = 0;
        v20 = v18 << 32;
        v21 = (int)v18;
        v22 = (char *)&v13[(int)v18];
        do
        {
          if (*(_QWORD *)v53 != v17)
            objc_enumerationMutation(v14);
          *(_QWORD *)&v22[8 * (_QWORD)v19] = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v19)), "fileSystemRepresentation");
          v19 = (char *)v19 + 1;
          v20 += (uint64_t)&_mh_execute_header;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        v18 = (uint64_t)v19 + v21;
      }
      while (v16);
      v23 = v20 >> 32;
    }
    else
    {
      v23 = 1;
    }

    v13[v23] = 0;
    -[SDTask createFileHandles](self, "createFileHandles");
    v28 = posix_spawn_file_actions_init(&v57);
    if (v28)
    {
      v29 = v28;
      v30 = sub_100026C34();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v3 = v51;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_100060F6C(v29);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v32, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to posix_spawn_file_actions_init with error: %s. Skipping this task"), strerror(v29));

      free(v13);
      goto LABEL_21;
    }
    v35 = 0;
    v3 = v51;
    do
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", v35));
      v38 = posix_spawn_file_actions_adddup2(&v57, (int)objc_msgSend(v37, "fileDescriptor"), v35);

      if (v38)
      {
        v39 = sub_100026C34();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v42 = strerror(v38);
          *(_DWORD *)buf = 67109378;
          LODWORD(v60[0]) = v35;
          WORD2(v60[0]) = 2080;
          *(_QWORD *)((char *)v60 + 6) = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to posix_spawn_file_actions_adddup2() for fd %d when launching SDTask: %s", buf, 0x12u);
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v41, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to posix_spawn_file_actions_adddup2() for fd %d when launching SDTask: %s"), v35, strerror(v38));

      }
      ++v35;
    }
    while (v35 != 3);
    v56 = -[SDTask SDTaskPOSIXSpawnAttributes](self, "SDTaskPOSIXSpawnAttributes");
    if (!v56)
    {
      v47 = sub_100026C34();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_100060EC0(v48);

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v49, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Could not get spawn attributes. Skipping this task"));

      free(v13);
      posix_spawn_file_actions_destroy(&v57);
      goto LABEL_21;
    }
    signal(20, 0);
    v43 = _NSGetEnviron();
    v44 = posix_spawn(&v58, v50, &v57, &v56, (char *const *)v13, *v43);
    free(v13);
    posix_spawn_file_actions_destroy(&v57);
    posix_spawnattr_destroy(&v56);
    if (!v44)
    {
      self->_processIdentifier = v58;
      v33 = 1;
      -[SDTask setRunning:](self, "setRunning:", 1);
      goto LABEL_22;
    }
    v45 = sub_100026C34();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_100060F00(v44);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v26, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("posix_spawn failed: %s"), strerror(v44));
  }
  else
  {
    v24 = sub_100026C34();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100060E4C();

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v27 = __error();
    objc_msgSend(v26, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to malloc arg array with errno: %s"), strerror(*v27));
  }

LABEL_21:
  v33 = 0;
LABEL_22:

  return v33;
}

- (BOOL)createChild
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  if (-[SDTask started](self, "started") || -[SDTask stopped](self, "stopped"))
  {
    v3 = sub_100026C34();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100060FD8(self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
    objc_msgSend(v5, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Task '%@' has already been started; will not execute"),
      v6);

LABEL_6:
    LOBYTE(v7) = 0;
    return v7;
  }
  v7 = -[SDTask canLaunch](self, "canLaunch");
  if (!v7)
    return v7;
  if (!-[SDTask createChildProcess](self, "createChildProcess"))
    goto LABEL_6;
  LOBYTE(v7) = 1;
  return v7;
}

- (void)finishChild
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double cpuTimeUsedNS;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  double v27;

  if (!-[SDTask stopped](self, "stopped") && -[SDTask isRunning](self, "isRunning"))
  {
    -[SDTask closeFileHandles](self, "closeFileHandles");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask startDate](self, "startDate"));
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    self->_executionTime = v5;

    v6 = sub_100026C34();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
      -[SDTask executionTime](self, "executionTime");
      cpuTimeUsedNS = (double)self->_cpuTimeUsedNS;
      *(_DWORD *)buf = 138413058;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      v24 = 2048;
      v25 = v13;
      v26 = 2048;
      v27 = cpuTimeUsedNS / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Task '%@|%@' finished in %f seconds and used %f seconds of actual CPU time", buf, 0x2Au);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
    -[SDTask executionTime](self, "executionTime");
    objc_msgSend(v14, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Task '%@|%@' finished in %f seconds and used %f seconds of actual CPU time"), v16, v18, v19, (double)self->_cpuTimeUsedNS / 1000000000.0);

  }
  -[SDTask setStopped:](self, "setStopped:", 1);
  -[SDTask setRunning:](self, "setRunning:", 0);
}

- (void)logChildExitReason:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  unsigned int *p_terminationStatus;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unsigned int v28;

  v3 = *(_QWORD *)&a3;
  v5 = a3 & 0x7F;
  if ((_DWORD)v5 == 127)
  {
    v14 = a3 >> 8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    objc_msgSend(v15, "setTotalFailedTasks:", objc_msgSend(v15, "totalFailedTasks") + 1);

    v16 = sub_100026C34();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v14 == 19)
    {
      if (v18)
        sub_100061164(self);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Unknown state of child process '%@' with wstatus %04x"), v19, v3);
    }
    else
    {
      if (v18)
        sub_1000611E4(self);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Child process '%@' stopped (but did not terminate) due to signal %d"), v19, ((int)v3 >> 8));
    }
    goto LABEL_20;
  }
  if ((a3 & 0x7F) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    objc_msgSend(v20, "setTotalFailedTasks:", objc_msgSend(v20, "totalFailedTasks") + 1);

    v21 = sub_100026C34();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100061054(self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Child process '%@' terminated due to signal %d"), v19, v5);
    goto LABEL_20;
  }
  v6 = BYTE1(a3);
  p_terminationStatus = (unsigned int *)&self->_terminationStatus;
  self->_terminationStatus = BYTE1(a3);
  v8 = sub_100026C34();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      v24 = *p_terminationStatus;
      *(_DWORD *)buf = 138412546;
      v26 = v23;
      v27 = 1024;
      v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Child process '%@' exited with status %d", buf, 0x12u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Child process '%@' exited with status %d"), v19, *p_terminationStatus);
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_1000610D4(self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  objc_msgSend(v11, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Child process '%@' exited with nonzero status %d"), v12, *p_terminationStatus);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v13, "setTotalFailedTasks:", objc_msgSend(v13, "totalFailedTasks") + 1);
LABEL_21:

}

- (void)childExitHandler
{
  rusage v3;
  rusage v4;
  int v5;

  v5 = 0;
  memset(&v4, 0, sizeof(v4));
  while (wait4(-[SDTask processIdentifier](self, "processIdentifier"), &v5, 4, &v4) == -1 && *__error() == 4)
    ;
  v3 = v4;
  -[SDTask setRusage_details:](self, "setRusage_details:", &v3);
  self->_endStatus = v5;
  -[SDTask setCpuTimeUsedNS:](self, "setCpuTimeUsedNS:", sub_100027260((uint64_t)&v4, (uint64_t)&v4.ru_stime));
  -[SDTask logChildExitReason:](self, "logChildExitReason:", v5);
  -[SDTask finishChild](self, "finishChild");
}

- (void)stop
{
  -[SDTask stop:](self, "stop:", 1);
}

- (void)stop:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  const __CFString *v6;
  SDTask *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v3 = *(_QWORD *)&a3;
  if (-[SDTask isRunning](self, "isRunning"))
  {
    if (self->_processIdentifier < 0)
      sub_100061264();
    switch((int)v3)
    {
      case 1:
        if (-[SDTask slowTimeout](self, "slowTimeout"))
          v5 = 5500;
        else
          v5 = 500;
        v6 = CFSTR("Interrupting");
        v7 = self;
        v8 = 1;
        v9 = 2;
        goto LABEL_19;
      case 2:
        if (-[SDTask slowTimeout](self, "slowTimeout"))
          v5 = 2750;
        else
          v5 = 250;
        v6 = CFSTR("Terminating");
        v7 = self;
        v8 = 2;
        v9 = 15;
        goto LABEL_19;
      case 3:
        v13 = sub_100026C34();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
          *(_DWORD *)buf = 138412546;
          v36 = v16;
          v37 = 2112;
          v38 = v18;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "-->\tTask is taking a while to terminate: '%@|%@'", buf, 0x16u);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
        objc_msgSend(v19, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("-->\tTask is taking a while to terminate: '%@|%@'"), v21, v23);

        -[SDTask stop:withStateString:withSignal:withWaitMS:](self, "stop:withStateString:withSignal:withWaitMS:", 3, CFSTR("Terminating"), 0, 3000);
        return;
      case 4:
        v6 = CFSTR("Killing");
        v7 = self;
        v8 = 4;
        v9 = 9;
        v5 = 1000;
LABEL_19:
        -[SDTask stop:withStateString:withSignal:withWaitMS:](v7, "stop:withStateString:withSignal:withWaitMS:", v8, v6, v9, v5);
        return;
      case 5:
        v24 = sub_100026C34();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
          *(_DWORD *)buf = 138412546;
          v36 = v27;
          v37 = 2112;
          v38 = v29;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Giving up on waiting for %@|%@", buf, 0x16u);

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastPathComponent"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
        objc_msgSend(v30, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Giving up on waiting for %@|%@"), v32, v34);

        v12 = objc_claimAutoreleasedReturnValue(-[SDTask exitSource](self, "exitSource"));
        dispatch_source_cancel(v12);
        goto LABEL_23;
      default:
        v10 = sub_100026C34();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10006128C(v3, v11);

        v12 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        -[NSObject logWithSubsystem:category:msg:](v12, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Unknown task stop state: %u"), v3);
LABEL_23:

        break;
    }
  }
}

- (void)stop:(int)a3 withStateString:(id)a4 withSignal:(int)a5 withWaitMS:(int64_t)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  NSObject *v25;
  _QWORD block[5];
  int v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v7 = *(_QWORD *)&a5;
  v9 = a4;
  if (-[SDTask isRunning](self, "isRunning"))
  {
    if ((_DWORD)v7)
    {
      v10 = sub_100026C34();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[SDTask processIdentifier](self, "processIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
        *(_DWORD *)buf = 138413058;
        v30 = v9;
        v31 = 1024;
        v32 = v12;
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "-->\t%@ (pid %d): '%@|%@'", buf, 0x26u);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v18 = -[SDTask processIdentifier](self, "processIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
      objc_msgSend(v17, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("-->\t%@ (pid %d): '%@|%@'"), v9, v18, v20, v22);

      if (-[SDTask processIdentifier](self, "processIdentifier") >= 1)
        -[SDTask signalRunningTask:](self, "signalRunningTask:", v7);
    }
    v23 = dispatch_time(0, 1000000 * a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "taskQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003F4A4;
    block[3] = &unk_100099C00;
    block[4] = self;
    v28 = a3;
    dispatch_after(v23, v25, block);

  }
}

- (BOOL)resume
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  uint8_t buf[4];
  void *v11;

  v9 = 0;
  if (!csops(-[SDTask processIdentifier](self, "processIdentifier"), 0, &v9, 4)
    && (v9 & 0x4000000) != 0)
  {
    return -[SDTask signalRunningTask:](self, "signalRunningTask:", 19) == 0;
  }
  v3 = sub_100026C34();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ failed to launch due to validation error", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  objc_msgSend(v6, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ failed to launch due to validation error"), v7);

  kill(-[SDTask processIdentifier](self, "processIdentifier"), 9);
  return 0;
}

- (int)signalRunningTask:(int)a3
{
  return killpg(self->_processIdentifier, a3);
}

- (void)setCpuTimeUsedNS:(unint64_t)a3
{
  self->_cpuTimeUsedNS = a3;
}

- (unint64_t)cpuTimeUsedNS
{
  uint64_t v3;
  unint64_t result;

  if (!-[SDTask isRunning](self, "isRunning"))
    return self->_cpuTimeUsedNS;
  v3 = sub_1000271C4(-[SDTask processIdentifier](self, "processIdentifier"));
  result = sub_10002713C(v3);
  self->_cpuTimeUsedNS = result;
  return result;
}

- (NSString)launchPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLaunchPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setArguments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)stdoutPath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStdoutPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)stderrPath
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStderrPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)executionLine
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExecutionLine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)destination
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (rusage)rusage_details
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  timeval ru_stime;

  v3 = *(_OWORD *)&self[1].ru_msgrcv;
  *(_OWORD *)&retstr->ru_oublock = *(_OWORD *)&self[1].ru_oublock;
  *(_OWORD *)&retstr->ru_msgrcv = v3;
  *(_OWORD *)&retstr->ru_nvcsw = *(_OWORD *)&self[1].ru_nvcsw;
  v4 = *(_OWORD *)&self[1].ru_idrss;
  *(_OWORD *)&retstr->ru_maxrss = *(_OWORD *)&self[1].ru_maxrss;
  *(_OWORD *)&retstr->ru_idrss = v4;
  v5 = *(_OWORD *)&self[1].ru_nswap;
  *(_OWORD *)&retstr->ru_minflt = *(_OWORD *)&self[1].ru_minflt;
  *(_OWORD *)&retstr->ru_nswap = v5;
  ru_stime = self[1].ru_stime;
  retstr->ru_utime = self[1].ru_utime;
  retstr->ru_stime = ru_stime;
  return self;
}

- (void)setRusage_details:(rusage *)a3
{
  __int128 v3;
  __int128 v4;
  timeval ru_stime;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  self->_rusage_details.ru_utime = a3->ru_utime;
  v3 = *(_OWORD *)&a3->ru_minflt;
  ru_stime = a3->ru_stime;
  v4 = *(_OWORD *)&a3->ru_maxrss;
  *(_OWORD *)&self->_rusage_details.ru_idrss = *(_OWORD *)&a3->ru_idrss;
  *(_OWORD *)&self->_rusage_details.ru_minflt = v3;
  self->_rusage_details.ru_stime = ru_stime;
  *(_OWORD *)&self->_rusage_details.ru_maxrss = v4;
  v6 = *(_OWORD *)&a3->ru_nvcsw;
  v8 = *(_OWORD *)&a3->ru_nswap;
  v7 = *(_OWORD *)&a3->ru_oublock;
  *(_OWORD *)&self->_rusage_details.ru_msgrcv = *(_OWORD *)&a3->ru_msgrcv;
  *(_OWORD *)&self->_rusage_details.ru_nvcsw = v6;
  *(_OWORD *)&self->_rusage_details.ru_nswap = v8;
  *(_OWORD *)&self->_rusage_details.ru_oublock = v7;
}

- (unsigned)activeLimit
{
  return self->_activeLimit;
}

- (void)setActiveLimit:(unsigned int)a3
{
  self->_activeLimit = a3;
}

- (unsigned)inactiveLimit
{
  return self->_inactiveLimit;
}

- (void)setInactiveLimit:(unsigned int)a3
{
  self->_inactiveLimit = a3;
}

- (unsigned)targetUid
{
  return self->_targetUid;
}

- (void)setTargetUid:(unsigned int)a3
{
  self->_targetUid = a3;
}

- (OS_dispatch_source)exitSource
{
  return self->_exitSource;
}

- (void)setExitSource:(id)a3
{
  objc_storeStrong((id *)&self->_exitSource, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)slowTimeout
{
  return self->_slowTimeout;
}

- (void)setSlowTimeout:(BOOL)a3
{
  self->_slowTimeout = a3;
}

- (int)terminationStatus
{
  return self->_terminationStatus;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (NSMutableArray)taskFileHandleArray
{
  return self->_taskFileHandleArray;
}

- (void)setTaskFileHandleArray:(id)a3
{
  objc_storeStrong((id *)&self->_taskFileHandleArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskFileHandleArray, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_exitSource, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_executionLine, 0);
  objc_storeStrong((id *)&self->_stderrPath, 0);
  objc_storeStrong((id *)&self->_stdoutPath, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_launchPath, 0);
  objc_storeStrong((id *)&self->_launchConstraintData, 0);
}

@end
