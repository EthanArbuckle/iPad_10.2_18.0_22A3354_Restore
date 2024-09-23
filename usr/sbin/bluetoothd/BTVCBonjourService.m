@implementation BTVCBonjourService

- (BTVCBonjourService)initWithQueue:(id)a3
{
  id v5;
  BTVCBonjourService *v6;
  BTVCBonjourService *v7;
  NSMutableSet *v8;
  NSMutableSet *advertiserAdvs;
  NSMutableDictionary *v10;
  NSMutableDictionary *advToBrowserNwToSFendpoints;
  NSMutableDictionary *v12;
  NSMutableDictionary *advToBrowserUuidToSFendpoints;
  NSMutableDictionary *v14;
  NSMutableDictionary *browserToAdvNwToSFendpoints;
  NSMutableDictionary *v16;
  NSMutableDictionary *browserToAdvUuidToSFendpoints;
  uint64_t v18;
  NSMutableSet *resultChanges;
  uint64_t v20;
  NSString *localAdvertiserUUIDString;
  uint64_t v22;
  NSString *localBrowserUUIDString;
  NSObject *v24;
  NSString *v25;
  NSString *v26;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  NSString *v32;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BTVCBonjourService;
  v6 = -[BTVCBonjourService init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    advertiserAdvs = v7->_advertiserAdvs;
    v7->_advertiserAdvs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    advToBrowserNwToSFendpoints = v7->_advToBrowserNwToSFendpoints;
    v7->_advToBrowserNwToSFendpoints = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    advToBrowserUuidToSFendpoints = v7->_advToBrowserUuidToSFendpoints;
    v7->_advToBrowserUuidToSFendpoints = v12;

    v7->_advertiserState = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    browserToAdvNwToSFendpoints = v7->_browserToAdvNwToSFendpoints;
    v7->_browserToAdvNwToSFendpoints = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    browserToAdvUuidToSFendpoints = v7->_browserToAdvUuidToSFendpoints;
    v7->_browserToAdvUuidToSFendpoints = v16;

    v7->_browserState = 0;
    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    resultChanges = v7->_resultChanges;
    v7->_resultChanges = (NSMutableSet *)v18;

    v20 = objc_claimAutoreleasedReturnValue(-[BTVCBonjourService randomUUID](v7, "randomUUID"));
    localAdvertiserUUIDString = v7->_localAdvertiserUUIDString;
    v7->_localAdvertiserUUIDString = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(-[BTVCBonjourService randomUUID](v7, "randomUUID"));
    localBrowserUUIDString = v7->_localBrowserUUIDString;
    v7->_localBrowserUUIDString = (NSString *)v22;

    v24 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v7->_localAdvertiserUUIDString;
      v26 = v7->_localBrowserUUIDString;
      *(_DWORD *)buf = 138412546;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] LocalAdvID %@, LocalBrowserID: %@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)randomUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return v3;
}

- (id)getUniqueServiceNameForAdvertiser
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](self->_localAdvertiserUUIDString, "lowercaseString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringWithRange:", 12, 12));

  return v3;
}

- (void)_startAdvertiser
{
  unsigned int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  OS_nw_listener *v7;
  OS_nw_listener *listener;
  id v9;
  NSObject *bonjour_service;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  OS_nw_listener *v14;
  NSObject *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD handler[5];
  id v22;
  id location;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = -[BTVCBonjourService advertiserState](self, "advertiserState");
  v4 = qword_100999980;
  if (v3)
  {
    v5 = (id)qword_100999980;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = -[BTVCBonjourService advertiserState](self, "advertiserState");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Unable to start BTVCBonjourServiceAdvertiser, invalid state : %d", buf, 8u);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Starting BTVCBonjourServiceAdvertiser listener/advertiser", buf, 2u);
    }
    v6 = objc_claimAutoreleasedReturnValue(+[BTVCBonjourEndpoint createConnectionParameters](BTVCBonjourEndpoint, "createConnectionParameters"));
    v7 = (OS_nw_listener *)nw_listener_create(v6);
    listener = self->_listener;
    self->_listener = v7;

    if (self->_listener)
    {
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService getUniqueServiceNameForAdvertiser](self, "getUniqueServiceNameForAdvertiser")));
      bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)objc_msgSend(v9, "UTF8String"), "_btvc._tcp", 0);
      if (bonjour_service)
      {
        v11 = qword_100999980;
        if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "_btvc._tcp";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] nw_advertise_descriptor_create_bonjour_service, %@, ServiceType %s success", buf, 0x16u);
        }
        nw_listener_set_advertise_descriptor((nw_listener_t)self->_listener, bonjour_service);
        nw_listener_set_queue((nw_listener_t)self->_listener, (dispatch_queue_t)self->_serialQueue);
        location = 0;
        objc_initWeak(&location, self);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v25 = sub_10006253C;
        v26 = sub_100062358;
        v27 = 0;
        v12 = self->_listener;
        handler[0] = _NSConcreteStackBlock;
        handler[2] = sub_100266420;
        handler[3] = &unk_10091FFB0;
        handler[1] = 3221225472;
        objc_copyWeak(&v22, &location);
        handler[4] = buf;
        nw_listener_set_state_changed_handler(v12, handler);
        v13 = self->_listener;
        v16 = _NSConcreteStackBlock;
        v17 = 3221225472;
        v18 = sub_10026674C;
        v19 = &unk_10091FFD8;
        objc_copyWeak(&v20, &location);
        nw_listener_set_new_connection_handler(v13, &v16);
        -[BTVCBonjourService setAdvertiserState:](self, "setAdvertiserState:", 1, v16, v17, v18, v19);
        nw_listener_start((nw_listener_t)self->_listener);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&v22);
        _Block_object_dispose(buf, 8);

        objc_destroyWeak(&location);
      }
      else
      {
        v14 = self->_listener;
        self->_listener = 0;

        v15 = qword_100999980;
        if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Unable to create to advertiser descriptor", buf, 2u);
        }
      }

    }
    else if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
    {
      sub_1006D52FC();
    }
  }
}

- (void)startAdvertisingWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  if (!serialQueue)
  {
    v9 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[BTVCBonjourService startAdvertisingWithData:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s _serialQueue is nil", buf, 0xCu);
    }
    serialQueue = self->_serialQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100266988;
  block[3] = &unk_100920000;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(serialQueue, block);

}

- (void)_stopAdvertising
{
  NSObject *v3;
  _DWORD v4[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[BTVCBonjourService advertiserState](self, "advertiserState") == 2)
  {
    -[BTVCBonjourService setAdvertiserState:](self, "setAdvertiserState:", 3);
    nw_listener_cancel((nw_listener_t)self->_listener);
  }
  else
  {
    v3 = (id)qword_100999980;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[BTVCBonjourService advertiserState](self, "advertiserState");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Unable to stop advertiser, invalid state : %d", (uint8_t *)v4, 8u);
    }

  }
}

- (BOOL)stopAdvertisingForData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100266CFC;
  block[3] = &unk_100920000;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

  return 1;
}

- (void)_cleanupAdvertiser
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[BTVCBonjourService advertiserState](self, "advertiserState"))
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Cleaning up the advertiser", v5, 2u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints"));
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &stru_100920040);

    -[BTVCBonjourService _updateAdvertiserState](self, "_updateAdvertiserState");
  }
}

- (void)_updateAdvertiserState
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysOfEntriesPassingTest:", &stru_100920080));

  if (!objc_msgSend(v4, "count") && !self->_listener)
  {
    -[BTVCBonjourService setAdvertiserState:](self, "setAdvertiserState:", 0);
    if (self->_shouldRestartAdvertising)
    {
      self->_shouldRestartAdvertising = 0;
      -[BTVCBonjourService _startAdvertiser](self, "_startAdvertiser");
    }
  }

}

- (void)_startBrowser
{
  unsigned int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *bonjour_service;
  OS_nw_browser *v7;
  OS_nw_browser *browser;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, int);
  void *v15;
  id v16;
  _QWORD state_changed_handler[4];
  id v18;
  uint8_t buf[8];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = -[BTVCBonjourService browserState](self, "browserState");
  v4 = qword_100999980;
  if (v3)
  {
    v5 = (id)qword_100999980;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = -[BTVCBonjourService browserState](self, "browserState");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Unable to start the browser, invalid state : %d", buf, 8u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Starting the browser", buf, 2u);
    }
    v5 = nw_parameters_create();
    nw_parameters_set_include_peer_to_peer(v5, 1);
    bonjour_service = nw_browse_descriptor_create_bonjour_service("_btvc._tcp", 0);
    v7 = (OS_nw_browser *)nw_browser_create(bonjour_service, v5);
    browser = self->_browser;
    self->_browser = v7;

    v9 = self->_browser;
    if (v9)
    {
      nw_browser_set_queue(v9, (dispatch_queue_t)self->_serialQueue);
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v10 = self->_browser;
      state_changed_handler[0] = _NSConcreteStackBlock;
      state_changed_handler[1] = 3221225472;
      state_changed_handler[2] = sub_100267324;
      state_changed_handler[3] = &unk_1009200A8;
      objc_copyWeak(&v18, (id *)buf);
      nw_browser_set_state_changed_handler(v10, state_changed_handler);
      v11 = self->_browser;
      v12 = _NSConcreteStackBlock;
      v13 = 3221225472;
      v14 = sub_1002674DC;
      v15 = &unk_1009200D0;
      objc_copyWeak(&v16, (id *)buf);
      nw_browser_set_browse_results_changed_handler(v11, &v12);
      -[BTVCBonjourService setBrowserState:](self, "setBrowserState:", 1, v12, v13, v14, v15);
      nw_browser_start((nw_browser_t)self->_browser);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    else if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
    {
      sub_1006D5354();
    }

  }
}

- (BOOL)startDiscovery
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002676A0;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(serialQueue, block);
  return 1;
}

- (void)_stopBrowser
{
  NSObject *v3;
  _DWORD v4[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[BTVCBonjourService browserState](self, "browserState") == 2)
  {
    -[BTVCBonjourService setBrowserState:](self, "setBrowserState:", 3);
    nw_browser_cancel((nw_browser_t)self->_browser);
  }
  else
  {
    v3 = (id)qword_100999980;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[BTVCBonjourService browserState](self, "browserState");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] StopBrowser is not stopping. current browser state %d", (uint8_t *)v4, 8u);
    }

  }
}

- (void)stopDiscovery
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100267878;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_reportCachedDiscoveryResults
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100267918;
  v4[3] = &unk_100920120;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_cleanupBrowser
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v7[16];

  if (-[BTVCBonjourService browserState](self, "browserState"))
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Cleaning up browser", v7, 2u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &stru_100920140);

    -[BTVCBonjourService _updateBrowserState](self, "_updateBrowserState");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService deviceDidStopScanning](self, "deviceDidStopScanning"));

    if (v5)
    {
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BTVCBonjourService deviceDidStopScanning](self, "deviceDidStopScanning"));
      v6[2](v6, 0);

    }
  }
}

- (void)_updateBrowserState
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysOfEntriesPassingTest:", &stru_100920160));

  if (!objc_msgSend(v4, "count") && !self->_browser)
  {
    v5 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] _updateBrowserState to kBTVCBonjourBrowserStateStopped", v6, 2u);
    }
    -[BTVCBonjourService setBrowserState:](self, "setBrowserState:", 0);
    if (self->_shouldRestartBrowsing)
    {
      self->_shouldRestartBrowsing = 0;
      -[BTVCBonjourService _startBrowser](self, "_startBrowser");
    }
  }

}

- (void)handleBrowseResults:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  nw_connection_t v22;
  NSObject *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  NSObject *v31;
  __int16 v32;
  NSObject *v33;
  _BYTE v34[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 138412290;
    v25 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "change", v25) & 2) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freshResult"));
          v11 = nw_browse_result_copy_endpoint(v15);

          if (!-[BTVCBonjourService isLocalEndpoint:](self, "isLocalEndpoint:", v11))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v11));
            v18 = v17 == 0;

            v19 = qword_100999980;
            v20 = os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v20)
              {
                *(_DWORD *)buf = 138412546;
                v31 = v11;
                v32 = 2048;
                v33 = v11;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Found endpoint %@, (%p)", buf, 0x16u);
              }
              v21 = objc_claimAutoreleasedReturnValue(+[BTVCBonjourEndpoint createConnectionParameters](BTVCBonjourEndpoint, "createConnectionParameters"));
              v22 = nw_connection_create(v11, v21);

              v23 = objc_claimAutoreleasedReturnValue(-[BTVCBonjourService _handleConnection:isAdvToBrowserConnection:](self, "_handleConnection:isAdvToBrowserConnection:", v22, 0));
              v24 = qword_100999980;
              if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v31 = v22;
                v32 = 2112;
                v33 = v23;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] New Browser to Adv connection %@ (endpoint %@)", buf, 0x16u);
              }

            }
            else if (v20)
            {
              *(_DWORD *)buf = v25;
              v31 = v11;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Ignoring duplicate endpoint %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if ((objc_msgSend(v9, "change") & 4) == 0)
            continue;
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "oldResult"));
          v11 = nw_browse_result_copy_endpoint(v10);

          if (!-[BTVCBonjourService isLocalEndpoint:](self, "isLocalEndpoint:", v11))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

            v14 = qword_100999980;
            if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v31 = v11;
              v32 = 2112;
              v33 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Removing endpoint %@ %@", buf, 0x16u);
            }
            -[NSObject cancel](v13, "cancel");

          }
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v5);
  }

}

- (id)_handleConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  uint64_t v7;
  id v8;
  BTVCBonjourEndpoint *v9;
  nw_endpoint_t v10;
  void *v11;
  NSObject *v12;
  BTVCBonjourEndpoint *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;
  id from;
  id location[2];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    v7 = 40;
    if (v4)
      v7 = 32;
    v8 = *(id *)((char *)&self->super.isa + v7);
    v9 = -[BTVCBonjourEndpoint initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:]([BTVCBonjourEndpoint alloc], "initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:", v6, v4, v8, self->_serialQueue);
    if (v9)
    {
      v10 = nw_connection_copy_endpoint(v6);
      if (v4)
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints"));
      else
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
      objc_msgSend(v11, "setObject:forKey:", v9, v10);

      location[0] = 0;
      objc_initWeak(location, self);
      from = 0;
      objc_initWeak(&from, v9);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1002684A0;
      v21[3] = &unk_1009201A8;
      objc_copyWeak(&v22, &from);
      objc_copyWeak(&v23, location);
      v24 = v4;
      -[BTVCBonjourEndpoint setDidConnectHandler:](v9, "setDidConnectHandler:", v21);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1002686E4;
      v18[3] = &unk_1009201D0;
      objc_copyWeak(&v19, location);
      objc_copyWeak(&v20, &from);
      -[BTVCBonjourEndpoint setDidDisconnectHandler:](v9, "setDidDisconnectHandler:", v18);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100268AE0;
      v15[3] = &unk_1009201F8;
      objc_copyWeak(&v16, location);
      objc_copyWeak(&v17, &from);
      -[BTVCBonjourEndpoint setDidReceiveDataHandler:](v9, "setDidReceiveDataHandler:", v15);
      v13 = v9;
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);

    }
    else if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
    {
      sub_1006D53F4();
    }

  }
  else
  {
    v12 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006D5380(v4, v12);
    v9 = 0;
  }

  return v9;
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toEndpoint:(id)a5 completionCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v27[0] = CFSTR("BTVCBonjourServiceMessageType");
  v27[1] = CFSTR("BTVCBonjourServiceMessageValue");
  v28[0] = v11;
  v28[1] = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v14, 200, 0, 0));
  v16 = qword_100999980;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourService] Sending payload %@ to endpoint %@", buf, 0x16u);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002694DC;
    v19[3] = &unk_100920220;
    v20 = v13;
    objc_msgSend(v12, "sendDataMessage:completion:", v15, v19);
    v17 = v20;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
    sub_1006D561C();
  if (v13)
  {
    v25 = NSLocalizedDescriptionKey;
    v26 = CFSTR("Unable to send message, failed to serialize payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6700, v18));

    (*((void (**)(id, void *))v13 + 2))(v13, v17);
LABEL_9:

  }
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toDevice:(id)a5 completionCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *serialQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  location = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10026965C;
  v19[3] = &unk_100920248;
  objc_copyWeak(&v24, &location);
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  dispatch_async(serialQueue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_sendAdvMessageWithData:(id)a3 isStart:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __CFString *v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = CFSTR("BTVCBonjourServiceMessageTypeStopAdvertiseData");
  if (v6)
    v10 = CFSTR("BTVCBonjourServiceMessageTypeStartAdvertiseData");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService advToBrowserUuidToSFendpoints](self, "advToBrowserUuidToSFendpoints"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10026997C;
  v16[3] = &unk_100920298;
  v16[4] = self;
  v15 = v8;
  v17 = v15;
  v13 = v11;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);

  if (v14)
    (*((void (**)(id, id, _QWORD))v14 + 2))(v14, v15, 0);

}

- (void)connectToDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100269BE0;
  v7[3] = &unk_1009202C0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[BTVCBonjourService _sendMessage:withType:toDevice:completionCallback:](self, "_sendMessage:withType:toDevice:completionCallback:", &__NSDictionary0__struct, CFSTR("BTVCBonjourServiceMessageTypeConnect"), v5, v7);

}

- (void)disconnectFromDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100269D9C;
  v7[3] = &unk_1009202C0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[BTVCBonjourService _sendMessage:withType:toDevice:completionCallback:](self, "_sendMessage:withType:toDevice:completionCallback:", &__NSDictionary0__struct, CFSTR("BTVCBonjourServiceMessageTypeDisconnect"), v5, v7);

}

- (BOOL)sendData:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100269FF8;
  v16[3] = &unk_1009202E8;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  -[BTVCBonjourService _sendMessage:withType:toDevice:completionCallback:](self, "_sendMessage:withType:toDevice:completionCallback:", v12, CFSTR("BTVCBonjourServiceMessageTypeDataPacket"), v11, v16);

  return 1;
}

- (BOOL)isLocalEndpoint:(id)a3
{
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", nw_endpoint_get_bonjour_service_name(v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService getUniqueServiceNameForAdvertiser](self, "getUniqueServiceNameForAdvertiser"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  return v8;
}

- (id)_endpointForUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
      sub_1006D5758();
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService advToBrowserUuidToSFendpoints](self, "advToBrowserUuidToSFendpoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvUuidToSFendpoints](self, "browserToAdvUuidToSFendpoints"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_ERROR))
        sub_1006D5784();
LABEL_8:
      v6 = 0;
    }
  }

  return v6;
}

- (void)_cleanUp
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A284;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BTVCBonjourService;
  -[BTVCBonjourService dealloc](&v2, "dealloc");
}

- (id)advertisingStateUpdateHandler
{
  return self->_advertisingStateUpdateHandler;
}

- (void)setAdvertisingStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)discoveryStateUpdateHandler
{
  return self->_discoveryStateUpdateHandler;
}

- (void)setDiscoveryStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceDidStartScanning
{
  return self->_deviceDidStartScanning;
}

- (void)setDeviceDidStartScanning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceDidStopScanning
{
  return self->_deviceDidStopScanning;
}

- (void)setDeviceDidStopScanning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)deviceDidConnectHandler
{
  return self->_deviceDidConnectHandler;
}

- (void)setDeviceDidConnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)deviceDidDisconnectHandler
{
  return self->_deviceDidDisconnectHandler;
}

- (void)setDeviceDidDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)deviceDidReceiveDataHandler
{
  return self->_deviceDidReceiveDataHandler;
}

- (void)setDeviceDidReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (OS_nw_listener)listener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 128, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OS_nw_browser)browser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBrowser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_nw_endpoint)endpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 144, 1);
}

- (NSMutableSet)resultChanges
{
  return (NSMutableSet *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResultChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableSet)advertiserAdvs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAdvertiserAdvs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableDictionary)advToBrowserNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAdvToBrowserNwToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSMutableDictionary)advToBrowserUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAdvToBrowserUuidToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)browserToAdvNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setBrowserToAdvNwToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableDictionary)browserToAdvUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBrowserToAdvUuidToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (int)browserState
{
  return self->_browserState;
}

- (void)setBrowserState:(int)a3
{
  self->_browserState = a3;
}

- (int)advertiserState
{
  return self->_advertiserState;
}

- (void)setAdvertiserState:(int)a3
{
  self->_advertiserState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserToAdvUuidToSFendpoints, 0);
  objc_storeStrong((id *)&self->_browserToAdvNwToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advToBrowserUuidToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advToBrowserNwToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advertiserAdvs, 0);
  objc_storeStrong((id *)&self->_resultChanges, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_deviceDidReceiveDataHandler, 0);
  objc_storeStrong(&self->_deviceDidDisconnectHandler, 0);
  objc_storeStrong(&self->_deviceDidConnectHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_deviceDidStopScanning, 0);
  objc_storeStrong(&self->_deviceDidStartScanning, 0);
  objc_storeStrong(&self->_discoveryStateUpdateHandler, 0);
  objc_storeStrong(&self->_advertisingStateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_localBrowserUUIDString, 0);
  objc_storeStrong((id *)&self->_localAdvertiserUUIDString, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
