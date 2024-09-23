@implementation BMRapportManager

- (BMRapportManager)initWithQueue:(id)a3
{
  id v5;
  BMRapportManager *v6;
  BMRapportManager *v7;
  BMRapportDiscoveryManager *v8;
  BMRapportDiscoveryManager *discoveryManager;
  uint64_t v10;
  BMRapportRequestHandlerClient *requestHandlerClient;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMRapportManager;
  v6 = -[BMRapportManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[BMRapportDiscoveryManager initWithServiceName:delegate:queue:]([BMRapportDiscoveryManager alloc], "initWithServiceName:delegate:queue:", CFSTR("com.apple.biomesyncd.rapport"), v7, v7->_queue);
    discoveryManager = v7->_discoveryManager;
    v7->_discoveryManager = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[BMRapportClient clientForHandlingRequestsWithServiceName:queue:](BMRapportClient, "clientForHandlingRequestsWithServiceName:queue:", CFSTR("com.apple.biomesyncd.rapport"), v7->_queue));
    requestHandlerClient = v7->_requestHandlerClient;
    v7->_requestHandlerClient = (BMRapportRequestHandlerClient *)v10;

    -[BMRapportManager registerForSigterm](v7, "registerForSigterm");
  }

  return v7;
}

- (void)registerForSigterm
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigtermSource;
  NSObject *v5;
  _QWORD handler[5];

  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_queue);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  v5 = self->_sigtermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001AD90;
  handler[3] = &unk_100068B38;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSObject *v6;
  BMRapportRequestHandlerClient *requestHandlerClient;
  NSMutableArray *v8;
  NSObject *v9;
  BMRapportDiscoveryManager *discoveryManager;
  NSMutableArray *v11;
  NSObject *v12;
  OS_dispatch_queue *queue;
  _QWORD v14[4];
  NSMutableArray *v15;
  id v16;
  _QWORD v17[5];
  NSMutableArray *v18;
  NSObject *v19;
  _QWORD v20[5];
  NSMutableArray *v21;
  NSObject *v22;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  requestHandlerClient = self->_requestHandlerClient;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001AF8C;
  v20[3] = &unk_100069178;
  v20[4] = self;
  v8 = v5;
  v21 = v8;
  v9 = v6;
  v22 = v9;
  -[BMRapportRequestHandlerClient activateWithCompletion:](requestHandlerClient, "activateWithCompletion:", v20);
  dispatch_group_enter(v9);
  discoveryManager = self->_discoveryManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001B020;
  v17[3] = &unk_100069178;
  v17[4] = self;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  -[BMRapportDiscoveryManager startWithCompletion:](discoveryManager, "startWithCompletion:", v17);
  if (v4)
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001B0B4;
    v14[3] = &unk_100068B60;
    v15 = v11;
    v16 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)queue, v14);

  }
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportManager: start", v5, 2u);
  }

  -[BMRapportManager activateWithCompletion:](self, "activateWithCompletion:", 0);
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportManager: stop", v5, 2u);
  }

  -[BMRapportDiscoveryManager stop](self->_discoveryManager, "stop");
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  BMRapportRequestHandlerClient *requestHandlerClient;
  BMRapportDiscoveryManager *discoveryManager;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportManager: invalidate", v7, 2u);
  }

  -[BMRapportRequestHandlerClient invalidate](self->_requestHandlerClient, "invalidate");
  requestHandlerClient = self->_requestHandlerClient;
  self->_requestHandlerClient = 0;

  -[BMRapportDiscoveryManager invalidate](self->_discoveryManager, "invalidate");
  discoveryManager = self->_discoveryManager;
  self->_discoveryManager = 0;

}

- (id)discoveredDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[BMRapportDiscoveryManager devices](self->_discoveryManager, "devices");
}

- (id)localDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[BMRapportDiscoveryManager localDevice](self->_discoveryManager, "localDevice");
}

- (id)deviceWithIdentifier:(id)a3
{
  OS_dispatch_queue *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDiscoveryManager deviceWithIdentifier:](self->_discoveryManager, "deviceWithIdentifier:", v5));

  return v6;
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5
{
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  id v11;

  queue = self->_queue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  -[BMRapportRequestHandlerClient registerRequestID:options:requestHandler:](self->_requestHandlerClient, "registerRequestID:options:requestHandler:", v11, v10, v9);

}

- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6
{
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _UNKNOWN **v17;

  queue = self->_queue;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v16 = RPOptionTimeoutSeconds;
  v17 = &off_10006EAC8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  -[BMRapportManager sendRequest:request:device:options:responseHandler:](self, "sendRequest:request:device:options:responseHandler:", v14, v13, v12, v15, v11);

}

- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id from;
  id location;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = __biome_log_for_category(11);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v14)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shortenedRapportIdentifier"));
      *(_DWORD *)buf = 138412290;
      v45 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: enqueueing request", buf, 0xCu);

    }
    if (v13)
      v21 = v13;
    else
      v21 = &__NSDictionary0__struct;
    v19 = objc_msgSend(v21, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v12, CFSTR("~~REQUEST_ID~~"));
    v22 = objc_msgSend(v16, "copy");
    -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v22, CFSTR("~~RESPONSE_HANDLER~~"));

    -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v15, CFSTR("~~OPTIONS~~"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requestQueue"));
    objc_msgSend(v23, "addObject:", v19);

    v24 = __biome_log_for_category(11);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shortenedRapportIdentifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requestQueue"));
      *(_DWORD *)buf = 138412546;
      v45 = v26;
      v46 = 2112;
      v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BMRapportDevice[%@]: request queue %@", buf, 0x16u);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "client"));
    v29 = v28 == 0;

    if (v29)
    {
      objc_initWeak(&location, v14);
      objc_initWeak(&from, self);
      v30 = __biome_log_for_category(11);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shortenedRapportIdentifier"));
        *(_DWORD *)buf = 138412290;
        v45 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: activating client", buf, 0xCu);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "device"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[BMRapportClient clientForCommunicatingWithDevice:serviceName:queue:](BMRapportClient, "clientForCommunicatingWithDevice:serviceName:queue:", v33, CFSTR("com.apple.biomesyncd.rapport"), self->_queue));
      objc_msgSend(v14, "setClient:", v34);

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10001BA38;
      v40[3] = &unk_100068A28;
      objc_copyWeak(&v41, &location);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "client"));
      objc_msgSend(v35, "setInvalidationHandler:", v40);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "client"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001BA68;
      v37[3] = &unk_1000691A0;
      objc_copyWeak(&v38, &from);
      objc_copyWeak(&v39, &location);
      objc_msgSend(v36, "activateWithCompletion:", v37);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    sub_100042A28();
  }

}

- (void)handleActivationForDevice:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _BYTE v20[24];
  const __CFString *v21;

  v6 = a3;
  v7 = (__CFString *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = __biome_log_for_category(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortenedRapportIdentifier"));
      v12 = (void *)v11;
      v13 = CFSTR("failed with error, ");
      if (!v7)
        v13 = CFSTR("completed");
      *(_DWORD *)v20 = 138412802;
      *(_QWORD *)&v20[4] = v11;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v13;
      if (v7)
        v14 = v7;
      else
        v14 = &stru_100069AC0;
      *(_WORD *)&v20[22] = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: activation %@%@", v20, 0x20u);

    }
    if (v7)
    {
      if (-[__CFString code](v7, "code") == (id)-71165)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v7, "domain"));
        v16 = objc_msgSend(v15, "isEqualToString:", RPErrorDomain);

        if (v16)
        {
          -[BMRapportDiscoveryManager ignoreDevice:](self->_discoveryManager, "ignoreDevice:", v6);
          v17 = __biome_log_for_category(11);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortenedRapportIdentifier"));
            *(_DWORD *)v20 = 138412290;
            *(_QWORD *)&v20[4] = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: determined to not support service com.apple.biomesyncd.rapport", v20, 0xCu);

          }
        }
      }
      objc_msgSend(v6, "invalidateClientWithError:", v7, *(_OWORD *)v20, *(_QWORD *)&v20[16]);
    }
    else
    {
      -[BMRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100042A54();

  }
}

- (void)sendNextRequestToDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  NSMutableDictionary *v32;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestQueue"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popFirstObject"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("~~REQUEST_ID~~")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("~~OPTIONS~~")));
      v9 = objc_msgSend(v8, "mutableCopy");
      v10 = v9;
      if (v9)
        v11 = (NSMutableDictionary *)v9;
      else
        v11 = objc_opt_new(NSMutableDictionary);
      v13 = v11;

      v14 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("~~RESPONSE_HANDLER~~")));
      v15 = (void *)v14;
      if (v7 && v14)
      {
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, CFSTR("~~REQUEST_ID~~"));
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, CFSTR("~~OPTIONS~~"));
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, CFSTR("~~RESPONSE_HANDLER~~"));
        v16 = __biome_log_for_category(11);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortenedRapportIdentifier"));
          *(_DWORD *)buf = 138412802;
          v28 = v18;
          v29 = 2112;
          v30 = v6;
          v31 = 2112;
          v32 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: being sent request %@ with options %@", buf, 0x20u);

        }
        objc_initWeak((id *)buf, v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestQueue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "count") != 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, RPOptionMoreComing);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "client"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10001C06C;
        v24[3] = &unk_1000691C8;
        v25 = v15;
        objc_copyWeak(&v26, (id *)buf);
        v24[4] = self;
        objc_msgSend(v21, "sendRequestID:request:options:responseHandler:", v7, v6, v13, v24);

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v22 = __biome_log_for_category(11);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          sub_100042AB8(v4, (uint64_t)v6, v23);

        -[BMRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v4);
      }

    }
    else
    {
      -[BMRapportManager finishedSendingRequestsToDevice:](self, "finishedSendingRequestsToDevice:", v4);
    }
  }
  else
  {
    v12 = __biome_log_for_category(11);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_100042A8C();
  }

}

- (void)finishedSendingRequestsToDevice:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortenedRapportIdentifier"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BMRapportDevice[%@]: request queue empty, invalidating client", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v4, "invalidateClientWithError:", 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_100042B68();

  }
}

- (void)discoveryManager:(id)a3 didDiscoverDevice:(id)a4
{
  OS_dispatch_queue *queue;
  id v6;
  id v7;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BMRapportManager delegate](self, "delegate"));
  objc_msgSend(v7, "rapportManager:didDiscoverBMRapportDevice:", self, v6);

}

- (void)discoveryManager:(id)a3 didLoseDevice:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortenedRapportIdentifier"));
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: lost", (uint8_t *)&v11, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager delegate](self, "delegate"));
  objc_msgSend(v9, "rapportManager:didLoseNearbyBMRapportDevice:", self, v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 10, 0));
  objc_msgSend(v5, "invalidateClientWithError:", v10);

}

- (BOOL)discoveryManager:(id)a3 supportsDevice:(id)a4
{
  BMRapportManager *v4;
  OS_dispatch_queue *queue;
  id v6;
  void *v7;

  v4 = self;
  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager delegate](v4, "delegate"));
  LOBYTE(v4) = objc_msgSend(v7, "rapportManager:isDeviceSupported:", v4, v6);

  return (char)v4;
}

- (BMRapportManagerDelegate)delegate
{
  return (BMRapportManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_requestHandlerClient, 0);
}

@end
