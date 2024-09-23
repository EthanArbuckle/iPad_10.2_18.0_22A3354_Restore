@implementation AppleDeviceManagementHIDDiagnostics

+ (void)collectDiagnosticsAndWriteToDirectory:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  AppleDeviceManagementHIDDiagnostics *v6;
  unsigned int v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  v4 = (__CFString *)a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Collecting HID device diagnostics and saving it to directory %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = -[AppleDeviceManagementHIDDiagnostics initWithOutputDirectory:]([AppleDeviceManagementHIDDiagnostics alloc], "initWithOutputDirectory:", v4);
  v7 = -[AppleDeviceManagementHIDDiagnostics collectErrorStats](v6, "collectErrorStats");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("failure");
    if (v7)
      v9 = CFSTR("success");
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Collected HID device diagnostics - %@", (uint8_t *)&v10, 0xCu);
  }

}

+ (OS_os_log)log
{
  if (qword_10006D368 != -1)
    dispatch_once(&qword_10006D368, &stru_100068D38);
  return (OS_os_log *)(id)qword_10006D360;
}

- (AppleDeviceManagementHIDDiagnostics)initWithOutputDirectory:(id)a3
{
  id v5;
  AppleDeviceManagementHIDDiagnostics *v6;
  dispatch_group_t v7;
  OS_dispatch_group *dispatchGroup;
  AppleDeviceManagementHIDDiagnostics *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AppleDeviceManagementHIDDiagnostics;
  v6 = -[AppleDeviceManagementHIDDiagnostics init](&v11, "init");
  if (v6)
  {
    v7 = dispatch_group_create();
    dispatchGroup = v6->_dispatchGroup;
    v6->_dispatchGroup = (OS_dispatch_group *)v7;

    objc_storeStrong((id *)&v6->_directory, a3);
    v9 = v6;
  }

  return v6;
}

- (BOOL)collectErrorStats
{
  id v3;
  NSObject *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;
  id v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  mach_error_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  char *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_time_t v29;
  id v30;
  NSObject *v31;
  double v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  __CFNotificationCenter *v44;
  intptr_t v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[4];
  uint64_t v59;
  uint8_t v60[128];
  uint8_t buf[4];
  double v62;
  __int16 v63;
  char *v64;
  _BYTE v65[128];
  _QWORD v66[2];
  _QWORD v67[2];

  v3 = objc_msgSend((id)objc_opt_class(self), "log");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppleDeviceManagementHIDDiagnostics directory](self, "directory"));
    *(_DWORD *)buf = 138412290;
    v62 = *(double *)&v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Collecting error stats and writing to directory %@", buf, 0xCu);

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100033418, CFSTR("com.apple.hidswdebug.AppleDeviceManagementHIDFilter.CrashlogExtracted"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v66[0] = CFSTR("PrimaryUsagePage");
  v66[1] = CFSTR("PrimaryUsage");
  v67[0] = &off_10006A9C0;
  v67[1] = &off_10006A9D8;
  v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2));
  v8 = objc_msgSend(objc_alloc((Class)HIDEventSystemClient), "initWithType:", 2);
  v48 = (void *)v7;
  objc_msgSend(v8, "setMatching:", v7);
  v9 = objc_opt_new(NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v47 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "services"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v16 = objc_claimAutoreleasedReturnValue(-[AppleDeviceManagementHIDDiagnostics dispatchGroup](self, "dispatchGroup"));
        dispatch_group_enter(v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "propertyForKey:", CFSTR("PalmspringCrashlogRequestErrorStats")));
        v18 = v17;
        if (v17)
        {
          if (objc_msgSend(v17, "intValue"))
          {
            v19 = objc_claimAutoreleasedReturnValue(-[AppleDeviceManagementHIDDiagnostics dispatchGroup](self, "dispatchGroup"));
            dispatch_group_leave(v19);

          }
          -[NSMutableArray addObject:](v9, "addObject:", v15);
          v20 = objc_msgSend(v18, "intValue");
        }
        else
        {
          v21 = objc_claimAutoreleasedReturnValue(-[AppleDeviceManagementHIDDiagnostics dispatchGroup](self, "dispatchGroup"));
          dispatch_group_leave(v21);

          -[NSMutableArray addObject:](v9, "addObject:", v15);
          v20 = -536870201;
        }
        v22 = objc_msgSend((id)objc_opt_class(self), "log");
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend(v15, "serviceID");
          v25 = mach_error_string(v20);
          *(_DWORD *)buf = 134218242;
          v62 = *(double *)&v24;
          v63 = 2080;
          v64 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Get property on service 0x%llX performed to collect error stats, ret: %s", buf, 0x16u);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v12);
  }

  v26 = objc_msgSend((id)objc_opt_class(self), "log");
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Waiting to receive notifications from crashlog extraction...", buf, 2u);
  }

  v28 = objc_claimAutoreleasedReturnValue(-[AppleDeviceManagementHIDDiagnostics dispatchGroup](self, "dispatchGroup"));
  v29 = dispatch_time(0, 3000000000);
  v46 = dispatch_group_wait(v28, v29);

  v30 = objc_msgSend((id)objc_opt_class(self), "log");
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v49, "timeIntervalSinceNow");
    *(_DWORD *)buf = 134217984;
    v62 = v32 * -1000.0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Done waiting for crashlog extraction notifications, total time elapsed: %f ms", buf, 0xCu);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v33 = v9;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "propertyForKey:", CFSTR("PalmspringCrashlogFetchLastCrashlog")));
        if (v39
          && -[AppleDeviceManagementHIDDiagnostics handleExtractedErrorStats:](self, "handleExtractedErrorStats:", v39))
        {
          v40 = objc_msgSend((id)objc_opt_class(self), "log");
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = objc_msgSend(v38, "serviceID");
            *(_DWORD *)buf = 134217984;
            v62 = *(double *)&v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Successful extraction of error stats from service 0x%llX", buf, 0xCu);
          }
        }
        else
        {
          v43 = objc_msgSend((id)objc_opt_class(self), "log");
          v41 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            sub_1000336B0(v58, v38, &v59, v41);
        }

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v35);
  }

  v44 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v44, self, CFSTR("com.apple.hidswdebug.AppleDeviceManagementHIDFilter.CrashlogExtracted"), 0);

  return v46 == 0;
}

- (BOOL)handleExtractedErrorStats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crashlogData")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crashlogName")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crashlogType")));

  v8 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0
    || (v9 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    || (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v7, v10) & 1) == 0))
  {
    v16 = objc_msgSend((id)objc_opt_class(self), "log");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100033718(v17);

    v15 = 0;
    goto LABEL_11;
  }
  v11 = objc_msgSend((id)objc_opt_class(self), "log");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Crashlog %@ with type %@ received via notification", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppleDeviceManagementHIDDiagnostics directory](self, "directory"));
  v19 = 0;
  v14 = 1;
  +[PalmspringCrashlog writeToDirectory:crashlogData:name:options:error:](PalmspringCrashlog, "writeToDirectory:crashlogData:name:options:error:", v13, v5, v6, 1, &v19);
  v15 = v19;

  if ((objc_msgSend(v7, "isEqualToNumber:", &off_10006A9F0) & 1) == 0)
LABEL_11:
    v14 = 0;

  return v14;
}

- (OS_dispatch_group)dispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end
