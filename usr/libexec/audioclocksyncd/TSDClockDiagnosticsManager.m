@implementation TSDClockDiagnosticsManager

- (TSDClockDiagnosticsManager)init
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  NSObject *v9;
  dispatch_source_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD block[4];
  id v36;
  _QWORD handler[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  objc_super v47;
  _BYTE location[12];
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;

  v47.receiver = self;
  v47.super_class = (Class)TSDClockDiagnosticsManager;
  v2 = -[TSDClockDiagnosticsManager init](&v47, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    if (*((_QWORD *)v2 + 3))
    {
      v5 = objc_alloc_init((Class)NSMutableDictionary);
      v6 = (void *)*((_QWORD *)v2 + 4);
      *((_QWORD *)v2 + 4) = v5;

      if (*((_QWORD *)v2 + 4))
      {
        v7 = dispatch_queue_create("com.apple.timesyncd.statistics", 0);
        v8 = (void *)*((_QWORD *)v2 + 1);
        *((_QWORD *)v2 + 1) = v7;

        v9 = *((_QWORD *)v2 + 1);
        if (v9)
        {
          v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v9);
          v11 = (void *)*((_QWORD *)v2 + 2);
          *((_QWORD *)v2 + 2) = v10;

          if (*((_QWORD *)v2 + 2))
          {
            v12 = objc_msgSend(objc_alloc((Class)IOKNotificationPort), "initOnDispatchQueue:", *((_QWORD *)v2 + 1));
            v13 = (void *)*((_QWORD *)v2 + 5);
            *((_QWORD *)v2 + 5) = v12;

            if (*((_QWORD *)v2 + 5))
            {
              objc_initWeak((id *)location, v2);
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncService")));
              v15 = *((_QWORD *)v2 + 5);
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10000A06C;
              v45[3] = &unk_10003C460;
              objc_copyWeak(&v46, (id *)location);
              v16 = IOKMatchedNotification;
              v17 = objc_claimAutoreleasedReturnValue(+[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:](IOKService, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:", IOKMatchedNotification, v14, v15, 0, v45));
              v18 = (void *)*((_QWORD *)v2 + 6);
              *((_QWORD *)v2 + 6) = v17;

              v19 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncService")));
              v20 = *((_QWORD *)v2 + 5);
              v43[0] = _NSConcreteStackBlock;
              v43[1] = 3221225472;
              v43[2] = sub_10000A300;
              v43[3] = &unk_10003C460;
              objc_copyWeak(&v44, (id *)location);
              v21 = IOKTerminatedNotification;
              v22 = objc_claimAutoreleasedReturnValue(+[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:](IOKService, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:", IOKTerminatedNotification, v19, v20, 0, v43));
              v23 = (void *)*((_QWORD *)v2 + 7);
              *((_QWORD *)v2 + 7) = v22;

              v24 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncNetworkPort")));
              v25 = *((_QWORD *)v2 + 5);
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472;
              v41[2] = sub_10000A594;
              v41[3] = &unk_10003C460;
              objc_copyWeak(&v42, (id *)location);
              v26 = objc_claimAutoreleasedReturnValue(+[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:](IOKService, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:", v16, v24, v25, 0, v41));
              v27 = (void *)*((_QWORD *)v2 + 8);
              *((_QWORD *)v2 + 8) = v26;

              v28 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncNetworkPort")));
              v29 = *((_QWORD *)v2 + 5);
              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472;
              v39[2] = sub_10000A774;
              v39[3] = &unk_10003C460;
              objc_copyWeak(&v40, (id *)location);
              v30 = objc_claimAutoreleasedReturnValue(+[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:](IOKService, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:", v21, v28, v29, 0, v39));
              v31 = (void *)*((_QWORD *)v2 + 9);
              *((_QWORD *)v2 + 9) = v30;

              v32 = *((_QWORD *)v2 + 2);
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_10000A954;
              handler[3] = &unk_10003C488;
              objc_copyWeak(&v38, (id *)location);
              dispatch_source_set_event_handler(v32, handler);
              dispatch_source_set_timer(*((dispatch_source_t *)v2 + 2), 0, 0xDF8475800uLL, 0);
              dispatch_resume(*((dispatch_object_t *)v2 + 2));
              v33 = *((_QWORD *)v2 + 1);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10000AB90;
              block[3] = &unk_10003C4B0;
              v2 = v2;
              v36 = v2;
              dispatch_async(v33, block);

              objc_destroyWeak(&v38);
              objc_destroyWeak(&v40);
              objc_destroyWeak(&v42);
              objc_destroyWeak(&v44);
              objc_destroyWeak(&v46);
              objc_destroyWeak((id *)location);
              return (TSDClockDiagnosticsManager *)v2;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316418;
              *(_QWORD *)&location[4] = "_notificationPort != nil";
              v49 = 2048;
              v50 = 0;
              v51 = 2048;
              v52 = 0;
              v53 = 2080;
              v54 = "";
              v55 = 2080;
              v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
              v57 = 1024;
              v58 = 63;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316418;
            *(_QWORD *)&location[4] = "_statisticsTimer != nil";
            v49 = 2048;
            v50 = 0;
            v51 = 2048;
            v52 = 0;
            v53 = 2080;
            v54 = "";
            v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
            v57 = 1024;
            v58 = 60;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136316418;
          *(_QWORD *)&location[4] = "_statisticsQueue != nil";
          v49 = 2048;
          v50 = 0;
          v51 = 2048;
          v52 = 0;
          v53 = 2080;
          v54 = "";
          v55 = 2080;
          v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
          v57 = 1024;
          v58 = 57;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136316418;
        *(_QWORD *)&location[4] = "_networkPorts != nil";
        v49 = 2048;
        v50 = 0;
        v51 = 2048;
        v52 = 0;
        v53 = 2080;
        v54 = "";
        v55 = 2080;
        v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
        v57 = 1024;
        v58 = 54;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(_QWORD *)&location[4] = "_statistics != nil";
      v49 = 2048;
      v50 = 0;
      v51 = 2048;
      v52 = 0;
      v53 = 2080;
      v54 = "";
      v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
      v57 = 1024;
      v58 = 51;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
    }

    return 0;
  }
  return (TSDClockDiagnosticsManager *)v2;
}

- (BOOL)addStatisticsWithIdentifier:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  TSDClockStatistics *v7;
  NSMutableDictionary *statistics;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:"));
  v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statistics, "objectForKeyedSubscript:", v5));
  if (!v6)
  {
    v7 = -[TSDClockStatistics initWithClockIdentifier:]([TSDClockStatistics alloc], "initWithClockIdentifier:", a3);
    if (v7)
    {
      statistics = self->_statistics;
      if (statistics)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](statistics, "setObject:forKeyedSubscript:", v7, v5);
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316418;
        v12 = "_statistics != nil";
        v13 = 2048;
        v14 = 0;
        v15 = 2048;
        v16 = 0;
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
        v21 = 1024;
        v22 = 190;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
      }
    }
    v9 = 0;
    goto LABEL_7;
  }
  v7 = (TSDClockStatistics *)v6;
LABEL_6:
  v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)removeStatisticsWithIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statistics, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "finalizeClock");
    -[NSMutableDictionary removeObjectForKey:](self->_statistics, "removeObjectForKey:", v4);
  }

  return v6 != 0;
}

- (BOOL)addNetworkPortWithService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPPort gPTPPortWithService:](TSDgPTPPort, "gPTPPortWithService:", v4));
  v6 = objc_opt_class(TSDgPTPNetworkPort);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%016llx"), objc_msgSend(v4, "entryID")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_networkPorts, "objectForKeyedSubscript:", v8));

    if (!v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_networkPorts, "setObject:forKeyedSubscript:", v5, v8);
      objc_msgSend(v5, "addClient:", self);
      objc_msgSend(v5, "registerAsyncCallbackError:", 0);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "[networkPort isKindOfClass:[TSDgPTPNetworkPort class]]";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
      v21 = 1024;
      v22 = 228;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)removeNetworkPortWithService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%016llx"), objc_msgSend(a3, "entryID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_networkPorts, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_networkPorts, "objectForKeyedSubscript:", v4));
    objc_msgSend(v6, "deregisterAsyncCallbackError:", 0);
    objc_msgSend(v6, "removeClient:", self);
    -[NSMutableDictionary removeObjectForKey:](self->_networkPorts, "removeObjectForKey:", v4);

  }
  return v5 != 0;
}

- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4
{
  _BOOL4 v5;
  id v6;
  id v7;
  const char *v8;
  unsigned int v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a4;
    v7 = objc_msgSend(v6, "clockIdentifier");
    if (v5)
      v8 = "YES";
    else
      v8 = "NO";
    v9 = objc_msgSend(v6, "portNumber");

    v10 = 134218498;
    v11 = v7;
    v12 = 2080;
    v13 = v8;
    v14 = 1024;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: AS Capable %s on port %hu\n", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4
{
  _BOOL4 v5;
  id v6;
  id v7;
  const char *v8;
  unsigned int v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a4;
    v7 = objc_msgSend(v6, "clockIdentifier");
    if (v5)
      v8 = "YES";
    else
      v8 = "NO";
    v9 = objc_msgSend(v6, "portNumber");

    v10 = 134218498;
    v11 = v7;
    v12 = 2080;
    v13 = v8;
    v14 = 1024;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Administrative Enabled %s on port %hu\n", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  int v7;
  id v8;
  __int16 v9;
  unsigned int v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "clockIdentifier");
    v6 = objc_msgSend(v4, "portNumber");

    v7 = 134218240;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: MAC lookup timeout on port %hu\n", (uint8_t *)&v7, 0x12u);
  }
}

- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9
{
  id v15;
  id v16;
  unsigned int v17;
  int v18;
  id v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  unsigned int v33;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = a9;
    v16 = objc_msgSend(v15, "clockIdentifier");
    v17 = objc_msgSend(v15, "portNumber");

    v18 = 134219776;
    v19 = v16;
    v20 = 1024;
    v21 = v17;
    v22 = 2048;
    v23 = a3;
    v24 = 2048;
    v25 = a4;
    v26 = 2048;
    v27 = a5;
    v28 = 2048;
    v29 = a6;
    v30 = 2048;
    v31 = a7;
    v32 = 1024;
    v33 = a8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Sync timeout on port %hu with mean %llu median %llu stddev %llu min %llu max %llu num samples %u\n", (uint8_t *)&v18, 0x4Au);
  }
}

- (void)didTerminateServiceForPort:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  int v7;
  id v8;
  __int16 v9;
  unsigned int v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "clockIdentifier");
    v6 = objc_msgSend(v4, "portNumber");

    v7 = 134218240;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Terminate for port %hu\n", (uint8_t *)&v7, 0x12u);
  }
}

- (void)dealloc
{
  OS_dispatch_source *statisticsTimer;
  objc_super v4;

  statisticsTimer = self->_statisticsTimer;
  if (statisticsTimer)
    dispatch_source_cancel((dispatch_source_t)statisticsTimer);
  v4.receiver = self;
  v4.super_class = (Class)TSDClockDiagnosticsManager;
  -[TSDClockDiagnosticsManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portDepatureNotification, 0);
  objc_storeStrong((id *)&self->_portArrivalNotification, 0);
  objc_storeStrong((id *)&self->_clockDepatureNotification, 0);
  objc_storeStrong((id *)&self->_clockArrivalNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_networkPorts, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_statisticsTimer, 0);
  objc_storeStrong((id *)&self->_statisticsQueue, 0);
}

@end
