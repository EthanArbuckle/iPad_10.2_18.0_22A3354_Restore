@implementation SystemDiagnosticBT

+ (id)sharedInstance
{
  if (qword_1000B9730 != -1)
    dispatch_once(&qword_1000B9730, &stru_100098F60);
  return (id)qword_1000B9728;
}

- (SystemDiagnosticBT)init
{
  SystemDiagnosticBT *v2;
  SystemDiagnosticBT *v3;
  os_log_t v4;
  OS_os_log *accessoryLogSubsystem;
  OS_dispatch_group *airpodsGroup;
  dispatch_queue_t v7;
  OS_dispatch_queue *bluetoothQueue;
  OS_dispatch_group *exposureNotificationGroup;
  NSURL *exposureNotificationDBURL;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SystemDiagnosticBT;
  v2 = -[SystemDiagnosticBT init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_shouldGatherBTLogs = 1;
    v4 = os_log_create("com.apple.sysdiagnose", "bluetooth");
    accessoryLogSubsystem = v3->_accessoryLogSubsystem;
    v3->_accessoryLogSubsystem = (OS_os_log *)v4;

    airpodsGroup = v3->_airpodsGroup;
    v3->_airpodsGroup = 0;

    v3->_defaultAirpodTimeout = 0;
    v7 = dispatch_queue_create("com.apple.sysdiagnose.bluetooth", 0);
    bluetoothQueue = v3->_bluetoothQueue;
    v3->_bluetoothQueue = (OS_dispatch_queue *)v7;

    v3->_numAttachTries = 0;
    exposureNotificationGroup = v3->_exposureNotificationGroup;
    v3->_exposureNotificationGroup = 0;

    exposureNotificationDBURL = v3->_exposureNotificationDBURL;
    v3->_exposureNotificationDBURL = 0;

  }
  return v3;
}

- (void)attachToBTSession
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD block[5];
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = sub_10000A130;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT diagnosticID](self, "diagnosticID")));
  v4 = BTSessionAttachWithQueue(objc_msgSend(v3, "UTF8String"), &v10, 0, self->_bluetoothQueue);

  -[SystemDiagnosticBT setNumAttachTries:](self, "setNumAttachTries:", -[SystemDiagnosticBT numAttachTries](self, "numAttachTries") + 1);
  v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10005E1F0();

    v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000796C;
    block[3] = &unk_100098F88;
    block[4] = self;
    dispatch_sync(v7, block);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully attached to bluetoothd, waiting for session callback.", v8, 2u);
    }

    -[SystemDiagnosticBT setAttachedToBTSession:](self, "setAttachedToBTSession:", 1);
  }
}

- (void)startBTSession:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007A6C;
  v6[3] = &unk_100098FB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (!*((_BYTE *)v8 + 24) && !-[SystemDiagnosticBT attachedToBTSession](self, "attachedToBTSession"))
  {
    -[SystemDiagnosticBT setNumAttachTries:](self, "setNumAttachTries:", 0);
    -[SystemDiagnosticBT setDiagnosticID:](self, "setDiagnosticID:", v4);
    -[SystemDiagnosticBT attachToBTSession](self, "attachToBTSession");
  }
  _Block_object_dispose(&v7, 8);

}

- (void)startBTSessionAndTriggerExposureNotificationLogs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_group_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  if (qword_1000B9740 != -1)
    dispatch_once(&qword_1000B9740, &stru_100099020);
  if ((byte_1000B9738 & 1) != 0)
  {
    if (-[SystemDiagnosticBT shouldGatherBTLogs](self, "shouldGatherBTLogs"))
    {
      v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Querying bluetooth if ExposureNotification is supported, and collect db if so.", buf, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Querying bluetooth if ExposureNotification is supported, and collect db if so."));

      -[SystemDiagnosticBT setExposureNotificationDBURL:](self, "setExposureNotificationDBURL:", 0);
      v7 = dispatch_group_create();
      -[SystemDiagnosticBT setExposureNotificationGroup:](self, "setExposureNotificationGroup:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationGroup](self, "exposureNotificationGroup"));
      if (v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationGroup](self, "exposureNotificationGroup"));
        dispatch_group_enter(v9);

      }
      *(_QWORD *)buf = 0;
      v15 = buf;
      v16 = 0x2020000000;
      v17 = 0;
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007D50;
      v13[3] = &unk_100098FB0;
      v13[4] = self;
      v13[5] = buf;
      dispatch_sync(v10, v13);

      if (v15[24])
        -[SystemDiagnosticBT startBTSession:](self, "startBTSession:", v4);
      _Block_object_dispose(buf, 8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not triggering exposure notification logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not triggering exposure notifications since bluetooth is missing", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v12, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Not triggering exposure notifications since bluetooth is missing"));

  }
}

- (id)waitForExposureNotificationLogsIfAvailable:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[5];
  uint8_t buf[16];

  if (qword_1000B9740 != -1)
    dispatch_once(&qword_1000B9740, &stru_100099020);
  if (byte_1000B9738 != 1)
    return 0;
  if (!-[SystemDiagnosticBT shouldGatherBTLogs](self, "shouldGatherBTLogs"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not waiting for exposure notification logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationDBURL](self, "exposureNotificationDBURL"));

  if (!v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationGroup](self, "exposureNotificationGroup"));

    v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ExposureNotification db still collecting; waiting for it to become available.",
          buf,
          2u);
      }

      v16 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationGroup](self, "exposureNotificationGroup"));
      v17 = dispatch_time(0, a3);
      v18 = dispatch_group_wait(v16, v17);

      if (!v18)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationDBURL](self, "exposureNotificationDBURL"));
        v7 = objc_msgSend(v22, "copy");

        v23 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received ExposureNotification db after wait.", buf, 2u);
        }

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v10 = v9;
        v11 = CFSTR("Received ExposureNotification db after wait.");
        goto LABEL_9;
      }
      v19 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10005E250();

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v20, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Timed out waiting for ExposureNotification db collection."));

      v21 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008158;
      block[3] = &unk_100098F88;
      block[4] = self;
      dispatch_sync(v21, block);
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No ExposureNotification db available to collect.", buf, 2u);
      }

      v21 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      -[NSObject logWithSubsystem:category:msg:](v21, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("No ExposureNotification db available to collect."));
    }

    v7 = 0;
    goto LABEL_24;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationDBURL](self, "exposureNotificationDBURL"));
  v7 = objc_msgSend(v6, "copy");

  v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found collected ExposureNotification db.", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v10 = v9;
  v11 = CFSTR("Found collected ExposureNotification db.");
LABEL_9:
  objc_msgSend(v9, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", v11);

LABEL_24:
  -[SystemDiagnosticBT setExposureNotificationDBURL:](self, "setExposureNotificationDBURL:", 0);
  return v7;
}

- (void)markExposureNotificationLogsDone:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v5);

  -[SystemDiagnosticBT setWaitingToCaptureExposureNotificationLogs:](self, "setWaitingToCaptureExposureNotificationLogs:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationGroup](self, "exposureNotificationGroup"));

  if (v6)
  {
    if (!a3)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT exposureNotificationGroup](self, "exposureNotificationGroup"));
      dispatch_group_leave(v7);

    }
    -[SystemDiagnosticBT setExposureNotificationGroup:](self, "setExposureNotificationGroup:", 0);
  }
  -[SystemDiagnosticBT deregisterBTSessionIfDone](self, "deregisterBTSessionIfDone");
}

- (void)triggerExposureNotificationLogs
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  _BYTE v11[512];

  v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  v8 = 0;
  if (BTLocalDeviceGetDefault(-[SystemDiagnosticBT btSession](self, "btSession"), &v8))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10005E27C();
  }
  else
  {
    v5 = BTLocalDeviceDumpExposureNotificationDatabase(v8, v11, 512);
    if (v5)
    {
      v6 = v5;
      v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not dump ExposureNotification db from bluetoothd with error %d", buf, 8u);
      }
    }
    else
    {
      v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
      -[SystemDiagnosticBT setExposureNotificationDBURL:](self, "setExposureNotificationDBURL:", v7);

    }
  }

  -[SystemDiagnosticBT markExposureNotificationLogsDone:](self, "markExposureNotificationLogsDone:", 0);
}

- (void)startBTSessionAndTriggerAirPodLogs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_group_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  if (qword_1000B9740 != -1)
    dispatch_once(&qword_1000B9740, &stru_100099020);
  if ((byte_1000B9738 & 1) != 0)
  {
    if (-[SystemDiagnosticBT shouldGatherBTLogs](self, "shouldGatherBTLogs"))
    {
      v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Querying bluetooth if Airpods are connected, and collect AirPod logs if so.", buf, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Querying bluetooth if Airpods are connected, and collect AirPod logs if so."));

      -[SystemDiagnosticBT setAccessoryLogs:](self, "setAccessoryLogs:", 0);
      v7 = dispatch_group_create();
      -[SystemDiagnosticBT setAirpodsGroup:](self, "setAirpodsGroup:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
      if (v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
        dispatch_group_enter(v9);

      }
      *(_QWORD *)buf = 0;
      v15 = buf;
      v16 = 0x2020000000;
      v17 = 0;
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100008618;
      v13[3] = &unk_100098FB0;
      v13[4] = self;
      v13[5] = buf;
      dispatch_sync(v10, v13);

      if (v15[24])
        -[SystemDiagnosticBT startBTSession:](self, "startBTSession:", v4);
      _Block_object_dispose(buf, 8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not triggering AirPod logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not triggering airpod logs since bluetooth is missing", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v12, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Not triggering airpod logs since bluetooth is missing"));

  }
}

- (BOOL)isLimitedLoggingEnabled
{
  dispatch_semaphore_t v3;
  dispatch_time_t v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[8];
  _QWORD block[5];
  NSObject *v20;
  uint8_t *v21;
  uint8_t v22[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;

  if (objc_opt_class(CBUserController, a2))
  {
    *(_QWORD *)v22 = 0;
    v23 = v22;
    v24 = 0x2020000000;
    v25 = 0;
    v3 = dispatch_semaphore_create(0);
    v4 = dispatch_time(0, 1000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000894C;
    block[3] = &unk_100099000;
    block[4] = self;
    v21 = v22;
    v7 = v3;
    v20 = v7;
    dispatch_async(v6, block);

    if (dispatch_semaphore_wait(v7, v4))
    {
      v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Timed out waiting for limited logging check. Assuming limited logging disabled", buf, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v9, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v10, "stdoutWrite:", CFSTR("Timed out waiting for limited logging check. Assuming limited logging disabled"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v11, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Timed out waiting for limited logging check. Assuming limited logging disabled"));

      v12 = 0;
    }
    else
    {
      v12 = v23[24] != 0;
    }

    _Block_object_dispose(v22, 8);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CBUserController not found. Assuming limited logging disabled", v22, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v14, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v15, "stdoutWrite:", CFSTR("CBUserController not found. Assuming limited logging disabled"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v16, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("CBUserController not found. Assuming limited logging disabled"));

    return 0;
  }
  return v12;
}

- (unint64_t)getAirpodsTimeout
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[24];

  if (-[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Found testing airpod timeouts override. Using timeout: %llu", buf, 0xCu);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v4, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "stdoutWrite:", CFSTR("Found testing airpod timeouts override. Using timeout: %llu"), -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Found testing airpod timeouts override. Using timeout: %llu"), -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout"));

    return -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout");
  }
  else
  {
    *(_QWORD *)buf = 0;
    if (sub_1000460D8(CFSTR("airpods-timeout"), CFSTR("com.apple.sysdiagnose"), CFSTR("mobile"), buf))
    {
      v7 = 1000000000 * *(_QWORD *)buf;
      v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found manual airpods timeout override. Using timeout: %llu", buf, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v9, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v11 = CFSTR("Found manual airpods timeout override. Using timeout: %llu");
      objc_msgSend(v10, "stdoutWrite:", CFSTR("Found manual airpods timeout override. Using timeout: %llu"), v7);
    }
    else if (-[SystemDiagnosticBT isLimitedLoggingEnabled](self, "isLimitedLoggingEnabled"))
    {
      v7 = 300000000000;
      v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = 300000000000;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Limited logging is enabled. Using airpods timeout: %llu", buf, 0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v13, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v11 = CFSTR("Limited logging is enabled. Using airpods timeout: %llu");
      objc_msgSend(v10, "stdoutWrite:", CFSTR("Limited logging is enabled. Using airpods timeout: %llu"), 300000000000);
    }
    else if (sub_100045E60()
           && (buf[0] = 0, sub_10004602C(CFSTR("prioritizeAirPods"), CFSTR("com.apple.sysdiagnose"), (BOOL *)buf))
           && buf[0])
    {
      v7 = 300000000000;
      v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = 300000000000;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found prioritizeAirpodsWait timeout. Using timeout: %llu", buf, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v15, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v11 = CFSTR("Found prioritizeAirpodsWait timeout. Using timeout: %llu");
      objc_msgSend(v10, "stdoutWrite:", CFSTR("Found prioritizeAirpodsWait timeout. Using timeout: %llu"), 300000000000);
    }
    else
    {
      v7 = 30000000000;
      v16 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = 30000000000;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No preferences found. Using default airpods timeout value of: %llu", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v17, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v11 = CFSTR("No preferences found. Using default airpods timeout value of: %llu");
      objc_msgSend(v10, "stdoutWrite:", CFSTR("No preferences found. Using default airpods timeout value of: %llu"), 30000000000);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v18, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", v11, v7);

  }
  return v7;
}

- (id)waitForAirPodLogsIfAvailable
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  intptr_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _QWORD block[5];
  uint8_t buf[16];

  if (qword_1000B9740 != -1)
    dispatch_once(&qword_1000B9740, &stru_100099020);
  if (byte_1000B9738 != 1)
    return 0;
  if (!-[SystemDiagnosticBT shouldGatherBTLogs](self, "shouldGatherBTLogs"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not waiting for AirPod logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));

  if (!v3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));

    v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AirPod logs still collecting; waiting for them to become available.",
          buf,
          2u);
      }

      v14 = -[SystemDiagnosticBT getAirpodsTimeout](self, "getAirpodsTimeout");
      v15 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
      v16 = dispatch_time(0, v14);
      v17 = dispatch_group_wait(v15, v16);

      if (!v17)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));
        v5 = objc_msgSend(v21, "copy");

        v22 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received AirPod logs after wait.", buf, 2u);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v8 = v7;
        v9 = CFSTR("Received AirPod logs after wait.");
        goto LABEL_9;
      }
      v18 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005E2DC();

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v19, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("Timed out waiting for AirPod logs collection."));

      v20 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009508;
      block[3] = &unk_100098F88;
      block[4] = self;
      dispatch_async(v20, block);
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No AirPod logs available to collect.", buf, 2u);
      }

      v20 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      -[NSObject logWithSubsystem:category:msg:](v20, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("No AirPod logs available to collect."));
    }

    v5 = 0;
    goto LABEL_24;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found collected AirPod logs.", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v8 = v7;
  v9 = CFSTR("Found collected AirPod logs.");
LABEL_9:
  objc_msgSend(v7, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", v9);

LABEL_24:
  -[SystemDiagnosticBT setAccessoryLogs:](self, "setAccessoryLogs:", 0);
  return v5;
}

- (void)deregisterBTSession
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[SystemDiagnosticBT accessoryManager](self, "accessoryManager"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistering AirPod logs dump with BTAccessoryManager.", v6, 2u);
    }

    BTAccessoryManagerDeregisterCustomMessageClient(-[SystemDiagnosticBT accessoryManager](self, "accessoryManager", sub_10000A1F4), v6);
    -[SystemDiagnosticBT setAccessoryManager:](self, "setAccessoryManager:", 0);
  }
  if (-[SystemDiagnosticBT btSession](self, "btSession"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detaching from bluetoothd.", v6, 2u);
    }

    *(_QWORD *)v6 = -[SystemDiagnosticBT btSession](self, "btSession");
    BTSessionDetachWithQueue(v6);
    -[SystemDiagnosticBT setBtSession:](self, "setBtSession:", 0);
  }
  -[SystemDiagnosticBT setAttachedToBTSession:](self, "setAttachedToBTSession:", 0);
}

- (void)deregisterBTSessionIfDone
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[SystemDiagnosticBT waitingToCaptureAirPodLogs](self, "waitingToCaptureAirPodLogs")
    && !-[SystemDiagnosticBT waitingToCaptureExposureNotificationLogs](self, "waitingToCaptureExposureNotificationLogs"))
  {
    -[SystemDiagnosticBT deregisterBTSession](self, "deregisterBTSession");
  }
}

- (void)forceDeregisterBTSession
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  -[SystemDiagnosticBT markAirpodLogsDone:](self, "markAirpodLogsDone:", 0);
  -[SystemDiagnosticBT markExposureNotificationLogsDone:](self, "markExposureNotificationLogsDone:", 0);
  -[SystemDiagnosticBT deregisterBTSession](self, "deregisterBTSession");
}

- (void)retryAttachToBTSession
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v9;
  __int16 v10;
  int v11;

  v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[SystemDiagnosticBT numAttachTries](self, "numAttachTries");
  v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  v6 = v5;
  if (v4 > 2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10005E308(self, v6);

    -[SystemDiagnosticBT forceDeregisterBTSession](self, "forceDeregisterBTSession");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v9 = -[SystemDiagnosticBT numAttachTries](self, "numAttachTries");
      v10 = 1024;
      v11 = 3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempt (%d/%d) to attach to BTSession failed. Trying again...", buf, 0xEu);
    }

    -[SystemDiagnosticBT deregisterBTSession](self, "deregisterBTSession");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000984C;
    block[3] = &unk_100098F88;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)markAirpodLogsDone:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v5);

  -[SystemDiagnosticBT setWaitingToCaptureAirPodLogs:](self, "setWaitingToCaptureAirPodLogs:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));

  if (v6)
  {
    if (!a3)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
      dispatch_group_leave(v7);

    }
    -[SystemDiagnosticBT setAirpodsGroup:](self, "setAirpodsGroup:", 0);
  }
  -[SystemDiagnosticBT deregisterBTSessionIfDone](self, "deregisterBTSessionIfDone");
}

- (void)triggerAirPodLogsIfConnected
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[8];
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to trigger AirPod logs dump.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  if (BTAccessoryManagerGetDefault(-[SystemDiagnosticBT btSession](self, "btSession"), buf))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10005E4AC();

    goto LABEL_27;
  }
  -[SystemDiagnosticBT setAccessoryManager:](self, "setAccessoryManager:", *(_QWORD *)buf);
  v10 = sub_10000A1F4;
  v6 = BTAccessoryManagerRegisterCustomMessageClient(-[SystemDiagnosticBT accessoryManager](self, "accessoryManager"), &v10, 64, 0xFFFFFFFFLL);
  if (v6 > 9)
  {
    switch(v6)
    {
      case 10:
        v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_10005E428();
        goto LABEL_26;
      case 312:
        v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_10005E454();
        goto LABEL_26;
      case 11:
        v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_10005E3FC();
LABEL_26:

LABEL_27:
        -[SystemDiagnosticBT markAirpodLogsDone:](self, "markAirpodLogsDone:", 0);
        return;
    }
LABEL_24:
    v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005E39C();
    goto LABEL_26;
  }
  if (v6)
  {
    if (v6 == 2)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10005E480();
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully registered AirPod logs dump with BTAccessoryManager, waiting for accessory logs callback.", v9, 2u);
  }

}

- (void)sessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v9 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v9);

  switch(a4)
  {
    case 0:
      if (a5)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_10005E578();

        -[SystemDiagnosticBT retryAttachToBTSession](self, "retryAttachToBTSession");
      }
      else
      {
        -[SystemDiagnosticBT setBtSession:](self, "setBtSession:", a3);
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received BT_SESSION_ATTACHED (BT_SUCCESS) event in BTSession event callback. Capturing available data.", buf, 2u);
        }

        if (-[SystemDiagnosticBT waitingToCaptureAirPodLogs](self, "waitingToCaptureAirPodLogs"))
          -[SystemDiagnosticBT triggerAirPodLogsIfConnected](self, "triggerAirPodLogsIfConnected");
        if (-[SystemDiagnosticBT waitingToCaptureExposureNotificationLogs](self, "waitingToCaptureExposureNotificationLogs"))
        {
          -[SystemDiagnosticBT triggerExposureNotificationLogs](self, "triggerExposureNotificationLogs");
        }
      }
      return;
    case 1:
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received BT_SESSION_DETACHED event in BTSession event callback. Ignoring.", v14, 2u);
      }
      goto LABEL_15;
    case 2:
      v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10005E5D8();

      -[SystemDiagnosticBT forceDeregisterBTSession](self, "forceDeregisterBTSession");
      return;
    case 3:
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_10005E604();
      goto LABEL_15;
    default:
      v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_10005E50C();
LABEL_15:

      return;
  }
}

- (void)logCompletionHandler:(char *)a3 size:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  NSMutableArray *v20;

  v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPod logs callback received.", (uint8_t *)&v19, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));
  if (v9)
  {
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
      sub_10005E6DC();
  }
  else
  {
    v10 = objc_opt_new(NSMutableArray);
    if ((uint64_t)a4 >= 1)
    {
      v11 = &a3[a4];
      while (1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
        v13 = v12;
        if (!v12 || !objc_msgSend(v12, "length"))
          break;
        -[NSMutableArray addObject:](v10, "addObject:", v13);
        a3 += strlen(a3) + 1;

        if (a3 >= v11)
          goto LABEL_15;
      }
      v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10005E6B0();

    }
LABEL_15:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));

    v16 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AirPod logs dumped, file(s) received in callback: %@", (uint8_t *)&v19, 0xCu);
      }

      v18 = -[NSMutableArray copy](v10, "copy");
      -[SystemDiagnosticBT setAccessoryLogs:](self, "setAccessoryLogs:", v18);

      -[SystemDiagnosticBT markAirpodLogsDone:](self, "markAirpodLogsDone:", 0);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10005E63C((uint64_t)v10, v17);

    }
  }

}

- (BOOL)shouldGatherBTLogs
{
  return self->_shouldGatherBTLogs;
}

- (void)setShouldGatherBTLogs:(BOOL)a3
{
  self->_shouldGatherBTLogs = a3;
}

- (unint64_t)defaultAirpodTimeout
{
  return self->_defaultAirpodTimeout;
}

- (void)setDefaultAirpodTimeout:(unint64_t)a3
{
  self->_defaultAirpodTimeout = a3;
}

- (OS_dispatch_queue)bluetoothQueue
{
  return self->_bluetoothQueue;
}

- (void)setBluetoothQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothQueue, a3);
}

- (NSArray)accessoryLogs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessoryLogs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_os_log)accessoryLogSubsystem
{
  return self->_accessoryLogSubsystem;
}

- (void)setAccessoryLogSubsystem:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLogSubsystem, a3);
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (int)numAttachTries
{
  return self->_numAttachTries;
}

- (void)setNumAttachTries:(int)a3
{
  self->_numAttachTries = a3;
}

- (NSString)diagnosticID
{
  return self->_diagnosticID;
}

- (void)setDiagnosticID:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticID, a3);
}

- (BOOL)attachedToBTSession
{
  return self->_attachedToBTSession;
}

- (void)setAttachedToBTSession:(BOOL)a3
{
  self->_attachedToBTSession = a3;
}

- (BOOL)waitingToCaptureAirPodLogs
{
  return self->_waitingToCaptureAirPodLogs;
}

- (void)setWaitingToCaptureAirPodLogs:(BOOL)a3
{
  self->_waitingToCaptureAirPodLogs = a3;
}

- (OS_dispatch_group)airpodsGroup
{
  return self->_airpodsGroup;
}

- (void)setAirpodsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_airpodsGroup, a3);
}

- (BOOL)waitingToCaptureExposureNotificationLogs
{
  return self->_waitingToCaptureExposureNotificationLogs;
}

- (void)setWaitingToCaptureExposureNotificationLogs:(BOOL)a3
{
  self->_waitingToCaptureExposureNotificationLogs = a3;
}

- (OS_dispatch_group)exposureNotificationGroup
{
  return self->_exposureNotificationGroup;
}

- (void)setExposureNotificationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_exposureNotificationGroup, a3);
}

- (NSURL)exposureNotificationDBURL
{
  return self->_exposureNotificationDBURL;
}

- (void)setExposureNotificationDBURL:(id)a3
{
  objc_storeStrong((id *)&self->_exposureNotificationDBURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureNotificationDBURL, 0);
  objc_storeStrong((id *)&self->_exposureNotificationGroup, 0);
  objc_storeStrong((id *)&self->_airpodsGroup, 0);
  objc_storeStrong((id *)&self->_diagnosticID, 0);
  objc_storeStrong((id *)&self->_accessoryLogSubsystem, 0);
  objc_storeStrong((id *)&self->_accessoryLogs, 0);
  objc_storeStrong((id *)&self->_bluetoothQueue, 0);
}

@end
