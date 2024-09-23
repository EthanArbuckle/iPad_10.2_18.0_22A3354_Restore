@implementation _GDBAManager

- (_GDBAManager)init
{
  _GDBAManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  os_log_t v7;
  OS_os_log *log;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *authorizationSemaphore;
  NSObject *v11;
  NSObject *v12;
  id *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id *v18;
  uint8_t buf[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_GDBAManager;
  v2 = -[_GDBAManager init](&v20, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.griddatad.locmonitor.queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = os_log_create("com.apple.gds", "geoDataReader");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

    v9 = dispatch_semaphore_create(0);
    authorizationSemaphore = v2->_authorizationSemaphore;
    v2->_authorizationSemaphore = (OS_dispatch_semaphore *)v9;

    v11 = v2->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initializing delegate", buf, 2u);
    }
    v12 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002964;
    block[3] = &unk_100008330;
    v13 = v2;
    v18 = v13;
    dispatch_sync(v12, block);
    v14 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.griddatad.registration"));
    v15 = v13[3];
    v13[3] = v14;

    objc_msgSend(v13[3], "setDelegate:", v13);
    objc_msgSend(v13[3], "resume");

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10000CE30 != -1)
    dispatch_once(&qword_10000CE30, &stru_100008370);
  return (id)qword_10000CE28;
}

+ (id)loadNumberForPreferenceKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.gridDataServices"), kCFPreferencesAnyUser, kCFPreferencesAnyHost);
}

+ (void)saveNumber:(id)a3 forKey:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.gridDataServices"), kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(CFSTR("com.apple.gridDataServices"), kCFPreferencesAnyUser, kCFPreferencesAnyHost);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  OS_os_log *log;
  int v7;
  id v8;

  v5 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Location Manager failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (id)boundaryPolygons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  OS_os_log *log;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  OS_os_log *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  unsigned __int8 v20;
  OS_os_log *v21;
  void *v22;
  OS_os_log *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;

  v3 = (void *)os_transaction_create("com.apple.griddatad.boundaryPolygons", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_GDBAManager loadNumberForPreferenceKey:](_GDBAManager, "loadNumberForPreferenceKey:", CFSTR("polygonsFetchDate")));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    if (v7 > -2592000.0)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Polygons were fetched in last 30 days", buf, 2u);
      }
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/db/GridData"), CFSTR("polygons.json")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v9));
      v11 = v10;
      if (v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
        v13 = objc_msgSend(v12, "count");

        if (v13)
          goto LABEL_21;
      }

    }
  }
  v14 = self->_log;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Fetching polygons", buf, 2u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_GDSBalancingAuthority fetchBalancingAuthorityPolygons](_GDSBalancingAuthority, "fetchBalancingAuthorityPolygons"));
  v11 = v15;
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v29 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/db/GridData"), CFSTR("polygons.json")));
      if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v18, &v29) & 1) != 0)
      {
        v19 = 0;
      }
      else
      {
        v28 = 0;
        v20 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/db/GridData"), 1, 0, &v28);
        v19 = v28;
        if ((v20 & 1) == 0)
        {
          v21 = self->_log;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
            sub_100004DFC((uint64_t)v19, v21);
        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));
      v27 = v19;
      objc_msgSend(v11, "writeToURL:error:", v22, &v27);
      v9 = v27;

      v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v18;
        v32 = 2112;
        v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Wrote to File %@. Error: %@", buf, 0x16u);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v24, "timeIntervalSinceReferenceDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      +[_GDBAManager saveNumber:forKey:](_GDBAManager, "saveNumber:forKey:", v25, CFSTR("polygonsFetchDate"));

LABEL_21:
    }
  }

  return v11;
}

- (void)updateBAStatus
{
  void *v3;
  id v4;
  NSMutableDictionary *clientIDToLocationManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_GDSBalancingAuthority loadBalancingAuthorityStatus](_GDSBalancingAuthority, "loadBalancingAuthorityStatus"));
  v4 = objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  clientIDToLocationManager = self->_clientIDToLocationManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003034;
  v7[3] = &unk_100008398;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientIDToLocationManager, "enumerateKeysAndObjectsUsingBlock:", v7);
  +[_GDSBalancingAuthority saveBalancingAuthorityStatus:](_GDSBalancingAuthority, "saveBalancingAuthorityStatus:", v6);

}

- (void)updateBA
{
  NSObject *v3;
  id v4;
  _QWORD block[5];

  v4 = (id)os_transaction_create("com.apple.griddatad.updateBA", a2);
  v3 = objc_claimAutoreleasedReturnValue(-[_GDBAManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003224;
  block[3] = &unk_100008330;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)setupLocationManagerForPath:(id)a3 identifier:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *clientIDToLocationManager;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!self->_clientIDToLocationManager)
  {
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    clientIDToLocationManager = self->_clientIDToLocationManager;
    self->_clientIDToLocationManager = v7;

  }
  v9 = objc_alloc((Class)CLLocationManager);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v12));
  v11 = objc_msgSend(v9, "initWithEffectiveBundle:delegate:onQueue:", v10, self, self->_queue);

  objc_msgSend(v11, "setDesiredAccuracy:", 3000.0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientIDToLocationManager, "setObject:forKeyedSubscript:", v11, v6);
  -[_GDBAManager updateBAStatus](self, "updateBAStatus");

}

- (void)registerClientID:(id)a3 locationBundlePath:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AFC;
  block[3] = &unk_100008510;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)updateBAClientID:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  OS_os_log *log;
  int v9;
  id v10;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Received request for BA update from %@!", (uint8_t *)&v9, 0xCu);
  }
  -[_GDBAManager updateBA](self, "updateBA");
  v7[2](v7, 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  _DWORD v16[2];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_100004F90();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.griddata.allow")));
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v11 = log;
      v16[0] = 67109120;
      v16[1] = objc_msgSend(v7, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Listener accepted new connection from PID %d\n", (uint8_t *)v16, 8u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____GDSManagerProtocol));
    objc_msgSend(v7, "setExportedInterface:", v12);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "resume");
    v13 = 1;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[_GDBAManager log](self, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100004F08(v7, v14);

    v13 = 0;
  }

  return v13;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_semaphore)authorizationSemaphore
{
  return self->_authorizationSemaphore;
}

- (void)setAuthorizationSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationSemaphore, a3);
}

- (NSMutableDictionary)clientIDToLocationManager
{
  return self->_clientIDToLocationManager;
}

- (void)setClientIDToLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_clientIDToLocationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIDToLocationManager, 0);
  objc_storeStrong((id *)&self->_authorizationSemaphore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
