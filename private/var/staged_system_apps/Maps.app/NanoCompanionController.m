@implementation NanoCompanionController

- (NanoCompanionController)initWithPlatformController:(id)a3 ipcServer:(id)a4
{
  id v7;
  id v8;
  NanoCompanionController *v9;
  NanoCompanionController *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  const char *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *isolationQueue;
  void *v21;
  dispatch_queue_global_t global_queue;
  NSObject *v23;
  NanoCompanionController *v24;
  _QWORD block[4];
  NanoCompanionController *v27;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)NanoCompanionController;
  v9 = -[NanoCompanionController init](&v28, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platformController, a3);
    objc_storeStrong((id *)&v10->_ipcServer, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v12, objc_opt_class(v10), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v15 = objc_retainAutorelease(v14);
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create(v16, v18);
    isolationQueue = v10->_isolationQueue;
    v10->_isolationQueue = (OS_dispatch_queue *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, "_deviceDidPairNotification:", NRPairedDeviceRegistryDeviceDidPairNotification, 0);

    global_queue = dispatch_get_global_queue(21, 0);
    v23 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004143CC;
    block[3] = &unk_1011AC860;
    v24 = v10;
    v27 = v24;
    dispatch_async(v23, block);

    -[NanoCompanionController _createCompanionRoutesConnection](v24, "_createCompanionRoutesConnection");
  }

  return v10;
}

- (void)dealloc
{
  NSXPCConnection *companionRoutesConnection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_companionRoutesConnection, "invalidate");
  companionRoutesConnection = self->_companionRoutesConnection;
  self->_companionRoutesConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)NanoCompanionController;
  -[NanoCompanionController dealloc](&v4, "dealloc");
}

+ (int64_t)creationPreference
{
  return 1;
}

+ (void)initializePairedDeviceRegistry
{
  if (qword_1014D24B8 != -1)
    dispatch_once(&qword_1014D24B8, &stru_1011B56B8);
}

- (void)_createCompanionRoutesConnection
{
  NSObject *isolationQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004144F0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)_createCompanionRoutesConnectionOnIsolationQueue
{
  id v3;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *companionRoutesConnection;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSXPCConnection *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id from;
  id location;
  uint8_t buf[4];
  NSXPCConnection *v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_companionRoutesConnection)
  {
    v3 = sub_10043380C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Creating companion routes XPC connection", buf, 2u);
    }

    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.nanomaps.xpc.Routes"), 0);
    companionRoutesConnection = self->_companionRoutesConnection;
    self->_companionRoutesConnection = v5;

    -[NSXPCConnection _setQueue:](self->_companionRoutesConnection, "_setQueue:", self->_isolationQueue);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NanoCompanionXPCRouting));
    -[NSXPCConnection setRemoteObjectInterface:](self->_companionRoutesConnection, "setRemoteObjectInterface:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NanoCompanionXPCRouting));
    -[NSXPCConnection setExportedInterface:](self->_companionRoutesConnection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_companionRoutesConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_companionRoutesConnection);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1004147F4;
    v19[3] = &unk_1011AD728;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    -[NSXPCConnection setInvalidationHandler:](self->_companionRoutesConnection, "setInvalidationHandler:", v19);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100414908;
    v16 = &unk_1011AD728;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    -[NSXPCConnection setInterruptionHandler:](self->_companionRoutesConnection, "setInterruptionHandler:", &v13);
    -[NSXPCConnection resume](self->_companionRoutesConnection, "resume", v13, v14, v15, v16);
    v9 = sub_10043380C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_companionRoutesConnection;
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "checkinForRoutePlanning on connection: %@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_companionRoutesConnection, "remoteObjectProxy"));
    objc_msgSend(v12, "checkinForRoutePlanning");

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)_enterRoutePlanningForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionItem directionItemWithNanoRoutePlanningRequest:](DirectionItem, "directionItemWithNanoRoutePlanningRequest:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getActivePairedDevice"));
  if ((GEOConfigGetBOOL(MapsConfig_NanoUseMapsForCompanionRoutePlanning, off_1014B48F8) & 1) != 0)
  {
    v8 = v7;
    if (!v8
      || (v9 = v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", NRDevicePropertySystemVersion)),
          v11 = objc_msgSend(v10, "compare:options:", CFSTR("9.0"), 64),
          v10,
          v9,
          v9,
          v11 != (id)-1))
    {
      v12 = CFSTR("Phone");
      v13 = 1;
      goto LABEL_7;
    }
  }
  else
  {

  }
  v12 = CFSTR("Watch");
  v13 = 3;
LABEL_7:

  v14 = sub_10043380C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCompanionRouteContext simpleDescription](self->_anticipatingContext, "simpleDescription"));
    *(_DWORD *)buf = 138412546;
    v37 = v12;
    v38 = 2112;
    v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Enter route planning with initiator: %@ (%@)", buf, 0x16u);

  }
  v34[0] = CFSTR("DirectionsSessionInitiatorKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  v34[1] = CFSTR("DirectionsCompanionRouteContextKey");
  v35[0] = v17;
  v35[1] = self->_anticipatingContext;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v18));

  v20 = objc_msgSend(v4, "startNavigationAutomatically");
  if (v20)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 5.0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("NavigationAutoLaunchDelayKey")));

    if (v23)
      v24 = v23;
    else
      v24 = v21;
    v25 = v24;

    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("DirectionsNavigationAutoLaunchDelayKey"));

  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100414D70;
  v31[3] = &unk_1011AC8B0;
  v32 = v5;
  v33 = v19;
  v29 = v19;
  v30 = v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v31);

}

- (void)checkinForRoutePlanning
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  int v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = sub_10043380C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", (uint8_t *)&v7, 0xCu);

  }
}

- (void)anticipateRoutePlanningRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  NSObject *v10;
  NSString *v11;
  __CFString *v12;
  GEOCompanionRouteContext *anticipatingContext;
  GEOCompanionRouteContext *v14;
  void *v15;
  unsigned __int8 v16;
  unsigned int v17;
  unint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  NSUUID *lastPreviewedRouteID;
  NSArray *lastReceivedRouteIDs;
  NanoRoutePlanningMutableRequest *v27;
  NanoRoutePlanningMutableRequest *request;
  NanoRoutePlanningMutableResponse *v29;
  NanoRoutePlanningMutableResponse *response;
  int v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v9 = sub_10043380C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = NSStringFromSelector(a2);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
    v31 = 138412290;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", (uint8_t *)&v31, 0xCu);

  }
  anticipatingContext = self->_anticipatingContext;
  if (anticipatingContext)
  {
    v14 = anticipatingContext;
    goto LABEL_6;
  }
  v14 = (GEOCompanionRouteContext *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
  if (v14)
  {
LABEL_6:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "companionRouteContext"));
    v16 = -[GEOCompanionRouteContext isEqual:](v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_21;
  }
  v17 = objc_msgSend(v7, "resolvedTransportType");
  if (v17 > 5)
    v18 = -1;
  else
    v18 = qword_100E37110[v17] - 2;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "companionRouteContext"));
  v20 = sub_10043380C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      if (v18 > 6)
        v23 = CFSTR("AUTOMOBILE");
      else
        v23 = *(&off_1011B5900 + v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "simpleDescription"));
      v31 = 138412546;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Anticipate routes from gizmo (transportType:%@, context:%@)", (uint8_t *)&v31, 0x16u);

    }
    lastPreviewedRouteID = self->_lastPreviewedRouteID;
    self->_lastPreviewedRouteID = 0;

    lastReceivedRouteIDs = self->_lastReceivedRouteIDs;
    self->_lastReceivedRouteIDs = 0;

    objc_storeStrong((id *)&self->_anticipatingContext, v19);
    v27 = (NanoRoutePlanningMutableRequest *)objc_msgSend(v7, "mutableCopy");
    request = self->_request;
    self->_request = v27;

    v29 = objc_alloc_init(NanoRoutePlanningMutableResponse);
    response = self->_response;
    self->_response = v29;

    -[NanoCompanionController _enterRoutePlanningForRequest:](self, "_enterRoutePlanningForRequest:", v7);
    v8[2](v8);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Cannot anticipate routes without a context", (uint8_t *)&v31, 2u);
    }

  }
LABEL_21:

}

- (void)updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSArray *v23;
  NSArray *lastReceivedRouteIDs;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  NanoRoutePlanningMutableRequest *v29;
  NanoRoutePlanningMutableRequest *request;
  NanoRoutePlanningMutableResponse *v31;
  NanoRoutePlanningMutableResponse *response;
  void *v33;
  GEOCompanionRouteContext *anticipatingContext;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  unsigned __int8 v39;
  void *v40;
  RouteCollection *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  RouteCollection *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v12 = sub_10043380C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412290;
    v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "companionRouteContext"));
  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routes"));
    v18 = sub_10039DCD4(v17, &stru_1011B56F8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (-[NSArray isEqualToArray:](self->_lastReceivedRouteIDs, "isEqualToArray:", v19))
    {
      v20 = sub_10043380C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "The routes which we just received are the same as the last ones we received; ignoring update route planning wi"
          "th response request",
          buf,
          2u);
      }

    }
    else
    {
      v23 = (NSArray *)objc_msgSend(v19, "copy");
      lastReceivedRouteIDs = self->_lastReceivedRouteIDs;
      self->_lastReceivedRouteIDs = v23;

      v25 = sub_10043380C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = -[NSObject count](v17, "count");
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "simpleDescription"));
        *(_DWORD *)buf = 134218242;
        v49 = v27;
        v50 = 2112;
        v51 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Update with %ld routes from gizmo (context:%@)", buf, 0x16u);

      }
      objc_storeStrong((id *)&self->_anticipatingContext, v16);
      v29 = (NanoRoutePlanningMutableRequest *)objc_msgSend(v9, "mutableCopy");
      request = self->_request;
      self->_request = v29;

      v31 = (NanoRoutePlanningMutableResponse *)objc_msgSend(v10, "mutableCopy");
      response = self->_response;
      self->_response = v31;

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
      if (v33)
      {
        v47 = -[RouteCollection initWithRoutes:currentRouteIndex:]([RouteCollection alloc], "initWithRoutes:currentRouteIndex:", v17, 0);
        v46 = objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:"));
        anticipatingContext = self->_anticipatingContext;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "configuration"));
        objc_msgSend(v36, "setCompanionContext:", anticipatingContext);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v17, "firstObject"));
        v38 = objc_msgSend(v37, "transportType");
        if (v38 == 2)
        {
          v39 = objc_msgSend(v37, "isWalkingOnlyTransitRoute");
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
          if ((v39 & 1) != 0)
          {
            v42 = (void *)v46;
            v41 = v47;
LABEL_18:
            v44 = 3;
          }
          else
          {
            v44 = 2;
LABEL_20:
            v42 = (void *)v46;
            v41 = v47;
          }
        }
        else
        {
          v43 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
          v44 = 1;
          v45 = v43 - 1;
          v42 = (void *)v46;
          v41 = v47;
          switch(v45)
          {
            case 0u:
            case 4u:
              goto LABEL_18;
            case 1u:
              break;
            case 2u:
              v44 = 5;
              break;
            case 3u:
              v44 = 0;
              break;
            case 5u:
              v44 = 4;
              break;
            default:
              goto LABEL_20;
          }
        }
        objc_msgSend(v40, "updateRouteCollectionResult:forTransportType:", v42, v44);

      }
      else
      {
        -[NanoCompanionController _enterRoutePlanningForRequest:](self, "_enterRoutePlanningForRequest:", v9);
      }
      v11[2](v11);
    }

  }
  else
  {
    v22 = sub_10043380C();
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cannot update routes without a context", buf, 2u);
    }
  }

}

- (void)updateRoutePlanningRequest:(id)a3 withSelectedRouteID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  __int128 *p_buf;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[4];
  id v37;
  __int128 buf;
  uint64_t v39;
  char v40;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v12 = sub_10043380C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", (uint8_t *)&buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v17 = v16 == 0;

  if (v17)
  {
    v26 = sub_10043380C();
    v20 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Attempting to select a route ID when a RoutePlanningSession is not currently active.", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRouteCollection"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routes"));

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x2020000000;
    v40 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID _maps_UUIDWithData:](NSUUID, "_maps_UUIDWithData:", v10));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1004158B0;
    v28[3] = &unk_1011B5720;
    v22 = v21;
    v29 = v22;
    v30 = &v32;
    p_buf = &buf;
    -[NSObject enumerateObjectsUsingBlock:](v20, "enumerateObjectsUsingBlock:", v28);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      objc_storeStrong((id *)&self->_lastPreviewedRouteID, v21);
      v23 = objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
      v24 = v33[3];
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
      -[NSObject setSelectedRouteIndex:forTransportType:](v23, "setSelectedRouteIndex:forTransportType:", v24, objc_msgSend(v25, "currentTransportType"));

    }
    else
    {
      v27 = sub_10043380C();
      v23 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v36 = 138412290;
        v37 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Cannot select route %@, doesn't match any we have locally", v36, 0xCu);
      }
    }

    v11[2](v11);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&buf, 8);
  }

}

- (void)clearRoutePlanningWithContext:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSArray *lastReceivedRouteIDs;
  NSUUID *lastPreviewedRouteID;
  GEOCompanionRouteContext *clearingContext;
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v9 = sub_10043380C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simpleDescription"));
    *(_DWORD *)buf = 138412546;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd with incoming route context: %@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
  if (objc_msgSend(v7, "isStaleComparedToContext:", v14))
  {
    v15 = sub_10043380C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_7:

      goto LABEL_16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simpleDescription"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "simpleDescription"));
    *(_DWORD *)buf = 138412546;
    v28 = v17;
    v29 = 2112;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Incoming context(%@) was stale compared to our current context(%@); ignoring clear route planning request",
      buf,
      0x16u);

LABEL_6:
    goto LABEL_7;
  }
  if (!v7 && v14 && objc_msgSend(v14, "origin") == 2)
  {
    v19 = sub_10043380C();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "simpleDescription"));
    *(_DWORD *)buf = 138412290;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received clear route planning without a context, and the current context is from companion (%@); dropping request",
      buf,
      0xCu);
    goto LABEL_6;
  }
  -[IPCServer navigationStateDidChangeTo:reason:](self->_ipcServer, "navigationStateDidChangeTo:reason:", 4, CFSTR("Directions were cleared"));
  objc_storeStrong((id *)&self->_clearingContext, v14);
  v20 = sub_10043380C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "simpleDescription"));
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Clearing preview routes and ending navigation (current context:%@)", buf, 0xCu);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100415D54;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  lastReceivedRouteIDs = self->_lastReceivedRouteIDs;
  self->_lastReceivedRouteIDs = 0;

  lastPreviewedRouteID = self->_lastPreviewedRouteID;
  self->_lastPreviewedRouteID = 0;

  clearingContext = self->_clearingContext;
  self->_clearingContext = 0;

  v8[2](v8);
LABEL_16:

}

- (void)failRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NanoRoutePlanningMutableRequest *v22;
  NanoRoutePlanningMutableRequest *request;
  NanoRoutePlanningMutableResponse *v24;
  NanoRoutePlanningMutableResponse *response;
  id v26;
  NSObject *v27;
  void *v28;
  IPCServer *ipcServer;
  void *v30;
  _QWORD block[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v12 = sub_10043380C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "companionRouteContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
  if (objc_msgSend(v16, "isStaleComparedToContext:", v17))
  {
    v18 = sub_10043380C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "simpleDescription"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "simpleDescription"));
      *(_DWORD *)buf = 138412546;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Incoming context(%@) was stale compared to our current context(%@); ignoring fail route planning request",
        buf,
        0x16u);

    }
  }
  else
  {
    v22 = (NanoRoutePlanningMutableRequest *)objc_msgSend(v9, "mutableCopy");
    request = self->_request;
    self->_request = v22;

    v24 = (NanoRoutePlanningMutableResponse *)objc_msgSend(v10, "mutableCopy");
    response = self->_response;
    self->_response = v24;

    v26 = sub_10043380C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "simpleDescription"));
      *(_DWORD *)buf = 138412290;
      v33 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Failing preview routes and ending navigation (context:%@)", buf, 0xCu);

    }
    ipcServer = self->_ipcServer;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastError"));
    -[IPCServer navigationStateDidChangeTo:reason:error:](ipcServer, "navigationStateDidChangeTo:reason:error:", 3, CFSTR("Directions not available"), v30);

    objc_storeStrong((id *)&self->_clearingContext, v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004160E8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v11[2](v11);
  }

}

- (void)_updateResponseWithRouteCollectionResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NanoRoutePlanningMutableResponse *v9;
  void *v10;
  id v11;
  NanoRoutePlanningMutableResponse *response;
  NanoRoutePlanningResponseSnapshot *responseSnapshot;
  NSHashTable *v14;
  NanoRoutePlanningMutableResponse *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  void *v26;
  void *v27;
  NSHashTable *observingRoutes;
  id v29;
  NSHashTable *v30;
  id v31;
  uint64_t v32;
  void *i;
  NSHashTable *v34;
  NSHashTable *v35;
  NSHashTable *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  id v42;
  unsigned int v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v4)
  {
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = sub_100416724;
    v71 = sub_100416734;
    v72 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = sub_100416724;
    v65 = sub_100416734;
    v66 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = sub_100416724;
    v59 = sub_100416734;
    v60 = 0;
    v53[4] = &v61;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10041673C;
    v54[3] = &unk_1011B5788;
    v54[4] = &v67;
    v54[5] = &v55;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1004167BC;
    v53[3] = &unk_1011B17D0;
    objc_msgSend(v4, "withValue:orError:", v54, v53);
    v5 = sub_10039DCD4((void *)v68[5], &stru_1011B57C8);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v68[5], "firstObject"));
    v7 = -[NanoRoutePlanningMutableResponse mutableCopy](self->_response, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = (NanoRoutePlanningMutableResponse *)v7;
    else
      v9 = objc_opt_new(NanoRoutePlanningMutableResponse);
    v15 = v9;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeInitializerData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "directionsRequest"));
    -[NanoRoutePlanningResponse setDirectionsRequest:](v15, "setDirectionsRequest:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeInitializerData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "directionsResponse"));
    -[NanoRoutePlanningResponse setDirectionsResponse:](v15, "setDirectionsResponse:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_traceRecordingData"));
    -[NanoRoutePlanningResponse setTraceRecordingData:](v15, "setTraceRecordingData:", v20);

    -[NanoRoutePlanningResponse setRoutes:](v15, "setRoutes:", v44);
    -[NanoRoutePlanningResponse setSelectedRouteID:](v15, "setSelectedRouteID:", v56[5]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse lastError](v15, "lastError"));
    v22 = (void *)v62[5];
    v23 = v21;
    v24 = v22;
    if (v23 | v24)
      v25 = objc_msgSend((id)v23, "isEqual:", v24);
    else
      v25 = 1;

    -[NanoRoutePlanningResponse setLastError:](v15, "setLastError:", v62[5]);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse snapshot](v15, "snapshot"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "deltaFromSnapshot:", self->_responseSnapshot));
    objc_storeStrong((id *)&self->_responseSnapshot, v26);
    objc_storeStrong((id *)&self->_response, v15);
    if (objc_msgSend(v6, "transportType") == 1)
    {
      observingRoutes = self->_observingRoutes;
      v43 = v25;
      if (observingRoutes)
      {
        v29 = v4;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v30 = observingRoutes;
        v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v50 != v32)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "unregisterObserver:", self);
            }
            v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
          }
          while (v31);
        }

        v4 = v29;
        -[NSHashTable removeAllObjects](self->_observingRoutes, "removeAllObjects");
      }
      else
      {
        v35 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
        v36 = self->_observingRoutes;
        self->_observingRoutes = v35;

      }
      v42 = v4;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v37 = v44;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v73, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(_QWORD *)v46 != v39)
              objc_enumerationMutation(v37);
            v41 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v41, "registerObserver:", self);
            -[NSHashTable addObject:](self->_observingRoutes, "addObject:", v41);
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v73, 16);
        }
        while (v38);
      }

      v4 = v42;
      v25 = v43;
    }
    if ((objc_msgSend(v27, "routeRevisionsChanged") | v25 ^ 1) == 1)
    {
      -[NanoCompanionController _sendUpdatedResponse](self, "_sendUpdatedResponse");
    }
    else if (objc_msgSend(v27, "selectedRouteChanged"))
    {
      -[NanoCompanionController _sendUpdatedSelectedRouteID](self, "_sendUpdatedSelectedRouteID");
    }

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
    v11 = objc_msgSend(v10, "sessionState");

    response = self->_response;
    if (v11 == (id)1)
    {
      self->_response = 0;

      responseSnapshot = self->_responseSnapshot;
      self->_responseSnapshot = 0;

      v14 = self->_observingRoutes;
      self->_observingRoutes = 0;

      -[NanoCompanionController _sendStubRouteDetailsIfNecessary](self, "_sendStubRouteDetailsIfNecessary");
    }
    else if (response)
    {
      self->_response = 0;

      v34 = self->_observingRoutes;
      self->_observingRoutes = 0;

      -[NanoCompanionController _clearRoutePreviews](self, "_clearRoutePreviews");
    }
  }

}

- (void)_updateResponseWithRoutesResult:(id)a3 routeUpdates:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id obj;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];

  v6 = a3;
  v23 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100416724;
  v36 = sub_100416734;
  v37 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100416BB4;
  v31[3] = &unk_1011B57F0;
  v31[4] = &v32;
  v21 = v6;
  objc_msgSend(v6, "withValue:orError:", v31, &stru_1011B5810);
  if (v33[5])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routes](self->_response, "routes"));
    v8 = objc_msgSend(v7, "mutableCopy");

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)v33[5];
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v9)
    {
      v22 = 0;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueRouteID"));
          v14 = v12;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100416BC8;
          v25[3] = &unk_1011B1A50;
          v15 = v13;
          v26 = v15;
          v16 = objc_msgSend(v8, "indexOfObjectPassingTest:", v25);
          if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v15));
            if (v17)
            {
              objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v16, v14);
              -[NanoRoutePlanningMutableResponse setObject:forUserInfoKey:forRouteID:](self->_response, "setObject:forUserInfoKey:forRouteID:", v17, CFSTR("transitRouteUpdate"), v15);
              v22 = 1;
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v9);

      if ((v22 & 1) == 0)
        goto LABEL_19;
      v18 = objc_msgSend(v8, "copy");
      -[NanoRoutePlanningResponse setRoutes:](self->_response, "setRoutes:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse snapshot](self->_response, "snapshot"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deltaFromSnapshot:", self->_responseSnapshot));
      objc_storeStrong((id *)&self->_responseSnapshot, v19);
      if (objc_msgSend(v20, "routeRevisionsChanged"))
        -[NanoCompanionController _sendUpdatedResponse](self, "_sendUpdatedResponse");

    }
    else
    {
      v19 = obj;
    }

LABEL_19:
  }
  _Block_object_dispose(&v32, 8);

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  NanoCompanionController *v11;

  v6 = a5;
  isolationQueue = self->_isolationQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100416C88;
  v9[3] = &unk_1011AC8B0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(isolationQueue, v9);

}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *routePlanningSession;
  NanoRoutePlanningResponseSnapshot *responseSnapshot;
  RoutePlanningSession *v7;

  v7 = (RoutePlanningSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v7)
  {
    -[RoutePlanningSession removeObserver:](routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    responseSnapshot = self->_responseSnapshot;
    self->_responseSnapshot = 0;

    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
  }

}

- (GEOCompanionRouteContext)sessionContext
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "companionContext"));

  return (GEOCompanionRouteContext *)v5;
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  NSObject *isolationQueue;
  _QWORD v5[6];

  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100416F60;
  v5[3] = &unk_1011AD518;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(isolationQueue, v5);
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  id v5;
  NSObject *isolationQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  NanoCompanionController *v10;

  v5 = a4;
  isolationQueue = self->_isolationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100417040;
  v8[3] = &unk_1011AC8B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(isolationQueue, v8);

}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  isolationQueue = self->_isolationQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004170F4;
  v9[3] = &unk_1011AC8B0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(isolationQueue, v9);

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NanoCompanionController *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100417254;
  v13[3] = &unk_1011B1C08;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(isolationQueue, v13);

}

- (void)routePlanningSession:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5
{
  id v7;
  id v8;
  NSObject *isolationQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100417340;
  block[3] = &unk_1011AD238;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(isolationQueue, block);

}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v7;
  NSObject *isolationQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v7 = a3;
  isolationQueue = self->_isolationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004173CC;
  v10[3] = &unk_1011AC8B0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(isolationQueue, v10);

}

- (void)_updateDestinationName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationWaypointRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedWaypoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[RoutePlanningSession mostAppropriateNameForWaypointWithRequest:composedWaypoint:](RoutePlanningSession, "mostAppropriateNameForWaypointWithRequest:composedWaypoint:", v5, v8));

  -[NanoCompanionController setDestinationName:](self, "setDestinationName:", v9);
  -[NanoCompanionController _sendStubRouteDetailsIfNecessary](self, "_sendStubRouteDetailsIfNecessary");

}

- (void)_sendStubRouteDetailsIfNecessary
{
  NanoRoutePlanningMutableResponse *response;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  if (objc_msgSend(v4, "sessionState") == (id)1)
  {
    response = self->_response;

    if (!response)
      -[NanoCompanionController _sendStubRouteDetails](self, "_sendStubRouteDetails");
  }
  else
  {

  }
}

- (void)_sendUpdatedResponse
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSXPCConnection *companionRoutesConnection;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSXPCConnection *v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[NanoCompanionController _createCompanionRoutesConnectionOnIsolationQueue](self, "_createCompanionRoutesConnectionOnIsolationQueue");
  v3 = sub_10043380C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[NanoRoutePlanningResponse numberOfRoutes](self->_response, "numberOfRoutes");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "simpleDescription"));
    companionRoutesConnection = self->_companionRoutesConnection;
    *(_DWORD *)buf = 134218498;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    v18 = 2114;
    v19 = companionRoutesConnection;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sending all (%lu) routes (context:%@) to %{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_companionRoutesConnection, "remoteObjectProxy"));
  v10 = -[NanoRoutePlanningMutableRequest copy](self->_request, "copy");
  v11 = -[NanoRoutePlanningMutableResponse copy](self->_response, "copy");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100417898;
  v12[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  objc_msgSend(v9, "updateRoutePlanningRequest:withResponse:completionHandler:", v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_sendStubRouteDetails
{
  uint64_t v3;
  void *v4;
  GEOCompanionRouteContext *anticipatingContext;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  GEOCompanionRouteContext *v10;
  void *v11;
  NanoRoutePlanningMutableRequest *v12;
  NanoRoutePlanningMutableRequest *request;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  GEOCompanionRouteContext *v20;
  NSXPCConnection *companionRoutesConnection;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  GEOCompanionRouteContext *v27;
  __int16 v28;
  NSXPCConnection *v29;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
  if (v3)
  {
    v4 = (void *)v3;
    anticipatingContext = self->_anticipatingContext;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
    LODWORD(anticipatingContext) = -[GEOCompanionRouteContext isEqual:](anticipatingContext, "isEqual:", v6);

    if (!(_DWORD)anticipatingContext)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NanoCompanionController _syntheticRouteDetailsForCurrentRequest](self, "_syntheticRouteDetailsForCurrentRequest"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NanoRoutePlanningRequest requestForDirectionsWithCompanionRouteDetails:companionRouteContext:](NanoRoutePlanningRequest, "requestForDirectionsWithCompanionRouteDetails:companionRouteContext:", v8, v11));

      v12 = (NanoRoutePlanningMutableRequest *)objc_msgSend(v9, "mutableCopy");
      request = self->_request;
      self->_request = v12;

      -[NanoCompanionController _createCompanionRoutesConnectionOnIsolationQueue](self, "_createCompanionRoutesConnectionOnIsolationQueue");
      v14 = sub_10043380C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = -[NSObject transportType](v8, "transportType");
        if (v16 >= 7)
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v16));
        else
          v17 = *(&off_1011B5938 + (int)v16);
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
        v20 = (GEOCompanionRouteContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "simpleDescription"));
        companionRoutesConnection = self->_companionRoutesConnection;

        *(_DWORD *)buf = 138412802;
        v25 = v17;
        v26 = 2112;
        v27 = v20;
        v28 = 2114;
        v29 = companionRoutesConnection;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Sending stub route with transport type:(%@) (context:%@) to %{public}@", buf, 0x20u);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_companionRoutesConnection, "remoteObjectProxy"));
      v23 = -[NanoRoutePlanningMutableRequest copy](self->_request, "copy");
      objc_msgSend(v22, "anticipateRoutePlanningRequest:completionHandler:", v23, &stru_1011B5830);

      goto LABEL_11;
    }
  }
  v7 = sub_10043380C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
    v10 = self->_anticipatingContext;
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Not sending stub route details (sessionContext: %@, anticipatingContext: %@)", buf, 0x16u);
LABEL_11:

  }
}

- (void)_sendUpdatedSelectedRouteID
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSXPCConnection *companionRoutesConnection;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSXPCConnection *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController _currentRouteID](self, "_currentRouteID"));
  -[NanoCompanionController _createCompanionRoutesConnectionOnIsolationQueue](self, "_createCompanionRoutesConnectionOnIsolationQueue");
  v4 = sub_10043380C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "simpleDescription"));
    companionRoutesConnection = self->_companionRoutesConnection;
    v11 = 138412802;
    v12 = v3;
    v13 = 2112;
    v14 = v7;
    v15 = 2114;
    v16 = companionRoutesConnection;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Sending selected route ID %@ (context:%@) to %{public}@", (uint8_t *)&v11, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_companionRoutesConnection, "remoteObjectProxy"));
  v10 = -[NanoRoutePlanningMutableRequest copy](self->_request, "copy");
  objc_msgSend(v9, "updateRoutePlanningRequest:withSelectedRouteID:completionHandler:", v10, v3, &stru_1011B5850);

}

- (id)_syntheticRouteDetailsForCurrentRequest
{
  void *v3;
  char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v4 = (char *)objc_msgSend(v3, "currentTransportType");
  if ((unint64_t)(v4 - 1) > 4)
    v5 = 4;
  else
    v5 = dword_100E37140[(_QWORD)(v4 - 1)];

  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100417E94;
  v12[3] = &unk_1011B5878;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateRequestsOrWaypointsUsingBlock:", v12);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController destinationName](self, "destinationName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCompanionRouteDetails syntheticRouteDetailsWithWaypoints:transportType:destinationName:](GEOCompanionRouteDetails, "syntheticRouteDetailsWithWaypoints:transportType:destinationName:", v8, v5, v9));

  return v10;
}

- (void)_clearRoutePreviews
{
  GEOCompanionRouteContext *clearingContext;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSXPCConnection *companionRoutesConnection;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  NSXPCConnection *v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  clearingContext = self->_clearingContext;
  if (clearingContext)
  {
    self->_clearingContext = 0;

  }
  else
  {
    -[NanoCompanionController _createCompanionRoutesConnectionOnIsolationQueue](self, "_createCompanionRoutesConnectionOnIsolationQueue");
    v4 = sub_10043380C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "simpleDescription"));
      companionRoutesConnection = self->_companionRoutesConnection;
      v11 = 138412546;
      v12 = v7;
      v13 = 2114;
      v14 = companionRoutesConnection;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing preview routes (context:%@) to %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_companionRoutesConnection, "remoteObjectProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController sessionContext](self, "sessionContext"));
    objc_msgSend(v9, "clearRoutePlanningWithContext:completionHandler:", v10, &stru_1011B5898);

  }
}

- (id)_currentRouteID
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRouteCollectionResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoCompanionController _routeIDFromRouteCollectionResult:](self, "_routeIDFromRouteCollectionResult:", v4));

  return v5;
}

- (id)_routeIDFromRouteCollectionResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100416724;
  v13 = sub_100416734;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100418328;
  v8[3] = &unk_1011B58C0;
  v8[4] = &v9;
  objc_msgSend(v3, "withValue:orError:", v8, &stru_1011B58E0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10[5], "currentRoute"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueRouteID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_data"));

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (IPCServer)ipcServer
{
  return self->_ipcServer;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_ipcServer, 0);
  objc_storeStrong((id *)&self->_observingRoutes, 0);
  objc_storeStrong((id *)&self->_responseSnapshot, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clearingContext, 0);
  objc_storeStrong((id *)&self->_anticipatingContext, 0);
  objc_storeStrong((id *)&self->_lastReceivedRouteIDs, 0);
  objc_storeStrong((id *)&self->_lastPreviewedRouteID, 0);
  objc_storeStrong((id *)&self->_companionRoutesConnection, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
