@implementation MIBUWiFiHelper

- (MIBUWiFiHelper)init
{
  MIBUWiFiHelper *v2;
  MIBUWiFiHelper *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIBUWiFiHelper;
  v2 = -[MIBUWiFiHelper init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUWiFiHelper setWifiInterface:](v2, "setWifiInterface:", 0);
    -[MIBUWiFiHelper setConnectionSem:](v3, "setConnectionSem:", 0);
    -[MIBUWiFiHelper setNetworkMonitor:](v3, "setNetworkMonitor:", 0);
    v4 = objc_alloc_init((Class)NSOperationQueue);
    -[MIBUWiFiHelper setWifiRetryQueue:](v3, "setWifiRetryQueue:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiRetryQueue](v3, "wifiRetryQueue"));
    objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiRetryQueue](v3, "wifiRetryQueue"));
    objc_msgSend(v6, "setName:", CFSTR("com.apple.mobileinboxupdate.service_queue"));

    -[MIBUWiFiHelper setLocalRetryDelay:](v3, "setLocalRetryDelay:", 3.0);
    -[MIBUWiFiHelper setLocalRetryLimit:](v3, "setLocalRetryLimit:", 3);
    -[MIBUWiFiHelper setGlobalRetryInterval:](v3, "setGlobalRetryInterval:", 60.0);
  }
  return v3;
}

+ (MIBUWiFiHelper)sharedInstance
{
  if (qword_100068900 != -1)
    dispatch_once(&qword_100068900, &stru_1000572B0);
  return (MIBUWiFiHelper *)(id)qword_100068908;
}

- (void)connectAndMonitor:(id *)a3
{
  MIBUWiFiHelper *v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  MIBUWiFiHelper *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[24];

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10001FF9C;
  v22 = sub_10001FFAC;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10001FF9C;
  v16[4] = sub_10001FFAC;
  v17 = self;
  v4 = v17;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper networkMonitor](v4, "networkMonitor"));
  v6 = v5 == 0;

  if (v6)
  {
    v7 = objc_alloc_init((Class)CWFInterface);
    -[MIBUWiFiHelper setWifiInterface:](v4, "setWifiInterface:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](v4, "wifiInterface"));
    objc_msgSend(v8, "activate");

    -[MIBUWiFiHelper _initNetworkMonitor](v4, "_initNetworkMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiRetryQueue](v4, "wifiRetryQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100020018;
    v15[3] = &unk_1000572F8;
    v15[4] = v16;
    v15[5] = &v18;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v15));
    objc_msgSend(v9, "addOperation:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiRetryQueue](v4, "wifiRetryQueue"));
    -[NSObject waitUntilAllOperationsAreFinished](v11, "waitUntilAllOperationsAreFinished");
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000572D0);
    v11 = (id)qword_100068950;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class(v4);
      sub_10003CA7C(v14, (uint64_t)v24, v11);
    }
  }

  objc_sync_exit(v4);
  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  if (v19[5])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](v4, "wifiInterface"));
    objc_msgSend(v12, "invalidate");

    v13 = objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper networkMonitor](v4, "networkMonitor"));
    nw_path_monitor_cancel(v13);

    -[MIBUWiFiHelper setNetworkMonitor:](v4, "setNetworkMonitor:", 0);
  }
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
}

- (void)stopMonitor
{
  MIBUWiFiHelper *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper networkMonitor](v2, "networkMonitor"));

  if (v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057318);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping network monitoring...", v6, 2u);
    }
    v5 = objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper networkMonitor](v2, "networkMonitor"));
    nw_path_monitor_cancel(v5);

    -[MIBUWiFiHelper setNetworkMonitor:](v2, "setNetworkMonitor:", 0);
  }
  objc_sync_exit(v2);

}

- (void)_initNetworkMonitor
{
  nw_path_monitor_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD update_handler[5];

  v3 = nw_path_monitor_create();
  -[MIBUWiFiHelper setNetworkMonitor:](self, "setNetworkMonitor:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper networkMonitor](self, "networkMonitor"));
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472;
  update_handler[2] = sub_100020260;
  update_handler[3] = &unk_100057380;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v4, update_handler);

  v5 = objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper networkMonitor](self, "networkMonitor"));
  nw_path_monitor_start(v5);

}

- (void)_dispatchRetryOperation
{
  MIBUWiFiHelper *v2;
  MIBUWiFiHelper *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];
  _QWORD v11[5];
  MIBUWiFiHelper *v12;

  v2 = self;
  objc_sync_enter(v2);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10001FF9C;
  v11[4] = sub_10001FFAC;
  v3 = v2;
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiRetryQueue](v3, "wifiRetryQueue"));
  v5 = objc_msgSend(v4, "operationCount");

  if (v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000573A0);
    v8 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WiFi Retry operation already in progress", buf, 2u);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiRetryQueue](v3, "wifiRetryQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000206E0;
    v9[3] = &unk_100055DB8;
    v9[4] = v11;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
    objc_msgSend(v6, "addOperation:", v7);

  }
  _Block_object_dispose(v11, 8);

  objc_sync_exit(v3);
}

- (void)_retryWiFiConnection:(id *)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;

  if (-[MIBUWiFiHelper _isWiFiConnected](self, "_isWiFiConnected"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057420);
    v8 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device already connected to wifi", buf, 2u);
    }
    v6 = 0;
    if (a3)
      goto LABEL_6;
  }
  else
  {
    v11 = 0;
    -[MIBUWiFiHelper _enableWiFi:](self, "_enableWiFi:", &v11);
    v5 = v11;
    if (!v5)
    {
      v10 = 0;
      -[MIBUWiFiHelper _connectToWiFiWithError:](self, "_connectToWiFiWithError:", &v10);
      v5 = v10;
      if (!v5)
      {
        v9 = 0;
        -[MIBUWiFiHelper _waitForWiFiConnection:](self, "_waitForWiFiConnection:", &v9);
        v5 = v9;
      }
    }
    v6 = v5;
    if (a3)
LABEL_6:
      *a3 = objc_retainAutorelease(v6);
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057440);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection retry finished with error: %{public}@", buf, 0xCu);
  }

}

- (BOOL)_isWiFiConnected
{
  NSObject *v2;
  void *evaluator_for_endpoint;
  NSObject *v4;
  char v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = nw_parameters_create();
  nw_parameters_set_multipath_service(v2, nw_multipath_service_handover);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(0, v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020DF4;
  v7[3] = &unk_100057468;
  v4 = (id)nw_path_evaluator_copy_path();
  v8 = v4;
  v9 = &v10;
  nw_path_enumerate_interfaces(v4, v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)_enableWiFi:(id *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint8_t buf[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057488);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling WiFi interface on device", buf, 2u);
  }
  v33 = 0;
  -[MIBUWiFiHelper _waitForWiFiInterface:](self, "_waitForWiFiInterface:", &v33);
  v6 = v33;
  if (v6)
  {
    v13 = v6;
    sub_10000D680(a3, 1879048192, v6, CFSTR("Failed to wait for wifi interface"), v7, v8, v9, v10, (uint64_t)v32);
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000574A8);
    v18 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003CB48((uint64_t)v13, v18, v19, v20, v21, v22, v23, v24);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface"));
    v32 = 0;
    v12 = objc_msgSend(v11, "setPower:error:", 1, &v32);
    v13 = v32;

    if ((v12 & 1) == 0)
    {
      sub_10000D680(a3, 1879048192, v13, CFSTR("Failed to set wifi power state"), v14, v15, v16, v17, (uint64_t)v32);
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000574C8);
      v25 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003CAE4((uint64_t)v13, v25, v26, v27, v28, v29, v30, v31);
    }
  }

}

- (void)_connectToWiFiWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  __CFString *v29;

  if (os_variant_has_internal_content("com.apple.inboxupdaterd")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wifiSSID")),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wifiSSID"));

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000574E8);
    v9 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding wifi SSID to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v8 = CFSTR("neon");
  }
  v27 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper _scanForSSID:error:](self, "_scanForSSID:error:", v8, &v27));
  v11 = v27;
  v16 = v11;
  if (v10)
  {
    v26 = v11;
    v17 = -[MIBUWiFiHelper _associateFromScanResult:error:](self, "_associateFromScanResult:error:", v10, &v26);
    v18 = v26;

    if ((v17 & 1) != 0)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057548);
      v23 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Successfully connected to SSID: %{public}@!", buf, 0xCu);
      }
    }
    else
    {
      sub_10000D680(a3, 1879048194, v18, CFSTR("Failed to associate to ssid"), v19, v20, v21, v22, (uint64_t)v26);
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057528);
      v25 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003CC28((uint64_t)v8, v25);
    }
    v16 = v18;
  }
  else
  {
    sub_10000D680(a3, 1879048193, v11, CFSTR("Failed to find matching ssid"), v12, v13, v14, v15, (uint64_t)v26);
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057508);
    v24 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003CBAC((uint64_t)v8, v24);
  }

}

- (void)_waitForWiFiInterface:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[16];
  id v26;
  _QWORD v27[4];
  id v28;

  v5 = objc_alloc_init((Class)NSCondition);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100021920;
  v27[3] = &unk_100057590;
  v8 = v5;
  v28 = v8;
  objc_msgSend(v7, "setEventHandler:", v27);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface"));
  v26 = 0;
  v10 = objc_msgSend(v9, "startMonitoringEventType:error:", 10, &v26);
  v11 = v26;

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "lock");
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interfaceName"));

      if (v13)
        break;
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000575D0);
      v14 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wifi interface is not intialized, waiting for  CWFEventTypeInterfaceAdded event.", buf, 2u);
      }
      if ((objc_msgSend(v8, "waitUntilDate:", v6) & 1) == 0)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000575F0);
        v15 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Wait for wifi interface initialization timed out after 5 seconds", buf, 2u);
        }
        break;
      }
    }
    objc_msgSend(v8, "unlock");
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057610);
    v16 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wifi interface is initialized!", buf, 2u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface"));
    objc_msgSend(v17, "stopMonitoringEventType:", 10);

  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000575B0);
    v18 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003CCA4((uint64_t)v11, v18, v19, v20, v21, v22, v23, v24);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v11);

}

- (void)_waitForWiFiConnection:(id *)a3
{
  dispatch_semaphore_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  int v17;

  v5 = dispatch_semaphore_create(0);
  -[MIBUWiFiHelper setConnectionSem:](self, "setConnectionSem:", v5);

  v6 = dispatch_time(0, 30000000000);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057630);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = 30;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Waiting %ds for network connection...", buf, 8u);
  }
  v8 = objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper connectionSem](self, "connectionSem"));
  v9 = (id)dispatch_semaphore_wait(v8, v6);

  if (v9)
  {
    if (-[MIBUWiFiHelper _isWiFiConnected](self, "_isWiFiConnected"))
    {
      v9 = 0;
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057650);
      v10 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003CD08(v10);
      v15 = 0;
      sub_10000D680(&v15, 1879048195, 0, CFSTR("No network connection after %ds"), v11, v12, v13, v14, 30);
      v9 = v15;
    }
  }
  -[MIBUWiFiHelper setConnectionSem:](self, "setConnectionSem:", 0);
  if (a3)
    *a3 = objc_retainAutorelease(v9);

}

- (id)_scanForSSID:(id)a3 error:(id *)a4
{
  id v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  double v31;
  id *v32;
  NSObject *v33;
  id v34;
  NSObject *v36;
  __int128 v37;
  MIBUWiFiHelper *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int64_t v52;
  _BYTE v53[128];

  v5 = a3;
  v41 = objc_alloc_init((Class)CWFScanParameters);
  v6 = -[MIBUWiFiHelper localRetryLimit](self, "localRetryLimit");
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057670);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scanning for wifi with SSID: %{public}@", buf, 0xCu);
  }
  objc_msgSend(v41, "setIncludeHiddenNetworks:", 1);
  objc_msgSend(v41, "setSSID:", v5);
  objc_msgSend(v41, "setBSSType:", 2);
  v8 = 0;
  v9 = 0;
  *(_QWORD *)&v10 = 138543618;
  v37 = v10;
  v39 = self;
  while (1)
  {
    v11 = v9;
    v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface", v37));
    v46 = v9;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performScanWithParameters:error:", v41, &v46));
    v9 = v46;

    if (!v9)
      break;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057690);
    v14 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v37;
      v48 = v5;
      v49 = 2114;
      v50 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to scan for SSID: %{public}@ with error:%{public}@", buf, 0x16u);
    }
LABEL_38:
    if (!--v6)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057710);
      v32 = a4;
      v33 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v5;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "All wifi scan tries exhausted; %{public}@ not found",
          buf,
          0xCu);
      }
      v19 = 0;
      if (!a4)
        goto LABEL_45;
LABEL_44:
      *v32 = objc_retainAutorelease(v9);
      goto LABEL_45;
    }
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000576B0);
  v15 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WiFi scan found results: %{public}@", buf, 0xCu);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (!v17)
  {

LABEL_33:
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000576D0);
    v28 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      -[MIBUWiFiHelper localRetryDelay](self, "localRetryDelay");
      *(_DWORD *)buf = 138543874;
      v48 = v5;
      v49 = 2048;
      v50 = v30;
      v51 = 2048;
      v52 = v6 - 1;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SSID %{public}@ not found, waiting for %lfs and rescan (%lu tries remaining)", buf, 0x20u);

    }
    -[MIBUWiFiHelper localRetryDelay](self, "localRetryDelay");
    sleep(v31);
    goto LABEL_38;
  }
  v18 = v17;
  v40 = v8;
  v19 = 0;
  v20 = *(_QWORD *)v43;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v43 != v20)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "networkName"));
      if (objc_msgSend(v23, "isEqualToString:", v5))
      {
        v24 = objc_msgSend(v22, "isEAP");

        if (v24)
        {
          if (v19)
          {
            v25 = objc_msgSend(v22, "RSSI");
            if ((uint64_t)v25 > (uint64_t)objc_msgSend(v19, "RSSI"))
            {
              v26 = v22;

              v19 = v26;
            }
          }
          else
          {
            v19 = v22;
          }
        }
      }
      else
      {

      }
      v21 = (char *)v21 + 1;
    }
    while (v18 != v21);
    v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    v18 = v27;
  }
  while (v27);

  v9 = 0;
  v8 = v40;
  self = v39;
  if (!v19)
    goto LABEL_33;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000576F0);
  v32 = a4;
  v36 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v19;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Found scan result with highest RSSI: %{public}@", buf, 0xCu);
  }
  v9 = 0;
  if (a4)
    goto LABEL_44;
LABEL_45:
  v34 = v19;

  return v34;
}

- (BOOL)_associateFromScanResult:(id)a3 error:(id *)a4
{
  int64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  id *v21;
  unsigned __int8 v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  double v26;
  NSMutableDictionary *v28;
  id v29;
  id obj;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  int64_t v55;

  v29 = a3;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = sub_10001FF9C;
  v48 = sub_10001FFAC;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10001FF9C;
  v42 = sub_10001FFAC;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10001FF9C;
  v36 = sub_10001FFAC;
  v37 = 0;
  v28 = objc_opt_new(NSMutableDictionary);
  v6 = -[MIBUWiFiHelper localRetryLimit](self, "localRetryLimit");
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057730);
  v7 = (id)qword_100068950;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "networkName"));
    *(_DWORD *)buf = 138543362;
    v51 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Associating with SSID: %{public}@", buf, 0xCu);

  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100022C04;
  v31[3] = &unk_100057758;
  v31[4] = &v44;
  v31[5] = &v38;
  v31[6] = &v32;
  +[MIBUCertHelper trustCertificatesWithCompletion:](MIBUCertHelper, "trustCertificatesWithCompletion:", v31);
  v9 = v45[5];
  if (v9)
  {
    v12 = 0;
    v22 = 0;
    *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", &off_10005D088, CFSTR("AcceptEAPTypes"));
    v10 = (void *)v39[5];
    if (v10 && objc_msgSend(v10, "count"))
      -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v39[5], CFSTR("TLSTrustedCertificates"));
    v11 = (void *)v33[5];
    if (v11 && objc_msgSend(v11, "count"))
      -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v33[5], CFSTR("TLSTrustedServerNames"));
    v12 = objc_alloc_init((Class)CWFAssocParameters);
    objc_msgSend(v12, "setScanResult:", v29);
    objc_msgSend(v12, "setRememberUponSuccessfulAssociation:", 0);
    v13 = objc_alloc_init((Class)CWFNetworkProfile);
    objc_msgSend(v12, "setKnownNetworkProfile:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "knownNetworkProfile"));
    objc_msgSend(v14, "setHiddenState:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "knownNetworkProfile"));
    objc_msgSend(v15, "setEAPProfile:", v28);

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057778);
    v16 = (id)qword_100068950;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "knownNetworkProfile"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "EAPProfile"));
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EAP Profile: %{public}@", buf, 0xCu);

    }
    v19 = v6 - 1;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUWiFiHelper wifiInterface](self, "wifiInterface"));
      v21 = v45;
      obj = v45[5];
      v22 = objc_msgSend(v20, "associateWithParameters:error:", v12, &obj);
      objc_storeStrong(v21 + 5, obj);

      if ((v22 & 1) != 0)
        break;
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057798);
      v23 = (id)qword_100068950;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "networkName"));
        -[MIBUWiFiHelper localRetryDelay](self, "localRetryDelay");
        *(_DWORD *)buf = 138543874;
        v51 = v24;
        v52 = 2048;
        v53 = v25;
        v54 = 2048;
        v55 = v19;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to associate to %{public}@, waiting for %lfs and re-associate (%lu tries remaining)", buf, 0x20u);

      }
      -[MIBUWiFiHelper localRetryDelay](self, "localRetryDelay");
      sleep(v26);
      --v19;
    }
    while (v19 != -1);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v22;
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInterface, a3);
}

- (OS_nw_path_monitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (OS_dispatch_semaphore)connectionSem
{
  return self->_connectionSem;
}

- (void)setConnectionSem:(id)a3
{
  objc_storeStrong((id *)&self->_connectionSem, a3);
}

- (NSOperationQueue)wifiRetryQueue
{
  return self->_wifiRetryQueue;
}

- (void)setWifiRetryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRetryQueue, a3);
}

- (int64_t)localRetryLimit
{
  return self->_localRetryLimit;
}

- (void)setLocalRetryLimit:(int64_t)a3
{
  self->_localRetryLimit = a3;
}

- (double)localRetryDelay
{
  return self->_localRetryDelay;
}

- (void)setLocalRetryDelay:(double)a3
{
  self->_localRetryDelay = a3;
}

- (double)globalRetryInterval
{
  return self->_globalRetryInterval;
}

- (void)setGlobalRetryInterval:(double)a3
{
  self->_globalRetryInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiRetryQueue, 0);
  objc_storeStrong((id *)&self->_connectionSem, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
}

@end
