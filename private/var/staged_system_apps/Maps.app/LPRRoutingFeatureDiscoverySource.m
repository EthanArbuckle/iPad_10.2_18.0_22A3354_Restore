@implementation LPRRoutingFeatureDiscoverySource

- (LPRRoutingFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6;
  LPRRoutingFeatureDiscoverySource *v7;
  LPRRoutingFeatureDiscoverySource *v8;
  id v9;
  const char *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *isolationQueue;
  id v15;
  const char *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *callbackQueue;
  void *v21;
  unint64_t modelViewedTimes;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)LPRRoutingFeatureDiscoverySource;
  v7 = -[LPRRoutingFeatureDiscoverySource init](&v30, "init");
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.maps.featurediscovery.lprrouting.isolation.%p"), v8)));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create(v10, v12);
    isolationQueue = v8->_isolationQueue;
    v8->_isolationQueue = (OS_dispatch_queue *)v13;

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.maps.featurediscovery.lprrouting.callback.%p"), v8)));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create(v16, v18);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8->_modelViewedTimes = (unint64_t)objc_msgSend(v21, "integerForKey:", CFSTR("LPRRoutingFeatureDiscoverySourceViewedTimesKey"));

    modelViewedTimes = v8->_modelViewedTimes;
    if (modelViewedTimes < GEOConfigGetUInteger(MapsConfig_LPRMaxNumberOfFeatureDiscoveryViews, off_1014B38C8))
    {
      objc_initWeak(&location, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      objc_msgSend(v23, "registerObserver:", v8);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1006AA8DC;
      v27[3] = &unk_1011AD100;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v24, "virtualGarageGetGarageWithReply:", v27);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    _GEOConfigAddDelegateListenerForKey(MapsFeaturesConfig_EnableAlberta[0], MapsFeaturesConfig_EnableAlberta[1], &_dispatch_main_q, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v8, "_reloadAvailability", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)LPRRoutingFeatureDiscoverySource;
  -[LPRRoutingFeatureDiscoverySource dealloc](&v3, "dealloc");
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  NSObject *isolationQueue;
  _QWORD block[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006AAAC0;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(isolationQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (BOOL)isAvailable
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006AABA0;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAvailable:(BOOL)a3
{
  NSObject *isolationQueue;
  _QWORD v6[5];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1006AAC58;
  v6[3] = &unk_1011B0408;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v6[4] = self;
  dispatch_async(isolationQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (FeatureDiscoveryModel)model
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FeatureDiscoveryModel *v13;
  uint64_t v15;
  FeatureDiscoveryModel *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];

  v3 = -[LPRRoutingFeatureDiscoverySource isAvailable](self, "isAvailable");
  v4 = sub_1004321BC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will suggest LPR routing.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v16 = [FeatureDiscoveryModel alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Try LPR title [Title, Route Planning, Feature Discovery, LPR]"), CFSTR("localized string not found"), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Try LPR subtitle [Subtitle, Route Planning, Feature Discovery, LPR]"), CFSTR("localized string not found"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add Plate"), CFSTR("localized string not found"), 0));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1006AB0D0;
    v21[3] = &unk_1011AD260;
    objc_copyWeak(&v22, buf);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1006AB0FC;
    v19[3] = &unk_1011AD260;
    objc_copyWeak(&v20, buf);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1006AB128;
    v17[3] = &unk_1011AD260;
    objc_copyWeak(&v18, buf);
    LOBYTE(v15) = 0;
    v13 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v16, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", 0, v8, v10, v12, v21, 0, v19, v17, v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);

    objc_destroyWeak(buf);
  }
  else
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will not suggest LPR routing: it is not available.", (uint8_t *)buf, 2u);
    }

    v13 = 0;
  }
  return v13;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 0;
}

- (void)_dismiss
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, 671, 0);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006AB204;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didViewModel
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2186, 504, 0);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006AB33C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didSelectModel
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2115, 504, 0);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1011C0068);
}

- (unint64_t)numberOfLPRLVehicles
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LPRRoutingFeatureDiscoverySource virtualGarage](self, "virtualGarage", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "vehicles"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "licensePlate"));

        if (v9)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_reloadAvailability
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006AB728;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == LODWORD(MapsFeaturesConfig_EnableAlberta[0]) && a3.var1 == (void *)MapsFeaturesConfig_EnableAlberta[1])
    -[LPRRoutingFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006ABA64;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (FeatureDiscoverySourceDelegate)delegate
{
  return (FeatureDiscoverySourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (void)setVirtualGarage:(id)a3
{
  objc_storeStrong((id *)&self->_virtualGarage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
