@implementation W5DiagnosticsManager

- (W5DiagnosticsManager)initWithStatusManager:(id)a3 peerDiagnosticsManager:(id)a4
{
  char *v6;
  dispatch_queue_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)W5DiagnosticsManager;
  v6 = -[W5DiagnosticsManager init](&v14, "init");
  if (!v6)
    goto LABEL_10;
  v7 = dispatch_queue_create("com.apple.wifivelocity.diagnostics", 0);
  *((_QWORD *)v6 + 5) = v7;
  if (!v7)
    goto LABEL_10;
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_create("com.apple.wifivelocity.diagnostics.default-route", v8);
  *((_QWORD *)v6 + 11) = v9;
  if (!v9)
    goto LABEL_10;
  dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 5), v6 + 40, (void *)1, 0);
  if (!a3)
    goto LABEL_10;
  *((_QWORD *)v6 + 1) = a3;
  *((_QWORD *)v6 + 2) = a4;
  v10 = objc_alloc_init((Class)NSMutableArray);
  *((_QWORD *)v6 + 6) = v10;
  if (!v10)
    goto LABEL_10;
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  *((_QWORD *)v6 + 8) = v11;
  if (v11 && (v12 = objc_alloc_init((Class)NSDateFormatter), (*((_QWORD *)v6 + 14) = v12) != 0))
  {
    objc_msgSend(v12, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
    objc_msgSend(v6, "__resetNetworkServiceOrderFromFile");
  }
  else
  {
LABEL_10:

    return 0;
  }
  return (W5DiagnosticsManager *)v6;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *wifiDefaultRouteQueue;
  objc_super v5;

  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  wifiDefaultRouteQueue = self->_wifiDefaultRouteQueue;
  if (wifiDefaultRouteQueue)
    dispatch_release(wifiDefaultRouteQueue);
  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsManager;
  -[W5DiagnosticsManager dealloc](&v5, "dealloc");
}

- (void)setCompletedTestCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_completedTestCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100038610;
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
    v6[2] = sub_1000386DC;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)addRequest:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100038778;
  v4[3] = &unk_1000D5C48;
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

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038914;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)teardownAndNotify:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100038BBC;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)diagnosticsHistory
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_100038CDC;
  v10 = sub_100038CEC;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100038CF8;
  v5[3] = &unk_1000D5D48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)__resetNetworkServiceOrderFromFile
{
  NSData *v2;
  id v3;
  id v4;
  uint8_t v5[16];

  v2 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", CFSTR("/var/run/wifivelocity-tmp"));
  if (-[NSData length](v2, "length"))
  {
    v3 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v2, 0, 0, 0);
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] Restoring network service order from file", v5, 2u);
      }
      +[W5DiagnosticsManager __setNetworkServiceOrder:](W5DiagnosticsManager, "__setNetworkServiceOrder:", v4);
    }
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", CFSTR("/var/run/wifivelocity-tmp"), 0);
  }
}

- (void)resetNetworkServiceOrderForTeardown
{
  NSObject *wifiDefaultRouteQueue;
  _QWORD block[5];

  wifiDefaultRouteQueue = self->_wifiDefaultRouteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038E70;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_sync(wifiDefaultRouteQueue, block);
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
      self->_activeRequest = (W5DiagnosticsTestRequestInternal *)objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy");
      -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0);
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3052000000;
      v6[3] = sub_100038CDC;
      v6[4] = sub_100038CEC;
      v7 = 0;
      v4 = os_transaction_create("com.apple.wifivelocity.diagnostics");
      objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.diagnostics", v4);
      v7 = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100039088;
      v5[3] = &unk_1000D66D8;
      v5[4] = self;
      v5[5] = v3;
      v5[6] = v6;
      -[W5DiagnosticsManager __runRequest:reply:](self, "__runRequest:reply:", v3, v5);
      _Block_object_dispose(v6, 8);
    }
  }
}

- (id)__defaultDiagnosticsTests
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v2 = +[NSMutableArray array](NSMutableArray, "array");
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
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 52, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 57, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 58, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v6, &off_1000E6048));
  if (v4)
    objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 59, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 12, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 13, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 7, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 8, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 9, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 11, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 54, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 14, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 15, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 16, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 17, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 18, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 19, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 20, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 21, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 22, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 51, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 24, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 27, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 28, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 29, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 30, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 31, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 32, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 34, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 35, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 36, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 37, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 38, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 40, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 39, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 41, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 44, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 45, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 46, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 47, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 48, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 43, &off_1000E6048));
  objc_msgSend(v2, "addObject:", +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 42, &off_1000E6048));
  return v2;
}

- (void)__purgeDiagnosticsHistory
{
  double v3;
  double v4;
  id v5;
  id v6;
  void *i;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  double v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = -[NSMutableDictionary allKeys](self->_diagnosticsHistory, "allKeys");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_diagnosticsHistory, "objectForKeyedSubscript:", v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = objc_msgSend(v9, "allKeys");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
              objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", v15), "testCompleted");
              if (v4 - v16 > 86400.0)
                objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }
        if (!objc_msgSend(objc_msgSend(v9, "allKeys"), "count"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnosticsHistory, "setObject:forKeyedSubscript:", 0, v8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }
}

- (void)__updateDiagnosticsHistoryWithResult:(id)a3
{
  id v5;
  id v6;

  if (a3 && (objc_msgSend(a3, "didPass") & 1) == 0)
  {
    v5 = -[CWFInterface networkName](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkName");
    if (objc_msgSend(a3, "testID") == (id)52)
      v5 = -[W5WiFiInterface lastAssociatedSSIDString](-[W5StatusManager wifi](self->_status, "wifi"), "lastAssociatedSSIDString");
    if (v5)
    {
      v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_diagnosticsHistory, "objectForKeyedSubscript:", v5);
      if (!v6)
      {
        v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnosticsHistory, "setObject:forKeyedSubscript:", v6, v5);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "testID")));
    }
  }
  -[W5DiagnosticsManager __purgeDiagnosticsHistory](self, "__purgeDiagnosticsHistory");
}

- (void)__runRequest:(id)a3 reply:(id)a4
{
  id v7;
  NSOperationQueue *v8;
  _QWORD v9[8];

  v7 = objc_msgSend(a3, "testRequests");
  if (!v7)
    v7 = -[W5DiagnosticsManager __defaultDiagnosticsTests](self, "__defaultDiagnosticsTests");
  if (!-[NSArray count](self->_wifiScanResults, "count"))
  {

    self->_wifiScanResults = (NSArray *)-[W5WiFiInterface scanCache:](-[W5StatusManager wifi](self->_status, "wifi"), "scanCache:", 1);
  }
  v8 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100039B2C;
  v9[3] = &unk_1000D6068;
  v9[4] = a3;
  v9[5] = v7;
  v9[6] = self;
  v9[7] = a4;
  -[NSOperationQueue addOperationWithBlock:](v8, "addOperationWithBlock:", v9);
}

- (id)__testDetectDoubleNAT
{
  id v3;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 8);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    if (+[W5DiagnosticsManager __isDoubleNATWithTracerouteOutput:](W5DiagnosticsManager, "__isDoubleNATWithTracerouteOutput:", -[W5DiagnosticsManager __performTracerouteWithAddress:maxTTL:waittime:queries:](self, "__performTracerouteWithAddress:maxTTL:waittime:queries:", CFSTR("captive.apple.com"), 2, 1, 1)))
    {
      objc_msgSend(v3, "setResult:", 1);
    }
    else
    {
      objc_msgSend(v3, "setDidPass:", 1);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testPingLANWithConfiguration:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  const __CFString *v25;
  void *v26;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  v6 = 1;
  objc_msgSend(v5, "setTestID:", 1);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingCount"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTimeout"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingInterval"));
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingWait"));
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  if (v7)
    v6 = (uint64_t)objc_msgSend(v7, "integerValue");
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v13 = v12;
    if (v9)
      goto LABEL_5;
  }
  else
  {
    v13 = 2.0;
    if (v9)
    {
LABEL_5:
      objc_msgSend(v9, "doubleValue");
      v15 = v14;
      if (v10)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  v15 = 0.1;
  if (v10)
  {
LABEL_6:
    objc_msgSend(v10, "doubleValue");
    v17 = v16;
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  v17 = 2.0;
  if (v11)
LABEL_7:
    v11 = objc_msgSend(v11, "unsignedIntegerValue");
LABEL_8:
  v18 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTrafficClass"));
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v19 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
    v20 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
    if (v19 || (v19 = v20) != 0)
    {
      v21 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v19, v6, v18, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), v11, v13, v17, v15);
      if (v21)
      {
        v22 = v21;
        if ((uint64_t)objc_msgSend(v21, "count") >= 1)
        {
          objc_msgSend(v22, "packetLoss");
          if (v23 < 100.0)
          {
            objc_msgSend(v5, "setResult:", 1);
            objc_msgSend(v5, "setDidPass:", 1);
          }
        }
        v25 = CFSTR("PingResult");
        v26 = v22;
        objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testPing6AWDLWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  const __CFString *v17;
  void *v18;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 59);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingCount"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingWait"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  if (v6)
  {
    v9 = (uint64_t)objc_msgSend(v6, "integerValue");
    if (v7)
      goto LABEL_3;
LABEL_13:
    v11 = 2.0;
    if (!v8)
      goto LABEL_5;
    goto LABEL_4;
  }
  v9 = 1;
  if (!v7)
    goto LABEL_13;
LABEL_3:
  objc_msgSend(v7, "doubleValue");
  v11 = v10;
  if (v8)
LABEL_4:
    v8 = objc_msgSend(v8, "unsignedIntegerValue");
LABEL_5:
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTrafficClass"));
  if (objc_msgSend(objc_msgSend(-[CWFInterface AWDL](-[W5StatusManager corewifi](self->_status, "corewifi"), "AWDL"), "IPv6Addresses"), "count"))
  {
    v13 = -[W5DiagnosticsManager __performPing6WithAddress:count:wait:trafficClass:interfaceName:dataLength:](self, "__performPing6WithAddress:count:wait:trafficClass:interfaceName:dataLength:", CFSTR("ff02::fb"), v9, v12, -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName"), v8, v11);
    if (v13)
    {
      v14 = v13;
      if ((uint64_t)objc_msgSend(v13, "count") >= 1)
      {
        objc_msgSend(v14, "packetLoss");
        if (v15 < 100.0)
        {
          objc_msgSend(v5, "setResult:", 1);
          objc_msgSend(v5, "setDidPass:", 1);
        }
      }
      v17 = CFSTR("PingResult");
      v18 = v14;
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testPingWANWithConfiguration:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  char v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  W5StatusManager *status;
  id v26;
  _UNKNOWN **v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  id v32;
  void *v33;
  double v34;
  char v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  id v41;
  void *v42;
  double v43;
  char v44;
  id v45;
  id v46;
  uint64_t v47;
  void *k;
  void *v49;
  double v50;
  void *v52;
  uint64_t v53;
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
  const __CFString *v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 4);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v52 = v5;
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingCount"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTimeout"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingInterval"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingWait"));
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingWANUseAppleDNS"));
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  v13 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IPAddress"));
  if (v6)
  {
    v53 = (uint64_t)objc_msgSend(v6, "integerValue");
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v53 = 1;
    if (v7)
    {
LABEL_3:
      objc_msgSend(v7, "doubleValue");
      v15 = v14;
      if (v8)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  v15 = 2.0;
  if (v8)
  {
LABEL_4:
    objc_msgSend(v8, "doubleValue");
    v17 = v16;
    if (v9)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v17 = 0.1;
  if (v9)
  {
LABEL_5:
    objc_msgSend(v9, "doubleValue");
    v19 = v18;
    if (!v10)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  v19 = 2.0;
  if (v10)
LABEL_6:
    v10 = objc_msgSend(v10, "unsignedIntegerValue");
LABEL_7:
  v20 = v13;
  if (v11)
  {
    v21 = objc_msgSend(v11, "BOOLValue") ^ 1;
    if (v12)
    {
LABEL_9:
      v22 = objc_msgSend(v12, "BOOLValue");
      goto LABEL_17;
    }
  }
  else
  {
    v21 = 1;
    if (v12)
      goto LABEL_9;
  }
  v22 = 1;
LABEL_17:
  v23 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTrafficClass"));
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v24 = +[NSMutableArray array](NSMutableArray, "array");
    if ((v21 & 1) != 0)
    {
      status = self->_status;
      if (v20)
      {
        v26 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", v20, v53, v23, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](status, "wifi"), "interfaceName"), v10, v15, v19, v17);
        if (v26)
          objc_msgSend(v24, "addObject:", v26);
      }
      else
      {
        v36 = -[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](status, "corewifi"), "DNSServerAddresses");
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(_QWORD *)v59 != v39)
                objc_enumerationMutation(v36);
              v41 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), v53, v23, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), v10, v15, v19, v17);
              if (v41)
              {
                v42 = v41;
                objc_msgSend(v24, "addObject:", v41);
                objc_msgSend(v42, "packetLoss");
                if (v43 < 100.0)
                  v44 = 1;
                else
                  v44 = v22;
                if ((v44 & 1) != 0)
                  goto LABEL_51;
              }
              else if ((v22 & 1) != 0)
              {
                goto LABEL_51;
              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
          }
          while (v38);
        }
      }
    }
    else
    {
      v27 = sub_10008EEF4();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(_QWORD *)v63 != v30)
              objc_enumerationMutation(v27);
            v32 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j), v53, v23, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), v10, v15, v19, v17);
            if (v32)
            {
              v33 = v32;
              objc_msgSend(v24, "addObject:", v32);
              objc_msgSend(v33, "packetLoss");
              if (v34 < 100.0)
                v35 = 1;
              else
                v35 = v22;
              if ((v35 & 1) != 0)
                goto LABEL_51;
            }
            else if ((v22 & 1) != 0)
            {
              goto LABEL_51;
            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v29);
      }
    }
LABEL_51:
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v45 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v55;
      while (2)
      {
        for (k = 0; k != v46; k = (char *)k + 1)
        {
          if (*(_QWORD *)v55 != v47)
            objc_enumerationMutation(v24);
          v49 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)k);
          if ((uint64_t)objc_msgSend(v49, "count") >= 1)
          {
            objc_msgSend(v49, "packetLoss");
            if (v50 < 100.0)
            {
              objc_msgSend(v52, "setDidPass:", 1);
              objc_msgSend(v52, "setResult:", 1);
              goto LABEL_62;
            }
          }
        }
        v46 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (v46)
          continue;
        break;
      }
    }
LABEL_62:
    v66 = CFSTR("PingResults");
    v67 = objc_msgSend(v24, "copy");
    objc_msgSend(v52, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v52, "setTestCompleted:");
  return v52;
}

- (id)__testPingLANUsingIMFoundation
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  const __CFString *v10;
  void *v11;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 2);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v4 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
    v5 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
    if (v4 || (v4 = v5) != 0)
    {
      v6 = -[W5DiagnosticsManager __performPingUsingIMFoundationWithAddress:timeout:](self, "__performPingUsingIMFoundationWithAddress:timeout:", v4, 1);
      if (v6)
      {
        v7 = v6;
        if ((uint64_t)objc_msgSend(v6, "count") >= 1)
        {
          objc_msgSend(v7, "packetLoss");
          if (v8 < 100.0)
          {
            objc_msgSend(v3, "setDidPass:", 1);
            objc_msgSend(v3, "setResult:", 1);
          }
        }
        v10 = CFSTR("PingResult");
        v11 = v7;
        objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testPingWANUsingIMFoundation
{
  id v3;
  id v4;
  _UNKNOWN **v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  double v26;
  __int128 v28;
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
  const __CFString *v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 5);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v4 = +[NSMutableArray array](NSMutableArray, "array");
    v5 = sub_10008EEF4();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v37;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = -[W5DiagnosticsManager __performPingUsingIMFoundationWithAddress:timeout:](self, "__performPingUsingIMFoundationWithAddress:timeout:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v9), 1);
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v4, "addObject:", v10);
          objc_msgSend(v11, "packetLoss");
          if (v12 < 100.0)
            break;
        }
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }
    v13 = -[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "DNSServerAddresses");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
LABEL_13:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = -[W5DiagnosticsManager __performPingUsingIMFoundationWithAddress:timeout:](self, "__performPingUsingIMFoundationWithAddress:timeout:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17), 1);
        if (v18)
        {
          v19 = v18;
          objc_msgSend(v4, "addObject:", v18);
          objc_msgSend(v19, "packetLoss");
          if (v20 < 100.0)
            break;
        }
        if (v15 == (id)++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
          if (v15)
            goto LABEL_13;
          break;
        }
      }
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v4);
          v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          if ((uint64_t)objc_msgSend(v25, "count") >= 1)
          {
            objc_msgSend(v25, "packetLoss");
            if (v26 < 100.0)
            {
              objc_msgSend(v3, "setDidPass:", 1);
              objc_msgSend(v3, "setResult:", 1);
              goto LABEL_31;
            }
          }
        }
        v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_31:
    v40 = CFSTR("PingResults");
    v41 = objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testPingLANUsingCFNetworkWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  const __CFString *v19;
  void *v20;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingCount"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTimeout"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  if (v6)
  {
    v9 = (uint64_t)objc_msgSend(v6, "integerValue");
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v9 = 1;
    if (v7)
    {
LABEL_3:
      objc_msgSend(v7, "doubleValue");
      v11 = v10;
      if (!v8)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v11 = 2.0;
  if (v8)
LABEL_4:
    v8 = objc_msgSend(v8, "unsignedIntegerValue");
LABEL_5:
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTrafficClass"));
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v13 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
    v14 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
    if (v13 || (v13 = v14) != 0)
    {
      v15 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:](self, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:", v13, v9, v12, 0, v8, v11);
      if (v15)
      {
        v16 = v15;
        if ((uint64_t)objc_msgSend(v15, "count") >= 1)
        {
          objc_msgSend(v16, "packetLoss");
          if (v17 < 100.0)
          {
            objc_msgSend(v5, "setDidPass:", 1);
            objc_msgSend(v5, "setResult:", 1);
          }
        }
        v19 = CFSTR("PingResult");
        v20 = v16;
        objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testPingWANUsingCFNetworkWithConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  char v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  id v18;
  _UNKNOWN **v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  id v24;
  void *v25;
  double v26;
  char v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  id v33;
  void *v34;
  double v35;
  char v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  void *v41;
  double v42;
  id v44;
  void *v45;
  __int128 v47;
  __int128 v48;
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
  const __CFString *v59;
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];

  v4 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v4, "setTestID:", 6);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setTestStarted:");
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingCount"));
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTimeout"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingWANUseAppleDNS"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IPAddress"));
  if (v5)
  {
    v11 = (uint64_t)objc_msgSend(v5, "integerValue");
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v11 = 1;
    if (v6)
    {
LABEL_3:
      objc_msgSend(v6, "doubleValue");
      v13 = v12;
      if (!v7)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v13 = 2.0;
  if (v7)
LABEL_4:
    v7 = objc_msgSend(v7, "unsignedIntegerValue");
LABEL_5:
  if (v8)
  {
    v14 = objc_msgSend(v8, "BOOLValue") ^ 1;
    if (v9)
    {
LABEL_7:
      v15 = objc_msgSend(v9, "BOOLValue");
      goto LABEL_13;
    }
  }
  else
  {
    v14 = 1;
    if (v9)
      goto LABEL_7;
  }
  v15 = 1;
LABEL_13:
  v16 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTrafficClass"));
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v17 = +[NSMutableArray array](NSMutableArray, "array");
    v44 = v4;
    if ((v14 & 1) != 0)
    {
      if (v10)
      {
        v18 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:](self, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:", v10, v11, v16, 0, v7, v13);
        if (v18)
          objc_msgSend(v17, "addObject:", v18);
      }
      else
      {
        v28 = -[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "DNSServerAddresses");
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(_QWORD *)v52 != v31)
                objc_enumerationMutation(v28);
              v33 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:](self, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), v11, v16, 0, v7, v13, v44);
              if (v33)
              {
                v34 = v33;
                objc_msgSend(v17, "addObject:", v33);
                objc_msgSend(v34, "packetLoss");
                if (v35 < 100.0)
                  v36 = 1;
                else
                  v36 = v15;
                if ((v36 & 1) != 0)
                  goto LABEL_47;
              }
              else if ((v15 & 1) != 0)
              {
                goto LABEL_47;
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          }
          while (v30);
        }
      }
    }
    else
    {
      v19 = sub_10008EEF4();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(_QWORD *)v56 != v22)
              objc_enumerationMutation(v19);
            v24 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:](self, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), v11, v16, 0, v7, v13, v44);
            if (v24)
            {
              v25 = v24;
              objc_msgSend(v17, "addObject:", v24);
              objc_msgSend(v25, "packetLoss");
              if (v26 < 100.0)
                v27 = 1;
              else
                v27 = v15;
              if ((v27 & 1) != 0)
                goto LABEL_47;
            }
            else if ((v15 & 1) != 0)
            {
              goto LABEL_47;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v21);
      }
    }
LABEL_47:
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v61, 16, v44);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v48;
      while (2)
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(_QWORD *)v48 != v39)
            objc_enumerationMutation(v17);
          v41 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k);
          if ((uint64_t)objc_msgSend(v41, "count") >= 1)
          {
            objc_msgSend(v41, "packetLoss");
            if (v42 < 100.0)
            {
              objc_msgSend(v45, "setDidPass:", 1);
              objc_msgSend(v45, "setResult:", 1);
              goto LABEL_58;
            }
          }
        }
        v38 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        if (v38)
          continue;
        break;
      }
    }
LABEL_58:
    v59 = CFSTR("PingResults");
    v60 = objc_msgSend(v17, "copy");
    v4 = v45;
    objc_msgSend(v45, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setTestCompleted:");
  return v4;
}

- (id)__testConcurrentWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  NSOperationQueue *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v20;
  NSObject *v21;
  id obj;
  _QWORD block[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[10];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 53);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v20 = v5;
  objc_msgSend(v5, "setDidPass:", 1);
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ConcurrentRequests"));
  obj = +[NSMutableArray array](NSMutableArray, "array");
  v21 = dispatch_queue_create(0, 0);
  v8 = dispatch_group_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v8);
        v14 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10003BE10;
        v28[3] = &unk_1000D67A0;
        v28[4] = v13;
        v28[5] = v6;
        v28[6] = self;
        v28[7] = v21;
        v28[8] = obj;
        v28[9] = v8;
        -[NSOperationQueue addOperationWithBlock:](v14, "addOperationWithBlock:", v28);
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    while (2)
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "didPass") & 1) == 0)
        {
          objc_msgSend(v20, "setDidPass:", 0);
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BF2C;
  block[3] = &unk_1000D5C48;
  block[4] = v20;
  block[5] = obj;
  dispatch_sync(v21, block);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "setTestCompleted:");
  if (v8)
    dispatch_release(v8);
  if (v21)
    dispatch_release(v21);
  return v20;
}

- (id)__testResolveDNS
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  const sockaddr *v10;
  NSString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  NSString *v18;
  char v19[16];
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 7);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v4 = +[W5DiagnosticsManager __performDNSResolution:](W5DiagnosticsManager, "__performDNSResolution:", CFSTR("captive.apple.com"));
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v3, "setDidPass:", 1);
      objc_msgSend(v3, "setResult:", 1);
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
            v10 = (const sockaddr *)objc_msgSend(v9, "bytes");
            if ((unint64_t)objc_msgSend(v9, "length") >= 0x10
              && v10->sa_family == 2
              && !getnameinfo(v10, v10->sa_len, v19, 0x10u, 0, 0, 2))
            {
              v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 1);
              if (v11)
              {
                v17 = CFSTR("DNSResolution");
                v18 = v11;
                objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
              }
              goto LABEL_16;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
          if (v6)
            continue;
          break;
        }
      }
    }
  }
LABEL_16:
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testReachApple
{
  id v3;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 9);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if ((-[CWFInterface reachabilityFlags](-[W5StatusManager corewifi](self->_status, "corewifi"), "reachabilityFlags") & 6) == 2)
  {
    objc_msgSend(v3, "setDidPass:", 1);
    objc_msgSend(v3, "setResult:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testRetrieveApple
{
  NSString *v3;
  id v4;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@"), CFSTR("captive.apple.com"));
  v4 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v4, "setTestID:", 10);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setTestStarted:");
  if (-[W5DiagnosticsManager __performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:](self, "__performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:", v3, 0, 0))
  {
    objc_msgSend(v4, "setDidPass:", 1);
    objc_msgSend(v4, "setResult:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setTestCompleted:");
  return v4;
}

- (id)__testRetrieveAppleForceWiFiWithConfiguration:(id)a3
{
  NSString *v5;
  id v6;
  id v7;

  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@"), CFSTR("captive.apple.com"));
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Timeout"));
  v7 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v7, "setTestID:", 11);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setTestStarted:");
  if (-[W5DiagnosticsManager __performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:](self, "__performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:", v5, v6, 1))
  {
    objc_msgSend(v7, "setDidPass:", 1);
    objc_msgSend(v7, "setResult:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setTestCompleted:");
  return v7;
}

- (id)__testCurlApple
{
  NSString *v3;
  id v4;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@"), CFSTR("captive.apple.com"));
  v4 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v4, "setTestID:", 54);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setTestStarted:");
  if (-[W5DiagnosticsManager __performCurlWithAddress:](self, "__performCurlWithAddress:", v3))
  {
    objc_msgSend(v4, "setDidPass:", 1);
    objc_msgSend(v4, "setResult:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setTestCompleted:");
  return v4;
}

- (id)__testIPv4Assigned
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 12);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[CWFInterface IPv4Addresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4Addresses");
  v5 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  if (objc_msgSend(v4, "count"))
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v3, "setDidPass:", 1);
    objc_msgSend(v3, "setResult:", 1);
    v8[0] = CFSTR("IPv4Addresses");
    v8[1] = CFSTR("IPv4Router");
    v9[0] = v4;
    v9[1] = v5;
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testPeerDiagnostics
{
  id v3;
  id v4;
  const __CFString *v6;
  id v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 60);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[W5PeerDiagnosticsManager gatherPeerDiagnostics](self->_peerDiagnostics, "gatherPeerDiagnostics");
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "setResult:", 1);
    objc_msgSend(v3, "setDidPass:", 1);
    v6 = CFSTR("PeerDiagnosticsResults");
    v7 = v4;
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
  else
  {
    objc_msgSend(v3, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testPeerTypes
{
  id v3;
  id v4;
  id v5;
  const __CFString *v7;
  id v8;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 61);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[W5PeerDiagnosticsManager gatherPeerTypes](self->_peerDiagnostics, "gatherPeerTypes");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v3, "setResult:", 1);
    objc_msgSend(v3, "setDidPass:", 1);
    v7 = CFSTR("PeerDevicesInfo");
    v8 = v5;
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  }
  else
  {
    objc_msgSend(v3, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testDiscoverPeerTypes
{
  id v3;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 62);
  objc_msgSend(v3, "setDidPass:", 1);
  objc_msgSend(v3, "setResult:", 1);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  -[W5PeerDiagnosticsManager beginPeerDiscovery](self->_peerDiagnostics, "beginPeerDiscovery");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testIPv6Assigned
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 13);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[CWFInterface IPv6Addresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6Addresses");
  v5 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
  if (objc_msgSend(v4, "count"))
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v3, "setDidPass:", 1);
    objc_msgSend(v3, "setResult:", 1);
    v8[0] = CFSTR("IPv6Addresses");
    v8[1] = CFSTR("IPv6Router");
    v9[0] = v4;
    v9[1] = v5;
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomIPv4
{
  id v3;
  int64_t v4;
  const __CFString *v6;
  NSNumber *v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 14);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[W5WiFiInterface ipv4ConfigMethod](-[W5StatusManager wifi](self->_status, "wifi"), "ipv4ConfigMethod");
  if (v4 == 3)
    objc_msgSend(v3, "setDidPass:", 1);
  else
    objc_msgSend(v3, "setResult:", 1);
  v6 = CFSTR("IPv4ConfigMethod");
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
  objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomIPv6
{
  id v3;
  int64_t v4;
  const __CFString *v6;
  NSNumber *v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 15);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[W5WiFiInterface ipv6ConfigMethod](-[W5StatusManager wifi](self->_status, "wifi"), "ipv6ConfigMethod");
  if (v4 == 1)
    objc_msgSend(v3, "setDidPass:", 1);
  else
    objc_msgSend(v3, "setResult:", 1);
  v6 = CFSTR("IPv6ConfigMethod");
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
  objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomDNS
{
  id v3;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 16);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[W5WiFiInterface isUsingCustomDNSSettings](-[W5StatusManager wifi](self->_status, "wifi"), "isUsingCustomDNSSettings"))
  {
    objc_msgSend(v3, "setResult:", 1);
  }
  else
  {
    objc_msgSend(v3, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomWebProxy
{
  id v3;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 17);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[W5WiFiInterface isUsingCustomProxySetting](-[W5StatusManager wifi](self->_status, "wifi"), "isUsingCustomProxySetting"))
  {
    objc_msgSend(v3, "setResult:", 1);
  }
  else
  {
    objc_msgSend(v3, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testCongestedChannelUsingCCAWithConfiguration:(id)a3
{
  id v3;

  v3 = -[W5DiagnosticsManager __testCongestedChannelWithConfiguration:](self, "__testCongestedChannelWithConfiguration:", a3);
  objc_msgSend(v3, "setTestID:", 23);
  return v3;
}

- (id)__testCongestedChannelWithConfiguration:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  W5WiFiInterface *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  float v22;
  float v23;
  id v24;
  NSArray *wifiScanResults;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  id v31;
  id v32;
  _BYTE *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  _UNKNOWN **v38;
  void *v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 24);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000) == 0)
  {
    v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v8;
    }
  }
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v9)
    v10 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v9);
  else
    v10 = -[W5StatusManager wifi](self->_status, "wifi");
  v11 = -[W5WiFiInterface channel](v10, "channel");
  v12 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  v13 = -[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:](self, "__overlappingChannelsForChannel:supportedChannels:", v11, v12);
  v14 = -[W5DiagnosticsManager __occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:](self, "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:", self->_wifiScanResults, v12, -80, v11);
  v15 = -[W5DiagnosticsManager __orderedChannelWeights:](self, "__orderedChannelWeights:", -[W5DiagnosticsManager __adjust5GHzWeights:](self, "__adjust5GHzWeights:", -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:](self, "__applyChannelWeights:supportedChannels:", -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:](self, "__channelWeightsForScanResults:supportedChannels:rssiThreshold:", self->_wifiScanResults, v12, -80), v12)));
  v42 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v15);
  v43 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v15);
  v44 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v43);
  v45 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v43);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(v13);
        v19 += objc_msgSend(v14, "containsObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i));
      }
      v18 += (uint64_t)v17;
      v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v17);
    v22 = (float)v19;
    v23 = (float)v18;
  }
  else
  {
    v23 = 0.0;
    v22 = 0.0;
  }
  v24 = +[NSMutableArray array](NSMutableArray, "array");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v28)
          objc_enumerationMutation(wifiScanResults);
        v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        v31 = objc_msgSend(objc_msgSend(v30, "channel"), "channel");
        if (v31 == objc_msgSend(v11, "channel"))
          objc_msgSend(v24, "addObject:", v30);
      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v27);
  }
  v32 = -[CWFInterface cachedLinkQualityMetric](-[W5StatusManager corewifi](self->_status, "corewifi"), "cachedLinkQualityMetric");
  v33 = objc_msgSend(objc_msgSend(v32, "linkQualityMetricData"), "bytes");
  if (v33 && v33[18])
  {
    v35 = v44;
    v34 = v45;
    v36 = v43;
    if ((unint64_t)objc_msgSend(v32, "CCA") >= 0x47)
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v38 = &Apple80211BindToInterface_ptr;
    v40 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v40, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "CCA")), CFSTR("CCA"));
    v39 = v42;
    if (!v11)
      goto LABEL_36;
LABEL_35:
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v11, CFSTR("CurrentChannel"));
    goto LABEL_36;
  }
  if ((unint64_t)objc_msgSend(v24, "count") > 4 || (*(float *)&v37 = v22 / v23, (float)(v22 / v23) > 0.5))
    objc_msgSend(v5, "setResult:", 1, v37);
  else
    objc_msgSend(v5, "setDidPass:", 1, v37);
  v38 = &Apple80211BindToInterface_ptr;
  v35 = v44;
  v34 = v45;
  v39 = v42;
  v36 = v43;
  v40 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (v11)
    goto LABEL_35;
LABEL_36:
  if (objc_msgSend(v39, "count"))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v39, "firstObject"), CFSTR("2GHzChannel"));
  if (objc_msgSend(v36, "count"))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v36, "firstObject"), CFSTR("5GHzChannel"));
  if (objc_msgSend(v35, "count"))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v35, "firstObject"), CFSTR("5GHz40MHzChannel"));
  if (objc_msgSend(v34, "count"))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v34, "firstObject"), CFSTR("5GHzNonDFSChannel"));
  objc_msgSend(v5, "setInfo:", objc_msgSend(v40, "copy"));
  objc_msgSend(v38[118], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testCongested2GHzWithConfiguration:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *i;
  float v24;
  id v25;
  id v27;
  id v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 25);
  objc_msgSend(v5, "setConfiguration:", a3);
  v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v9;
    }
  }
  v10 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  v11 = -[W5DiagnosticsManager __only2GHzChannels:](self, "__only2GHzChannels:", v10);
  v12 = -[W5DiagnosticsManager __occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:](self, "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:", self->_wifiScanResults, v11, -80, 0);
  v13 = -[W5DiagnosticsManager __orderedChannelWeights:](self, "__orderedChannelWeights:", -[W5DiagnosticsManager __adjust5GHzWeights:](self, "__adjust5GHzWeights:", -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:](self, "__applyChannelWeights:supportedChannels:", -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:](self, "__channelWeightsForScanResults:supportedChannels:rssiThreshold:", self->_wifiScanResults, v10, -80), v10)));
  v14 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v13);
  v15 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v13);
  v16 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v15);
  v17 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v15);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v18)
    goto LABEL_13;
  v19 = v18;
  v27 = v14;
  v28 = v16;
  v29 = v17;
  v30 = v5;
  v20 = 0;
  v21 = 0;
  v22 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v22)
        objc_enumerationMutation(v11);
      v21 += objc_msgSend(v12, "containsObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "channel", v27, v28, v29)));
    }
    v20 += (uint64_t)v19;
    v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v19);
  v24 = (float)v21 / (float)v20;
  v17 = v29;
  v5 = v30;
  v6 = &Apple80211BindToInterface_ptr;
  v14 = v27;
  v16 = v28;
  if (v24 > 0.75)
    objc_msgSend(v30, "setResult:", 1);
  else
LABEL_13:
    objc_msgSend(v5, "setDidPass:", 1);
  v25 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v14, "firstObject"), CFSTR("2GHzChannel"));
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v15, "firstObject"), CFSTR("5GHzChannel"));
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v16, "firstObject"), CFSTR("5GHz40MHzChannel"));
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v17, "firstObject"), CFSTR("5GHzNonDFSChannel"));
  objc_msgSend(v5, "setInfo:", objc_msgSend(v25, "copy"));
  objc_msgSend(v6[118], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testCongested5GHzWithConfiguration:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *i;
  float v24;
  id v25;
  id v27;
  id v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 26);
  objc_msgSend(v5, "setConfiguration:", a3);
  v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v9;
    }
  }
  v10 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  v11 = -[W5DiagnosticsManager __only5GHzChannels:](self, "__only5GHzChannels:", v10);
  v12 = -[W5DiagnosticsManager __occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:](self, "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:", self->_wifiScanResults, v11, -80, 0);
  v13 = -[W5DiagnosticsManager __orderedChannelWeights:](self, "__orderedChannelWeights:", -[W5DiagnosticsManager __adjust5GHzWeights:](self, "__adjust5GHzWeights:", -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:](self, "__applyChannelWeights:supportedChannels:", -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:](self, "__channelWeightsForScanResults:supportedChannels:rssiThreshold:", self->_wifiScanResults, v10, -80), v10)));
  v14 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v13);
  v15 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v13);
  v16 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v15);
  v17 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v15);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v18)
    goto LABEL_13;
  v19 = v18;
  v27 = v14;
  v28 = v16;
  v29 = v17;
  v30 = v5;
  v20 = 0;
  v21 = 0;
  v22 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v22)
        objc_enumerationMutation(v11);
      v21 += objc_msgSend(v12, "containsObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "channel", v27, v28, v29)));
    }
    v20 += (uint64_t)v19;
    v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v19);
  v24 = (float)v21 / (float)v20;
  v17 = v29;
  v5 = v30;
  v6 = &Apple80211BindToInterface_ptr;
  v14 = v27;
  v16 = v28;
  if (v24 > 0.75)
    objc_msgSend(v30, "setResult:", 1);
  else
LABEL_13:
    objc_msgSend(v5, "setDidPass:", 1);
  v25 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v14, "firstObject"), CFSTR("2GHzChannel"));
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v15, "firstObject"), CFSTR("5GHzChannel"));
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v16, "firstObject"), CFSTR("5GHz40MHzChannel"));
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v17, "firstObject"), CFSTR("5GHzNonDFSChannel"));
  objc_msgSend(v5, "setInfo:", objc_msgSend(v25, "copy"));
  objc_msgSend(v6[118], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testHT402GHzWithConfiguration:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  NSArray *wifiScanResults;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 27);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000) == 0)
  {
    v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v8;
    }
  }
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(wifiScanResults);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(objc_msgSend(v15, "channel"), "flags") & 8) != 0
          && (objc_msgSend(objc_msgSend(v15, "channel"), "flags") & 4) != 0)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
  v16 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v5, "setResult:", 1);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v9, "copy"), CFSTR("ScanResults"));
  }
  else
  {
    objc_msgSend(v5, "setDidPass:", 1);
  }
  v17 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  v18 = -[W5DiagnosticsManager __orderedChannelWeights:](self, "__orderedChannelWeights:", -[W5DiagnosticsManager __adjust5GHzWeights:](self, "__adjust5GHzWeights:", -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:](self, "__applyChannelWeights:supportedChannels:", -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:](self, "__channelWeightsForScanResults:supportedChannels:rssiThreshold:", self->_wifiScanResults, v17, -80), v17)));
  v19 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v18);
  v20 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v18);
  v21 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v20);
  v22 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v20);
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v19, "firstObject"), CFSTR("2GHzChannel"));
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v20, "firstObject"), CFSTR("5GHzChannel"));
  if (objc_msgSend(v21, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v21, "firstObject"), CFSTR("5GHz40MHzChannel"));
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v22, "firstObject"), CFSTR("5GHzNonDFSChannel"));
  objc_msgSend(v5, "setInfo:", objc_msgSend(v16, "copy"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testNoSecurityWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  NSNumber **v15;
  const __CFString **v16;
  uint64_t v17;
  const __CFString *v19;
  NSNumber *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 38);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "strongestSupportedSecurity");
      if (v13)
        objc_msgSend(v5, "setDidPass:", 1);
      else
        objc_msgSend(v5, "setResult:", 1);
      v21[0] = CFSTR("ScanResult");
      v21[1] = CFSTR("Security");
      v22[0] = v12;
      v22[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13);
      v15 = (NSNumber **)v22;
      v16 = (const __CFString **)v21;
      v17 = 2;
LABEL_15:
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v16, v17));
    }
  }
  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v14 = -[W5WiFiInterface security](-[W5StatusManager wifi](self->_status, "wifi"), "security");
    if (v14)
      objc_msgSend(v5, "setDidPass:", 1);
    else
      objc_msgSend(v5, "setResult:", 1);
    v19 = CFSTR("Security");
    v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14);
    v15 = &v20;
    v16 = &v19;
    v17 = 1;
    goto LABEL_15;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLegacySecurityWEPWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  NSNumber **v14;
  const __CFString **v15;
  uint64_t v16;
  int64_t v17;
  id v18;
  const __CFString *v20;
  NSNumber *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 39);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "supportedSecurityTypes");
      if ((objc_msgSend(v13, "containsObject:", &off_1000E2EC8) & 1) != 0
        || (objc_msgSend(v13, "containsObject:", &off_1000E2EE0) & 1) != 0
        || objc_msgSend(v12, "supportsWEPCipher"))
      {
        objc_msgSend(v5, "setResult:", 1);
      }
      else
      {
        objc_msgSend(v5, "setDidPass:", 1);
      }
      v22[0] = CFSTR("ScanResult");
      v22[1] = CFSTR("Security");
      v23[0] = v12;
      v23[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "strongestSupportedSecurity"));
      v14 = (NSNumber **)v23;
      v15 = (const __CFString **)v22;
      v16 = 2;
LABEL_17:
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v15, v16));
    }
  }
  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v17 = -[W5WiFiInterface security](-[W5StatusManager wifi](self->_status, "wifi"), "security");
    v18 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
    if (v17 == 1 || v17 == 8 || objc_msgSend(v18, "supportsWEPCipher"))
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v20 = CFSTR("Security");
    v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17);
    v14 = &v21;
    v15 = &v20;
    v16 = 1;
    goto LABEL_17;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLegacySecurityWPAWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  NSNumber **v14;
  const __CFString **v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  const __CFString *v20;
  NSNumber *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 40);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "supportedSecurityTypes");
      if ((objc_msgSend(v13, "containsObject:", &off_1000E2EF8) & 1) != 0
        || (objc_msgSend(v13, "containsObject:", &off_1000E2F10) & 1) != 0
        || objc_msgSend(v12, "supportsTKIPCipher"))
      {
        objc_msgSend(v5, "setResult:", 1);
      }
      else
      {
        objc_msgSend(v5, "setDidPass:", 1);
      }
      v22[0] = CFSTR("ScanResult");
      v22[1] = CFSTR("Security");
      v23[0] = v12;
      v23[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "strongestSupportedSecurity"));
      v14 = (NSNumber **)v23;
      v15 = (const __CFString **)v22;
      v16 = 2;
LABEL_16:
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v15, v16));
    }
  }
  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v17 = -[W5WiFiInterface security](-[W5StatusManager wifi](self->_status, "wifi"), "security");
    v18 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
    if (v17 <= 0xA && ((1 << v17) & 0x60C) != 0 || objc_msgSend(v18, "supportsTKIPCipher"))
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v20 = CFSTR("Security");
    v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17);
    v14 = &v21;
    v15 = &v20;
    v16 = 1;
    goto LABEL_16;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLegacyRates11bWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  id v12;
  const __CFString *v14;
  id v15;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 41);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "fastestSupportedPHYMode") == 4)
        objc_msgSend(v5, "setResult:", 1);
      else
        objc_msgSend(v5, "setDidPass:", 1);
      v14 = CFSTR("ScanResult");
      v15 = v12;
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    }
  }
  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    if (-[CWFInterface PHYMode](-[W5StatusManager corewifi](self->_status, "corewifi"), "PHYMode") == 4)
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testAirPortBaseStationWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 33);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
  }
  else
  {
    v11 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
  }
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "airPortBaseStationModelName");
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v5, "setDidPass:", 1);
      objc_msgSend(v5, "setResult:", 1);
      v16[0] = CFSTR("ScanResult");
      v16[1] = CFSTR("AirPortModelName");
      v17[0] = v12;
      v17[1] = v14;
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testiOSPersonalHotspotWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 44);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (!v6)
  {
    v11 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
    if (!v11)
      goto LABEL_11;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v8 & 0x8000000000000000) == 0)
  {
    v10 = v9;
    if (v9 - self->_wifiScanTimestamp > (double)v8)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v10;
    }
  }
  v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
  if (v11)
  {
LABEL_8:
    if (objc_msgSend(v11, "isPersonalHotspot"))
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
  }
LABEL_11:
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testPasspointWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 45);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (!v6)
  {
    if (!-[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork"))
      goto LABEL_11;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v8 & 0x8000000000000000) == 0)
  {
    v10 = v9;
    if (v9 - self->_wifiScanTimestamp > (double)v8)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v10;
    }
  }
  if (-[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7))
  {
LABEL_8:
    if (objc_msgSend(-[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork"), "isPasspoint"))objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
  }
LABEL_11:
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (BOOL)__isDefaultCountryCode:(id)a3
{
  if (a3)
    return objc_msgSend(&off_1000E7FB0, "containsObject:", objc_msgSend(a3, "lowercaseString"));
  else
    return 0;
}

- (id)__testConflictingCountryCodeWithConfiguration:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  NSArray *wifiScanResults;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 28);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v21 = v5;
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v9;
    }
  }
  v10 = objc_msgSend(objc_msgSend(-[CWFInterface countryCode](-[W5StatusManager corewifi](self->_status, "corewifi"), "countryCode"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), "lowercaseString");
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  if (!-[W5DiagnosticsManager __isDefaultCountryCode:](self, "__isDefaultCountryCode:", v10))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    wifiScanResults = self->_wifiScanResults;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(wifiScanResults);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v18 = objc_msgSend(objc_msgSend(objc_msgSend(v17, "countryCode"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), "lowercaseString");
          if (v10
            && v18
            && (objc_msgSend(v18, "isEqualToString:", v10) & 1) == 0
            && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
            && (objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }
  }
  v19 = objc_alloc_init((Class)NSMutableDictionary);
  if (v10)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(v10, "copy"), CFSTR("AdoptedCountryCode"));
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v21, "setResult:", 1);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(v11, "copy"), CFSTR("ScanResults"));
  }
  else
  {
    objc_msgSend(v21, "setDidPass:", 1);
  }
  if (objc_msgSend(objc_msgSend(v19, "allKeys"), "count"))
    objc_msgSend(v21, "setInfo:", v19);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v21, "setTestCompleted:");
  return v21;
}

- (id)__testConflictingSecurityTypePNLWithConfiguration:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  W5WiFiInterface *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  NSArray *wifiScanResults;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  _BYTE v45[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 29);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v33 = v5;
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v9;
    }
  }
  v10 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v12 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v13 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v14 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedPNL")), "BOOLValue");
  v15 = -[W5StatusManager wifi](self->_status, "wifi");
  if (v14)
    v16 = v13;
  else
    v16 = 0;
  v17 = -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v15, "cachedPreferredNetworksListWithUUID:", v16);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v22, "ssidString")
          && (!v6 || objc_msgSend(objc_msgSend(v22, "ssidString"), "isEqualToString:", v6)))
        {
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, objc_msgSend(v22, "ssidString"));
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v19);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(wifiScanResults);
        v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
        v29 = objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(v28, "ssidString"));
        if (v29)
        {
          v30 = v29;
          if ((objc_msgSend(v28, "supportsSecurity:", objc_msgSend(v29, "security")) & 1) == 0)
          {
            if ((objc_msgSend(v10, "containsObject:", v28) & 1) == 0)
              objc_msgSend(v10, "addObject:", v28);
            if ((objc_msgSend(v11, "containsObject:", v30) & 1) == 0)
              objc_msgSend(v11, "addObject:", v30);
          }
        }
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v25);
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v33, "setResult:", 1);
    v42[0] = CFSTR("ScanResults");
    v31 = objc_msgSend(v10, "copy");
    v42[1] = CFSTR("PreferredNetworks");
    v43[0] = v31;
    v43[1] = objc_msgSend(v11, "copy");
    objc_msgSend(v33, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
  }
  else
  {
    objc_msgSend(v33, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v33, "setTestCompleted:");
  return v33;
}

- (id)__testCaptivePortalWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v10;
  id v11;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 46);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
    v7 = -[W5DiagnosticsManager __preferredNetworkWithNetworkName:configuration:](self, "__preferredNetworkWithNetworkName:configuration:", v6, a3);
  else
    v7 = -[W5WiFiInterface currentPreferredNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentPreferredNetwork");
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isCaptive"))
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v10 = CFSTR("PreferredNetwork");
    v11 = v8;
    objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testAWDLRealtimeWithConfiguration:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  W5StatusManager *status;
  id v9;
  void *v10;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 22);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v7)
    v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "awdl");
  else
    v9 = -[W5StatusManager awdlStatus](status, "awdlStatus");
  v10 = v9;
  if (objc_msgSend(v9, "awdlStrategy")
    && *((_DWORD *)objc_msgSend(objc_msgSend(v10, "awdlStrategy"), "bytes") + 2) == 9)
  {
    objc_msgSend(v5, "setResult:", 1);
  }
  else
  {
    objc_msgSend(v5, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testAWDLEnabledWithConfiguration:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  W5StatusManager *status;
  id v9;
  void *v10;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 21);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v7)
    v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "awdl");
  else
    v9 = -[W5StatusManager awdlStatus](status, "awdlStatus");
  v10 = v9;
  if (objc_msgSend(v9, "awdlSyncEnabled")
    && *((_DWORD *)objc_msgSend(objc_msgSend(v10, "awdlSyncEnabled"), "bytes") + 2))
  {
    objc_msgSend(v5, "setResult:", 1);
  }
  else
  {
    objc_msgSend(v5, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testBTCoexWithConfiguration:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  W5StatusManager *status;
  id v9;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 20);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v7)
    v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "wifi");
  else
    v9 = -[W5StatusManager wifiStatus](status, "wifiStatus");
  if (objc_msgSend(v9, "btcMode") == 7)
    objc_msgSend(v5, "setResult:", 1);
  else
    objc_msgSend(v5, "setDidPass:", 1);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testHighBTConnectedWithConfiguration:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  W5StatusManager *status;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSNumber *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 19);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v7)
    v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "bluetooth");
  else
    v9 = -[W5StatusManager bluetoothStatus](status, "bluetoothStatus");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "devices", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (!v11)
  {
    v14 = 0;
    v13 = 0;
LABEL_14:
    objc_msgSend(v5, "setDidPass:", 1);
    goto LABEL_15;
  }
  v12 = v11;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      v13 += objc_msgSend(v17, "isConnected");
      v14 += objc_msgSend(v17, "isAppleDevice");
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v12);
  if (v13 < 1)
    goto LABEL_14;
  objc_msgSend(v5, "setResult:", 1);
LABEL_15:
  v24[0] = CFSTR("BTConnectedCount");
  v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13);
  v24[1] = CFSTR("BTAppleDeviceConnectedCount");
  v25[0] = v18;
  v25[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14);
  objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testHighBTPairedWithConfiguration:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  W5StatusManager *status;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  NSNumber *v23;
  _BYTE v24[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 18);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedStatus")), "BOOLValue");
  status = self->_status;
  if (v7)
    v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "bluetooth");
  else
    v9 = -[W5StatusManager bluetoothStatus](status, "bluetoothStatus");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "devices", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (!v11)
  {
    v13 = 0;
LABEL_17:
    objc_msgSend(v5, "setDidPass:", 1);
    goto LABEL_18;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
      if ((objc_msgSend(v16, "isPaired") & 1) != 0 || objc_msgSend(v16, "isCloudPaired"))
        ++v13;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  }
  while (v12);
  if (v13 < 1)
    goto LABEL_17;
  objc_msgSend(v5, "setResult:", 1);
LABEL_18:
  v22 = CFSTR("BTPairedCount");
  v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13);
  objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLargePNLWithConfiguration:(id)a3
{
  id v5;
  id v6;
  W5WiFiInterface *v7;
  id v8;
  id v9;
  const __CFString *v11;
  NSNumber *v12;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 47);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  LODWORD(a3) = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedPNL")), "BOOLValue");
  v7 = -[W5StatusManager wifi](self->_status, "wifi");
  if ((_DWORD)a3)
    v8 = v6;
  else
    v8 = 0;
  v9 = objc_msgSend(-[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v7, "cachedPreferredNetworksListWithUUID:", v8), "count");
  if ((unint64_t)v9 < 0xA)
    objc_msgSend(v5, "setDidPass:", 1);
  else
    objc_msgSend(v5, "setResult:", 1);
  v11 = CFSTR("PNLCount");
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9);
  objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLongBeaconIntervalWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 34);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
  }
  else
  {
    v11 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
  }
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "beaconInterval");
    if (v13 == (id)100)
      objc_msgSend(v5, "setDidPass:", 1);
    else
      objc_msgSend(v5, "setResult:", 1);
    v15[0] = CFSTR("ScanResult");
    v15[1] = CFSTR("BeaconInterval");
    v16[0] = v12;
    v16[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13);
    objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLongDTIMInterval
{
  id v3;
  id v4;
  const __CFString *v6;
  NSNumber *v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 35);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v4 = -[CWFInterface DTIMInterval](-[W5StatusManager corewifi](self->_status, "corewifi"), "DTIMInterval");
    if (v4 == (id)3)
      objc_msgSend(v3, "setDidPass:", 1);
    else
      objc_msgSend(v3, "setResult:", 1);
    v6 = CFSTR("DTIMInterval");
    v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4);
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testConflictingPHYMode11acWithConfiguration:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  NSArray *wifiScanResults;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSNumber *v18;
  NSNumber **v19;
  const __CFString **v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  NSNumber *v28;
  const __CFString *v29;
  NSNumber *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 36);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v9;
    }
  }
  v10 = -[CWFInterface supportedPHYModes](-[W5StatusManager corewifi](self->_status, "corewifi"), "supportedPHYModes");
  if ((v10 & 0x80) != 0)
  {
    objc_msgSend(v5, "setDidPass:", 1);
    v27 = CFSTR("SupportedPHYModes");
    v28 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
    v19 = &v28;
    v20 = &v27;
LABEL_22:
    v21 = 1;
    goto LABEL_23;
  }
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(wifiScanResults);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "supportsPHYMode:", 128)
          && (objc_msgSend(v17, "supportsPHYMode:", 16) & 1) == 0
          && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
          && (objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v14);
  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(v5, "setDidPass:", 1);
    v29 = CFSTR("SupportedPHYModes");
    v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
    v19 = &v30;
    v20 = &v29;
    goto LABEL_22;
  }
  objc_msgSend(v5, "setResult:", 1);
  v31[0] = CFSTR("SupportedPHYModes");
  v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
  v31[1] = CFSTR("ScanResults");
  v32[0] = v18;
  v32[1] = objc_msgSend(v11, "copy");
  v19 = (NSNumber **)v32;
  v20 = (const __CFString **)v31;
  v21 = 2;
LABEL_23:
  objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v20, v21));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testConflictingPHYMode11nWithConfiguration:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  NSArray *wifiScanResults;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSNumber *v18;
  NSNumber **v19;
  const __CFString **v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  NSNumber *v28;
  const __CFString *v29;
  NSNumber *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 37);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v9;
    }
  }
  v10 = -[CWFInterface supportedPHYModes](-[W5StatusManager corewifi](self->_status, "corewifi"), "supportedPHYModes");
  if ((v10 & 0x10) != 0)
  {
    objc_msgSend(v5, "setDidPass:", 1);
    v27 = CFSTR("SupportedPHYModes");
    v28 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
    v19 = &v28;
    v20 = &v27;
LABEL_23:
    v21 = 1;
    goto LABEL_24;
  }
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(wifiScanResults);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "supportsPHYMode:", 16)
          && (objc_msgSend(v17, "supportsPHYMode:", 2) & 1) == 0
          && (objc_msgSend(v17, "supportsPHYMode:", 8) & 1) == 0
          && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
          && (objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v14);
  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(v5, "setDidPass:", 1);
    v29 = CFSTR("SupportedPHYModes");
    v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
    v19 = &v30;
    v20 = &v29;
    goto LABEL_23;
  }
  objc_msgSend(v5, "setResult:", 1);
  v31[0] = CFSTR("SupportedPHYModes");
  v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
  v31[1] = CFSTR("ScanResults");
  v32[0] = v18;
  v32[1] = objc_msgSend(v11, "copy");
  v19 = (NSNumber **)v32;
  v20 = (const __CFString **)v31;
  v21 = 2;
LABEL_24:
  objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v20, v21));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testPoorSignalWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  NSDictionary *v18;
  NSDictionary *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 32);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
        self->_wifiScanTimestamp = v10;
      }
    }
    v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    v12 = (uint64_t)objc_msgSend(v11, "rssi");
    v13 = objc_msgSend(v11, "noise");
    v14 = v13;
    if (v12 < -70 || v12 - (uint64_t)v13 <= 9)
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v23[0] = CFSTR("RSSI");
    v23[1] = CFSTR("Noise");
    v24[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12);
    v24[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14);
    v18 = (NSDictionary *)-[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2), "mutableCopy");
    v19 = v18;
    if (v11)
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v11, CFSTR("ScanResult"));
    goto LABEL_17;
  }
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    v15 = (uint64_t)-[CWFInterface RSSI](-[W5StatusManager corewifi](self->_status, "corewifi"), "RSSI");
    v16 = -[CWFInterface noise](-[W5StatusManager corewifi](self->_status, "corewifi"), "noise");
    v17 = v16;
    if (v15 < -70 || v15 - (uint64_t)v16 <= 9)
      objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v21[0] = CFSTR("RSSI");
    v21[1] = CFSTR("Noise");
    v22[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15);
    v22[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17);
    v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
LABEL_17:
    objc_msgSend(v5, "setInfo:", v19);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testPNLContainsHiddenWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  W5WiFiInterface *v8;
  id v9;
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
  const __CFString *v21;
  id v22;
  _BYTE v23[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 48);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = +[NSMutableArray array](NSMutableArray, "array");
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  LODWORD(a3) = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UseCachedPNL")), "BOOLValue");
  v8 = -[W5StatusManager wifi](self->_status, "wifi");
  if ((_DWORD)a3)
    v9 = v7;
  else
    v9 = 0;
  v10 = -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v8, "cachedPreferredNetworksListWithUUID:", v9);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
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
        if (objc_msgSend(v15, "isHidden"))
          objc_msgSend(v6, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "setResult:", 1);
    v21 = CFSTR("PreferredNetworks");
    v22 = objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  }
  else
  {
    objc_msgSend(v5, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__preferredNetworkWithNetworkName:(id)a3 configuration:(id)a4
{
  id v4;
  id v7;
  W5WiFiInterface *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a4;
  v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  LODWORD(v4) = objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UseCachedPNL")), "BOOLValue");
  v8 = -[W5StatusManager wifi](self->_status, "wifi");
  if ((_DWORD)v4)
    v9 = v7;
  else
    v9 = 0;
  v10 = -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v8, "cachedPreferredNetworksListWithUUID:", v9);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = *(_QWORD *)v18;
LABEL_6:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v13)
      objc_enumerationMutation(v10);
    v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
    if ((objc_msgSend(objc_msgSend(v15, "ssidString"), "isEqualToString:", a3) & 1) != 0)
      return v15;
    if (v12 == (id)++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        goto LABEL_6;
      return 0;
    }
  }
}

- (id)__scanResultWithNetworkName:(id)a3
{
  NSArray *wifiScanResults;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(wifiScanResults);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(objc_msgSend(v10, "ssidString"), "isEqualToString:", a3))
      {
        if (!v7 || (v11 = objc_msgSend(v10, "rssi"), (uint64_t)v11 > (uint64_t)objc_msgSend(v7, "rssi")))
          v7 = v10;
      }
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);
  return v7;
}

- (id)__testHiddenNetworkWithConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 43);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6)
    v7 = -[W5DiagnosticsManager __preferredNetworkWithNetworkName:configuration:](self, "__preferredNetworkWithNetworkName:configuration:", v6, a3);
  else
    v7 = -[W5WiFiInterface currentPreferredNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentPreferredNetwork");
  if (objc_msgSend(v7, "isHidden"))
    objc_msgSend(v5, "setResult:", 1);
  else
    objc_msgSend(v5, "setDidPass:", 1);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testAmbiguousNetworkNameWithConfiguration:(id)a3
{
  id v5;
  id v6;
  const __CFString *v8;
  id v9;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 42);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NetworkName"));
  if (v6
    || (v6 = -[CWFInterface networkName](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkName")) != 0)
  {
    if (objc_msgSend(+[W5DiagnosticsManager __ambiguousSSIDs](W5DiagnosticsManager, "__ambiguousSSIDs"), "containsObject:", v6))objc_msgSend(v5, "setResult:", 1);
    else
      objc_msgSend(v5, "setDidPass:", 1);
    v8 = CFSTR("NetworkName");
    v9 = v6;
    objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testWiFiHiddenScanResultsWithConfiguration:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  NSArray *wifiScanResults;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  id v22;
  _BYTE v23[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 30);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000) == 0)
  {
    v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v8;
    }
  }
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  wifiScanResults = self->_wifiScanResults;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(wifiScanResults);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v15, "ssid"))
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](wifiScanResults, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v5, "setResult:", 1);
    v21 = CFSTR("ScanResults");
    v22 = objc_msgSend(v9, "copy");
    objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  }
  else
  {
    objc_msgSend(v5, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testWiFiNoScanResultsWithConfiguration:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 31);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxScanCacheAge")), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000) == 0)
  {
    v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)-[W5WiFiInterface performScanOnChannels:translate:](-[W5StatusManager wifi](self->_status, "wifi"), "performScanOnChannels:translate:", 0, 1);
      self->_wifiScanTimestamp = v8;
    }
  }
  if (-[NSArray count](self->_wifiScanResults, "count"))
    objc_msgSend(v5, "setDidPass:", 1);
  else
    objc_msgSend(v5, "setResult:", 1);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__downloadSpeedtestWithFileSize:(int)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSError *v13;
  id v14;
  id v15;
  void *v16;
  NSError *v17;
  id v18;
  _QWORD v20[10];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  NSErrorUserInfoKey v45;
  const __CFString *v46;
  __int128 v47;
  uint64_t v48;

  v7 = *(_QWORD *)&a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = sub_100038CDC;
  v39 = sub_100038CEC;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = sub_100038CDC;
  v33 = sub_100038CEC;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (!qword_1000FB6C0)
  {
    v47 = off_1000D68C0;
    v48 = 0;
    qword_1000FB6C0 = _sl_dlopen(&v47, 0);
  }
  if (qword_1000FB6C0)
  {
    v8 = objc_msgSend((id)sub_100041600(), "defaultConfiguration");
    objc_msgSend(v8, "setInterfaceType:", 1);
    objc_msgSend(v8, "setDownloadSize:", v7);
    objc_msgSend(v8, "setCollectMetadata:", 0);
    v9 = objc_msgSend((id)sub_1000416C4(), "performanceTestWithConfiguration:", v8);
    if (v9)
    {
      v10 = objc_alloc_init((Class)NSLock);
      v11 = dispatch_semaphore_create(0);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100041788;
      v20[3] = &unk_1000D67C8;
      v20[6] = &v25;
      v20[7] = &v21;
      v20[8] = &v35;
      v20[9] = &v29;
      v20[4] = v10;
      v20[5] = v11;
      objc_msgSend(v9, "startDownloadWithCompletion:", v20);
      v12 = dispatch_time(0, 1000000000 * a4);
      if (dispatch_semaphore_wait(v11, v12))
      {
        objc_msgSend(v10, "lock");
        if (!*((_BYTE *)v22 + 24))
        {
          *((_BYTE *)v26 + 24) = 1;
          v45 = NSLocalizedFailureReasonErrorKey;
          v46 = CFSTR("W5TimeoutErr");
          v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
          v30[5] = (uint64_t)v13;
        }
        objc_msgSend(v10, "unlock");
      }
      v14 = (id)v30[5];
      v15 = (id)v36[5];
      if (a5)
      {
        v16 = (void *)v30[5];
        if (v16)
        {
          v17 = (NSError *)objc_msgSend(v16, "copy");
LABEL_16:
          *a5 = v17;
        }
      }
    }
    else if (a5)
    {
      v43 = NSLocalizedFailureReasonErrorKey;
      v44 = CFSTR("W5NotSupportedErr");
      v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
      goto LABEL_16;
    }
  }
  else if (a5)
  {
    v41 = NSLocalizedFailureReasonErrorKey;
    v42 = CFSTR("W5NotSupportedErr");
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    goto LABEL_16;
  }
  v18 = objc_msgSend((id)v36[5], "copy");
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

- (id)__uploadSpeedtestWithFileSize:(int)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSError *v13;
  id v14;
  id v15;
  void *v16;
  NSError *v17;
  id v18;
  _QWORD v20[10];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  NSErrorUserInfoKey v45;
  const __CFString *v46;
  __int128 v47;
  uint64_t v48;

  v7 = *(_QWORD *)&a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = sub_100038CDC;
  v39 = sub_100038CEC;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = sub_100038CDC;
  v33 = sub_100038CEC;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (!qword_1000FB6C0)
  {
    v47 = off_1000D68C0;
    v48 = 0;
    qword_1000FB6C0 = _sl_dlopen(&v47, 0);
  }
  if (qword_1000FB6C0)
  {
    v8 = objc_msgSend((id)sub_100041600(), "defaultConfiguration");
    objc_msgSend(v8, "setInterfaceType:", 1);
    objc_msgSend(v8, "setUploadSize:", v7);
    objc_msgSend(v8, "setCollectMetadata:", 0);
    v9 = objc_msgSend((id)sub_1000416C4(), "performanceTestWithConfiguration:", v8);
    if (v9)
    {
      v10 = objc_alloc_init((Class)NSLock);
      v11 = dispatch_semaphore_create(0);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100041C04;
      v20[3] = &unk_1000D67C8;
      v20[6] = &v25;
      v20[7] = &v21;
      v20[8] = &v35;
      v20[9] = &v29;
      v20[4] = v10;
      v20[5] = v11;
      objc_msgSend(v9, "startUploadWithCompletion:", v20);
      v12 = dispatch_time(0, 1000000000 * a4);
      if (dispatch_semaphore_wait(v11, v12))
      {
        objc_msgSend(v10, "lock");
        if (!*((_BYTE *)v22 + 24))
        {
          *((_BYTE *)v26 + 24) = 1;
          v45 = NSLocalizedFailureReasonErrorKey;
          v46 = CFSTR("W5TimeoutErr");
          v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
          v30[5] = (uint64_t)v13;
        }
        objc_msgSend(v10, "unlock");
      }
      v14 = (id)v30[5];
      v15 = (id)v36[5];
      if (a5)
      {
        v16 = (void *)v30[5];
        if (v16)
        {
          v17 = (NSError *)objc_msgSend(v16, "copy");
LABEL_16:
          *a5 = v17;
        }
      }
    }
    else if (a5)
    {
      v43 = NSLocalizedFailureReasonErrorKey;
      v44 = CFSTR("W5NotSupportedErr");
      v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
      goto LABEL_16;
    }
  }
  else if (a5)
  {
    v41 = NSLocalizedFailureReasonErrorKey;
    v42 = CFSTR("W5NotSupportedErr");
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    goto LABEL_16;
  }
  v18 = objc_msgSend((id)v36[5], "copy");
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

- (id)__testDownloadSpeedWithConfiguration:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  uint64_t v16;
  const __CFString *v17;
  NSNumber *v18;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 49);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = (_UNKNOWN **)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SpeedTestFileSizes"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SpeedTestTimeout"));
  if (v7)
    v8 = (uint64_t)objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 5;
  v16 = 0;
  if (!v6)
    v6 = &off_1000E7FC8;
  if (objc_msgSend(v6, "count", v16))
  {
    v9 = 1;
    while (1)
    {
      v10 = -[W5DiagnosticsManager __downloadSpeedtestWithFileSize:timeout:error:](self, "__downloadSpeedtestWithFileSize:timeout:error:", objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v9 - 1), "unsignedIntValue"), v8, &v16);
      if (!v10)
        break;
      v11 = v10;
      v12 = objc_msgSend(v10, "fileSize");
      objc_msgSend(v11, "speed");
      v14 = v13;
      if (v9 < (unint64_t)objc_msgSend(v6, "count"))
      {
        ++v9;
        if ((double)(unint64_t)(8 * (_QWORD)v12) / (v14 * 1000000.0) <= 1.0)
          continue;
      }
      objc_msgSend(v5, "setDidPass:", 1);
      objc_msgSend(v5, "setResult:", 1);
      v17 = CFSTR("Mbps");
      objc_msgSend(v11, "speed");
      v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      break;
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testUploadSpeedWithConfiguration:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  uint64_t v16;
  const __CFString *v17;
  NSNumber *v18;

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 50);
  objc_msgSend(v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v6 = (_UNKNOWN **)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SpeedTestFileSizes"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SpeedTestTimeout"));
  if (v7)
    v8 = (uint64_t)objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 5;
  v16 = 0;
  if (!v6)
    v6 = &off_1000E7FE0;
  if (objc_msgSend(v6, "count", v16))
  {
    v9 = 1;
    while (1)
    {
      v10 = -[W5DiagnosticsManager __uploadSpeedtestWithFileSize:timeout:error:](self, "__uploadSpeedtestWithFileSize:timeout:error:", objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v9 - 1), "unsignedIntValue"), v8, &v16);
      if (!v10)
        break;
      v11 = v10;
      v12 = objc_msgSend(v10, "fileSize");
      objc_msgSend(v11, "speed");
      v14 = v13;
      if (v9 < (unint64_t)objc_msgSend(v6, "count"))
      {
        ++v9;
        if ((double)(unint64_t)(8 * (_QWORD)v12) / (v14 * 1000000.0) <= 1.0)
          continue;
      }
      objc_msgSend(v5, "setDidPass:", 1);
      objc_msgSend(v5, "setResult:", 1);
      v17 = CFSTR("Mbps");
      objc_msgSend(v11, "speed");
      v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      break;
    }
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__testLeakyAP
{
  id v3;
  id v4;
  uint64_t v5;
  const void *v6;
  int IsAPLeaky;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 51);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
  v5 = WiFiNetworkCreate(kCFAllocatorDefault, objc_msgSend(v4, "scanRecord"));
  if (v5
    && (v6 = (const void *)v5, IsAPLeaky = WiFiNetworkIsAPLeaky(v5, objc_msgSend(v4, "bssid")), CFRelease(v6), IsAPLeaky))
  {
    objc_msgSend(v3, "setResult:", 1);
  }
  else
  {
    objc_msgSend(v3, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testWiFiLink
{
  id v3;
  id v4;
  const __CFString *v6;
  id v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 52);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[CWFInterface networkName](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkName");
  if (v4)
  {
    v6 = CFSTR("NetworkName");
    v7 = v4;
    objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    objc_msgSend(v3, "setResult:", 1);
    objc_msgSend(v3, "setDidPass:", 1);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testWiFiIsPrimaryIPv4
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 57);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[CWFInterface globalIPv4InterfaceName](-[W5StatusManager corewifi](self->_status, "corewifi"), "globalIPv4InterfaceName");
  v5 = -[CWFInterface globalIPv4NetworkServiceName](-[W5StatusManager corewifi](self->_status, "corewifi"), "globalIPv4NetworkServiceName");
  v6 = -[CWFInterface globalIPv4NetworkServiceID](-[W5StatusManager corewifi](self->_status, "corewifi"), "globalIPv4NetworkServiceID");
  if (objc_msgSend(-[CWFInterface networkServiceID](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkServiceID"), "isEqualToString:", v6))
  {
    objc_msgSend(v3, "setResult:", 1);
    objc_msgSend(v3, "setDidPass:", 1);
  }
  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("IPv4InterfaceName"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("IPv4ServiceName"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("IPv4ServiceID"));
  objc_msgSend(v3, "setInfo:", v7);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testWiFiIsPrimaryIPv6
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v3, "setTestID:", 58);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestStarted:");
  v4 = -[CWFInterface globalIPv6InterfaceName](-[W5StatusManager corewifi](self->_status, "corewifi"), "globalIPv6InterfaceName");
  v5 = -[CWFInterface globalIPv6NetworkServiceName](-[W5StatusManager corewifi](self->_status, "corewifi"), "globalIPv6NetworkServiceName");
  v6 = -[CWFInterface globalIPv6NetworkServiceID](-[W5StatusManager corewifi](self->_status, "corewifi"), "globalIPv6NetworkServiceID");
  if (objc_msgSend(-[CWFInterface networkServiceID](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkServiceID"), "isEqualToString:", v6))
  {
    objc_msgSend(v3, "setResult:", 1);
    objc_msgSend(v3, "setDidPass:", 1);
  }
  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("IPv6InterfaceName"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("IPv6ServiceName"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("IPv6ServiceID"));
  objc_msgSend(v3, "setInfo:", v7);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTestCompleted:");
  return v3;
}

- (id)__testReachabilityToPeersWithConfiguration:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  char v23;
  char v24;
  void *i;
  id v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  uint64_t v32;
  NSMutableArray *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  NSMutableArray *v39;
  _BYTE v40[128];

  v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  objc_msgSend(v5, "setTestID:", 63);
  v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestStarted:");
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingCount"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTimeout"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingInterval"));
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingWait"));
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingDataLength"));
  if (v7)
  {
    v32 = (uint64_t)objc_msgSend(v7, "integerValue");
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v32 = 1;
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "doubleValue");
      v13 = v12;
      if (v9)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  v13 = 2.0;
  if (v9)
  {
LABEL_4:
    objc_msgSend(v9, "doubleValue");
    v15 = v14;
    if (v10)
      goto LABEL_5;
LABEL_23:
    v17 = 2.0;
    if (!v11)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_22:
  v15 = 0.1;
  if (!v10)
    goto LABEL_23;
LABEL_5:
  objc_msgSend(v10, "doubleValue");
  v17 = v16;
  if (v11)
LABEL_6:
    v11 = objc_msgSend(v11, "unsignedIntegerValue");
LABEL_7:
  v18 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PingTrafficClass"));
  v19 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AddressesToPing"));
  v33 = objc_opt_new(NSMutableArray);
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID")
    && (v36 = 0u,
        v37 = 0u,
        v34 = 0u,
        v35 = 0u,
        (v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v40, 16)) != 0))
  {
    v21 = v20;
    v31 = v5;
    v22 = *(_QWORD *)v35;
    v23 = 1;
    v24 = 1;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v26 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:](self, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), v32, v18, -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), v11, v13, v17, v15);
        objc_msgSend(v26, "packetLoss");
        if (v27 >= 100.0)
        {
          v23 = 0;
          v24 = 0;
        }
        -[NSMutableArray addObject:](v33, "addObject:", v26);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v21);
    v28 = v23 & 1;
    v29 = v24 & 1;
    v5 = v31;
    v6 = &Apple80211BindToInterface_ptr;
  }
  else
  {
    v28 = 1;
    v29 = 1;
  }
  objc_msgSend(v5, "setDidPass:", v28);
  objc_msgSend(v5, "setResult:", v29);
  v38 = CFSTR("PingsReceived");
  v39 = v33;
  objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  objc_msgSend(v6[118], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTestCompleted:");
  return v5;
}

- (id)__orderedChannelWeights:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100042858;
  v4[3] = &unk_1000D67F0;
  v4[4] = a3;
  return objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", v4);
}

- (id)__overlappingChannelsForChannel:(id)a3 supportedChannels:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = +[NSMutableArray array](NSMutableArray, "array");
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = objc_msgSend(a3, "channel");
  if ((objc_msgSend(a3, "flags") & 0x800) != 0)
  {
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 16));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 15));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 14));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 13));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 12));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 11));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 10));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 9));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 8));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 7));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 6));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 5));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 4));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 3));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 2));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 3));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 4));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 5));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 6));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 7));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 8));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 9));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 10));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 11));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 12));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 13));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 14));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 15));
    v11 = (char *)v8 + 16;
  }
  else if ((objc_msgSend(a3, "flags") & 0x400) != 0)
  {
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 8));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 7));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 6));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 5));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 4));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 3));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 2));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 3));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 4));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 5));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 6));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 7));
    v11 = (char *)v8 + 8;
  }
  else
  {
    v9 = objc_msgSend(a3, "flags");
    v10 = (unsigned __int16)objc_msgSend(a3, "flags");
    if ((v9 & 4) != 0)
    {
      v12 = -2;
      if ((v10 & 0x200) != 0)
        v12 = 2;
      v13 = (v12 + 2 * (uint64_t)v8) >> 1;
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 4));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 3));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 2));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 1));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 1));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 2));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 3));
      v11 = (char *)(v13 + 4);
    }
    else
    {
      if ((v10 & 2) == 0)
        goto LABEL_12;
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1));
      v11 = (char *)v8 + 2;
    }
  }
  objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
LABEL_12:
  v14 = +[W5DiagnosticsManager __channelNumbersForWiFiChannels:](W5DiagnosticsManager, "__channelNumbersForWiFiChannels:", a4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v7);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "containsObject:", v19))
          objc_msgSend(v6, "addObject:", v19);
      }
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }
  return objc_msgSend(v6, "copy");
}

+ (id)__channelNumbersForWiFiChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "channel")));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__only5GHzNonDFSChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "flags") & 0x10) != 0
          && (objc_msgSend(v9, "flags") & 0x100) == 0)
        {
          objc_msgSend(v4, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__only2GHzChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "flags") & 8) != 0 && (objc_msgSend(v9, "flags") & 2) != 0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__only5GHzChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "flags") & 0x10) != 0 && (objc_msgSend(v9, "flags") & 2) != 0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__only2GHz_1_6_11_14_Channels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "flags") & 8) != 0
          && (objc_msgSend(v9, "flags") & 2) != 0
          && (objc_msgSend(v9, "channel") == (id)1
           || objc_msgSend(v9, "channel") == (id)6
           || objc_msgSend(v9, "channel") == (id)11
           || objc_msgSend(v9, "channel") == (id)14))
        {
          objc_msgSend(v4, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__only5GHz20MHz40MHzChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "flags") & 0x10) != 0
          && ((objc_msgSend(v9, "flags") & 2) != 0 || (objc_msgSend(v9, "flags") & 4) != 0))
        {
          objc_msgSend(v4, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__only5GHz40MHzChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "flags") & 0x10) != 0 && (objc_msgSend(v9, "flags") & 4) != 0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__filteredChannelWeights:(id)a3 channels:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a3, "allKeys", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(a4, "containsObject:", v12))
          objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v12), v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return objc_msgSend(v6, "copy");
}

- (id)__adjust5GHzWeights:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "allKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "flags") & 0x100) != 0)
          v11 = 0.1;
        else
          v11 = 0.0;
        if ((objc_msgSend(v10, "flags") & 4) != 0)
          v11 = v11 + -0.1;
        if ((uint64_t)objc_msgSend(v10, "channel") > 48)
          v11 = v11 + -0.1;
        if ((uint64_t)objc_msgSend(v10, "channel") > 148)
          v11 = v11 + -0.1;
        objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", v10), "floatValue");
        objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 + v12), v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  return objc_msgSend(v4, "copy");
}

- (id)__applyChannelWeights:(id)a3 supportedChannels:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  float v15;
  float v16;
  void *j;
  float v18;
  double v19;
  NSNumber *v20;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v23 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(a4);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = -[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:](self, "__overlappingChannelsForChannel:supportedChannels:", v10, a4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          v15 = 0.0;
          v16 = 0.0;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v15 = v15 + 1.0;
              objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j)), "floatValue");
              v16 = v16 + v18;
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
          v20 = (NSNumber *)&off_1000E8918;
          if (v16 > 0.0)
          {
            *(float *)&v19 = v16 / v15;
            v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", &off_1000E8918, v19);
          }
        }
        else
        {
          v20 = (NSNumber *)&off_1000E8918;
        }
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v10);
      }
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  return objc_msgSend(v23, "copy");
}

- (id)__channelWeightsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  id v21;
  float v22;
  float v23;
  float v24;
  double v25;
  uint64_t v29;
  id v31;
  uint64_t v32;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v7 = +[W5DiagnosticsManager __channelNumbersForWiFiChannels:](W5DiagnosticsManager, "__channelNumbersForWiFiChannels:", a4);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1000E3078, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v9);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(a3);
        v32 = v12;
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
        if ((uint64_t)objc_msgSend(v13, "rssi") >= a5)
        {
          v14 = -[W5DiagnosticsManager __channelWeightsForChannel:](self, "__channelWeightsForChannel:", objc_msgSend(v13, "channel"));
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v15 = objc_msgSend(v14, "allKeys");
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v34 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
                v21 = objc_msgSend(v14, "objectForKeyedSubscript:", v20);
                objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", v20), "floatValue");
                v23 = v22;
                objc_msgSend(v21, "floatValue");
                *(float *)&v25 = v23 + v24;
                objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25), v20);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
            }
            while (v17);
          }
        }
        v12 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      v31 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v31);
  }
  return -[W5DiagnosticsManager __filteredChannelWeights:channels:](self, "__filteredChannelWeights:channels:", v6, v7);
}

- (id)__occupiedChannelsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5 ignoreChannel:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v10 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(a3);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((uint64_t)objc_msgSend(v15, "rssi") >= a5)
        {
          v16 = objc_msgSend(a6, "channel");
          if (v16 != objc_msgSend(objc_msgSend(v15, "channel"), "channel"))
            objc_msgSend(v10, "addObjectsFromArray:", -[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:](self, "__overlappingChannelsForChannel:supportedChannels:", objc_msgSend(v15, "channel"), a4));
        }
      }
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  return objc_msgSend(objc_msgSend(v10, "array"), "copy");
}

- (id)__channelWeightsForChannel:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  unsigned __int16 v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v5 = objc_msgSend(a3, "channel");
  if ((objc_msgSend(a3, "flags") & 0x800) != 0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2EB0, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 16));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 15));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 14));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 13));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 12));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 11));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 10));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 9));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 8));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 7));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 6));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 4));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 4));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 6));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 7));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 8));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 9));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 10));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 11));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 12));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 13));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 14));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 15));
    v8 = (char *)v5 - 16;
    goto LABEL_11;
  }
  if ((objc_msgSend(a3, "flags") & 0x400) != 0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2EB0, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 8));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 7));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 6));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 4));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 4));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 6));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 7));
    v8 = (char *)v5 - 8;
    goto LABEL_11;
  }
  v6 = objc_msgSend(a3, "flags");
  v7 = (unsigned __int16)objc_msgSend(a3, "flags");
  if ((v6 & 4) != 0)
  {
    v9 = -2;
    if ((v7 & 0x200) != 0)
      v9 = 2;
    v10 = (v9 + 2 * (uint64_t)v5) >> 1;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2EB0, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 4));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 - 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 - 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 - 3));
    v8 = (char *)(v10 - 4);
    goto LABEL_11;
  }
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2EB0, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2F28, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 1));
    v8 = (char *)v5 - 2;
LABEL_11:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000E2EB0, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
  }
  return objc_msgSend(v4, "copy");
}

+ (id)__ambiguousSSIDs
{
  if (qword_1000FB6E0 != -1)
    dispatch_once(&qword_1000FB6E0, &stru_1000D6810);
  return (id)qword_1000FB6D8;
}

- (BOOL)__isUsingCustomProxySettings:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "count") != (id)2)
    return objc_msgSend(a3, "count") != 0;
  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", kSCPropNetProxiesExceptionsList);
  if (objc_msgSend(v4, "count") == (id)2
    && objc_msgSend(v4, "containsObject:", CFSTR("*.local"))
    && objc_msgSend(v4, "containsObject:", CFSTR("169.254/16")))
  {
    return objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", kSCPropNetProxiesFTPPassive), "BOOLValue") ^ 1;
  }
  else
  {
    return 1;
  }
}

- (int64_t)__ipv6ConfigMethodForDescription:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv6ConfigMethodAutomatic) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv6ConfigMethodLinkLocal) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv6ConfigMethodManual) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv6ConfigMethodRouterAdvertisement) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", kSCValNetIPv6ConfigMethod6to4))
    return 5;
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)__ipv4ConfigMethodForDescription:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodAutomatic) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodLinkLocal) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodDHCP) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodManual) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodBOOTP) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodINFORM) & 1) != 0)
    return 6;
  if (objc_msgSend(a3, "isEqualToString:", kSCValNetIPv4ConfigMethodPPP))
    return 7;
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)__runDiagnosticsTest:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSObject *v9;
  NSString *v10;
  id v11;
  NSObject *v12;
  NSString *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;

  v5 = W5DescriptionForDiagnosticsTestID(objc_msgSend(a3, "testID"));
  if (-[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%ld"), CFSTR("wifivelocity-exclude-test"), objc_msgSend(a3, "testID")))|| -[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@='%@'"), CFSTR("wifivelocity-exclude-test"), v5)))
  {
    v6 = sub_10008F56C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543618;
      v23 = v5;
      v24 = 2048;
      v25 = objc_msgSend(a3, "testID");
      LODWORD(v21) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] EXCLUDING [%{public}@] (testID=%ld) via boot-arg!!!", &v22, v21);
    }
    return 0;
  }
  else
  {
    v9 = sub_10008F56C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date"));
      v22 = 138543874;
      v23 = (uint64_t)v10;
      v24 = 2114;
      v25 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString"), "substringToIndex:", 5);
      v26 = 2114;
      v27 = v5;
      LODWORD(v21) = 32;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %{public}@ [%{public}@] BEGIN   %{public}@", &v22, v21);
    }
    switch((unint64_t)objc_msgSend(a3, "testID"))
    {
      case 1uLL:
        v11 = -[W5DiagnosticsManager __testPingLANWithConfiguration:](self, "__testPingLANWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 2uLL:
        v11 = -[W5DiagnosticsManager __testPingLANUsingIMFoundation](self, "__testPingLANUsingIMFoundation");
        goto LABEL_75;
      case 3uLL:
        v11 = -[W5DiagnosticsManager __testPingLANUsingCFNetworkWithConfiguration:](self, "__testPingLANUsingCFNetworkWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 4uLL:
        v11 = -[W5DiagnosticsManager __testPingWANWithConfiguration:](self, "__testPingWANWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 5uLL:
        v11 = -[W5DiagnosticsManager __testPingWANUsingIMFoundation](self, "__testPingWANUsingIMFoundation");
        goto LABEL_75;
      case 6uLL:
        v11 = -[W5DiagnosticsManager __testPingWANUsingCFNetworkWithConfiguration:](self, "__testPingWANUsingCFNetworkWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 7uLL:
        v11 = -[W5DiagnosticsManager __testResolveDNS](self, "__testResolveDNS");
        goto LABEL_75;
      case 8uLL:
        v11 = -[W5DiagnosticsManager __testDetectDoubleNAT](self, "__testDetectDoubleNAT");
        goto LABEL_75;
      case 9uLL:
        v11 = -[W5DiagnosticsManager __testReachApple](self, "__testReachApple");
        goto LABEL_75;
      case 0xAuLL:
        v11 = -[W5DiagnosticsManager __testRetrieveApple](self, "__testRetrieveApple");
        goto LABEL_75;
      case 0xBuLL:
        v11 = -[W5DiagnosticsManager __testRetrieveAppleForceWiFiWithConfiguration:](self, "__testRetrieveAppleForceWiFiWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0xCuLL:
        v11 = -[W5DiagnosticsManager __testIPv4Assigned](self, "__testIPv4Assigned");
        goto LABEL_75;
      case 0xDuLL:
        v11 = -[W5DiagnosticsManager __testIPv6Assigned](self, "__testIPv6Assigned");
        goto LABEL_75;
      case 0xEuLL:
        v11 = -[W5DiagnosticsManager __testCustomIPv4](self, "__testCustomIPv4");
        goto LABEL_75;
      case 0xFuLL:
        v11 = -[W5DiagnosticsManager __testCustomIPv6](self, "__testCustomIPv6");
        goto LABEL_75;
      case 0x10uLL:
        v11 = -[W5DiagnosticsManager __testCustomDNS](self, "__testCustomDNS");
        goto LABEL_75;
      case 0x11uLL:
        v11 = -[W5DiagnosticsManager __testCustomWebProxy](self, "__testCustomWebProxy");
        goto LABEL_75;
      case 0x12uLL:
        v11 = -[W5DiagnosticsManager __testHighBTPairedWithConfiguration:](self, "__testHighBTPairedWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x13uLL:
        v11 = -[W5DiagnosticsManager __testHighBTConnectedWithConfiguration:](self, "__testHighBTConnectedWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x14uLL:
        v11 = -[W5DiagnosticsManager __testBTCoexWithConfiguration:](self, "__testBTCoexWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x15uLL:
        v11 = -[W5DiagnosticsManager __testAWDLEnabledWithConfiguration:](self, "__testAWDLEnabledWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x16uLL:
        v11 = -[W5DiagnosticsManager __testAWDLRealtimeWithConfiguration:](self, "__testAWDLRealtimeWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x17uLL:
        v11 = -[W5DiagnosticsManager __testCongestedChannelUsingCCAWithConfiguration:](self, "__testCongestedChannelUsingCCAWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x18uLL:
        v11 = -[W5DiagnosticsManager __testCongestedChannelWithConfiguration:](self, "__testCongestedChannelWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x19uLL:
        v11 = -[W5DiagnosticsManager __testCongested2GHzWithConfiguration:](self, "__testCongested2GHzWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x1AuLL:
        v11 = -[W5DiagnosticsManager __testCongested5GHzWithConfiguration:](self, "__testCongested5GHzWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x1BuLL:
        v11 = -[W5DiagnosticsManager __testHT402GHzWithConfiguration:](self, "__testHT402GHzWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x1CuLL:
        v11 = -[W5DiagnosticsManager __testConflictingCountryCodeWithConfiguration:](self, "__testConflictingCountryCodeWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x1DuLL:
        v11 = -[W5DiagnosticsManager __testConflictingSecurityTypePNLWithConfiguration:](self, "__testConflictingSecurityTypePNLWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x1EuLL:
        v11 = -[W5DiagnosticsManager __testWiFiHiddenScanResultsWithConfiguration:](self, "__testWiFiHiddenScanResultsWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x1FuLL:
        v11 = -[W5DiagnosticsManager __testWiFiNoScanResultsWithConfiguration:](self, "__testWiFiNoScanResultsWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x20uLL:
        v11 = -[W5DiagnosticsManager __testPoorSignalWithConfiguration:](self, "__testPoorSignalWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x21uLL:
        v11 = -[W5DiagnosticsManager __testAirPortBaseStationWithConfiguration:](self, "__testAirPortBaseStationWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x22uLL:
        v11 = -[W5DiagnosticsManager __testLongBeaconIntervalWithConfiguration:](self, "__testLongBeaconIntervalWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x23uLL:
        v11 = -[W5DiagnosticsManager __testLongDTIMInterval](self, "__testLongDTIMInterval");
        goto LABEL_75;
      case 0x24uLL:
        v11 = -[W5DiagnosticsManager __testConflictingPHYMode11acWithConfiguration:](self, "__testConflictingPHYMode11acWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x25uLL:
        v11 = -[W5DiagnosticsManager __testConflictingPHYMode11nWithConfiguration:](self, "__testConflictingPHYMode11nWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x26uLL:
        v11 = -[W5DiagnosticsManager __testNoSecurityWithConfiguration:](self, "__testNoSecurityWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x27uLL:
        v11 = -[W5DiagnosticsManager __testLegacySecurityWEPWithConfiguration:](self, "__testLegacySecurityWEPWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x28uLL:
        v11 = -[W5DiagnosticsManager __testLegacySecurityWPAWithConfiguration:](self, "__testLegacySecurityWPAWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x29uLL:
        v11 = -[W5DiagnosticsManager __testLegacyRates11bWithConfiguration:](self, "__testLegacyRates11bWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x2AuLL:
        v11 = -[W5DiagnosticsManager __testAmbiguousNetworkNameWithConfiguration:](self, "__testAmbiguousNetworkNameWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x2BuLL:
        v11 = -[W5DiagnosticsManager __testHiddenNetworkWithConfiguration:](self, "__testHiddenNetworkWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x2CuLL:
        v11 = -[W5DiagnosticsManager __testiOSPersonalHotspotWithConfiguration:](self, "__testiOSPersonalHotspotWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x2DuLL:
        v11 = -[W5DiagnosticsManager __testPasspointWithConfiguration:](self, "__testPasspointWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x2EuLL:
        v11 = -[W5DiagnosticsManager __testCaptivePortalWithConfiguration:](self, "__testCaptivePortalWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x2FuLL:
        v11 = -[W5DiagnosticsManager __testLargePNLWithConfiguration:](self, "__testLargePNLWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x30uLL:
        v11 = -[W5DiagnosticsManager __testPNLContainsHiddenWithConfiguration:](self, "__testPNLContainsHiddenWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x31uLL:
        v11 = -[W5DiagnosticsManager __testDownloadSpeedWithConfiguration:](self, "__testDownloadSpeedWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x32uLL:
        v11 = -[W5DiagnosticsManager __testUploadSpeedWithConfiguration:](self, "__testUploadSpeedWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x33uLL:
        v11 = -[W5DiagnosticsManager __testLeakyAP](self, "__testLeakyAP");
        goto LABEL_75;
      case 0x34uLL:
        v11 = -[W5DiagnosticsManager __testWiFiLink](self, "__testWiFiLink");
        goto LABEL_75;
      case 0x35uLL:
        v11 = -[W5DiagnosticsManager __testConcurrentWithConfiguration:](self, "__testConcurrentWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x36uLL:
        v11 = -[W5DiagnosticsManager __testCurlApple](self, "__testCurlApple");
        goto LABEL_75;
      case 0x37uLL:
        v7 = objc_alloc_init((Class)W5DiagnosticsTestResult);
        objc_msgSend(v7, "setTestID:", objc_msgSend(a3, "testID"));
        objc_msgSend(v7, "setDidPass:", 1);
        objc_msgSend(v7, "setResult:", 1);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v7, "setTestStarted:");
        -[W5DiagnosticsManager beginWiFiDefaultRoute](self, "beginWiFiDefaultRoute");
        goto LABEL_70;
      case 0x38uLL:
        v7 = objc_alloc_init((Class)W5DiagnosticsTestResult);
        objc_msgSend(v7, "setTestID:", objc_msgSend(a3, "testID"));
        objc_msgSend(v7, "setDidPass:", 1);
        objc_msgSend(v7, "setResult:", 1);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v7, "setTestStarted:");
        -[W5DiagnosticsManager endWiFiDefaultRoute](self, "endWiFiDefaultRoute");
LABEL_70:
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v7, "setTestCompleted:");
        break;
      case 0x39uLL:
        v11 = -[W5DiagnosticsManager __testWiFiIsPrimaryIPv4](self, "__testWiFiIsPrimaryIPv4");
        goto LABEL_75;
      case 0x3AuLL:
        v11 = -[W5DiagnosticsManager __testWiFiIsPrimaryIPv6](self, "__testWiFiIsPrimaryIPv6");
        goto LABEL_75;
      case 0x3BuLL:
        v11 = -[W5DiagnosticsManager __testPing6AWDLWithConfiguration:](self, "__testPing6AWDLWithConfiguration:", objc_msgSend(a3, "configuration"));
        goto LABEL_75;
      case 0x3CuLL:
        v11 = -[W5DiagnosticsManager __testPeerDiagnostics](self, "__testPeerDiagnostics");
        goto LABEL_75;
      case 0x3DuLL:
        v11 = -[W5DiagnosticsManager __testPeerTypes](self, "__testPeerTypes");
        goto LABEL_75;
      case 0x3EuLL:
        v11 = -[W5DiagnosticsManager __testDiscoverPeerTypes](self, "__testDiscoverPeerTypes");
        goto LABEL_75;
      case 0x3FuLL:
        v11 = -[W5DiagnosticsManager __testReachabilityToPeersWithConfiguration:](self, "__testReachabilityToPeersWithConfiguration:", objc_msgSend(a3, "configuration"));
LABEL_75:
        v7 = v11;
        break;
      default:
        v7 = 0;
        break;
    }
    v12 = sub_10008F56C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date"));
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString"), "substringToIndex:", 5);
      objc_msgSend(v7, "testCompleted");
      v16 = v15;
      objc_msgSend(v7, "testStarted");
      v18 = v16 - v17;
      v19 = objc_msgSend(v7, "result");
      v20 = objc_msgSend(v7, "didPass");
      v22 = 138544642;
      v23 = (uint64_t)v13;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v5;
      v28 = 2048;
      v29 = v18;
      v30 = 1024;
      v31 = v19;
      v32 = 1024;
      v33 = v20;
      LODWORD(v21) = 54;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %{public}@ [%{public}@] END     %{public}@, took %.6fs, result=%d, didPass=%d", &v22, v21);
    }
  }
  return v7;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a3)
  {
    if (a4)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a3, 4);
      if (v5)
      {
        v6 = objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v15;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v15 != v9)
                objc_enumerationMutation(v6);
              v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              if (objc_msgSend(v11, "containsObject:", CFSTR("loss"))
                && (unint64_t)objc_msgSend(v11, "count") >= 7)
              {
                v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", 6);
                objc_msgSend(objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1), "doubleValue");
                objc_msgSend(a4, "setPacketLoss:");
              }
              else if (objc_msgSend(v11, "containsObject:", CFSTR("round-trip"))
                     && (unint64_t)objc_msgSend(v11, "count") >= 4)
              {
                v13 = objc_msgSend(objc_msgSend(v11, "objectAtIndexedSubscript:", 3), "componentsSeparatedByString:", CFSTR("/"));
                if ((unint64_t)objc_msgSend(v13, "count") >= 4)
                {
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "doubleValue");
                  objc_msgSend(a4, "setMin:");
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "doubleValue");
                  objc_msgSend(a4, "setAvg:");
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 2), "doubleValue");
                  objc_msgSend(a4, "setMax:");
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 3), "doubleValue");
                  objc_msgSend(a4, "setStddev:");
                }
              }
              v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v8);
        }
      }
    }
  }
}

+ (BOOL)__detectLocalIPv4Address:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  return (unint64_t)objc_msgSend(v3, "count") >= 2
      && (objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)10
       || objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)172
       && objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "integerValue") == (id)16
       || objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)192
       && objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "integerValue") == (id)168);
}

+ (BOOL)__isDoubleNATWithTracerouteOutput:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t v10;
  char *v11;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (unint64_t)objc_msgSend(v9, "rangeOfString:", CFSTR("("));
        v11 = (char *)objc_msgSend(v9, "rangeOfString:", CFSTR(")"));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11 != (char *)0x7FFFFFFFFFFFFFFFLL)
          v6 += objc_msgSend(a1, "__detectLocalIPv4Address:", objc_msgSend(v9, "substringWithRange:", v10 + 1, &v11[~v10]));
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  return v6 > 1;
}

- (id)__performTracerouteWithAddress:(id)a3 maxTTL:(int64_t)a4 waittime:(int64_t)a5 queries:(int64_t)a6
{
  id result;
  NSArray *v7;
  NSMutableData *v8;
  _QWORD v9[10];

  result = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi", a3, a4, a5, a6), "interfaceName");
  if (result)
  {
    v9[0] = CFSTR("-n");
    v9[1] = CFSTR("-m");
    v9[2] = CFSTR("6");
    v9[3] = CFSTR("-i");
    v9[4] = result;
    v9[5] = CFSTR("-w");
    v9[6] = CFSTR("2");
    v9[7] = CFSTR("-q");
    v9[8] = CFSTR("1");
    v9[9] = CFSTR("captive.apple.com");
    v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 10);
    v8 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
    if (+[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/usr/sbin/traceroute"), v7, v8, 0))
    {
      return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)__performPingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
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
  v21 = sub_100038CDC;
  v22 = sub_100038CEC;
  v23 = 0;
  if (!qword_1000FB6E8)
  {
    *(_OWORD *)buf = off_1000D68D8;
    v28 = 0;
    qword_1000FB6E8 = _sl_dlopen(buf, 0);
  }
  if (a4 <= 2147483646 && a3 && qword_1000FB6E8)
  {
    v7 = dispatch_semaphore_create(0);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v9 = v8;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v28 = 0x3052000000;
    v29 = sub_100038CDC;
    v30 = sub_100038CEC;
    v10 = (objc_class *)qword_1000FB6F0;
    v31 = qword_1000FB6F0;
    if (!qword_1000FB6F0)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100047548;
      v24[3] = &unk_1000D5380;
      v24[4] = buf;
      sub_100047548((uint64_t)v24);
      v10 = *(objc_class **)(*(_QWORD *)&buf[8] + 40);
    }
    _Block_object_dispose(buf, 8);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100045E54;
    v17[3] = &unk_1000D6838;
    v17[4] = a3;
    v17[5] = self;
    v17[8] = v9;
    v17[6] = v7;
    v17[7] = &v18;
    objc_msgSend(objc_msgSend([v10 alloc], "initWithAddress:wifi:", a3, 1), "startWithTimeout:queue:completionHandler:", dispatch_get_global_queue(0, 0), v17, (double)a4);
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

- (id)__performPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10
{
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSArray *v25;
  double v26;
  double v27;
  NSMutableData *v28;
  id v29;
  id v30;
  void (**pingCallback)(id, id);
  const __CFString *v34;
  id v35;
  _QWORD v36[13];
  _QWORD v37[15];

  if (a5 >= 2147483650.0 || a4 > 2147483646 || a3 == 0 || a9 == 0)
    return 0;
  if (a8 && (v21 = W5DescriptionForPingTrafficClass(objc_msgSend(a8, "integerValue"))) != 0)
  {
    v22 = v21;
    v37[0] = CFSTR("-c");
    v37[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4);
    v37[2] = CFSTR("-b");
    v37[3] = a9;
    v37[4] = CFSTR("-k");
    v37[5] = v22;
    v37[6] = CFSTR("-i");
    v37[7] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&a7);
    v37[8] = CFSTR("-t");
    v37[9] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a5);
    v37[10] = CFSTR("-W");
    v37[11] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)(a6 * 1000.0));
    v37[12] = CFSTR("-s");
    v37[13] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a10 + 56);
    v37[14] = a3;
    v23 = v37;
    v24 = 15;
  }
  else
  {
    v36[0] = CFSTR("-c");
    v36[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a4);
    v36[2] = CFSTR("-b");
    v36[3] = a9;
    v36[4] = CFSTR("-i");
    v36[5] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&a7);
    v36[6] = CFSTR("-t");
    v36[7] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a5);
    v36[8] = CFSTR("-W");
    v36[9] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)(a6 * 1000.0));
    v36[10] = CFSTR("-s");
    v36[11] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a10 + 56);
    v36[12] = a3;
    v23 = v36;
    v24 = 13;
  }
  v25 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, v24);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v27 = v26;
  v28 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
  +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/sbin/ping"), v25, v28, 0);
  v29 = objc_alloc_init((Class)W5PingResult);
  objc_msgSend(v29, "setInterfaceName:", a9);
  objc_msgSend(v29, "setAddress:", a3);
  objc_msgSend(v29, "setCount:", a4);
  objc_msgSend(v29, "setTimeout:", a5);
  objc_msgSend(v29, "setWait:", a6);
  objc_msgSend(v29, "setInterval:", a7);
  objc_msgSend(v29, "setTrafficClass:", objc_msgSend(a8, "integerValue"));
  objc_msgSend(v29, "setDataLength:", a10);
  objc_msgSend(v29, "setStartedAt:", v27);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v29, "setEndedAt:");
  objc_msgSend(v29, "setCommand:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/sbin/ping %@"), -[NSArray componentsJoinedByString:](v25, "componentsJoinedByString:", CFSTR(" "))));
  objc_msgSend(v29, "setOutput:", objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v28, 4));
  +[W5DiagnosticsManager __parsePingOutput:result:](W5DiagnosticsManager, "__parsePingOutput:result:", v28, v29);
  if (v29)
  {
    v30 = objc_alloc_init((Class)W5Event);
    objc_msgSend(v30, "setEventID:", 34);
    objc_msgSend(v29, "endedAt");
    objc_msgSend(v30, "setTimestamp:");
    v34 = CFSTR("PingResult");
    v35 = v29;
    objc_msgSend(v30, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    pingCallback = (void (**)(id, id))self->_pingCallback;
    if (pingCallback)
      pingCallback[2](pingCallback, v30);
  }
  return v29;
}

- (id)__performPing6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8
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
    +[W5DiagnosticsManager __parsePingOutput:result:](W5DiagnosticsManager, "__parsePingOutput:result:", v22, v8);
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

- (id)__performCFPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 trafficClass:(id)a6 networkServiceType:(id)a7 dataLength:(unint64_t)a8
{
  id v8;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  uint64_t v37;
  double v38;
  void *i;
  double v40;
  double v41;
  id v42;
  id v43;
  void (**pingCallback)(id, id);
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CFTypeRef cf;
  const __CFString *v57;
  id v58;
  _BYTE v59[128];
  _QWORD v60[3];
  _QWORD v61[3];

  v8 = 0;
  if (a3 && a4 <= 2147483646 && a5 < 2147483650.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v14 = v13;
    v15 = +[NSMutableArray array](NSMutableArray, "array");
    v16 = 0.0;
    v17 = 0.0;
    v47 = a4;
    if (a4 >= 1)
    {
      v18 = kCFNetDiagnosticPingOptionTimeout;
      v19 = kCFNetDiagnosticPingOptionPacketCount;
      v20 = kCFNetDiagnosticPingOptionDataLength;
      v49 = kCFNetDiagnosticPingOptionTrafficClass;
      v48 = kCFNetDiagnosticPingOptionTypeOfService;
      v21 = v47;
      do
      {
        v60[0] = v18;
        v61[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5);
        v61[1] = &off_1000E2EB0;
        v60[1] = v19;
        v60[2] = v20;
        v61[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a8);
        v22 = -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 3), "mutableCopy");
        v23 = v22;
        if (a6)
          objc_msgSend(v22, "setObject:forKeyedSubscript:", a6, v49);
        if (a7)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", a7, v48);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        v25 = v24;
        cf = 0;
        v26 = CFNetDiagnosticPingWithOptions(a3, v23, &cf);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        if (v26)
        {
          v17 = v17 + 1.0;
          objc_msgSend(v15, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v27 - v25) * 1000.0));
        }
        if (cf)
          CFRelease(cf);
        --v21;
      }
      while (v21);
    }
    v28 = 0.0;
    v29 = 0.0;
    if (objc_msgSend(v15, "count"))
    {
      v30 = 0;
      v16 = 0.0;
      do
      {
        objc_msgSend(objc_msgSend(v15, "objectAtIndexedSubscript:", v30), "doubleValue");
        v29 = v29 + v31;
        if (v31 <= v16)
          v32 = v16;
        else
          v32 = v31;
        if (v31 < v28)
          v33 = v31;
        else
          v33 = v28;
        if (v30)
          v16 = v32;
        else
          v16 = v31;
        if (v30)
          v28 = v33;
        else
          v28 = v31;
        ++v30;
      }
      while (v30 < (unint64_t)objc_msgSend(v15, "count"));
    }
    v52 = 0u;
    v53 = 0u;
    v34 = v29 / (double)(unint64_t)objc_msgSend(v15, "count");
    v54 = 0u;
    v55 = 0u;
    v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v53;
      v38 = 0.0;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), "doubleValue");
          v38 = v38 + (v40 - v34) * (v40 - v34);
        }
        v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v36);
    }
    else
    {
      v38 = 0.0;
    }
    v41 = sqrt(v38 / (double)(unint64_t)objc_msgSend(v15, "count"));
    v8 = objc_alloc_init((Class)W5PingResult);
    objc_msgSend(v8, "setInterfaceName:", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"));
    objc_msgSend(v8, "setAddress:", a3);
    objc_msgSend(v8, "setCount:", v47);
    objc_msgSend(v8, "setTimeout:", a5);
    objc_msgSend(v8, "setWait:", 1.0);
    objc_msgSend(v8, "setInterval:", 1.0);
    objc_msgSend(v8, "setTrafficClass:", objc_msgSend(a6, "integerValue"));
    objc_msgSend(v8, "setDataLength:", a8);
    objc_msgSend(v8, "setMin:", v28);
    objc_msgSend(v8, "setMax:", v16);
    objc_msgSend(v8, "setAvg:", v34);
    objc_msgSend(v8, "setStddev:", v41);
    objc_msgSend(v8, "setPacketLoss:", ((double)v47 - v17) / (double)v47);
    objc_msgSend(v8, "setStartedAt:", v14);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setEndedAt:");
    v42 = v8;
    if (v8)
    {
      v43 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v43, "setEventID:", 34);
      objc_msgSend(v8, "endedAt");
      objc_msgSend(v43, "setTimestamp:");
      v57 = CFSTR("PingResult");
      v58 = v8;
      objc_msgSend(v43, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback)
        pingCallback[2](pingCallback, v43);
    }
  }
  return v8;
}

- (BOOL)__performCurlWithAddress:(id)a3
{
  NSString *v4;
  _BOOL4 v5;
  NSArray *v6;
  NSMutableData *v7;
  id v9;

  v4 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  LOBYTE(v5) = 0;
  if (a3)
  {
    if (v4)
    {
      v9 = a3;
      v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1);
      v7 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
      v5 = +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", CFSTR("/usr/local/bin/curl"), v6, v7, 0, 0, 0, 1.6, 0);
      if (v5)
        LOBYTE(v5) = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4), "length") != 0;
    }
  }
  return v5;
}

+ (id)__performDNSResolution:(id)a3
{
  __CFHost *v3;
  __CFHost *v4;
  int started;
  dispatch_time_t v6;
  NSObject *global_queue;
  const __CFArray *Addressing;
  const __CFArray *v9;
  _QWORD block[5];

  v3 = CFHostCreateWithName(kCFAllocatorDefault, (CFStringRef)a3);
  if (!v3)
    return 0;
  v4 = v3;
  started = CFHostStartInfoResolution(v3, kCFHostAddresses, 0);
  CFRetain(v4);
  v6 = dispatch_time(0, 1600000);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046ED0;
  block[3] = &unk_1000D6858;
  block[4] = v4;
  dispatch_after(v6, global_queue, block);
  if (!started)
    goto LABEL_8;
  Addressing = CFHostGetAddressing(v4, 0);
  v9 = Addressing;
  if (Addressing)
  {
    if (CFArrayGetCount(Addressing))
    {
      v9 = (const __CFArray *)-[__CFArray copy](v9, "copy");
      goto LABEL_6;
    }
LABEL_8:
    v9 = 0;
  }
LABEL_6:
  CFRelease(v4);
  return v9;
}

+ (id)__networkServiceOrder
{
  const __SCPreferences *v2;
  const __SCPreferences *v3;
  const __SCNetworkSet *v4;
  const __SCNetworkSet *v5;
  const __CFArray *ServiceOrder;
  const __CFArray *v7;

  v2 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("wifivelocityd"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = SCNetworkSetCopyCurrent(v2);
  if (v4)
  {
    v5 = v4;
    ServiceOrder = SCNetworkSetGetServiceOrder(v4);
    v7 = ServiceOrder;
    if (ServiceOrder)
    {
      if (CFArrayGetCount(ServiceOrder))
        v7 = (const __CFArray *)-[__CFArray copy](v7, "copy");
      else
        v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

+ (BOOL)__setNetworkServiceOrder:(id)a3
{
  const __SCPreferences *v4;
  const __SCPreferences *v5;
  const __SCNetworkSet *v6;
  const __SCNetworkSet *v7;
  BOOL v8;

  v4 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("wifivelocityd"), 0);
  if (!v4)
    return 0;
  v5 = v4;
  if (SCPreferencesLock(v4, 1u))
  {
    v6 = SCNetworkSetCopyCurrent(v5);
    if (v6)
    {
      v7 = v6;
      if (SCNetworkSetSetServiceOrder(v6, (CFArrayRef)a3)
        && SCPreferencesCommitChanges(v5)
        && SCPreferencesApplyChanges(v5))
      {
        usleep(0x186A0u);
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }
      SCPreferencesUnlock(v5);
      CFRelease(v7);
      goto LABEL_9;
    }
    SCPreferencesUnlock(v5);
  }
  v8 = 0;
LABEL_9:
  CFRelease(v5);
  return v8;
}

- (BOOL)__performLoadViaNSURLSessionWithAddress:(id)a3 usingTimeout:(id)a4 andForceWiFiInterface:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v9;
  NSURL *v10;
  double v11;
  NSURLRequest *v12;
  NSURLSession *urlSession;
  NSURLSessionConfiguration *v14;
  NSURLSessionConfiguration *v15;
  dispatch_time_t v16;
  char v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;

  v5 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = +[NSURL URLWithString:](NSURL, "URLWithString:", a3);
  if (v10)
  {
    if (a4)
      objc_msgSend(a4, "doubleValue");
    else
      v11 = 1.6;
    v12 = +[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v10, 1, v11);
    if (v12)
    {
      urlSession = self->_urlSession;
      if (urlSession
        || (v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"), (v15 = v14) != 0)&& (-[NSURLSessionConfiguration setRequestCachePolicy:](v14, "setRequestCachePolicy:", 1), -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:](v15, "setHTTPMaximumConnectionsPerHost:", 1), -[NSURLSessionConfiguration setAllowsCellularAccess:](v15, "setAllowsCellularAccess:", !v5), urlSession = +[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v15), (self->_urlSession = urlSession) != 0))
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000472B8;
        v19[3] = &unk_1000D6880;
        v19[4] = v9;
        v19[5] = &v20;
        -[NSURLSessionDataTask resume](-[NSURLSession dataTaskWithRequest:completionHandler:](urlSession, "dataTaskWithRequest:completionHandler:", v12, v19), "resume");
        v16 = dispatch_time(0, 80000000000);
        if (dispatch_semaphore_wait(v9, v16) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          v25 = 0x4054000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }
        -[NSURLSession resetWithCompletionHandler:](self->_urlSession, "resetWithCompletionHandler:", &stru_1000D68A0);
      }
    }
  }
  v17 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)completedTestCallback
{
  return self->_completedTestCallback;
}

- (id)pingCallback
{
  return self->_pingCallback;
}

@end
