@implementation MIBUDeviceController

- (MIBUDeviceController)init
{
  MIBUDeviceController *v2;
  MIBUDeviceController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceController;
  v2 = -[MIBUDeviceController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MIBUDeviceController setBatteryLimitToken:](v2, "setBatteryLimitToken:", 0);
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1000688E8 != -1)
    dispatch_once(&qword_1000688E8, &stru_100056E10);
  return (id)qword_1000688E0;
}

- (BOOL)isIPad
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 3;
}

- (BOOL)isInBoxUpdateMode
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  unsigned int v8;
  unsigned __int8 v9;
  unsigned int v10;
  char v11;
  _DWORD v13[2];

  if (os_variant_has_internal_content("com.apple.inboxupdaterd")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance")),
        v4 = objc_msgSend(v3, "inBoxUpdateMode"),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v6 = objc_msgSend(v5, "inBoxUpdateMode");

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056E30);
    v7 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Overriding InBoxUpdateMode = %d", (uint8_t *)v13, 8u);
    }
  }
  else
  {
    v8 = +[MIBUCertHelper SUCertPresent](MIBUCertHelper, "SUCertPresent");
    v9 = -[MIBUDeviceController isActivated:](self, "isActivated:", 0);
    if (-[MIBUDeviceController isOnLockScreen](self, "isOnLockScreen"))
      v10 = !-[MIBUDeviceController isInitialBuddySetupComplete](self, "isInitialBuddySetupComplete");
    else
      LOBYTE(v10) = 0;
    v11 = v10 & (v9 ^ 1);
    if (v8)
      LOBYTE(v6) = v11;
    else
      LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isInDiagnosticMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDefaultPreferences objectForKey:](MIBUDefaultPreferences, "objectForKey:", CFSTR("CurrentOperation")));
  v3 = objc_msgSend(v2, "integerValue") == (id)2;

  return v3;
}

- (BOOL)isActivated:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  unsigned int v16;

  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isActivated"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "isActivated"));
      v8 = objc_msgSend(v7, "BOOLValue");

      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100056E50);
      v9 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overrding isActivated = %d", buf, 8u);
      }
      v10 = 0;
      v11 = 0;
      if (!a3)
        goto LABEL_12;
LABEL_11:
      *a3 = objc_retainAutorelease(v11);
      goto LABEL_12;
    }
  }
  v14 = 0;
  v10 = (void *)MAEGetActivationStateWithError(&v14);
  v11 = v14;
  if (!v11)
  {
    LOBYTE(v8) = objc_msgSend(v10, "isEqualToString:", kMAActivationStateActivated);
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056E70);
  v13 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003C694((uint64_t)v11, v13);
  LOBYTE(v8) = 0;
  if (a3)
    goto LABEL_11;
LABEL_12:

  return v8;
}

- (BOOL)isInitialBuddySetupComplete
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL result;
  _DWORD v8[2];

  if (os_variant_has_internal_content("com.apple.inboxupdaterd")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "initialBuddySetupComplete")),
        v3,
        v2,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "initialBuddySetupComplete"));
    byte_1000688F0 = objc_msgSend(v5, "BOOLValue");

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056E90);
    v6 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = byte_1000688F0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Overrding InitialBuddySetupComplete = %d", (uint8_t *)v8, 8u);
    }
    return byte_1000688F0 != 0;
  }
  else
  {
    result = BYSetupAssistantHasCompletedInitialRun();
    byte_1000688F0 = result;
  }
  return result;
}

- (BOOL)isOnLockScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  __int16 v12;
  uint8_t buf[4];
  unsigned int v14;

  v12 = 0;
  if (os_variant_has_internal_content("com.apple.inboxupdaterd")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isOnLockScreen")),
        v4,
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "isOnLockScreen"));
    v7 = objc_msgSend(v6, "BOOLValue");

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056EB0);
    v8 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Overrding OnLockScreen = %d", buf, 8u);
    }
  }
  else if (-[MIBUDeviceController isInDiagnosticMode](self, "isInDiagnosticMode"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056ED0);
    v9 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Diagnostic mode detected. Skipping lock screen check", buf, 2u);
    }
    LOBYTE(v7) = 1;
  }
  else
  {
    v10 = SBSSpringBoardBlockableServerPort();
    SBGetScreenLockStatus(v10, (char *)&v12 + 1, &v12);
    LOBYTE(v7) = HIBYTE(v12) != 0;
  }
  return v7;
}

- (BOOL)setSystemTime:(int64_t)a3
{
  NSObject *v4;
  timeval v6;
  time_t v7;
  uint8_t buf[4];
  time_t v9;
  __int16 v10;
  int64_t v11;

  *(_QWORD *)&v6.tv_usec = 0;
  v7 = 0;
  v6.tv_sec = a3;
  time(&v7);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056EF0);
  v4 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current system time is %lu; setting system time to %lu",
      buf,
      0x16u);
  }
  return settimeofday(&v6, 0) == 0;
}

- (BOOL)removePowerLog
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];

  v25 = 1;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056F10);
  v2 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing power log from device ...", buf, 2u);
  }
  v3 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.powerlog", &v25);
  v4 = v25;
  if (v25 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12)));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v20 = v13;
          v16 = objc_msgSend(v15, "removeItemAtPath:error:", v14, &v20);
          v10 = v20;

          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100056F50);
          v17 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v27 = (uint64_t)v14;
            v28 = 1024;
            v29 = v16;
            v30 = 2114;
            v31 = v10;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Power log: %{public}@ removed: %{BOOL}d with error: %{public}@", buf, 0x1Cu);
          }

          v12 = (char *)v12 + 1;
          v13 = v10;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
      }
      while (v9);

      v4 = 1;
    }

  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056F30);
    v19 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v25;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to locate power log path, error: %llu", buf, 0xCu);
    }
  }
  return v4 == 1;
}

- (id)getBatteryLevel
{
  double v2;
  int v4;

  v4 = 100;
  if (IOPSGetPercentRemaining(&v4, 0, 0))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056F70);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C704();
    v4 = -1;
    v2 = -1.0;
  }
  else
  {
    v2 = (double)v4;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v2));
}

- (void)setShelfLifeMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t *v9;
  id v10;
  uint8_t v11[2];
  __int16 v12;
  uint8_t buf[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056F90);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting Device to Shelf Life Mode ...", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _smcHelper](self, "_smcHelper"));
  if (v4)
  {
    if (-[MIBUDeviceController _isD5x](self, "_isD5x"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100056FD0);
      v8 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v9 = (uint8_t *)&v12;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not enabling SLM; hardware supports older variant",
          v9,
          2u);
      }
    }
    else
    {
      if (!-[MIBUDeviceController _isN104](self, "_isN104"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _dataFromInt8:](self, "_dataFromInt8:", 1));
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _dataFromInt8:](self, "_dataFromInt8:", 2));
        v10 = 0;
        -[MIBUDeviceController _writeSMCKey:withData:usingHelper:andReadInterval:andReadbackData:error:](self, "_writeSMCKey:withData:usingHelper:andReadInterval:andReadbackData:error:", CFSTR("BCSL"), v5, v4, 0, v6, &v10);
        v7 = v10;

        goto LABEL_9;
      }
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100056FF0);
      v8 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        v9 = v11;
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056FB0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C764();
  }
LABEL_9:

}

- (void)enableCarrierMode
{
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057010);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Limiting battery charge levels...", buf, 2u);
  }
  v4 = 0;
  if (IOPSLimitBatteryLevelRegister(&v4))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057030);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C7F0();
  }
  else
  {
    -[MIBUDeviceController setBatteryLimitToken:](self, "setBatteryLimitToken:", v4);
    if (IOPSLimitBatteryLevel(v4, 80, 3, CFSTR("MIBU Carrier mode")))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057050);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003C790();
    }
  }
}

- (void)disableCarrierMode
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057070);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling Battery charge levels ...", v4, 2u);
  }
  if (-[MIBUDeviceController batteryLimitToken](self, "batteryLimitToken"))
  {
    if (IOPSLimitBatteryLevelCancel(-[MIBUDeviceController batteryLimitToken](self, "batteryLimitToken")))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057090);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003C87C();
    }
    else
    {
      -[MIBUDeviceController setBatteryLimitToken:](self, "setBatteryLimitToken:", 0);
    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000570B0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C850();
  }
}

- (void)shutdown
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000570D0);
  v2 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Shutting down...", v5, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
  v4 = objc_msgSend(objc_alloc((Class)FBSShutdownOptions), "initWithReason:", CFSTR("Shutting down device from inboxupdaterd."));
  objc_msgSend(v3, "shutdownWithOptions:", v4);

}

- (id)thermalDetails
{
  NSMutableDictionary *v3;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[8];
  _QWORD v14[8];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = -[MIBUDeviceController _thermalPressureLevel](self, "_thermalPressureLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _batteryVirtualTemperature](self, "_batteryVirtualTemperature"));
  if (-[MIBUDeviceController _isD5x](self, "_isD5x") || -[MIBUDeviceController _isN104](self, "_isN104"))
  {
    v11[0] = CFSTR("TSRM/TVRM");
    v11[1] = CFSTR("TSRR/TVRR");
    v12[0] = &off_10005C130;
    v12[1] = &off_10005C148;
    v11[2] = CFSTR("TSBE/TVBE");
    v11[3] = CFSTR("TSBQ/TVBQ");
    v12[2] = &off_10005C160;
    v12[3] = &off_10005C178;
    v11[4] = CFSTR("TSBR/TVBR");
    v11[5] = CFSTR("TSLR/TVRH");
    v12[4] = &off_10005C190;
    v12[5] = &off_10005C1A8;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 6));
    v7 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _dictFromTmpSensorKeyMapping:](self, "_dictFromTmpSensorKeyMapping:", v6));
  }
  else
  {
    v13[0] = CFSTR("TSRM/TVRM");
    v13[1] = CFSTR("TSRR/TVRR");
    v14[0] = CFSTR("TVRM");
    v14[1] = CFSTR("TVRR");
    v13[2] = CFSTR("TVRQ");
    v13[3] = CFSTR("TSBE/TVBE");
    v14[2] = CFSTR("TVRQ");
    v14[3] = CFSTR("TVBE");
    v13[4] = CFSTR("TSBQ/TVBQ");
    v13[5] = CFSTR("TSBR/TVBR");
    v14[4] = CFSTR("TVBQ");
    v14[5] = CFSTR("TVBR");
    v13[6] = CFSTR("TSLR/TVRH");
    v13[7] = CFSTR("TG0V");
    v14[6] = CFSTR("TVRH");
    v14[7] = CFSTR("TG0V");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 8));
    v7 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _dictFromSMCKeyMapping:](self, "_dictFromSMCKeyMapping:", v6));
  }
  v8 = (void *)v7;

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("TG0V"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("ThermalPressure"));

  }
  return v8;
}

- (id)batteryDetails
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("WARP");
  v6[1] = CFSTR("WAVR");
  v7[0] = CFSTR("WARP");
  v7[1] = CFSTR("WAVR");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _dictFromSMCKeyMapping:](self, "_dictFromSMCKeyMapping:", v3));

  return v4;
}

- (id)osVersion
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopySupplementalVersionDictionary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", _kCFSystemVersionShortVersionStringKey));

  return v3;
}

- (id)buildVersion
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopySupplementalVersionDictionary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", _kCFSystemVersionBuildVersionKey));

  return v3;
}

- (id)_smcHelper
{
  MIBUDeviceController *v2;
  MIBUSMCHelper *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  if (!qword_1000688F8)
  {
    v3 = objc_alloc_init(MIBUSMCHelper);
    v4 = (void *)qword_1000688F8;
    qword_1000688F8 = (uint64_t)v3;

    v9 = 0;
    objc_msgSend((id)qword_1000688F8, "openAppleSMC:", &v9);
    v5 = v9;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000570F0);
    v6 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SMC Helper opened with error: %{public}@", buf, 0xCu);
    }
    if (v5)
    {
      v7 = (void *)qword_1000688F8;
      qword_1000688F8 = 0;

    }
  }
  objc_sync_exit(v2);

  return (id)qword_1000688F8;
}

- (BOOL)_isD5x
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType(self, a2);
  if (v3 > 3885279869)
  {
    if (v3 == 3885279870)
      return v2;
    v4 = 4201643249;
  }
  else
  {
    if (v3 == 1169082144)
      return v2;
    v4 = 3001488778;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (BOOL)_isN104
{
  return MGGetProductType(self, a2) == 2080700391;
}

- (id)_dataFromInt32:(unsigned int)a3
{
  unsigned int v4;

  v4 = a3;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 4));
}

- (id)_dataFromInt8:(unsigned __int8)a3
{
  unsigned __int8 v4;

  v4 = a3;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 1));
}

- (void)_writeSMCKey:(id)a3 withData:(id)a4 usingHelper:(id)a5 andReadInterval:(id)a6 andReadbackData:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  unsigned int v27;
  int v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  _QWORD v48[3];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (objc_msgSend(v15, "isKeySupported:", v13))
  {
    v42 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "readSMCKey:error:", v13, &v42));
    v19 = v42;
    v20 = v19;
    if (v18 && !v19)
    {
      v21 = 1;
      while (1)
      {

        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100057130);
        v22 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v44 = v14;
          v45 = 2114;
          v46 = v13;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Writing %{public}@ to SMC key %{public}@", buf, 0x16u);
        }
        v41 = 0;
        objc_msgSend(v15, "writeSMCKey:data:error:", v13, v14, &v41);
        v23 = v41;
        if (v23)
        {
          v20 = v23;
          v28 = v21;
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057150);
          v35 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v44 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to write to SMC key %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (!v17)
          {
            v20 = 0;
            goto LABEL_45;
          }
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057170);
          v24 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reading back SMC key value to verify...", buf, 2u);
          }
          if (v16)
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_100057190);
            v25 = (void *)qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
            {
              v26 = v25;
              v27 = objc_msgSend(v16, "unsignedIntValue");
              *(_DWORD *)buf = 67109120;
              LODWORD(v44) = v27;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Waiting for %ds before reading back the value to verify...", buf, 8u);

            }
            sleep(objc_msgSend(v16, "unsignedIntValue"));
          }
          v28 = v21;
          v40 = 0;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "readSMCKey:error:", v13, &v40));
          v20 = v40;

          if (!v29 || v20)
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_1000571B0);
            v36 = qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v44 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to write to SMC key %{public}@", buf, 0xCu);
            }
          }
          else
          {
            if ((objc_msgSend(v29, "isEqualToData:", v17) & 1) != 0)
            {
              v20 = 0;
              v18 = v29;
              goto LABEL_45;
            }
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_1000571D0);
            v30 = qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v44 = v13;
              v45 = 2114;
              v46 = v29;
              v47 = 2114;
              v48[0] = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SMC key %{public}@ : %{public}@ does not have expected val: %{public}@", buf, 0x20u);
            }
            v39 = 0;
            sub_10000D680(&v39, 2684354564, 0, CFSTR("SMC key %@ : %@ does not have expected val: %@"), v31, v32, v33, v34, (uint64_t)v13);
            v20 = v39;
          }
          v18 = v29;
        }
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000571F0);
        v37 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v44 = v13;
          v45 = 2114;
          v46 = v20;
          v47 = 1024;
          LODWORD(v48[0]) = v28;
          WORD2(v48[0]) = 1024;
          *(_DWORD *)((char *)v48 + 6) = 3;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to write SMC key %{public}@ with error: %{public}@, attempt %d/%d; retrying...",
            buf,
            0x22u);
        }
        v21 = v28 + 1;
        if (v28 == 3)
          goto LABEL_45;
      }
    }
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057110);
    v38 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C8DC((uint64_t)v13, (uint64_t)v20, v38);
  }
  else
  {
    v20 = 0;
    v18 = 0;
  }
LABEL_45:
  if (a8)
    *a8 = objc_retainAutorelease(v20);

}

- (int64_t)_thermalPressureLevel
{
  uint64_t v3;
  int out_token;

  out_token = 0;
  v3 = 0;
  if (notify_register_check(kOSThermalNotificationPressureLevelName, &out_token))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057210);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003CA1C();
  }
  else if (notify_get_state(out_token, &v3))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057230);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C9BC();
  }
  else
  {
    if (!notify_cancel(out_token))
      return v3;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057250);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C95C();
  }
  return -1;
}

- (id)_batteryVirtualTemperature
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _smcHelper](self, "_smcHelper"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readSMCKey:error:", CFSTR("TG0V"), 0));
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057270);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C764();
    v4 = 0;
  }

  return v4;
}

- (id)_dictFromSMCKeyMapping:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceController _smcHelper](self, "_smcHelper"));
  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v12, v17));
          if (objc_msgSend(v6, "isKeySupported:", v13))
          {
            v18 = 0;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readSMCKey:error:", v13, &v18));
            v15 = v18;
            if (v14)
              -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v12);
          }
          else
          {
            v14 = 0;
            v15 = 0;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v4 = v17;
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057290);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C764();
  }

  return v5;
}

- (id)_dictFromTmpSensorKeyMapping:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  void *v16;
  NSMutableDictionary *v18;
  int v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v18 = objc_opt_new(NSMutableDictionary);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v9));
        v11 = objc_msgSend(v10, "unsignedIntValue");

        v20 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTempSensorHelper readKey:error:](MIBUTempSensorHelper, "readKey:error:", v11, &v20));
        v13 = v20;
        if (v12)
        {
          v19 = 0;
          objc_msgSend(v12, "floatValue");
          v19 = v14;
          v15 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v19, 4));
          if (v15)
          {
            v16 = (void *)v15;
            -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v15, v9);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  return v18;
}

- (__CFString)batteryLimitToken
{
  return self->_batteryLimitToken;
}

- (void)setBatteryLimitToken:(__CFString *)a3
{
  self->_batteryLimitToken = a3;
}

@end
