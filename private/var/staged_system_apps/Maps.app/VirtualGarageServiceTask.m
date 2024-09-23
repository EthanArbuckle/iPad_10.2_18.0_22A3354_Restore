@implementation VirtualGarageServiceTask

- (VirtualGarageServiceTask)init
{
  VirtualGarageServiceTask *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serviceQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VirtualGarageServiceTask;
  v2 = -[VirtualGarageServiceTask init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.Maps.VirtualGarageServiceTask.configDelegate", v4);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v5;

    -[VirtualGarageServiceTask _setupVirtualGarageIfNeeded](v2, "_setupVirtualGarageIfNeeded");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  MapsFeature_RemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)VirtualGarageServiceTask;
  -[VirtualGarageServiceTask dealloc](&v3, "dealloc");
}

- (void)_setupVirtualGarageIfNeeded
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[VirtualGarageServiceTask serviceQueue](self, "serviceQueue"));
  MapsFeature_AddDelegateListener(MapsFeaturesConfig_EnableEVRouting[0], MapsFeaturesConfig_EnableEVRouting[1], v3, self);
  MapsFeature_AddDelegateListener(MapsFeaturesConfig_EnableAlberta[0], MapsFeaturesConfig_EnableAlberta[1], v3, self);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008976CC;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

- (void)_tearDownVirtualGarage
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v3, "closeForClient:", self);

}

- (void)setUsesVirtualGarage:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (self->_usesVirtualGarage != a3)
  {
    v3 = a3;
    self->_usesVirtualGarage = a3;
    v5 = sub_1004326FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "usesVirtualGarage changed. will open virtual garage connection", buf, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      objc_msgSend(v8, "openForClient:", self);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "addObserver:selector:name:object:", self, "_mapsTerminated:", UIApplicationWillTerminateNotification, 0);

      v10 = objc_claimAutoreleasedReturnValue(-[VirtualGarageServiceTask serviceQueue](self, "serviceQueue"));
      dispatch_async(v10, &stru_1011DA128);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "usesVirtualGarage changed. will close virtual garage connection", v11, 2u);
      }

      -[VirtualGarageServiceTask _tearDownVirtualGarage](self, "_tearDownVirtualGarage");
      v10 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject removeObserver:name:object:](v10, "removeObserver:name:object:", self, UIApplicationWillTerminateNotification, 0);
    }

  }
}

- (void)_mapsTerminated:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[VirtualGarageServiceTask serviceQueue](self, "serviceQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100897AD4;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4
{
  BOOL v5;
  BOOL v6;
  uint64_t IsEnabled_EVRouting;
  uint64_t IsEnabled_Alberta;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;

  v5 = a3.var0.var0 == LODWORD(MapsFeaturesConfig_EnableEVRouting[0])
    && a3.var0.var1 == (void *)MapsFeaturesConfig_EnableEVRouting[1];
  if (v5
    || (a3.var0.var0 == LODWORD(MapsFeaturesConfig_EnableAlberta[0])
      ? (v6 = a3.var0.var1 == (void *)MapsFeaturesConfig_EnableAlberta[1])
      : (v6 = 0),
        v6))
  {
    IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(self, a2);
    if ((IsEnabled_EVRouting & 1) != 0)
      IsEnabled_Alberta = 1;
    else
      IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting);
    v9 = sub_1004326FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if ((_DWORD)IsEnabled_Alberta)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      if (MapsFeature_IsEnabled_EVRouting(v12, v13))
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      if (MapsFeature_IsEnabled_Alberta(v15))
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = v16;
      v18 = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GEOConfigs changed. VirtualGarageIsEnabled: %@, evRoutingEnabled: %@, albertaEnabled: %@", (uint8_t *)&v18, 0x20u);

    }
    -[VirtualGarageServiceTask setUsesVirtualGarage:](self, "setUsesVirtualGarage:", IsEnabled_Alberta);
  }
}

+ (int64_t)creationPreference
{
  return 1;
}

- (BOOL)usesVirtualGarage
{
  return self->_usesVirtualGarage;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
