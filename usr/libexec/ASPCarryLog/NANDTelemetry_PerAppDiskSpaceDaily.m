@implementation NANDTelemetry_PerAppDiskSpaceDaily

- (id)_populatePerAppDiskSpaceDict
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  int v39;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10000E364;
  v32 = sub_10000E374;
  v33 = 0;
  if (!objc_opt_class(STMTelemetryController)
    || !objc_opt_class(ACAccount)
    || !objc_opt_class(ACAccountStore))
  {
    v12 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100042294(v12);
    v3 = 0;
LABEL_17:
    v13 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v3 = (void *)objc_opt_new(STMTelemetryController);
  v4 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connecting to STMTelemetryController", buf, 2u);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000E37C;
  v27[3] = &unk_10008CA08;
  v27[4] = &v28;
  v27[5] = &v34;
  objc_msgSend(v3, "getTelemetry:", v27);
  v5 = 1000;
  do
  {
    v6 = v5;
    usleep(0xF4240u);
    if (*((_BYTE *)v35 + 24) && v29[5])
    {
      v16 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "app space dict generation done", buf, 2u);
      }
      v11 = 0;
      v10 = 1;
      goto LABEL_22;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base activityMgr](self, "activityMgr"));
    v8 = objc_msgSend(v7, "shouldDeferXpcActivity");

    v5 = (v6 + 1000);
  }
  while (!v8);
  if (++dword_1000C48CC >= 4)
  {
    v9 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_1000422D4(v9);
    v10 = 0;
    v11 = 1;
LABEL_22:
    v17 = 1;
    goto LABEL_26;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base activityMgr](self, "activityMgr"));
  objc_msgSend(v18, "forceDeferXpcActivity");

  v19 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v39 = dword_1000C48CC;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Asked to defer app space dict generation. %d times today so far.", buf, 8u);
  }
  v10 = 0;
  v17 = 0;
  v11 = 1;
LABEL_26:
  objc_msgSend(v3, "stopService");
  v20 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Closing connection to StorageDataService", buf, 2u);
  }
  if (!v17)
    goto LABEL_17;
  usleep(0x186A0u);
  if (v11)
    v21 = objc_alloc_init((Class)NSMutableDictionary);
  else
    v21 = (id)v29[5];
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", dword_1000C48CC));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("numDefers"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("execMilliseconds"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("finished"));

  v26 = GetiCloudPlanSizeGB();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (v13)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, CFSTR("icloudPlanSize"));
  dword_1000C48CC = 0;
  v14 = v22;
LABEL_18:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  return v14;
}

- (id)_entityHasNegativeSize:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("total")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sizes")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && ((unint64_t)objc_msgSend(v4, "longLongValue") & 0x8000000000000000) != 0)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Negative size in app space entity dictionary %@"), v3));
    v21 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100042354(v18, v21);
  }
  else
  {
    v7 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
      {
        v10 = v9;
        v23 = v5;
        v24 = v4;
        v11 = 0;
        v12 = 0;
        v13 = *(_QWORD *)v26;
        while (2)
        {
          v14 = 0;
          v15 = v11;
          v16 = v12;
          do
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v8);
            v11 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v14);

            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
            v17 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0
              && ((unint64_t)objc_msgSend(v12, "longLongValue") & 0x8000000000000000) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Negative size in app space entity dictionary %@"), v3));
              v20 = (void *)oslog;
              if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
                sub_100042354(v19, v20);
              v18 = v19;

              v5 = v23;
              v4 = v24;
              goto LABEL_21;
            }
            v14 = (char *)v14 + 1;
            v15 = v11;
            v16 = v12;
          }
          while (v10 != v14);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v10)
            continue;
          break;
        }

        v5 = v23;
        v4 = v24;
      }

    }
    v18 = 0;
  }
LABEL_21:

  return v18;
}

- (id)_entityFailsCatSystemCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("total")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sizes")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name")));
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0 || !objc_msgSend(v6, "isEqualToString:", CFSTR("iOS")))
    goto LABEL_11;
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    v9 = (char *)objc_msgSend(v4, "longLongValue");
    goto LABEL_8;
  }
  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("total")));
    v12 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    if ((isKindOfClass & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("total")));
      v9 = (char *)objc_msgSend(v14, "longLongValue");

LABEL_8:
      if ((unint64_t)(v9 - 0x640000001) <= 0xFFFFFFFAFFFFFFFELL)
        goto LABEL_9;
LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
  }
LABEL_9:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected system category size! Category info: %@"), v3));
  v16 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    sub_100042354(v15, v16);
LABEL_12:

  return v15;
}

- (id)_getRawDictErrorStr:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v4;
  v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v32 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v38;
    v10 = &AnalyticsIsEventUsed_ptr;
    v28 = *(_QWORD *)v38;
    v29 = v6;
    do
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v31 = v11;
        v8 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));
        v14 = objc_opt_class(v10[41]);
        isKindOfClass = objc_opt_isKindOfClass(v13, v14);

        if ((isKindOfClass & 1) != 0)
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v17)
          {
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                v22 = v19;
                if (*(_QWORD *)v34 != v20)
                  objc_enumerationMutation(v16);
                v19 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);

                v23 = objc_opt_class(NSDictionary);
                if ((objc_opt_isKindOfClass(v19, v23) & 1) != 0)
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_PerAppDiskSpaceDaily _entityHasNegativeSize:](self, "_entityHasNegativeSize:", v19));

                  if (v24)
                    objc_msgSend(v32, "addObject:", v24);
                  if (objc_msgSend(v8, "isEqualToString:", CFSTR("categories")))
                  {
                    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_PerAppDiskSpaceDaily _entityFailsCatSystemCheck:](self, "_entityFailsCatSystemCheck:", v19));

                    if (v7)
                      objc_msgSend(v32, "addObject:", v7);
                  }
                  else
                  {
                    v7 = v24;
                  }
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v18);

            v9 = v28;
            v6 = v29;
          }

          v10 = &AnalyticsIsEventUsed_ptr;
        }
        v11 = v31 + 1;
        v12 = v8;
      }
      while ((id)(v31 + 1) != v30);
      v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);

    v5 = v32;
  }
  else
  {
    v7 = 0;
  }

  v25 = objc_msgSend(v5, "count");
  if (v25)
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n")));
  v26 = v25;

  return v26;
}

- (void)_updateLastUserNotificationDate
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v3 = DateTimeToStr(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v5, "saveValue:forKey:doPersist:", v4, CFSTR("lastUserNotificationDate"), 1);

}

- (BOOL)_isAfterNotificationCoolDown
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  id v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:", CFSTR("lastUserNotificationDate")));
  v5 = StringToDateTime(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", 604800.0));
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v8 = objc_msgSend(v7, "compare:", v2) == (id)-1;

  }
  else
  {
    v8 = 1;
  }
  v9 = (id)oslog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v10 = "Do";
    else
      v10 = "Do not";
    if (v6)
    {
      v11 = DateTimeToStr(v6);
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v11));
      v12 = (const char *)objc_msgSend(v2, "UTF8String");
    }
    else
    {
      v12 = "none";
    }
    v14 = 136315394;
    v15 = v10;
    v16 = 2080;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s notify user for raw dict error. Previous notification time %s", (uint8_t *)&v14, 0x16u);
    if (v6)

  }
  return v8;
}

- (void)_tryNotifyUserRawDictErrorString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[8];
  id v12;

  v4 = a3;
  if (os_variant_has_internal_ui("com.apple.ASPCarryLog")
    && objc_opt_class(TapToRadarService)
    && -[NANDTelemetry_PerAppDiskSpaceDaily _isAfterNotificationCoolDown](self, "_isAfterNotificationCoolDown"))
  {
    v5 = objc_alloc_init((Class)RadarDraft);
    objc_msgSend(v5, "setTitle:", CFSTR("SpaceForce Telemetry Inconsistent Disk Space Result"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Inconsistent result is detect on your device during disk space usage telemetry collection. Inconsistencies:\n\n%@"), v4));
    objc_msgSend(v5, "setProblemDescription:", v6);

    v7 = objc_msgSend(objc_alloc((Class)RadarComponent), "initWithName:version:identifier:", CFSTR("Storage Management"), CFSTR("iOS"), 819298);
    objc_msgSend(v5, "setComponent:", v7);

    objc_msgSend(v5, "setReproducibility:", 5);
    objc_msgSend(v5, "setClassification:", 6);
    objc_msgSend(v5, "setDiagnosticExtensionIDs:", &off_1000BCEE8);
    objc_msgSend(v5, "setAttachments:", 0);
    objc_msgSend(v5, "setAutoDiagnostics:", 0);
    objc_msgSend(v5, "setIsUserInitiated:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
    v12 = 0;
    objc_msgSend(v8, "createDraft:forProcessNamed:withDisplayReason:error:", v5, CFSTR("SpaceForceTelemetry"), CFSTR("disk space usage calculation is inconsistent"), &v12);
    v9 = v12;

    v10 = oslog;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_1000423C8(v10, v9);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully created radar draft", buf, 2u);
      }
      -[NANDTelemetry_PerAppDiskSpaceDaily _updateLastUserNotificationDate](self, "_updateLastUserNotificationDate");
    }

  }
}

- (void)_checkRawDictConsistency:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  _UNKNOWN **v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("finished")));
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_PerAppDiskSpaceDaily _getRawDictErrorStr:](self, "_getRawDictErrorStr:", v8));
    if (v6)
      v7 = &off_1000AC110;
    else
      v7 = &off_1000AC0F8;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("inconsistent"));

  }
}

- (void)_sendToCoreAnalytics:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  v3 = objc_autoreleasePoolPush();
  LogStorageUIDatatoCA(v4, 0);
  objc_autoreleasePoolPop(v3);

}

- (void)runActivity
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_PerAppDiskSpaceDaily _populatePerAppDiskSpaceDict](self, "_populatePerAppDiskSpaceDict"));
  if (v3)
  {
    -[NANDTelemetry_PerAppDiskSpaceDaily _checkRawDictConsistency:](self, "_checkRawDictConsistency:", v3);
    v4 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("execMilliseconds")));
      v7[0] = 67109120;
      v7[1] = (int)objc_msgSend(v6, "intValue") / 1000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending app space info to CA. Extraction time %ds", (uint8_t *)v7, 8u);

    }
    -[NANDTelemetry_PerAppDiskSpaceDaily _sendToCoreAnalytics:](self, "_sendToCoreAnalytics:", v3);
  }

}

+ (BOOL)shouldRegisterActivity
{
  return 0;
}

@end
