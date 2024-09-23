@implementation EVRoutingFeatureDiscoverySource

- (EVRoutingFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6;
  EVRoutingFeatureDiscoverySource *v7;
  EVRoutingFeatureDiscoverySource *v8;
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
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EVRoutingFeatureDiscoverySource;
  v7 = -[EVRoutingFeatureDiscoverySource init](&v23, "init");
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.maps.featurediscovery.evrouting.isolation.%p"), v8)));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create(v10, v12);
    isolationQueue = v8->_isolationQueue;
    v8->_isolationQueue = (OS_dispatch_queue *)v13;

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.maps.featurediscovery.evrouting.callback.%p"), v8)));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create(v16, v18);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v21, "registerObserver:", v8);

    -[EVRoutingFeatureDiscoverySource _loadUpairedVehicles](v8, "_loadUpairedVehicles");
  }

  return v8;
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
  v5[2] = sub_100BCDA78;
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
  v6[2] = sub_100BCDB30;
  v6[3] = &unk_1011B0408;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v6[4] = self;
  dispatch_async(isolationQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
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
  block[2] = sub_100BCDD90;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(isolationQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (FeatureDiscoveryModel)model
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSArray *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImage *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  FeatureDiscoveryModel *v32;
  uint64_t v33;
  FeatureDiscoveryModel *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id buf[2];

  v3 = -[EVRoutingFeatureDiscoverySource isAvailable](self, "isAvailable");
  v4 = sub_1004321BC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will suggest EV routing.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v34 = [FeatureDiscoveryModel alloc];
    v7 = self->_unpairedVehicles;
    if ((id)-[NSArray count](v7, "count") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v7, "firstObject"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pairedAppIdentifier"));
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }
    if (-[NSArray count](v7, "count") < 2)
      v12 = 0;
    else
      v12 = sub_100BA0B0C(v7);
    if ((v10 | v12) == 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v7, "firstObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairedAppIdentifier"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v15, "scale");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v14, 0));

    }
    else
    {
      v17 = sub_100BA0DB8();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
    }

    v18 = sub_100BA0C48(self->_unpairedVehicles);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Try EV subtitle [Subtitle, Route Planning, Feature Discovery, EV]"), CFSTR("localized string not found"), 0));
    v22 = self->_unpairedVehicles;
    if (-[NSArray count](v22, "count"))
    {
      if ((id)-[NSArray count](v22, "count") == (id)1 || sub_100BA0B0C(v22))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v22, "firstObject"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "iapIdentifier"));
        if (v24
          && (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "siriIntentsIdentifier")),
              v25,
              v24,
              !v25))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Try EV action button with single vehicle (CarPlay) [Action, Route Planning, Feature Discovery, EV]"), CFSTR("localized string not found"), 0));

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "manufacturer"));
          v29 = v28;
          if (!v28)
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayName"));
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Try EV action button with single vehicle (SiriIntents) [Action, Route Planning, Feature Discovery, EV]"), CFSTR("localized string not found"), 0));

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "manufacturer"));
          v29 = v28;
          if (!v28)
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayName"));
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v29));
        if (!v28)
        {

          v28 = 0;
        }

      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Try EV action button with multiple vehicles [Action, Route Planning, Feature Discovery, EV]"), CFSTR("localized string not found"), 0));
      }

    }
    else
    {
      v30 = 0;
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100BCE2E0;
    v39[3] = &unk_1011AD260;
    objc_copyWeak(&v40, buf);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100BCE30C;
    v37[3] = &unk_1011AD260;
    objc_copyWeak(&v38, buf);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100BCE338;
    v35[3] = &unk_1011AD260;
    objc_copyWeak(&v36, buf);
    LOBYTE(v33) = 0;
    v32 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v34, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v16, v19, v21, v30, v39, 0, v37, v35, v33);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);

    objc_destroyWeak(buf);
    return v32;
  }
  else
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will not suggest EV routing: it is not available.", (uint8_t *)buf, 2u);
    }

    return (FeatureDiscoveryModel *)0;
  }
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 0;
}

- (void)setUnpairedVehicles:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;

  v5 = a3;
  v6 = self->_unpairedVehicles;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_unpairedVehicles, a3);
      v9 = sub_1004326FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (id)v7;
        v12 = v11;
        if (v7)
        {
          if (objc_msgSend(v11, "count"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v12, v13));

          }
          else
          {
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v12));
          }
        }
        else
        {
          v14 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "RoutePlanning did update unpaired vehicles: %@", buf, 0xCu);

      }
      -[EVRoutingFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
    }
  }

}

- (void)_dismiss
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BCE598;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didViewModel
{
  void *v3;
  NSObject *isolationQueue;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 449, 8, 0);

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BCE6E0;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  dispatch_async(isolationQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_didSelectModel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 451, 8, 0);

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BCE8A4;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowVehicleCombination:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = sub_10039DCD4(v3, &stru_1011E8310);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_1011E8330));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_")));

  }
  else
  {
    v7 = 0;
  }
  v8 = sub_100BA0DCC(v7);

  return v8;
}

- (void)_markCurrentVehicleCombinationAsViewed
{
  NSArray *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = self->_unpairedVehicles;
  if (-[NSArray count](v2, "count"))
  {
    v3 = sub_10039DCD4(v2, &stru_1011E8310);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_1011E8330));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_")));

  }
  else
  {
    v6 = 0;
  }

  sub_100BA106C(v6);
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
  v4[2] = sub_100BCEB40;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_loadUpairedVehicles
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100BCEDE0;
  v3[3] = &unk_1011AD9D0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5;
  NSObject *isolationQueue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BCF030;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v10);
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

- (NSArray)unpairedVehicles
{
  return self->_unpairedVehicles;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
