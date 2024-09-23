void sub_100001140(id a1)
{
  DPCDefaults *v1;
  void *v2;

  v1 = objc_alloc_init(DPCDefaults);
  v2 = (void *)qword_100012EB0;
  qword_100012EB0 = (uint64_t)v1;

}

void sub_100001A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001A28(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint8_t v10[16];

  v2 = sub_100002F3C((uint64_t)off_100012CB8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Fired Absence event", v10, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "detectedNewEventBlock"));
  v5[2](v5, 2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v9, "setLastAbsenceEventTimestamp:", v8);

}

void sub_1000029E4(id a1)
{
  DPCTelemetry *v1;
  void *v2;

  v1 = objc_alloc_init(DPCTelemetry);
  v2 = (void *)qword_100012EC0;
  qword_100012EC0 = (uint64_t)v1;

}

id sub_100002F3C(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002FB0;
  block[3] = &unk_10000C560;
  block[4] = a1;
  if (qword_100012ED0 != -1)
    dispatch_once(&qword_100012ED0, block);
  return (id)qword_100012EC8;
}

void sub_100002FB0(uint64_t a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.devicepresence", *(const char **)(a1 + 32));
  v2 = (void *)qword_100012EC8;
  qword_100012EC8 = (uint64_t)v1;

}

void sub_10000301C(id a1)
{
  DPCDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(DPCDaemon);
  v2 = (void *)qword_100012EE0;
  qword_100012EE0 = (uint64_t)v1;

}

void sub_1000039A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  id *v23;
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1000039F8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  id *v5;
  id v6;
  int v7;
  id v8;

  v2 = sub_100002F3C((uint64_t)off_100012CB8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 138412290;
    v8 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "connection %@ invalid", (uint8_t *)&v7, 0xCu);

  }
  v5 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(v5[6], "lock");
    objc_msgSend(v5[7], "removeObject:", v6);
    objc_msgSend(v5[6], "unlock");
    if (objc_msgSend(v5, "checkIfShouldShutdown"))
      objc_msgSend(v5, "shutdownTheDetection");
  }

}

void sub_100003B10(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  id *v5;
  id v6;
  int v7;
  id v8;

  v2 = sub_100002F3C((uint64_t)off_100012CB8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 138412290;
    v8 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "connection %@ interrupted", (uint8_t *)&v7, 0xCu);

  }
  v5 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(v5[6], "lock");
    objc_msgSend(v5[7], "removeObject:", v6);
    objc_msgSend(v5[6], "unlock");
    if (objc_msgSend(v5, "checkIfShouldShutdown"))
      objc_msgSend(v5, "shutdownTheDetection");
  }

}

void sub_100003D7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003E98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003F74(uint64_t a1)
{
  id *v2;
  _QWORD v3[4];
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000040C0;
  v7[3] = &unk_10000C5D0;
  v2 = (id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDetectedNewEventBlock:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004108;
  v5[3] = &unk_10000C5D0;
  objc_copyWeak(&v6, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDetectedNewErrorBlock:", v5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004214;
  v3[3] = &unk_10000C5D0;
  objc_copyWeak(&v4, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDetectedNewWatchStatusEventBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void sub_10000408C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000040C0(uint64_t a1, uint64_t a2)
{
  double v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[8] = a2;
  LODWORD(v3) = 1065185444;
  objc_msgSend(WeakRetained, "notifyNewEvents:probability:", a2, v3);

}

void sub_100004108(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = WeakRetained[7];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(WeakRetained, "notifyConnection:withError:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), a2, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void sub_100004214(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyNewWatchStatusEvents:", a2);

}

void sub_1000044A8()
{
  id v0;
  NSObject *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v0 = sub_100002F3C((uint64_t)off_100012CB8);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "capture sigterm, going to release daemon object...", buf, 2u);
  }

  v2 = (void *)qword_100012EF0;
  qword_100012EF0 = 0;

  v3 = sub_100002F3C((uint64_t)off_100012CB8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "daemon object set to nil...", v5, 2u);
  }

}

uint64_t start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = objc_autoreleasePoolPush();
  if (!qword_100012EF0)
  {
    v1 = objc_claimAutoreleasedReturnValue(+[DPCDaemon sharedInstance](DPCDaemon, "sharedInstance"));
    v2 = (void *)qword_100012EF0;
    qword_100012EF0 = v1;

  }
  objc_autoreleasePoolPop(v0);
  signal(15, (void (__cdecl *)(int))sub_1000044A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v3, "run");

  return 0;
}

void sub_1000045F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100004828(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveNRDevice");
}

void sub_100004EA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005058(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "resetBT");
  objc_msgSend(*(id *)(a1 + 32), "_stopWristMonitoring");
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "reset");

}

void sub_10000535C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100005378(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "detectWatchWristStateEvent:", a2);

}

void sub_10000546C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005490(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = sub_100002F3C((uint64_t)off_100012CB8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received switch watch notification...", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateActiveNRDevice");

}

void sub_10000565C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000062D8(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned int v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = objc_msgSend(v2, "isInRSSIStreamingMode");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
    v5 = objc_msgSend(v4, "isInRSSIMode");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "disableRSSIStatisticsDetection");
      v6 = *(_QWORD **)(a1 + 32);
      v8 = v6[1];
      v7 = v6[2];
      v12 = (id)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdD1")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMAX")));
      objc_msgSend(v6, "changeRSSIStatisticsDetection:manager:closer:further:maskDecision:", v7, v8, v9, v11, 1);

    }
  }
}

void sub_10000644C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = objc_msgSend(v2, "isInRSSIStreamingMode");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
    v5 = objc_msgSend(v4, "isInRSSIMode");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "disableRSSIStatisticsDetection");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdD2")));
      v8 = objc_msgSend(v7, "intValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
      v10 = v8 - objc_msgSend(v9, "D2ThresholdMargin");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NSNumberForDefault:", CFSTR("DPCDefaultsSessionBasedAdaptiveRSSICapValue")));
      v13 = objc_msgSend(v12, "intValue");

      if ((int)v10 <= (int)v13)
        v14 = v13;
      else
        v14 = v10;
      v15 = *(_QWORD **)(a1 + 32);
      v17 = v15[1];
      v16 = v15[2];
      v20 = (id)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMIN")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
      objc_msgSend(v15, "changeRSSIStatisticsDetection:manager:closer:further:maskDecision:", v16, v17, v18, v19, 0);

    }
  }
}

void sub_10000664C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  v3 = objc_msgSend(v2, "isInRSSIStreamingMode");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
    v5 = objc_msgSend(v4, "isInRSSIMode");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
      objc_msgSend(v6, "setIsInDiscoveryMode:", 1);

      objc_msgSend(*(id *)(a1 + 32), "disableRSSIStatisticsDetection");
      v7 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v7 + 16))
      {
        if (*(_QWORD *)(v7 + 8))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));

          if (v8)
          {
            v9 = *(_QWORD **)(a1 + 32);
            v11 = v9[1];
            v10 = v9[2];
            v15 = (id)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMIN")));
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDDiscovery")));
            objc_msgSend(v9, "changeRSSIStatisticsDetection:manager:closer:further:maskDecision:", v10, v11, v12, v14, 1);

          }
        }
      }
    }
  }
}

void sub_10000694C(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = sub_100002F3C((uint64_t)off_100012CB8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "deviceIsConnectedBluetooth isBluetoothConnected: %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(WeakRetained, "watchConnectivityChanges");
}

void sub_100007124(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007134(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Received BT disconnected during the start, going to ignore", v1, 2u);
}

void sub_100007174(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NRDevice vanished...", v1, 2u);
}

void sub_1000071B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007124((void *)&_mh_execute_header, a1, a3, "macAddress not available yet: %@", a5, a6, a7, a8, 2u);
}

void sub_100007220(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007124((void *)&_mh_execute_header, a2, a3, "CBManager unable to retrieve peripheral at MAC: %@, the bluetooth might not be ready", a5, a6, a7, a8, 2u);
}

id objc_msgSend_D2ThresholdMargin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "D2ThresholdMargin");
}

id objc_msgSend_NSNumberForDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSNumberForDefault:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__registerSwitchWatchNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerSwitchWatchNotification");
}

id objc_msgSend__setupOnWristMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupOnWristMonitoring");
}

id objc_msgSend__setupXPCListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupXPCListener");
}

id objc_msgSend__stopWristMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopWristMonitoring");
}

id objc_msgSend__updateActiveNRDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateActiveNRDevice");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_changeRSSIStatisticsDetection_manager_closer_further_maskDecision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeRSSIStatisticsDetection:manager:closer:further:maskDecision:");
}

id objc_msgSend_checkAndStartRSSIDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAndStartRSSIDetection");
}

id objc_msgSend_checkIfBluetoothPowerOff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIfBluetoothPowerOff");
}

id objc_msgSend_checkIfShouldShutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIfShouldShutdown");
}

id objc_msgSend_checkPolicyWithRSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkPolicyWithRSSI:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_connectToWatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToWatch");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentWatchWristState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentWatchWristState");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_detectWatchWristStateEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectWatchWristStateEvent:");
}

id objc_msgSend_detectedNewErrorBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectedNewErrorBlock");
}

id objc_msgSend_detectedNewEventBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectedNewEventBlock");
}

id objc_msgSend_detectedNewWatchStatusEventBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectedNewWatchStatusEventBlock");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableRSSIStatisticsDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableRSSIStatisticsDetection");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_forceNotifyNewEvents_probability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceNotifyNewEvents:probability:");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActivePairedDevice");
}

id objc_msgSend_getCurrentWatchMACAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentWatchMACAddress");
}

id objc_msgSend_getPairedWatchWristStateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairedWatchWristStateWithCompletionHandler:");
}

id objc_msgSend_hasBeenConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasBeenConnected");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithDeviceIdentifier_delegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:delegate:queue:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStateMachine:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidateAbsenceEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAbsenceEvent");
}

id objc_msgSend_isCloudConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudConnected");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInDiscoveryMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInDiscoveryMode");
}

id objc_msgSend_isInRSSIMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInRSSIMode");
}

id objc_msgSend_isInRSSIStreamingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInRSSIStreamingMode");
}

id objc_msgSend_isMonitoringAbsence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMonitoringAbsence");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearby");
}

id objc_msgSend_isRSSIModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRSSIModeEnabled");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isRunningRSSIStatDetecion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningRSSIStatDetecion");
}

id objc_msgSend_isSwitchingWatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSwitchingWatch");
}

id objc_msgSend_lastAbsenceEventTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastAbsenceEventTimestamp");
}

id objc_msgSend_lastPresenceEventTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPresenceEventTimestamp");
}

id objc_msgSend_linkType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkType");
}

id objc_msgSend_loadPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadPolicy");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_monitorPairedWatchWristStateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorPairedWatchWristStateWithCompletionHandler:");
}

id objc_msgSend_monitorRSSIAbsence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorRSSIAbsence");
}

id objc_msgSend_monitorRSSIPresence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorRSSIPresence");
}

id objc_msgSend_newDeviceIdentifierWithBluetoothUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDeviceIdentifierWithBluetoothUUID:");
}

id objc_msgSend_newErrorDetected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newErrorDetected:");
}

id objc_msgSend_newWatchPresenceEvent_probability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWatchPresenceEvent:probability:");
}

id objc_msgSend_newWatchStatusEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWatchStatusEvent:");
}

id objc_msgSend_notifyConnection_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyConnection:withError:");
}

id objc_msgSend_notifyNewEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyNewEvent:");
}

id objc_msgSend_notifyNewEvents_probability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyNewEvents:probability:");
}

id objc_msgSend_notifyNewWatchStatusEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyNewWatchStatusEvents:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onRSSIChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onRSSIChange:");
}

id objc_msgSend_onWatchConnectivityChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onWatchConnectivityChange:");
}

id objc_msgSend_onWristStateChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onWristStateChange:");
}

id objc_msgSend_prestartCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prestartCheck");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerError:");
}

id objc_msgSend_registerWatchConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWatchConnectivity:");
}

id objc_msgSend_registerWatchEvent_rssiValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWatchEvent:rssiValue:");
}

id objc_msgSend_registerWatchSwitch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWatchSwitch");
}

id objc_msgSend_registerWatchWristEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWatchWristEvent:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_requireRSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireRSSI");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAll");
}

id objc_msgSend_resetBT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetBT");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrievePeripheralWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePeripheralWithAddress:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runRSSIAdapter_RSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRSSIAdapter:RSSI:");
}

id objc_msgSend_scheduleSendAbsenceEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSendAbsenceEvent");
}

id objc_msgSend_sendWatchWristStateEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendWatchWristStateEvent:");
}

id objc_msgSend_setCurrentWatchWristState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentWatchWristState:");
}

id objc_msgSend_setD1ThresholdMargin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setD1ThresholdMargin:");
}

id objc_msgSend_setD2ThresholdMargin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setD2ThresholdMargin:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetectedNewErrorBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectedNewErrorBlock:");
}

id objc_msgSend_setDetectedNewEventBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectedNewEventBlock:");
}

id objc_msgSend_setDetectedNewWatchStatusEventBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectedNewWatchStatusEventBlock:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setEnabledStreamingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabledStreamingMode:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHasBeenConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasBeenConnected:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsBluetoothConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsBluetoothConnected:");
}

id objc_msgSend_setIsInDiscoveryMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInDiscoveryMode:");
}

id objc_msgSend_setIsInRSSIMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInRSSIMode:");
}

id objc_msgSend_setIsInRSSIStreamingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInRSSIStreamingMode:");
}

id objc_msgSend_setIsMonitoringAbsence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsMonitoringAbsence:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setIsRunningRSSIStatDetecion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRunningRSSIStatDetecion:");
}

id objc_msgSend_setIsSwitchingWatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSwitchingWatch:");
}

id objc_msgSend_setIsWatchConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsWatchConnected:");
}

id objc_msgSend_setLastAbsenceEventTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastAbsenceEventTimestamp:");
}

id objc_msgSend_setLastPresenceEventTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPresenceEventTimestamp:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRSSIStatisticsDetection_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRSSIStatisticsDetection:options:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequireRSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequireRSSI:");
}

id objc_msgSend_setStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateMachine:");
}

id objc_msgSend_setTelemetry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelemetry:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shutdownTheDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdownTheDetection");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startTheDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTheDetection");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_telemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetry");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_watchConnectivityChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchConnectivityChanges");
}
