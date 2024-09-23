@implementation SystemDiagnosticLogAgentiOS

- (BOOL)_proximityTaskWithTimeout:(double)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[6];
  uint8_t buf[16];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dlopen(0, 2);
  if (!v5)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "couldn't get handle", buf, 2u);
    }

    goto LABEL_16;
  }
  dlerror();
  v6 = dlsym(v5, "PRCollectLogs");
  if (!v6)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Proximity API not found", buf, 2u);
    }

    dlclose(v5);
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Proximity API found", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004170;
  v13[3] = &unk_100068740;
  v13[4] = &v15;
  v13[5] = v6;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v13, a3))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Proxmitiy SPI timed out", buf, 2u);
    }

  }
  dlclose(v5);
  v9 = *((_BYTE *)v16 + 24) != 0;
LABEL_17:
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)springBoardStateDumpTaskWithTimeout:(double)a3
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (objc_opt_class(SBSStateDumpService, a2))
  {
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", &stru_100068780, a3))
    {
      return 1;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000348E8(v6, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000348B4(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0;
}

- (id)_AWDTaskWithTimeout:(double)a3
{
  NSObject *v4;
  id v5;
  dispatch_semaphore_t v7;
  id v8;
  dispatch_queue_global_t global_queue;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[16];
  _QWORD v31[4];
  NSObject *v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];

  if (&_AWDServerConsolidateDeviceDiagnostics)
  {
    v7 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x3032000000;
    v37 = sub_10000468C;
    v38 = sub_10000469C;
    v39 = 0;
    v8 = objc_alloc_init((Class)NSMutableArray);
    global_queue = dispatch_get_global_queue(25, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000046A4;
    v31[3] = &unk_1000687A8;
    v33 = buf;
    v4 = v7;
    v32 = v4;
    AWDServerConsolidateDeviceDiagnostics(2, v10, v31);

    if (a3 == -1.0)
    {
      v11 = -1;
    }
    else
    {
      if (a3 <= 0.0)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          v13 = "Unknown value for timeout specified. Returning";
          goto LABEL_25;
        }
LABEL_29:
        v5 = 0;
LABEL_30:

        _Block_object_dispose(buf, 8);
        goto LABEL_31;
      }
      v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    }
    if (dispatch_semaphore_wait(v4, v11))
    {
      v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        v13 = "Timed out waiting for AWD server.";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v30, 2u);
        goto LABEL_29;
      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v35 + 5), "objectForKey:", kAwdDiagnosticsFileArray));
      v15 = objc_opt_class(NSArray, v14);
      if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = v12;
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v12);
              v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
              v21 = objc_opt_class(NSString, v16);
              if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
              {
                v22 = sub_100006AFC(v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
                objc_msgSend(v8, "addObject:", v23, (_QWORD)v26);

              }
            }
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
          }
          while (v17);
        }

        v5 = v8;
        goto LABEL_30;
      }
      v24 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Invalid file list returned from AWD server.", v30, 2u);
      }

    }
    goto LABEL_29;
  }
  v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AWDServer SPI not available", buf, 2u);
  }
  v5 = 0;
LABEL_31:

  return v5;
}

- (BOOL)_BTPHYTaskWithTimeout:(double)a3
{
  NSObject *v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];
  _QWORD v9[6];
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  char v13;

  if (&_CoreCaptureControlCreate)
  {
    *(_QWORD *)buf = 0;
    v11 = buf;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004840;
    v9[3] = &unk_1000687D0;
    v9[4] = self;
    v9[5] = buf;
    v5 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v9, a3);
    v6 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished corecapture BTPHY SPI", v8, 2u);
    }

    if (!v11[24])
      v5 = 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreCapture SPI not available", buf, 2u);
    }

    return 0;
  }
  return v5;
}

- (BOOL)_networkRelayTaskWithTimeout:(double)a3 atDirectory:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void **v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;
  uint8_t v26[4];
  int v27;

  v6 = a4;
  v7 = v6;
  if (&_NRDiagnosticSaveNetworkRelayStatusToDirectory)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_100004B84;
    v19 = &unk_1000687F8;
    v21 = buf;
    v20 = v6;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", &v16, a3))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v16, v17, v18, v19));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v23[24];
        *(_DWORD *)v26 = 67109120;
        v27 = v11;
        v12 = "Did NRDiagnosticSaveNetworkRelayStatusToDirectory succeed %d";
        v13 = v10;
        v14 = 8;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, v26, v14);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v16, v17, v18, v19));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        v12 = "NRDiagnosticSaveNetworkRelayStatusToDirectory timed out.";
        v13 = v10;
        v14 = 2;
        goto LABEL_10;
      }
    }

    v9 = v23[24] != 0;
    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NetworkRelay SPI not available", buf, 2u);
  }

  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_basebandTSTriggerWithTimeout:(double)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  __int16 v9;

  if (&_PLSysdiagnoseTimeSensitivePhase)
  {
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", &stru_100068818, a3))
    {
      return 1;
    }
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v5 = "PLSysdiagnoseTimeSensitivePhase timed out.";
      v6 = (uint8_t *)&v8;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v5 = "PLSysdiagnoseTimeSensitivePhase SPI not available";
      v6 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }

  return 0;
}

- (BOOL)GEAvailabilityTaskWithDir:(id)a3 withTimeout:(double)a4
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
  v12[2] = sub_100004DFC;
  v12[3] = &unk_100068868;
  v12[4] = self;
  v14 = &v15;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("GEAvailability.log")));
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
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GEAvailability task SPI not available, timed out or couldn't create the dest file", v11, 2u);
    }

    v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)takeStackshotWithFlags:(unsigned int)a3 withTimeout:(double)a4
{
  _QWORD v5[5];
  unsigned int v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005180;
  v5[3] = &unk_100068890;
  v5[4] = self;
  v6 = a3;
  return +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v5, a4);
}

- (BOOL)ASPToolTrace:(id)a3 withTimeout:(double)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("asptool_trace.log")));
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:](self, "ASPToolGenericWithTimeout:forFile:andBlock:", v6, &stru_1000688D0, a4);

  return (char)self;
}

- (BOOL)getKeyboardPreferences:(id)a3 withTimeout:(double)a4
{
  id v6;
  unsigned __int8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  unsigned __int8 v14;
  NSObject *v15;
  uint8_t v17[8];
  _QWORD v18[5];
  _UNKNOWN **v19;
  _UNKNOWN **v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10000468C;
  v33 = sub_10000469C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10000468C;
  v27 = sub_10000469C;
  v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100005594;
  v18[3] = &unk_1000688F8;
  v18[4] = self;
  v19 = &off_10006A930;
  v21 = &v29;
  v22 = &v23;
  v20 = &off_10006A948;
  v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v18, a4);
  if ((v7 & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Couldn't retrieve the preferences within the required time", v17, 2u);
    }

  }
  if (objc_msgSend((id)v30[5], "count") || objc_msgSend((id)v24[5], "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30[5], "description"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.Preferences:\n"), "stringByAppendingString:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v24[5], "description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GlobalPreferences:\n"), "stringByAppendingString:", v11));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", v12));

  }
  else
  {
    v13 = CFSTR("Could not retrieve keyboard preferences.");
  }
  v14 = sub_100006A18(v6, (uint64_t)CFSTR("Keyboard_Preferences.txt"), v13);
  if ((v14 & 1) == 0)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Couldn't write keyboard preferences.", v17, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v7 & v14;
}

- (BOOL)getAccessibilityPreferences:(id)a3 withTimeout:(double)a4
{
  id v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  unsigned int v13;
  uint8_t buf[16];
  _QWORD v16[5];
  _UNKNOWN **v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10000468C;
  v30 = sub_10000469C;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10000468C;
  v24 = sub_10000469C;
  v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005874;
  v16[3] = &unk_100068920;
  v16[4] = self;
  v17 = &off_10006A960;
  v18 = &v26;
  v19 = &v20;
  v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:](SystemDiagnosticLogAgent, "_runBlock:withTimeout:", v16, a4);
  if ((v7 & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not retrieve accessibility preferences within the required time", buf, 2u);
    }

  }
  if (objc_msgSend((id)v27[5], "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "description"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.Accessibility:"), "stringByAppendingString:", v9));

  }
  else
  {
    v10 = CFSTR("Could not retrieve accessibility preferences.");
  }
  if (objc_msgSend((id)v21[5], "count"))
  {
    v11 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "description")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("com.apple.Accessibility.TouchAccommodations:\n%s"), -[__CFString UTF8String](v11, "UTF8String")));

    v10 = v11;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("Could not retrieve touch accommodations preferences.")));
  }

  v13 = v7 & sub_100006A18(v6, (uint64_t)CFSTR("Accessibility_Preferences.txt"), v12);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (void)processMessage:(id)a3 replyWith:(id)a4
{
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  double v12;
  SystemDiagnosticLogAgentiOS *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  double v19;
  SystemDiagnosticLogAgentiOS *v20;
  uint64_t v21;
  void *v22;
  double v23;
  const __CFString *v24;
  xpc_object_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  id v36;
  uint64_t v37;
  double v38;
  int v39;
  _BYTE v40[128];

  v6 = a4;
  v39 = -1;
  v37 = 0;
  v38 = 0.0;
  v36 = 0;
  v7 = -[SystemDiagnosticLogAgent parseLogAgentRequest:outputPath:timeout:taskType:startTimeClockNS:](self, "parseLogAgentRequest:outputPath:timeout:taskType:startTimeClockNS:", a3, &v36, &v38, &v39, &v37);
  v8 = v36;
  v9 = v8;
  if (v7)
  {
    switch(v39)
    {
      case 1:
        v10 = -[SystemDiagnosticLogAgentiOS getAccessibilityPreferences:withTimeout:](self, "getAccessibilityPreferences:withTimeout:", v8, v38);
        goto LABEL_76;
      case 2:
        v10 = -[SystemDiagnosticLogAgent ACLogsTaskWithDir:withTimeout:](self, "ACLogsTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 3:
        v10 = -[SystemDiagnosticLogAgent ASPToolTaskForDir:withTimeout:](self, "ASPToolTaskForDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 4:
        v10 = -[SystemDiagnosticLogAgent ASPMagazineTaskForDir:withTimeout:](self, "ASPMagazineTaskForDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 5:
        v10 = -[SystemDiagnosticLogAgent ASPToolSnapshotForDir:withTimeout:](self, "ASPToolSnapshotForDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 6:
        v10 = -[SystemDiagnosticLogAgentiOS ASPToolTrace:withTimeout:](self, "ASPToolTrace:withTimeout:", v8, v38);
        goto LABEL_76;
      case 7:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgentiOS _AWDTaskWithTimeout:](self, "_AWDTaskWithTimeout:", v38));
        goto LABEL_60;
      case 8:
        v10 = -[SystemDiagnosticLogAgent _backgroundPowerTaskForDir:withTimeout:](self, "_backgroundPowerTaskForDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 9:
        v10 = -[SystemDiagnosticLogAgent batteryHealthTaskWithDir:withTimeout:](self, "batteryHealthTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 10:
        v10 = -[SystemDiagnosticLogAgent batteryUITaskWithDir:withTimeout:](self, "batteryUITaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 11:
        v10 = -[SystemDiagnosticLogAgentiOS _BTPHYTaskWithTimeout:](self, "_BTPHYTaskWithTimeout:", v38);
        goto LABEL_76;
      case 12:
        v10 = -[SystemDiagnosticLogAgent getCloudKitPreferences:withTimeout:](self, "getCloudKitPreferences:withTimeout:", v8, v38);
        goto LABEL_76;
      case 13:
        v12 = v38;
        v13 = self;
        v14 = v9;
        v15 = 1;
        goto LABEL_19;
      case 14:
        self = (SystemDiagnosticLogAgentiOS *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent coreCaptureConfigTask:](self, "coreCaptureConfigTask:", v38));
        if (!self)
          goto LABEL_77;
        xpc_dictionary_set_value(v6, "replyDictionary", self);

        v16 = 0;
        v17 = 0;
        goto LABEL_72;
      case 15:
        v12 = v38;
        v13 = self;
        v14 = v9;
        v15 = 0;
LABEL_19:
        v10 = -[SystemDiagnosticLogAgent coreCaptureTaskWithDir:withTimeout:ofType:](v13, "coreCaptureTaskWithDir:withTimeout:ofType:", v14, v15, v12);
        goto LABEL_76;
      case 16:
        v10 = -[SystemDiagnosticLogAgent coreRepairDiagnosticTaskWithDir:withTimeout:](self, "coreRepairDiagnosticTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 18:
        v10 = -[SystemDiagnosticLogAgent DSCSYMTaskForDir:withTimeout:](self, "DSCSYMTaskForDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 20:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent excResourcePathsWithTimeout:](self, "excResourcePathsWithTimeout:", v38));
        goto LABEL_60;
      case 21:
        v10 = -[SystemDiagnosticLogAgent FDRDiagnosticTaskWithDir:withTimeout:](self, "FDRDiagnosticTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 23:
        v10 = -[SystemDiagnosticLogAgentiOS GEAvailabilityTaskWithDir:withTimeout:](self, "GEAvailabilityTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 25:
        v10 = -[SystemDiagnosticLogAgent HIDCrashlogsTaskWithDir:withTimeout:](self, "HIDCrashlogsTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 26:
        v10 = -[SystemDiagnosticLogAgentiOS getKeyboardPreferences:withTimeout:](self, "getKeyboardPreferences:withTimeout:", v8, v38);
        goto LABEL_76;
      case 27:
        v10 = -[SystemDiagnosticLogAgent _libNotifyTaskAtLocation:andTimeout:](self, "_libNotifyTaskAtLocation:andTimeout:", v8, v38);
        goto LABEL_76;
      case 28:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent _memoryExceptionsTaskWithTimeout:](self, "_memoryExceptionsTaskWithTimeout:", v38));
        goto LABEL_60;
      case 29:
        v10 = -[SystemDiagnosticLogAgent _memoryExceptionsListLogsTaskWithDir:withTimeout:](self, "_memoryExceptionsListLogsTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 30:
        v10 = -[SystemDiagnosticLogAgentiOS _networkRelayTaskWithTimeout:atDirectory:](self, "_networkRelayTaskWithTimeout:atDirectory:", v8, v38);
        goto LABEL_76;
      case 31:
        v10 = -[SystemDiagnosticLogAgent osEligibilityDumpToDir:withTimeout:](self, "osEligibilityDumpToDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 32:
        v10 = -[SystemDiagnosticLogAgent PersonalizationTaskWithDir:withTimeout:](self, "PersonalizationTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 33:
        v10 = -[SystemDiagnosticLogAgent _powerTaskForDir:withTimeout:](self, "_powerTaskForDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 34:
        v10 = -[SystemDiagnosticLogAgent getPreferences:withTimeout:](self, "getPreferences:withTimeout:", v8, v38);
        goto LABEL_76;
      case 35:
        v10 = -[SystemDiagnosticLogAgent getPreferencesInternal:withTimeout:](self, "getPreferencesInternal:withTimeout:", v8, v38);
        goto LABEL_76;
      case 36:
        v10 = -[SystemDiagnosticLogAgent proactiveInputPredictionsTaskWithDir:withTimeout:](self, "proactiveInputPredictionsTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 38:
        v10 = -[SystemDiagnosticLogAgentiOS _proximityTaskWithTimeout:](self, "_proximityTaskWithTimeout:", v38);
        goto LABEL_76;
      case 39:
        v10 = -[SystemDiagnosticLogAgent runningBoardTaskWithDir:withTimeout:](self, "runningBoardTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 40:
        v19 = v38;
        v20 = self;
        v21 = 0;
        goto LABEL_46;
      case 41:
        v19 = v38;
        v20 = self;
        v21 = 0x8000;
LABEL_46:
        v10 = -[SystemDiagnosticLogAgentiOS takeStackshotWithFlags:withTimeout:](v20, "takeStackshotWithFlags:withTimeout:", v21, v19);
        goto LABEL_76;
      case 46:
        v10 = -[SystemDiagnosticLogAgent tailspinInfoTaskWithDir:withTimeout:](self, "tailspinInfoTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 47:
        v17 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent tailspinKeychordTaskWithDir:withTimeout:](self, "tailspinKeychordTaskWithDir:withTimeout:", v8, v38));
        LOBYTE(self) = 0;
        goto LABEL_53;
      case 48:
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("sysdiagnose_logarchive_timeout_nosymbols.tailspin")));

        v23 = v38;
        v24 = CFSTR("logarchive timeout");
        goto LABEL_51;
      case 49:
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("sysdiagnose_outputdir_timeout_nosymbols.tailspin")));

        v23 = v38;
        v24 = CFSTR("Output Dir timeout");
LABEL_51:
        if (-[SystemDiagnosticLogAgent tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:](self, "tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:", v24, v22, 1, v23))
        {
          v9 = v22;
          LOBYTE(self) = 1;
          v17 = v9;
LABEL_53:
          if (v17)
          {
            v25 = xpc_array_create(0, 0);
            v16 = objc_retainAutorelease(v17);
            xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v16, "fileSystemRepresentation"));
            v17 = 0;
            goto LABEL_70;
          }
          v16 = 0;
        }
        else
        {
          v16 = 0;
          v17 = 0;
          LOBYTE(self) = 0;
          v9 = v22;
        }
        break;
      case 50:
        v10 = -[SystemDiagnosticLogAgent tailspinSaveNoSymbolicateTSTaskWithDir:withTimeout:](self, "tailspinSaveNoSymbolicateTSTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 51:
        v10 = -[SystemDiagnosticLogAgent timezoneTaskWithDir:withTimeout:](self, "timezoneTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 52:
        v10 = -[SystemDiagnosticLogAgent trialTaskWithDir:withTimeout:](self, "trialTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 54:
        v10 = -[SystemDiagnosticLogAgent unifiedAssetTaskWithDir:withTimeout:](self, "unifiedAssetTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_76;
      case 55:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent intelligencePlatformTaskWithTimeout:withTimeout:](self, "intelligencePlatformTaskWithTimeout:withTimeout:", v8, v38));
LABEL_60:
        v17 = v11;
        if (!v11 || !objc_msgSend(v11, "count"))
        {
          v16 = 0;
          goto LABEL_25;
        }
        v25 = xpc_array_create(0, 0);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v17 = v17;
        v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(_QWORD *)v32 != v28)
                objc_enumerationMutation(v17);
              v30 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
              xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v30, "fileSystemRepresentation", (_QWORD)v31));
            }
            v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          }
          while (v27);
        }

        LOBYTE(self) = 0;
        v16 = 0;
LABEL_70:
        if (v25)
        {
          xpc_dictionary_set_value(v6, "resultPaths", v25);

LABEL_72:
          LOBYTE(self) = 1;
        }
        break;
      case 57:
        v10 = -[SystemDiagnosticLogAgentiOS _basebandTSTriggerWithTimeout:](self, "_basebandTSTriggerWithTimeout:", v38);
        goto LABEL_76;
      case 59:
        v10 = -[SystemDiagnosticLogAgentiOS springBoardStateDumpTaskWithTimeout:](self, "springBoardStateDumpTaskWithTimeout:", v38);
LABEL_76:
        LOBYTE(self) = v10;
LABEL_77:
        v16 = 0;
        v17 = 0;
        break;
      default:
        v18 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not a valid request type for sysdiagnose_agent", buf, 2u);
        }

        goto LABEL_24;
    }
  }
  else
  {
LABEL_24:
    v16 = 0;
    v17 = 0;
LABEL_25:
    LOBYTE(self) = 0;
  }
  xpc_dictionary_set_BOOL(v6, "result", (BOOL)self);

}

@end
