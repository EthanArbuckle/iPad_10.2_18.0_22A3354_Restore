@implementation MIBUMainController

- (MIBUMainController)init
{
  MIBUMainController *v2;
  MIBUMainController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  MIBUNFCController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;

  v17.receiver = self;
  v17.super_class = (Class)MIBUMainController;
  v2 = -[MIBUMainController init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUMainController setState:](v2, "setState:", 0);
    -[MIBUMainController setOperation:](v3, "setOperation:", 0);
    -[MIBUMainController setIdleTimer:](v3, "setIdleTimer:", 0);
    -[MIBUMainController setIdleTimeInterval:](v3, "setIdleTimeInterval:", 300.0);
    if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nfcIdleTime"));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nfcIdleTime"));
        objc_msgSend(v7, "doubleValue");
        -[MIBUMainController setIdleTimeInterval:](v3, "setIdleTimeInterval:");

        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100056988);
        v8 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          -[MIBUMainController idleTimeInterval](v3, "idleTimeInterval");
          *(_DWORD *)buf = 134217984;
          v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overrding NFC Idle time to %lf", buf, 0xCu);

        }
      }
    }
    v11 = -[MIBUNFCController initWithDelegate:]([MIBUNFCController alloc], "initWithDelegate:", v3);
    -[MIBUMainController setNfcController:](v3, "setNfcController:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController nfcController](v3, "nfcController"));
    objc_msgSend(v12, "addObserver:", v3);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDeviceController sharedInstance](MIBUDeviceController, "sharedInstance"));
    -[MIBUMainController setDeviceDelegate:](v3, "setDeviceDelegate:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUOperationFactory sharedInstance](MIBUOperationFactory, "sharedInstance"));
    -[MIBUMainController setOperationFactory:](v3, "setOperationFactory:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController _getStateTransitionTable](v3, "_getStateTransitionTable"));
    -[MIBUMainController setStateTransitionTable:](v3, "setStateTransitionTable:", v15);

    -[MIBUMainController setShutDownReady:](v3, "setShutDownReady:", 0);
    -[MIBUMainController setDisableCarrierMode:](v3, "setDisableCarrierMode:", 1);
    -[MIBUMainController setTransaction:](v3, "setTransaction:", 0);
    -[MIBUMainController setPowerAssertionID:](v3, "setPowerAssertionID:", 0);
    v3->_running = 0;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1000688C8 != -1)
    dispatch_once(&qword_1000688C8, &stru_1000569A8);
  return (id)qword_1000688D0;
}

- (void)start:(id *)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100019430;
  v3[3] = &unk_1000569D0;
  v3[4] = self;
  v3[5] = a3;
  if (qword_1000688D8 != -1)
    dispatch_once(&qword_1000688D8, v3);
}

- (void)cleanup:(id *)a3
{
  MIBUMainController *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = self;
  objc_sync_enter(v4);
  if ((id)-[MIBUMainController state](v4, "state") == (id)5)
  {
    if (!-[MIBUMainController disableCarrierMode](v4, "disableCarrierMode"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](v4, "deviceDelegate"));
      objc_msgSend(v5, "disableCarrierMode");

      -[MIBUMainController setDisableCarrierMode:](v4, "setDisableCarrierMode:", 1);
    }
  }
  else
  {
    -[MIBUMainController setDisableCarrierMode:](v4, "setDisableCarrierMode:", 1);
    -[MIBUMainController _transitionToState:error:](v4, "_transitionToState:error:", 5, a3);
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000569F0);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "main controller cleaned up", v7, 2u);
  }
  objc_sync_exit(v4);

}

- (MIBUDeviceStatus)deviceStatus
{
  MIBUMainController *v2;
  MIBUDeviceStatus *v3;
  void *v4;
  void *v5;
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

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MIBUDeviceStatus);
  -[MIBUDeviceStatus setState:](v3, "setState:", -[MIBUMainController state](v2, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](v2, "deviceDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getBatteryLevel"));
  -[MIBUDeviceStatus setBatteryLevel:](v3, "setBatteryLevel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](v2, "deviceDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thermalDetails"));
  -[MIBUDeviceStatus setThermalDetails:](v3, "setThermalDetails:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](v2, "deviceDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "batteryDetails"));
  -[MIBUDeviceStatus setBatteryDetails:](v3, "setBatteryDetails:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](v2, "operation"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](v2, "operation"));
    -[MIBUDeviceStatus setOperation:](v3, "setOperation:", objc_msgSend(v11, "opCode"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](v2, "operation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
    -[MIBUDeviceStatus setOperationError:](v3, "setOperationError:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](v2, "operation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "details"));
    -[MIBUDeviceStatus setOperationDetails:](v3, "setOperationDetails:", v15);

  }
  else
  {
    -[MIBUDeviceStatus setOperation:](v3, "setOperation:", 0);
    -[MIBUDeviceStatus setOperationError:](v3, "setOperationError:", 0);
    -[MIBUDeviceStatus setOperationDetails:](v3, "setOperationDetails:", 0);
  }
  objc_sync_exit(v2);

  return v3;
}

- (MIBUNetworkInfo)networkInfo
{
  MIBUMainController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUNetworkInfo queryNetworkInfo](MIBUNetworkInfo, "queryNetworkInfo"));
  objc_sync_exit(v2);

  return (MIBUNetworkInfo *)v3;
}

- (BOOL)isCommandAllowed:(id)a3
{
  id v4;
  MIBUMainController *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v15[0] = &off_10005BFC8;
  v15[1] = &off_10005BFE0;
  v16[0] = &__NSArray0__struct;
  v16[1] = &off_10005CFF8;
  v15[2] = &off_10005C0D0;
  v16[2] = &off_10005D010;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  if ((id)-[MIBUMainController state](v5, "state") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](v5, "operation"));
    v8 = objc_msgSend(v7, "isCommandAllowed:", v4);

    if ((v8 & 1) != 0)
    {
LABEL_3:
      v9 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUMainController state](v5, "state")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v10));

    LOBYTE(v10) = objc_msgSend(v11, "containsObject:", v4);
    if ((v10 & 1) != 0)
      goto LABEL_3;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056A10);
  v12 = (id)qword_100068950;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10003C3BC((uint64_t)v4, (uint64_t)&v14, -[MIBUMainController state](v5, "state"), v12);

  v9 = 0;
LABEL_10:

  objc_sync_exit(v5);
  return v9;
}

- (void)nfcActivityDidTimeout
{
  NSObject *v3;
  MIBUMainController *v4;
  NSObject *v5;
  unint64_t v6;
  int v7;
  unint64_t v8;

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056A30);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling nfcActivity timeout", (uint8_t *)&v7, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  if ((id)-[MIBUMainController state](v4, "state") == (id)5 || (id)-[MIBUMainController state](v4, "state") == (id)4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056A50);
    v5 = (id)qword_100068950;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[MIBUMainController state](v4, "state");
      v7 = 134217984;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device already in state: %lu. No additional handling required", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    -[MIBUMainController setShutDownReady:](v4, "setShutDownReady:", 1);
    -[MIBUMainController _transitionToState:error:](v4, "_transitionToState:error:", 5, 0);
  }
  objc_sync_exit(v4);

}

- (void)didHandleCommand:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  MIBUMainController *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  MIBUMainController *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_msgSend(v6, "code");
  if (v7)
    goto LABEL_28;
  v10 = (uint64_t)v9;
  v11 = -[MIBUMainController state](v8, "state");
  if (v11 == (id)1)
  {
    if (v10 > 6)
    {
      if (v10 == 7)
      {
        v18 = 4;
        goto LABEL_27;
      }
      if (v10 != 11)
      {
LABEL_20:
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100056A90);
        v19 = (id)qword_100068950;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138412802;
          v21 = v8;
          v22 = 2048;
          v23 = v10;
          v24 = 2048;
          v25 = -[MIBUMainController state](v8, "state");
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Received command %ld at state %ld; resetting idle timer...",
            (uint8_t *)&v20,
            0x20u);
        }

        -[MIBUMainController _startIdleTimerForState:](v8, "_startIdleTimerForState:", -[MIBUMainController state](v8, "state"));
        goto LABEL_28;
      }
      -[MIBUMainController _stopIdleTimer](v8, "_stopIdleTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("TimeStamp")));

      -[MIBUMainController _setSystemTime:](v8, "_setSystemTime:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operationFactory](v8, "operationFactory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "buildOperationFromCode:andDelegate:", 2, v8));
      -[MIBUMainController setOperation:](v8, "setOperation:", v15);
    }
    else
    {
      if (!v10)
        goto LABEL_28;
      if (v10 != 2)
        goto LABEL_20;
      -[MIBUMainController _stopIdleTimer](v8, "_stopIdleTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("TimeStamp")));

      -[MIBUMainController _setSystemTime:](v8, "_setSystemTime:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operationFactory](v8, "operationFactory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "buildOperationFromCode:andDelegate:", 1, v8));
      -[MIBUMainController setOperation:](v8, "setOperation:", v15);
    }

    v18 = 2;
LABEL_27:
    -[MIBUMainController _transitionToState:error:](v8, "_transitionToState:error:", v18, 0);
    goto LABEL_28;
  }
  if (v11 == (id)3)
  {
    if (v10 != 3)
    {
      if (v10 != 6)
        goto LABEL_28;
      goto LABEL_20;
    }
    v18 = 1;
    goto LABEL_27;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056A70);
  v16 = (id)qword_100068950;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412802;
    v21 = v8;
    v22 = 2048;
    v23 = v10;
    v24 = 2048;
    v25 = -[MIBUMainController state](v8, "state");
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@: Nothing to do for cmd %lu at state %lu", (uint8_t *)&v20, 0x20u);
  }

LABEL_28:
  objc_sync_exit(v8);

}

- (void)didStopHeartbeat
{
  MIBUMainController *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  if ((id)-[MIBUMainController state](v2, "state") == (id)4)
  {
    -[MIBUMainController _transitionToState:error:](v2, "_transitionToState:error:", 5, 0);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056AB0);
    v3 = (id)qword_100068950;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10003C408((uint64_t)&v4, -[MIBUMainController state](v2, "state"), v3);

  }
  objc_sync_exit(v2);

}

- (void)operationFinishedWithError:(id)a3
{
  id v4;
  MIBUMainController *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056AD0);
  v6 = (id)qword_100068950;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](v5, "operation"));
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ finished with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  if ((id)-[MIBUMainController state](v5, "state") == (id)2)
    -[MIBUMainController _transitionToState:error:](v5, "_transitionToState:error:", 3, 0);
  objc_sync_exit(v5);

}

- (void)handleIdleTimer:(id)a3
{
  id v4;
  MIBUMainController *v5;
  void *v6;
  NSObject *v7;
  signed int v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  _BYTE v22[14];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056AF0);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Idle timer fired!", buf, 2u);
  }
  -[MIBUMainController _stopIdleTimer](v5, "_stopIdleTimer");
  v8 = objc_msgSend(v6, "intValue");
  if ((id)-[MIBUMainController state](v5, "state") != (id)v8)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056B10);
    v13 = (id)qword_100068950;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[MIBUMainController state](v5, "state");
      v15 = objc_msgSend(v6, "intValue");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v22 = v14;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Current state %lu != launch state %d, device is not idle", buf, 0x12u);
    }

    goto LABEL_17;
  }
  if (objc_msgSend(v6, "unsignedIntValue") == 3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056B30);
    v9 = (id)qword_100068950;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "intValue");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v22 = v10;
      *(_WORD *)&v22[4] = 2048;
      *(_QWORD *)&v22[6] = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timed out in state %d, moving to state %lu", buf, 0x12u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController nfcController](v5, "nfcController"));
    objc_msgSend(v11, "terminate:", 0);

    -[MIBUMainController _transitionToState:error:](v5, "_transitionToState:error:", 1, 0);
    v12 = 0;
    goto LABEL_18;
  }
  if ((id)-[MIBUMainController state](v5, "state") == (id)5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056B70);
    v16 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v22 = 5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device already in cleanup state: %lu, no cleanup", buf, 0xCu);
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056B50);
  v17 = (id)qword_100068950;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v6, "intValue");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cleaning up after idling in state: %d...", buf, 8u);
  }

  v20 = 0;
  -[MIBUMainController _transitionToState:error:](v5, "_transitionToState:error:", 5, &v20);
  v12 = v20;
  if (v12)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056B90);
    v19 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to cleanup device with error: %{public}@; restarting timer",
        buf,
        0xCu);
    }
    -[MIBUMainController _startIdleTimerForState:](v5, "_startIdleTimerForState:", (int)objc_msgSend(v6, "intValue"));
  }
LABEL_18:

  objc_sync_exit(v5);
}

- (void)_start:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  self->_running = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operationFactory](self, "operationFactory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildCurrentOperationWithDelegate:", self));
  -[MIBUMainController setOperation:](self, "setOperation:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](self, "operation"));
  if (v7)
    v8 = 2;
  else
    v8 = 1;
  -[MIBUMainController _transitionToState:error:](self, "_transitionToState:error:", v8, a3);
}

- (void)_transitionToState:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  unint64_t v34;
  void *v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;

  if (!-[MIBUMainController state](self, "state"))
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController stateTransitionTable](self, "stateTransitionTable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUMainController state](self, "state")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

  if (!v9)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056BB0);
    v38 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C4D0(v38);
    goto LABEL_48;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056BD0);
    v39 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C550(v39);
LABEL_48:

    v19 = 0;
    goto LABEL_37;
  }

LABEL_5:
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056BF0);
  v12 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_opt_class(self);
    v15 = v14;
    *(_DWORD *)buf = 138543874;
    v44 = (unint64_t)v14;
    v45 = 2048;
    v46 = -[MIBUMainController state](self, "state");
    v47 = 2048;
    v48 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: changing device state from %lu to %lu", buf, 0x20u);

  }
  switch(a3)
  {
    case 1uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](self, "operation"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](self, "operation"));
        objc_msgSend(v17, "terminateNow");

        -[MIBUMainController setOperation:](self, "setOperation:", 0);
      }
      -[MIBUMainController _acquireTransaction](self, "_acquireTransaction");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController nfcController](self, "nfcController"));
      v42 = 0;
      objc_msgSend(v18, "start:", &v42);
      v19 = v42;

      -[MIBUMainController _startIdleTimerForState:](self, "_startIdleTimerForState:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](self, "deviceDelegate"));
      objc_msgSend(v20, "enableCarrierMode");
      goto LABEL_27;
    case 2uLL:
      -[MIBUMainController _stopIdleTimer](self, "_stopIdleTimer");
      -[MIBUMainController _acquirePowerAssertion](self, "_acquirePowerAssertion");
      -[MIBUMainController setDisableCarrierMode:](self, "setDisableCarrierMode:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](self, "operation"));
      objc_msgSend(v22, "resume");

      goto LABEL_20;
    case 3uLL:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController nfcController](self, "nfcController"));
      v41 = 0;
      objc_msgSend(v23, "start:", &v41);
      v19 = v41;

      -[MIBUMainController _startIdleTimerForState:](self, "_startIdleTimerForState:", 3);
      goto LABEL_28;
    case 4uLL:
      -[MIBUMainController _stopIdleTimer](self, "_stopIdleTimer");
      -[MIBUMainController setShutDownReady:](self, "setShutDownReady:", 1);
      -[MIBUMainController setDisableCarrierMode:](self, "setDisableCarrierMode:", 1);
      goto LABEL_20;
    case 5uLL:
      -[MIBUMainController _stopIdleTimer](self, "_stopIdleTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](self, "operation"));

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController operation](self, "operation"));
        objc_msgSend(v25, "terminateNow");

        -[MIBUMainController setOperation:](self, "setOperation:", 0);
      }
      -[MIBUMainController _releaseTransaction](self, "_releaseTransaction");
      -[MIBUMainController _releasePowerAssertion](self, "_releasePowerAssertion");
      if (-[MIBUMainController disableCarrierMode](self, "disableCarrierMode"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](self, "deviceDelegate"));
        objc_msgSend(v26, "disableCarrierMode");

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController nfcController](self, "nfcController"));
      v40 = 0;
      objc_msgSend(v27, "terminate:", &v40);
      v19 = v40;

      if (-[MIBUMainController shutDownReady](self, "shutDownReady"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](self, "deviceDelegate"));
        objc_msgSend(v28, "removePowerLog");

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](self, "deviceDelegate"));
        objc_msgSend(v29, "setShelfLifeMode");

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](self, "deviceDelegate"));
        objc_msgSend(v20, "shutdown");
LABEL_27:

      }
      goto LABEL_28;
    default:
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100056C10);
      v21 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003C444(v21, self);
LABEL_20:
      v19 = 0;
LABEL_28:
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100056C30);
      v30 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = (void *)objc_opt_class(self);
        v33 = v32;
        v34 = -[MIBUMainController state](self, "state");
        *(_DWORD *)buf = 138543874;
        v44 = (unint64_t)v32;
        v45 = 2048;
        v46 = v34;
        v47 = 2048;
        v48 = a3;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: state changed from %lu to %lu", buf, 0x20u);

      }
      -[MIBUMainController setState:](self, "setState:", a3);
      if (v19)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100056C50);
        v35 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        {
          v36 = v35;
          v37 = -[MIBUMainController state](self, "state");
          *(_DWORD *)buf = 134218498;
          v44 = a3;
          v45 = 2048;
          v46 = v37;
          v47 = 2114;
          v48 = (unint64_t)v19;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to transition to state: %ld; current device state is: %ld; error: %{public}@",
            buf,
            0x20u);

        }
      }
      break;
  }
LABEL_37:
  if (a4)
    *a4 = objc_retainAutorelease(v19);

}

- (id)_getStateTransitionTable
{
  _QWORD v3[6];
  _QWORD v4[6];

  v3[0] = &off_10005BFC8;
  v3[1] = &off_10005BFE0;
  v4[0] = &__NSArray0__struct;
  v4[1] = &off_10005D028;
  v3[2] = &off_10005C0E8;
  v3[3] = &off_10005C0D0;
  v4[2] = &off_10005D040;
  v4[3] = &off_10005D058;
  v3[4] = &off_10005C118;
  v3[5] = &off_10005C100;
  v4[4] = &off_10005D070;
  v4[5] = &__NSArray0__struct;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 6));
}

- (void)_startIdleTimerForState:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001B624;
  v3[3] = &unk_1000569D0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_stopIdleTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController idleTimer](self, "idleTimer"));

  if (v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056C90);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping Idle Timer...", v6, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController idleTimer](self, "idleTimer"));
    objc_msgSend(v5, "invalidate");

    -[MIBUMainController setIdleTimer:](self, "setIdleTimer:", 0);
  }
}

- (void)_acquireTransaction
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController transaction](self, "transaction"));

  if (!v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056CB0);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Acquiring transaction...", v6, 2u);
    }
    v5 = (void *)os_transaction_create("Performing In Box Update Operations");
    -[MIBUMainController setTransaction:](self, "setTransaction:", v5);

  }
}

- (void)_releaseTransaction
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056CD0);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing transaction...", v4, 2u);
  }
  -[MIBUMainController setTransaction:](self, "setTransaction:", 0);
}

- (BOOL)_acquirePowerAssertion
{
  NSObject *v3;
  IOReturn v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  IOReturn v9;
  NSObject *v10;
  int v11;
  unsigned int v12;

  if (-[MIBUMainController powerAssertionID](self, "powerAssertionID"))
    return 1;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056CF0);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Acquiring power assertion...", (uint8_t *)&v11, 2u);
  }
  v4 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, CFSTR("com.apple.inboxupdaterd"), &self->_powerAssertionID);
  if (!v4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056D30);
    v5 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = -[MIBUMainController powerAssertionID](self, "powerAssertionID");
      v11 = 67109120;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Acquired power assertion ID: %u", (uint8_t *)&v11, 8u);

    }
    return 1;
  }
  v9 = v4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056D10);
  v10 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to acquire power assertion with status: 0x%x", (uint8_t *)&v11, 8u);
  }
  -[MIBUMainController setPowerAssertionID:](self, "setPowerAssertionID:", 0);
  return 0;
}

- (void)_releasePowerAssertion
{
  void *v3;
  NSObject *v4;
  IOReturn v5;
  NSObject *v6;
  int v7;
  unsigned int v8;

  if (-[MIBUMainController powerAssertionID](self, "powerAssertionID"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056D50);
    v3 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v7 = 67109120;
      v8 = -[MIBUMainController powerAssertionID](self, "powerAssertionID");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion ID: %u ...", (uint8_t *)&v7, 8u);

    }
    v5 = IOPMAssertionRelease(-[MIBUMainController powerAssertionID](self, "powerAssertionID"));
    -[MIBUMainController setPowerAssertionID:](self, "setPowerAssertionID:", 0);
    if (v5)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100056D70);
      v6 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 67109120;
        v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to release power assertion with status: 0x%x", (uint8_t *)&v7, 8u);
      }
    }
  }
}

- (void)_setSystemTime:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;

  v4 = a3;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056D90);
  v5 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v17 = 134217984;
    v18 = objc_msgSend(v4, "longValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting system time stamp: %lu", (uint8_t *)&v17, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUMainController deviceDelegate](self, "deviceDelegate"));
  v8 = objc_msgSend(v7, "setSystemTime:", objc_msgSend(v4, "longValue"));

  if ((v8 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056DB0);
    v9 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C5D0(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (BOOL)running
{
  return self->_running;
}

- (MIBUNFCController)nfcController
{
  return self->_nfcController;
}

- (void)setNfcController:(id)a3
{
  objc_storeStrong((id *)&self->_nfcController, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (MIBUOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (PCPersistentTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (double)idleTimeInterval
{
  return self->_idleTimeInterval;
}

- (void)setIdleTimeInterval:(double)a3
{
  self->_idleTimeInterval = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (MIBUDeviceControllerDelegate)deviceDelegate
{
  return self->_deviceDelegate;
}

- (void)setDeviceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDelegate, a3);
}

- (MIBUOperationProducerProtocol)operationFactory
{
  return self->_operationFactory;
}

- (void)setOperationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_operationFactory, a3);
}

- (NSDictionary)stateTransitionTable
{
  return self->_stateTransitionTable;
}

- (void)setStateTransitionTable:(id)a3
{
  objc_storeStrong((id *)&self->_stateTransitionTable, a3);
}

- (BOOL)shutDownReady
{
  return self->_shutDownReady;
}

- (void)setShutDownReady:(BOOL)a3
{
  self->_shutDownReady = a3;
}

- (BOOL)disableCarrierMode
{
  return self->_disableCarrierMode;
}

- (void)setDisableCarrierMode:(BOOL)a3
{
  self->_disableCarrierMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitionTable, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_deviceDelegate, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_nfcController, 0);
}

@end
