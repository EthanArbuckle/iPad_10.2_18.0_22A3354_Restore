@implementation SystemDiagnosticLogAgent

+ (id)logAgentWithTaskType:(int)a3
{
  SystemDiagnosticLogAgentiOS *v4;
  __CFString *v5;
  id v6;
  os_log_t v7;

  v4 = objc_alloc_init(SystemDiagnosticLogAgentiOS);
  v5 = sub_100005FC8(a3);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
  v7 = os_log_create("com.apple.sysdiagnose", (const char *)objc_msgSend(v6, "UTF8String"));
  -[SystemDiagnosticLogAgent setLogHandle:](v4, "setLogHandle:", v7);

  return v4;
}

- (void)processMessage:(id)a3 replyWith:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[SystemDiagnosticLogAgent processMessage:replyWith:]", "SystemDiagnosticLogAgent.m", 162, "0 && \"Should call this from subclass only\");
}

- (BOOL)HIDCrashlogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v5 = a3;
  if (objc_opt_class(AppleDeviceManagementHIDDiagnostics, v6))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006F38;
    v9[3] = &unk_100068968;
    v10 = v5;
    v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v9, a4);
    if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HIDCrashlogsTaskWithDir SPI timed out", buf, 2u);
    }

  }
  else
  {
    v7 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleDeviceManagementHIDDiagnostics class not found on this platform, failing HIDCrashlogsTaskWithDir", buf, 2u);
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)DSCSYMTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  NSObject *v7;
  char v8;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007080;
  v11[3] = &unk_1000687F8;
  v13 = &v14;
  v6 = a3;
  v12 = v6;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v11, a4))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DSCSYM task timed out", v10, 2u);
    }

  }
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)ACLogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];
  _QWORD v14[5];
  id v15;
  uint8_t *v16;
  uint64_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  if (objc_opt_class(NFHardwareManager, v7))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = sub_1000072D0;
    v22 = sub_1000072E0;
    v23 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000072E8;
    v14[3] = &unk_100068920;
    v16 = buf;
    v14[4] = self;
    v15 = v6;
    v17 = &v24;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v14, a4))
    {
      v8 = *((_BYTE *)v25 + 24) != 0;
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ACLogsTaskWithDir SPI timed out", v13, 2u);
      }

      v11 = (void *)*((_QWORD *)v19 + 5);
      if (v11)
        objc_msgSend(v11, "endSession");
      v8 = 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NFHardwareManager class not found on this platform, failing ACLogsTaskWithDir", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)intelligencePlatformTaskWithTimeout:(id)a3 withTimeout:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  id v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  void *v30;
  uint8_t v31[4];
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  if (objc_opt_class(GDXPCSysdiagnoseService, v7))
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = sub_1000072D0;
    v28 = sub_1000072E0;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100007868;
    v19[3] = &unk_1000689B8;
    v19[4] = self;
    v19[5] = buf;
    v19[6] = &v20;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v19, a4))
    {
      if (*((_BYTE *)v21 + 24))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("intelligence_platform_status.json")));
        v9 = (void *)*((_QWORD *)v25 + 5);
        v18 = 0;
        v10 = objc_msgSend(v9, "writeToFile:atomically:encoding:error:", v8, 0, 4, &v18);
        v11 = v18;
        if ((v10 & 1) != 0)
        {
          v30 = v8;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
        }
        else
        {
          v15 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v11, "localizedDescription"));
            *(_DWORD *)v31 = 138412546;
            v32 = v8;
            v33 = 2112;
            v34 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to write intelligence platform data to '%@' with error: %@", v31, 0x16u);

          }
          v12 = &__NSArray0__struct;
        }

        goto LABEL_19;
      }
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        v14 = "Intelligence platform SPI did not succeed";
        goto LABEL_13;
      }
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        v14 = "Intelligence platform SPI timed out";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v14, v31, 2u);
      }
    }
    v12 = &__NSArray0__struct;
LABEL_19:

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_20;
  }
  v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService class not found on this platform, failing intelligencePlatformTaskWithTimeout", buf, 2u);
  }

  v12 = &__NSArray0__struct;
LABEL_20:

  return v12;
}

- (BOOL)PersonalizationTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[8];
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007AEC;
  v12[3] = &unk_100068868;
  v12[4] = self;
  v14 = &v15;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PersonalizationPortrait.log")));
  v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v12, a4)&& *((_BYTE *)v16 + 24))
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Personalization SPI timed out or couldn't create the dest file", v11, 2u);
    }

    v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)batteryUITaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  _QWORD v12[4];
  NSObject *v13;
  SystemDiagnosticLogAgent *v14;
  uint64_t *v15;
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = v6;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (&_PLSysdiagnoseCopyBatteryUILogs)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007DF4;
    v12[3] = &unk_1000689E0;
    v15 = &v17;
    v13 = v6;
    v14 = self;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v12, a4)&& *((_BYTE *)v18 + 24))
    {
      v9 = 1;
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Battery UI logs timedout / resulted an error", buf, 2u);
      }

      v9 = 0;
    }
    v8 = v13;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PLSysdiagnoseCopyBatteryUILogs SPI not found", buf, 2u);
    }
    v9 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)proactiveInputPredictionsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[8];
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008054;
  v12[3] = &unk_100068868;
  v12[4] = self;
  v14 = &v15;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ProactiveInputPredictions.log")));
  v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v12, a4)&& *((_BYTE *)v16 + 24))
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ProactiveInputPredictions SPI timed out or couldn't create the dest file", v11, 2u);
    }

    v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)batteryHealthTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  unsigned int v10;
  NSObject *v11;
  int v12;
  _QWORD v14[5];
  NSObject *v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint8_t v21[4];
  unsigned int v22;
  __int16 v23;
  int v24;

  v6 = a3;
  v7 = v6;
  if (&_IOPSCopyPowerSourcesByTypePrecise)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000083C4;
    v14[3] = &unk_100068868;
    v14[4] = self;
    v16 = buf;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("BatteryHealth.log")));
    v15 = v8;
    v10 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v14, a4);
    if (v10 && v18[24])
    {
      v9 = 1;
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v18[24];
        *(_DWORD *)v21 = 67109376;
        v22 = v10;
        v23 = 1024;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IOKitPS SPI timed out (%d) or couldn't create the dest file (%d)", v21, 0xEu);
      }

      v9 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IOPSCopyPowerSourcesByTypePrecise SPI not found", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)timezoneTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000888C;
  v12[3] = &unk_1000687F8;
  v14 = &v15;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("tzDataVersion.log")));
  v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v12, a4)&& *((_BYTE *)v16 + 24))
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SPI timed out or couldn't create the dest file", v11, 2u);
    }

    v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)runningBoardTaskWithDir:(id)a3 withTimeout:(double)a4
{
  NSObject *v5;
  BOOL v6;
  NSObject *v8;
  _QWORD v10[4];
  NSObject *v11;
  uint8_t buf[16];

  if (&_RBSCaptureStateToFile)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008AA8;
    v10[3] = &unk_100068968;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("RunningBoard_state.log")));
    v11 = v5;
    v6 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v10, a4);
    if (!v6)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "RunningBoard SPI timed out or couldn't create the dest file", buf, 2u);
      }

    }
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3, a4));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RunningBoard SPI not found", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (int64_t)_logItemForType:(int)a3
{
  int64_t v3;

  v3 = 56;
  if (a3)
    v3 = 0;
  if (a3 == 1)
    return 79;
  else
    return v3;
}

- (BOOL)coreCaptureTaskWithDir:(id)a3 withTimeout:(double)a4 ofType:(int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  int64_t v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  SystemDiagnosticLogAgent *v20;
  id v21;
  uint8_t *v22;
  uint64_t *v23;
  int64_t v24;
  double v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t v38[4];
  void *v39;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  if (objc_opt_class(W5LogItemRequest, v9))
  {
    v10 = -[SystemDiagnosticLogAgent _logItemForType:](self, "_logItemForType:", v5);
    if (v10)
    {
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x3032000000;
      v35 = sub_1000072D0;
      v36 = sub_1000072E0;
      v37 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = sub_1000072D0;
      v30 = sub_1000072E0;
      v31 = 0;
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_100008DF4;
      v19 = &unk_100068A08;
      v24 = v10;
      v20 = self;
      v25 = a4;
      v21 = v8;
      v22 = buf;
      v23 = &v26;
      if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", &v16, a4))
      {
        if (*((_QWORD *)v33 + 5))
        {
          v11 = 1;
LABEL_17:

          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_18;
        }
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v16, v17, v18, v19, v20));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "localizedDescription"));
          *(_DWORD *)v38 = 138412290;
          v39 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreCapture SPI failed due to %@", v38, 0xCu);

        }
      }
      else
      {
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v16, v17, v18, v19, v20));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreCapture task timed out", v38, 2u);
        }
      }

      v11 = 0;
      goto LABEL_17;
    }
    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not a valid corecapture request type.", buf, 2u);
    }
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Wifi velocity SPI not found", buf, 2u);
    }
  }

  v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)unifiedAssetTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  if (objc_opt_class(UAFAssetSetManager, v7))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009174;
    v12[3] = &unk_100068868;
    v12[4] = self;
    v14 = &v15;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("unified_asset_manager.log")));
    v13 = v8;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v12, a4)&& *((_BYTE *)v16 + 24))
    {
      v9 = 1;
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000349D0();

      v9 = 0;
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000349A4();
    v9 = 0;
  }

  return v9;
}

- (BOOL)trialTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NSObject *v16;
  SystemDiagnosticLogAgent *v17;

  v6 = a3;
  if (objc_opt_class(TRIClient, v7))
  {
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10000938C;
    v15 = &unk_100068A30;
    v16 = v6;
    v17 = self;
    v8 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", &v12, a4);
    if (!v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v12, v13, v14, v15));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100034B54();

    }
    v10 = v16;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100034B28();
    v8 = 0;
  }

  return v8;
}

- (BOOL)_backgroundPowerTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  uint8_t *v17;
  double v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = v6;
  if (&_PLSysdiagnoseCopyLogs)
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000961C;
    v15[3] = &unk_100068A58;
    v18 = a4;
    v16 = v6;
    v17 = buf;
    v10 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v15, a4);
    if ((v10 & 1) == 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Background powerlogs timed out", v14, 2u);
      }

    }
    if (v20[24])
    {
      if (v10)
      {
LABEL_11:
        v9 = v20[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Background powerlogs did not succeed", v14, 2u);
      }

      if (v10)
        goto LABEL_11;
    }
    v9 = 0;
    goto LABEL_16;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Background powerlog SPI not found", buf, 2u);
  }

  v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)_powerTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  SystemDiagnosticLogAgent *v16;
  uint8_t *v17;
  double v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  -[SystemDiagnosticLogAgent _extendedPowerTaskForDir:](self, "_extendedPowerTaskForDir:", v6);
  if (&_PLSysdiagnoseCopyPowerlog)
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009878;
    v14[3] = &unk_100068A80;
    v18 = a4;
    v15 = v6;
    v16 = self;
    v17 = buf;
    v9 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v14, a4);
    if ((v9 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Power logs timed out", v13, 2u);
      }

    }
    if (v20[24])
    {
      if (v9)
      {
LABEL_11:
        v8 = v20[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Power logs did not succeed", v13, 2u);
      }

      if (v9)
        goto LABEL_11;
    }
    v8 = 0;
    goto LABEL_16;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PowerTask SPI not found", buf, 2u);
  }

  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)_extendedPowerTaskForDir:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = v4;
  if (&_PLSysdiagnoseCopyExtendedPersistenceLog)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009C04;
    v13[3] = &unk_1000687D0;
    v14 = v4;
    v15 = buf;
    v8 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v13, 5.0);
    if ((v8 & 1) == 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Powerlog Extended Persistence SPI timed out", v12, 2u);
      }

    }
    if (v17[24])
    {
      if (v8)
      {
LABEL_11:
        v7 = v17[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Powerlog Extended Persistence SPI response did not contain path key", v12, 2u);
      }

      if (v8)
        goto LABEL_11;
    }
    v7 = 0;
    goto LABEL_16;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Powerlog Extended Persistence SPI not found", buf, 2u);
  }

  v7 = 0;
LABEL_17:

  return v7;
}

- (id)excResourcePathsWithTimeout:(double)a3
{
  NSObject *v4;
  const char *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000072D0;
  v15 = sub_1000072E0;
  v16 = 0;
  if (!&_ExcResourceReportPaths)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "CoreDiagnostics SPI not available.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009DDC;
  v9[3] = &unk_100068AA8;
  v9[4] = &v11;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v9, a3)|| (v6 = (void *)v12[5]) == 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Failed to get paths for ExcResource logs.";
      goto LABEL_8;
    }
LABEL_9:

    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (id)_memoryExceptionsTaskWithTimeout:(double)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v8[8];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000072D0;
  v14 = sub_1000072E0;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009F3C;
  v9[3] = &unk_100068AA8;
  v9[4] = &v10;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v9, a3)|| (v4 = (void *)v11[5]) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to get ReportMemoryException logs.", v8, 2u);
    }

    v4 = (void *)v11[5];
  }
  v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (BOOL)_memoryExceptionsListLogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  id v7;
  unsigned int v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  unsigned int v21;
  __int16 v22;
  int v23;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A130;
  v13[3] = &unk_100068868;
  v13[4] = self;
  v15 = &v16;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ReportMemoryExceptionTool_listLogs.txt")));
  v14 = v7;
  v8 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v13, a4);
  if (v8 && *((_BYTE *)v17 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((unsigned __int8 *)v17 + 24);
      *(_DWORD *)buf = 67109376;
      v21 = v8;
      v22 = 1024;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RMECacheEnumerator getLogPathsSortedByTime timed out !(%d) or failed to create dest file !(%d)", buf, 0xEu);
    }

    v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)coreCaptureConfigTask:(double)a3
{
  xpc_object_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint8_t v17[8];
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t v31[4];
  void *v32;

  v5 = xpc_dictionary_create(0, 0, 0);
  if (objc_opt_class(W5Client, v6))
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = sub_1000072D0;
    v29 = sub_1000072E0;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1000072D0;
    v23 = sub_1000072E0;
    v24 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A698;
    v18[3] = &unk_100068AD0;
    v18[4] = self;
    v18[5] = buf;
    v18[6] = &v19;
    if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v18, a3))
    {
      v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreCaptureConfig task timed out", v31, 2u);
      }

      v12 = 0;
      goto LABEL_24;
    }
    if (!*((_QWORD *)v26 + 5))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "localizedDescription"));
        *(_DWORD *)v31 = 138412290;
        v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error querying Wifi Velocity configuration for peer due to %@. Assuming WiFiVelocity MegaProfile is not enabled", v31, 0xCu);

      }
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 0);
      goto LABEL_23;
    }
    v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100034BFC(v31, (uint64_t)objc_msgSend(*((id *)v26 + 5), "megaWiFiProfile"), v7);

    v8 = (void *)*((_QWORD *)v26 + 5);
    if (v8 && objc_msgSend(v8, "megaWiFiProfile") == (id)1)
    {
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 1);
      v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        v10 = "WiFiVelocity MegaProfile is enabled";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v17, 2u);
      }
    }
    else
    {
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 0);
      v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        v10 = "WiFiVelocity MegaProfile is not enabled";
        goto LABEL_18;
      }
    }

LABEL_23:
    v12 = v5;
LABEL_24:
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_25;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "WiFi Velocity SPI not found", buf, 2u);
  }

  v12 = 0;
LABEL_25:

  return v12;
}

- (BOOL)ASPToolGenericWithTimeout:(double)a3 forFile:(id)a4 andBlock:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  SystemDiagnosticLogAgent *v16;
  id v17;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000A880;
  v14[3] = &unk_100068AF8;
  v15 = a4;
  v16 = self;
  v17 = a5;
  v8 = v17;
  v9 = v15;
  v10 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v14, a3);
  if (!v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ASPTool task timed out", v13, 2u);
    }

  }
  return v10;
}

- (BOOL)ASPToolSnapshotForDir:(id)a3 withTimeout:(double)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("asptool_snapshot_timesensitive.log")));
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:](self, "ASPToolGenericWithTimeout:forFile:andBlock:", v6, &stru_100068B18, a4);

  return (char)self;
}

- (BOOL)ASPToolTaskForDir:(id)a3 withTimeout:(double)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("asptool_snapshot.log")));
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:](self, "ASPToolGenericWithTimeout:forFile:andBlock:", v6, &stru_100068B38, a4);

  return (char)self;
}

- (BOOL)FDRDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  _QWORD v17[6];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  NSObject *v25;
  _QWORD v26[2];

  v6 = a3;
  v7 = v6;
  if (&_ZhuGeCopyValue)
  {
    v26[0] = v6;
    v26[1] = CFSTR("FDRDiagnosticReport.plist");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v10));

    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = sub_1000072D0;
    v22 = sub_1000072E0;
    v23 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000AD30;
    v17[3] = &unk_1000687F8;
    v17[4] = self;
    v17[5] = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v17, a4))
    {
      v11 = (void *)*((_QWORD *)v19 + 5);
      if (v11)
      {
        v16 = 0;
        v12 = objc_msgSend(v11, "writeToURL:error:", v8, &v16);
        v13 = v16;
        if ((v12 & 1) != 0)
        {
          v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v24 = 138412290;
            v25 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FDRDiagnostic report generated successfully at %@", v24, 0xCu);
          }
          v9 = 1;
          goto LABEL_18;
        }
      }
      else
      {
        v13 = 0;
      }
      v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 138412290;
        v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not write FDRDiagnostic report: %@", v24, 0xCu);
      }
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ZhuGe SPI timed out", v24, 2u);
      }
      v13 = 0;
    }
    v9 = 0;
LABEL_18:

    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ZhuGe SPI not found", buf, 2u);
  }
  v9 = 0;
LABEL_19:

  return v9;
}

- (BOOL)coreRepairDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  id v17;
  _QWORD v18[6];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t v25[24];
  _QWORD v26[2];

  v6 = a3;
  if (&_CRGenerateRepairReport)
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = sub_1000072D0;
    v23 = sub_1000072E0;
    v24 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000B100;
    v18[3] = &unk_1000687D0;
    v18[4] = self;
    v18[5] = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v18, a4))
    {
      if (*((_QWORD *)v20 + 5))
      {
        v26[0] = v6;
        v26[1] = CFSTR("RepairReport.plist");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
        v10 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v9));

        v11 = (void *)*((_QWORD *)v20 + 5);
        v17 = 0;
        v8 = objc_msgSend(v11, "writeToURL:error:", v10, &v17);
        v12 = v17;
        v13 = v12;
        if ((v8 & 1) == 0)
        {
          if (v12)
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
          else
            v14 = CFSTR("nil");
          v15 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_100034C6C((uint64_t)-[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String"), v25, v15);

        }
        goto LABEL_20;
      }
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100034C40();
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100034CB0();
    }
    v8 = 0;
LABEL_20:

    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CoreRepair SPI not found", buf, 2u);
  }

  v8 = 0;
LABEL_21:

  return v8;
}

- (BOOL)tailspinInfoTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[8];
  _QWORD v19[4];
  NSObject *v20;
  SystemDiagnosticLogAgent *v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[2];

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (&_tailspin_config_copy_description)
    v9 = &_tailspin_config_create_with_current_state == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tailspin SPI not found", buf, 2u);
    }
    v10 = 0;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tailspin info task starting", buf, 2u);
    }

    v27[0] = v6;
    v27[1] = CFSTR("tailspin-info.txt");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v11));

    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v26 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000B4E8;
    v19[3] = &unk_100068868;
    v7 = v12;
    v21 = self;
    v22 = buf;
    v20 = v7;
    v13 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v19, a4);
    v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tailspin info task ending", v18, 2u);
    }

    if ((v13 & 1) == 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tailspin Info SPI timed out", v18, 2u);
      }

    }
    if (!v24[24])
    {
      v16 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Tailspin Info SPI failed to create dest file", v18, 2u);
      }

    }
    if (v13)
      v10 = v24[24] != 0;
    else
      v10 = 0;

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

- (BOOL)tailspinSaveSpiWrapperForReason:(id)a3 forPath:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  int v15;
  int v16;
  id v17;
  unsigned int v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v25;
  NSObject *v26;
  uint8_t v27[16];
  stat buf;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  int v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v10 = a3;
  v11 = a4;
  v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!&_tailspin_dump_output_with_options_sync)
  {
    if (v13)
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin SPI not found", (uint8_t *)&buf, 2u);
    }

LABEL_16:
    v20 = 0;
    goto LABEL_27;
  }
  if (v13)
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin save task starting", (uint8_t *)&buf, 2u);
  }

  v14 = objc_retainAutorelease(v11);
  v15 = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 2562, 420);
  if (v15 == -1)
  {
    v21 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100034D54();

    goto LABEL_16;
  }
  v16 = v15;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000B9C4;
  v29[3] = &unk_100068B60;
  v17 = v10;
  v33 = a5;
  v30 = v17;
  v31 = &v34;
  v32 = v16;
  v18 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v29, a6);
  v19 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Tailspin save task ending", (uint8_t *)&buf, 2u);
  }

  fsync(v16);
  if (v18)
  {
    if (*((_BYTE *)v35 + 24))
    {
      v20 = 1;
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      if (fstat(v16, &buf))
        v25 = 0;
      else
        v25 = buf.st_size == 0;
      v20 = !v25;
      if (v25)
      {
        v26 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removing empty tailspin-trace file", v27, 2u);
        }

        unlink((const char *)objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation"));
      }
    }
  }
  else
  {
    v20 = 0;
  }
  close(v16);
  if ((v18 & 1) == 0)
  {
    v22 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Tailspin Save No Symbolicate SPI timed out", (uint8_t *)&buf, 2u);
    }

  }
  if (!*((_BYTE *)v35 + 24))
  {
    v23 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Tailspin Save No Symbolicate SPI failed to create dest file", (uint8_t *)&buf, 2u);
    }

  }
  _Block_object_dispose(&v34, 8);
LABEL_27:

  return v20;
}

- (id)tailspinAugmentSpiWrapperForPath:(id)a3 withDestName:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6
{
  _BOOL8 v7;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  dispatch_queue_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  intptr_t v21;
  intptr_t v22;
  const std::__fs::filesystem::path *v23;
  id v24;
  const std::__fs::filesystem::path *v25;
  std::error_code *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  int v32;
  id v34;
  id v35;
  char *v36;
  _QWORD v37[5];
  NSObject *v38;
  _BYTE *v39;
  uint8_t v40[4];
  _BYTE v41[10];
  id v42;
  __int16 v43;
  char *v44;
  _QWORD v45[4];
  _QWORD v46[4];
  _BYTE buf[24];
  char v48;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (!&_tailspin_augment_output)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin augment SPI not found", buf, 2u);
    }
LABEL_12:

    v30 = v10;
    goto LABEL_18;
  }
  v10 = objc_retainAutorelease(v10);
  v13 = sub_100006D08((const char *)-[NSObject fileSystemRepresentation](v10, "fileSystemRepresentation"), 2);
  if ((_DWORD)v13 == -1)
  {
    v29 = *__error();
    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = -[NSObject fileSystemRepresentation](objc_retainAutorelease(v10), "fileSystemRepresentation");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = strerror(v29);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to open '%s' for augmenting with error: %s", buf, 0x16u);
    }
    goto LABEL_12;
  }
  v14 = v13;
  v15 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v48 = 0;
  v46[0] = &__kCFBooleanTrue;
  v45[0] = UnsafePointer;
  v45[1] = UnsafePointer;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v46[1] = v16;
  v46[2] = &__kCFBooleanTrue;
  v45[2] = UnsafePointer;
  v45[3] = UnsafePointer;
  v46[3] = &__kCFBooleanTrue;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4));

  v18 = dispatch_queue_create("com.apple.sysdiagnose.tailspin_augment_queue", 0);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000BF88;
  v37[3] = &unk_100068B88;
  v37[4] = self;
  v39 = buf;
  v19 = v15;
  v38 = v19;
  tailspin_augment_output(v14, v17, v18, v37);
  v20 = dispatch_time(0, (uint64_t)(a6 * 1000000000.0));
  v21 = dispatch_semaphore_wait(v19, v20);
  v22 = v21;
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24) || v21)
  {
    v28 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v40 = 67109376;
      *(_DWORD *)v41 = v22 != 0;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Tailspin augment task timed out (!%d) or failed (!%d)", v40, 0xEu);
    }
  }
  else
  {
    v10 = objc_retainAutorelease(v10);
    v23 = (const std::__fs::filesystem::path *)-[NSObject fileSystemRepresentation](v10, "fileSystemRepresentation");
    v24 = objc_retainAutorelease(v11);
    v25 = (const std::__fs::filesystem::path *)objc_msgSend(v24, "fileSystemRepresentation");
    rename(v23, v25, v26);
    if (v27 == -1)
    {
      v32 = *__error();
      v28 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_retainAutorelease(v10);
        v34 = -[NSObject fileSystemRepresentation](v10, "fileSystemRepresentation");
        v35 = objc_msgSend(objc_retainAutorelease(v24), "fileSystemRepresentation");
        v36 = strerror(v32);
        *(_DWORD *)v40 = 136315650;
        *(_QWORD *)v41 = v34;
        *(_WORD *)&v41[8] = 2080;
        v42 = v35;
        v43 = 2080;
        v44 = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to rename %s -> %s: %s", v40, 0x20u);
      }
    }
    else
    {
      v28 = v10;
      v10 = v24;
    }
  }

  v30 = v10;
  _Block_object_dispose(buf, 8);

LABEL_18:
  return v30;
}

- (BOOL)tailspinSaveNoSymbolicateTSTaskWithDir:(id)a3 withTimeout:(double)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("tailspin-trace.tailspin")));
  LOBYTE(self) = -[SystemDiagnosticLogAgent tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:](self, "tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:", CFSTR("sysdiagnose"), v6, 1, a4);

  return (char)self;
}

- (id)tailspinAugmentTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("tailspin-trace-unsymbolicated.tailspin")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("tailspin-trace.tailspin")));

  v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tailspin augment task starting", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:](self, "tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:", v7, v8, 1, a4));
  v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tailspin save task ending", v13, 2u);
  }

  return v10;
}

- (id)tailspinKeychordTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  char v12[1024];

  v6 = a3;
  sub_1000066A4(v12, 0x400uLL, "tailspin", "no-symbols", "tailspin");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

  if (!v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100034DD0();
    v8 = 0;
    goto LABEL_7;
  }
  if (-[SystemDiagnosticLogAgent tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:](self, "tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:", CFSTR("tailspin keychord"), v8, 0, a4))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-no-symbols"), &stru_100069C58));
    v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:](self, "tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:", v8, v9, 0, a4));

    v8 = (void *)v10;
LABEL_7:

  }
  return v8;
}

- (BOOL)ASPMagazineTaskForDir:(id)a3 withTimeout:(double)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("asptool_magazine_stats.log")));
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:](self, "ASPToolGenericWithTimeout:forFile:andBlock:", v6, &stru_100068BA8, a4);

  return (char)self;
}

- (BOOL)_libNotifyTaskAtLocation:(id)a3 andTimeout:(double)a4
{
  id v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C454;
  v8[3] = &unk_100068968;
  v9 = a3;
  v5 = v9;
  v6 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v8, a4);

  return v6;
}

- (BOOL)setUserMode
{
  passwd *v3;
  passwd *v4;
  uid_t pw_uid;
  gid_t pw_gid;
  int v7;
  int v8;
  NSObject *v9;

  v3 = getpwnam((const char *)objc_msgSend(CFSTR("mobile"), "UTF8String"));
  if (v3)
  {
    v4 = v3;
    pw_uid = v3->pw_uid;
    pw_gid = v4->pw_gid;
  }
  else
  {
    pw_uid = 501;
    pw_gid = 501;
  }
  v7 = pthread_setugid_np(pw_uid, pw_gid);
  if (v7 == -1)
  {
    v8 = *__error();
    v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100034E50(v8);

  }
  return v7 != -1;
}

- (BOOL)setRootMode
{
  uint64_t v3;
  _OWORD v4[5];

  if (pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B) == -1)
    sub_100034EC0(&v3, v4);
  return 1;
}

- (id)getPreferencesForDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  const __CFArray *v9;
  __CFString *v10;
  const __CFString *v11;
  CFDictionaryRef v12;
  CFTypeID v13;
  void *v14;
  NSObject *v15;
  int v17;
  __CFString *v18;
  __int16 v19;
  const __CFArray *v20;

  v5 = a5;
  v8 = (__CFString *)a3;
  v9 = (const __CFArray *)a4;
  if (v5)
  {
    v10 = CFSTR("mobile");
    getpwnam((const char *)objc_msgSend(CFSTR("mobile"), "UTF8String"));
  }
  else
  {
    v10 = (id)kCFPreferencesCurrentUser;
  }
  if (v8)
    v11 = v8;
  else
    v11 = kCFPreferencesAnyApplication;
  v12 = CFPreferencesCopyMultiple(v9, v11, v10, kCFPreferencesAnyHost);
  v13 = CFGetTypeID(v12);
  if (v13 == CFDictionaryGetTypeID())
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to get preferences: Domain: %@, keys: %@.", (uint8_t *)&v17, 0x16u);
    }

    v14 = &__NSDictionary0__struct;
  }
  CFRelease(v12);

  return v14;
}

- (id)getPreferencesForDomain:(id)a3 withKey:(id)a4 andNestedKeys:(id)a5 currentUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;

  v6 = a6;
  v10 = a5;
  v27 = a4;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent getPreferencesForDomain:withKeys:currentUser:](self, "getPreferencesForDomain:withKeys:currentUser:", v12, v13, v6));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v11));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10000C898;
  v24 = &unk_100068BD0;
  v25 = v10;
  v26 = v15;
  v17 = v15;
  v18 = v10;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v21);

  v19 = objc_msgSend(v17, "copy", v21, v22, v23, v24);
  return v19;
}

- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  uint8_t v21[16];
  id v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v22 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v14 = v11;
  }
  else
  {
    v13 = 0;
    v14 = v10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent getPreferencesForDomain:withKeys:currentUser:](self, "getPreferencesForDomain:withKeys:currentUser:", v10, v13, v6));
  if (v6)
    v16 = CFSTR("_CurrentUser.txt");
  else
    v16 = CFSTR("_Global.txt");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
  v19 = sub_100006A18(v12, (uint64_t)v17, v18);

  if ((v19 & 1) == 0)
  {
    v20 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unable to create file to write preferences", v21, 2u);
    }

  }
}

- (BOOL)getPreferences:(id)a3 withTimeout:(double)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];
  _QWORD v11[5];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000CB7C;
  v11[3] = &unk_100068A30;
  v11[4] = self;
  v12 = a3;
  v6 = v12;
  v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v11, a4);
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferences did not return in time.", v10, 2u);
    }

  }
  return v7;
}

- (BOOL)osEligibilityDumpToDir:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;
  SystemDiagnosticLogAgent *v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = v6;
  if (&_os_eligibility_dump_sysdiagnose_data_to_dir)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000CE88;
    v13[3] = &unk_100068BF8;
    v14 = v6;
    v15 = self;
    v16 = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v13, a4))
    {
      v9 = v18[24] != 0;
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os eligibility task timed out", v12, 2u);
      }

      v9 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "os eligibility SPI not found", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)getPreferencesInternal:(id)a3 withTimeout:(double)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];
  _QWORD v11[5];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000CFEC;
  v11[3] = &unk_100068A30;
  v11[4] = self;
  v12 = a3;
  v6 = v12;
  v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v11, a4);
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferences did not return in time.", v10, 2u);
    }

  }
  return v7;
}

- (BOOL)getCloudKitPreferences:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  char v10;
  BOOL v11;
  NSObject *v12;
  const char *v13;
  uint8_t v15[16];
  _QWORD v16[5];
  __CFString *v17;
  __CFString *v18;
  _UNKNOWN **v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000072D0;
  v32 = sub_1000072E0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1000072D0;
  v26 = sub_1000072E0;
  v27 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D25C;
  v16[3] = &unk_100068C20;
  v16[4] = self;
  v17 = CFSTR("com.apple.CloudKit");
  v18 = CFSTR("BehaviorOptions");
  v19 = &off_10006A990;
  v20 = &v28;
  v21 = &v22;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v16, a4))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v13 = "Couldn't retrieve the preferences within the required time";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v15, 2u);
    }
LABEL_9:

    v11 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29[5], "description"));
  v8 = sub_100006A18(v6, (uint64_t)CFSTR("CloudKit_SelectBehaviorOptions_Global.txt"), v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "description"));
  v10 = v8 & sub_100006A18(v6, (uint64_t)CFSTR("CloudKit_SelectBehaviorOptions_CurrentUser.txt"), v9);

  if ((v10 & 1) == 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v13 = "Couldn't write CloudKit preferences";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

+ (BOOL)_runDispatchBlock:(id)a3 withTimeout:(double)a4 onQueue:(id)a5
{
  id v7;
  dispatch_time_t v8;
  BOOL v9;
  uint8_t v11[16];

  v7 = a3;
  dispatch_async((dispatch_queue_t)a5, v7);
  if (a4 == -1.0)
  {
    v8 = -1;
LABEL_5:
    v9 = dispatch_block_wait(v7, v8) == 0;
    goto LABEL_6;
  }
  if (a4 > 0.0)
  {
    v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    goto LABEL_5;
  }
  v9 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown value for timeout specified. Returning", v11, 2u);
    v9 = 0;
  }
LABEL_6:

  return v9;
}

+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4
{
  id v6;
  dispatch_block_t v7;
  dispatch_queue_global_t global_queue;
  void *v9;
  _QWORD block[4];
  id v12;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D470;
  block[3] = &unk_100068C48;
  v12 = a3;
  v6 = v12;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  LOBYTE(a1) = objc_msgSend(a1, "_runDispatchBlock:withTimeout:onQueue:", v7, v9, a4);

  return (char)a1;
}

- (BOOL)_runBlockForCurrentUser:(id)a3 withTimeout:(double)a4
{
  id v6;
  dispatch_queue_t v7;
  id v8;
  dispatch_block_t v9;
  uint64_t v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SystemDiagnosticLogAgent *v17;
  id v18;

  v6 = a3;
  v7 = dispatch_queue_create("com.apple.sysdiagnose_helper.userModeQueue", 0);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10000D54C;
  v16 = &unk_100068C70;
  v17 = self;
  v18 = v6;
  v8 = v6;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v13);
  v11 = (void *)objc_opt_class(self, v10);
  LOBYTE(self) = objc_msgSend(v11, "_runDispatchBlock:withTimeout:onQueue:", v9, v7, a4, v13, v14, v15, v16, v17);

  return (char)self;
}

+ (id)stringForReqType:(int)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = sub_100005FC8(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" ")));
  else
    v6 = CFSTR("<UNKNOWN>");

  return v6;
}

- (BOOL)parseLogAgentRequest:(id)a3 outputPath:(id *)a4 timeout:(double *)a5 taskType:(int *)a6 startTimeClockNS:(int64_t *)a7
{
  id v12;
  int64_t int64;
  void *v14;
  double v15;
  char *string;
  int64_t v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;

  v12 = a3;
  int64 = xpc_dictionary_get_int64(v12, "taskType");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticLogAgent stringForReqType:](SystemDiagnosticLogAgent, "stringForReqType:", int64));
  v15 = xpc_dictionary_get_double(v12, "taskTimeout");
  string = (char *)xpc_dictionary_get_string(v12, "taskOutputDir");
  if (string || xpc_dictionary_get_BOOL(v12, "taskNoOutputDir"))
  {
    v17 = xpc_dictionary_get_int64(v12, "startTimeClockNS");
    if (!v17)
    {
      v23 = v14;
      v18 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sysdiagnose_agent: No sysdiagnoseStartTimeClockNS provided)", buf, 2u);
      }

      v14 = v23;
    }
    v19 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sysdiagnose_agent: Received message with task type: %@", buf, 0xCu);
    }

    if (string)
      string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    if (a4)
      *a4 = objc_retainAutorelease(string);
    if (a5)
      *a5 = v15;
    if (a6)
      *a6 = int64;
    if (a7)
      *a7 = v17;
    v20 = 1;
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      v26 = 2080;
      v27 = "taskNoOutputDir";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "sysdiagnose_agent: No output dir for task type %@, without %s being set", buf, 0x16u);
    }

    v20 = 0;
    string = 0;
  }

  return v20;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSerialQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
