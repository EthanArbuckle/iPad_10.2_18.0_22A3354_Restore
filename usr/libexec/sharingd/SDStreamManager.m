@implementation SDStreamManager

+ (id)sharedManager
{
  if (qword_1007C6540 != -1)
    dispatch_once(&qword_1007C6540, &stru_100714E58);
  return (id)qword_1007C6538;
}

- (SDStreamManager)initWithServiceType:(id)a3
{
  id v5;
  SDStreamManager *v6;
  SDStreamManager *v7;
  NSNetService *service;
  NSMutableDictionary *v9;
  NSMutableDictionary *managers;
  NSMutableArray *v11;
  NSMutableArray *companionServices;
  NSMutableArray *v13;
  NSMutableArray *incomingStreams;
  NSMutableDictionary *v15;
  NSMutableDictionary *continuationStreams;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SDStreamManager;
  v6 = -[SDStreamManager init](&v18, "init");
  v7 = v6;
  if (v6)
  {
    service = v6->_service;
    v6->_service = 0;

    objc_storeStrong((id *)&v7->_serviceType, a3);
    v9 = objc_opt_new(NSMutableDictionary);
    managers = v7->_managers;
    v7->_managers = v9;

    v11 = objc_opt_new(NSMutableArray);
    companionServices = v7->_companionServices;
    v7->_companionServices = v11;

    v13 = objc_opt_new(NSMutableArray);
    incomingStreams = v7->_incomingStreams;
    v7->_incomingStreams = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    continuationStreams = v7->_continuationStreams;
    v7->_continuationStreams = v15;

    v7->_connectedStreams = 0;
    -[SDStreamManager addObservers](v7, "addObservers");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SDStreamManager removeObservers](self, "removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)SDStreamManager;
  -[SDStreamManager dealloc](&v3, "dealloc");
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "debugInfoRequested:", CFSTR("com.apple.sharingd.DebugInfoRequested"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "activityContinuationPayloadSent:", CFSTR("com.apple.sharingd.ContinuationPayloadSent"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)debugInfoRequested:(id)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSMutableArray *v12;

  v12 = objc_opt_new(NSMutableArray);
  if (self->_service)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Publishing:%@"), v4));
  -[NSMutableArray addObject:](v12, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Registered Activities:%d"), -[NSMutableArray count](self->_companionServices, "count")));
  -[NSMutableArray addObject:](v12, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connected Streams:%ld"), self->_connectedStreams));
  -[NSMutableArray addObject:](v12, "addObject:", v7);

  v9 = (objc_class *)objc_opt_class(self, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_1000455A8(v11, (uint64_t)v12);

}

- (void)activityContinuationPayloadSent:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  SDStreamManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100051970;
  v5[3] = &unk_100714860;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (BOOL)servicesContainIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_companionServices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "serviceType", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        v8 |= v12;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (void)registerConnectedStreams
{
  uint64_t v3;
  NSObject *v4;
  int64_t connectedStreams;
  int v6;
  int64_t v7;

  ++self->_connectedStreams;
  v3 = streams_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    connectedStreams = self->_connectedStreams;
    v6 = 134217984;
    v7 = connectedStreams;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Added connected stream, total = %ld", (uint8_t *)&v6, 0xCu);
  }

}

- (void)getContinuationStreamsForMessage:(id)a3 bundleID:(id)a4 usingID:(id)a5 completionHandler:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  SDStreamHandler *v31;
  SDStreamHandler *v32;
  uint64_t v33;
  SDStreamHandler *v34;
  SDCompanionStream *v35;
  void *v36;
  SDCompanionStream *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  NSErrorUserInfoKey v58;
  const __CFString *v59;
  NSErrorUserInfoKey v60;
  const __CFString *v61;
  _BYTE buf[24];

  v9 = a3;
  v54 = a4;
  v53 = a5;
  v52 = a6;
  v11 = streams_log(v52, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFCompanionServiceBonjourNameKey));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Streams are being requested for bonjour name = %@", buf, 0xCu);

  }
  v60 = NSLocalizedDescriptionKey;
  v61 = CFSTR("Could not set up internal streams");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v17 = objc_msgSend(v16, "wirelessEnabled");

  if ((v17 & 1) != 0
    || (v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor")),
        v19 = objc_msgSend(v18, "alwaysSendPayload"),
        v18,
        v19))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFCompanionServiceBonjourNameKey, self));
    if (v23)
    {
      v24 = objc_msgSend(objc_alloc((Class)NSNetService), "initWithDomain:type:name:", CFSTR("local."), CFSTR("_continuity._tcp."), v23);
      v26 = v24;
      v28 = v53;
      v27 = v54;
      if (v24)
      {
        *(_QWORD *)buf = 0;
        v57 = 0;
        objc_msgSend(v24, "_setIncludesAWDL:", 1);
        v29 = objc_msgSend(v26, "getInputStream:outputStream:", buf, &v57);
        if ((_DWORD)v29)
        {
          v31 = [SDStreamHandler alloc];
          v32 = -[SDStreamHandler initWithInputStream:outputStream:isClient:](v31, "initWithInputStream:outputStream:isClient:", *(_QWORD *)buf, v57, 1);
          v34 = v32;
          if (v32)
          {
            -[SDStreamHandler setBundleID:](v32, "setBundleID:", v54);
            v35 = [SDCompanionStream alloc];
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFCompanionServiceAuthorDataKey));
            v37 = -[SDCompanionStream initWithAuthorData:streamHandler:](v35, "initWithAuthorData:streamHandler:", v36, v34);

            -[SDCompanionStream setDelegate:](v37, "setDelegate:", v51);
            -[SDCompanionStream setIdentifier:](v37, "setIdentifier:", v53);
            -[SDCompanionStream start](v37, "start");
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_10005219C;
            v55[3] = &unk_100714E80;
            v38 = v52;
            v56 = v52;
            -[SDCompanionStream getStreamsWithCompletionHandler:](v37, "getStreamsWithCompletionHandler:", v55);
            objc_msgSend(*(id *)(v51 + 48), "setObject:forKeyedSubscript:", v37, v53);

          }
          else
          {
            v48 = streams_log(0, v33);
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              sub_100053128();

            v38 = v52;
            (*((void (**)(id, _QWORD, void *))v52 + 2))(v52, 0, v15);
          }

        }
        else
        {
          v46 = streams_log(v29, v30);
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            sub_1000530FC();

          v38 = v52;
          (*((void (**)(id, _QWORD, void *))v52 + 2))(v52, 0, v15);
        }

      }
      else
      {
        v44 = streams_log(0, v25);
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_1000530FC();

        v38 = v52;
        (*((void (**)(id, _QWORD, void *))v52 + 2))(v52, 0, v15);
      }

    }
    else
    {
      v39 = streams_log(0, v22);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      v28 = v53;
      v27 = v54;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_1000530D0();

      v38 = v52;
      (*((void (**)(id, _QWORD, void *))v52 + 2))(v52, 0, v15);
    }
  }
  else
  {
    v41 = streams_log(v20, v21);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_100053154();

    v58 = NSLocalizedDescriptionKey;
    v59 = CFSTR("Wi-Fi not enabled");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 50, v23));
    v38 = v52;
    (*((void (**)(id, _QWORD, void *))v52 + 2))(v52, 0, v43);

    v28 = v53;
    v27 = v54;
  }

}

- (void)unregisterConnectedStreams
{
  uint64_t v3;
  NSObject *v4;
  int64_t connectedStreams;
  void *v6;
  unsigned __int8 v7;
  int v8;
  int64_t v9;

  --self->_connectedStreams;
  v3 = streams_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    connectedStreams = self->_connectedStreams;
    v8 = 134217984;
    v9 = connectedStreams;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removed connected streams, total = %ld", (uint8_t *)&v8, 0xCu);
  }

  if (self->_connectedStreams <= 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v7 = objc_msgSend(v6, "alwaysSendPayload");

    if ((v7 & 1) == 0)
      -[SDStreamManager unpublish](self, "unpublish");
  }
}

- (void)restartPublishTimer
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *publishTimer;
  NSTimer *v6;
  NSTimer *v7;
  uint8_t v8[16];

  v3 = streams_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting publish timer", v8, 2u);
  }

  publishTimer = self->_publishTimer;
  if (publishTimer)
    -[NSTimer invalidate](publishTimer, "invalidate");
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "publishTimerFired:", 0, 0, 90.0));
  v7 = self->_publishTimer;
  self->_publishTimer = v6;

}

- (void)publishTimerFired:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSTimer *publishTimer;
  uint8_t v11[16];

  if (self->_connectedStreams <= 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor", a3));
    v5 = objc_msgSend(v4, "alwaysSendPayload");

    if ((v5 & 1) == 0)
    {
      v8 = streams_log(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Publish timer fired, no more connected streams", v11, 2u);
      }

      -[SDStreamManager unpublish](self, "unpublish");
    }
  }
  publishTimer = self->_publishTimer;
  self->_publishTimer = 0;

}

- (void)publish
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  __CFString *v6;
  NSNetService *v7;
  NSNetService *service;
  uint64_t v9;
  NSNetService *v10;
  NSNetService *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];
  uint8_t buf[16];

  if (self->_service)
  {
    v3 = streams_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already publishing", v19, 2u);
    }

    if (!self->_connectedStreams)
      -[SDStreamManager restartPublishTimer](self, "restartPublishTimer");
  }
  else
  {
    v6 = (__CFString *)sub_10019CEB4();
    if (v6)
    {
      v7 = (NSNetService *)objc_msgSend(objc_alloc((Class)NSNetService), "initWithDomain:type:name:port:", CFSTR("local"), self->_serviceType, v6, 8771);
      service = self->_service;
      self->_service = v7;

      v10 = self->_service;
      if (v10)
      {
        -[NSNetService setDelegate:](v10, "setDelegate:", self);
        -[NSNetService _setIncludesAWDL:](self->_service, "_setIncludesAWDL:", 1);
        v11 = self->_service;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
        -[NSNetService scheduleInRunLoop:forMode:](v11, "scheduleInRunLoop:forMode:", v12, NSRunLoopCommonModes);

        -[NSNetService publishWithOptions:](self->_service, "publishWithOptions:", 3);
        v13 = -[SDStreamManager restartPublishTimer](self, "restartPublishTimer");
        v15 = streams_log(v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Publishing net service", buf, 2u);
        }
      }
      else
      {
        v18 = streams_log(0, v9);
        v16 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1000531AC();
      }
    }
    else
    {
      v17 = streams_log(0, v5);
      v16 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100053180();
    }

  }
}

- (void)unpublish
{
  uint64_t v3;
  NSObject *v4;
  NSNetService *service;
  void *v6;
  NSNetService *v7;
  uint8_t v8[16];

  if (self->_service)
  {
    v3 = streams_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unpublishing", v8, 2u);
    }

    service = self->_service;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[NSNetService removeFromRunLoop:forMode:](service, "removeFromRunLoop:forMode:", v6, NSRunLoopCommonModes);

    -[NSNetService setDelegate:](self->_service, "setDelegate:", 0);
    -[NSNetService stop](self->_service, "stop");
    v7 = self->_service;
    self->_service = 0;

  }
}

- (void)addService:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_companionServices, "containsObject:", v4);
  if ((v5 & 1) != 0)
  {
    v7 = streams_log(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Service has already been added", (uint8_t *)&v16, 2u);
    }

  }
  else
  {
    v9 = -[NSMutableArray addObject:](self->_companionServices, "addObject:", v4);
    v11 = streams_log(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Added service to publisher %@ with identifier %@", (uint8_t *)&v16, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v15 = objc_msgSend(v14, "alwaysSendPayload");

    if (v15)
      -[SDStreamManager publish](self, "publish");
  }

}

- (void)removeService:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;

  v4 = a3;
  v6 = streams_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));
    v12 = 138412290;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removed stream support for activity with identifier = %@", (uint8_t *)&v12, 0xCu);

  }
  -[NSMutableArray removeObject:](self->_companionServices, "removeObject:", v4);
  if (!-[NSMutableArray count](self->_companionServices, "count"))
  {
    v10 = streams_log(0, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No more activities that support streams", (uint8_t *)&v12, 2u);
    }

    -[SDStreamManager unpublish](self, "unpublish");
  }

}

- (void)closeStreamsForIdentifier:(id)a3
{
  NSMutableDictionary *continuationStreams;
  id v5;
  id v6;

  continuationStreams = self->_continuationStreams;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](continuationStreams, "objectForKeyedSubscript:", v5));
  objc_msgSend(v6, "stop");
  -[NSMutableDictionary removeObjectForKey:](self->_continuationStreams, "removeObjectForKey:", v5);

}

- (void)registerManager:(id)a3
{
  NSMutableDictionary *managers;
  id v4;
  id v5;

  managers = self->_managers;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](managers, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)unregisterManager:(id)a3
{
  NSMutableDictionary *managers;
  id v4;

  managers = self->_managers;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "managerID"));
  -[NSMutableDictionary removeObjectForKey:](managers, "removeObjectForKey:", v4);

}

- (void)netServiceDidPublish:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = streams_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Published net service = %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v9 = streams_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1000531D8((uint64_t)v6, (uint64_t)v7, v10);

  -[SDStreamManager unpublish](self, "unpublish");
  v11 = sub_10019AAC0(2.0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052B80;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)netServiceDidStop:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = streams_log(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Publisher stopped publishing", v5, 2u);
  }

}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7;
  id v8;
  SDStreamHandler *v9;
  uint64_t v10;
  uint64_t v11;
  SDCompanionStream *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t v18[16];

  v7 = a5;
  v8 = a4;
  v9 = -[SDStreamHandler initWithInputStream:outputStream:isClient:]([SDStreamHandler alloc], "initWithInputStream:outputStream:isClient:", v8, v7, 0);

  if (v9)
  {
    v12 = -[SDCompanionStream initWithStreamHandler:]([SDCompanionStream alloc], "initWithStreamHandler:", v9);
    -[SDCompanionStream setDelegate:](v12, "setDelegate:", self);
    -[SDCompanionStream start](v12, "start");
    v13 = -[NSMutableArray addObject:](self->_incomingStreams, "addObject:", v12);
    v15 = streams_log(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Net service did accept streams", v18, 2u);
    }

  }
  else
  {
    v17 = streams_log(v10, v11);
    v12 = (SDCompanionStream *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      sub_100053254();
  }

}

- (void)continuationStream:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *managers;
  uint64_t *p_managers;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableDictionary *continuationStreams;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  p_managers = (uint64_t *)&self->_managers;
  managers = self->_managers;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managerID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](managers, "objectForKeyedSubscript:", v16));

  if (v17)
  {
    if ((objc_opt_respondsToSelector(v17, "manager:connectedToService:withFileHandle:acceptHandler:") & 1) != 0)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100052F34;
      v26[3] = &unk_100714370;
      v27 = v13;
      objc_msgSend(v17, "manager:connectedToService:withFileHandle:acceptHandler:", self, v11, v12, v26);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleID"));
    objc_msgSend(v10, "setBundleID:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    objc_msgSend(v10, "setIdentifier:", v21);

    continuationStreams = self->_continuationStreams;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](continuationStreams, "setObject:forKeyedSubscript:", v10, v23);

    -[NSMutableArray removeObject:](self->_incomingStreams, "removeObject:", v10);
  }
  else
  {
    v24 = streams_log(v18, v19);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100053280(v11, p_managers, v25);

  }
}

- (void)companionStreamClosedStreams:(id)a3
{
  void *v4;
  NSMutableDictionary *continuationStreams;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  if (v4)
  {
    continuationStreams = self->_continuationStreams;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    -[NSMutableDictionary removeObjectForKey:](continuationStreams, "removeObjectForKey:", v6);

  }
  -[NSMutableArray removeObject:](self->_incomingStreams, "removeObject:", v7);

}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNetService)service
{
  return (NSNetService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)managers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManagers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)companionServices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCompanionServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)incomingStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIncomingStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)continuationStreams
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContinuationStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)connectedStreams
{
  return self->_connectedStreams;
}

- (void)setConnectedStreams:(int64_t)a3
{
  self->_connectedStreams = a3;
}

- (NSTimer)publishTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPublishTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishTimer, 0);
  objc_storeStrong((id *)&self->_continuationStreams, 0);
  objc_storeStrong((id *)&self->_incomingStreams, 0);
  objc_storeStrong((id *)&self->_companionServices, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
