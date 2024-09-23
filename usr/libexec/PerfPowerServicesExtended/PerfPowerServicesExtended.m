id sub_100003098()
{
  void *v0;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](PowerlogCore, "sharedCore"));
  objc_msgSend(v0, "stopCore");

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    NSLog(CFSTR("*** Powerlog Exit *** sleep to avoid bounce"));
  return +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 2);
}

uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  __CFNotificationCenter *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  id v45;

  EnterSandbox("PerfPowerServicesExtended", "com.apple.PerfPowerServicesExtended");
  v0 = objc_autoreleasePoolPush();
  if (+[PowerlogCore allowRun](PowerlogCore, "allowRun"))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(+[PLUtilities fullModeDaemonName](PLUtilities, "fullModeDaemonName"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** start %@ ***"), v1));

      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "main"));
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v4, v5, 59);

      v6 = PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_100003784();

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000036A4, CFSTR("com.apple.powerlog.state_changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](PowerlogCore, "sharedCore"));
    objc_msgSend(v9, "startCore");

    objc_autoreleasePoolPop(v0);
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      v12 = objc_msgSend(v10, "runMode:beforeDate:", NSDefaultRunLoopMode, v11);

    }
    while ((v12 & 1) != 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](PowerlogCore, "sharedCore"));
    objc_msgSend(v13, "stopCore");

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Caches"), "stringByAppendingString:", CFSTR("/powerlogd.launchd")));
    v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

    v17 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    if (v16)
    {
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[PLUtilities fullModeDaemonName](PLUtilities, "fullModeDaemonName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** kill %@ ***"), v18));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "main"));
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 64);

        v23 = PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          sub_100003784();

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Caches"), "stringByAppendingString:", CFSTR("/powerlogd.launchd")));
      v45 = 0;
      v27 = objc_msgSend(v25, "removeItemAtPath:error:", v26, &v45);
      v28 = v45;

      if ((v27 & 1) != 0)
      {
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Caches"), "stringByAppendingString:", CFSTR("/powerlogd.launchd")));
          NSLog(CFSTR("%@ removed "), v29);

        }
      }
      else
      {
        NSLog(CFSTR("*** ERROR *** unable to remove launchd flag: %@"), v28);
      }
      v37 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v37, CFSTR("com.apple.powerlog.state_changed"), 0, 0, 0);
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sleep to avoid bounce")));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "main"));
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v40, v41, 73);

        v42 = PLLogCommon();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          sub_100003784();

      }
      sleep(0xAu);

    }
    else
    {
      if (v17)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[PLUtilities fullModeDaemonName](PLUtilities, "fullModeDaemonName"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** stop %@ *** sleep to avoid bounce"), v30));

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "main"));
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v33, v34, 77);

        v35 = PLLogCommon();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          sub_100003784();

      }
      sleep(0xAu);
    }
    objc_autoreleasePoolPop(v0);
  }
  return 0;
}

void sub_1000036A4()
{
  unsigned int v0;
  unsigned __int8 v1;
  unsigned int v2;
  unsigned int v3;
  void *v4;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    NSLog(CFSTR("*** PLStateChanged ***"));
  v0 = +[PLDefaults taskMode](PLDefaults, "taskMode");
  v1 = +[PowerlogCore allowRun](PowerlogCore, "allowRun");
  v2 = +[PLDefaults liveModeQuery](PLDefaults, "liveModeQuery");
  if ((v1 & 1) == 0)
  {
    if (!v0)
    {
LABEL_13:
      sub_100003098();
      return;
    }
LABEL_12:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance"));
    objc_msgSend(v4, "taskingCleanup");

    goto LABEL_13;
  }
  if (v2 == 1)
    v3 = v0;
  else
    v3 = 0;
  if (v3 == 1)
    goto LABEL_12;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    NSLog(CFSTR("*** Powerlog Continue ***"));
}

void sub_100003760(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100003784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003778();
  sub_100003760((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
  sub_100003770();
}

id objc_msgSend_allowRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowRun");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_debugEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugEnabled");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fullModeDaemonName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullModeDaemonName");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_liveModeQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveModeQuery");
}

id objc_msgSend_logMessage_fromFile_fromFunction_fromLineNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMessage:fromFile:fromFunction:fromLineNumber:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCore");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_startCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCore");
}

id objc_msgSend_stopCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCore");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_taskMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskMode");
}

id objc_msgSend_taskingCleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskingCleanup");
}
