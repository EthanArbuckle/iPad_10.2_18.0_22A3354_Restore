@implementation TransitPayFeatureDiscoverySource

- (TransitPayFeatureDiscoverySource)initWithInsights:(id)a3 paymentPolygonFetcher:(id)a4 locationUpdater:(id)a5 isActive:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  TransitPayFeatureDiscoverySource *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  PaymentPolygonCache *v19;
  PaymentPolygonCache *polygonCache;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TransitPayFeatureDiscoverySource;
  v14 = -[TransitPayFeatureDiscoverySource init](&v23, "init");
  if (v14)
  {
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("com.apple.Maps.Home.TransitPay", v16);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v14->_msgInsights, a3);
    objc_storeStrong((id *)&v14->_paymentPolygonFetcher, a4);
    objc_storeStrong((id *)&v14->_locationUpdater, a5);
    v14->_active = a6;
    v14->_showFeature = 0;
    v19 = objc_alloc_init(PaymentPolygonCache);
    polygonCache = v14->_polygonCache;
    v14->_polygonCache = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v14, "transitPayTipDismissedInRoutePlanning:", CFSTR("TransitPayTipDismissedInRoutePlanningNotification"), 0);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[MapsLocationUpdater stopLocationUpdates](self->_locationUpdater, "stopLocationUpdates");
  v4.receiver = self;
  v4.super_class = (Class)TransitPayFeatureDiscoverySource;
  -[TransitPayFeatureDiscoverySource dealloc](&v4, "dealloc");
}

- (id)transitPayDiscoveryModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  FeatureDiscoveryModel *v7;
  FeatureDiscoveryModel *model;
  FeatureDiscoveryModel *v9;
  id v10;
  NSObject *v11;
  uint64_t v13;
  FeatureDiscoveryModel *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id location[2];

  if (self->_modelData)
  {
    objc_initWeak(location, self);
    v14 = [FeatureDiscoveryModel alloc];
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData image](self->_modelData, "image"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData title](self->_modelData, "title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData subtitle](self->_modelData, "subtitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData actionTitle](self->_modelData, "actionTitle"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002E6620;
    v19[3] = &unk_1011AD1E8;
    objc_copyWeak(&v20, location);
    v19[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002E68B0;
    v17[3] = &unk_1011AEAA0;
    v17[4] = self;
    objc_copyWeak(&v18, location);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002E69F4;
    v15[3] = &unk_1011AEAA0;
    v15[4] = self;
    objc_copyWeak(&v16, location);
    LOBYTE(v13) = 1;
    v7 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v14, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v3, v4, v5, v6, v19, 0, v17, v15, v13);
    model = self->_model;
    self->_model = v7;

    v9 = self->_model;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = sub_10043253C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_modelData is not populated. Returning.", (uint8_t *)location, 2u);
    }

    v9 = 0;
  }
  return v9;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  TransitPayFeatureDiscoverySource *v4;
  GEOObserverHashTable *v5;
  GEOObserverHashTable *v6;

  observers = self->_observers;
  if (!observers)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v6 = self->_observers;
    self->_observers = v5;

    objc_sync_exit(v4);
    observers = self->_observers;
  }
  return observers;
}

- (void)transitPassManagerDidChange:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002E6BE8;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)updateFeatureEligibility
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;

  if (self->_active)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5)
    {
      v6 = sub_10043253C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (void *)objc_opt_class(self);
        v9 = v8;
        v10 = NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@: User is not using an iPhone", buf, 0x16u);

      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1002E6E00;
      v14[3] = &unk_1011B0AC0;
      objc_copyWeak(&v15, (id *)buf);
      -[TransitPayFeatureDiscoverySource _fetchInsightsWithCompletion:](self, "_fetchInsightsWithCompletion:", v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v12 = sub_10043253C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "The feature is NOT active. Returning. Is the feature flag on?", buf, 2u);
    }

  }
}

- (void)_fetchInsightsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  TransitPayFeatureDiscoverySource *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  id location;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E7140;
  block[3] = &unk_1011B0B60;
  objc_copyWeak(&v15, &location);
  v13 = v19;
  v14 = v17;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (void)_notifyObservers
{
  if (self->_active)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
}

- (BOOL)_hasPaymentAndSuggestionsData:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  int v18;
  NSObject *v19;

  v5 = a3;
  v6 = a4;
  if (!v6 && objc_msgSend(v5, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject supportedTransitPaymentMethods](v8, "supportedTransitPaymentMethods"));
    v11 = v10;
    if (v10 && objc_msgSend(v10, "count"))
    {
      v12 = objc_claimAutoreleasedReturnValue(-[NSObject transitPaymentMethodSuggestions](v8, "transitPaymentMethodSuggestions"));
      v13 = v12;
      if (v12 && -[NSObject count](v12, "count"))
      {
        v9 = 1;
LABEL_17:

        goto LABEL_18;
      }
      v15 = sub_10043253C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GEOMapItem %@ does not contain any transit payment method suggestions", (uint8_t *)&v18, 0xCu);
      }

    }
    else
    {
      v14 = sub_10043253C();
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "The map item does not support any transit payment methods", (uint8_t *)&v18, 2u);
      }
    }
    v9 = 0;
    goto LABEL_17;
  }
  v7 = sub_10043253C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unable to get GEOMapItems (either error or 0 were returned). Error: %@", (uint8_t *)&v18, 0xCu);
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (void)didUpdateLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *queue;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v4 = a3;
  v5 = sub_10043253C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v7, "lat");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v10, "lng");
    *(_DWORD *)buf = 134283777;
    v18 = v9;
    v19 = 2049;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Maps Home - Received Location Update at %{private}f, %{private}f", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002E78B4;
  v14[3] = &unk_1011AD1E8;
  objc_copyWeak(&v16, (id *)buf);
  v15 = v4;
  v13 = v4;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)transitPayTipDismissedInRoutePlanning:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t currentMarketMUID;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id buf[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("TransitPayTipDismissedInRoutePlanningNotificationMarketMUIDKey")));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedLongLongValue");
    currentMarketMUID = self->_currentMarketMUID;
    v9 = sub_10043253C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if ((id)currentMarketMUID == v7)
    {
      if (v11)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Hiding tip in Maps Home as it was dismissed in route planning.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002E80B8;
      block[3] = &unk_1011AD260;
      objc_copyWeak(&v15, buf);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v15);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v11)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "NOT hiding tip in Maps Home as it had different MUID than the one dismissed in route planning.", (uint8_t *)buf, 2u);
      }

    }
  }
  else
  {
    v12 = sub_10043253C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "No market MUID was passed with the route planning tip dismissal", (uint8_t *)buf, 2u);
    }

  }
}

- (void)fetchTransitMessageFromPassManagerUsingPolygon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TransitPassManager *passManager;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitPaymentMethodSuggestions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  self->_currentMarketMUID = (unint64_t)objc_msgSend(v6, "marketMUID");

  passManager = self->_passManager;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportedTransitPaymentMethods"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitPaymentMethodSuggestions"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002E81D0;
  v10[3] = &unk_1011B0BD8;
  v10[4] = self;
  -[TransitPassManager fetchTransitMessageForRoute:paymentMethods:suggestions:completion:](passManager, "fetchTransitMessageForRoute:paymentMethods:suggestions:completion:", 0, v8, v9, v10);

}

- (void)paymentSetupViewController:(id)a3 didFinishAddingPaymentPasses:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  void *v13;

  v6 = a5;
  if (v6)
  {
    v7 = sub_10043253C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Maps Home - Failed to provision transit card: %@", buf, 0xCu);

    }
    -[FeatureDiscoveryModel markActionExecuted:](self->_model, "markActionExecuted:", 0);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002E8538;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)hasInitialData
{
  return self->hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void)setShowFeature:(BOOL)a3
{
  self->_showFeature = a3;
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return (TransitPayActionDelegate *)objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);
}

- (void)setTransitPayActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitPayActionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_polygonCache, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_passManager, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_paymentPolygonFetcher, 0);
  objc_storeStrong((id *)&self->_msgInsights, 0);
}

@end
