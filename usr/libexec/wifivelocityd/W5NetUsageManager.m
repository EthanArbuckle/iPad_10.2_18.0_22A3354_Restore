@implementation W5NetUsageManager

- (W5NetUsageManager)init
{
  W5NetUsageManager *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  W5NetUsageManager *v6;
  UsageFeed *v7;
  UsageFeed *usageFeed;
  NSMutableDictionary *v9;
  NSMutableDictionary *usageSnaphots;
  NSMutableDictionary *v11;
  NSMutableDictionary *periodicUsageFiles;
  NSMutableDictionary *v13;
  NSMutableDictionary *periodicBufferHead;
  NSMutableDictionary *v15;
  NSMutableDictionary *netUsageTimer;
  uint64_t v17;
  NSObject *p_super;
  W5NetUsageManager *v19;
  const char *v21;
  objc_super v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v22.receiver = self;
  v22.super_class = (Class)W5NetUsageManager;
  v2 = -[W5NetUsageManager init](&v22, "init");
  if (objc_opt_class(AnalyticsWorkspace, v3) && objc_opt_class(UsageFeed, v4))
  {
    v5 = objc_alloc((Class)AnalyticsWorkspace);
    v6 = (W5NetUsageManager *)objc_msgSend(v5, "initWorkspaceWithService:", kSymptomAnalyticsServiceEndpoint);
    if (v6
      && (v7 = (UsageFeed *)objc_msgSend(objc_alloc((Class)UsageFeed), "initWithWorkspace:", v6),
          usageFeed = v2->_usageFeed,
          v2->_usageFeed = v7,
          usageFeed,
          v2->_usageFeed))
    {
      v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
      usageSnaphots = v2->_usageSnaphots;
      v2->_usageSnaphots = v9;

      v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
      periodicUsageFiles = v2->_periodicUsageFiles;
      v2->_periodicUsageFiles = v11;

      v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
      periodicBufferHead = v2->_periodicBufferHead;
      v2->_periodicBufferHead = v13;

      v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
      netUsageTimer = v2->_netUsageTimer;
      v2->_netUsageTimer = v15;

      v17 = sub_10008F56C();
      p_super = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = "-[W5NetUsageManager init]";
        v25 = 2080;
        v26 = "W5NetUsageManager.m";
        v27 = 1024;
        v28 = 72;
        LODWORD(v21) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) Init Success: Symptoms Framework Client", (const char *)&v23, v21, LODWORD(v22.receiver));
      }
    }
    else
    {
      p_super = &v6->super;
      v6 = v2;
      v2 = 0;
    }
    v19 = v2;

    v2 = v6;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_getCurrentUsage
{
  dispatch_semaphore_t v3;
  UsageFeed *usageFeed;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  const char *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000109D0;
  v21 = sub_1000109E0;
  v22 = 0;
  v3 = dispatch_semaphore_create(0);
  usageFeed = self->_usageFeed;
  v29[0] = kSymptomAnalyticsServiceRefreshUsage;
  v29[1] = kSymptomAnalyticsServiceExtensionUsage;
  v30[0] = &__kCFBooleanTrue;
  v30[1] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v6 = kUsageProcessProcName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000109E8;
  v14[3] = &unk_1000D53C0;
  v16 = &v17;
  v7 = v3;
  v15 = v7;
  LOBYTE(usageFeed) = -[UsageFeed usageToDateWithOptionsFor:nameKind:options:reply:](usageFeed, "usageToDateWithOptionsFor:nameKind:options:reply:", 0, v6, v5, v14);

  if ((usageFeed & 1) == 0)
  {
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = (uint64_t)"-[W5NetUsageManager _getCurrentUsage]";
      v25 = 2080;
      v26 = "W5NetUsageManager.m";
      v27 = 1024;
      v28 = 104;
      LODWORD(v13) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) Failed to issue usageToDate request", (const char *)buf, v13, LODWORD(v14[0]));
    }

  }
  v10 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v10) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v24 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)recordUsageToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_usageSnaphots, "objectForKey:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_usageSnaphots, "setObject:forKeyedSubscript:", v6, v4);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 <= 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5NetUsageManager _getCurrentUsage](self, "_getCurrentUsage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = -[W5WiFiNetUsageRecord init:usageData:]([W5WiFiNetUsageRecord alloc], "init:usageData:", v10, v9);
    if (v9)
    {
      v12 = sub_10008F56C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316418;
        v17 = "-[W5NetUsageManager recordUsageToDate:]";
        v18 = 2080;
        v19 = "W5NetUsageManager.m";
        v20 = 1024;
        v21 = 124;
        v22 = 2048;
        v23 = objc_msgSend(v9, "count");
        v24 = 2114;
        v25 = v10;
        v26 = 2112;
        v27 = v4;
        v15 = 58;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) Recording Network Usage for %ld entries, at: %{public}@, for UUID: %@", &v16, v15);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
      objc_msgSend(v14, "addObject:", v11);

    }
  }

}

- (void)startPeriodicUsageMonitor:(double)a3 maxEntries:(unint64_t)a4 uuid:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  uint64_t v28;
  int v29;
  _QWORD block[5];
  id v31;
  id v32;
  double v33;
  unint64_t v34;
  id v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  id v47;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_netUsageTimer, "objectForKey:", v8));

  if (v9)
  {
    v10 = sub_10008F56C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 136315906;
      v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
      v38 = 2080;
      v39 = "W5NetUsageManager.m";
      v40 = 1024;
      v41 = 133;
      v42 = 2112;
      v43 = v8;
      v29 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) WARN: Starting a new periodic collection for UUID:%@ when one is already active. Will cancel the last one", &v36, v29);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_netUsageTimer, "objectForKeyedSubscript:", v8));
    objc_msgSend(v12, "invalidate");

  }
  v13 = objc_alloc((Class)NSURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.wifivelocity/%@/netusage"), v14));
  v16 = objc_msgSend(v13, "initFileURLWithPath:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v35 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v35);
  v19 = v35;

  v20 = sub_10008F56C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 136316418;
    v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
    v38 = 2080;
    v39 = "W5NetUsageManager.m";
    v40 = 1024;
    v41 = 144;
    v42 = 2112;
    v43 = v16;
    v44 = 1024;
    v45 = v18;
    v46 = 2112;
    v47 = v19;
    LODWORD(v28) = 54;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) Create Directory: %@, success: %d, error: %@", &v36, v28);
  }

  v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_periodicUsageFiles, "setObject:forKeyedSubscript:", v22, v8);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_periodicBufferHead, "setObject:forKeyedSubscript:", v23, v8);

  v24 = sub_10008F56C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 136315906;
    v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
    v38 = 2080;
    v39 = "W5NetUsageManager.m";
    v40 = 1024;
    v41 = 149;
    v42 = 2112;
    v43 = v8;
    LODWORD(v28) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] %s (%s:%u) Starting Periodic Netusage data collection for UUID: %@", &v36, v28);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000111B8;
  block[3] = &unk_1000D5410;
  block[4] = self;
  v31 = v8;
  v33 = a3;
  v32 = v16;
  v34 = a4;
  v26 = v16;
  v27 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)stopPeriodicUsageMonitor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_netUsageTimer, "objectForKey:", v4));

  if (v5)
  {
    v6 = sub_10008F56C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "-[W5NetUsageManager stopPeriodicUsageMonitor:]";
      v13 = 2080;
      v14 = "W5NetUsageManager.m";
      v15 = 1024;
      v16 = 189;
      v17 = 2112;
      v18 = v4;
      v10 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) Stopping Periodic Netusage data collection for UUID: %@", &v11, v10);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_netUsageTimer, "objectForKeyedSubscript:", v4));
    objc_msgSend(v8, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->_netUsageTimer, "removeObjectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_periodicUsageFiles, "objectForKeyedSubscript:", v4));
    objc_msgSend(v9, "removeAllObjects");

    -[NSMutableDictionary removeObjectForKey:](self->_periodicUsageFiles, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_periodicBufferHead, "removeObjectForKey:", v4);
  }

}

- (id)_getProcNetUsageWithName:(id)a3 inUsageData:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("procName"), (_QWORD)v16));
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if ((v13 & 1) != 0)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)calculateUsageDelta:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  W5NetUsageManager *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  int v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_usageSnaphots, "objectForKey:", v4));

  if (!v5)
  {
    v29 = sub_10008F56C();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v47 = 136315906;
      v48 = "-[W5NetUsageManager calculateUsageDelta:]";
      v49 = 2080;
      v50 = "W5NetUsageManager.m";
      v51 = 1024;
      v52 = 214;
      v53 = 2112;
      v54 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v30, 0, "[wifivelocity] %s (%s:%u) No usage snaphots found for UUID: %@", &v47, 38);
    }

    goto LABEL_21;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
  v7 = objc_msgSend(v6, "count");

  if (v7 != (id)2)
  {
    v32 = sub_10008F56C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
      v48 = "-[W5NetUsageManager calculateUsageDelta:]";
      v49 = 2080;
      v47 = 136316162;
      v50 = "W5NetUsageManager.m";
      v51 = 1024;
      v52 = 220;
      v53 = 2048;
      v54 = objc_msgSend(v34, "count");
      v55 = 2112;
      v56 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] %s (%s:%u) Unable to calclulate NetUsage Delta: Incorrect numer of entires: %ld for UUID: %@", &v47, 48);

    }
LABEL_21:
    v38 = 0;
    goto LABEL_22;
  }
  v38 = objc_alloc_init((Class)NSMutableArray);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "usageData"));

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v11)
  {
    v12 = v11;
    v37 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v37)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("procName")));
        v16 = v4;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", 0));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "usageData"));
        v20 = self;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5NetUsageManager _getProcNetUsageWithName:inUsageData:](self, "_getProcNetUsageWithName:inUsageData:", v15, v19));

        if (v21)
        {
          v22 = objc_alloc_init((Class)NSMutableDictionary);
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100011F90;
          v39[3] = &unk_1000D5438;
          v39[4] = v14;
          v40 = v21;
          v41 = v22;
          v23 = v22;
          objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v39);
          objc_msgSend(v38, "addObject:", v23);

        }
        else
        {
          v23 = objc_msgSend(v14, "copy");
          objc_msgSend(v38, "addObject:", v23);
        }

        v4 = v16;
        self = v20;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v12);
  }

  v24 = sub_10008F56C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v38, "count");
    v48 = "-[W5NetUsageManager calculateUsageDelta:]";
    v49 = 2080;
    v47 = 136316162;
    v50 = "W5NetUsageManager.m";
    v51 = 1024;
    v52 = 249;
    v53 = 2048;
    v54 = v26;
    v55 = 2112;
    v56 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] %s (%s:%u) Calculated Network Usage Delta for %ld entries, UUID: %@", &v47, 48);
  }

  v27 = sub_10008F56C();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v47 = 136315906;
    v48 = "-[W5NetUsageManager calculateUsageDelta:]";
    v49 = 2080;
    v50 = "W5NetUsageManager.m";
    v51 = 1024;
    v52 = 251;
    v53 = 2112;
    v54 = v4;
    LODWORD(v35) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) Clearing NetUsage records for UUID: %@", &v47, v35);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_usageSnaphots, "removeObjectForKey:", v4);
LABEL_22:

  return v38;
}

+ (void)copyPeriodicNetUsageToDir:(id)a3 uuid:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  int v34;
  id v35;
  uint64_t v36;
  id v37;
  id obj;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  int v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  __int16 v55;
  _BYTE v56[14];
  __int16 v57;
  id v58;
  _BYTE v59[128];

  v39 = a3;
  v5 = a4;
  v6 = objc_alloc((Class)NSURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.wifivelocity/%@/netusage"), v7));
  v9 = objc_msgSend(v6, "initFileURLWithPath:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v46 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 4, &v46));
  v12 = v46;

  v13 = sub_10008F56C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v11, "count");
    v47 = 136315906;
    v48 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
    v49 = 2080;
    v50 = "W5NetUsageManager.m";
    v51 = 1024;
    v52 = 268;
    v53 = 2048;
    v54 = v15;
    LODWORD(v33) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Copying %ld netusage files", (const char *)&v47, v33, v34, v36);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v11;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v16)
  {
    v17 = v16;
    v35 = v9;
    v37 = v5;
    v18 = 0;
    v19 = *(_QWORD *)v43;
    do
    {
      v20 = 0;
      v21 = v12;
      do
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "URLByAppendingPathComponent:", v23));

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v41 = v21;
        v26 = objc_msgSend(v25, "copyItemAtURL:toURL:error:", v22, v24, &v41);
        v12 = v41;

        v27 = sub_10008F56C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v47 = 136316674;
          v48 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
          v49 = 2080;
          v50 = "W5NetUsageManager.m";
          v51 = 1024;
          v52 = 274;
          v53 = 2112;
          v54 = v22;
          v55 = 2112;
          *(_QWORD *)v56 = v24;
          *(_WORD *)&v56[8] = 1024;
          *(_DWORD *)&v56[10] = v26;
          v57 = 2112;
          v58 = v12;
          LODWORD(v33) = 64;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) Copy: %@ -> %@, success: %d, error: %@", &v47, v33);
        }

        v18 += v26;
        v20 = (char *)v20 + 1;
        v21 = v12;
      }
      while (v17 != v20);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v17);
    v9 = v35;
    v5 = v37;
  }
  else
  {
    v18 = 0;
    v26 = 0;
  }

  if (v18 == objc_msgSend(obj, "count"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v40 = v12;
    objc_msgSend(v29, "removeItemAtURL:error:", v9, &v40);
    v30 = v40;

    v31 = sub_10008F56C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v47 = 136316418;
      v48 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
      v49 = 2080;
      v50 = "W5NetUsageManager.m";
      v51 = 1024;
      v52 = 281;
      v53 = 2112;
      v54 = v9;
      v55 = 1024;
      *(_DWORD *)v56 = v26;
      *(_WORD *)&v56[4] = 2112;
      *(_QWORD *)&v56[6] = v30;
      LODWORD(v33) = 54;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v32, 0, "[wifivelocity] %s (%s:%u) Delete: %@, success: %d, error: %@", &v47, v33);
    }

  }
  else
  {
    v30 = v12;
  }

}

+ (void)writeProcNetUsage:(id)a3 ToFile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  _QWORD v18[4];
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v5 = a3;
  v6 = a4;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = "+[W5NetUsageManager writeProcNetUsage:ToFile:]";
    v22 = 2080;
    v20 = 136316162;
    v23 = "W5NetUsageManager.m";
    v24 = 1024;
    v25 = 287;
    v26 = 2048;
    v27 = objc_msgSend(v5, "count");
    v28 = 2114;
    v29 = v6;
    v17 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) Writing %ld Network Usage entries to: %{public}@", &v20, v17);
  }

  if (objc_msgSend(v5, "count"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000127E8;
    v18[3] = &unk_1000D5460;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v19 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
    v13 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v11, v12, 0);

    if (v13)
    {
      v14 = sub_10008F56C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315906;
        v21 = "+[W5NetUsageManager writeProcNetUsage:ToFile:]";
        v22 = 2080;
        v23 = "W5NetUsageManager.m";
        v24 = 1024;
        v25 = 303;
        v26 = 2114;
        v27 = v6;
        LODWORD(v16) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Generated Network Usage File at: %{public}@", &v20, v16);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netUsageTimer, 0);
  objc_storeStrong((id *)&self->_periodicBufferHead, 0);
  objc_storeStrong((id *)&self->_periodicUsageFiles, 0);
  objc_storeStrong((id *)&self->_usageSnaphots, 0);
  objc_storeStrong((id *)&self->_usageFeed, 0);
}

@end
