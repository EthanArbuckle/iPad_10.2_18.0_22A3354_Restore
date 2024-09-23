@implementation W5LogManager

- (W5LogManager)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4 peerDiagnosticsManager:(id)a5
{
  W5LogManager *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableArray *v17;
  NSDateFormatter *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)W5LogManager;
  v8 = -[W5LogManager init](&v20, "init");
  if (!v8)
    goto LABEL_16;
  v9 = dispatch_queue_create("com.apple.wifivelocity.collect-logs", 0);
  v8->_queue = (OS_dispatch_queue *)v9;
  if (!v9)
    goto LABEL_16;
  dispatch_queue_set_specific(v9, &v8->_queue, (void *)1, 0);
  v10 = dispatch_queue_create("com.apple.wifivelocity.debug-log", 0);
  v8->_debugLogQueue = (OS_dispatch_queue *)v10;
  if (!v10)
    goto LABEL_16;
  v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_debugLogMap = v11;
  if (!v11)
    goto LABEL_16;
  v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_missingLogItemMap = v12;
  if (!v12)
    goto LABEL_16;
  v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_taskUUIDMap = v13;
  if (!v13)
    goto LABEL_16;
  v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_urlUUIDMap = v14;
  if (!v14)
    goto LABEL_16;
  v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_leewayUUIDMap = v15;
  if (!v15)
    goto LABEL_16;
  v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_timestampUUIDMap = v16;
  if (!v16)
    goto LABEL_16;
  v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v8->_pendingRequests = v17;
  if (a3
    && v17
    && (v8->_status = (W5StatusManager *)a3, a4)
    && (v8->_diagnostics = (W5DiagnosticsManager *)a4,
        v8->_peerDiagnostics = (W5PeerDiagnosticsManager *)a5,
        v18 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter),
        (v8->_dateFormatter = v18) != 0))
  {
    -[NSDateFormatter setDateFormat:](v18, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
    v8->_model = (NSString *)objc_msgSend(-[W5LogManager __model](v8, "__model"), "copy");
    v8->_ioReportSubscription = 0;
    v8->_waDeviceAnalyticsClient = 0;
    v8->_waDeviceAnalyticsClientNotSupported = 0;
    v8->_ioReportBase = 0;
    v8->_ioReportDelta = 0;
    v8->_ioReportChannels = 0;
  }
  else
  {
LABEL_16:

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *debugLogQueue;
  __CFDictionary *ioReportBase;
  __CFDictionary *ioReportDelta;
  __CFDictionary *ioReportChannels;
  __IOReportSubscriptionCF *ioReportSubscription;
  objc_super v9;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  debugLogQueue = self->_debugLogQueue;
  if (debugLogQueue)
    dispatch_release(debugLogQueue);
  ioReportBase = self->_ioReportBase;
  if (ioReportBase)
    CFRelease(ioReportBase);
  ioReportDelta = self->_ioReportDelta;
  if (ioReportDelta)
    CFRelease(ioReportDelta);
  ioReportChannels = self->_ioReportChannels;
  if (ioReportChannels)
    CFRelease(ioReportChannels);
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription)
    CFRelease(ioReportSubscription);
  v9.receiver = self;
  v9.super_class = (Class)W5LogManager;
  -[W5LogManager dealloc](&v9, "dealloc");
}

- (BOOL)waDeviceAnalyticsClientExists
{
  BOOL v2;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  WADeviceAnalyticsClient *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _WORD v14[8];
  _WORD v15[8];
  _WORD v16[8];
  _WORD v17[8];

  if (!self->_waDeviceAnalyticsClient)
  {
    if (self->_waDeviceAnalyticsClientNotSupported)
      return 0;
    if (sub_100055B74() && (v5 = sub_100055B74(), objc_opt_class(v5, v6)))
    {
      v7 = _os_feature_enabled_impl("WiFiPolicy", "HND_AnalyticsProcessor");
      v8 = sub_10008F56C();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          v17[0] = 0;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] Creating _waDeviceAnalyticsClient with [WADeviceAnalyticsClient_SOFT sharedDeviceAnalyticsClientWithSharedServerTypeAndXPCStore]", v17, 2);
        }
        v10 = (WADeviceAnalyticsClient *)objc_msgSend((id)sub_100055B74(), "sharedDeviceAnalyticsClientWithPersist");
      }
      else
      {
        if (v9)
        {
          v16[0] = 0;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] Creating _waDeviceAnalyticsClient with [[WADeviceAnalyticsClient_SOFT alloc] init]", v16, 2);
        }
        v10 = (WADeviceAnalyticsClient *)objc_alloc_init((Class)sub_100055B74());
      }
      self->_waDeviceAnalyticsClient = v10;
      if (!v10)
        return 0;
    }
    else
    {
      v11 = sub_10008F56C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15[0] = 0;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] WADeviceAnalyticsClient_SOFT failed or [WADeviceAnalyticsClient_SOFT class] doesnt exist, setting _waDeviceAnalyticsClientNotSupported", v15, 2);
      }
      self->_waDeviceAnalyticsClientNotSupported = 1;
      if (!self->_waDeviceAnalyticsClient)
        return 0;
    }
    v12 = sub_10008F56C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 0;
      LODWORD(v13) = 2;
      v2 = 1;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] _waDeviceAnalyticsClient now exists after performing runtime checks and initialization", v14, v13);
      return v2;
    }
  }
  return 1;
}

- (void)setCollectedItemCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_collectedItemCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100055CC0;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setPingCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_pingCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100055D8C;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setCollectLogItemCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_collectLogItemCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100055E58;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)__replyWithCachedSysdiagnoseContentForRequest:(id)a3 temporaryURL:(id)a4
{
  unsigned int v6;
  unsigned int v7;
  NSURL *v8;
  _UNKNOWN **v9;
  NSFileManager *v10;
  NSURL *v11;
  NSFileManager *v12;
  void (**v13)(id, NSError *, NSURL *, _QWORD);
  NSError *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  if (a4)
  {
    v7 = v6;
    v14 = 0;
    v8 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")), "URLByAppendingPathComponent:", objc_msgSend(a3, "filename"));
    if (v7)
    {
      v9 = &Apple80211BindToInterface_ptr;
      sub_10008F5AC(a4, v8, &v14);
    }
    else
    {
      sub_10009009C(a4, v8, &v14);
      v10 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      v18[0] = &off_1000E3348;
      v17[0] = NSFilePosixPermissions;
      v17[1] = NSFileOwnerAccountID;
      v18[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "uid"));
      v17[2] = NSFileGroupOwnerAccountID;
      v18[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "gid"));
      v9 = &Apple80211BindToInterface_ptr;
      -[NSFileManager setAttributes:ofItemAtPath:error:](v10, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3), -[NSURL path](v8, "path"), 0);
    }
    if (objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Reason")))
    {
      v11 = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")), "URLByAppendingPathComponent:", CFSTR("previous")), "URLByAppendingPathComponent:", objc_msgSend(a3, "filename"));
      sub_10009009C(v8, v11, &v14);
      v12 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      v16[0] = &off_1000E3348;
      v15[0] = NSFilePosixPermissions;
      v15[1] = NSFileOwnerAccountID;
      v16[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "uid"));
      v15[2] = NSFileGroupOwnerAccountID;
      v16[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "gid"));
      -[NSFileManager setAttributes:ofItemAtPath:error:](v12, "setAttributes:ofItemAtPath:error:", objc_msgSend(v9[120], "dictionaryWithObjects:forKeys:count:", v16, v15, 3), -[NSURL path](v11, "path"), 0);
    }
    if (objc_msgSend(a3, "reply"))
    {
      v13 = (void (**)(id, NSError *, NSURL *, _QWORD))objc_msgSend(a3, "reply");
      v13[2](v13, v14, v8, 0);
    }
  }
}

- (BOOL)__logItems:(id)a3 containsID:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "itemID") == (id)a4)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return (char)v6;
}

- (void)addRequest:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000562DC;
  v4[3] = &unk_1000D5C48;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005762C;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (BOOL)isRequestActiveOrPending:(id)a3
{
  return (-[NSUUID isEqual:](-[W5LogItemRequestInternal uuid](self->_activeRequest, "uuid"), "isEqual:", a3) & 1) != 0|| -[W5LogManager __pendingRequestWithUUID:](self, "__pendingRequestWithUUID:", a3) != 0;
}

- (void)teardownAndNotify:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005792C;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  NSMutableArray *pendingRequests;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  pendingRequests = self->_pendingRequests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(pendingRequests);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "uuid"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6
{
  id v9;
  double v10;
  double v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  double v16;
  void *i;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  char *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int v41;
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v9 = +[NSMutableArray array](NSMutableArray, "array");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v32 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v12 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    v16 = (double)a5;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileCreationDate](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", v18), 0), "fileCreationDate"), "timeIntervalSinceReferenceDate");
        v20 = v19;
        if (!a4
          || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
        {
          v21 = objc_msgSend(a3, "stringByAppendingPathComponent:", v18);
          if (v11 - v20 <= v16)
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
          else
            objc_msgSend(v9, "addObject:", v21);
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v14);
  }
  v22 = objc_msgSend(objc_msgSend(v32, "allKeys"), "mutableCopy");
  objc_msgSend(v22, "sortUsingComparator:", &stru_1000D6C08);
  if ((unint64_t)objc_msgSend(v22, "count") > a6 && objc_msgSend(v22, "count") != (id)a6)
  {
    v23 = 0;
    do
      objc_msgSend(v9, "addObject:", objc_msgSend(v32, "objectForKeyedSubscript:", objc_msgSend(v22, "objectAtIndexedSubscript:", v23++)));
    while (v23 < (char *)objc_msgSend(v22, "count") - a6);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v9);
        v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        v29 = sub_10008F56C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 138543362;
          v42 = v28;
          LODWORD(v30) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v29, 0, "[wifivelocity] PURGE obsolete WiFi log content, path='%{public}@'", &v41, v30);
        }
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v28, 0);
      }
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v25);
  }
}

- (void)__nextRequest
{
  id v3;
  uint64_t v4;
  _QWORD v5[7];
  _QWORD v6[5];
  uint64_t v7;

  if (!self->_activeRequest)
  {
    if (-[NSMutableArray count](self->_pendingRequests, "count"))
    {
      v3 = objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy");
      self->_activeRequest = (W5LogItemRequestInternal *)objc_msgSend(v3, "copy");
      -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0);
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3052000000;
      v6[3] = sub_100058028;
      v6[4] = sub_100058038;
      v7 = 0;
      v4 = os_transaction_create("com.apple.wifivelocity.logs");
      objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.logs", v4);
      v7 = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100058044;
      v5[3] = &unk_1000D6C80;
      v5[4] = v3;
      v5[5] = self;
      v5[6] = v6;
      -[W5LogManager __runRequest:reply:](self, "__runRequest:reply:", v3, v5);
      _Block_object_dispose(v6, 8);
    }
  }
}

- (id)__logItemsForDumpLogsEventWithReason:(id)a3 filteredContent:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  _QWORD v9[4];
  _QWORD v10[4];
  const __CFString *v11;
  NSString *v12;

  v4 = a4;
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  if (!a3)
  {
    a3 = -[NSString substringToIndex:](-[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), "substringToIndex:", 5);
    v11 = CFSTR("Reason");
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~dump[%@]"), CFSTR("WiFiDebug"), a3);
    objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000E60C0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000E60E8));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000E6110));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, &off_1000E6138));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0));
  objc_msgSend(v7, "addObject:", -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6160));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E6188));
  objc_msgSend(v7, "addObject:", -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E61B0));
  objc_msgSend(v7, "addObject:", -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E61D8));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 8, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E6200));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0));
  v9[0] = CFSTR("IncludeMatching");
  v10[0] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", a3);
  v10[1] = &off_1000E33A8;
  v9[1] = CFSTR("MaxCount");
  v9[2] = CFSTR("FilterContent");
  v9[3] = CFSTR("Compress");
  v10[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v10[3] = &__kCFBooleanTrue;
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4)));
  return objc_msgSend(v7, "copy");
}

- (id)__logItemsForABCWithReason:(id)a3 filteredContent:(BOOL)a4
{
  _BOOL8 v4;
  const __CFString *v6;

  v4 = a4;
  if (a3)
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("abc~%@"), a3);
  else
    v6 = CFSTR("abc");
  return -[W5LogManager __logItemsForBackgroundEventWithReason:filteredContent:](self, "__logItemsForBackgroundEventWithReason:filteredContent:", v6, v4);
}

- (id)__logItemsForBackgroundEventWithReason:(id)a3 filteredContent:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSString *v8;
  NSString *v9;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[3];
  const __CFString *v14;
  NSString *v15;

  v4 = a4;
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = -[NSString substringToIndex:](-[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), "substringToIndex:", 5);
  if (a3)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~%@[%@]"), CFSTR("WiFiDebug"), a3, v8);
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@]"), CFSTR("WiFiDebug"), v8, v11);
  v14 = CFSTR("Reason");
  v15 = v9;
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 18, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 12, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 10, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 11, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 57, 0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E6228));
  objc_msgSend(v7, "addObject:", -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v7, "addObject:", -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6250));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E6278));
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0));
  v13[0] = &off_1000E33C0;
  v12[0] = CFSTR("MaxAge");
  v12[1] = CFSTR("FilterContent");
  v12[2] = CFSTR("Compress");
  v13[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v13[2] = &__kCFBooleanTrue;
  objc_msgSend(v7, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3)));
  return objc_msgSend(v7, "copy");
}

- (id)__logItemsForDatapathStallEventWithFilteredContent:(BOOL)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  _BOOL4 v8;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[2];
  _QWORD v12[2];
  const __CFString *v13;
  NSString *v14;
  const __CFString *v15;
  NSString *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v8 = a3;
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000E62A0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000E62C8));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000E62F0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, &off_1000E6318));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 11, 0));
  objc_msgSend(v4, "addObject:", -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0));
  v5 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E6340));
  objc_msgSend(v4, "addObject:", -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0));
  v17[0] = CFSTR("Reason");
  v17[1] = CFSTR("NameOverride");
  v18[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~dps~PRE[%@]"), CFSTR("WiFiDebug"), -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v18[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v18[0]);
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2)));
  v6 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v15 = CFSTR("UUID");
  v16 = v6;
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6368));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E6390));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000E63B8));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E63E0));
  objc_msgSend(v4, "addObject:", -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000E6408));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E6430));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E6458));
  v13 = CFSTR("UUID");
  v14 = v6;
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6480));
  v11[0] = CFSTR("Reason");
  v11[1] = CFSTR("NameOverride");
  v12[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~dps~POST[%@]"), CFSTR("WiFiDebug"), -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v12[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v12[0]);
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2)));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 8, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E64A8));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E64D0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0));
  v9[0] = CFSTR("IncludeMatching");
  v10[0] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v9[1] = CFSTR("FilterContent");
  v9[2] = CFSTR("Compress");
  v10[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8);
  v10[2] = &__kCFBooleanTrue;
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3)));
  return objc_msgSend(v4, "copy");
}

- (id)__logItemsForWiFiDiagnosticsApp
{
  NSMutableArray *v2;

  v2 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:](self, "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~wdapp"), CFSTR("WiFiDebug"))));
  -[NSMutableArray addObject:](v2, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 14, &off_1000E64F8));
  -[NSMutableArray addObject:](v2, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 52, 0));
  -[NSMutableArray addObject:](v2, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 50, 0));
  return v2;
}

- (id)__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSDictionary *v7;
  NSString *v8;
  NSDictionary *v9;
  NSString *v10;
  W5LogItemRequest *v11;
  W5LogItemRequest *v12;
  uint64_t v13;
  W5LogItemRequest *v15;
  W5LogItemRequest *v16;
  W5LogItemRequest *v17;
  unsigned int v18;
  _QWORD v20[3];
  _QWORD v21[3];
  const __CFString *v22;
  NSString *v23;
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[3];
  const __CFString *v27;
  NSString *v28;
  _QWORD v29[2];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[3];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];
  _QWORD v45[4];
  _QWORD v46[4];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v18 = -[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/sbin/ping"));
  v5 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~PRE[%@]"), a3, -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v46[0] = &off_1000E33A8;
  v45[0] = CFSTR("MaxCount");
  v45[1] = CFSTR("IncludeMatching");
  v46[1] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v6);
  v46[2] = &__kCFBooleanTrue;
  v45[2] = CFSTR("Compress");
  v45[3] = CFSTR("NameOverride");
  v46[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (%@)"), v6);
  v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
  v42[1] = CFSTR("NameOverride");
  v43[0] = v6;
  v42[0] = CFSTR("Reason");
  v43[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v6);
  v44[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
  v44[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6520);
  v44[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v7);
  v40[0] = CFSTR("Requests");
  v40[1] = CFSTR("RunConcurrent");
  v41[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 3);
  v41[1] = &__kCFBooleanFalse;
  v40[2] = CFSTR("NameOverride");
  v41[2] = CFSTR("CoreCapture (PRE)");
  v17 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 3));
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~POST[%@]"), a3, -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v38[0] = CFSTR("MaxAge");
  v38[1] = CFSTR("Compress");
  v39[0] = &off_1000E3408;
  v39[1] = &__kCFBooleanTrue;
  v39[2] = &off_1000E33F0;
  v38[2] = CFSTR("Timeout");
  v38[3] = CFSTR("NameOverride");
  v39[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (24h + %@)"), v8);
  v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v35[1] = CFSTR("NameOverride");
  v36[0] = v8;
  v35[0] = CFSTR("Reason");
  v36[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v8);
  v37[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v37[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6548);
  v37[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v9);
  v33[0] = CFSTR("Requests");
  v33[1] = CFSTR("RunConcurrent");
  v34[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3);
  v34[1] = &__kCFBooleanFalse;
  v34[2] = CFSTR("CoreCapture (POST + 24h)");
  v33[2] = CFSTR("NameOverride");
  v33[3] = CFSTR("Timeout");
  v34[3] = &off_1000E33F0;
  v16 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 4));
  v32[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0);
  v32[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6570);
  v32[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E6598);
  v30[0] = CFSTR("Requests");
  v30[1] = CFSTR("RunConcurrent");
  v31[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3);
  v31[1] = &__kCFBooleanFalse;
  v30[2] = CFSTR("NameOverride");
  v30[3] = CFSTR("Timeout");
  v31[2] = CFSTR("Wi-Fi Logs (24h)");
  v31[3] = &off_1000E33F0;
  v15 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 4));
  v10 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v27 = CFSTR("UUID");
  v28 = v10;
  v29[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v29[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E65C0);
  v25[0] = CFSTR("Requests");
  v25[1] = CFSTR("RunConcurrent");
  v26[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2);
  v25[2] = CFSTR("NameOverride");
  v26[1] = &__kCFBooleanFalse;
  v26[2] = CFSTR("TCP Dump (Begin)");
  v11 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
  v22 = CFSTR("UUID");
  v23 = v10;
  v24[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v24[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E65E8);
  v20[0] = CFSTR("Requests");
  v20[1] = CFSTR("RunConcurrent");
  v21[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2);
  v21[1] = &__kCFBooleanFalse;
  v20[2] = CFSTR("NameOverride");
  v21[2] = CFSTR("TCP Dump (POST)");
  v12 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E6610));
  objc_msgSend(v4, "addObject:", v17);
  objc_msgSend(v4, "addObject:", v11);
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E6638));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000E6660));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E6688));
  if (v18)
    v13 = 2;
  else
    v13 = 43;
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", v13, 0));
  objc_msgSend(v4, "addObject:", -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v4, "addObject:", -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v4, "addObject:", -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E66B0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 62, &off_1000E66D8));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E6700));
  objc_msgSend(v4, "addObject:", v12);
  objc_msgSend(v4, "addObject:", v16);
  objc_msgSend(v4, "addObject:", v15);
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 70, &off_1000E6728));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 30, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 33, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000E6750));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000E6778));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, &off_1000E67A0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000E67C8));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 9, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0));
  if (os_variant_has_internal_diagnostics("com.apple.wifivelocity"))
    objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 86, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 49, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 57, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 5, &off_1000E67F0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 51, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 18, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 74, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 78, &off_1000E6818));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 80, 0));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 85, &off_1000E6840));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 84, &off_1000E6868));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 88, &off_1000E6890));
  objc_msgSend(v4, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 87, 0));
  return v4;
}

- (id)__logItemsForFeedbackAssistant
{
  return -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:](self, "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~fba"), CFSTR("WiFiDebug")));
}

- (id)__logItemsForTapToRadar
{
  return -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:](self, "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~ttr"), CFSTR("WiFiDebug")));
}

- (id)__logItemsForInternalWiFiSettings
{
  return -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:](self, "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~settings"), CFSTR("WiFiDebug")));
}

- (id)__concurrentConnectivityDiagnosticsTest
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v2 = objc_alloc_init((Class)W5DiagnosticsTestRequest);
  objc_msgSend(v2, "setTestID:", 53);
  v3 = -[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/sbin/ping"));
  v4 = -[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/sbin/ping6"));
  if (v3)
    v5 = 1;
  else
    v5 = 3;
  if (v3)
    v6 = 4;
  else
    v6 = 6;
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000E68B8));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000E68E0));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000E6908));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000E6930));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v6, &off_1000E6958));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v6, &off_1000E6980));
  if (v3)
  {
    objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E69A8));
    objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E69D0));
    objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E69F8));
    objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E6A20));
  }
  if (v4)
    objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 59, &off_1000E6A48));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 7, 0));
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 9, 0));
  if (-[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/usr/local/bin/curl")))
  {
    v8 = 54;
  }
  else
  {
    v8 = 11;
  }
  objc_msgSend(v7, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v8, 0));
  v10[0] = CFSTR("ConcurrentRequests");
  v10[1] = CFSTR("NameOverride");
  v11[0] = v7;
  v11[1] = CFSTR("Connectivity (Concurrent)");
  objc_msgSend(v2, "setConfiguration:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  return v2;
}

- (id)__configurationDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  _QWORD v8[4];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseCachedStatus"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseCachedPNL"));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 52, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 12, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 13, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 57, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 58, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 14, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 15, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 16, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 17, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 18, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 19, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 20, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 21, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 22, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 51, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 32, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 34, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 35, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 38, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 40, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 39, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 41, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 44, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 45, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 33, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 42, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 46, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 43, v5));
  v8[0] = v4;
  v7[0] = CFSTR("DiagnosticsTests");
  v7[1] = CFSTR("Timeout");
  v8[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  v8[2] = CFSTR("WiFi Conf Diagnostics");
  v7[2] = CFSTR("NameOverride");
  v7[3] = CFSTR("FileNameOverride");
  v8[3] = CFSTR("diagnostics-configuration.txt");
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
}

- (id)__environmentDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  _QWORD v8[4];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseCachedStatus"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseCachedPNL"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1000E35B8, CFSTR("MaxScanCacheAge"));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 24, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 27, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 28, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 30, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 31, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 36, v5));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 37, v5));
  v8[0] = v4;
  v7[0] = CFSTR("DiagnosticsTests");
  v7[1] = CFSTR("Timeout");
  v8[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  v8[2] = CFSTR("WiFi Env Diagnostics");
  v7[2] = CFSTR("NameOverride");
  v7[3] = CFSTR("FileNameOverride");
  v8[3] = CFSTR("diagnostics-environment.txt");
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
}

- (id)__connectivityDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD v12[4];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v5 = -[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/sbin/ping"));
  v6 = -[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/sbin/ping6"));
  if (v5)
    v7 = 1;
  else
    v7 = 3;
  if (v5)
    v8 = 4;
  else
    v8 = 6;
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000E6A70));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000E6A98));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000E6AC0));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000E6AE8));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v8, &off_1000E6B10));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v8, &off_1000E6B38));
  if (v5)
  {
    objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E6B60));
    objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E6B88));
    objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E6BB0));
    objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000E6BD8));
  }
  if (v6)
    objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 59, &off_1000E6C00));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 7, 0));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 9, 0));
  if (-[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/usr/local/bin/curl")))
  {
    v9 = 54;
  }
  else
  {
    v9 = 11;
  }
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v9, 0));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 8, 0));
  objc_msgSend(v4, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 49, 0));
  v12[0] = v4;
  v11[0] = CFSTR("DiagnosticsTests");
  v11[1] = CFSTR("Timeout");
  v12[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  v12[2] = CFSTR("WiFi Conn Diagnostics");
  v11[2] = CFSTR("NameOverride");
  v11[3] = CFSTR("FileNameOverride");
  v12[3] = CFSTR("diagnostics-connectivity.txt");
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
}

- (id)__fastConnectivityDiagnosticsLogItemWithTimeout:(double)a3
{
  id v5;
  _QWORD v6[4];
  _QWORD v7[4];

  v6[0] = CFSTR("DiagnosticsTests");
  v5 = -[W5LogManager __concurrentConnectivityDiagnosticsTest](self, "__concurrentConnectivityDiagnosticsTest");
  v7[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1);
  v6[1] = CFSTR("Timeout");
  v7[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  v7[2] = CFSTR("WiFi Conn Diagnostics");
  v6[2] = CFSTR("NameOverride");
  v6[3] = CFSTR("FileNameOverride");
  v7[3] = CFSTR("diagnostics-connectivity.txt");
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
}

- (id)__logItemsForSysdiagnoseWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4 timeout:(int64_t)a5
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  NSObject *v17;
  NSString *v18;
  W5LogItemRequest *v19;
  uint64_t v20;
  NSDictionary *v21;
  NSArray *v22;
  NSString *v23;
  NSDictionary *v24;
  NSDictionary *v25;
  W5LogItemRequest *v26;
  NSArray *v27;
  uint64_t v29;
  W5LogItemRequest *v30;
  uint64_t v31;
  W5LogItemRequest *v32;
  uint64_t v33;
  BOOL v34;
  unint64_t v35;
  W5LogItemRequest *v36;
  NSString *v37;
  uint64_t v38;
  W5LogItemRequest *v39;
  uint64_t v40;
  id v41;
  W5LogManager *v42;
  _BOOL4 v43;
  NSString *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[6];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[3];
  _QWORD v54[3];
  const __CFString *v55;
  NSString *v56;
  _QWORD v57[2];
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[4];
  const __CFString *v67;
  NSNumber *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[3];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[6];
  _QWORD v77[5];
  _QWORD v78[5];
  _QWORD v79[11];
  _QWORD v80[6];
  _QWORD v81[6];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[11];
  _QWORD v85[3];
  _QWORD v86[3];
  const __CFString *v87;
  NSString *v88;
  _QWORD v89[2];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[2];
  _QWORD v93[2];
  W5LogItemRequest *v94;
  int v95;
  unint64_t v96;
  __int16 v97;
  unint64_t v98;
  __int16 v99;
  int64_t v100;
  __int16 v101;
  unint64_t v102;

  v43 = a3;
  v41 = +[NSMutableArray array](NSMutableArray, "array");
  v44 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v34 = a5 > 35999 && a4;
  v8 = 4000;
  if (v34)
    v8 = 6000;
  v40 = v8;
  if (a5 > 35999 && a4)
    v9 = 24000;
  else
    v9 = 7000;
  v10 = 2000;
  if (a5 > 35999 && a4)
    v10 = 3000;
  v33 = v10;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v42 = self;
  -[NSDate timeIntervalSinceReferenceDate](-[W5LogItemRequestInternal addedAt](self->_activeRequest, "addedAt"), "timeIntervalSinceReferenceDate");
  v14 = (unint64_t)(v12 - v13);
  v15 = (double)v9;
  if ((double)(uint64_t)(a5 - v14) * 0.4 >= (double)v9)
    v15 = (double)(uint64_t)(a5 - v14) * 0.4;
  v16 = (unint64_t)v15;
  if (v9 == (unint64_t)v15)
  {
    v35 = v9;
  }
  else
  {
    v17 = sub_10008F56C();
    v35 = v16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v95 = 134218752;
      v96 = v9;
      v97 = 2048;
      v98 = v16;
      v99 = 2048;
      v100 = a5;
      v101 = 2048;
      v102 = v14;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] Adjusted CoreCapture delay (%lums --> %lums) based on specified timeout (%lums) and time elapsed since request was added (%lus)", &v95, 42, v29, v31);
    }
  }
  v18 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v92[0] = CFSTR("Reason");
  v92[1] = CFSTR("NameOverride");
  v93[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~sysdiag~PRE[%@]"), CFSTR("WiFiDebug"), -[NSString substringToIndex:](v18, "substringToIndex:", 5));
  v38 = v93[0];
  v93[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v93[0]);
  v94 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 2));
  v90[0] = CFSTR("Requests");
  v90[1] = CFSTR("RunConcurrent");
  v91[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1);
  v91[1] = &__kCFBooleanFalse;
  v90[2] = CFSTR("NameOverride");
  v91[2] = CFSTR("CoreCapture Dump (PRE)");
  v32 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, v90, 3));
  v87 = CFSTR("UUID");
  v37 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v88 = v37;
  v89[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
  v89[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6C28);
  v85[0] = CFSTR("Requests");
  v85[1] = CFSTR("RunConcurrent");
  v86[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2);
  v86[1] = &__kCFBooleanFalse;
  v85[2] = CFSTR("NameOverride");
  v86[2] = CFSTR("TCP Dump (PRE)");
  v30 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 3));
  v84[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0);
  v84[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 57, 0);
  v84[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000E6C50);
  v84[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000E6C78);
  v84[4] = -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](v42, "__configurationDiagnosticsLogItemWithTimeout:", 0.0);
  v84[5] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0);
  v84[6] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E6CA0);
  v84[7] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 80, 0);
  v84[8] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 85, &off_1000E6CC8);
  v84[9] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 84, &off_1000E6CF0);
  v84[10] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 88, &off_1000E6D18);
  v82[0] = CFSTR("Requests");
  v82[1] = CFSTR("RunConcurrent");
  v83[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 11);
  v83[1] = &__kCFBooleanFalse;
  v82[2] = CFSTR("NameOverride");
  v83[2] = CFSTR("Wi-Fi Status / Scan");
  v19 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 3));
  if (v34)
    v20 = 30000000;
  else
    v20 = 4000000;
  v81[0] = &off_1000E3408;
  v80[0] = CFSTR("MaxAge");
  v80[1] = CFSTR("MaxSize");
  v81[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20);
  v80[2] = CFSTR("FilterContent");
  v81[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v43);
  v81[3] = &__kCFBooleanTrue;
  v80[3] = CFSTR("Compress");
  v80[4] = CFSTR("ExcludeMatching");
  v80[5] = CFSTR("NameOverride");
  v81[4] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", -[NSString substringToIndex:](v18, "substringToIndex:", 5));
  v81[5] = CFSTR("CoreCapture Collect (24h)");
  v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 6);
  v79[0] = v32;
  v79[1] = v19;
  v79[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000E6D40);
  v79[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0);
  v79[4] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0);
  v79[5] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 33, 0);
  v79[6] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0);
  v79[7] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000E6D68);
  v79[8] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, &off_1000E6D90);
  v79[9] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v21);
  v79[10] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 70, &off_1000E6DB8);
  v22 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 11);
  if (!v43)
    v22 = -[NSArray arrayByAddingObject:](v22, "arrayByAddingObject:", v30);
  v77[0] = CFSTR("Requests");
  v77[1] = CFSTR("RunConcurrent");
  v78[0] = v22;
  v78[1] = &__kCFBooleanTrue;
  v78[2] = v44;
  v77[2] = CFSTR("AddLeewayUUID");
  v77[3] = CFSTR("Timeout");
  v77[4] = CFSTR("NameOverride");
  v78[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33);
  v78[4] = CFSTR("Connectivity (PRE)");
  objc_msgSend(v41, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 5)));
  v76[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E6DE0);
  v76[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E6E08);
  v76[2] = -[W5LogManager __fastConnectivityDiagnosticsLogItemWithTimeout:](v42, "__fastConnectivityDiagnosticsLogItemWithTimeout:", 2000.0);
  v76[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E6E30);
  v76[4] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E6E58);
  v76[5] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 62, &off_1000E6E80);
  v74[0] = CFSTR("Requests");
  v74[1] = CFSTR("RunConcurrent");
  v75[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 6);
  v75[1] = &__kCFBooleanFalse;
  v75[2] = v44;
  v74[2] = CFSTR("AddLeewayUUID");
  v74[3] = CFSTR("Timeout");
  v74[4] = CFSTR("NameOverride");
  v75[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v35);
  v75[4] = CFSTR("Connectivity (DIAG)");
  objc_msgSend(v41, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v75, v74, 5)));
  v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~sysdiag~POST[%@]"), CFSTR("WiFiDebug"), -[NSString substringToIndex:](v18, "substringToIndex:", 5));
  v72[0] = CFSTR("IncludeMatching");
  v73[0] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v23);
  v72[1] = CFSTR("FilterContent");
  v73[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v43);
  v73[2] = &__kCFBooleanTrue;
  v72[2] = CFSTR("Compress");
  v72[3] = CFSTR("NameOverride");
  v73[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (%@)"), v23);
  v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
  v70[0] = v23;
  v69[0] = CFSTR("Reason");
  v69[1] = CFSTR("NameOverride");
  v70[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v23);
  v71[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 2));
  v67 = CFSTR("Delay");
  v68 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v40 - 400);
  v71[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
  v71[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v24);
  v65[0] = CFSTR("Requests");
  v65[1] = CFSTR("RunConcurrent");
  v66[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 3);
  v66[1] = &__kCFBooleanFalse;
  v65[2] = CFSTR("Timeout");
  v65[3] = CFSTR("NameOverride");
  v66[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v40);
  v66[3] = CFSTR("CoreCapture (POST)");
  v36 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v66, v65, 4));
  v63[0] = CFSTR("IncludeMatching");
  v64[0] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v38);
  v63[1] = CFSTR("FilterContent");
  v64[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v43);
  v64[2] = &__kCFBooleanTrue;
  v63[2] = CFSTR("Compress");
  v63[3] = CFSTR("NameOverride");
  v64[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (%@)"), v38);
  v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
  v60[0] = CFSTR("Delay");
  v60[1] = CFSTR("UseLeewayUUID");
  v61[0] = &off_1000E33F0;
  v61[1] = v44;
  v62[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));
  v62[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v25);
  v58[0] = CFSTR("Requests");
  v58[1] = CFSTR("RunConcurrent");
  v59[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 2);
  v59[1] = &__kCFBooleanFalse;
  v58[2] = CFSTR("Timeout");
  v58[3] = CFSTR("NameOverride");
  v59[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v40);
  v59[3] = CFSTR("CoreCapture (PRE)");
  v26 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 4));
  v55 = CFSTR("UUID");
  v56 = v37;
  v57[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
  v57[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6EA8);
  v53[0] = CFSTR("Requests");
  v53[1] = CFSTR("RunConcurrent");
  v54[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2);
  v54[1] = &__kCFBooleanFalse;
  v53[2] = CFSTR("NameOverride");
  v54[2] = CFSTR("TCP Dump (POST)");
  v39 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 3));
  v52[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E6ED0);
  v52[1] = -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](v42, "__environmentDiagnosticsLogItemWithTimeout:", 0.0);
  v50[0] = CFSTR("Requests");
  v50[1] = CFSTR("RunConcurrent");
  v51[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 2);
  v51[1] = &__kCFBooleanFalse;
  v50[2] = CFSTR("NameOverride");
  v51[2] = CFSTR("WiFi Env Diagnostics");
  v49[0] = v36;
  v49[1] = v26;
  v49[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 3));
  v49[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E6EF8);
  v49[4] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0);
  v47[0] = CFSTR("Delay");
  v47[1] = CFSTR("UseLeewayUUID");
  v48[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v40);
  v48[1] = v44;
  v49[5] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
  v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 6);
  if (!v43)
    v27 = -[NSArray arrayByAddingObject:](v27, "arrayByAddingObject:", v39);
  v45[0] = CFSTR("Requests");
  v45[1] = CFSTR("RunConcurrent");
  v46[0] = v27;
  v46[1] = &__kCFBooleanTrue;
  v46[2] = v44;
  v45[2] = CFSTR("UseLeewayUUID");
  v45[3] = CFSTR("Timeout");
  v45[4] = CFSTR("NameOverride");
  v46[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v40);
  v46[4] = CFSTR("Connectivity (POST)");
  objc_msgSend(v41, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 5)));
  return v41;
}

- (id)__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSString *v6;
  NSString *v7;
  NSDictionary *v8;
  uint64_t v9;
  NSString *v10;
  NSDictionary *v11;
  NSString *v12;
  W5LogItemRequest *v13;
  W5LogItemRequest *v14;
  uint64_t v15;
  W5LogItemRequest *v17;
  W5LogItemRequest *v18;
  W5LogItemRequest *v19;
  unsigned int v20;
  _QWORD v22[39];
  _QWORD v23[3];
  _QWORD v24[3];
  const __CFString *v25;
  NSString *v26;
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[3];
  const __CFString *v30;
  NSString *v31;
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];
  _QWORD v48[5];
  _QWORD v49[5];

  v4 = a4;
  v5 = a3;
  v20 = -[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", CFSTR("/sbin/ping"));
  v6 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~sysdiag~PRE[%@]"), CFSTR("WiFiDebug"), -[NSString substringToIndex:](v6, "substringToIndex:", 5));
  v49[0] = &off_1000E33A8;
  v48[0] = CFSTR("MaxCount");
  v48[1] = CFSTR("IncludeMatching");
  v49[1] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v7);
  v48[2] = CFSTR("FilterContent");
  v49[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5);
  v49[3] = &__kCFBooleanTrue;
  v48[3] = CFSTR("Compress");
  v48[4] = CFSTR("NameOverride");
  v49[4] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (%@)"), v7);
  v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 5);
  v45[1] = CFSTR("NameOverride");
  v46[0] = v7;
  v45[0] = CFSTR("Reason");
  v46[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v7);
  v47[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
  v47[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6F20);
  v47[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v8);
  v43[0] = CFSTR("Requests");
  v43[1] = CFSTR("RunConcurrent");
  v44[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3);
  v44[1] = &__kCFBooleanFalse;
  v43[2] = CFSTR("NameOverride");
  v44[2] = CFSTR("CoreCapture (PRE)");
  v19 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 3));
  if (v4)
    v9 = 30000000;
  else
    v9 = 4000000;
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~sysdiag~POST[%@]"), CFSTR("WiFiDebug"), -[NSString substringToIndex:](v6, "substringToIndex:", 5));
  v42[0] = &off_1000E3408;
  v41[0] = CFSTR("MaxAge");
  v41[1] = CFSTR("MaxSize");
  v42[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9);
  v41[2] = CFSTR("FilterContent");
  v42[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5);
  v42[3] = &__kCFBooleanTrue;
  v41[3] = CFSTR("Compress");
  v41[4] = CFSTR("NameOverride");
  v42[4] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (24h + %@)"), v10);
  v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 5);
  v39[0] = v10;
  v38[0] = CFSTR("Reason");
  v38[1] = CFSTR("NameOverride");
  v39[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v10);
  v40[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
  v40[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6F48);
  v40[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v11);
  v36[0] = CFSTR("Requests");
  v36[1] = CFSTR("RunConcurrent");
  v37[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3);
  v37[1] = &__kCFBooleanFalse;
  v36[2] = CFSTR("NameOverride");
  v37[2] = CFSTR("CoreCapture (POST + 24h)");
  v18 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));
  v35[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0);
  v35[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6F70);
  v35[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E6F98);
  v33[0] = CFSTR("Requests");
  v33[1] = CFSTR("RunConcurrent");
  v34[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3);
  v34[1] = &__kCFBooleanFalse;
  v33[2] = CFSTR("NameOverride");
  v34[2] = CFSTR("Wi-Fi Logs (24h)");
  v17 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
  v12 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v30 = CFSTR("UUID");
  v31 = v12;
  v32[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v32[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6FC0);
  v28[0] = CFSTR("Requests");
  v28[1] = CFSTR("RunConcurrent");
  v29[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2);
  v29[1] = &__kCFBooleanFalse;
  v28[2] = CFSTR("NameOverride");
  v29[2] = CFSTR("TCP Dump (Begin)");
  v13 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v25 = CFSTR("UUID");
  v26 = v12;
  v27[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v27[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000E6FE8);
  v23[0] = CFSTR("Requests");
  v23[1] = CFSTR("RunConcurrent");
  v24[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2);
  v24[1] = &__kCFBooleanFalse;
  v23[2] = CFSTR("NameOverride");
  v24[2] = CFSTR("TCP Dump (POST)");
  v14 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
  v22[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, 0);
  v22[1] = v19;
  v22[2] = v13;
  v22[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E7010);
  v22[4] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000E7038);
  v22[5] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E7060);
  if (v20)
    v15 = 2;
  else
    v15 = 43;
  v22[6] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", v15, 0);
  v22[7] = -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0);
  v22[8] = -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0);
  v22[9] = -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0);
  v22[10] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000E7088);
  v22[11] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 62, &off_1000E70B0);
  v22[12] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E70D8);
  v22[13] = v14;
  v22[14] = v18;
  v22[15] = v17;
  v22[16] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 70, &off_1000E7100);
  v22[17] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0);
  v22[18] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 30, 0);
  v22[19] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 33, 0);
  v22[20] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000E7128);
  v22[21] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000E7150);
  v22[22] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, &off_1000E7178);
  v22[23] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000E71A0);
  v22[24] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0);
  v22[25] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 9, 0);
  v22[26] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0);
  v22[27] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0);
  v22[28] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0);
  v22[29] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0);
  v22[30] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0);
  v22[31] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 57, 0);
  v22[32] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 74, 0);
  v22[33] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 51, 0);
  v22[34] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 78, &off_1000E71C8);
  v22[35] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 80, 0);
  v22[36] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 85, &off_1000E71F0);
  v22[37] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 84, &off_1000E7218);
  v22[38] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 88, &off_1000E7240);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 39);
}

- (id)__logItemsForBTSysdiagnoseWithFilteredContent:(BOOL)a3 timeout:(int64_t)a4
{
  _BOOL8 v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSDictionary *v19;
  NSString *v21;
  uint64_t v22;
  NSDictionary *v24;
  NSDictionary *v25;
  NSDictionary *v26;
  W5LogItemRequest *v27;
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[5];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[3];
  _QWORD v39[3];
  const __CFString *v40;
  NSNumber *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[5];
  int v47;
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  unint64_t v54;
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  _QWORD v58[6];

  v4 = a3;
  v30 = +[NSMutableArray array](NSMutableArray, "array");
  v5 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~sysdiag[%@]"), CFSTR("BluetoothDebug"), -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~AMFM~sysdiag[%@]"), CFSTR("BluetoothDebug"), -[NSString substringToIndex:](v5, "substringToIndex:", 5));
  v58[0] = &off_1000E33A8;
  v57[0] = CFSTR("MaxCount");
  v57[1] = CFSTR("IncludeMatching");
  v58[1] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v6);
  v57[2] = CFSTR("FilterContent");
  v58[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v58[3] = CFSTR("BT");
  v57[3] = CFSTR("Component");
  v57[4] = CFSTR("Compress");
  v58[4] = &__kCFBooleanTrue;
  v57[5] = CFSTR("NameOverride");
  v58[5] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (%@)"), v6);
  v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 6);
  v56[0] = &off_1000E33A8;
  v55[0] = CFSTR("MaxCount");
  v55[1] = CFSTR("IncludeMatching");
  v56[1] = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v7);
  v55[2] = CFSTR("FilterContent");
  v56[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v56[3] = CFSTR("MultiFunctionManager");
  v55[3] = CFSTR("Component");
  v55[4] = CFSTR("Compress");
  v56[4] = &__kCFBooleanTrue;
  v55[5] = CFSTR("NameOverride");
  v8 = v7;
  v21 = v7;
  v9 = a4;
  v56[5] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Collect (%@)"), v21);
  v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 6);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[NSDate timeIntervalSinceReferenceDate](-[W5LogItemRequestInternal addedAt](self->_activeRequest, "addedAt"), "timeIntervalSinceReferenceDate");
  v13 = (unint64_t)(v11 - v12);
  v14 = a4 - v13;
  v15 = (double)(uint64_t)(a4 - v13) * 0.4;
  if (v15 <= 2000.0)
    v15 = 2000.0;
  v16 = (unint64_t)v15;
  if ((unint64_t)v15 != 2000)
  {
    v17 = sub_10008F56C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v47 = 134218752;
      v48 = 2000;
      v49 = 2048;
      v50 = v16;
      v51 = 2048;
      v52 = a4;
      v53 = 2048;
      v54 = v13;
      LODWORD(v22) = 42;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] Adjusted CoreCapture delay (%lums --> %lums) based on specified timeout (%lums) and time elapsed since request was added (%lus)", &v47, v22, a4, v24);
    }
  }
  v18 = 9000;
  if (v14 > 9000)
    v18 = v9 - v13;
  v29 = v18 - 2000;
  v44[0] = CFSTR("Reason");
  v44[1] = CFSTR("Component");
  v45[0] = v6;
  v45[1] = CFSTR("BT");
  v44[2] = CFSTR("NameOverride");
  v45[2] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v6);
  v46[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 3));
  v42[0] = CFSTR("Reason");
  v42[1] = CFSTR("Component");
  v43[0] = v8;
  v43[1] = CFSTR("MultiFunctionManager");
  v42[2] = CFSTR("NameOverride");
  v43[2] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture Dump (%@)"), v8);
  v46[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));
  v40 = CFSTR("Delay");
  v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16);
  v46[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  v46[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v26);
  v46[4] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v24);
  v38[0] = CFSTR("Requests");
  v38[1] = CFSTR("RunConcurrent");
  v39[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 5);
  v39[1] = &__kCFBooleanFalse;
  v38[2] = CFSTR("NameOverride");
  v39[2] = CFSTR("CoreCapture (Dump)");
  v27 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));
  v36[0] = CFSTR("MaxAge");
  v36[1] = CFSTR("MaxSize");
  v37[0] = &off_1000E3408;
  v37[1] = &off_1000E3600;
  v36[2] = CFSTR("FilterContent");
  v37[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v37[3] = CFSTR("BT");
  v36[3] = CFSTR("Component");
  v36[4] = CFSTR("Compress");
  v36[5] = CFSTR("NameOverride");
  v37[4] = &__kCFBooleanTrue;
  v37[5] = CFSTR("CoreCapture Collect BT (24h)");
  v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
  v34[0] = CFSTR("MaxAge");
  v34[1] = CFSTR("MaxSize");
  v35[0] = &off_1000E3408;
  v35[1] = &off_1000E3618;
  v34[2] = CFSTR("FilterContent");
  v35[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v35[3] = CFSTR("MultiFunctionManager");
  v34[3] = CFSTR("Component");
  v34[4] = CFSTR("Compress");
  v34[5] = CFSTR("NameOverride");
  v35[4] = &__kCFBooleanTrue;
  v35[5] = CFSTR("CoreCapture Collect AMFM (24h)");
  v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 6);
  v33[0] = v27;
  v33[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000E7268);
  v33[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 30, 0);
  v33[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v25);
  v33[4] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v19);
  v31[0] = CFSTR("Requests");
  v31[1] = CFSTR("RunConcurrent");
  v32[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 5);
  v32[1] = &__kCFBooleanTrue;
  v31[2] = CFSTR("Timeout");
  v31[3] = CFSTR("NameOverride");
  v32[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29);
  v32[3] = CFSTR("Bluetooth Logs");
  objc_msgSend(v30, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 4)));
  return v30;
}

- (id)__model
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  id v7;

  v2 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService)
    return 0;
  v4 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("model"), kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", CFDataGetBytePtr(CFProperty), 4));
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  IOObjectRelease(v4);
  return v7;
}

- (id)__basicWiFiLogsWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSString *model;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSArray *v15;
  id v16;
  NSDictionary *v17;
  W5LogItemRequest *v18;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  _BOOL4 v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  const __CFString *v48;
  NSString *v49;
  _QWORD v50[4];
  int v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  int v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  int v66;

  v4 = a4;
  v23 = a3;
  v6 = +[NSMutableArray array](NSMutableArray, "array");
  model = self->_model;
  if (!model)
    goto LABEL_5;
  if (-[NSString rangeOfString:](model, "rangeOfString:", CFSTR("Watch1")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
    v9 = 1;
    goto LABEL_11;
  }
  v8 = self->_model;
  if (v8 && -[NSString rangeOfString:](v8, "rangeOfString:", CFSTR("Watch2")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 1;
    v9 = 2;
  }
  else
  {
LABEL_5:
    if (v4)
      v9 = 8;
    else
      v9 = 4;
    v10 = 1;
  }
LABEL_11:
  v11 = sub_10008F56C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_model;
    v51 = 136316930;
    v52 = "-[W5LogManager __basicWiFiLogsWithFilteredContent:useMegaWiFiProfileLimits:]";
    v53 = 2080;
    v54 = "W5LogManager.m";
    v55 = 1024;
    v56 = 2388;
    v57 = 2114;
    v58 = v12;
    v59 = 2048;
    v60 = v9;
    v61 = 1024;
    v62 = v10;
    v63 = 1024;
    v64 = v4;
    v65 = 1024;
    v66 = v10;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) Collecting WiFi logs for %{public}@ (cc count=%lu, compress=%d, megaWiFiProfile=%d, diagnostics=%d)", &v51, 66);
  }
  v22 = v9;
  v13 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~sysdiag"), CFSTR("WiFiDebug"));
  v48 = CFSTR("TimestampUUID");
  v49 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v21 = v49;
  v50[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
  v50[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000E7290);
  v50[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000E72B8);
  v50[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E72E0);
  v46[0] = CFSTR("Requests");
  v46[1] = CFSTR("RunConcurrent");
  v47[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 4);
  v47[1] = &__kCFBooleanFalse;
  v46[2] = CFSTR("NameOverride");
  v47[2] = CFSTR("Wi-Fi Status / Scan");
  v45[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 3));
  v43[0] = CFSTR("Reason");
  v43[1] = CFSTR("TimestampUUID");
  v44[0] = v14;
  v20 = v13;
  v44[1] = v13;
  v45[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
  v45[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 70, &off_1000E7308);
  v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3);
  if ((_DWORD)v10)
  {
    v16 = +[NSMutableArray array](NSMutableArray, "array");
    objc_msgSend(v16, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E7330));
    objc_msgSend(v16, "addObject:", -[W5LogManager __fastConnectivityDiagnosticsLogItemWithTimeout:](self, "__fastConnectivityDiagnosticsLogItemWithTimeout:", 0.0));
    objc_msgSend(v16, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000E7358));
    v41[0] = CFSTR("Requests");
    v41[1] = CFSTR("RunConcurrent");
    v42[0] = v16;
    v42[1] = &__kCFBooleanFalse;
    v41[2] = CFSTR("NameOverride");
    v42[2] = CFSTR("Wi-Fi Diagnostics");
    v15 = -[NSArray arrayByAddingObject:](v15, "arrayByAddingObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 3)));
  }
  v39[0] = CFSTR("Requests");
  v39[1] = CFSTR("RunConcurrent");
  v40[0] = v15;
  v40[1] = &__kCFBooleanTrue;
  v39[2] = CFSTR("Timeout");
  v39[3] = CFSTR("NameOverride");
  v40[2] = &off_1000E3630;
  v40[3] = CFSTR("Wi-Fi Status / Diagnostics");
  objc_msgSend(v6, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 4)));
  v37[0] = CFSTR("MaxCount");
  v38[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v22);
  v37[1] = CFSTR("FilterContent");
  v38[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v23);
  v37[2] = CFSTR("Compress");
  v38[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10);
  v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v34[0] = CFSTR("Delay");
  v34[1] = CFSTR("TimestampUUID");
  v35[0] = &off_1000E3648;
  v35[1] = v20;
  v36[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
  v36[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, v17);
  v32[0] = CFSTR("Requests");
  v32[1] = CFSTR("RunConcurrent");
  v33[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2);
  v32[2] = CFSTR("Timeout");
  v32[3] = CFSTR("NameOverride");
  v33[1] = &__kCFBooleanFalse;
  v33[2] = &off_1000E33F0;
  v33[3] = CFSTR("CoreCapture");
  v18 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));
  v29[0] = CFSTR("Delay");
  v29[1] = CFSTR("TimestampUUID");
  v30[0] = &off_1000E3450;
  v30[1] = v21;
  v31[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v31[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000E7380);
  v27[0] = CFSTR("Requests");
  v27[1] = CFSTR("RunConcurrent");
  v28[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2);
  v28[1] = &__kCFBooleanFalse;
  v27[2] = CFSTR("Timeout");
  v27[3] = CFSTR("NameOverride");
  v28[2] = &off_1000E33F0;
  v28[3] = CFSTR("WiFi Logs");
  v26[0] = v18;
  v26[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
  v26[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0);
  v26[3] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000E73A8);
  v24[0] = CFSTR("Requests");
  v24[1] = CFSTR("RunConcurrent");
  v25[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4);
  v24[2] = CFSTR("Timeout");
  v24[3] = CFSTR("NameOverride");
  v25[1] = &__kCFBooleanTrue;
  v25[2] = &off_1000E3660;
  v25[3] = CFSTR("Collect WiFi / CoreCapture");
  objc_msgSend(v6, "addObject:", +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 4)));
  return v6;
}

- (id)__expandLogItems:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id result;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v18 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("UseMegaWiFiProfileLimits")), "BOOLValue");
  v8 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FilterContent"));
  if (v8)
  {
    v9 = objc_msgSend(v8, "BOOLValue");
  }
  else
  {
    os_variant_has_internal_diagnostics("com.apple.wifivelocity");
    v9 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        switch((unint64_t)objc_msgSend(v14, "itemID"))
        {
          case '6':
          case 'M':
            v15 = -[W5LogManager __logItemsForWiFiDiagnosticsApp](self, "__logItemsForWiFiDiagnosticsApp");
            goto LABEL_24;
          case '7':
            v15 = -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:](self, "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~wdext"), CFSTR("WiFiDebug")));
            goto LABEL_24;
          case '8':
            v16 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Timeout")), "integerValue");
            if (v16)
              v15 = -[W5LogManager __logItemsForSysdiagnoseWithFilteredContent:useMegaWiFiProfileLimits:timeout:](self, "__logItemsForSysdiagnoseWithFilteredContent:useMegaWiFiProfileLimits:timeout:", v9, v18, v16);
            else
              v15 = -[W5LogManager __logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:useMegaWiFiProfileLimits:](self, "__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:useMegaWiFiProfileLimits:", v9, v18);
            goto LABEL_24;
          case ';':
            v15 = -[W5LogManager __logItemsForFeedbackAssistant](self, "__logItemsForFeedbackAssistant");
            goto LABEL_24;
          case '<':
            v15 = -[W5LogManager __logItemsForTapToRadar](self, "__logItemsForTapToRadar");
            goto LABEL_24;
          case 'C':
            v15 = -[W5LogManager __logItemsForInternalWiFiSettings](self, "__logItemsForInternalWiFiSettings");
            goto LABEL_24;
          case 'G':
            v15 = -[W5LogManager __logItemsForDumpLogsEventWithReason:filteredContent:](self, "__logItemsForDumpLogsEventWithReason:filteredContent:", objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", CFSTR("Reason")), v9);
            goto LABEL_24;
          case 'H':
            v15 = -[W5LogManager __logItemsForDatapathStallEventWithFilteredContent:](self, "__logItemsForDatapathStallEventWithFilteredContent:", v9);
            goto LABEL_24;
          case 'O':
            v15 = -[W5LogManager __logItemsForBTSysdiagnoseWithFilteredContent:timeout:](self, "__logItemsForBTSysdiagnoseWithFilteredContent:timeout:", v9, objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Timeout")), "integerValue"));
            goto LABEL_24;
          case 'R':
            v15 = -[W5LogManager __logItemsForABCWithReason:filteredContent:](self, "__logItemsForABCWithReason:filteredContent:", objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", CFSTR("Reason")), v9);
            goto LABEL_24;
          case 'S':
            v15 = -[W5LogManager __logItemsForBackgroundEventWithReason:filteredContent:](self, "__logItemsForBackgroundEventWithReason:filteredContent:", objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", CFSTR("Reason")), v9);
LABEL_24:
            objc_msgSend(v7, "addObjectsFromArray:", -[W5LogManager __expandLogItems:configuration:](self, "__expandLogItems:configuration:", v15, a4));
            break;
          default:
            objc_msgSend(v7, "addObject:", v14);
            break;
        }
      }
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  result = objc_msgSend(v7, "count");
  if (result)
    return objc_msgSend(v7, "copy");
  return result;
}

- (void)__runRequest:(id)a3 reply:(id)a4
{
  id v7;
  NSObject *debugLogQueue;
  NSURL *v9;
  NSURL *v10;
  NSURL *v11;
  NSOperationQueue *v12;
  _QWORD v13[10];
  _QWORD block[7];
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v7 = -[W5LogManager __expandLogItems:configuration:](self, "__expandLogItems:configuration:", objc_msgSend(a3, "itemRequests"), objc_msgSend(a3, "configuration"));
  debugLogQueue = self->_debugLogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DD38;
  block[3] = &unk_1000D58F8;
  block[4] = self;
  block[5] = a3;
  block[6] = v7;
  dispatch_sync(debugLogQueue, block);
  v9 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")), "URLByAppendingPathComponent:", objc_msgSend(a3, "filename"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue"))v9 = -[NSURL URLByDeletingPathExtension](v9, "URLByDeletingPathExtension");
  v10 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/var/mobile"), 1);
  if (v9 && (v11 = v10) != 0)
  {
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSURL path](v9, "path"), 1, 0, 0);
    v12 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005DF88;
    v13[3] = &unk_1000D6180;
    v13[4] = a3;
    v13[5] = v7;
    v13[6] = self;
    v13[7] = v9;
    v13[8] = v11;
    v13[9] = a4;
    -[NSOperationQueue addOperationWithBlock:](v12, "addOperationWithBlock:", v13);
  }
  else if (a4)
  {
    v15 = NSLocalizedFailureReasonErrorKey;
    v16 = CFSTR("W5ResourceErr");
    (*((void (**)(id, NSError *, _QWORD, _QWORD))a4 + 2))(a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)), 0, 0);
  }
}

- (id)__collectWiFiScanResults:(id)a3
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  const __CFString *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSURL *v15;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseScanCache")), "BOOLValue");
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Use6GHzFollowup")), "BOOLValue");
  v9 = objc_msgSend(v6, "path");
  if ((_DWORD)v7)
    v10 = CFSTR("wifi_scan_cache.txt");
  else
    v10 = CFSTR("wifi_scan.txt");
  v11 = objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
  v12 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v12, "setIncludeHiddenNetworks:", 1);
  objc_msgSend(v12, "setMergeScanResults:", 0);
  objc_msgSend(v12, "setCacheOnly:", v7);
  if (v8)
    v13 = 768;
  else
    v13 = 512;
  objc_msgSend(v12, "setScanFlags:", v13);
  objc_msgSend(v12, "setChannels:", -[CWFInterface supportedChannelsWithCountryCode:](-[W5StatusManager corewifi](self->_status, "corewifi"), "supportedChannelsWithCountryCode:", 0));
  objc_msgSend(v12, "setIncludeProperties:", +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E8058));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v11, objc_msgSend(+[W5LogManager __logScanResults:](W5LogManager, "__logScanResults:", -[CWFInterface performScanWithParameters:error:](-[W5StatusManager corewifi](self->_status, "corewifi"), "performScanWithParameters:error:", v12, 0)), "dataUsingEncoding:", 4), 0))
  {
    v15 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10);
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDiagnostics:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  id v10;
  id v11;
  NSFileManager *v12;
  id v13;
  const __CFString *v14;
  uint64_t v16;
  const __CFString *v17;
  id v18;
  NSURL *v19;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = +[NSMutableString string](NSMutableString, "string");
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("DiagnosticsTests"));
  v9 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("FileNameOverride"));
  v16 = 0;
  v10 = -[W5LogManager __runDiagnosticsTests:configuration:timeout:error:](self, "__runDiagnosticsTests:configuration:timeout:error:", v8, objc_msgSend(a3, "configuration"), 0, &v16);
  objc_msgSend(v6, "appendString:", CFSTR("# --- Diagnostics\n\n"));
  if ((-[CWFInterface powerOn](-[W5StatusManager corewifi](self->_status, "corewifi"), "powerOn") & 1) == 0)
    objc_msgSend(v6, "appendString:", CFSTR("!!! Wi-Fi is OFF\n\n"));
  objc_msgSend(v6, "appendString:", -[W5LogManager __logDiagnosticsTestResults:](self, "__logDiagnosticsTestResults:", v10));
  v11 = -[W5LogManager __logDiagnosticsPingResults:](self, "__logDiagnosticsPingResults:", v10);
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v6, "appendString:", CFSTR("\n\n\n# --- Ping Results\n\n"));
    objc_msgSend(v6, "appendString:", v11);
  }
  objc_msgSend(v6, "appendString:", CFSTR("\n\n"));
  v12 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v13 = objc_msgSend(v7, "path");
  if (v9)
    v14 = v9;
  else
    v14 = CFSTR("diagnostics.txt");
  if (-[NSFileManager createFileAtPath:contents:attributes:](v12, "createFileAtPath:contents:attributes:", objc_msgSend(v13, "stringByAppendingPathComponent:", v14), objc_msgSend(v6, "dataUsingEncoding:", 4), 0))
  {
    v19 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14);
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  }
  if (v10)
  {
    v17 = CFSTR("DiagnosticsResults");
    v18 = v10;
    objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectPerSSIDDiagnosticsHistory:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  NSString *v15;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v17 = v5;
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v18 = +[NSMutableArray array](NSMutableArray, "array");
  v7 = -[W5DiagnosticsManager diagnosticsHistory](self->_diagnostics, "diagnosticsHistory");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = objc_msgSend(v7, "allKeys");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", v12), "allValues"), "sortedArrayUsingComparator:", &stru_1000D6D60);
        v14 = +[NSMutableString string](NSMutableString, "string");
        objc_msgSend(v14, "appendFormat:", CFSTR("# --- Diagnostics (%@)\n\n"), v12);
        objc_msgSend(v14, "appendString:", -[W5LogManager __logDiagnosticsTestResults:](self, "__logDiagnosticsTestResults:", v13));
        objc_msgSend(v14, "appendString:", CFSTR("\n\n"));
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-diagnostics.txt"), v12);
        if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", v15), objc_msgSend(v14, "dataUsingEncoding:", 4), 0))
        {
          objc_msgSend(v18, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15));
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  objc_msgSend(v17, "setRelativeURLs:", v18);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "setCompletedAt:");
  return v17;
}

- (id)__collectPeerDiagnostics:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  NSURL *v18;
  _BYTE v19[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = +[NSMutableString string](NSMutableString, "string");
  v8 = -[W5PeerDiagnosticsManager gatherPeerDiagnostics](self->_peerDiagnostics, "gatherPeerDiagnostics");
  objc_msgSend(v7, "appendFormat:", CFSTR("# --- Peer Diagnostics from %lu devices\n\n"), objc_msgSend(v8, "count"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }
  objc_msgSend(v7, "appendString:", CFSTR("\n\n"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("peer_diagnostics.txt")), objc_msgSend(v7, "dataUsingEncoding:", 4), 0))
  {
    v18 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("peer_diagnostics.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectLeakyAPStats:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSURL *v9;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v7, "appendString:", CFSTR("# --- Leaky AP Stats\n\n"));
  objc_msgSend(v7, "appendString:", sub_10001CF4C((uint64_t)objc_msgSend(-[CWFInterface leakyAPStats](-[W5StatusManager corewifi](self->_status, "corewifi"), "leakyAPStats"), "bytes")));
  objc_msgSend(v7, "appendString:", CFSTR("\n\n"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("leaky_ap_stats.txt")), objc_msgSend(v7, "dataUsingEncoding:", 4), 0))
  {
    v9 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("leaky_ap_stats.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__browseBonjourInstancesWithServiceType:(id)a3 duration:(unint64_t)a4
{
  id v6;
  NSMutableData *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v6 = +[NSMutableArray array](NSMutableArray, "array");
  v7 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
  v20[0] = CFSTR("-B");
  v20[1] = a3;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", CFSTR("/usr/bin/dns-sd"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2), v7, 0, 0, 0, (double)a4, 0);
  if (-[NSMutableData length](v7, "length"))
  {
    v8 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4), "componentsSeparatedByString:", CFSTR("\n"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), "mutableCopy");
          objc_msgSend(v13, "removeObject:", &stru_1000D8750);
          if (objc_msgSend(v13, "count") == (id)7)
            objc_msgSend(v6, "addObject:", objc_msgSend(v13, "objectAtIndexedSubscript:", 6));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
  }
  return objc_msgSend(v6, "copy");
}

- (id)__resolveBonjourInstance:(id)a3 serviceType:(id)a4 duration:(unint64_t)a5
{
  NSMutableData *v8;
  id result;
  _QWORD v10[3];

  v8 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
  v10[0] = CFSTR("-L");
  v10[1] = a3;
  v10[2] = a4;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", CFSTR("/usr/bin/dns-sd"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3), v8, 0, 0, 0, (double)a5, 0);
  result = -[NSMutableData length](v8, "length");
  if (result)
    return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
  return result;
}

- (id)__collectBonjourRecords:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  NSURL *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v7, "appendString:", CFSTR("# --- Bonjour Records\n\n"));
  v8 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:](self, "__browseBonjourInstancesWithServiceType:duration:", CFSTR("_appletv-v2._tcp"), 1);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v12), CFSTR("_appletv-v2._tcp"), 1));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v10);
  }
  v13 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:](self, "__browseBonjourInstancesWithServiceType:duration:", CFSTR("_airport._tcp"), 1);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v17), CFSTR("_airport._tcp"), 1));
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v15);
  }
  v18 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:](self, "__browseBonjourInstancesWithServiceType:duration:", CFSTR("_homekit._tcp"), 1);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v22), CFSTR("_homekit._tcp"), 1));
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v20);
  }
  v23 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:](self, "__browseBonjourInstancesWithServiceType:duration:", CFSTR("_hap._tcp"), 1);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v27), CFSTR("_hap._tcp"), 1));
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
    }
    while (v25);
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("bonjour_records.txt")), objc_msgSend(v7, "dataUsingEncoding:", 4), 0))
  {
    v45 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("bonjour_records.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectAWDLStatus:(id)a3
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  W5StatusManager *status;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSFileHandle *v16;
  NSURL *v18;
  _QWORD v19[2];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v8)
    v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "awdl");
  else
    v10 = -[W5StatusManager awdlStatus](status, "awdlStatus");
  v11 = v10;
  v12 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v12, "appendString:", CFSTR("# --- AWDL Status\n\n"));
  objc_msgSend(v12, "appendString:", -[W5LogManager __logAWDLStatus:](self, "__logAWDLStatus:", v11));
  objc_msgSend(v12, "appendString:", CFSTR("\n\n"));
  v13 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("awdl_status.txt"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v13, objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    v14 = objc_msgSend(v11, "interfaceName");
    if (v14)
    {
      v15 = v14;
      v16 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v13);
      -[NSFileHandle seekToEndOfFile](v16, "seekToEndOfFile");
      v19[0] = v15;
      v19[1] = CFSTR("-dbg=print_sr");
      -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v16, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2), 1, 0);
      -[NSFileHandle closeFile](v16, "closeFile");
    }
    v18 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("awdl_status.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectNetworkStatus:(id)a3
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  W5StatusManager *status;
  id v10;
  id v11;
  id v12;
  NSURL *v14;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v8)
    v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "network");
  else
    v10 = -[W5StatusManager networkStatus](status, "networkStatus");
  v11 = v10;
  v12 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v12, "appendString:", CFSTR("# --- Network Status\n\n"));
  objc_msgSend(v12, "appendString:", +[W5LogManager __logNetworkStatus:](W5LogManager, "__logNetworkStatus:", v11));
  objc_msgSend(v12, "appendString:", CFSTR("\n\n"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("network_status.txt")), objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    v14 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("network_status.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiStatus:(id)a3
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  W5StatusManager *status;
  id v10;
  id v11;
  id v12;
  NSURL *v14;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v8)
    v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "wifi");
  else
    v10 = -[W5StatusManager wifiStatus](status, "wifiStatus");
  v11 = v10;
  v12 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v12, "appendString:", CFSTR("# --- Wi-Fi Status\n\n"));
  objc_msgSend(v12, "appendString:", +[W5LogManager __logWiFiStatus:](W5LogManager, "__logWiFiStatus:", v11));
  objc_msgSend(v12, "appendString:", CFSTR("\n\n"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("wifi_status.txt")), objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    v14 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wifi_status.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectBluetoothStatus:(id)a3
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  W5StatusManager *status;
  id v10;
  id v11;
  id v12;
  NSURL *v14;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v8)
    v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "bluetooth");
  else
    v10 = -[W5StatusManager bluetoothStatus](status, "bluetoothStatus");
  v11 = v10;
  v12 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v12, "appendString:", CFSTR("# --- Bluetooth Status\n\n"));
  objc_msgSend(v12, "appendString:", +[W5LogManager __logBluetoothStatus:](W5LogManager, "__logBluetoothStatus:", v11));
  objc_msgSend(v12, "appendString:", CFSTR("\n\n"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("bluetooth_status.txt")), objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    v14 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("bluetooth_status.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_swvers:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/sw_vers"), 0, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("sw_vers.txt")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("sw_vers.txt"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_arp:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  NSFileHandle *v9;
  NSFileHandle *v10;
  _UNKNOWN **v11;
  NSURL *v13;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("ResolveHostnames")), "BOOLValue");
  v8 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("arp.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v8, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v8, 0, 0);
  v9 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v8);
  if (v9)
  {
    v10 = v9;
    if (v7)
      v11 = &off_1000E8070;
    else
      v11 = &off_1000E8088;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v9, CFSTR("/usr/sbin/arp"), v11);
    -[NSFileHandle closeFile](v10, "closeFile");
    v13 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("arp.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemProfiler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v18 = 0;
  v6 = -[W5LogManager __collectLogItemCallout:baseURL:error:](self, "__collectLogItemCallout:baseURL:error:", a3, &v18, 0);
  v7 = v6;
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "relativeURLs", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          sub_10009009C(objc_msgSend(v18, "URLByAppendingPathComponent:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "path")), objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "path")), 0);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v10);
    }
  }
  return v7;
}

- (id)__collectLogItemCallout:(id)a3 baseURL:(id *)a4 error:(id *)a5
{
  NSObject *v9;
  void (**collectLogItemCallback)(id, id, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_time_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3052000000;
  v40 = sub_100058028;
  v41 = sub_100058038;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = sub_100058028;
  v35 = sub_100058038;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = sub_100058028;
  v29 = sub_100058038;
  v30 = 0;
  v9 = dispatch_semaphore_create(0);
  collectLogItemCallback = (void (**)(id, id, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))self->_collectLogItemCallback;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100060F34;
  v24[3] = &unk_1000D6D88;
  v24[6] = &v31;
  v24[7] = &v25;
  v24[4] = v9;
  v24[5] = &v37;
  collectLogItemCallback[2](collectLogItemCallback, a3, v24, v11, v12, v13, v14, v15);
  v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v16) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v44 = 0x404E000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v17 = (id)v38[5];
  v18 = (id)v32[5];
  v19 = (id)v26[5];
  if (a4)
  {
    v20 = (void *)v32[5];
    if (v20)
      *a4 = v20;
  }
  if (a5)
  {
    v21 = (void *)v38[5];
    if (v21)
      *a5 = v21;
  }
  v22 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v22;
}

- (id)__collect_IMFoundationPing:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  double v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  double v21;
  const __CFString *v22;
  uint64_t v23;
  id v24;
  id v25;
  double v26;
  const __CFString *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  NSURL *v38;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v37 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = +[NSMutableData data](NSMutableData, "data");
  v7 = +[NSMutableString string](NSMutableString, "string");
  if ((-[CWFInterface powerOn](-[W5StatusManager corewifi](self->_status, "corewifi"), "powerOn") & 1) == 0)
    objc_msgSend(v7, "appendString:", CFSTR("!!! Wi-Fi is OFF\n\n"));
  objc_msgSend(v7, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v7, "appendString:", CFSTR("Ping localhost (loopback)\n"));
  objc_msgSend(v7, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v8 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:](self, "__pingUsingIMFoundationWithAddress:timeout:", CFSTR("localhost"), 1);
  objc_msgSend(v8, "packetLoss");
  if (v9 >= 100.0)
    v10 = CFSTR("FAIL");
  else
    v10 = CFSTR("PASS");
  objc_msgSend(v8, "min");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v10, v11);
  objc_msgSend(v6, "appendData:", objc_msgSend(v7, "dataUsingEncoding:", 4));
  v12 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  if (v12
    || (v12 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress")) != 0)
  {
    v13 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v13, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
    objc_msgSend(v13, "appendFormat:", CFSTR("Ping LAN (%@)\n"), v12);
    objc_msgSend(v13, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
    v14 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:](self, "__pingUsingIMFoundationWithAddress:timeout:", v12, 1);
    objc_msgSend(v14, "packetLoss");
    if (v15 >= 100.0)
      v16 = CFSTR("FAIL");
    else
      v16 = CFSTR("PASS");
    objc_msgSend(v14, "min");
    objc_msgSend(v13, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v16, v17);
    objc_msgSend(v6, "appendData:", objc_msgSend(v13, "dataUsingEncoding:", 4));
  }
  v18 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v18, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v18, "appendFormat:", CFSTR("Ping WAN\n"));
  objc_msgSend(v18, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v19 = objc_msgSend(-[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "DNSServerAddresses"), "firstObject");
  v20 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:](self, "__pingUsingIMFoundationWithAddress:timeout:", v19, 1);
  objc_msgSend(v20, "packetLoss");
  if (v21 >= 100.0)
    v22 = CFSTR("FAIL");
  else
    v22 = CFSTR("PASS");
  objc_msgSend(v20, "min");
  objc_msgSend(v18, "appendFormat:", CFSTR("%@ -- %@ -- %.2f ms\n"), v19, v22, v23);
  v24 = sub_10008EF00();
  v25 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:](self, "__pingUsingIMFoundationWithAddress:timeout:", v24, 1);
  objc_msgSend(v25, "packetLoss");
  if (v26 >= 100.0)
    v27 = CFSTR("FAIL");
  else
    v27 = CFSTR("PASS");
  objc_msgSend(v25, "min");
  objc_msgSend(v18, "appendFormat:", CFSTR("%@ -- %@ -- %.2f ms\n\n"), v24, v27, v28);
  objc_msgSend(v6, "appendData:", objc_msgSend(v18, "dataUsingEncoding:", 4));
  v29 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v29, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v29, "appendFormat:", CFSTR("Ping Performance (%@)\n"), v12);
  objc_msgSend(v29, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v30 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:](self, "__pingUsingIMFoundationWithAddress:timeout:", v12, 10);
  objc_msgSend(v29, "appendFormat:", CFSTR("count=%ld\n"), objc_msgSend(v30, "count"));
  objc_msgSend(v30, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("min=%.2f ms\n"), v31);
  objc_msgSend(v30, "max");
  objc_msgSend(v29, "appendFormat:", CFSTR("max=%.2f ms\n"), v32);
  objc_msgSend(v30, "avg");
  objc_msgSend(v29, "appendFormat:", CFSTR("avg=%.2f ms\n"), v33);
  objc_msgSend(v30, "stddev");
  objc_msgSend(v29, "appendFormat:", CFSTR("stddev=%.2f ms\n"), v34);
  objc_msgSend(v30, "packetLoss");
  objc_msgSend(v29, "appendFormat:", CFSTR("loss=%.2f%%\n"), v35);
  objc_msgSend(v6, "appendData:", objc_msgSend(v29, "dataUsingEncoding:", 4));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v37, "path"), "stringByAppendingPathComponent:", CFSTR("ping-IMFoundation.txt")), v6, 0))
  {
    v38 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ping-IMFoundation.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_ping:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  double v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  double v16;
  const __CFString *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  double v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  id v26;
  double v27;
  const __CFString *v28;
  uint64_t v29;
  id v30;
  id v31;
  double v32;
  const __CFString *v33;
  uint64_t v34;
  id v35;
  double v36;
  const __CFString *v37;
  uint64_t v38;
  id v39;
  double v40;
  const __CFString *v41;
  uint64_t v42;
  id v43;
  double v44;
  const __CFString *v45;
  uint64_t v46;
  id v47;
  double v48;
  const __CFString *v49;
  uint64_t v50;
  id v51;
  double v52;
  const __CFString *v53;
  uint64_t v54;
  id v55;
  double v56;
  const __CFString *v57;
  uint64_t v58;
  id v59;
  double v60;
  const __CFString *v61;
  uint64_t v62;
  id v63;
  double v64;
  const __CFString *v65;
  uint64_t v66;
  id v67;
  double v68;
  const __CFString *v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  double v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  void *i;
  void *v86;
  id v87;
  NSDateFormatter *dateFormatter;
  NSString *v89;
  NSDateFormatter *v90;
  id v92;
  void *v93;
  W5LogManager *v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  NSURL *v100;
  _BYTE v101[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v92 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = +[NSMutableArray array](NSMutableArray, "array");
  v95 = +[NSMutableData data](NSMutableData, "data");
  v7 = +[NSMutableString string](NSMutableString, "string");
  if ((-[CWFInterface powerOn](-[W5StatusManager corewifi](self->_status, "corewifi"), "powerOn") & 1) == 0)
    objc_msgSend(v7, "appendString:", CFSTR("!!! Wi-Fi is OFF\n\n"));
  v93 = v5;
  objc_msgSend(v7, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v7, "appendString:", CFSTR("Ping localhost (loopback)\n"));
  objc_msgSend(v7, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v8 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", CFSTR("localhost"), 1, 0, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 10, 2.0, 2.0, 0.1);
  if (v8)
    objc_msgSend(v6, "addObject:", v8);
  objc_msgSend(v8, "packetLoss");
  v9 = CFSTR("FAIL");
  if (v10 >= 100.0)
    v11 = CFSTR("FAIL");
  else
    v11 = CFSTR("PASS");
  objc_msgSend(v8, "min");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v11, v12);
  objc_msgSend(v95, "appendData:", objc_msgSend(v7, "dataUsingEncoding:", 4));
  v13 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  if (v13
    || (v13 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress")) != 0)
  {
    v14 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v14, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
    objc_msgSend(v14, "appendFormat:", CFSTR("Ping LAN (%@)\n"), v13);
    objc_msgSend(v14, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
    v15 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v13, 1, 0, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 11, 2.0, 2.0, 0.1);
    if (v15)
      objc_msgSend(v6, "addObject:", v15);
    objc_msgSend(v15, "packetLoss");
    if (v16 >= 100.0)
      v17 = CFSTR("FAIL");
    else
      v17 = CFSTR("PASS");
    objc_msgSend(v15, "min");
    objc_msgSend(v14, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v17, v18);
    objc_msgSend(v95, "appendData:", objc_msgSend(v14, "dataUsingEncoding:", 4));
  }
  v19 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v19, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v19, "appendString:", CFSTR("Ping WAN\n"));
  objc_msgSend(v19, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v20 = objc_msgSend(-[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "DNSServerAddresses"), "firstObject");
  v21 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v20, 1, 0, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 12, 2.0, 2.0, 0.1);
  if (v21)
    objc_msgSend(v6, "addObject:", v21);
  objc_msgSend(v21, "packetLoss");
  if (v22 >= 100.0)
    v23 = CFSTR("FAIL");
  else
    v23 = CFSTR("PASS");
  objc_msgSend(v21, "min");
  objc_msgSend(v19, "appendFormat:", CFSTR("%@ -- %@ -- %.2f ms\n"), v20, v23, v24);
  v25 = sub_10008EF00();
  v26 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, 0, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 13, 2.0, 2.0, 0.1);
  if (v26)
    objc_msgSend(v6, "addObject:", v26);
  objc_msgSend(v26, "packetLoss");
  if (v27 >= 100.0)
    v28 = CFSTR("FAIL");
  else
    v28 = CFSTR("PASS");
  objc_msgSend(v26, "min");
  objc_msgSend(v19, "appendFormat:", CFSTR("%@ -- %@ -- %.2f ms\n\n"), v25, v28, v29);
  objc_msgSend(v95, "appendData:", objc_msgSend(v19, "dataUsingEncoding:", 4));
  v30 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v30, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v30, "appendFormat:", CFSTR("Ping QOS (%@)\n"), v13);
  objc_msgSend(v30, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v31 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3480, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 14, 2.0, 2.0, 0.1);
  if (v31)
    objc_msgSend(v6, "addObject:", v31);
  objc_msgSend(v31, "packetLoss");
  if (v32 >= 100.0)
    v33 = CFSTR("FAIL");
  else
    v33 = CFSTR("PASS");
  objc_msgSend(v31, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("BE -- %@ -- %.2f ms\n"), v33, v34);
  v35 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3918, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 15, 2.0, 2.0, 0.1);
  if (v35)
    objc_msgSend(v6, "addObject:", v35);
  objc_msgSend(v35, "packetLoss");
  if (v36 >= 100.0)
    v37 = CFSTR("FAIL");
  else
    v37 = CFSTR("PASS");
  objc_msgSend(v35, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("BK_SYS -- %@ -- %.2f ms\n"), v37, v38);
  v39 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3498, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 16, 2.0, 2.0, 0.1);
  if (v39)
    objc_msgSend(v6, "addObject:", v39);
  objc_msgSend(v39, "packetLoss");
  if (v40 >= 100.0)
    v41 = CFSTR("FAIL");
  else
    v41 = CFSTR("PASS");
  objc_msgSend(v39, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("BK -- %@ -- %.2f ms\n"), v41, v42);
  v43 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3930, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 17, 2.0, 2.0, 0.1);
  if (v43)
    objc_msgSend(v6, "addObject:", v43);
  objc_msgSend(v43, "packetLoss");
  if (v44 >= 100.0)
    v45 = CFSTR("FAIL");
  else
    v45 = CFSTR("PASS");
  objc_msgSend(v43, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("RD -- %@ -- %.2f ms\n"), v45, v46);
  v47 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3948, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 18, 2.0, 2.0, 0.1);
  if (v47)
    objc_msgSend(v6, "addObject:", v47);
  objc_msgSend(v47, "packetLoss");
  if (v48 >= 100.0)
    v49 = CFSTR("FAIL");
  else
    v49 = CFSTR("PASS");
  objc_msgSend(v47, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("OAM -- %@ -- %.2f ms\n"), v49, v50);
  v51 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3960, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 19, 2.0, 2.0, 0.1);
  if (v51)
    objc_msgSend(v6, "addObject:", v51);
  objc_msgSend(v51, "packetLoss");
  if (v52 >= 100.0)
    v53 = CFSTR("FAIL");
  else
    v53 = CFSTR("PASS");
  objc_msgSend(v51, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("AV -- %@ -- %.2f ms\n"), v53, v54);
  v55 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3978, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 20, 2.0, 2.0, 0.1);
  if (v55)
    objc_msgSend(v6, "addObject:", v55);
  objc_msgSend(v55, "packetLoss");
  if (v56 >= 100.0)
    v57 = CFSTR("FAIL");
  else
    v57 = CFSTR("PASS");
  objc_msgSend(v55, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("RV -- %@ -- %.2f ms\n"), v57, v58);
  v59 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E34B0, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 21, 2.0, 2.0, 0.1);
  if (v59)
    objc_msgSend(v6, "addObject:", v59);
  objc_msgSend(v59, "packetLoss");
  if (v60 >= 100.0)
    v61 = CFSTR("FAIL");
  else
    v61 = CFSTR("PASS");
  objc_msgSend(v59, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("VI -- %@ -- %.2f ms\n"), v61, v62);
  v63 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E34E0, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 22, 2.0, 2.0, 0.1);
  if (v63)
    objc_msgSend(v6, "addObject:", v63);
  objc_msgSend(v63, "packetLoss");
  if (v64 >= 100.0)
    v65 = CFSTR("FAIL");
  else
    v65 = CFSTR("PASS");
  objc_msgSend(v63, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("VO -- %@ -- %.2f ms\n"), v65, v66);
  v67 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v25, 1, &off_1000E3990, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 23, 2.0, 2.0, 0.1);
  if (v67)
    objc_msgSend(v6, "addObject:", v67);
  objc_msgSend(v67, "packetLoss");
  if (v68 >= 100.0)
    v69 = CFSTR("FAIL");
  else
    v69 = CFSTR("PASS");
  objc_msgSend(v67, "min");
  objc_msgSend(v30, "appendFormat:", CFSTR("CTL -- %@ -- %.2f ms\n\n"), v69, v70);
  objc_msgSend(v95, "appendData:", objc_msgSend(v30, "dataUsingEncoding:", 4));
  v71 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v71, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v71, "appendFormat:", CFSTR("Ping Performance (%@)\n"), v13);
  objc_msgSend(v71, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v72 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v13, 10, &off_1000E3480, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), 24, 21.0, 2.0, 0.1);
  if (v72)
    objc_msgSend(v6, "addObject:", v72);
  objc_msgSend(v71, "appendFormat:", CFSTR("count=%ld\n"), objc_msgSend(v72, "count"));
  objc_msgSend(v72, "min");
  objc_msgSend(v71, "appendFormat:", CFSTR("min=%.2f ms\n"), v73);
  objc_msgSend(v72, "max");
  objc_msgSend(v71, "appendFormat:", CFSTR("max=%.2f ms\n"), v74);
  objc_msgSend(v72, "avg");
  objc_msgSend(v71, "appendFormat:", CFSTR("avg=%.2f ms\n"), v75);
  objc_msgSend(v72, "stddev");
  objc_msgSend(v71, "appendFormat:", CFSTR("stddev=%.2f ms\n"), v76);
  objc_msgSend(v72, "packetLoss");
  objc_msgSend(v71, "appendFormat:", CFSTR("loss=%.2f%%\n\n"), v77);
  objc_msgSend(v95, "appendData:", objc_msgSend(v71, "dataUsingEncoding:", 4));
  v78 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v78, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v78, "appendFormat:", CFSTR("Ping6 AWDL (%@)\n"), CFSTR("ff02::fb"));
  objc_msgSend(v78, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v94 = self;
  v79 = -[W5LogManager __ping6WithAddress:count:wait:trafficClass:interfaceName:dataLength:](self, "__ping6WithAddress:count:wait:trafficClass:interfaceName:dataLength:", CFSTR("ff02::fb"), 1, 0, -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName"), 25, 2.0);
  if (v79)
    objc_msgSend(v6, "addObject:", v79);
  objc_msgSend(v79, "packetLoss");
  if (v80 < 100.0)
    v9 = CFSTR("PASS");
  objc_msgSend(v79, "min");
  objc_msgSend(v78, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v9, v81);
  objc_msgSend(v95, "appendData:", objc_msgSend(v78, "dataUsingEncoding:", 4));
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v95, "appendData:", objc_msgSend(CFSTR("\n\n\n# --- Ping Results\n\n"), "dataUsingEncoding:", 4));
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v82 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v83; i = (char *)i + 1)
        {
          if (*(_QWORD *)v97 != v84)
            objc_enumerationMutation(v6);
          v86 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
          v87 = +[NSMutableString string](NSMutableString, "string");
          objc_msgSend(v87, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
          dateFormatter = v94->_dateFormatter;
          objc_msgSend(v86, "startedAt");
          v89 = -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
          v90 = v94->_dateFormatter;
          objc_msgSend(v86, "endedAt");
          objc_msgSend(v87, "appendFormat:", CFSTR("[%@ - %@]\n"), v89, -[NSDateFormatter stringFromDate:](v90, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:")));
          objc_msgSend(v87, "appendFormat:", CFSTR("%@\n"), objc_msgSend(v86, "command"));
          objc_msgSend(v87, "appendFormat:", CFSTR("%@\n"), objc_msgSend(v86, "output"));
          objc_msgSend(v95, "appendData:", objc_msgSend(v87, "dataUsingEncoding:", 4));
        }
        v83 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      }
      while (v83);
    }
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v92, "path"), "stringByAppendingPathComponent:", CFSTR("ping.txt")), v95, 0))
  {
    v100 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ping.txt"));
    objc_msgSend(v93, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v93, "setCompletedAt:");
  return v93;
}

- (id)__collect_CFNetworkPing:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  double v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  double v21;
  const __CFString *v22;
  uint64_t v23;
  id v24;
  id v25;
  double v26;
  const __CFString *v27;
  uint64_t v28;
  id v29;
  id v30;
  double v31;
  const __CFString *v32;
  uint64_t v33;
  id v34;
  double v35;
  const __CFString *v36;
  uint64_t v37;
  id v38;
  double v39;
  const __CFString *v40;
  uint64_t v41;
  id v42;
  double v43;
  const __CFString *v44;
  uint64_t v45;
  id v46;
  double v47;
  const __CFString *v48;
  uint64_t v49;
  id v50;
  double v51;
  const __CFString *v52;
  uint64_t v53;
  id v54;
  double v55;
  const __CFString *v56;
  uint64_t v57;
  id v58;
  double v59;
  const __CFString *v60;
  uint64_t v61;
  id v62;
  double v63;
  const __CFString *v64;
  uint64_t v65;
  id v66;
  double v67;
  const __CFString *v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v78;
  void *v79;
  NSURL *v80;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v78 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = +[NSMutableData data](NSMutableData, "data");
  v7 = +[NSMutableString string](NSMutableString, "string");
  if ((-[CWFInterface powerOn](-[W5StatusManager corewifi](self->_status, "corewifi"), "powerOn") & 1) == 0)
    objc_msgSend(v7, "appendString:", CFSTR("!!! Wi-Fi is OFF\n\n"));
  objc_msgSend(v7, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v7, "appendString:", CFSTR("Ping localhost (loopback)\n"));
  objc_msgSend(v7, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v8 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", CFSTR("localhost"), 1, 1, 0, 0);
  objc_msgSend(v8, "packetLoss");
  if (v9 >= 100.0)
    v10 = CFSTR("FAIL");
  else
    v10 = CFSTR("PASS");
  objc_msgSend(v8, "min");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v10, v11);
  objc_msgSend(v6, "appendData:", objc_msgSend(v7, "dataUsingEncoding:", 4));
  v12 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  v79 = v5;
  if (v12
    || (v12 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress")) != 0)
  {
    v13 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v13, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
    objc_msgSend(v13, "appendFormat:", CFSTR("Ping LAN (%@)\n"), v12);
    objc_msgSend(v13, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
    v14 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, 0, 0);
    objc_msgSend(v14, "packetLoss");
    if (v15 >= 100.0)
      v16 = CFSTR("FAIL");
    else
      v16 = CFSTR("PASS");
    objc_msgSend(v14, "min");
    objc_msgSend(v13, "appendFormat:", CFSTR("%@ -- %.2f ms\n\n"), v16, v17);
    objc_msgSend(v6, "appendData:", objc_msgSend(v13, "dataUsingEncoding:", 4));
  }
  v18 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v18, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v18, "appendString:", CFSTR("Ping WAN\n"));
  objc_msgSend(v18, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v19 = objc_msgSend(-[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "DNSServerAddresses"), "firstObject");
  v20 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v19, 1, 1, 0, 0);
  objc_msgSend(v20, "packetLoss");
  if (v21 >= 100.0)
    v22 = CFSTR("FAIL");
  else
    v22 = CFSTR("PASS");
  objc_msgSend(v20, "min");
  objc_msgSend(v18, "appendFormat:", CFSTR("%@ -- %@ -- %.2f ms\n"), v19, v22, v23);
  v24 = sub_10008EF00();
  v25 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v24, 1, 1, 0, 0);
  objc_msgSend(v25, "packetLoss");
  if (v26 >= 100.0)
    v27 = CFSTR("FAIL");
  else
    v27 = CFSTR("PASS");
  objc_msgSend(v25, "min");
  objc_msgSend(v18, "appendFormat:", CFSTR("%@ -- %@ -- %.2f ms\n\n"), v24, v27, v28);
  objc_msgSend(v6, "appendData:", objc_msgSend(v18, "dataUsingEncoding:", 4));
  v29 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v29, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v29, "appendFormat:", CFSTR("Ping QOS (%@)\n"), v12);
  objc_msgSend(v29, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v30 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3480, 0);
  objc_msgSend(v30, "packetLoss");
  if (v31 >= 100.0)
    v32 = CFSTR("FAIL");
  else
    v32 = CFSTR("PASS");
  objc_msgSend(v30, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("BE -- %@ -- %.2f ms\n"), v32, v33);
  v34 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3918, 0);
  objc_msgSend(v34, "packetLoss");
  if (v35 >= 100.0)
    v36 = CFSTR("FAIL");
  else
    v36 = CFSTR("PASS");
  objc_msgSend(v34, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("BK_SYS -- %@ -- %.2f ms\n"), v36, v37);
  v38 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3498, 0);
  objc_msgSend(v38, "packetLoss");
  if (v39 >= 100.0)
    v40 = CFSTR("FAIL");
  else
    v40 = CFSTR("PASS");
  objc_msgSend(v38, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("BK -- %@ -- %.2f ms\n"), v40, v41);
  v42 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3930, 0);
  objc_msgSend(v42, "packetLoss");
  if (v43 >= 100.0)
    v44 = CFSTR("FAIL");
  else
    v44 = CFSTR("PASS");
  objc_msgSend(v42, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("RD -- %@ -- %.2f ms\n"), v44, v45);
  v46 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3948, 0);
  objc_msgSend(v46, "packetLoss");
  if (v47 >= 100.0)
    v48 = CFSTR("FAIL");
  else
    v48 = CFSTR("PASS");
  objc_msgSend(v46, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("OAM -- %@ -- %.2f ms\n"), v48, v49);
  v50 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3960, 0);
  objc_msgSend(v50, "packetLoss");
  if (v51 >= 100.0)
    v52 = CFSTR("FAIL");
  else
    v52 = CFSTR("PASS");
  objc_msgSend(v50, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("AV -- %@ -- %.2f ms\n"), v52, v53);
  v54 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3978, 0);
  objc_msgSend(v54, "packetLoss");
  if (v55 >= 100.0)
    v56 = CFSTR("FAIL");
  else
    v56 = CFSTR("PASS");
  objc_msgSend(v54, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("RV -- %@ -- %.2f ms\n"), v56, v57);
  v58 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E34B0, 0);
  objc_msgSend(v58, "packetLoss");
  if (v59 >= 100.0)
    v60 = CFSTR("FAIL");
  else
    v60 = CFSTR("PASS");
  objc_msgSend(v58, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("VI -- %@ -- %.2f ms\n"), v60, v61);
  v62 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E34E0, 0);
  objc_msgSend(v62, "packetLoss");
  if (v63 >= 100.0)
    v64 = CFSTR("FAIL");
  else
    v64 = CFSTR("PASS");
  objc_msgSend(v62, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("VO -- %@ -- %.2f ms\n"), v64, v65);
  v66 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 1, 1, &off_1000E3990, 0);
  objc_msgSend(v66, "packetLoss");
  if (v67 >= 100.0)
    v68 = CFSTR("FAIL");
  else
    v68 = CFSTR("PASS");
  objc_msgSend(v66, "min");
  objc_msgSend(v29, "appendFormat:", CFSTR("CTL -- %@ -- %.2f ms\n\n"), v68, v69);
  objc_msgSend(v6, "appendData:", objc_msgSend(v29, "dataUsingEncoding:", 4));
  v70 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v70, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v70, "appendFormat:", CFSTR("Ping Performance (%@)\n"), v12);
  objc_msgSend(v70, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v71 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:](self, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:", v12, 10, 1, &off_1000E3480, 0);
  objc_msgSend(v70, "appendFormat:", CFSTR("count=%ld\n"), objc_msgSend(v71, "count"));
  objc_msgSend(v71, "min");
  objc_msgSend(v70, "appendFormat:", CFSTR("min=%.2f ms\n"), v72);
  objc_msgSend(v71, "max");
  objc_msgSend(v70, "appendFormat:", CFSTR("max=%.2f ms\n"), v73);
  objc_msgSend(v71, "avg");
  objc_msgSend(v70, "appendFormat:", CFSTR("avg=%.2f ms\n"), v74);
  objc_msgSend(v71, "stddev");
  objc_msgSend(v70, "appendFormat:", CFSTR("stddev=%.2f ms\n"), v75);
  objc_msgSend(v71, "packetLoss");
  objc_msgSend(v70, "appendFormat:", CFSTR("loss=%.2f%%\n"), v76);
  objc_msgSend(v6, "appendData:", objc_msgSend(v70, "dataUsingEncoding:", 4));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v78, "path"), "stringByAppendingPathComponent:", CFSTR("ping-CFNetwork.txt")), v6, 0))
  {
    v80 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ping-CFNetwork.txt"));
    objc_msgSend(v79, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v79, "setCompletedAt:");
  return v79;
}

- (id)__collect_ifconfig:(id)a3
{
  id v5;
  id v6;
  NSFileHandle *v7;
  NSFileHandle *v8;
  NSURL *v10;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("ifconfig.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v6, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
  v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v7, CFSTR("/sbin/ifconfig"), &off_1000E80A0);
    -[NSFileHandle closeFile](v8, "closeFile");
    v10 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ifconfig.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_ipconfig:(id)a3
{
  id v5;
  id v6;
  NSString *v7;
  NSURL *v9;
  _QWORD v10[2];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v7)
  {
    v10[0] = CFSTR("getpacket");
    v10[1] = v7;
    if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/sbin/ipconfig"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2), objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("ipconfig.txt")), 0))
    {
      v9 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ipconfig.txt"));
      objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_traceroute:(id)a3
{
  id v5;
  id v6;
  NSString *v7;
  NSURL *v9;
  _QWORD v10[10];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v7)
  {
    v10[0] = CFSTR("-n");
    v10[1] = CFSTR("-m");
    v10[2] = CFSTR("6");
    v10[3] = CFSTR("-i");
    v10[4] = v7;
    v10[5] = CFSTR("-w");
    v10[6] = CFSTR("2");
    v10[7] = CFSTR("-q");
    v10[8] = CFSTR("1");
    v10[9] = CFSTR("captive.apple.com");
    if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/sbin/traceroute"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 10), objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("traceroute.txt")), 0))
    {
      v9 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("traceroute.txt"));
      objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_kextstat:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/sbin/kextstat"), 0, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("kextstat.txt")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("kextstat.txt"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_ioreg:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/sbin/ioreg"), &off_1000E80B8, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("ioreg.txt")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ioreg.txt"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_top:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/top"), &off_1000E80D0, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("top.txt")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("top.txt"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_netstat:(id)a3
{
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  NSFileHandle *v10;
  NSFileHandle *v11;
  NSString *v12;
  NSString *v13;
  NSURL *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("FileNameOverride"));
  v8 = objc_msgSend(v6, "path");
  if (!v7)
    v7 = CFSTR("netstat.txt");
  v9 = objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v9, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v9, 0, 0);
  v10 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v9);
  if (v10)
  {
    v11 = v10;
    v12 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
    if (v12)
    {
      v13 = v12;
      v18[0] = CFSTR("-n");
      v18[1] = CFSTR("-s");
      v18[2] = CFSTR("-I");
      v18[3] = v12;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v11, CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
      v17[0] = CFSTR("-n");
      v17[1] = CFSTR("-I");
      v17[2] = v13;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v11, CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));
      v16[0] = CFSTR("-qq");
      v16[1] = CFSTR("-I");
      v16[2] = v13;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v11, CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
    }
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v11, CFSTR("/usr/sbin/netstat"), &off_1000E80E8);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v11, CFSTR("/usr/sbin/netstat"), &off_1000E8100);
    -[NSFileHandle closeFile](v11, "closeFile");
    v15 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7);
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemConfiguration:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration")), objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "URLByAppendingPathComponent:", CFSTR("SystemConfiguration")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("SystemConfiguration"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_configd:(id)a3
{
  id v4;
  id v5;
  NSURL *v7;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/sbin/scutil"), &off_1000E8118, 0)&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/tmp/configd-store.plist")), v5, 0))
  {
    v7 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("configd-store.plist"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_wl_curpower:(id)a3
{
  id v5;
  NSURL *v7;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  if (-[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E8130, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("wl_curpower.txt")), 0))
  {
    v7 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wl_curpower.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_wl_cca_get_stats:(id)a3
{
  id v5;
  NSURL *v7;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  if (-[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E8148, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("wl_cca_get_stats.txt")), 0))
  {
    v7 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wl_cca_get_stats.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_spindump:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  NSURL *v11;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v10 = 0;
  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", CFSTR("/usr/sbin/spindump"), 0, 0, 0, 0, 0, 60.0, &v10))
  {
    v7 = objc_msgSend(-[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:](self, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:", &off_1000E8160, CFSTR("spindump"), 0, 0, 0, 300.0), "firstObject");
    if (v7)
    {
      v8 = v7;
      if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7), v6, 0))
      {
        v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v8, "lastPathComponent"));
        objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      }
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v8, 0);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_darwinup:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/local/bin/darwinup"), &off_1000E8178, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("darwinup_list.txt")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("darwinup_list.txt"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_hosts:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/etc/hosts")), objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "URLByAppendingPathComponent:", CFSTR("hosts")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("hosts"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_sysdiagnose:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSFileManager *v8;
  NSObject *v10;
  id v11;
  const char *v12;
  int v13;
  id v14;
  _QWORD v15[5];
  NSURL *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _BYTE v19[24];
  __int128 v20;
  uint64_t v21;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v14 = 0;
  *(_QWORD *)v19 = 0;
  *(_QWORD *)&v19[8] = v19;
  *(_QWORD *)&v19[16] = 0x3052000000;
  *(_QWORD *)&v20 = sub_100058028;
  *((_QWORD *)&v20 + 1) = sub_100058038;
  v6 = (void *)qword_1000FB708;
  v21 = qword_1000FB708;
  if (!qword_1000FB708)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100077414;
    v15[3] = &unk_1000D5380;
    v15[4] = v19;
    sub_100077414((uint64_t)v15);
    v6 = *(void **)(*(_QWORD *)&v19[8] + 40);
  }
  _Block_object_dispose(v19, 8);
  v7 = objc_msgSend(v6, "sysdiagnoseWithMetadata:withError:", &off_1000E73D0, &v14);
  if (v7)
  {
    if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7), v5, 0))
    {
      v8 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      v17[0] = NSFilePosixPermissions;
      v17[1] = NSFileOwnerAccountID;
      v18[0] = &off_1000E39A8;
      v18[1] = &off_1000E33F0;
      v17[2] = NSFileGroupOwnerAccountID;
      v18[2] = &off_1000E33F0;
      -[NSFileManager setAttributes:ofItemAtPath:error:](v8, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3), objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(v7, "lastPathComponent")), "path"), 0);
      v16 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v7, "lastPathComponent"));
      objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    }
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v7, 0);
  }
  else
  {
    v10 = sub_10008F56C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v14, "code");
      *(_DWORD *)v19 = 136315906;
      *(_QWORD *)&v19[4] = "-[W5LogManager __collect_sysdiagnose:]";
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "W5LogManager.m";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 4184;
      WORD2(v20) = 2048;
      *(_QWORD *)((char *)&v20 + 6) = v11;
      LODWORD(v12) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) FAILED to collect sysdiagnose, returned error %ld", v19, v12, v13, v14);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_ndp:(id)a3
{
  id v5;
  id v6;
  NSFileHandle *v7;
  NSFileHandle *v8;
  NSString *v9;
  NSURL *v11;
  _QWORD v12[2];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("ndp.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v6, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
  v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v7, CFSTR("/usr/sbin/ndp"), &off_1000E8190);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/sbin/ndp"), &off_1000E81A8);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/sbin/ndp"), &off_1000E81C0);
    v9 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
    if (v9)
    {
      v12[0] = CFSTR("-i");
      v12[1] = v9;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/sbin/ndp"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    }
    -[NSFileHandle closeFile](v8, "closeFile");
    v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ndp.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectTCPDump_PRE:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  NSString *v12;
  id v13;
  dispatch_time_t v14;
  _QWORD v16[6];
  _QWORD v17[10];
  uint8_t buf[4];
  uint64_t v19;
  _QWORD v20[10];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UUID"));
  v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Timeout"));
  if (v8)
    v9 = (uint64_t)objc_msgSend(v8, "unsignedIntegerValue");
  else
    v9 = 60;
  v10 = dispatch_semaphore_create(0);
  v11 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_tcpdump.pcap"), v11));
    v20[0] = CFSTR("-q");
    v20[1] = CFSTR("-n");
    v20[2] = CFSTR("-i");
    v20[3] = v12;
    v20[4] = CFSTR("-G");
    v20[5] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v9);
    v20[6] = CFSTR("-W");
    v20[7] = CFSTR("1");
    v20[8] = CFSTR("-w");
    v20[9] = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100064670;
    v17[3] = &unk_1000D6DB0;
    v17[4] = self;
    v17[5] = v7;
    v17[6] = v13;
    v17[7] = v5;
    v17[8] = v12;
    v17[9] = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000647C8;
    v16[3] = &unk_1000D6DD8;
    v16[4] = self;
    v16[5] = v7;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:](NSTask, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", CFSTR("/usr/sbin/tcpdump"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 10), v17, 0, v16, 0.0);
    v14 = dispatch_time(0, 600000000000);
    if (dispatch_semaphore_wait(v10, v14) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v19 = 0x4082C00000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectTCPDump_POST:(id)a3
{
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  NSObject *queue;
  _QWORD block[8];
  unsigned __int8 v12;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UUID"));
  if (v8)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064978;
    block[3] = &unk_1000D6E00;
    block[4] = self;
    block[5] = v8;
    v12 = v7;
    block[6] = v6;
    block[7] = v5;
    dispatch_async(queue, block);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_pmset:(id)a3
{
  id v4;
  NSURL *v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/pmset"), &off_1000E81D8, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("pmset_everything.txt")), 0))
  {
    v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("pmset_everything.txt"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (unint64_t)__calculateSizeAtPath:(id)a3
{
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[4];
  NSArray *v10;
  W5LogManager *v11;
  id v12;
  NSObject *v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v15))
  {
    if (v15)
    {
      v5 = dispatch_queue_create(0, 0);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100064CC8;
      v9[3] = &unk_1000D6E50;
      v10 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
      v11 = self;
      v12 = a3;
      v13 = v5;
      v14 = &v16;
      dispatch_apply(-[NSArray count](v10, "count"), 0, v9);
      if (v5)
        dispatch_release(v5);
    }
    else
    {
      v6 = -[NSDictionary fileSize](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", a3, 0), "fileSize");
      v17[3] += v6;
    }
  }
  v7 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)__collectFilesInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6 maxCount:(unint64_t)a7 maxSize:(unint64_t)a8 outputDirectory:(id)a9 compress:(BOOL)a10 remainingSize:(unint64_t *)a11 contentFilter:(id)a12
{
  unint64_t *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *i;
  NSURL *v24;
  NSURL *v25;
  id v26;
  id v27;
  NSDictionary *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v42;
  uint64_t v43;
  id v44;
  id v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int v56;
  unint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];

  v18 = a11;
  v44 = +[NSMutableArray array](NSMutableArray, "array");
  v19 = -[W5LogManager __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", a3, a4, a5, a6);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (!v20)
  {
    v48 = 0;
    if (a11)
      goto LABEL_35;
    return objc_msgSend(v44, "copy");
  }
  v21 = v20;
  v22 = 0;
  v48 = 0;
  v49 = 0;
  v50 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v53 != v50)
        objc_enumerationMutation(v19);
      v24 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i));
      v51 = 0;
      -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", -[NSURL path](v24, "path"), &v51);
      if (a12 && v51)
      {
        if (!v22)
          v22 = +[W5LogManager __temporaryDirectory](W5LogManager, "__temporaryDirectory");
        v25 = (NSURL *)objc_msgSend(v22, "URLByAppendingPathComponent:", -[NSURL lastPathComponent](v24, "lastPathComponent"));
        sub_10009009C(v24, v25, 0);
        (*((void (**)(id, NSURL *))a12 + 2))(a12, v25);
        v24 = v25;
      }
      v26 = objc_msgSend(a9, "URLByAppendingPathComponent:", -[NSURL lastPathComponent](v24, "lastPathComponent"));
      v27 = v26;
      if (a10)
      {
        v27 = objc_msgSend(v26, "URLByAppendingPathExtension:", CFSTR("tgz"));
        if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(v27, "path"))|| (sub_10008F5AC(v24, v27, 0) & 1) == 0)
        {
          goto LABEL_25;
        }
      }
      else if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(v26, "path"))|| !sub_10009009C(v24, v27, 0))
      {
LABEL_25:
        v37 = sub_10008F56C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = objc_msgSend(v27, "path");
          v56 = 138543362;
          v57 = (unint64_t)v38;
          LODWORD(v43) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v37, 0, "[wifivelocity] Failed to collect file (%{public}@)", &v56, v43);
        }
        continue;
      }
      v47 = v22;
      v28 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v27, "path"), 0);
      v29 = -[NSDictionary fileSize](v28, "fileSize");
      v30 = v29 + v48;
      v31 = ++v49;
      if (v28)
      {
        v32 = v29;
        v33 = sub_10008F56C();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v30 > a8 || v31 > a7)
        {
          if (v34)
          {
            v42 = objc_msgSend(v27, "path");
            v56 = 134219266;
            v57 = v30;
            v58 = 2048;
            v59 = a8;
            v60 = 2048;
            v61 = v32;
            v62 = 2048;
            v63 = v31;
            v64 = 2048;
            v65 = a7;
            v66 = 2114;
            v67 = v42;
            LODWORD(v43) = 62;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] Max size or max count exceeded, removing file from destination (aggregateSize=%luB, maxSize=%ldB, fileSize=%luB, aggregateCount=%lu, maxCount=%ld, file=%{public}@)", &v56, v43);
          }
          -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(v27, "path"), 0);
          v22 = v47;
          if (!v47)
            goto LABEL_34;
LABEL_33:
          -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", v22, 0);
          goto LABEL_34;
        }
        if (v34)
        {
          v36 = objc_msgSend(v27, "path");
          v56 = 134219266;
          v57 = v30;
          v58 = 2048;
          v59 = a8;
          v60 = 2048;
          v61 = v32;
          v62 = 2048;
          v63 = v49;
          v64 = 2048;
          v65 = a7;
          v66 = 2114;
          v67 = v36;
          LODWORD(v43) = 62;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] Successfully collected file (aggregateSize=%luB, maxSize=%ldB, fileSize=%luB, aggregateCount=%lu, maxCount=%ld, file=%{public}@)", &v56, v43);
        }
        objc_msgSend(v44, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v27, "lastPathComponent")));
      }
      else
      {
        v39 = sub_10008F56C();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = objc_msgSend(v27, "path");
          v56 = 138543362;
          v57 = (unint64_t)v40;
          LODWORD(v43) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v39, 0, "[wifivelocity] Failed to get collected file attributes (file=%{public}@)", &v56, v43);
        }
      }
      v48 = v30;
      v22 = v47;
    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    if (v21)
      continue;
    break;
  }
  if (v22)
    goto LABEL_33;
LABEL_34:
  v18 = a11;
  if (a11)
LABEL_35:
    *v18 = a8 - v48;
  return objc_msgSend(v44, "copy");
}

- (id)__collectFileAtURL:(id)a3 outputDirectory:(id)a4 maxAge:(double)a5 maxSize:(unint64_t)a6 compress:(BOOL)a7 remainingSize:(unint64_t *)a8
{
  _BOOL4 v9;
  double v14;
  double v15;
  id v16;
  id v17;
  NSDictionary *v18;
  NSDictionary *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  int v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  NSDate *v40;
  __int16 v41;
  NSDate *v42;
  __int16 v43;
  id v44;

  v9 = a7;
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")))return 0;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v15 = v14;
  v16 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
  v17 = v16;
  if (v9)
  {
    v17 = objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("tgz"));
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(v17, "path"))|| (sub_10008F5AC(a3, v17, 0) & 1) == 0)
    {
LABEL_19:
      v29 = sub_10008F56C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 138543362;
        v34 = objc_msgSend(v17, "path");
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v29, 0, "[wifivelocity] Failed to collect file (%{public}@)", &v33, 12);
      }
      return 0;
    }
  }
  else if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(v16, "path"))|| !sub_10009009C(a3, v17, 0))
  {
    goto LABEL_19;
  }
  v18 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v17, "path"), 0);
  if (v18)
  {
    v19 = v18;
    -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileCreationDate](v18, "fileCreationDate"), "timeIntervalSinceReferenceDate");
    v21 = v20;
    -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileModificationDate](v19, "fileModificationDate"), "timeIntervalSinceReferenceDate");
    v23 = v22;
    v24 = -[NSDictionary fileSize](v19, "fileSize");
    if (a6 < (unint64_t)v24
      || ((v25 = v15 - v21, v26 = v15 - v23, v15 - v21 > a5) ? (v27 = v26 <= a5) : (v27 = 1), !v27))
    {
      v30 = sub_10008F56C();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 134219266;
        v34 = (id)a6;
        v35 = 2048;
        v36 = v24;
        v37 = 2048;
        v38 = (unint64_t)a5;
        v39 = 2114;
        v40 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v21);
        v41 = 2114;
        v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v23);
        v43 = 2114;
        v44 = objc_msgSend(v17, "path");
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v30, 0, "[wifivelocity] Max size or max age exceeded, removing file from destination (maxSize=%ldB, fileSize=%luB, maxAge=%ld, fileCreationDate=%{public}@, fileModificationDate=%{public}@, file=%{public}@)", &v33, 62);
      }
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(v17, "path"), 0);
      return 0;
    }
    if (a8)
    {
      v28 = sub_10008F56C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 134219266;
        v34 = (id)a6;
        v35 = 2048;
        v36 = v24;
        v37 = 2048;
        v38 = (unint64_t)a5;
        v39 = 2114;
        v40 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v21);
        v41 = 2114;
        v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v23);
        v43 = 2114;
        v44 = objc_msgSend(v17, "path");
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] Successfully collected file (maxSize=%ldB, fileSize=%luB, maxAge=%ld, fileCreationDate=%{public}@, fileModificationDate=%{public}@, file=%{public}@)", &v33, 62);
      }
      *a8 = a6 - (_QWORD)v24;
    }
  }
  else
  {
    v31 = sub_10008F56C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138543362;
      v34 = objc_msgSend(v17, "path");
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] Failed to get collected file attributes (file=%{public}@)", &v33, 12);
    }
  }
  if (v17)
    return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v17, "lastPathComponent", v25, v26));
  return 0;
}

- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6
{
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  NSDictionary *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  id v31;
  id obj;
  uint64_t v33;
  id v34;
  void *context;
  uint64_t v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v31 = +[NSMutableArray array](NSMutableArray, "array");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v37 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v38 = +[NSMutableSet set](NSMutableSet, "set");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = a3;
  v34 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v36 = v12;
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        context = objc_autoreleasePoolPush();
        v14 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", v13, 0);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
              v20 = objc_autoreleasePoolPush();
              v21 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v13, "stringByAppendingPathComponent:", v19), 0);
              -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileCreationDate](v21, "fileCreationDate"), "timeIntervalSinceReferenceDate");
              v23 = v22;
              -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileModificationDate](v21, "fileModificationDate"), "timeIntervalSinceReferenceDate");
              v25 = v24;
              v26 = v11 - v23;
              v27 = v11 - v25;
              v28 = v11 - v23 > a6 && v27 > a6;
              if (!v28
                && (!a4
                 || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (!a5|| !objc_msgSend(a5, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (objc_msgSend(v38, "containsObject:", v19, v26, v27) & 1) == 0)
              {
                if (v23 <= v25)
                  v29 = v25;
                else
                  v29 = v23;
                objc_msgSend(v37, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29), objc_msgSend(v13, "stringByAppendingPathComponent:", v19));
                objc_msgSend(v38, "addObject:", v19);
              }
              objc_autoreleasePoolPop(v20);
            }
            v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v16);
        }
        objc_autoreleasePoolPop(context);
        v12 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v34);
  }
  objc_msgSend(v31, "addObjectsFromArray:", objc_msgSend(v37, "keysSortedByValueUsingComparator:", &stru_1000D6E70));
  return objc_msgSend(v31, "copy");
}

- (id)__mostRecentInDirectories:(id)a3 matchingPrefix:(id)a4 matchingSuffix:(id)a5 excludingPrefix:(id)a6 excludingSuffix:(id)a7 maxAge:(double)a8
{
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  NSDictionary *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  id v32;
  id obj;
  uint64_t v34;
  id v35;
  void *context;
  uint64_t v37;
  id v38;
  id v39;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];

  v32 = +[NSMutableArray array](NSMutableArray, "array");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v38 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v39 = +[NSMutableSet set](NSMutableSet, "set");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = a3;
  v35 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v48;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(obj);
        v37 = v13;
        v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v13);
        context = objc_autoreleasePoolPush();
        v15 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", v14, 0);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v44 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
              v21 = objc_autoreleasePoolPush();
              v22 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v14, "stringByAppendingPathComponent:", v20), 0);
              -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileCreationDate](v22, "fileCreationDate"), "timeIntervalSinceReferenceDate");
              v24 = v23;
              -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileModificationDate](v22, "fileModificationDate"), "timeIntervalSinceReferenceDate");
              v26 = v25;
              v27 = v12 - v24;
              v28 = v12 - v26;
              v29 = v12 - v24 > a8 && v28 > a8;
              if (!v29
                && (!a4 || objc_msgSend(v20, "hasPrefix:", a4, v27, v28))
                && (!a5 || objc_msgSend(v20, "hasSuffix:", a5, v27, v28))
                && (!a6 || (objc_msgSend(v20, "hasPrefix:", a6, v27, v28) & 1) == 0)
                && (!a7 || (objc_msgSend(v20, "hasSuffix:", a7, v27, v28) & 1) == 0)
                && (objc_msgSend(v39, "containsObject:", v20, v27, v28) & 1) == 0)
              {
                if (v24 <= v26)
                  v30 = v26;
                else
                  v30 = v24;
                objc_msgSend(v38, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30), objc_msgSend(v14, "stringByAppendingPathComponent:", v20));
                objc_msgSend(v39, "addObject:", v20);
              }
              objc_autoreleasePoolPop(v21);
            }
            v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v17);
        }
        objc_autoreleasePoolPop(context);
        v13 = v37 + 1;
      }
      while ((id)(v37 + 1) != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v35);
  }
  objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend(v38, "keysSortedByValueUsingComparator:", &stru_1000D6E90));
  return objc_msgSend(v32, "copy");
}

- (id)__possibleCoreCapturePathsWithComponent:(id)a3
{
  id v4;
  id result;

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  if (!a3)
    a3 = CFSTR("WiFi");
  objc_msgSend(v4, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/Library/Logs/CrashReporter/CoreCapture/%@"), a3));
  objc_msgSend(v4, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/Library/Logs/CoreCapture/%@"), a3));
  objc_msgSend(v4, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/CoreCapture/%@"), a3));
  result = objc_msgSend(v4, "count");
  if (result)
    return objc_msgSend(v4, "copy");
  return result;
}

- (void)__filterCoreCaptureContent:(id)a3
{
  id v4;
  NSRegularExpression *v5;
  NSDirectoryEnumerator *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  NSURLResourceKey v27;

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v5 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\.bin$|\\.pcapng\\.gz$"), 0, 0);
  v27 = NSURLNameKey;
  v6 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a3, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1), 0, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v20 = 0;
        objc_msgSend(v11, "getResourceValue:forKey:error:", &v20, NSURLNameKey, 0);
        if (-[NSRegularExpression firstMatchInString:options:range:](v5, "firstMatchInString:options:range:", v20, 0, 0, objc_msgSend(v20, "length")))
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v4);
        -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), 0);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v13);
  }
}

- (id)__collectCoreCaptureDump:(id)a3
{
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Reason"));
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("WiFiDebug");
  v8 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Component"));
  if (v8)
    v9 = v8;
  else
    v9 = CFSTR("WiFi");
  -[W5LogManager __dumpCoreCaptureLogsWithReason:component:](self, "__dumpCoreCaptureLogsWithReason:component:", v7, v9);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectCoreCapture:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  unsigned int v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  id v15;
  id v16;
  const __CFString *v17;
  NSString *v18;
  void *v19;
  _QWORD *v20;
  NSRegularExpression *v21;
  NSRegularExpression *v22;
  id v23;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[5];

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge"));
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 1.79769313e308;
  }
  v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxCount"));
  if (v9)
    v28 = (uint64_t)objc_msgSend(v9, "unsignedIntegerValue");
  else
    v28 = -1;
  v10 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxSize"));
  if (v10)
    v27 = (uint64_t)objc_msgSend(v10, "unsignedIntegerValue");
  else
    v27 = -1;
  v26 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("FilterContent")), "BOOLValue");
  v12 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Component"));
  if (v12)
    v13 = v12;
  else
    v13 = CFSTR("WiFi");
  v14 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("IncludeMatching"));
  v15 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("ExcludeMatching"));
  v16 = +[NSMutableArray array](NSMutableArray, "array");
  v17 = &stru_1000D8750;
  if (v11)
    v17 = CFSTR("-Filtered");
  v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture%@"), v17);
  v19 = v5;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", v18), "stringByAppendingPathComponent:", v13), 1, 0, 0);
  v20 = 0;
  if (v11)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000665F0;
    v30[3] = &unk_1000D6EB8;
    v30[4] = self;
    v20 = v30;
  }
  if (v14)
  {
    v21 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v14, 0, 0);
    if (v15)
    {
LABEL_19:
      v22 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v15, 0, 0);
      goto LABEL_22;
    }
  }
  else
  {
    v21 = 0;
    if (v15)
      goto LABEL_19;
  }
  v22 = 0;
LABEL_22:
  LOBYTE(v25) = v26;
  -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", -[W5LogManager __possibleCoreCapturePathsWithComponent:](self, "__possibleCoreCapturePathsWithComponent:", v13), v21, v22, v28, v27, objc_msgSend(objc_msgSend(v19, "URLByAppendingPathComponent:", v18), "URLByAppendingPathComponent:", v13), v8, v25, 0, v20);
  objc_msgSend(v16, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));
  v23 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/log/corecaptured.log")), v19, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
  if (v23)
    objc_msgSend(v16, "addObject:", v23);
  objc_msgSend(v4, "setRelativeURLs:", v16);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectCoreCapture24:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  NSRegularExpression *v10;
  id v11;
  const __CFString *v12;
  NSString *v13;
  _QWORD *v14;
  NSRegularExpression *v15;
  id v16;
  uint64_t v18;
  unsigned __int8 v19;
  _QWORD v21[5];

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v19 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("FilterContent")), "BOOLValue");
  v7 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Component"));
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("WiFi");
  v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("IncludeMatching"));
  v10 = (NSRegularExpression *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("ExcludeMatching"));
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v12 = &stru_1000D8750;
  if (v6)
    v12 = CFSTR("-Filtered");
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreCapture%@"), v12);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", v13), "stringByAppendingPathComponent:", v8), 1, 0, 0);
  v14 = 0;
  if (v6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100066904;
    v21[3] = &unk_1000D6EB8;
    v21[4] = self;
    v14 = v21;
  }
  if (v9)
  {
    v15 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v9, 0, 0);
    if (!v10)
      goto LABEL_11;
    goto LABEL_10;
  }
  v15 = 0;
  if (v10)
LABEL_10:
    v10 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v10, 0, 0);
LABEL_11:
  LOBYTE(v18) = v19;
  -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", -[W5LogManager __possibleCoreCapturePathsWithComponent:](self, "__possibleCoreCapturePathsWithComponent:", v8), v15, v10, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:", v13), "URLByAppendingPathComponent:", v8), 86400.0, v18, 0, v14);
  objc_msgSend(v11, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
  v16 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/log/corecaptured.log")), v5, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
  if (v16)
    objc_msgSend(v11, "addObject:", v16);
  objc_msgSend(v4, "setRelativeURLs:", v11);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiPreferences:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSString *v10;
  NSString *v11;
  NSURL *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSObject *debugLogQueue;
  _QWORD block[6];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseMegaWiFiProfileLimits")), "BOOLValue");
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi.plist")), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.plist")), 0))
  {
    objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.wifi.plist")));
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist")), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("LEGACY_com.apple.wifi-networks.plist")), 0))
  {
    objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("LEGACY_com.apple.wifi-networks.plist")));
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist")), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi-private-mac-networks.plist")), 0))
  {
    objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.wifi-private-mac-networks.plist")));
  }
  if ((os_variant_has_internal_content("com.apple.wifivelocity", v9) | v7) == 1)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.plist"), CWFKnownNetworksStoreIdentifier);
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/Library/Preferences/%@"), v10);
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v11)&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11), objc_msgSend(v6, "URLByAppendingPathComponent:", v10), 0))
    {
      objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
    }
    v12 = -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs"));
    v13 = -[NSString stringByAppendingPathComponent:](-[NSURL path](v12, "path"), "stringByAppendingPathComponent:", CFSTR("com.apple.wifi.syncable-networks.plist"));
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v13)&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.syncable-networks.plist")), 0))
    {
      objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.wifi.syncable-networks.plist")));
    }
    v14 = -[NSString stringByAppendingPathComponent:](-[NSURL path](v12, "path"), "stringByAppendingPathComponent:", CFSTR("com.apple.wifi.syncable-networks.legacy.plist"));
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v14)&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.syncable-networks.legacy.plist")), 0))
    {
      objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.wifi.syncable-networks.legacy.plist")));
    }
    v15 = -[NSString stringByAppendingPathComponent:](-[NSURL path](v12, "path"), "stringByAppendingPathComponent:", CFSTR("com.apple.wifi.recent-networks.json"));
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v15)&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.recent-networks.json")), 0))
    {
      objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.wifi.recent-networks.json")));
    }
  }
  else
  {
    debugLogQueue = self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066DCC;
    block[3] = &unk_1000D5C48;
    block[4] = a3;
    block[5] = self;
    dispatch_async(debugLogQueue, block);
  }
  objc_msgSend(v5, "setRelativeURLs:", v8);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectNetworkPreferences:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Preferences/SystemConfiguration/preferences.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/preferences.plist")), objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("preferences.plist")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("preferences.plist")));
  }
  objc_msgSend(v4, "setRelativeURLs:", v6);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__possibleTempWiFiLogPaths
{
  return &off_1000E81F0;
}

- (void)__dumpWiFiLogs
{
  -[NSOperationQueue addOperationWithBlock:](-[W5StatusManager concurrentQueue](self->_status, "concurrentQueue"), "addOperationWithBlock:", &stru_1000D6ED8);
}

- (id)__collectFilteredWiFiManagerLogArchiveWithOutputURL:(id)a3 compress:(BOOL)a4 age:(unint64_t)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  _QWORD v12[6];

  v6 = a4;
  v9 = objc_msgSend(objc_msgSend(a3, "path"), "stringByAppendingPathComponent:", CFSTR("wifi_logarchive.log"));
  v12[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--last=%lus"), a5, CFSTR("show"), CFSTR("--debug"), CFSTR("--signpost"));
  v12[4] = CFSTR("--style=compact");
  v12[5] = CFSTR("--predicate=(subsystem CONTAINS \"com.apple.WiFiManager\") OR (subsystem CONTAINS \"wifi.analytics\") OR (senderImagePath CONTAINS \"IO80211Family\") OR (senderImagePath CONTAINS \"AppleBCMWLANCore\") OR (process CONTAINS \"wifid\")");
  v10 = 0;
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/log"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 6), v9, 0))
  {
    if (v6)
    {
      v10 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9), a3, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v9, 0);
    }
    else
    {
      return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wifi_logarchive.log"));
    }
  }
  return v10;
}

- (id)__collectWiFiLogs24:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v16;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  v9 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/wifi.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v7, 0, 86400.0);
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  v10 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/wifimanager.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v7, 0, 86400.0);
  if (v10)
    objc_msgSend(v8, "addObject:", v10);
  v11 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/wifi_driver.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v7, 0, 86400.0);
  if (v11)
    objc_msgSend(v8, "addObject:", v11);
  v12 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/logs/wifiFirmwareLoader.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v7, 0, 86400.0);
  if (v12)
    objc_msgSend(v8, "addObject:", v12);
  LOBYTE(v16) = (_BYTE)v7;
  v13 = -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", -[W5LogManager __possibleTempWiFiLogPaths](self, "__possibleTempWiFiLogPaths"), 0, +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("WiFiManager$|WiFiDebugInfo\\.tar\\.gz$"), 0, 0), 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, v6, 86400.0, v16, 0, 0);
  if (v13)
    objc_msgSend(v8, "addObjectsFromArray:", v13);
  v14 = -[W5LogManager __collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:](self, "__collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:", v6, v7, 600);
  if (v14)
    objc_msgSend(v8, "addObject:", v14);
  objc_msgSend(v5, "setRelativeURLs:", v8);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiLogs:(id)a3
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge"));
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = 1.79769313e308;
  }
  v10 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxCount"));
  if (v10)
    v11 = (uint64_t)objc_msgSend(v10, "unsignedIntegerValue");
  else
    v11 = -1;
  v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("CollectTempWiFiLog")), "BOOLValue");
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  if ((v13 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v15 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/wifi.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v12, 0, 1.79769313e308);
    if (v15)
      objc_msgSend(v14, "addObject:", v15);
    v16 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/wifimanager.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v12, 0, 1.79769313e308);
    if (v16)
      objc_msgSend(v14, "addObject:", v16);
    v17 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/wifi_driver.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v12, 0, 1.79769313e308);
    if (v17)
      objc_msgSend(v14, "addObject:", v17);
    v18 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/logs/wifiFirmwareLoader.log")), v6, 0x7FFFFFFFFFFFFFFFLL, v12, 0, 1.79769313e308);
    if (v18)
      objc_msgSend(v14, "addObject:", v18);
  }
  LOBYTE(v22) = (_BYTE)v12;
  v19 = -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", -[W5LogManager __possibleTempWiFiLogPaths](self, "__possibleTempWiFiLogPaths"), 0, +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("WiFiManager$|WiFiDebugInfo\\.tar\\.gz$"), 0, 0), v11, 0x7FFFFFFFFFFFFFFFLL, v6, v9, v22, 0, 0);
  if (v19)
    objc_msgSend(v14, "addObjectsFromArray:", v19);
  v20 = -[W5LogManager __collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:](self, "__collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:", v6, v12, 600);
  if (v20)
    objc_msgSend(v14, "addObject:", v20);
  objc_msgSend(v5, "setRelativeURLs:", v14);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiLogsDump:(id)a3
{
  id v5;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  -[W5LogManager __dumpWiFiLogs](self, "__dumpWiFiLogs");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectEAP8021XLogs:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist")), v6, 0))
  {
    objc_msgSend(v7, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.network.eapolclient.configuration.plist")));
  }
  v8 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:](self, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:", &off_1000E8208, CFSTR("com.apple.networking.eapol.log"), 0, 0, 0, 1.79769313e308);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (objc_msgSend(v8, "count", 0))
    v9 = 1;
  else
    v9 = (uint64_t)objc_msgSend(v8, "count");
  v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), v6, 0))objc_msgSend(v7, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v15, "lastPathComponent")));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  objc_msgSend(v5, "setRelativeURLs:", v7);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectIPConfigurationLogs:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:](self, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:", &off_1000E8220, CFSTR("com.apple.networking.IPConfiguration.log"), 0, 0, 0, 1.79769313e308);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (objc_msgSend(v8, "count", 0))
    v9 = 1;
  else
    v9 = (uint64_t)objc_msgSend(v8, "count");
  v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), v6, 0))objc_msgSend(v7, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v15, "lastPathComponent")));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  objc_msgSend(v5, "setRelativeURLs:", v7);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemLogs:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  _QWORD v18[3];

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxSize"));
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("LimitTime")), "BOOLValue");
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v18[0] = CFSTR("-B");
  v18[1] = CFSTR("-x");
  v18[2] = objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("syslog.asl"));
  if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/bin/syslog"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3), 0))
  {
    objc_msgSend(v9, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("syslog.asl")));
  }
  v10 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v10, "addObject:", CFSTR("collect"));
  if (v6)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v12 = v11;
    objc_msgSend(v6, "doubleValue");
    v14 = v12 - v13;
    v15 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v15, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    if (v8)
      objc_msgSend(v15, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v16 = objc_msgSend(v15, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v14));
    objc_msgSend(v10, "addObject:", CFSTR("--start"));
    objc_msgSend(v10, "addObject:", v16);
  }
  if (v7)
  {
    objc_msgSend(v10, "addObject:", CFSTR("--size"));
    objc_msgSend(v10, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lum"), objc_msgSend(v7, "unsignedIntegerValue")));
  }
  objc_msgSend(v10, "addObject:", CFSTR("--output"));
  objc_msgSend(v10, "addObject:", objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("system.logarchive"), 0), "path"));
  if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/bin/log"), v10, 0))
  {
    objc_msgSend(v9, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("system.logarchive")));
  }
  objc_msgSend(v4, "setRelativeURLs:", v9);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiVelocityLog:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSURL *v13;
  id v14;
  _QWORD v15[7];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge"));
  if (v8)
    v9 = (uint64_t)objc_msgSend(v8, "unsignedIntegerValue");
  else
    v9 = 300;
  v10 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("wifivelocity_logarchive.log"));
  v15[0] = CFSTR("show");
  v15[1] = CFSTR("--info");
  v15[2] = CFSTR("--debug");
  v15[3] = CFSTR("--signpost");
  v15[4] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--last=%lus"), v9);
  v15[5] = CFSTR("--style=syslog");
  v15[6] = CFSTR("--predicate=message BEGINSWITH \"[wifivelocity]\");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/log"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 7), v10, 0))
  {
    if (v7)
    {
      v11 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10), v6, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
      if (v11)
      {
        v14 = v11;
        objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      }
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v10, 0);
    }
    else
    {
      v13 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wifivelocity_logarchive.log"));
      objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemLogs24:(id)a3
{
  id v5;

  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("MaxSize"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1000E3408, CFSTR("MaxAge"));
  objc_msgSend(a3, "setConfiguration:", v5);
  return -[W5LogManager __collectSystemLogs:](self, "__collectSystemLogs:", a3);
}

- (id)__collectAirPlayLogs:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:](self, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:", &off_1000E8238, CFSTR("AirPlay"), 0, 0, 0, 1.79769313e308);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (objc_msgSend(v8, "count", 0))
    v9 = 1;
  else
    v9 = (uint64_t)objc_msgSend(v8, "count");
  v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), v6, 0))objc_msgSend(v7, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v15, "lastPathComponent")));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  objc_msgSend(v5, "setRelativeURLs:", v7);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWirelessProxLogs:(id)a3
{
  id v4;
  id v5;
  NSURL *v7;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/private/var/log/wirelessproxd.log"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/log/wirelessproxd.log")), v5, 0))
  {
    v7 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wirelessproxd.log"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectSharingLogs:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSURL *v8;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("HomeDirectory"));
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("/Library/Logs/com.apple.sharingd/sharingd.log")))&& sub_10009009C(objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("/Library/Logs/com.apple.sharingd/sharingd.log")), v5, 0))
  {
    v8 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("sharingd.log"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectBluetoothLogs:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Preferences/com.apple.Bluetooth.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Preferences/com.apple.Bluetooth.plist")), v5, 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.Bluetooth.plist")));
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/private/var/log/blued.log"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/log/blued.log")), v5, 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("blued.log")));
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/Library/Logs/Bluetooth/"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/Library/Logs/Bluetooth/")), v5, 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("blued.log")));
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("Library/Preferences/com.apple.BTServer.plist"))&& sub_10009009C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("Library/Preferences/com.apple.BTServer.plist")), v5, 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("com.apple.BTServer.plist")));
  }
  objc_msgSend(v4, "setRelativeURLs:", v6);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectDextCoreDump:(id)a3
{
  id v4;
  id v5;
  NSURL *v6;
  NSFileManager *v7;
  const __CFString *v8;
  unsigned __int8 v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSURL *v16;
  id v17;
  NSURL *v18;
  NSObject *v20;
  NSString *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  _BYTE v30[12];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  id v38;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v23 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("dext_coredumps")));
  v7 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v28 = 0;
  v8 = CFSTR("/private/var/dextcores");
  v9 = -[NSFileManager fileExistsAtPath:isDirectory:](v7, "fileExistsAtPath:isDirectory:", CFSTR("/private/var/dextcores"), &v28);
  if ((v9 & (v28 != 0)) == 0)
    v8 = CFSTR("/private/var/cores");
  v10 = -[NSFileManager contentsOfDirectoryAtPath:error:](v7, "contentsOfDirectoryAtPath:error:", v8, 0);
  if (-[NSArray count](v10, "count"))
  {
    if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSURL path](v6, "path"), 0, 0, 0))
    {
      v22 = v4;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
            v16 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8), "URLByAppendingPathComponent:", v15);
            v17 = objc_msgSend(v15, "stringByAppendingString:", CFSTR(".tgz"));
            v18 = -[NSURL URLByAppendingPathComponent:](v6, "URLByAppendingPathComponent:", v17);
            *(_QWORD *)v30 = 0;
            if (sub_10008F5AC(v16, v18, (NSError **)v30))
              objc_msgSend(v23, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v17, "lastPathComponent")));
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v12);
      }
      v4 = v22;
      objc_msgSend(v22, "setRelativeURLs:", v23);
    }
    else
    {
      v20 = sub_10008F56C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = -[NSURL path](v6, "path");
        *(_DWORD *)v30 = 136316162;
        *(_QWORD *)&v30[4] = "-[W5LogManager __collectDextCoreDump:]";
        v31 = 2080;
        v32 = "W5LogManager.m";
        v33 = 1024;
        v34 = 5732;
        v35 = 2114;
        v36 = v21;
        v37 = 2114;
        v38 = a3;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] %s (%s:%u) WiFiDextCrashSoftError createDirectoryAtPath fail for path:%{public}@ request:%{public}@", v30, 48);
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectCrashesAndSpins24:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  double v13;
  double v14;
  double v15;
  NSData *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  id v20;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v22 = v4;
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v23 = +[NSMutableArray array](NSMutableArray, "array");
  v25 = v5;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("crashes_and_spins")), 0, 0, 0);
  v6 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", CFSTR("/Library/Logs/CrashReporter"), 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v24 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v10);
        v12 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(CFSTR("/Library/Logs/CrashReporter"), "stringByAppendingPathComponent:", v11), 0);
        -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileCreationDate](v12, "fileCreationDate"), "timeIntervalSinceReferenceDate");
        v14 = v13;
        if (-[NSString isEqualToString:](-[NSDictionary fileType](v12, "fileType"), "isEqualToString:", NSFileTypeRegular))
        {
          +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
          if (v15 - v14 < 86400.0)
          {
            if (objc_msgSend(v11, "hasSuffix:", CFSTR("ips")))
            {
              v16 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", objc_msgSend(CFSTR("/Library/Logs/CrashReporter"), "stringByAppendingPathComponent:", v11));
              v17 = (unint64_t)-[NSData rangeOfData:options:range:](v16, "rangeOfData:options:range:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "\n", 1), 0, 0, -[NSData length](v16, "length"));
              v18 = (char *)(v17 + 1);
              v19 = (char *)-[NSData length](v16, "length") + ~v17;
              v20 = objc_msgSend(objc_msgSend(v11, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", CFSTR("crash"));
              v9 = v24;
              if (-[NSData writeToFile:atomically:](-[NSData subdataWithRange:](v16, "subdataWithRange:", v18, v19), "writeToFile:atomically:", objc_msgSend(objc_msgSend(objc_msgSend(v25, "path"), "stringByAppendingPathComponent:", CFSTR("crashes_and_spins")), "stringByAppendingPathComponent:", v20), 0))
              {
                objc_msgSend(v23, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v20, "lastPathComponent")));
              }
            }
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "setCompletedAt:");
  return v22;
}

- (id)__collectEventHistory:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  id v14;
  NSString *v15;
  id v16;
  const __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  unsigned int v45;
  const char *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unsigned int v51;
  id v52;
  id v53;
  unsigned int v54;
  const char *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  float v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  NSString *v72;
  NSDateFormatter *dateFormatter;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  const char *v82;
  id v83;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  id v91;
  id v92;
  double v93;
  id v94;
  uint64_t v95;
  id v96;
  void *v97;
  W5LogManager *v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  NSURL *v107;
  _BYTE v108[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v97 = v5;
  objc_msgSend(v5, "setStartedAt:");
  v96 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = -[W5StatusManager eventHistory](self->_status, "eventHistory");
  v8 = +[NSMutableString string](NSMutableString, "string");
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v102 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (v102)
  {
    v9 = *(_QWORD *)v104;
    v98 = self;
    v99 = v8;
    v100 = v7;
    v101 = *(_QWORD *)v104;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v104 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)v10);
        switch((unint64_t)objc_msgSend(v11, "eventID"))
        {
          case 4uLL:
            v12 = objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("NetworkStatus"));
            v13 = (objc_msgSend(v12, "isAppleReachable") & 2) != 0
               && (objc_msgSend(v12, "isAppleReachable") & 4) == 0;
            v75 = objc_msgSend(v12, "primaryIPv4InterfaceName");
            v76 = objc_msgSend(objc_msgSend(v12, "primaryIPv4Addresses"), "firstObject");
            v77 = objc_msgSend(v12, "primaryIPv4Router");
            v78 = objc_msgSend(v12, "primaryIPv6InterfaceName");
            v79 = objc_msgSend(objc_msgSend(v12, "primaryIPv6Addresses"), "firstObject");
            v80 = objc_msgSend(v12, "primaryIPv6Router");
            v81 = objc_msgSend(objc_msgSend(v12, "primaryDNSAddresses"), "firstObject");
            v82 = "no";
            if (v13)
              v82 = "yes";
            v72 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Network Status: ipv4[if=%@ ip=%@ router=%@] ipv6[if=%@ ip=%@ router=%@] dns=%@ reach=%s"), v75, v76, v77, v78, v79, v80, v81, v82);
            v6 = &Apple80211BindToInterface_ptr;
            self = v98;
            v8 = v99;
            v7 = v100;
            v9 = v101;
            if (v72)
              goto LABEL_41;
            goto LABEL_42;
          case 0xCuLL:
            v17 = CFSTR("BT Paging Start");
            goto LABEL_39;
          case 0xDuLL:
            v17 = CFSTR("BT Paging End");
            goto LABEL_39;
          case 0xEuLL:
            v18 = objc_msgSend(v11, "info");
            v19 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v20 = objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EAPControlMode")), "unsignedIntValue");
            v21 = objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EAPControlState")), "unsignedIntValue");
            v22 = objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EAPSupplicantState")), "unsignedIntValue");
            v23 = objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EAPClientStatus")), "intValue");
            v24 = W5DescriptionForEAPOLControlState(v21);
            v25 = W5DescriptionForEAPOLControlMode(v20);
            v26 = v22;
            v7 = v100;
            v86 = v24;
            v9 = v101;
            v8 = v99;
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("EAP8021X: %@ if=%@ mode=%@ supp=%@ status=%u"), v86, v19, v25, W5DescriptionForEAPOLSupplicantState(v26), v23);
            break;
          case 0xFuLL:
            v27 = objc_msgSend(v11, "info");
            v28 = objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PowerSourceType")), "integerValue");
            objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BatteryEstimatedTime")), "doubleValue");
            v30 = v29;
            objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BatteryLevel")), "doubleValue");
            v32 = v31;
            v33 = objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BatteryWarningLevel")), "intValue");
            v34 = W5DescriptionForPowerSourceType(v28);
            v93 = COERCE_DOUBLE(W5DescriptionForBatteryWarningLevel(v33));
            v89 = v30;
            v91 = v32;
            v85 = (id)v34;
            v17 = CFSTR("Power Source: ps=%@ est=%.3fs lvl=%.1f%% warn=%@");
            goto LABEL_29;
          case 0x10uLL:
            v85 = (id)W5DescriptionForPowerStateCaps(objc_msgSend(objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("SystemPowerStateCaps")), "unsignedIntValue"));
            v17 = CFSTR("Power State: %@");
            goto LABEL_39;
          case 0x11uLL:
            v35 = objc_msgSend(v11, "info");
            v36 = objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PowerSourceType")), "integerValue");
            objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("BatteryEstimatedTime")), "doubleValue");
            v38 = v37;
            objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("BatteryLevel")), "doubleValue");
            v40 = v39;
            v41 = objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("BatteryWarningLevel")), "intValue");
            v42 = W5DescriptionForPowerSourceType(v36);
            v93 = COERCE_DOUBLE(W5DescriptionForBatteryWarningLevel(v41));
            v89 = v38;
            v91 = v40;
            v85 = (id)v42;
            v17 = CFSTR("Low Battery: ps=%@ est=%.3fs lvl=%.1f%% warn=%@");
            goto LABEL_29;
          case 0x12uLL:
            v43 = objc_msgSend(v11, "info");
            v44 = objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v45 = objc_msgSend(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("WiFiPowerOn")), "BOOLValue");
            v46 = "OFF";
            if (v45)
              v46 = "ON";
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Power: if=%@ state=%s"), v44, v46, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x13uLL:
            v47 = objc_msgSend(v11, "info");
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi SSID: if=%@ ssid=%@"), objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("InterfaceName")), objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("WiFiSSIDString")), v91, *(_QWORD *)&v93, v95);
            break;
          case 0x14uLL:
            v48 = objc_msgSend(v11, "info");
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi BSSID: if=%@ bssid=%@"), objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("InterfaceName")), objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("WiFiBSSID")), v91, *(_QWORD *)&v93, v95);
            break;
          case 0x15uLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi RSN Handshake: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x16uLL:
            v49 = objc_msgSend(v11, "info");
            v50 = objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v51 = objc_msgSend(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("WiFiLinkUp")), "BOOLValue");
            v52 = objc_msgSend(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("WiFiLinkChangeReason")), "integerValue");
            v53 = objc_msgSend(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("WiFiLinkChangeSubreason")), "integerValue");
            v54 = objc_msgSend(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("WiFiLinkChangeInvoluntary")), "BOOLValue");
            v55 = "DOWN";
            if (v51)
              v55 = "UP";
            v94 = v53;
            v92 = v52;
            v9 = v101;
            v87 = v50;
            v8 = v99;
            v7 = v100;
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Link: if=%@ link=%s reason=%ld subreason=%ld involuntary=%d"), v87, v55, v92, v94, v54);
            break;
          case 0x17uLL:
            v56 = objc_msgSend(v11, "info");
            v85 = objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v89 = W5DescriptionForOpMode(objc_msgSend(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("WiFiMode")), "intValue"));
            v17 = CFSTR("Wi-Fi Mode: if=%@ mode=%@");
            goto LABEL_39;
          case 0x18uLL:
            v14 = objc_msgSend(v11, "info");
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Country Code: if=%@ cc=%@"), objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("InterfaceName")), objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WiFiCountryCode")), v91, *(_QWORD *)&v93, v95);
            break;
          case 0x19uLL:
            v57 = objc_msgSend(v11, "info");
            v58 = objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v59 = objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("WiFiLinkQualityUpdate"));
            v60 = objc_msgSend(v59, "rssi");
            v61 = objc_msgSend(v59, "txRate");
            objc_msgSend(v59, "cca");
            v93 = v62;
            v89 = (uint64_t)v60;
            v91 = v61;
            v8 = v99;
            v7 = v100;
            v85 = v58;
            v17 = CFSTR("Wi-Fi Link Quality: if=%@ rssi=%lddBm txrate=%ldMbps cca=%.1f%%");
LABEL_29:
            v9 = v101;
            goto LABEL_39;
          case 0x1AuLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Deauth: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x1BuLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Reset: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x1CuLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Availabe: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x1DuLL:
            v16 = objc_msgSend(v11, "info");
            v85 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v89 = W5DescriptionForChannel(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("WiFiChannel")));
            v17 = CFSTR("Wi-Fi Channel Switch: if=%@ ch=%@");
            goto LABEL_39;
          case 0x1EuLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wi-Fi Roam Start: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x1FuLL:
            v85 = objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v17 = CFSTR("Wi-Fi Roam End: if=%@");
            goto LABEL_39;
          case 0x20uLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AWDL RTM Start: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x21uLL:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AWDL RTM End: if=%@"), objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("InterfaceName")), v89, v91, *(_QWORD *)&v93, v95);
            break;
          case 0x22uLL:
            v63 = objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", CFSTR("PingResult"));
            v64 = objc_msgSend(v63, "interfaceName");
            v65 = objc_msgSend(v63, "address");
            objc_msgSend(v63, "min");
            v67 = v66;
            objc_msgSend(v63, "max");
            v69 = v68;
            objc_msgSend(v63, "packetLoss");
            v88 = v64;
            v90 = v65;
            v7 = v100;
            v9 = v101;
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ping: if=%@ addr=%@ min=%.2fms max=%.2fms loss=%.2f%%"), v88, v90, v67, v69, v70);
            break;
          case 0x23uLL:
            v71 = objc_msgSend(v11, "info");
            v85 = objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
            v89 = W5DescriptionForWiFiDropReason(objc_msgSend(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("WiFiDropReason")), "integerValue"));
            v17 = CFSTR("Wi-Fi Drop: if=%@ reason=%@");
LABEL_39:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v85, v89, v91, *(_QWORD *)&v93, v95);
            break;
          default:
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unhandled Event: event=%@"), v11, v89, v91, *(_QWORD *)&v93, v95);
            break;
        }
        v72 = v15;
        if (v15)
        {
LABEL_41:
          dateFormatter = self->_dateFormatter;
          v74 = v6[118];
          objc_msgSend(v11, "timestamp");
          objc_msgSend(v8, "appendFormat:", CFSTR("%@ %@\n"), -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", objc_msgSend(v74, "dateWithTimeIntervalSinceReferenceDate:")), v72);
        }
LABEL_42:
        v10 = (char *)v10 + 1;
      }
      while (v102 != v10);
      v83 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
      v102 = v83;
    }
    while (v83);
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v96, "path"), "stringByAppendingPathComponent:", CFSTR("event_history.txt")), objc_msgSend(v8, "dataUsingEncoding:", 4), 0))
  {
    v107 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("event_history.txt"));
    objc_msgSend(v97, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v107, 1));
  }
  objc_msgSend(v6[118], "timeIntervalSinceReferenceDate");
  objc_msgSend(v97, "setCompletedAt:");
  return v97;
}

- (id)__collectAdditionalLog:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  NSURL *v9;

  v6 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v6, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setStartedAt:");
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a4, "path"))&& sub_10009009C(a4, objc_msgSend(v7, "URLByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("additional.log"))), 0))
  {
    v9 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("additional.log"));
    objc_msgSend(v6, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setCompletedAt:");
  return v6;
}

- (id)__collectMultiple:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  NSObject *queue;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSOperationQueue *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  dispatch_time_t v23;
  intptr_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id obj;
  unsigned __int8 v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v44[7];
  _QWORD v45[7];
  mach_timebase_info info;
  _QWORD v47[5];
  _QWORD v48[13];
  unsigned __int8 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD block[7];
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[24];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[24];
  uint64_t v63;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v41 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v40 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("HomeDirectory"));
  v39 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v38 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("IncludeEvents")), "BOOLValue");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseLeewayUUID"));
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("AddLeewayUUID"));
  v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("TimestampUUID"));
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("RunConcurrent")), "BOOLValue");
  obj = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Requests"));
  v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Timeout"));
  if (v9)
    v36 = (uint64_t)objc_msgSend(v9, "unsignedIntegerValue");
  else
    v36 = 10000;
  if (v5)
  {
    *(_QWORD *)v62 = 0;
    *(_QWORD *)&v62[8] = v62;
    *(_QWORD *)&v62[16] = 0x2020000000;
    v63 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A290;
    block[3] = &unk_1000D6700;
    block[5] = v5;
    block[6] = v62;
    block[4] = self;
    dispatch_sync(queue, block);
    v11 = *(_QWORD *)(*(_QWORD *)&v62[8] + 24);
    v12 = sub_10008F56C();
    v36 += v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)&v62[8] + 24);
      v14 = objc_msgSend(v5, "substringToIndex:", 5);
      v15 = v36 - *(_QWORD *)(*(_QWORD *)&v62[8] + 24);
      *(_DWORD *)v58 = 134218754;
      *(_QWORD *)&v58[4] = v13;
      *(_WORD *)&v58[12] = 2114;
      *(_QWORD *)&v58[14] = v14;
      *(_WORD *)&v58[22] = 2048;
      v59 = v15;
      v60 = 2048;
      v61 = v36;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] Using leeway of %lums [%{public}@], extending timeout from %lums to %lums", v58, 42);
    }
    _Block_object_dispose(v62, 8);
  }
  v42 = +[NSMutableArray array](NSMutableArray, "array");
  *(_QWORD *)v58 = 0;
  *(_QWORD *)&v58[8] = v58;
  *(_QWORD *)&v58[16] = 0x2020000000;
  LOBYTE(v59) = 0;
  v16 = dispatch_queue_create(0, 0);
  v17 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  -[NSOperationQueue setMaxConcurrentOperationCount:](v17, "setMaxConcurrentOperationCount:", 1);
  if (v8)
    v17 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
  v18 = dispatch_group_create();
  v34 = mach_absolute_time();
  v35 = v4;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v18);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10006A2D4;
        v48[3] = &unk_1000D6F00;
        v48[4] = v22;
        v48[5] = v41;
        v48[6] = v40;
        v48[7] = v39;
        v49 = v38;
        v48[8] = self;
        v48[9] = v16;
        v48[11] = v18;
        v48[12] = v58;
        v48[10] = v42;
        -[NSOperationQueue addOperationWithBlock:](v17, "addOperationWithBlock:", v48);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v19);
  }
  if (v36)
    v23 = dispatch_time(0, 1000000 * v36);
  else
    v23 = -1;
  v24 = dispatch_group_wait(v18, v23);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10006A43C;
  v47[3] = &unk_1000D5380;
  v47[4] = v58;
  dispatch_sync(v16, v47);
  if (v36 && !v24 && v6)
  {
    info = 0;
    mach_timebase_info(&info);
    v25 = info.denom ? (mach_absolute_time() - v34) * info.numer / info.denom / 0xF4240 : 0;
    v26 = v36 - v25;
    v27 = self->_queue;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10006A46C;
    v45[3] = &unk_1000D6468;
    v45[4] = self;
    v45[5] = v6;
    v45[6] = v36 - v25;
    dispatch_async(v27, v45);
    v28 = sub_10008F56C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "substringToIndex:", 5);
      *(_DWORD *)v62 = 134218242;
      *(_QWORD *)&v62[4] = v26;
      *(_WORD *)&v62[12] = 2114;
      *(_QWORD *)&v62[14] = v29;
      LODWORD(v33) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] Storing leeway of %lums [%{public}@]", v62, v33);
    }
  }
  v30 = mach_absolute_time();
  v31 = self->_queue;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10006A4B4;
  v44[3] = &unk_1000D6468;
  v44[4] = v7;
  v44[5] = self;
  v44[6] = v30;
  dispatch_async(v31, v44);
  v55[0] = CFSTR("Receipts");
  v56[0] = objc_msgSend(v42, "copy");
  v55[1] = CFSTR("TimeoutOccurred");
  v56[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24 != 0);
  objc_msgSend(v35, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v35, "setCompletedAt:");
  if (v18)
    dispatch_release(v18);
  if (v16)
    dispatch_release(v16);
  _Block_object_dispose(v58, 8);
  return v35;
}

- (id)__collect_security:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSFileHandle *v8;
  NSFileHandle *v9;
  NSURL *v11;

  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v6, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setStartedAt:");
  v7 = objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("security.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v7, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v7, 0, 0);
  v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
  if (v8)
  {
    v9 = v8;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/security"), &off_1000E8250);
    -[NSFileHandle writeData:](v9, "writeData:", objc_msgSend(sub_100090628(), "dataUsingEncoding:", 4));
    -[NSFileHandle closeFile](v9, "closeFile");
    v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("security.txt"));
    objc_msgSend(v6, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setCompletedAt:");
  return v6;
}

- (id)__collect_mobilewifitool:(id)a3
{
  id v5;
  id v6;
  NSFileHandle *v7;
  NSFileHandle *v8;
  NSURL *v10;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("mobilewifitool.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v6, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
  v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v7, CFSTR("/usr/local/bin/mobilewifitool"), &off_1000E8268);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/mobilewifitool"), &off_1000E8280);
    -[NSFileHandle closeFile](v8, "closeFile");
    v10 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("mobilewifitool.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (void)__endWiFiStats
{
  __IOReportSubscriptionCF *ioReportSubscription;
  const void *Samples;

  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription && self->_ioReportBase)
  {
    if (self->_ioReportDelta)
    {
      CFRelease(self->_ioReportDelta);
      ioReportSubscription = self->_ioReportSubscription;
    }
    Samples = (const void *)IOReportCreateSamples(ioReportSubscription, self->_ioReportChannels, 0);
    self->_ioReportDelta = (__CFDictionary *)IOReportCreateSamplesDelta(self->_ioReportBase, Samples, 0);
    self->_ioReportDeltaMachAbsoluteTime = mach_absolute_time();
    if (Samples)
      CFRelease(Samples);
  }
}

- (void)__startWiFiStats
{
  __IOReportSubscriptionCF *ioReportSubscription;

  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription)
  {
    if (self->_ioReportBase)
    {
      CFRelease(self->_ioReportBase);
      ioReportSubscription = self->_ioReportSubscription;
    }
    self->_ioReportBase = (__CFDictionary *)IOReportCreateSamples(ioReportSubscription, self->_ioReportChannels, 0);
    self->_ioReportBaseMachAbsoluteTime = mach_absolute_time();
  }
}

- (void)__teardownWiFiStats
{
  __CFDictionary *ioReportBase;
  __CFDictionary *ioReportDelta;
  __CFDictionary *ioReportChannels;
  __IOReportSubscriptionCF *ioReportSubscription;

  self->_ioReportBaseMachAbsoluteTime = 0;
  self->_ioReportDeltaMachAbsoluteTime = 0;
  ioReportBase = self->_ioReportBase;
  if (ioReportBase)
    CFRelease(ioReportBase);
  self->_ioReportBase = 0;
  ioReportDelta = self->_ioReportDelta;
  if (ioReportDelta)
    CFRelease(ioReportDelta);
  self->_ioReportDelta = 0;
  ioReportChannels = self->_ioReportChannels;
  if (ioReportChannels)
    CFRelease(ioReportChannels);
  self->_ioReportChannels = 0;
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription)
    CFRelease(ioReportSubscription);
  self->_ioReportSubscription = 0;
}

- (void)__setupWiFiStats
{
  uint64_t Aggregate;
  const void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  const void *v16;
  CFStringRef v17;
  uint64_t v18;
  const void *v19;
  CFStringRef v20;
  uint64_t v21;
  const void *v22;
  CFStringRef v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  io_registry_entry_t parent[2];

  *(_QWORD *)parent = 0;
  Aggregate = IOReportCreateAggregate(2, a2);
  if (Aggregate)
  {
    v4 = (const void *)Aggregate;
    Apple80211GetIOReportingService(&parent[1]);
    if (parent[1])
    {
      v5 = ((uint64_t (*)(void))IOReportCopyChannelsForDriver)();
      if (v5)
      {
        v6 = (const void *)v5;
        if (IOReportGetChannelCount())
          IOReportMergeChannels(v4, v6, 0);
        CFRelease(v6);
      }
      if (!IORegistryEntryGetParentEntry(parent[1], "IOService", parent))
      {
        do
        {
          v7 = IOReportCopyChannelsForDriver(parent[0], 2, 0);
          if (v7)
          {
            v8 = (const void *)v7;
            if (IOReportGetChannelCount())
              IOReportMergeChannels(v4, v8, 0);
            CFRelease(v8);
          }
          IOObjectRelease(parent[1]);
          parent[1] = parent[0];
        }
        while (!IORegistryEntryGetParentEntry(parent[0], "IOService", parent));
      }
      IOObjectRelease(parent[1]);
    }
    v9 = IOServiceMatching("apcie");
    MatchingService = IOServiceGetMatchingService(0, v9);
    parent[1] = MatchingService;
    if (MatchingService)
    {
      while (!IORegistryEntryGetChildEntry(MatchingService, "IOService", parent))
      {
        IOObjectRelease(parent[1]);
        MatchingService = parent[0];
        parent[1] = parent[0];
        if (!parent[0])
          goto LABEL_30;
      }
      if (parent[1])
      {
        v11 = IOReportCopyChannelsForDriver(parent[1], 2, 0);
        if (v11)
        {
          v12 = (const void *)v11;
          if (IOReportGetChannelCount())
            IOReportMergeChannels(v4, v12, 0);
          CFRelease(v12);
        }
        if (!IORegistryEntryGetParentEntry(parent[1], "IOService", parent))
        {
          do
          {
            v13 = IOReportCopyChannelsForDriver(parent[0], 2, 0);
            if (v13)
            {
              v14 = (const void *)v13;
              if (IOReportGetChannelCount())
                IOReportMergeChannels(v4, v14, 0);
              CFRelease(v14);
            }
            IOObjectRelease(parent[1]);
            parent[1] = parent[0];
          }
          while (!IORegistryEntryGetParentEntry(parent[0], "IOService", parent));
        }
        IOObjectRelease(parent[1]);
      }
    }
LABEL_30:
    v15 = IOReportCopyChannelsInCategories(2, 2, 0);
    if (v15)
    {
      v16 = (const void *)v15;
      if (IOReportGetChannelCount())
      {
        v17 = CFStringCreateWithCString(kCFAllocatorDefault, "Energy Model", 0);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10006AE28;
        v26[3] = &unk_1000D6F20;
        v26[4] = v17;
        IOReportPrune(v16, v26);
        CFRelease(v17);
        IOReportMergeChannels(v4, v16, 0);
      }
      CFRelease(v16);
    }
    v18 = IOReportCopyChannelsInCategories(2, 2, 0);
    if (v18)
    {
      v19 = (const void *)v18;
      if (IOReportGetChannelCount())
      {
        v20 = CFStringCreateWithCString(kCFAllocatorDefault, "CPU Stats", 0);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10006AE7C;
        v25[3] = &unk_1000D6F20;
        v25[4] = v20;
        IOReportPrune(v19, v25);
        CFRelease(v20);
        IOReportMergeChannels(v4, v19, 0);
      }
      CFRelease(v19);
    }
    v21 = IOReportCopyChannelsInCategories(2, 2, 0);
    if (v21)
    {
      v22 = (const void *)v21;
      if (IOReportGetChannelCount())
      {
        v23 = CFStringCreateWithCString(kCFAllocatorDefault, "Voltage Domain Performance States", 0);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10006AED0;
        v24[3] = &unk_1000D6F20;
        v24[4] = v23;
        IOReportPrune(v22, v24);
        CFRelease(v23);
        IOReportMergeChannels(v4, v22, 0);
      }
      CFRelease(v22);
    }
    self->_ioReportSubscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(kCFAllocatorDefault, v4, &self->_ioReportChannels, 0, 0);
    CFRelease(v4);
  }
}

- (id)__collectWiFiStatsPre:(id)a3
{
  id v5;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  -[W5LogManager __teardownWiFiStats](self, "__teardownWiFiStats");
  -[W5LogManager __setupWiFiStats](self, "__setupWiFiStats");
  -[W5LogManager __startWiFiStats](self, "__startWiFiStats");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiStatsPost:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  NSURL *v10;
  NSURL *v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  -[W5LogManager __endWiFiStats](self, "__endWiFiStats");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  v12[0] = CFSTR("MachBegin");
  v13[0] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_ioReportBaseMachAbsoluteTime);
  v12[1] = CFSTR("MachEnd");
  v13[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_ioReportDeltaMachAbsoluteTime);
  v12[2] = CFSTR("Duration");
  v13[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_ioReportDeltaMachAbsoluteTime - self->_ioReportBaseMachAbsoluteTime);
  -[__CFDictionary setObject:forKey:](self->_ioReportDelta, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3), CFSTR("DebugInfo"));
  v8 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("wifi_stats.xml"));
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v8, +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", self->_ioReportDelta, 100, 0, 0), 0))
  {
    if (v7)
    {
      if (sub_10008F5AC(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8), objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("wifi_stats.xml.tgz")), 0))
      {
        v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wifi_stats.xml.tgz"));
        objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v8, 0);
      }
    }
    else
    {
      v10 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wifi_stats.xml"));
      objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    }
  }
  -[W5LogManager __teardownWiFiStats](self, "__teardownWiFiStats");
  return v5;
}

- (id)__collectWiFiStatsCLI:(id)a3
{
  id v4;
  id v5;
  __CFString *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSURL **v12;
  NSURL *v14;
  NSURL *v15;
  _QWORD v16[2];

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = (__CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("FileNameOverride"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v8 = objc_msgSend(v5, "path");
  if (!v6)
    v6 = CFSTR("wifistats.xml");
  v9 = objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  if (v9)
  {
    v10 = v9;
    v16[0] = CFSTR("-p");
    v16[1] = v9;
    if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/local/bin/wifistats"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2), 0))
    {
      if (!v7)
      {
        v14 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6);
        v12 = &v14;
        goto LABEL_9;
      }
      v11 = -[__CFString stringByAppendingPathExtension:](v6, "stringByAppendingPathExtension:", CFSTR("tgz"));
      if (sub_10008F5AC(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10), objc_msgSend(v5, "URLByAppendingPathComponent:", v11), 0))
      {
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v10, 0);
        v15 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11);
        v12 = &v15;
LABEL_9:
        objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 1));
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectPreviouslyCollected:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unsigned __int8 v13;
  NSRegularExpression *v14;
  NSRegularExpression *v15;
  id v16;
  uint64_t v18;
  NSString *v20;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge"));
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 1.79769313e308;
  }
  v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxCount"));
  if (v9)
    v10 = (uint64_t)objc_msgSend(v9, "unsignedIntegerValue");
  else
    v10 = -1;
  v11 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxSize"));
  if (v11)
    v12 = (uint64_t)objc_msgSend(v11, "unsignedIntegerValue");
  else
    v12 = -1;
  v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v14 = (NSRegularExpression *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("IncludeMatching"));
  v15 = (NSRegularExpression *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("ExcludeMatching"));
  v16 = +[NSMutableArray array](NSMutableArray, "array");
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("Previous")), 0, 0, 0);
  if (v14)
    v14 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v14, 0, 0);
  if (v15)
    v15 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v15, 0, 0);
  v20 = -[NSURL path](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")), "URLByAppendingPathComponent:", CFSTR("previous")), "path");
  LOBYTE(v18) = v13;
  if (objc_msgSend(-[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1), v14, v15, v10, v12, objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Previous")), v8, v18, 0, 0), "count"))
  {
    objc_msgSend(v16, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("Previous")));
  }
  else
  {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("Previous")), 0);
  }
  objc_msgSend(v4, "setRelativeURLs:", v16);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiMemoryUsage:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = +[NSMutableArray array](NSMutableArray, "array");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/footprint"), &off_1000E8298, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("footprint_wifid.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("footprint_wifid.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/vmmap"), &off_1000E82B0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("vmmap_wifid.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("vmmap_wifid.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/heap"), &off_1000E82C8, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("heap_wifid.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("heap_wifid.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", CFSTR("/usr/local/bin/easyperf"), &off_1000E82E0, 0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("easyperf_wifid.txt")), 0, 0, 10.0, 0, 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("easyperf_wifid.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/footprint"), &off_1000E82F8, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("footprint_dext.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("footprint_dext.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/vmmap"), &off_1000E8310, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("vmmap_dext.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("vmmap_dext.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/heap"), &off_1000E8328, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("heap_dext.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("heap_dext.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", CFSTR("/usr/local/bin/easyperf"), &off_1000E8340, 0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("easyperf_dext.txt")), 0, 0, 10.0, 0, 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("easyperf_dext.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/bin/zprint"), 0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("zprint.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("zprint.txt")));
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/local/bin/jetsam_priority"), &off_1000E8358, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("jetsam_priority.txt")), 0))
  {
    objc_msgSend(v6, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("jetsam_priority.txt")));
  }
  objc_msgSend(v4, "setRelativeURLs:", v6);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiDeviceConfig:(id)a3
{
  id v5;
  id v6;
  NSString *v7;
  id v8;
  NSFileHandle *v9;
  NSFileHandle *v10;
  NSMutableData *v11;
  id v12;
  id v13;
  void *v14;
  NSURL *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v8 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("wifi_internal.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v8, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v8, 0, 0);
  v9 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v8);
  if (v9)
  {
    v10 = v9;
    v11 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
    v36[0] = v7;
    v36[1] = CFSTR("-cardcap");
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2), v11, 0);
    v12 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4), "componentsSeparatedByString:", CFSTR("\n"));
    -[NSMutableData setLength:](v11, "setLength:", 0);
    -[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E8370, 0, v11);
    v13 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4), "componentsSeparatedByString:", CFSTR(" "));
    if (v7)
    {
      v14 = v13;
      v35[0] = v7;
      v35[1] = CFSTR("-driver_ver");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
      v34[0] = v7;
      v34[1] = CFSTR("-hardware_ver");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
      v33[0] = v7;
      v33[1] = CFSTR("-ssid");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
      v32[0] = v7;
      v32[1] = CFSTR("-bssid");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
      v31[0] = v7;
      v31[1] = CFSTR("-rssi");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
      v30[0] = v7;
      v30[1] = CFSTR("-noise");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
      v29[0] = v7;
      v29[1] = CFSTR("-channel");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
      v28[0] = v7;
      v28[1] = CFSTR("-authtype");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
      v27[0] = v7;
      v27[1] = CFSTR("-country_code");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
      v26[0] = v7;
      v26[1] = CFSTR("-rateset");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
      v25[0] = v7;
      v25[1] = CFSTR("-leaky_ap_stats_mode");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
      v24[0] = v7;
      v24[1] = CFSTR("-cardcap");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
      v23[0] = v7;
      v23[1] = CFSTR("-dbg=mimopsstatus");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
      if (objc_msgSend(v12, "containsObject:", CFSTR("roam")))
      {
        v22[0] = v7;
        v22[1] = CFSTR("-dbg=print-roam");
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
      }
      if (objc_msgSend(v12, "containsObject:", CFSTR("ocl")))
      {
        v21[0] = v7;
        v21[1] = CFSTR("-dbg=ocl_status");
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
        v20[0] = v7;
        v20[1] = CFSTR("-dbg=ocl_rssi_threshold");
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
      }
      if (objc_msgSend(v12, "containsObject:", CFSTR("awdl")))
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), &off_1000E8388);
      if (objc_msgSend(v12, "containsObject:", CFSTR("timesync")))
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), &off_1000E83A0);
      v19[0] = v7;
      v19[1] = CFSTR("-dbg=bgscan-private-mac");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
      v18[0] = v7;
      v18[1] = CFSTR("-dbg=dtim");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
      v17[0] = v7;
      v17[1] = CFSTR("-dbg=private-mac");
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v10, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E83B8, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E83D0, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E83E8, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8400, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8418, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8430, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8448, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8460, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8478, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8490, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E84A8, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E84C0, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E84D8, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E84F0, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8508, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8520, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8538, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8550, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8568, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8580, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8598, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E85B0, v10);
      if (objc_msgSend(v14, "containsObject:", CFSTR("ampdu")))
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E85C8, v10);
      if (objc_msgSend(v14, "containsObject:", CFSTR("amsdu")))
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E85E0, v10);
      if (objc_msgSend(v14, "containsObject:", CFSTR("ocl")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E85F8, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8610, v10);
      }
      if (objc_msgSend(v14, "containsObject:", CFSTR("txcap")))
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8628, v10);
      if (objc_msgSend(v14, "containsObject:", CFSTR("mim_ps")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8640, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8658, v10);
      }
      if (objc_msgSend(v14, "containsObject:", CFSTR("ops")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8670, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8688, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E86A0, v10);
      }
      if (objc_msgSend(v14, "containsObject:", CFSTR("nap")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E86B8, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E86D0, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E86E8, v10);
      }
      if (objc_msgSend(v14, "containsObject:", CFSTR("bcntrim")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8700, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8718, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8730, v10);
      }
      if (objc_msgSend(v14, "containsObject:", CFSTR("rsdb")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8748, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8760, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8778, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8790, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E87A8, v10);
        if (objc_msgSend(v14, "containsObject:", CFSTR("tdmtx")))
        {
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E87C0, v10);
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E87D8, v10);
        }
      }
      if (objc_msgSend(v14, "containsObject:", CFSTR("tvpm")))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E87F0, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8808, v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8820, v10);
      }
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8838, v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E8850, v10);
    }
    -[NSFileHandle closeFile](v10, "closeFile");
    v16 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("wifi_internal.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiPerfLogs:(id)a3
{
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v13;
  id v14;
  id v15;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UUID"));
  if (v8)
  {
    v15 = objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", v8);
    v9 = &v15;
  }
  else
  {
    v10 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:](self, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:", &off_1000E8868, 0, 0, 0, 0, 1.79769313e308);
    if (!objc_msgSend(v10, "count"))
      goto LABEL_7;
    v14 = objc_msgSend(v10, "firstObject");
    v9 = &v14;
  }
  LOBYTE(v13) = v7;
  v11 = -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 1), 0, 0, -1, -1, v6, 1.79769313e308, v13, 0, 0);
  if (v11)
    objc_msgSend(v5, "setRelativeURLs:", v11);
LABEL_7:
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate", v11);
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect3barsCache:(id)a3
{
  id v5;
  id v6;
  NSFileHandle *v7;
  NSFileHandle *v8;
  NSURL *v10;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("3bars.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v6, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
  v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v7, CFSTR("/usr/local/bin/3bars"), &off_1000E8880);
    -[NSFileHandle closeFile](v8, "closeFile");
    v10 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("3bars.txt"));
    objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDeviceAnalyticsStore:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  WADeviceAnalyticsClient *waDeviceAnalyticsClient;
  dispatch_time_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  id v17;
  id v19;
  id v20;
  NSURL *v21;
  NSObject *v22;
  const char *v23;
  void **v24;
  uint64_t v25;
  intptr_t (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[18];
  __int16 v38;
  uint64_t v39;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  HIDWORD(v23) = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge")), "unsignedIntValue");
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("BatchSize")), "unsignedIntValue");
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v9 = +[NSMutableString string](NSMutableString, "string");
  v10 = dispatch_semaphore_create(0);
  v11 = sub_10008F56C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136316418;
    v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    v32 = 2080;
    v33 = "W5LogManager.m";
    v34 = 1024;
    v35 = 7117;
    v36 = 2048;
    *(_QWORD *)v37 = v7;
    *(_WORD *)&v37[8] = 2048;
    *(_QWORD *)&v37[10] = v7 / 0x15180uLL;
    v38 = 2048;
    v39 = v8;
    LODWORD(v23) = 58;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) maxAge:%lu days:%lu batchSize:%lu", (const char *)&v30, v23, (_DWORD)v24, v25, v26, v27);
  }
  if (-[W5LogManager waDeviceAnalyticsClientExists](self, "waDeviceAnalyticsClientExists"))
  {
    waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_10006CF34;
    v27 = &unk_1000D6F48;
    v28 = v9;
    v29 = v10;
    if (!-[WADeviceAnalyticsClient dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:](waDeviceAnalyticsClient, "dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:", &v24, v8, v7 / 0x15180uLL))
    {
LABEL_8:
      v15 = 0;
      goto LABEL_9;
    }
    v13 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v10, v13))
    {
      v14 = sub_10008F56C();
      v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v30 = 136315650;
      v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
      v32 = 2080;
      v33 = "W5LogManager.m";
      v34 = 1024;
      v35 = 7131;
      LODWORD(v23) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Gave up waiting to get Device Analytics Store Dump. Bailing", (const char *)&v30, v23, (_DWORD)v24);
      goto LABEL_8;
    }
    if (!objc_msgSend(v9, "length"))
    {
      v15 = 1;
LABEL_9:
      v16 = sub_10008F56C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v9, "length");
        v30 = 136316162;
        v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
        v32 = 2080;
        v33 = "W5LogManager.m";
        v34 = 1024;
        v35 = 7136;
        v36 = 1024;
        *(_DWORD *)v37 = v15;
        *(_WORD *)&v37[4] = 2048;
        *(_QWORD *)&v37[6] = v17;
        LODWORD(v23) = 44;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Success:%d Length:%lu", &v30, v23);
      }
      goto LABEL_11;
    }
    if (-[NSFileManager isReadableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isReadableFileAtPath:", v9))
    {
      v19 = +[NSMutableArray array](NSMutableArray, "array");
      v20 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", objc_msgSend(v9, "lastPathComponent"));
      -[NSFileManager copyItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "copyItemAtPath:toPath:error:", v9, v20, 0);
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v9, 0);
      v21 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v20);
      if (HIDWORD(v23))
      {
        v21 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", v21, v6, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v20, 0);
      }
      if (v21)
      {
        objc_msgSend(v19, "addObject:", v21);
        objc_msgSend(v5, "setRelativeURLs:", v19);
      }
    }
  }
  else
  {
    v22 = sub_10008F56C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315906;
      v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
      v32 = 2080;
      v33 = "W5LogManager.m";
      v34 = 1024;
      v35 = 7119;
      v36 = 2080;
      *(_QWORD *)v37 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
      LODWORD(v23) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) %s [self waDeviceAnalyticsClientExists] == FALSE, skipping", &v30, v23);
    }
  }
LABEL_11:
  dispatch_release(v10);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDeviceAnalyticsDeploymentGraph:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  WADeviceAnalyticsClient *waDeviceAnalyticsClient;
  dispatch_time_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  id v15;
  id v17;
  id v18;
  NSURL *v19;
  NSObject *v20;
  const char *v21;
  int v22;
  _QWORD v23[6];
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _QWORD v31[3];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v8 = +[NSMutableString string](NSMutableString, "string");
  v9 = dispatch_semaphore_create(0);
  if (-[W5LogManager waDeviceAnalyticsClientExists](self, "waDeviceAnalyticsClientExists"))
  {
    waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10006D470;
    v23[3] = &unk_1000D6F48;
    v23[4] = v8;
    v23[5] = v9;
    if (!-[WADeviceAnalyticsClient dumpDeploymentGraphJSONFileWithCompletion:](waDeviceAnalyticsClient, "dumpDeploymentGraphJSONFileWithCompletion:", v23))
    {
LABEL_6:
      v13 = 0;
      goto LABEL_7;
    }
    v11 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v9, v11))
    {
      v12 = sub_10008F56C();
      v13 = 0;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_7;
      v24 = 136315650;
      v25 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
      v26 = 2080;
      v27 = "W5LogManager.m";
      v28 = 1024;
      v29 = 7195;
      LODWORD(v21) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) Gave up waiting to get Device Analytics Store Dump. Bailing", (const char *)&v24, v21, LODWORD(v23[0]));
      goto LABEL_6;
    }
    if (!objc_msgSend(v8, "length"))
    {
      v13 = 1;
LABEL_7:
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v8, "length");
        v24 = 136316162;
        v25 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
        v26 = 2080;
        v27 = "W5LogManager.m";
        v28 = 1024;
        v29 = 7200;
        v30 = 1024;
        LODWORD(v31[0]) = v13;
        WORD2(v31[0]) = 2048;
        *(_QWORD *)((char *)v31 + 6) = v15;
        LODWORD(v21) = 44;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Success:%d Length:%lu", &v24, v21);
      }
      goto LABEL_9;
    }
    if (-[NSFileManager isReadableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isReadableFileAtPath:", v8))
    {
      v17 = +[NSMutableArray array](NSMutableArray, "array");
      v18 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", objc_msgSend(v8, "lastPathComponent"));
      -[NSFileManager copyItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "copyItemAtPath:toPath:error:", v8, v18, 0);
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v8, 0);
      v19 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18);
      if (v7)
      {
        v19 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", v19, v6, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v18, 0);
      }
      if (v19)
      {
        objc_msgSend(v17, "addObject:", v19);
        objc_msgSend(v5, "setRelativeURLs:", v17);
      }
    }
  }
  else
  {
    v20 = sub_10008F56C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315906;
      v25 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
      v26 = 2080;
      v27 = "W5LogManager.m";
      v28 = 1024;
      v29 = 7183;
      v30 = 2080;
      v31[0] = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
      v22 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] %s (%s:%u) %s [self waDeviceAnalyticsClientExists] == FALSE, skipping", &v24, v22);
    }
  }
LABEL_9:
  dispatch_release(v9);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDeviceAnalyticsEntityCSVs:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  WADeviceAnalyticsClient *waDeviceAnalyticsClient;
  dispatch_time_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  id v24;
  NSURL *v25;
  NSObject *v27;
  const char *v28;
  int object;
  NSObject *objecta;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[6];
  _BYTE v40[128];
  int v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  _BYTE v48[18];
  __int16 v49;
  uint64_t v50;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKey:", CFSTR("AnalyticsCSVOutputDir"));
  if (!v6)
    v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  HIDWORD(v34) = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("MaxAge")), "unsignedIntValue");
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("BatchSize")), "unsignedIntValue");
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v10 = dispatch_semaphore_create(0);
  v11 = sub_10008F56C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 136316418;
    v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    v43 = 2080;
    v44 = "W5LogManager.m";
    v45 = 1024;
    v46 = 7251;
    v47 = 2048;
    *(_QWORD *)v48 = v7;
    *(_WORD *)&v48[8] = 2048;
    *(_QWORD *)&v48[10] = v7 / 0x15180uLL;
    v49 = 2048;
    v50 = v8;
    LODWORD(v28) = 58;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) maxAge:%lu days:%lu batchSize:%lu", (const char *)&v41, v28, object, v31, v32, v34);
  }
  v33 = v5;
  objecta = v10;
  if (-[W5LogManager waDeviceAnalyticsClientExists](self, "waDeviceAnalyticsClientExists"))
  {
    waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10006DB5C;
    v39[3] = &unk_1000D6F70;
    v39[4] = v9;
    v39[5] = v10;
    if (!-[WADeviceAnalyticsClient dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:](waDeviceAnalyticsClient, "dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:", v39, v8, v7 / 0x15180uLL))
    {
LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
    v13 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v10, v13))
    {
      v14 = sub_10008F56C();
      v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v41 = 136315650;
      v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
      v43 = 2080;
      v44 = "W5LogManager.m";
      v45 = 1024;
      v46 = 7265;
      LODWORD(v28) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Gave up waiting to get Device Analytics Store Dump. Bailing", (const char *)&v41, v28, (_DWORD)v10);
      goto LABEL_10;
    }
    if (!objc_msgSend(v9, "count"))
    {
      v15 = 1;
LABEL_11:
      v16 = sub_10008F56C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v9, "count");
        v41 = 136316162;
        v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
        v43 = 2080;
        v44 = "W5LogManager.m";
        v45 = 1024;
        v46 = 7270;
        v47 = 1024;
        *(_DWORD *)v48 = v15;
        *(_WORD *)&v48[4] = 2048;
        *(_QWORD *)&v48[6] = v17;
        LODWORD(v28) = 44;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Success:%d nFiles:%lu", &v41, v28);
      }
      goto LABEL_27;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v9);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if (-[NSFileManager isReadableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isReadableFileAtPath:", v22))
          {
            v23 = +[NSMutableArray array](NSMutableArray, "array");
            v24 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", objc_msgSend(v22, "lastPathComponent"));
            -[NSFileManager copyItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "copyItemAtPath:toPath:error:", v22, v24, 0);
            -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v22, 0);
            v25 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v24);
            if (HIDWORD(v34))
            {
              v25 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:](self, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", v25, v6, 0x7FFFFFFFFFFFFFFFLL, 1, 0, 1.79769313e308);
              -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v24, 0);
            }
            if (v25)
            {
              objc_msgSend(v23, "addObject:", v25);
              objc_msgSend(v33, "setRelativeURLs:", v23);
            }
          }
        }
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v19);
    }
  }
  else
  {
    v27 = sub_10008F56C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 136315906;
      v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
      v43 = 2080;
      v44 = "W5LogManager.m";
      v45 = 1024;
      v46 = 7253;
      v47 = 2080;
      *(_QWORD *)v48 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
      LODWORD(v28) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) %s [self waDeviceAnalyticsClientExists] == FALSE, skipping", &v41, v28);
    }
  }
LABEL_27:
  dispatch_release(objecta);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v33, "setCompletedAt:");
  return v33;
}

- (id)__dnssdBrowseAll:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  int64_t v10;
  dispatch_time_t v11;
  dispatch_time_t v12;
  NSData *v13;
  NSObject *v14;
  id v15;
  id v16;
  unsigned int v17;
  NSObject *v18;
  unsigned int v20;
  NSObject *v21;
  const char *v22;
  int v23;
  uint64_t v24;
  _QWORD block[5];
  NSURL *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  uint64_t v38;

  v4 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v4, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("DoPing")), "BOOLValue");
  v7 = -[W5DNSSDBrowser init:]([W5DNSSDBrowser alloc], "init:", v6);
  v8 = objc_msgSend(v7, "startBrowsing");
  if (v8)
  {
    v20 = v8;
    v21 = sub_10008F56C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
      v29 = 2080;
      v30 = "W5LogManager.m";
      v31 = 1024;
      v32 = 7322;
      v33 = 1024;
      LODWORD(v34) = v20;
      LODWORD(v22) = 34;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) DNSServiceQueryRecord failed. Error: %d", (const char *)buf, v22, v23, v24);
    }
  }
  else
  {
    v9 = dispatch_semaphore_create(0);
    if ((_DWORD)v6)
      v10 = 30000000000;
    else
      v10 = 10000000000;
    v11 = dispatch_time(0, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E0D0;
    block[3] = &unk_1000D5C98;
    block[4] = v9;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
    v12 = dispatch_time(0, 80000000000);
    if (dispatch_semaphore_wait(v9, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v28 = 0x4054000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
    objc_msgSend(v7, "stopBrowsing");
    v24 = 0;
    v13 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", objc_msgSend(v7, "browseAllResults"), 1, &v24);
    if (v24)
    {
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
        v29 = 2080;
        v30 = "W5LogManager.m";
        v31 = 1024;
        v32 = 7340;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Failed to convert to JSON", buf, 28);
      }
    }
    else
    {
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v13, 4);
      v16 = objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("dnssd_browseAll.json"));
      v17 = objc_msgSend(v15, "writeToFile:atomically:encoding:error:", v16, 1, 4, &v24);
      v18 = sub_10008F56C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
        v29 = 2080;
        v30 = "W5LogManager.m";
        v31 = 1024;
        v32 = 7347;
        v33 = 2112;
        v34 = v16;
        v35 = 1024;
        v36 = v17;
        v37 = 2112;
        v38 = v24;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Write BrowseAll results to: %@, success: %d, error: %@", buf, 54);
      }
    }
    v26 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("dnssd_browseAll.json"));
    objc_msgSend(v4, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__dnssdCacheAndState:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSFileHandle *v8;
  NSFileHandle *v9;
  id v10;
  NSFileHandle *v11;
  NSFileHandle *v12;
  _QWORD v14[2];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("dnssd_cachedLocalRecords.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v7, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v7, 0, 0);
  v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
  if (v8)
  {
    v9 = v8;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/dnssdutil"), &off_1000E8898);
    -[NSFileHandle closeFile](v9, "closeFile");
    v10 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", CFSTR("dnssd_state.txt"));
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v10, 0);
    -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v10, 0, 0);
    v11 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v10);
    if (v11)
    {
      v12 = v11;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v11, CFSTR("/usr/bin/dns-sd"), &off_1000E88B0);
      -[NSFileHandle closeFile](v12, "closeFile");
      v14[0] = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("dnssd_cachedLocalRecords.txt"));
      v14[1] = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("dnssd_state.txt"));
      objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__pingSubnet:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSOperationQueue *v10;
  int i;
  NSObject *v12;
  dispatch_time_t v13;
  dispatch_time_t v14;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[6];
  _QWORD v19[6];
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(-[W5StatusManager networkStatus](self->_status, "networkStatus"), "primaryIPv4Addresses"), "firstObject");
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    if (objc_msgSend(v8, "count") == (id)4)
    {
      v9 = objc_msgSend(objc_msgSend(v8, "subarrayWithRange:", 0, 3), "componentsJoinedByString:", CFSTR("."));
      v10 = objc_opt_new(NSOperationQueue);
      for (i = 1; i != 255; ++i)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10006E65C;
        v19[3] = &unk_1000D6F98;
        v19[4] = self;
        v19[5] = v9;
        v20 = i;
        -[NSOperationQueue addOperationWithBlock:](v10, "addOperationWithBlock:", v19);
      }
      v12 = dispatch_semaphore_create(0);
      v13 = dispatch_time(0, 60000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006E6E0;
      block[3] = &unk_1000D5C48;
      block[4] = v10;
      block[5] = v12;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
      v14 = dispatch_time(0, 80000000000);
      if (dispatch_semaphore_wait(v12, v14) > 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v22 = 0x4054000000000000;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
      }
    }
    else
    {
      v17 = sub_10008F56C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = (uint64_t)"-[W5LogManager __pingSubnet:]";
        v23 = 2080;
        v24 = "W5LogManager.m";
        v25 = 1024;
        v26 = 7412;
        v27 = 2112;
        v28 = v7;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) Malformed self IP address: %@", buf, 38);
      }
    }
  }
  else
  {
    v16 = sub_10008F56C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = (uint64_t)"-[W5LogManager __pingSubnet:]";
      v23 = 2080;
      v24 = "W5LogManager.m";
      v25 = 1024;
      v26 = 7409;
      v27 = 2112;
      v28 = v7;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Unable to get valid self IP address: %@", buf, 38);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__pingBroadcast:(id)a3
{
  id v5;
  id v6;
  NSFileHandle *v7;
  NSObject *v9;
  const char *v10;
  int v11;
  NSURL *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  if ((-[CWFInterface powerOn](-[W5StatusManager corewifi](self->_status, "corewifi"), "powerOn") & 1) != 0)
  {
    v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory")), "path"), "stringByAppendingPathComponent:", CFSTR("ping_broadcast.txt"));
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v6, 0);
    -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
    v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
    if (v7)
    {
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v7, CFSTR("/sbin/ping"), &off_1000E88C8);
      v12 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("ping_broadcast.txt"));
      objc_msgSend(v5, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    }
  }
  else
  {
    v9 = sub_10008F56C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[W5LogManager __pingBroadcast:]";
      v15 = 2080;
      v16 = "W5LogManager.m";
      v17 = 1024;
      v18 = 7446;
      LODWORD(v10) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) WiFi is OFF", (const char *)&v13, v10, v11);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDatapathStats:(id)a3
{
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  const __CFString *v9;
  id v10;
  NSFileHandle *v11;
  NSFileHandle *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  id v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  NSURL *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];

  v5 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v5, "setRequest:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v22 = v5;
  objc_msgSend(v5, "setStartedAt:");
  v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v7 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("FileNameOverride"));
  v8 = objc_msgSend(v6, "path");
  if (v7)
    v9 = v7;
  else
    v9 = CFSTR("wifi_datapath.txt");
  v10 = objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v10, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v10, 0, 0);
  v11 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v10);
  if (v11)
  {
    v12 = v11;
    v13 = +[NSMutableArray array](NSMutableArray, "array");
    v14 = -[CWFInterface interfaceNames](-[W5StatusManager corewifi](self->_status, "corewifi"), "interfaceNames");
    v15 = -[CWFInterface virtualInterfaceNames](-[W5StatusManager corewifi](self->_status, "corewifi"), "virtualInterfaceNames");
    if (v14)
      objc_msgSend(v13, "addObjectsFromArray:", v14);
    if (v15)
      objc_msgSend(v13, "addObjectsFromArray:", v15);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v13;
    v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v20 = +[NSMutableString string](NSMutableString, "string");
          objc_msgSend(v20, "appendString:", CFSTR("####################################################################\n"));
          objc_msgSend(v20, "appendFormat:", CFSTR("INTERFACE: %@\n"), v19);
          objc_msgSend(v20, "appendString:", CFSTR("####################################################################\n\n"));
          -[NSFileHandle writeData:](v12, "writeData:", objc_msgSend(v20, "dataUsingEncoding:", 4));
          v38[0] = v19;
          v38[1] = CFSTR("-dbg=m");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2), 1, 0);
          v37[0] = v19;
          v37[1] = CFSTR("-dbg=bgscan-private-mac");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2), 1, 0);
          v36[0] = v19;
          v36[1] = CFSTR("-dbg=proptx");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2), 1, 0);
          v35[0] = CFSTR("-i");
          v35[1] = v19;
          v35[2] = CFSTR("wme_counters");
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:](self, "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3), v12, 1, 0);
          v34[0] = CFSTR("-i");
          v34[1] = v19;
          v34[2] = CFSTR("counters");
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:](self, "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 3), v12, 1, 0);
          v33[0] = CFSTR("-i");
          v33[1] = v19;
          v33[2] = CFSTR("memuse");
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:](self, "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3), v12, 1, 0);
          v32[0] = CFSTR("-i");
          v32[1] = v19;
          v32[2] = CFSTR("-q");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3), 1, 0);
          v31[0] = v19;
          v31[1] = CFSTR("-dbg=print_peers");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2), 1, 0);
          v30[0] = v19;
          v30[1] = CFSTR("-dbg=print_packets");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2), 1, 0);
          v29[0] = v19;
          v29[1] = CFSTR("-dbg=print_all_peers_verbose");
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v12, 0, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2), 1, 0);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
      }
      while (v16);
    }
    -[NSFileHandle closeFile](v12, "closeFile");
    v28 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9);
    objc_msgSend(v22, "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "setCompletedAt:");
  return v22;
}

- (id)__collectLogItem:(id)a3 error:(id *)a4
{
  NSObject *debugLogQueue;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *queue;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  dispatch_block_t v22;
  uint64_t v23;
  dispatch_time_t v24;
  intptr_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v36;
  id v37;
  _QWORD v38[7];
  _QWORD v39[7];
  mach_timebase_info info;
  _QWORD v41[9];
  _QWORD v42[10];
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD block[6];
  int v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[24];
  void (*v54)(uint64_t, uint64_t);
  __int128 v55;

  if (objc_msgSend(a3, "itemID") == (id)53)
  {
    debugLogQueue = self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F4BC;
    block[3] = &unk_1000D5C48;
    block[4] = a3;
    block[5] = self;
    dispatch_sync(debugLogQueue, block);
    return -[W5LogManager __collectMultiple:](self, "__collectMultiple:", a3);
  }
  else
  {
    v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseLeewayUUID"));
    v37 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("AddLeewayUUID"));
    v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("TimestampUUID"));
    v10 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Timeout"));
    if (v10)
      v11 = (uint64_t)objc_msgSend(v10, "unsignedIntegerValue");
    else
      v11 = 10000;
    if (v8)
    {
      v12 = v9;
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      queue = self->_queue;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10006F62C;
      v43[3] = &unk_1000D6700;
      v43[5] = v8;
      v43[6] = &v44;
      v43[4] = self;
      dispatch_sync(queue, v43);
      v14 = v45[3];
      v15 = sub_10008F56C();
      v11 += v14;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v45[3];
        v17 = objc_msgSend(v8, "substringToIndex:", 5);
        v18 = (void (*)(uint64_t, uint64_t))(v11 - v45[3]);
        *(_DWORD *)v53 = 134218754;
        *(_QWORD *)&v53[4] = v16;
        *(_WORD *)&v53[12] = 2114;
        *(_QWORD *)&v53[14] = v17;
        *(_WORD *)&v53[22] = 2048;
        v54 = v18;
        LOWORD(v55) = 2048;
        *(_QWORD *)((char *)&v55 + 2) = v11;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] Using leeway of %lums [%{public}@], extending timeout from %lums to %lums", v53, 42);
      }
      _Block_object_dispose(&v44, 8);
      v9 = v12;
    }
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v20 = v19;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    LOBYTE(v47) = 0;
    *(_QWORD *)v53 = 0;
    *(_QWORD *)&v53[8] = v53;
    *(_QWORD *)&v53[16] = 0x3052000000;
    v54 = sub_100058028;
    *(_QWORD *)&v55 = sub_100058038;
    *((_QWORD *)&v55 + 1) = 0;
    v21 = dispatch_queue_create(0, 0);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10006F670;
    v42[3] = &unk_1000D6FE8;
    v42[4] = self;
    v42[5] = a3;
    v42[6] = v21;
    v42[7] = &v44;
    v42[8] = v53;
    v42[9] = a4;
    v22 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v42);
    v23 = mach_absolute_time();
    -[NSOperationQueue addOperationWithBlock:](-[W5StatusManager concurrentQueue](self->_status, "concurrentQueue"), "addOperationWithBlock:", v22);
    if (v11)
      v24 = dispatch_time(0, 1000000 * v11);
    else
      v24 = -1;
    v25 = dispatch_block_wait(v22, v24);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10006F738;
    v41[3] = &unk_1000D7010;
    v41[6] = v53;
    v41[7] = v25;
    v41[4] = a3;
    v41[5] = &v44;
    v41[8] = v20;
    dispatch_sync(v21, v41);
    if (!v25 && v37 && v11)
    {
      info = 0;
      mach_timebase_info(&info);
      if (info.denom)
        v26 = (mach_absolute_time() - v23) * info.numer / info.denom / 0xF4240;
      else
        v26 = 0;
      v27 = v11 - v26;
      v28 = self->_queue;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10006F870;
      v39[3] = &unk_1000D6468;
      v39[4] = self;
      v39[5] = v37;
      v39[6] = v27;
      dispatch_async(v28, v39);
      v29 = sub_10008F56C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_msgSend(v37, "substringToIndex:", 5);
        v49 = 134218242;
        v50 = v27;
        v51 = 2114;
        v52 = v30;
        LODWORD(v36) = 22;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v29, 0, "[wifivelocity] Storing leeway of %lums [%{public}@]", &v49, v36);
      }
    }
    v31 = mach_absolute_time();
    v32 = self->_queue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10006F8B8;
    v38[3] = &unk_1000D6468;
    v38[4] = v9;
    v38[5] = self;
    v38[6] = v31;
    dispatch_async(v32, v38);
    v33 = objc_msgSend(*(id *)(*(_QWORD *)&v53[8] + 40), "copy");
    v34 = *(id *)(*(_QWORD *)&v53[8] + 40);
    dispatch_release(v21);
    _Block_release(v22);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(&v44, 8);
    return v33;
  }
}

- (id)__collectIndividual:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSString *v10;
  void *v11;
  NSObject *debugLogQueue;
  id v13;
  NSObject *queue;
  id v15;
  uint64_t *v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD v40[7];
  _QWORD v41[9];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[6];
  _QWORD block[7];
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  _BYTE info[24];
  _BYTE v55[24];

  v7 = W5DescriptionForLogItemID(objc_msgSend(a3, "itemID"));
  if (-[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%ld"), CFSTR("wifivelocity-exclude-log"), objc_msgSend(a3, "itemID")))|| -[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@='%@'"), CFSTR("wifivelocity-exclude-log"), v7)))
  {
    v8 = sub_10008F56C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)info = 138543618;
      *(_QWORD *)&info[4] = v7;
      *(_WORD *)&info[12] = 2048;
      *(_QWORD *)&info[14] = objc_msgSend(a3, "itemID");
      LODWORD(v36) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] EXCLUDING [%{public}@] (logItemID=%ld) via boot-arg!!!", info, v36);
    }
    return 0;
  }
  else
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.wifivelocity.log_item.%@"), W5DescriptionForLogItemID(objc_msgSend(a3, "itemID")));
    v11 = (void *)os_transaction_create(-[NSString UTF8String](v10, "UTF8String"));
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", -[NSString UTF8String](v10, "UTF8String"), v11);
    debugLogQueue = self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070574;
    block[3] = &unk_1000D58F8;
    block[4] = a3;
    block[5] = self;
    block[6] = v7;
    dispatch_sync(debugLogQueue, block);
    switch((unint64_t)objc_msgSend(a3, "itemID"))
    {
      case 1uLL:
        v13 = -[W5LogManager __collect_spindump:](self, "__collect_spindump:", a3);
        goto LABEL_88;
      case 2uLL:
        v13 = -[W5LogManager __collect_ping:](self, "__collect_ping:", a3);
        goto LABEL_88;
      case 3uLL:
        v13 = -[W5LogManager __collect_netstat:](self, "__collect_netstat:", a3);
        goto LABEL_88;
      case 4uLL:
        v13 = -[W5LogManager __collect_arp:](self, "__collect_arp:", a3);
        goto LABEL_88;
      case 6uLL:
        v13 = -[W5LogManager __collect_ndp:](self, "__collect_ndp:", a3);
        goto LABEL_88;
      case 7uLL:
        v13 = -[W5LogManager __collect_ifconfig:](self, "__collect_ifconfig:", a3);
        goto LABEL_88;
      case 8uLL:
        v13 = -[W5LogManager __collect_ipconfig:](self, "__collect_ipconfig:", a3);
        goto LABEL_88;
      case 9uLL:
        v13 = -[W5LogManager __collect_traceroute:](self, "__collect_traceroute:", a3);
        goto LABEL_88;
      case 0xAuLL:
        v13 = -[W5LogManager __collect_ioreg:](self, "__collect_ioreg:", a3);
        goto LABEL_88;
      case 0xBuLL:
        v13 = -[W5LogManager __collect_kextstat:](self, "__collect_kextstat:", a3);
        goto LABEL_88;
      case 0xCuLL:
        v13 = -[W5LogManager __collect_darwinup:](self, "__collect_darwinup:", a3);
        goto LABEL_88;
      case 0xDuLL:
        v13 = -[W5LogManager __collect_hosts:](self, "__collect_hosts:", a3);
        goto LABEL_88;
      case 0xEuLL:
        v13 = -[W5LogManager __collect_sysdiagnose:](self, "__collect_sysdiagnose:", a3);
        goto LABEL_88;
      case 0xFuLL:
        v13 = -[W5LogManager __collect_pmset:](self, "__collect_pmset:", a3);
        goto LABEL_88;
      case 0x10uLL:
        v13 = -[W5LogManager __collect_configd:](self, "__collect_configd:", a3);
        goto LABEL_88;
      case 0x11uLL:
        v13 = -[W5LogManager __collect_top:](self, "__collect_top:", a3);
        goto LABEL_88;
      case 0x12uLL:
        v13 = -[W5LogManager __collect_swvers:](self, "__collect_swvers:", a3);
        goto LABEL_88;
      case 0x13uLL:
        v13 = -[W5LogManager __collectCoreCapture:](self, "__collectCoreCapture:", a3);
        goto LABEL_88;
      case 0x14uLL:
        v13 = -[W5LogManager __collectCoreCapture24:](self, "__collectCoreCapture24:", a3);
        goto LABEL_88;
      case 0x15uLL:
        v13 = -[W5LogManager __collectCoreCaptureDump:](self, "__collectCoreCaptureDump:", a3);
        goto LABEL_88;
      case 0x18uLL:
        v13 = -[W5LogManager __collectTCPDump_PRE:](self, "__collectTCPDump_PRE:", a3);
        goto LABEL_88;
      case 0x19uLL:
        v13 = -[W5LogManager __collectTCPDump_POST:](self, "__collectTCPDump_POST:", a3);
        goto LABEL_88;
      case 0x1AuLL:
        v13 = -[W5LogManager __collectDiagnostics:](self, "__collectDiagnostics:", a3);
        goto LABEL_88;
      case 0x1BuLL:
        v13 = -[W5LogManager __collectSystemConfiguration:](self, "__collectSystemConfiguration:", a3);
        goto LABEL_88;
      case 0x1CuLL:
        v13 = -[W5LogManager __collectWiFiScanResults:](self, "__collectWiFiScanResults:", a3);
        goto LABEL_88;
      case 0x1DuLL:
        v13 = -[W5LogManager __collectAirPlayLogs:](self, "__collectAirPlayLogs:", a3);
        goto LABEL_88;
      case 0x1EuLL:
        v13 = -[W5LogManager __collectBluetoothLogs:](self, "__collectBluetoothLogs:", a3);
        goto LABEL_88;
      case 0x1FuLL:
        v13 = -[W5LogManager __collectSystemLogs:](self, "__collectSystemLogs:", a3);
        goto LABEL_88;
      case 0x20uLL:
        v13 = -[W5LogManager __collectSystemLogs24:](self, "__collectSystemLogs24:", a3);
        goto LABEL_88;
      case 0x21uLL:
        v13 = -[W5LogManager __collectEAP8021XLogs:](self, "__collectEAP8021XLogs:", a3);
        goto LABEL_88;
      case 0x22uLL:
        v13 = -[W5LogManager __collectIPConfigurationLogs:](self, "__collectIPConfigurationLogs:", a3);
        goto LABEL_88;
      case 0x23uLL:
        v13 = -[W5LogManager __collectCrashesAndSpins24:](self, "__collectCrashesAndSpins24:", a3);
        goto LABEL_88;
      case 0x24uLL:
        v13 = -[W5LogManager __collectSharingLogs:](self, "__collectSharingLogs:", a3);
        goto LABEL_88;
      case 0x25uLL:
        v13 = -[W5LogManager __collectWiFiLogs:](self, "__collectWiFiLogs:", a3);
        goto LABEL_88;
      case 0x26uLL:
        v13 = -[W5LogManager __collectWiFiLogs24:](self, "__collectWiFiLogs24:", a3);
        goto LABEL_88;
      case 0x27uLL:
        v13 = -[W5LogManager __collectWiFiLogsDump:](self, "__collectWiFiLogsDump:", a3);
        goto LABEL_88;
      case 0x28uLL:
        v13 = -[W5LogManager __collectWiFiPreferences:](self, "__collectWiFiPreferences:", a3);
        goto LABEL_88;
      case 0x29uLL:
        v13 = -[W5LogManager __collectWirelessProxLogs:](self, "__collectWirelessProxLogs:", a3);
        goto LABEL_88;
      case 0x2AuLL:
        v13 = -[W5LogManager __collect_IMFoundationPing:](self, "__collect_IMFoundationPing:", a3);
        goto LABEL_88;
      case 0x2BuLL:
        v13 = -[W5LogManager __collect_CFNetworkPing:](self, "__collect_CFNetworkPing:", a3);
        goto LABEL_88;
      case 0x2CuLL:
        v13 = -[W5LogManager __collectNetworkStatus:](self, "__collectNetworkStatus:", a3);
        goto LABEL_88;
      case 0x2DuLL:
        v13 = -[W5LogManager __collectWiFiStatus:](self, "__collectWiFiStatus:", a3);
        goto LABEL_88;
      case 0x2EuLL:
        v13 = -[W5LogManager __collectAWDLStatus:](self, "__collectAWDLStatus:", a3);
        goto LABEL_88;
      case 0x2FuLL:
        v13 = -[W5LogManager __collectBluetoothStatus:](self, "__collectBluetoothStatus:", a3);
        goto LABEL_88;
      case 0x30uLL:
        v13 = -[W5LogManager __collectLeakyAPStats:](self, "__collectLeakyAPStats:", a3);
        goto LABEL_88;
      case 0x31uLL:
        v13 = -[W5LogManager __collectBonjourRecords:](self, "__collectBonjourRecords:", a3);
        goto LABEL_88;
      case 0x32uLL:
        v13 = -[W5LogManager __collectEventHistory:](self, "__collectEventHistory:", a3);
        goto LABEL_88;
      case 0x33uLL:
        v13 = -[W5LogManager __collectPerSSIDDiagnosticsHistory:](self, "__collectPerSSIDDiagnosticsHistory:", a3);
        goto LABEL_88;
      case 0x34uLL:
        *(_QWORD *)info = 0;
        *(_QWORD *)&info[8] = info;
        *(_QWORD *)&info[16] = 0x3052000000;
        *(_QWORD *)v55 = sub_100058028;
        *(_QWORD *)&v55[8] = sub_100058038;
        *(_QWORD *)&v55[16] = 0;
        queue = self->_queue;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1000706F0;
        v50[3] = &unk_1000D5998;
        v50[4] = self;
        v50[5] = info;
        dispatch_sync(queue, v50);
        v15 = *(id *)(*(_QWORD *)&info[8] + 40);
        v9 = -[W5LogManager __collectAdditionalLog:url:](self, "__collectAdditionalLog:url:", a3, *(_QWORD *)(*(_QWORD *)&info[8] + 40));
        v16 = (uint64_t *)info;
        goto LABEL_106;
      case 0x39uLL:
        v13 = -[W5LogManager __collect_mobilewifitool:](self, "__collect_mobilewifitool:", a3);
        goto LABEL_88;
      case 0x3AuLL:
        v13 = -[W5LogManager __collect_security:](self, "__collect_security:", a3);
        goto LABEL_88;
      case 0x3DuLL:
      case 0x3EuLL:
        v13 = -[W5LogManager __collectWiFiStatsCLI:](self, "__collectWiFiStatsCLI:", a3);
        goto LABEL_88;
      case 0x3FuLL:
        v9 = objc_alloc_init((Class)W5LogItemReceipt);
        objc_msgSend(v9, "setRequest:", a3);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        -[W5DiagnosticsManager beginWiFiDefaultRoute](self->_diagnostics, "beginWiFiDefaultRoute");
        goto LABEL_66;
      case 0x40uLL:
        v9 = objc_alloc_init((Class)W5LogItemReceipt);
        objc_msgSend(v9, "setRequest:", a3);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        -[W5DiagnosticsManager endWiFiDefaultRoute](self->_diagnostics, "endWiFiDefaultRoute");
LABEL_66:
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setCompletedAt:");
        break;
      case 0x41uLL:
        v13 = -[W5LogManager __collect_wl_curpower:](self, "__collect_wl_curpower:", a3);
        goto LABEL_88;
      case 0x42uLL:
        v13 = -[W5LogManager __collect_wl_cca_get_stats:](self, "__collect_wl_cca_get_stats:", a3);
        goto LABEL_88;
      case 0x45uLL:
        v9 = objc_alloc_init((Class)W5LogItemReceipt);
        objc_msgSend(v9, "setRequest:", a3);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        v17 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("Delay"));
        if (v17)
        {
          v18 = (unint64_t)objc_msgSend(v17, "unsignedIntegerValue");
        }
        else
        {
          v25 = sub_10008F56C();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)info = 0;
            LODWORD(v36) = 2;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] DELAY log item used without specifying delay, using default of 1000 ms", info, v36);
          }
          v18 = 1000;
        }
        v26 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("UseLeewayUUID"));
        v27 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("TimestampUUID"));
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v42 = 0;
        v43 = &v42;
        v44 = 0x2020000000;
        v45 = 0;
        v28 = self->_queue;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100070734;
        v41[3] = &unk_1000D7038;
        v41[4] = v26;
        v41[5] = self;
        v41[7] = &v46;
        v41[8] = &v42;
        v41[6] = v27;
        dispatch_sync(v28, v41);
        v29 = v43[3];
        if (v29)
        {
          *(_QWORD *)info = 0;
          mach_timebase_info((mach_timebase_info_t)info);
          if (*(_DWORD *)&info[4])
            v29 = (mach_absolute_time() - v43[3]) * *(unsigned int *)info / *(unsigned int *)&info[4] / 0xF4240;
          else
            v29 = 0;
        }
        v38 = v29;
        v39 = v18;
        v30 = v18 >= v29;
        v31 = v18 - v29;
        if (v30)
          v32 = v31;
        else
          v32 = 0;
        v33 = v47[3] + v32;
        v34 = sub_10008F56C();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v47[3];
          *(_DWORD *)info = 134218752;
          *(_QWORD *)&info[4] = v39;
          *(_WORD *)&info[12] = 2048;
          *(_QWORD *)&info[14] = v38;
          *(_WORD *)&info[22] = 2048;
          *(_QWORD *)v55 = v35;
          *(_WORD *)&v55[8] = 2048;
          *(_QWORD *)&v55[10] = v33;
          LODWORD(v36) = 42;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v34, 0, "[wifivelocity] DELAY (delay=%lu, elapsed=%lu, leeway=%lu, total=%lu)", info, v36, v37, v38);
        }
        usleep(1000 * v33);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setCompletedAt:");
        _Block_object_dispose(&v42, 8);
        v16 = &v46;
LABEL_106:
        _Block_object_dispose(v16, 8);
        break;
      case 0x46uLL:
        v13 = -[W5LogManager __collectPreviouslyCollected:](self, "__collectPreviouslyCollected:", a3);
        goto LABEL_88;
      case 0x49uLL:
        v13 = -[W5LogManager __collectNetworkPreferences:](self, "__collectNetworkPreferences:", a3);
        goto LABEL_88;
      case 0x4AuLL:
        v13 = -[W5LogManager __collectWiFiMemoryUsage:](self, "__collectWiFiMemoryUsage:", a3);
        goto LABEL_88;
      case 0x4BuLL:
        v13 = -[W5LogManager __collectWiFiDeviceConfig:](self, "__collectWiFiDeviceConfig:", a3);
        goto LABEL_88;
      case 0x4CuLL:
        v13 = -[W5LogManager __collectWiFiPerfLogs:](self, "__collectWiFiPerfLogs:", a3);
        goto LABEL_88;
      case 0x4EuLL:
        v13 = -[W5LogManager __collectWiFiVelocityLog:](self, "__collectWiFiVelocityLog:", a3);
        goto LABEL_88;
      case 0x50uLL:
        v13 = -[W5LogManager __collect3barsCache:](self, "__collect3barsCache:", a3);
        goto LABEL_88;
      case 0x51uLL:
        v13 = -[W5LogManager __collectDatapathStats:](self, "__collectDatapathStats:", a3);
        goto LABEL_88;
      case 0x54uLL:
        v13 = -[W5LogManager __collectDeviceAnalyticsStore:](self, "__collectDeviceAnalyticsStore:", a3);
        goto LABEL_88;
      case 0x55uLL:
        v13 = -[W5LogManager __collectDeviceAnalyticsDeploymentGraph:](self, "__collectDeviceAnalyticsDeploymentGraph:", a3);
        goto LABEL_88;
      case 0x56uLL:
        v13 = -[W5LogManager __collectPeerDiagnostics:](self, "__collectPeerDiagnostics:", a3);
        goto LABEL_88;
      case 0x57uLL:
        v13 = -[W5LogManager __collectDextCoreDump:](self, "__collectDextCoreDump:", a3);
        goto LABEL_88;
      case 0x58uLL:
        if (!objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", CFSTR("BatchSize")))
        {
          v19 = sub_10008F56C();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_msgSend(a3, "configuration");
            *(_DWORD *)info = 138412290;
            *(_QWORD *)&info[4] = v20;
            LODWORD(v36) = 12;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] logItem.configuration[kW5LogItemRequestConfigBatchSize] is nil %@", info, v36);
          }
        }
        v21 = sub_10008F56C();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(a3, "configuration");
          *(_DWORD *)info = 136315906;
          *(_QWORD *)&info[4] = "-[W5LogManager __collectIndividual:error:]";
          *(_WORD *)&info[12] = 2080;
          *(_QWORD *)&info[14] = "W5LogManager.m";
          *(_WORD *)&info[22] = 1024;
          *(_DWORD *)v55 = 8193;
          *(_WORD *)&v55[4] = 2112;
          *(_QWORD *)&v55[6] = v22;
          LODWORD(v36) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) Requesting Analytics CSVs with config: %@", info, v36);
        }
        v13 = -[W5LogManager __collectDeviceAnalyticsEntityCSVs:](self, "__collectDeviceAnalyticsEntityCSVs:", a3);
        goto LABEL_88;
      case 0x59uLL:
        v13 = -[W5LogManager __dnssdBrowseAll:](self, "__dnssdBrowseAll:", a3);
        goto LABEL_88;
      case 0x5AuLL:
        v13 = -[W5LogManager __dnssdCacheAndState:](self, "__dnssdCacheAndState:", a3);
        goto LABEL_88;
      case 0x5BuLL:
        v13 = -[W5LogManager __pingSubnet:](self, "__pingSubnet:", a3);
        goto LABEL_88;
      case 0x5CuLL:
        v13 = -[W5LogManager __pingBroadcast:](self, "__pingBroadcast:", a3);
LABEL_88:
        v9 = v13;
        break;
      default:
        v9 = objc_alloc_init((Class)W5LogItemReceipt);
        objc_msgSend(v9, "setRequest:", a3);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        objc_msgSend(v9, "startedAt");
        objc_msgSend(v9, "setCompletedAt:");
        if (a4)
        {
          v52 = NSLocalizedFailureReasonErrorKey;
          v53 = CFSTR("W5ParamErr");
          *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
        }
        break;
    }
    v23 = self->_debugLogQueue;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000707B4;
    v40[3] = &unk_1000D58F8;
    v40[4] = a3;
    v40[5] = v9;
    v40[6] = self;
    dispatch_sync(v23, v40);
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", v11);

  }
  return v9;
}

- (id)__runDiagnosticsTests:(id)a3 configuration:(id)a4 timeout:(int64_t)a5 error:(id *)a6
{
  id v11;
  NSObject *v12;
  W5DiagnosticsTestRequestInternal *v13;
  NSObject *queue;
  id v15;
  dispatch_time_t v16;
  NSError *v17;
  dispatch_time_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[10];
  _QWORD block[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;

  v46 = 0;
  v47 = &v46;
  v48 = 0x3052000000;
  v49 = sub_100058028;
  v50 = sub_100058038;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3052000000;
  v43 = sub_100058028;
  v44 = sub_100058038;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v11 = objc_alloc_init((Class)NSLock);
  v12 = dispatch_semaphore_create(0);
  v13 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = sub_100058028;
  v30 = sub_100058038;
  v31 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070EB4;
  block[3] = &unk_1000D5998;
  block[4] = self;
  block[5] = &v26;
  dispatch_sync(queue, block);
  v15 = (id)v27[5];
  -[W5DiagnosticsTestRequestInternal setUuid:](v13, "setUuid:", v27[5]);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v13, "setTestRequests:", a3);
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v13, "setIncludeEvents:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("IncludeEvents")), "BOOLValue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100070EF8;
  v24[3] = &unk_1000D7060;
  v24[6] = &v36;
  v24[7] = &v32;
  v24[8] = &v40;
  v24[9] = &v46;
  v24[4] = v11;
  v24[5] = v12;
  -[W5DiagnosticsTestRequestInternal setReply:](v13, "setReply:", v24);
  -[W5DiagnosticsManager addRequest:](self->_diagnostics, "addRequest:", v13);
  if (a5)
  {
    v16 = dispatch_time(0, (uint64_t)((double)a5 / 1000.0 * 1000000000.0));
    if (dispatch_semaphore_wait(v12, v16))
    {
      objc_msgSend(v11, "lock");
      if (!*((_BYTE *)v33 + 24))
      {
        *((_BYTE *)v37 + 24) = 1;
        v54 = NSLocalizedFailureReasonErrorKey;
        v55 = CFSTR("W5TimeoutErr");
        v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
        v41[5] = (uint64_t)v17;
      }
      objc_msgSend(v11, "unlock");
    }
  }
  else
  {
    v18 = dispatch_time(0, 600000000000);
    if (dispatch_semaphore_wait(v12, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v53 = 0x4082C00000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
  }
  v19 = (id)v41[5];
  v20 = (id)v47[5];
  if (a6)
  {
    v21 = (void *)v41[5];
    if (v21)
      *a6 = objc_msgSend(v21, "copy");
  }
  v22 = objc_msgSend((id)v47[5], "copy");
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  return v22;
}

+ (id)__descriptionForNetwork:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  unsigned int v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  if (!a3)
    return 0;
  v4 = +[NSMutableString string](NSMutableString, "string");
  v5 = objc_msgSend(a3, "ssidString");
  if (v5)
    objc_msgSend(v4, "appendFormat:", CFSTR("'%@' %@, "), v5, objc_msgSend(a3, "ssid"));
  else
    objc_msgSend(v4, "appendFormat:", CFSTR("<HIDDEN>, "), v15, v16);
  objc_msgSend(v4, "appendFormat:", CFSTR("bssid=%@, "), objc_msgSend(a3, "bssid"));
  objc_msgSend(v4, "appendFormat:", CFSTR("channel=[%@], "), W5DescriptionForChannel(objc_msgSend(a3, "channel")));
  objc_msgSend(v4, "appendFormat:", CFSTR("cc=%@, "), objc_msgSend(a3, "countryCode"));
  objc_msgSend(v4, "appendFormat:", CFSTR("type=%@, "), W5DescriptionForPHYMode(objc_msgSend(a3, "fastestSupportedPHYMode")));
  objc_msgSend(v4, "appendFormat:", CFSTR("rssi=%li, "), objc_msgSend(a3, "rssi"));
  objc_msgSend(v4, "appendFormat:", CFSTR("rsn=%@, "), sub_10001CC0C(a3));
  objc_msgSend(v4, "appendFormat:", CFSTR("wpa=%@, "), sub_10001C87C(a3));
  if (objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000E39C0))
    v6 = "yes";
  else
    v6 = "no";
  objc_msgSend(v4, "appendFormat:", CFSTR("wep=%s, "), v6);
  if ((objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000E3828) & 1) != 0)
  {
    v7 = "cert";
  }
  else
  {
    v8 = objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000E39D8);
    v7 = "psk";
    if (!v8)
      v7 = "no";
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("wapi=%s, "), v7);
  if (objc_msgSend(a3, "isIBSS"))
    v9 = "yes";
  else
    v9 = "no";
  objc_msgSend(v4, "appendFormat:", CFSTR("ibss=%s, "), v9);
  if (objc_msgSend(a3, "isPersonalHotspot"))
    v10 = "yes";
  else
    v10 = "no";
  objc_msgSend(v4, "appendFormat:", CFSTR("ph=%s, "), v10);
  if (objc_msgSend(a3, "isAppleSWAP"))
    v11 = "yes";
  else
    v11 = "no";
  objc_msgSend(v4, "appendFormat:", CFSTR("swap=%s, "), v11);
  if (objc_msgSend(a3, "isPasspoint"))
    v12 = "yes";
  else
    v12 = "no";
  objc_msgSend(v4, "appendFormat:", CFSTR("hs20=%s, "), v12);
  v13 = objc_msgSend(a3, "airPortBaseStationModelName");
  if (v13)
    objc_msgSend(v4, "appendFormat:", CFSTR("airport=[%@]"), v13);
  return v4;
}

+ (id)__logScanResults:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  id v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[2];

  v4 = +[NSMutableString string](NSMutableString, "string");
  v33[0] = +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("networkName"), 1, "caseInsensitiveCompare:");
  v33[1] = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("BSSID"), 1);
  v20 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = objc_msgSend(a3, "sortedArrayUsingDescriptors:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v24 = 0;
    v25 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v27 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v27)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v14 = v4;
        objc_msgSend(v4, "appendFormat:", CFSTR("%@\n\n"), v13);
        v15 = objc_msgSend(objc_msgSend(v13, "channel"), "is6GHz");
        v16 = objc_msgSend(v13, "channel");
        if (v15)
        {
          if (objc_msgSend(v16, "is6GHzPSC"))
            ++v25;
          else
            ++v23;
        }
        else
        {
          v17 = objc_msgSend(v16, "is5GHz");
          v18 = objc_msgSend(v13, "channel");
          if (v17)
          {
            if (objc_msgSend(v18, "isDFS"))
              ++v21;
            else
              ++v22;
          }
          else
          {
            v24 += objc_msgSend(v18, "is2GHz");
          }
        }
        v4 = v14;
        v7 += objc_msgSend(v13, "isIBSS");
        if (!objc_msgSend(v13, "SSID"))
          ++v9;
        if (objc_msgSend(v13, "airPortBaseStationModel"))
          ++v8;
        v10 += objc_msgSend(v13, "isPasspoint");
        v11 += objc_msgSend(v13, "isPersonalHotspot");
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  objc_msgSend(v4, "insertString:atIndex:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("total=%lu, 6GHz(PSC)=%ld, 6GHz(NonPSC)=%ld, 5GHz(Active)=%ld, 5GHz(DFS)=%ld, 2GHz=%ld, ibss=%ld, hidden=%ld, passpoint=%ld, ph=%ld, airport=%ld\n\n\n"), objc_msgSend(v20, "count"), v25, v23, v22, v21, v24, v7, v9, v10, v11, v8), 0);
  return v4;
}

- (id)__logDiagnosticsPingResults:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSDateFormatter *dateFormatter;
  NSString *v19;
  NSDateFormatter *v20;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v5 = +[NSMutableString string](NSMutableString, "string");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "testID");
        v9 = objc_msgSend(v7, "info");
        v25 = v6;
        if (v8 == (id)53)
        {
          objc_msgSend(v5, "appendString:", -[W5LogManager __logDiagnosticsPingResults:](self, "__logDiagnosticsPingResults:", objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ConcurrentResults"))));
        }
        else
        {
          v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PingResult"));
          v11 = objc_msgSend(objc_msgSend(v7, "info"), "objectForKeyedSubscript:", CFSTR("PingResults"));
          v12 = +[NSMutableArray array](NSMutableArray, "array");
          if (objc_msgSend(v11, "count"))
            objc_msgSend(v12, "addObjectsFromArray:", v11);
          if (v10)
            objc_msgSend(v12, "addObject:", v10);
          if (objc_msgSend(v12, "count"))
          {
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v27;
              do
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v27 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v5, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
                  dateFormatter = self->_dateFormatter;
                  objc_msgSend(v17, "startedAt");
                  v19 = -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
                  v20 = self->_dateFormatter;
                  objc_msgSend(v17, "endedAt");
                  objc_msgSend(v5, "appendFormat:", CFSTR("[%@ - %@]\n"), v19, -[NSDateFormatter stringFromDate:](v20, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:")));
                  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), objc_msgSend(v17, "command"));
                  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), objc_msgSend(v17, "output"));
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v14);
            }
          }
        }
        v6 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }
  return v5;
}

- (id)__logDiagnosticsTestResults:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v4 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v4, "appendString:", W5FormattedHeaderForDiagnosticsTestResults());
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "testID") == (id)53)
        {
          v10 = objc_msgSend(objc_msgSend(v9, "info"), "objectForKeyedSubscript:", CFSTR("ConcurrentResults"));
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v4, "appendString:", W5FormattedDescriptionForDiagnosticsTestResult(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j)));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v12);
          }
        }
        else
        {
          objc_msgSend(v4, "appendString:", W5FormattedDescriptionForDiagnosticsTestResult(v9));
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  return v4;
}

+ (id)__logBTCProfile:(apple80211_btc_profile_osx *)a3
{
  NSMutableString *v4;
  unint64_t v5;
  const char *v6;
  unsigned int var5;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int var12;
  unint64_t v12;
  unsigned int v13;

  v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Mode                        : %@\n"), W5DescriptionForBTCMode(a3->var0));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Desense                     : %@\n"), W5DescriptionForDesenseFlags(a3->var1));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Desense Level               : %i\n"), a3->var2);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Desense Thresh              : [%i,%i]\n"), a3->var4, a3->var3);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Chain Ack                   : ["));
  if (a3->var5)
  {
    v5 = 0;
    do
    {
      if (a3->var6[v5] == 1)
        v6 = "On";
      else
        v6 = "Off";
      -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("%s"), v6);
      var5 = a3->var5;
      if (v5 < var5 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", CFSTR(","));
        var5 = a3->var5;
      }
      ++v5;
    }
    while (v5 < var5);
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("]\n"));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Chain Tx Power Offset       : ["));
  if (a3->var5)
  {
    v8 = 0;
    do
    {
      -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("%i"), a3->var7[v8]);
      v9 = a3->var5;
      if (v8 < v9 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", CFSTR(","));
        v9 = a3->var5;
      }
      ++v8;
    }
    while (v8 < v9);
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("]\n"));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      WiFi RSSI Thresh / Hyst     : %i/%i\n"), a3->var8, a3->var9);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      BT RSSI Thresh / Hyst       : %i/%i\n"), a3->var10, a3->var11);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      SISO Resp Enable            : ["));
  if (a3->var12)
  {
    v10 = 0;
    do
    {
      -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("%i"), a3->var13[v10]);
      var12 = a3->var12;
      if (v10 < var12 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", CFSTR(","));
        var12 = a3->var12;
      }
      ++v10;
    }
    while (v10 < var12);
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("]\n"));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Max SISO Resp Power         : ["));
  if (a3->var12)
  {
    v12 = 0;
    do
    {
      -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("%i"), a3->var14[v12]);
      v13 = a3->var12;
      if (v12 < v13 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", CFSTR(","));
        v13 = a3->var12;
      }
      ++v12;
    }
    while (v12 < v13);
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("]\n"));
  return -[NSMutableString copy](v4, "copy");
}

+ (id)__logTxPower:(apple80211_per_chain_power_data_get *)a3
{
  NSMutableString *v4;

  v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Current            : %i\n"), a3->var2);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Offset             : %i\n"), a3->var1);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Min                : %i\n"), a3->var3);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("      Max                : %i\n"), a3->var4);
  return -[NSMutableString copy](v4, "copy");
}

+ (id)__logNetworkStatus:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  id v15;
  unint64_t v16;
  const char *v17;
  id v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = +[NSMutableString string](NSMutableString, "string");
  if (objc_msgSend(a3, "primaryIPv4InterfaceName"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv4         : %s (%s / %s)\n"), objc_msgSend(objc_msgSend(a3, "primaryIPv4InterfaceName"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "primaryIPv4ServiceName"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "primaryIPv4ServiceID"), "UTF8String"));
    v5 = objc_msgSend(a3, "primaryIPv4Addresses");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "UTF8String"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv4         : None\n"));
  }
  if (objc_msgSend(a3, "primaryIPv6InterfaceName"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv6         : %s (%s / %s)\n"), objc_msgSend(objc_msgSend(a3, "primaryIPv6InterfaceName"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "primaryIPv6ServiceName"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "primaryIPv6ServiceID"), "UTF8String"));
    v10 = objc_msgSend(a3, "primaryIPv6Addresses");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v4, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "UTF8String"));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v12);
    }
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv6         : None\n"));
  }
  v15 = objc_msgSend(a3, "primaryDNSAddresses");
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    DNS Addresses        : %s\n"), objc_msgSend(objc_msgSend(v15, "firstObject"), "UTF8String"));
    if ((unint64_t)objc_msgSend(v15, "count") >= 2 && (unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      v16 = 1;
      do
        objc_msgSend(v4, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend(objc_msgSend(v15, "objectAtIndexedSubscript:", v16++), "UTF8String"));
      while (v16 < (unint64_t)objc_msgSend(v15, "count"));
    }
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    DNS Addresses        : None\n"));
  }
  v17 = "Not Reachable";
  if ((objc_msgSend(a3, "isAppleReachable") & 2) != 0
    && (objc_msgSend(a3, "isAppleReachable") & 4) == 0)
  {
    v17 = "Reachable";
  }
  v18 = objc_msgSend(a3, "isAppleReachable");
  v19 = " (WWAN)";
  if ((v18 & 0x40000) == 0)
    v19 = "";
  objc_msgSend(v4, "appendFormat:", CFSTR("    Apple                : %s%s\n"), v17, v19);
  return v4;
}

+ (id)__logWiFiStatus:(id)a3
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  const char *v13;
  const char *v14;
  unint64_t v15;
  const char *v16;
  const char *v17;
  unint64_t v18;
  const char *v19;
  const char *v20;
  unint64_t v21;
  id v22;
  const __CFString *v23;
  id v24;
  id v25;
  const __CFString *v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  const char *v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unint64_t v41;
  uint64_t v42;
  const char *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  const char *v51;
  unsigned int v52;
  const char *v53;
  uint64_t v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[28];

  v5 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v5, "appendFormat:", CFSTR("    MAC Address          : %s (hw=%s)\n"), objc_msgSend(objc_msgSend(a3, "macAddress"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "hardwareMACAddress"), "UTF8String"));
  objc_msgSend(v5, "appendFormat:", CFSTR("    Interface Name       : %s\n"), objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String"));
  if (objc_msgSend(a3, "powerOn"))
    v6 = "On";
  else
    v6 = "Off";
  if (objc_msgSend(objc_msgSend(a3, "power"), "length") == (id)24)
    v7 = objc_msgSend(objc_msgSend(a3, "power"), "bytes");
  else
    v7 = 0;
  objc_msgSend(v5, "appendFormat:", CFSTR("    Power                : %s [%@]\n"), v6, W5DescriptionForPower(v7));
  objc_msgSend(v5, "appendFormat:", CFSTR("    Op Mode              : %s\n"), objc_msgSend((id)W5DescriptionForOpMode(objc_msgSend(a3, "opMode")), "UTF8String"));
  if (objc_msgSend(objc_msgSend(a3, "ssidString"), "UTF8String"))
    v8 = (const char *)objc_msgSend(objc_msgSend(a3, "ssidString"), "UTF8String");
  else
    v8 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    SSID                 : %s\n"), v8);
  if (objc_msgSend(objc_msgSend(a3, "bssid"), "UTF8String"))
    v9 = (const char *)objc_msgSend(objc_msgSend(a3, "bssid"), "UTF8String");
  else
    v9 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    BSSID                : %s\n"), v9);
  objc_msgSend(v5, "appendFormat:", CFSTR("    RSSI                 : %i dBm\n"), objc_msgSend(a3, "rssi"));
  objc_msgSend(v5, "appendFormat:", CFSTR("    Noise                : %i dBm\n"), objc_msgSend(a3, "noise"));
  objc_msgSend(a3, "txRate");
  objc_msgSend(v5, "appendFormat:", CFSTR("    Tx Rate              : %.1f Mbps\n"), v10);
  if (objc_msgSend(a3, "ssid"))
    objc_msgSend(v5, "appendFormat:", CFSTR("    Security             : %s\n"), objc_msgSend((id)W5DescriptionForSecurity(objc_msgSend(a3, "security")), "UTF8String"));
  else
    objc_msgSend(v5, "appendFormat:", CFSTR("    Security             : None\n"), v55);
  if (objc_msgSend(a3, "security") == (id)12
    || objc_msgSend(a3, "security") == (id)11
    || objc_msgSend(a3, "security") == (id)9
    || objc_msgSend(a3, "security") == (id)10
    || objc_msgSend(a3, "security") == (id)8)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("    802.1X Mode          : %s\n"), objc_msgSend((id)W5DescriptionForEAPOLControlMode(objc_msgSend(a3, "eapolControlMode")), "UTF8String"));
    objc_msgSend(v5, "appendFormat:", CFSTR("    802.1X Supplicant    : %s\n"), objc_msgSend((id)W5DescriptionForEAPOLSupplicantState(objc_msgSend(a3, "eapolSupplicantState")), "UTF8String"));
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("    PHY Mode             : %s\n"), objc_msgSend((id)W5DescriptionForPHYMode(objc_msgSend(a3, "phyMode")), "UTF8String"));
  objc_msgSend(v5, "appendFormat:", CFSTR("    MCS Index            : %i\n"), objc_msgSend(a3, "mcsIndex"));
  v11 = objc_msgSend(a3, "ssid");
  if (v11)
    v11 = objc_msgSend(a3, "guardInterval");
  objc_msgSend(v5, "appendFormat:", CFSTR("    Guard Interval       : %i\n"), v11);
  objc_msgSend(v5, "appendFormat:", CFSTR("    NSS                  : %i\n"), objc_msgSend(a3, "numberOfSpacialStreams"));
  if (objc_msgSend((id)W5DescriptionForChannel(objc_msgSend(a3, "channel")), "UTF8String"))
    v12 = (const char *)objc_msgSend((id)W5DescriptionForChannel(objc_msgSend(a3, "channel")), "UTF8String");
  else
    v12 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    Channel              : %s\n"), v12);
  objc_msgSend(v5, "appendFormat:", CFSTR("    Country Code         : %s\n"), objc_msgSend(objc_msgSend(a3, "countryCode"), "UTF8String"));
  if (objc_msgSend(objc_msgSend(a3, "networkServiceID"), "UTF8String"))
    v13 = (const char *)objc_msgSend(objc_msgSend(a3, "networkServiceID"), "UTF8String");
  else
    v13 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    NetworkServiceID     : %s\n"), v13);
  objc_msgSend(v5, "appendFormat:", CFSTR("    IPv4 Config Method   : %s\n"), objc_msgSend((id)W5DescriptionForIPv4ConfigMethod(objc_msgSend(a3, "ipv4ConfigMethod")), "UTF8String"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "firstObject"), "UTF8String"))
    v14 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "firstObject"), "UTF8String");
  else
    v14 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    IPv4 Address         : %s\n"), v14);
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "count") >= 2)
  {
    v15 = 1;
    do
      printf("                         : %s\n", (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "objectAtIndexedSubscript:", v15++), "UTF8String"));
    while (v15 < (unint64_t)objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "count"));
  }
  if (objc_msgSend(objc_msgSend(a3, "ipv4RouterAddress"), "UTF8String"))
    v16 = (const char *)objc_msgSend(objc_msgSend(a3, "ipv4RouterAddress"), "UTF8String");
  else
    v16 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    IPv4 Router          : %s\n"), v16);
  objc_msgSend(v5, "appendFormat:", CFSTR("    IPv6 Config Method   : %s\n"), objc_msgSend((id)W5DescriptionForIPv6ConfigMethod(objc_msgSend(a3, "ipv6ConfigMethod")), "UTF8String"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "firstObject"), "UTF8String"))
    v17 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "firstObject"), "UTF8String");
  else
    v17 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    IPv6 Address         : %s\n"), v17);
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "count") >= 2)
  {
    v18 = 1;
    do
      printf("                         : %s\n", (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "objectAtIndexedSubscript:", v18++), "UTF8String"));
    while (v18 < (unint64_t)objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "count"));
  }
  if (objc_msgSend(objc_msgSend(a3, "ipv6RouterAddress"), "UTF8String"))
    v19 = (const char *)objc_msgSend(objc_msgSend(a3, "ipv6RouterAddress"), "UTF8String");
  else
    v19 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    IPv6 Router          : %s\n"), v19);
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "firstObject"), "UTF8String"))
    v20 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "firstObject"), "UTF8String");
  else
    v20 = "None";
  objc_msgSend(v5, "appendFormat:", CFSTR("    DNS                  : %s\n"), v20);
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "count") >= 2)
  {
    v21 = 1;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "objectAtIndexedSubscript:", v21++), "UTF8String"));
    while (v21 < (unint64_t)objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "count"));
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("    BTC Mode             : %s\n"), objc_msgSend((id)W5DescriptionForBTCMode(objc_msgSend(a3, "btcMode")), "UTF8String"));
  if (objc_msgSend(a3, "desense"))
  {
    if (objc_msgSend(objc_msgSend(a3, "desense"), "length") == (id)16)
      v22 = objc_msgSend(objc_msgSend(a3, "desense"), "bytes");
    else
      v22 = 0;
    if (objc_msgSend(objc_msgSend(a3, "desenseLevel"), "length") == (id)8)
      v24 = objc_msgSend(objc_msgSend(a3, "desenseLevel"), "bytes");
    else
      v24 = 0;
    v56 = objc_msgSend((id)W5DescriptionForDesense(v22, v24), "UTF8String");
    v23 = CFSTR("    Desense              : %s\n");
  }
  else
  {
    v23 = CFSTR("    Desense              : Unavailable\n");
  }
  objc_msgSend(v5, "appendFormat:", v23, v56);
  if (objc_msgSend(a3, "chainAck"))
  {
    if (objc_msgSend(objc_msgSend(a3, "chainAck"), "length") == (id)24)
      v25 = objc_msgSend(objc_msgSend(a3, "chainAck"), "bytes");
    else
      v25 = 0;
    v57 = objc_msgSend((id)W5DescriptionForChainAck(v25), "UTF8String");
    v26 = CFSTR("    Chain Ack            : [%s]\n");
  }
  else
  {
    v26 = CFSTR("    Chain Ack            : Unavailable\n");
  }
  objc_msgSend(v5, "appendFormat:", v26, v57);
  if (objc_msgSend(a3, "txChainPower"))
  {
    objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1))
    {
      objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
      if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1))
      {
        v27 = 0;
        v28 = 8;
        do
        {
          objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
          objc_msgSend(v5, "appendFormat:", CFSTR("    Tx Power [%lu]         : %s\n"), v27, objc_msgSend((id)W5DescriptionForChainPowerState(*(unsigned int *)((char *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes")+ v28)), "UTF8String"));
          if (objc_msgSend(objc_msgSend(a3, "txChainPower"), "length") == (id)88)
            v29 = (char *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes");
          else
            v29 = 0;
          v30 = *(_OWORD *)&v29[v28];
          LODWORD(v59) = *(_DWORD *)&v29[v28 + 16];
          v58 = v30;
          objc_msgSend(v5, "appendFormat:", CFSTR("%s"), objc_msgSend(objc_msgSend(a1, "__logTxPower:", &v58), "UTF8String"));
          ++v27;
          objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
          v28 += 20;
        }
        while (v27 < *((int *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1));
      }
    }
  }
  if (objc_msgSend(a3, "btcProfiles2GHz"))
  {
    objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length");
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes") + 2))
    {
      v31 = 0;
      v32 = 12;
      do
      {
        objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
        if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 1))
        {
          objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
          if (v31 == *((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 2))
            v33 = "Active";
          else
            v33 = "Inactive";
        }
        else
        {
          v33 = "Inactive";
        }
        objc_msgSend(v5, "appendFormat:", CFSTR("    BTC Profile 2.4GHz [%lu]        : %s\n"), v31, v33);
        if (objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length") == (id)572)
          v34 = (char *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes");
        else
          v34 = 0;
        v58 = *(_OWORD *)&v34[v32];
        v35 = *(_OWORD *)&v34[v32 + 16];
        v36 = *(_OWORD *)&v34[v32 + 32];
        v37 = *(_OWORD *)&v34[v32 + 64];
        v61 = *(_OWORD *)&v34[v32 + 48];
        v62 = v37;
        v59 = v35;
        v60 = v36;
        v38 = *(_OWORD *)&v34[v32 + 80];
        v39 = *(_OWORD *)&v34[v32 + 96];
        v40 = *(_OWORD *)&v34[v32 + 112];
        *(_OWORD *)&v65[12] = *(_OWORD *)&v34[v32 + 124];
        v64 = v39;
        *(_OWORD *)v65 = v40;
        v63 = v38;
        objc_msgSend(v5, "appendFormat:", CFSTR("%s"), objc_msgSend(objc_msgSend(a1, "__logBTCProfile:", &v58), "UTF8String"));
        ++v31;
        objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length");
        v32 += 140;
      }
      while (v31 < *((unsigned int *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes") + 2));
    }
  }
  if (objc_msgSend(a3, "btcProfiles5GHz"))
  {
    objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length");
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes") + 2))
    {
      v41 = 0;
      v42 = 12;
      do
      {
        objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
        if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 3))
        {
          objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
          if (v41 == *((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 4))
            v43 = "Active";
          else
            v43 = "Inactive";
        }
        else
        {
          v43 = "Inactive";
        }
        objc_msgSend(v5, "appendFormat:", CFSTR("    BTC Profile 5GHz [%lu]          : %s\n"), v41, v43);
        if (objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length") == (id)572)
          v44 = (char *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes");
        else
          v44 = 0;
        v58 = *(_OWORD *)&v44[v42];
        v45 = *(_OWORD *)&v44[v42 + 16];
        v46 = *(_OWORD *)&v44[v42 + 32];
        v47 = *(_OWORD *)&v44[v42 + 64];
        v61 = *(_OWORD *)&v44[v42 + 48];
        v62 = v47;
        v59 = v45;
        v60 = v46;
        v48 = *(_OWORD *)&v44[v42 + 80];
        v49 = *(_OWORD *)&v44[v42 + 96];
        v50 = *(_OWORD *)&v44[v42 + 112];
        *(_OWORD *)&v65[12] = *(_OWORD *)&v44[v42 + 124];
        v64 = v49;
        *(_OWORD *)v65 = v50;
        v63 = v48;
        objc_msgSend(v5, "appendFormat:", CFSTR("%s"), objc_msgSend(objc_msgSend(a1, "__logBTCProfile:", &v58), "UTF8String"));
        ++v41;
        objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length");
        v42 += 140;
      }
      while (v41 < *((unsigned int *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes") + 2));
    }
  }
  if (objc_msgSend(a3, "smartCCADesenseSupported"))
    v51 = "Supported";
  else
    v51 = "Not Supported";
  objc_msgSend(v5, "appendFormat:", CFSTR("    SmartCCA/Desense     : %s (USB=%d)\n"), v51, objc_msgSend(a3, "smartCCADesenseUSBPresence"));
  v52 = objc_msgSend(objc_msgSend(a3, "capabilities"), "containsObject:", &off_1000E39F0);
  v53 = "No";
  if (v52)
    v53 = "Yes";
  objc_msgSend(v5, "appendFormat:", CFSTR("    Supports 6e          : %s\n"), v53);
  objc_msgSend(v5, "appendFormat:", CFSTR("    Supported Channels   : %s\n"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "supportedChannels"), "componentsJoinedByString:", CFSTR(",")), "UTF8String"));
  return v5;
}

+ (id)__logBluetoothStatus:(id)a3
{
  id v4;
  unsigned int v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  void *j;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  id v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  id v39;
  id v40;
  id v41;
  const char *v42;
  const char *v43;
  id v45;
  void *v46;
  id obj;
  id obja;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v4 = +[NSMutableString string](NSMutableString, "string");
  v5 = objc_msgSend(a3, "powerOn");
  v6 = "Off";
  if (v5)
    v6 = "On";
  objc_msgSend(v4, "appendFormat:", CFSTR("    Power                : %s\n"), v6);
  if (objc_msgSend(objc_msgSend(a3, "address"), "UTF8String"))
    v7 = (const char *)objc_msgSend(objc_msgSend(a3, "address"), "UTF8String");
  else
    v7 = "None";
  objc_msgSend(v4, "appendFormat:", CFSTR("    MAC Address          : %s\n"), v7);
  v8 = "No";
  v9 = "Yes";
  if (objc_msgSend(a3, "isDiscoverable"))
    v10 = "Yes";
  else
    v10 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("    Discoverable         : %s\n"), v10);
  if (objc_msgSend(a3, "isConnectable"))
    v11 = "Yes";
  else
    v11 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("    Connectable          : %s\n"), v11);
  if (objc_msgSend(a3, "isScanning"))
    v12 = "Yes";
  else
    v12 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("    Scanning             : %s\n"), v12);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v45 = a3;
  obj = objc_msgSend(a3, "devices");
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v15 += objc_msgSend(v20, "isPaired");
        v16 += objc_msgSend(v20, "isCloudPaired");
        v17 += objc_msgSend(v20, "isConnected");
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("    Devices              : %lu (paired=%lu cloud=%lu connected=%lu)\n\n"), objc_msgSend(objc_msgSend(v45, "devices"), "count"), v15, v16, v17);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obja = objc_msgSend(v45, "devices");
  v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v21)
  {
    v22 = v21;
    v23 = CFSTR("    %@\n");
    v24 = CFSTR("    Address          : %@\n");
    v25 = *(_QWORD *)v50;
    v26 = CFSTR("    Paired           : %s\n");
    v46 = v4;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(obja);
        v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v4, "appendFormat:", v23, objc_msgSend(v28, "name"));
        objc_msgSend(v4, "appendFormat:", v24, objc_msgSend(v28, "address"));
        if (objc_msgSend(v28, "isPaired"))
          v29 = v9;
        else
          v29 = v8;
        objc_msgSend(v4, "appendFormat:", v26, v29);
        if (objc_msgSend(v28, "isCloudPaired"))
          v30 = v9;
        else
          v30 = v8;
        objc_msgSend(v4, "appendFormat:", CFSTR("    CloudPaired      : %s\n"), v30);
        if (objc_msgSend(v28, "isConnected"))
          v31 = v9;
        else
          v31 = v8;
        objc_msgSend(v4, "appendFormat:", CFSTR("    Connected        : %s\n"), v31);
        if (objc_msgSend(v28, "isConnected"))
        {
          v32 = v22;
          v33 = v25;
          v34 = v9;
          v35 = v8;
          v36 = v26;
          v37 = v24;
          v38 = v23;
          v39 = objc_msgSend(v28, "majorClass");
          v40 = objc_msgSend(v28, "minorClass");
          v41 = v39;
          v23 = v38;
          v24 = v37;
          v26 = v36;
          v8 = v35;
          v9 = v34;
          v25 = v33;
          v22 = v32;
          v4 = v46;
          objc_msgSend(v46, "appendFormat:", CFSTR("    Type             : %@\n"), W5DescriptionForBluetoothDeviceType(v41, v40));
          if (objc_msgSend(v28, "isLowEnergy"))
            v42 = v9;
          else
            v42 = v8;
          objc_msgSend(v46, "appendFormat:", CFSTR("    LE               : %s\n"), v42);
          if (objc_msgSend(v28, "isAppleDevice"))
            v43 = v9;
          else
            v43 = v8;
          objc_msgSend(v46, "appendFormat:", CFSTR("    Apple            : %s\n"), v43);
        }
        objc_msgSend(v4, "appendString:", CFSTR("\n"));
      }
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v22);
  }
  return v4;
}

- (id)__logAWDLStatus:(id)a3
{
  id v5;
  CWFInterface *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  NSString *v10;
  id v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  const __CFString *v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  id v22;
  id v23;
  uint64_t i;
  id v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  unsigned int v74;
  unsigned int v75;
  _BYTE v76[384];
  unsigned int v77;
  unsigned int v78;
  _BYTE v79[384];
  unsigned int v80;
  unsigned int v81;
  _BYTE v82[384];
  unsigned int v83;
  unsigned int v84;
  _BYTE v85[1304];

  v5 = +[NSMutableString string](NSMutableString, "string");
  v6 = -[W5StatusManager corewifi](self->_status, "corewifi");
  objc_msgSend(v5, "appendFormat:", CFSTR("IPv6: %@\n\n"), objc_msgSend(objc_msgSend(-[CWFInterface AWDL](v6, "AWDL"), "IPv6Addresses"), "firstObject"));
  objc_msgSend(v5, "appendFormat:", CFSTR("AirDrop Discoverable Mode: %@\n\n"), W5DescriptionForAirDropDiscoverableMode(objc_msgSend(a3, "airDropDiscoverableMode")));
  DWORD2(v49) = 0;
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLSyncEnabled](v6, "AWDLSyncEnabled"), "getBytes:length:", &v49, 12);
  if (DWORD2(v49))
    v7 = "enabled";
  else
    v7 = "disabled";
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl is %s\n"), v7));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLOpMode](v6, "AWDLOpMode"), "getBytes:length:", &v49, 8);
  if (DWORD1(v49) <= 2)
    v8 = (&off_1000D70B0)[DWORD1(v49)];
  else
    v8 = "UNKNOWN";
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl mode = %s\n"), v8));
  *(_QWORD *)&v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLPeerTrafficRegistration](v6, "AWDLPeerTrafficRegistration"), "getBytes:length:", &v49, 184);
  if (DWORD2(v59))
  {
    v9 = " FAVOR INFRA HINT";
    if (!HIDWORD(v59))
      v9 = " NO HINT";
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("traffic registration found for peer (hint=%x%s) %02x:%02x:%02x:%02x:%02x:%02x \n"), HIDWORD(v59), v9, BYTE4(v49), BYTE5(v49), BYTE6(v49), BYTE7(v49), BYTE8(v49), BYTE9(v49));
  }
  else
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no peer traffic registration active\n"), v39, v40, v41, v42, v43, v44, v45, v46);
  }
  objc_msgSend(v5, "appendString:", v10);
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLMasterChannel](v6, "AWDLMasterChannel"), "getBytes:length:", &v49, 8);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl master channel = %u\n"), DWORD1(v49)));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLSecondaryMasterChannel](v6, "AWDLSecondaryMasterChannel"), "getBytes:length:", &v49, 8);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl secondary master channel = %u\n"), DWORD1(v49)));
  v11 = +[NSMutableString string](NSMutableString, "string");
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLSyncChannelSequence](v6, "AWDLSyncChannelSequence"), "getBytes:length:", &v49, 400);
  objc_msgSend(v11, "appendFormat:", CFSTR("awdl channel sequence: strategy %u, step count %u, encoding %u, length=%u, duplicate=%u, fill=%u\n"), HIDWORD(v73), BYTE7(v49), BYTE6(v49), BYTE5(v49), BYTE8(v49), BYTE9(v49));
  if (BYTE5(v49))
  {
    v12 = 0;
    v13 = (unsigned int *)&v50;
    while (1)
    {
      objc_msgSend(v11, "appendFormat:", CFSTR("%u"), *v13);
      if (*v13)
      {
        v14 = v13[1];
        v15 = CFSTR("++");
        if ((v14 & 0x400) != 0)
          goto LABEL_20;
        if ((v14 & 4) != 0)
          break;
      }
LABEL_21:
      objc_msgSend(v11, "appendString:", CFSTR(" "));
      ++v12;
      v13 += 3;
      if (v12 >= BYTE5(v49))
        goto LABEL_22;
    }
    if ((v14 & 0x200) != 0)
      v15 = CFSTR("+");
    else
      v15 = CFSTR("-");
LABEL_20:
    objc_msgSend(v11, "appendString:", v15);
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v11, "appendString:", CFSTR("\n"));
  objc_msgSend(v5, "appendString:", objc_msgSend(v11, "copy"));
  *(_QWORD *)&v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLElectionParameters](v6, "AWDLElectionParameters"), "getBytes:length:", &v49, 56);
  v16 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v16, "appendFormat:", CFSTR("awdl election params:\n"));
  objc_msgSend(v16, "appendFormat:", CFSTR("  electionID            %u\n"), WORD1(v50));
  objc_msgSend(v16, "appendFormat:", CFSTR("  self metric           0x%x\n"), v51);
  objc_msgSend(v16, "appendFormat:", CFSTR("  flags                 0x%x\n"), v50);
  objc_msgSend(v16, "appendFormat:", CFSTR("  top master metric     0x%x\n"), HIDWORD(v50));
  objc_msgSend(v16, "appendFormat:", CFSTR("  distance from top     %u\n"), BYTE4(v50));
  objc_msgSend(v16, "appendFormat:", CFSTR("  top master            %02X:%02X:%02X:%02X:%02X:%02X\n"), BYTE6(v50), BYTE7(v50), BYTE8(v50), BYTE9(v50), BYTE10(v50), BYTE11(v50));
  objc_msgSend(v5, "appendString:", objc_msgSend(v16, "copy"));
  DWORD2(v49) = 0;
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLElectionMetric](v6, "AWDLElectionMetric"), "getBytes:length:", &v49, 12);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl election metric = %u\n"), DWORD1(v49)));
  v17 = +[NSMutableString string](NSMutableString, "string");
  v49 = 0uLL;
  LODWORD(v50) = 0;
  objc_msgSend(-[CWFInterface AWDLElectionRSSIThresholds](v6, "AWDLElectionRSSIThresholds"), "getBytes:length:", &v49, 20);
  objc_msgSend(v17, "appendString:", CFSTR("awdl election rssi thresholds:\n"));
  objc_msgSend(v17, "appendFormat:", CFSTR("  close     %d\n"), DWORD2(v49));
  objc_msgSend(v17, "appendFormat:", CFSTR("  mid       %d\n"), DWORD1(v49));
  objc_msgSend(v17, "appendFormat:", CFSTR("  edge      %d\n"), v50);
  objc_msgSend(v17, "appendFormat:", CFSTR("  closeSync %d\n"), HIDWORD(v49));
  objc_msgSend(v5, "appendString:", objc_msgSend(v17, "copy"));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLSocialTimeSlots](v6, "AWDLSocialTimeSlots"), "getBytes:length:", &v49, 8);
  v18 = "enabled";
  if (!BYTE4(v49))
    v18 = "disabled";
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl social time slots: %s\n"), v18));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLEncryptionType](v6, "AWDLEncryptionType"), "getBytes:length:", &v49, 8);
  if (DWORD1(v49))
    v19 = "ENABLED";
  else
    v19 = "DISABLED";
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl encryption is %s\n"), v19));
  v49 = 0uLL;
  *(_QWORD *)&v50 = 0;
  objc_msgSend(-[CWFInterface AWDLStrategy](v6, "AWDLStrategy"), "getBytes:length:", &v49, 24);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl strategy: %u sched %@ [%llu.%03llu]\n"), DWORD1(v49), W5DescriptionForAWDLScheduleState(DWORD2(v49)), (unint64_t)v50 / 0x3B9ACA00, (unint64_t)v50 % 0x3B9ACA00 / 0xF4240));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLPresenceMode](v6, "AWDLPresenceMode"), "getBytes:length:", &v49, 8);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl presence mode = %u\n"), DWORD1(v49)));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLGuardTime](v6, "AWDLGuardTime"), "getBytes:length:", &v49, 8);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl guard time = %u\n"), DWORD1(v49)));
  v49 = 0uLL;
  objc_msgSend(-[CWFInterface AWDLAvailabilityWindowAPAlignment](v6, "AWDLAvailabilityWindowAPAlignment"), "getBytes:length:", &v49, 16);
  if (DWORD1(v49))
    v20 = "ENABLED";
  else
    v20 = "DISABLED";
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl availability window ap beacon alignment: %s offset %d (ms)\n"), v20, DWORD2(v49)));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLContinuousElectionAlgorithmEnabled](v6, "AWDLContinuousElectionAlgorithmEnabled"), "getBytes:length:", &v49, 8);
  if (DWORD1(v49))
    v21 = "ENABLED";
  else
    v21 = "DISABLED";
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl aw continous election %s\n"), v21));
  v22 = +[NSMutableString string](NSMutableString, "string");
  v49 = 0uLL;
  *(_QWORD *)&v50 = 0;
  objc_msgSend(-[CWFInterface AWDLSyncState](v6, "AWDLSyncState"), "getBytes:length:", &v49, 24);
  switch(DWORD1(v49))
  {
    case 1:
      objc_msgSend(v22, "appendFormat:", CFSTR("awdl state: master [%02X:%02X:%02X:%02X:%02X:%02X]\n"), BYTE8(v49), BYTE9(v49), BYTE10(v49), BYTE11(v49), BYTE12(v49), BYTE13(v49));
      break;
    case 2:
      objc_msgSend(v22, "appendFormat:", CFSTR("awdl state: slave [%02X:%02X:%02X:%02X:%02X:%02X]\n"), BYTE8(v49), BYTE9(v49), BYTE10(v49), BYTE11(v49), BYTE12(v49), BYTE13(v49));
      break;
    case 3:
      objc_msgSend(v22, "appendFormat:", CFSTR("awdl state: non-election master [%02X:%02X:%02X:%02X:%02X:%02X]\n"), BYTE8(v49), BYTE9(v49), BYTE10(v49), BYTE11(v49), BYTE12(v49), BYTE13(v49));
      break;
    default:
      objc_msgSend(v22, "appendString:", CFSTR("awdl state: stop\n"));
      break;
  }
  objc_msgSend(v5, "appendString:", objc_msgSend(v22, "copy"));
  *(_QWORD *)&v49 = 0;
  objc_msgSend(-[CWFInterface AWDLAFTxMode](v6, "AWDLAFTxMode"), "getBytes:length:", &v49, 8);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl af tx mode = %u\n"), DWORD1(v49)));
  v49 = 0uLL;
  LODWORD(v50) = 0;
  objc_msgSend(-[CWFInterface AWDLExtensionStateMachineParameters](v6, "AWDLExtensionStateMachineParameters"), "getBytes:length:", &v49, 20);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl ext params: min=%u, maxUni=%u, maxMulti=%u, maxAction=%u\n"), v50, DWORD2(v49), DWORD1(v49), HIDWORD(v49)));
  v49 = 0uLL;
  *(_QWORD *)&v50 = 0;
  objc_msgSend(-[CWFInterface AWDLSyncParameters](v6, "AWDLSyncParameters"), "getBytes:length:", &v49, 24);
  objc_msgSend(v5, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl sync params: aw_period=%d, aw_length=%d, extension_length=%d, sync_frame_period=%d, as non election master %d\n"), DWORD2(v49), DWORD1(v49), HIDWORD(v49), v50, DWORD1(v50)));
  v23 = +[NSMutableString string](NSMutableString, "string");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLSidecarDiagnostics](v6, "AWDLSidecarDiagnostics"), "getBytes:length:", &v49, 80);
  objc_msgSend(v23, "appendFormat:", CFSTR("awdl sidecar diags: txLatencySumMS=%d, txFailCount=%d, txPacketCount=%d, txMaxPacketBurstSizeKB=%d, peerRssi24G=%d, peerRssi5G=%d\n"), DWORD1(v49), DWORD2(v49), HIDWORD(v49), v50, DWORD1(v50), DWORD2(v50));
  for (i = 0; i != 36; i += 12)
    objc_msgSend(v23, "appendFormat:", CFSTR("                    ch=%d, cca=%d\n"), *((unsigned __int8 *)&v52 + i + 4), *(unsigned int *)((char *)&v52 + i));
  objc_msgSend(v5, "appendString:", objc_msgSend(v23, "copy"));
  objc_msgSend(v5, "appendString:", CFSTR("\n\n"));
  v25 = +[NSMutableString string](NSMutableString, "string");
  v48 = 0;
  v47 = 0;
  objc_msgSend(-[CWFInterface AWDLSyncEnabled](v6, "AWDLSyncEnabled"), "getBytes:length:", &v47, 12);
  objc_msgSend(v25, "appendString:", CFSTR("----------------------------------------------------------------------\n"));
  objc_msgSend(v25, "appendString:", CFSTR("AWDL Statistics\n"));
  objc_msgSend(v25, "appendString:", CFSTR("----------------------------------------------------------------------\n"));
  if (v48)
  {
    bzero(&v49, 0xE80uLL);
    objc_msgSend(-[CWFInterface AWDLStatistics](v6, "AWDLStatistics"), "getBytes:length:", &v49, 3712);
    objc_msgSend(v25, "appendFormat:", CFSTR("Rx Bytes              = %d\n"), DWORD2(v49));
    objc_msgSend(v25, "appendFormat:", CFSTR("Tx Bytes              = %d\n"), HIDWORD(v49));
    objc_msgSend(v25, "appendFormat:", CFSTR("Self Infra Channel    = %d\n"), DWORD1(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("Peer Infra Channel    = %d\n"), BYTE8(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("# of Peers Discovered = %d\n"), BYTE9(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("# of Cached Peers     = %d\n"), BYTE10(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("Flags                 = %x\n"), DWORD1(v49));
    if ((BYTE4(v49) & 1) != 0)
      v26 = "XZ";
    else
      v26 = "non-XZ";
    objc_msgSend(v25, "appendFormat:", CFSTR("Country Code          = %s\n"), v26);
    if ((BYTE4(v49) & 0x10) != 0)
      v27 = "Yes";
    else
      v27 = "No";
    objc_msgSend(v25, "appendFormat:", CFSTR("Is AppleTV            = %s\n"), v27);
    if ((BYTE4(v49) & 8) != 0)
      v28 = "Yes";
    else
      v28 = "No";
    objc_msgSend(v25, "appendFormat:", CFSTR("Supports Solo         = %s\n"), v28);
    if ((BYTE4(v49) & 0x20) != 0)
      v29 = "Yes";
    else
      v29 = "No";
    objc_msgSend(v25, "appendFormat:", CFSTR("Was Airplaying        = %s\n"), v29);
    if ((BYTE4(v49) & 0x40) != 0)
      v30 = "Yes";
    else
      v30 = "No";
    objc_msgSend(v25, "appendFormat:", CFSTR("Was Infra-Airplaying  = %s\n"), v30);
    objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendFormat:", CFSTR("Cached Peer's Infra on: \n"));
    objc_msgSend(v25, "appendFormat:", CFSTR("                 2.4G = %d\n"), BYTE11(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("                   5G = %d\n"), BYTE12(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("                  DFS = %d\n"), BYTE13(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("       Not-Associated = %d\n"), BYTE14(v50));
    objc_msgSend(v25, "appendFormat:", CFSTR("           Same Infra = %d\n"), v51);
    objc_msgSend(v25, "appendFormat:", CFSTR("      Different Infra = %d\n"), HIBYTE(v50));
    objc_msgSend(v25, "appendString:", CFSTR("AWDL State History:\n"));
    objc_msgSend(v25, "appendString:", CFSTR("                           State           Count      Duration(msecs)\n"));
    v31 = 0;
    v32 = &v72;
    do
    {
      objc_msgSend(v25, "appendFormat:", CFSTR("%32s %15d %20llu\n"), objc_msgSend((id)W5DescriptionForAWDLScheduleState(v31++), "UTF8String"), *((unsigned int *)v32 - 2), *(_QWORD *)v32);
      ++v32;
    }
    while (v31 != 54);
    objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendFormat:", CFSTR("No-Service Idle Time  = %llu\n"), *((_QWORD *)&v51 + 1));
    objc_msgSend(v25, "appendFormat:", CFSTR("Services Browsed      = +%d -%d (+%d, -%d)\n"), v78, v84, v77, v83);
    objc_msgSend(v25, "appendFormat:", CFSTR("Services Advertised   = +%d -%d (+%d, -%d)\n"), v75, v81, v74, v80);
    objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendString:", CFSTR("Add Service History:\n"));
    objc_msgSend(v25, "appendString:", CFSTR("      #            Browse                                     |         Advertise\n"));
    objc_msgSend(v25, "appendString:", CFSTR("             Id              Key                              |   Id              Key\n"));
    v33 = 0;
    v34 = 1;
    do
    {
      objc_msgSend(v25, "appendFormat:", CFSTR("      %d -   %3d, "), v34, *(unsigned int *)&v79[v33 + 32]);
      objc_msgSend(v25, "appendString:", sub_1000775DC((uint64_t)&v79[v33]));
      objc_msgSend(v25, "appendFormat:", CFSTR("                %3d, "), *(unsigned int *)&v76[v33 + 32]);
      objc_msgSend(v25, "appendString:", sub_1000775DC((uint64_t)&v76[v33]));
      objc_msgSend(v25, "appendString:", CFSTR("\n"));
      v33 += 48;
      v34 = (v34 + 1);
    }
    while (v33 != 384);
    objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendString:", CFSTR("Delete Service History:\n"));
    objc_msgSend(v25, "appendString:", CFSTR("      #                     Browse                            |               Advertise\n"));
    objc_msgSend(v25, "appendString:", CFSTR("             Id         Age             Key                   |   Id         Age              Key\n"));
    v35 = 0;
    v36 = 1;
    do
    {
      objc_msgSend(v25, "appendFormat:", CFSTR("     %d -    %3d, %10llu, "), v36, *(unsigned int *)&v85[v35 + 32], *(_QWORD *)&v85[v35 + 40]);
      objc_msgSend(v25, "appendString:", sub_1000775DC((uint64_t)&v85[v35]));
      objc_msgSend(v25, "appendFormat:", CFSTR("    %3d, %10llu, "), *(unsigned int *)&v82[v35 + 32], *(_QWORD *)&v82[v35 + 40]);
      objc_msgSend(v25, "appendString:", sub_1000775DC((uint64_t)&v82[v35]));
      objc_msgSend(v25, "appendString:", CFSTR("\n"));
      v35 += 48;
      v36 = (v36 + 1);
    }
    while (v35 != 384);
    v37 = CFSTR("\n");
  }
  else
  {
    v37 = CFSTR("AWDL is DISABLED\n");
  }
  objc_msgSend(v25, "appendString:", v37);
  objc_msgSend(v5, "appendString:", objc_msgSend(v25, "copy"));
  return objc_msgSend(v5, "copy");
}

- (id)__pingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10
{
  id v10;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  NSArray *v24;
  double v25;
  double v26;
  NSMutableData *v27;
  id v28;
  void (**pingCallback)(id, id);
  const __CFString *v32;
  id v33;
  _QWORD v34[13];
  _QWORD v35[15];

  v10 = 0;
  if (a3 && a4 <= 2147483646 && a5 < 2147483650.0 && a9 != 0)
  {
    if (a8 && (v20 = W5DescriptionForPingTrafficClass(objc_msgSend(a8, "integerValue"))) != 0)
    {
      v21 = v20;
      v35[0] = CFSTR("-c");
      v35[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4);
      v35[2] = CFSTR("-b");
      v35[3] = a9;
      v35[4] = CFSTR("-k");
      v35[5] = v21;
      v35[6] = CFSTR("-i");
      v35[7] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&a7);
      v35[8] = CFSTR("-t");
      v35[9] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a5);
      v35[10] = CFSTR("-W");
      v35[11] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)(a6 * 1000.0));
      v35[12] = CFSTR("-s");
      v35[13] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a10 + 56);
      v35[14] = a3;
      v22 = v35;
      v23 = 15;
    }
    else
    {
      v34[0] = CFSTR("-c");
      v34[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4);
      v34[2] = CFSTR("-b");
      v34[3] = a9;
      v34[4] = CFSTR("-i");
      v34[5] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&a7);
      v34[6] = CFSTR("-t");
      v34[7] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a5);
      v34[8] = CFSTR("-W");
      v34[9] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)(a6 * 1000.0));
      v34[10] = CFSTR("-s");
      v34[11] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a10 + 56);
      v34[12] = a3;
      v22 = v34;
      v23 = 13;
    }
    v24 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, v23);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v26 = v25;
    v27 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/sbin/ping"), v24, v27, 0);
    v10 = objc_alloc_init((Class)W5PingResult);
    objc_msgSend(v10, "setInterfaceName:", a9);
    objc_msgSend(v10, "setAddress:", a3);
    objc_msgSend(v10, "setCount:", a4);
    objc_msgSend(v10, "setTimeout:", a5);
    objc_msgSend(v10, "setWait:", a6);
    objc_msgSend(v10, "setInterval:", a7);
    objc_msgSend(v10, "setTrafficClass:", objc_msgSend(a8, "integerValue"));
    objc_msgSend(v10, "setDataLength:", a10);
    objc_msgSend(v10, "setStartedAt:", v26);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "setEndedAt:");
    objc_msgSend(v10, "setCommand:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/sbin/ping %@"), -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:", CFSTR(" "))));
    objc_msgSend(v10, "setOutput:", objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v27, 4));
    +[W5LogManager __parsePingOutput:result:](W5LogManager, "__parsePingOutput:result:", v27, v10);
    if (v10)
    {
      v28 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v28, "setEventID:", 34);
      objc_msgSend(v10, "endedAt");
      objc_msgSend(v28, "setTimestamp:");
      v32 = CFSTR("PingResult");
      v33 = v10;
      objc_msgSend(v28, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback)
        pingCallback[2](pingCallback, v28);
    }
  }
  return v10;
}

- (id)__ping6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8
{
  id v8;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  NSArray *v19;
  double v20;
  double v21;
  NSMutableData *v22;
  id v23;
  void (**pingCallback)(id, id);
  const __CFString *v27;
  id v28;
  _QWORD v29[11];
  _QWORD v30[13];

  v8 = 0;
  if (a3 && a4 <= 2147483646 && a7)
  {
    if (a6 && (v15 = W5DescriptionForPingTrafficClass(objc_msgSend(a6, "integerValue"))) != 0)
    {
      v16 = v15;
      v30[0] = CFSTR("-c");
      v30[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4);
      v30[2] = CFSTR("-B");
      v30[3] = a7;
      v30[4] = CFSTR("-I");
      v30[5] = a7;
      v30[6] = CFSTR("-k");
      v30[7] = v16;
      v30[8] = CFSTR("-i");
      v30[9] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a5);
      v30[10] = CFSTR("-s");
      v30[11] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a8 + 56);
      v30[12] = a3;
      v17 = v30;
      v18 = 13;
    }
    else
    {
      v29[0] = CFSTR("-c");
      v29[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4);
      v29[2] = CFSTR("-B");
      v29[3] = a7;
      v29[4] = CFSTR("-I");
      v29[5] = a7;
      v29[6] = CFSTR("-i");
      v29[7] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a5);
      v29[8] = CFSTR("-s");
      v29[9] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a8 + 56);
      v29[10] = a3;
      v17 = v29;
      v18 = 11;
    }
    v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, v18);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v21 = v20;
    v22 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/sbin/ping6"), v19, v22, 0);
    v8 = objc_alloc_init((Class)W5PingResult);
    objc_msgSend(v8, "setInterfaceName:", a7);
    objc_msgSend(v8, "setAddress:", a3);
    objc_msgSend(v8, "setCount:", a4);
    objc_msgSend(v8, "setWait:", a5);
    objc_msgSend(v8, "setTrafficClass:", objc_msgSend(a6, "integerValue"));
    objc_msgSend(v8, "setDataLength:", a8);
    objc_msgSend(v8, "setStartedAt:", v21);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setEndedAt:");
    objc_msgSend(v8, "setCommand:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/sbin/ping6 %@"), -[NSArray componentsJoinedByString:](v19, "componentsJoinedByString:", CFSTR(" "))));
    objc_msgSend(v8, "setOutput:", objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v22, 4));
    +[W5LogManager __parsePingOutput:result:](W5LogManager, "__parsePingOutput:result:", v22, v8);
    if (v8)
    {
      v23 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v23, "setEventID:", 34);
      objc_msgSend(v8, "endedAt");
      objc_msgSend(v23, "setTimestamp:");
      v27 = CFSTR("PingResult");
      v28 = v8;
      objc_msgSend(v23, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback)
        pingCallback[2](pingCallback, v23);
    }
  }
  return v8;
}

- (id)__pingUsingCFNetworkWithAddress:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 trafficClass:(id)a6 networkServiceType:(id)a7
{
  id v7;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  NSNumber *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  double v39;
  double v40;
  id v41;
  id v42;
  void (**pingCallback)(id, id);
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CFTypeRef cf;
  const __CFString *v55;
  id v56;
  _BYTE v57[128];
  _QWORD v58[2];
  _QWORD v59[2];

  v7 = 0;
  if (a3 && a4 <= 2147483646 && a5 <= 2147483646)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v13 = v12;
    v14 = +[NSMutableArray array](NSMutableArray, "array");
    v15 = 0.0;
    v16 = 0.0;
    v46 = a4;
    if (a4 >= 1)
    {
      v17 = kCFNetDiagnosticPingOptionTimeout;
      v18 = kCFNetDiagnosticPingOptionPacketCount;
      v48 = kCFNetDiagnosticPingOptionTrafficClass;
      v47 = kCFNetDiagnosticPingOptionTypeOfService;
      v19 = v46;
      do
      {
        v58[0] = v17;
        v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5);
        v58[1] = v18;
        v59[0] = v20;
        v59[1] = &off_1000E33A8;
        v21 = -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2), "mutableCopy");
        v22 = v21;
        if (a6)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", a6, v48);
        if (a7)
          objc_msgSend(v22, "setObject:forKeyedSubscript:", a7, v47);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        v24 = v23;
        cf = 0;
        v25 = CFNetDiagnosticPingWithOptions(a3, v22, &cf);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        if (v25)
        {
          v16 = v16 + 1.0;
          objc_msgSend(v14, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v26 - v24) * 1000.0));
        }
        if (cf)
          CFRelease(cf);
        --v19;
      }
      while (v19);
    }
    v27 = 0.0;
    v28 = 0.0;
    if (objc_msgSend(v14, "count"))
    {
      v29 = 0;
      v15 = 0.0;
      do
      {
        objc_msgSend(objc_msgSend(v14, "objectAtIndexedSubscript:", v29), "doubleValue");
        v28 = v28 + v30;
        if (v30 <= v15)
          v31 = v15;
        else
          v31 = v30;
        if (v30 < v27)
          v32 = v30;
        else
          v32 = v27;
        if (v29)
          v15 = v31;
        else
          v15 = v30;
        if (v29)
          v27 = v32;
        else
          v27 = v30;
        ++v29;
      }
      while (v29 < (unint64_t)objc_msgSend(v14, "count"));
    }
    v33 = 0.0;
    v34 = 0.0;
    if (objc_msgSend(v14, "count"))
      v34 = v28 / (double)(unint64_t)objc_msgSend(v14, "count");
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v35 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v37)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "doubleValue");
          v33 = v33 + (v39 - v34) * (v39 - v34);
        }
        v36 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v36);
    }
    v40 = sqrt(v33 / (double)(unint64_t)objc_msgSend(v14, "count"));
    v7 = objc_alloc_init((Class)W5PingResult);
    objc_msgSend(v7, "setInterfaceName:", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"));
    objc_msgSend(v7, "setAddress:", a3);
    objc_msgSend(v7, "setCount:", v46);
    objc_msgSend(v7, "setMin:", v27);
    objc_msgSend(v7, "setMax:", v15);
    objc_msgSend(v7, "setAvg:", v34);
    objc_msgSend(v7, "setStddev:", v40);
    objc_msgSend(v7, "setPacketLoss:", ((double)v46 - v16) / (double)v46);
    objc_msgSend(v7, "setStartedAt:", v13);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "setEndedAt:");
    v41 = v7;
    if (v7)
    {
      v42 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v42, "setEventID:", 34);
      objc_msgSend(v7, "endedAt");
      objc_msgSend(v42, "setTimestamp:");
      v55 = CFSTR("PingResult");
      v56 = v7;
      objc_msgSend(v42, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback)
        pingCallback[2](pingCallback, v42);
    }
  }
  return v7;
}

- (id)__pingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4
{
  NSObject *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  dispatch_time_t v11;
  id v12;
  id v13;
  void (**pingCallback)(id, id);
  void *v15;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  _QWORD v24[5];
  const __CFString *v25;
  uint64_t v26;
  uint8_t buf[16];
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_100058028;
  v22 = sub_100058038;
  v23 = 0;
  if (!qword_1000FB718)
  {
    *(_OWORD *)buf = off_1000D70C8;
    v28 = 0;
    qword_1000FB718 = _sl_dlopen(buf, 0);
  }
  if (a4 <= 2147483646 && a3 && qword_1000FB718)
  {
    v7 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v28 = 0x3052000000;
    v29 = sub_100058028;
    v30 = sub_100058038;
    v8 = (objc_class *)qword_1000FB720;
    v31 = qword_1000FB720;
    if (!qword_1000FB720)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000776B0;
      v24[3] = &unk_1000D5380;
      v24[4] = buf;
      sub_1000776B0((uint64_t)v24);
      v8 = *(objc_class **)(*(_QWORD *)&buf[8] + 40);
    }
    _Block_object_dispose(buf, 8);
    v9 = objc_msgSend([v8 alloc], "initWithAddress:wifi:", a3, 1);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007518C;
    v17[3] = &unk_1000D6838;
    v17[4] = a3;
    v17[5] = self;
    v17[8] = v10;
    v17[6] = v7;
    v17[7] = &v18;
    objc_msgSend(v9, "startWithTimeout:queue:completionHandler:", dispatch_get_global_queue(0, 0), v17, (double)a4);
    v11 = dispatch_time(0, 80000000000);
    if (dispatch_semaphore_wait(v7, v11) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = 0x4054000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
    v12 = (id)v19[5];
  }
  if (v19[5])
  {
    v13 = objc_alloc_init((Class)W5Event);
    objc_msgSend(v13, "setEventID:", 34);
    objc_msgSend((id)v19[5], "endedAt");
    objc_msgSend(v13, "setTimestamp:");
    v25 = CFSTR("PingResult");
    v26 = v19[5];
    objc_msgSend(v13, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    pingCallback = (void (**)(id, id))self->_pingCallback;
    if (pingCallback)
      pingCallback[2](pingCallback, v13);
  }
  v15 = (void *)v19[5];
  _Block_object_dispose(&v18, 8);
  return v15;
}

+ (void)__parsePingOutput:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (a3)
  {
    if (a4)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a3, 4);
      if (v5)
      {
        v14 = v5;
        v6 = objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v16;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v16 != v9)
                objc_enumerationMutation(v6);
              v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              if (objc_msgSend(v11, "containsObject:", CFSTR("loss")))
              {
                v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", 6);
                objc_msgSend(objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1), "doubleValue");
                objc_msgSend(a4, "setPacketLoss:");
              }
              else if (objc_msgSend(v11, "containsObject:", CFSTR("round-trip")))
              {
                v13 = objc_msgSend(objc_msgSend(v11, "objectAtIndexedSubscript:", 3), "componentsSeparatedByString:", CFSTR("/"));
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "doubleValue");
                objc_msgSend(a4, "setMin:");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "doubleValue");
                objc_msgSend(a4, "setAvg:");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 2), "doubleValue");
                objc_msgSend(a4, "setMax:");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 3), "doubleValue");
                objc_msgSend(a4, "setStddev:");
              }
              v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v8);
        }
        objc_msgSend(a4, "setOutput:", v14);
      }
    }
  }
}

- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5
{
  -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", a3, 0, a4, a5, 1, 1);
}

- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v12;
  id v15;
  id v16;
  NSDate *v17;
  NSDate *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a8;
  v9 = a7;
  v12 = a4;
  if (a7)
  {
    v15 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v15, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(v15, "appendFormat:", CFSTR("%@ %@\n"), objc_msgSend(a5, "lastPathComponent"), objc_msgSend(a6, "componentsJoinedByString:", CFSTR(" ")));
    objc_msgSend(v15, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(a3, "writeData:", objc_msgSend(v15, "dataUsingEncoding:", 4));
  }
  v16 = objc_msgSend(a3, "offsetInFile");
  v17 = +[NSDate date](NSDate, "date");
  if (v8)
  {
    v18 = v17;
    v19 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v19, "appendFormat:", CFSTR("BEGIN: %@, END: 00:00:00.000\n"), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18));
    objc_msgSend(v19, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(a3, "writeData:", objc_msgSend(v19, "dataUsingEncoding:", 4));
    if (v12)
      v20 = 0;
    else
      v20 = a3;
    if (v12)
      v21 = a3;
    else
      v21 = 0;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a5, a6, v20, v21, 0, 0, 10.0, 0);
    objc_msgSend(a3, "seekToFileOffset:", v16);
    v22 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v22, "appendFormat:", CFSTR("BEGIN: %@, END: %@\n"), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date")));
    objc_msgSend(v22, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(a3, "writeData:", objc_msgSend(v22, "dataUsingEncoding:", 4));
    objc_msgSend(a3, "seekToEndOfFile");
LABEL_18:
    objc_msgSend(a3, "writeData:", objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
    return;
  }
  if (v12)
    v23 = 0;
  else
    v23 = a3;
  if (v12)
    v24 = a3;
  else
    v24 = 0;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a5, a6, v23, v24, 0, 0, 10.0, 0);
  if (v9)
    goto LABEL_18;
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4
{
  -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:](self, "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:", a3, a4, 1, 1);
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;

  v6 = a6;
  v7 = a5;
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", a4, 0, CFSTR("/usr/local/bin/wl"), a3, v7, v6);
  }
  else if (v7)
  {
    v11 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v11, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(v11, "appendFormat:", CFSTR("%@ %@ -- NOT ASSOCIATED, NOOP\n"), objc_msgSend(CFSTR("/usr/local/bin/wl"), "lastPathComponent"), objc_msgSend(a3, "componentsJoinedByString:", CFSTR(" ")));
    objc_msgSend(v11, "appendString:", CFSTR("--------------------------------------------------------------------\n\n"));
    objc_msgSend(a4, "writeData:", objc_msgSend(v11, "dataUsingEncoding:", 4));
  }
}

- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5
{
  if (!-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
    return 0;
  if (a4)
    return +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/local/bin/wl"), a3, a4, 0);
  if (a5)
    return +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/usr/local/bin/wl"), a3, a5, 0);
  else
    return 0;
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3 component:(id)a4
{
  NSOperationQueue *v6;
  _QWORD v7[6];

  v6 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100075DEC;
  v7[3] = &unk_1000D5C48;
  v7[4] = a4;
  v7[5] = a3;
  -[NSOperationQueue addOperationWithBlock:](v6, "addOperationWithBlock:", v7);
}

+ (id)__temporaryDirectory
{
  NSURL *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  v2 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), "stringByAppendingPathComponent:", -[NSString substringToIndex:](-[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), "substringToIndex:", 5)));
  v6 = 0;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSURL path](v2, "path"), 1, 0, &v6))
  {
    v3 = sub_10008F56C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "+[W5LogManager __temporaryDirectory]";
      v9 = 2080;
      v10 = "W5LogManager.m";
      v11 = 1024;
      v12 = 9874;
      v13 = 2112;
      v14 = v6;
      v5 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) FAILED to create temporary directory, returned error %@", &v7, v5);
    }
  }
  return v2;
}

- (id)collectedItemCallback
{
  return self->_collectedItemCallback;
}

- (id)collectLogItemCallback
{
  return self->_collectLogItemCallback;
}

- (id)pingCallback
{
  return self->_pingCallback;
}

@end
