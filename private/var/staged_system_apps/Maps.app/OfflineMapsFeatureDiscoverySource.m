@implementation OfflineMapsFeatureDiscoverySource

- (OfflineMapsFeatureDiscoverySource)initWithInsights:(id)a3 locationUpdater:(id)a4 isActive:(BOOL)a5
{
  id v9;
  id v10;
  OfflineMapsFeatureDiscoverySource *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  FeatureDiscoveryModel *model;
  OfflineMapsSuggestionsDataProvider *v17;
  OfflineMapsSuggestionsDataProvider *dataProvider;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)OfflineMapsFeatureDiscoverySource;
  v11 = -[OfflineMapsFeatureDiscoverySource init](&v20, "init");
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsTip", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v11->_msgInsights, a3);
    model = v11->_model;
    v11->_model = 0;

    objc_storeStrong((id *)&v11->_locationUpdater, a4);
    v17 = -[OfflineMapsSuggestionsDataProvider initWithClientType:callbackQueue:]([OfflineMapsSuggestionsDataProvider alloc], "initWithClientType:callbackQueue:", 1, v11->_queue);
    dataProvider = v11->_dataProvider;
    v11->_dataProvider = v17;

    v11->_active = a5;
    v11->_showFeature = 0;
  }

  return v11;
}

- (id)offlineMapsDiscoveryModel
{
  return self->_model;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  OfflineMapsFeatureDiscoverySource *v4;
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

- (void)updateFeatureEligibility
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  if (self->_active)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6 != (id)1)
      {
        v7 = sub_100431D5C();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = (void *)objc_opt_class(self);
          v10 = v9;
          v11 = NSStringFromSelector(a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v18 = 138412546;
          v19 = v9;
          v20 = 2112;
          v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@: Offline Maps tip is only supported on iPhone and iPad.", (uint8_t *)&v18, 0x16u);

        }
        goto LABEL_13;
      }
    }
    else
    {

    }
    if ((-[MapsLocationUpdater startLocationUpdatesForDelegate:](self->_locationUpdater, "startLocationUpdatesForDelegate:", self) & 1) != 0)return;
    v17 = sub_100431D5C();
    v8 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v14 = "Could not start location updater for Offline Tip.";
      v15 = v8;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    v13 = sub_100431D5C();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      v14 = "The Offline Maps feature is NOT active. Is the feature flag on?";
      v15 = v8;
      v16 = OS_LOG_TYPE_INFO;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v18, 2u);
    }
  }
LABEL_13:

}

- (void)_notifyObservers
{
  if (self->_active)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
}

- (void)_showTipFromModelData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  FeatureDiscoveryModel *v10;
  FeatureDiscoveryModel *model;
  uint64_t v12;
  void *v13;
  FeatureDiscoveryModel *v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  v14 = [FeatureDiscoveryModel alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipSubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipActionTitle"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100495240;
  v23[3] = &unk_1011AFF10;
  objc_copyWeak(&v25, location);
  v23[4] = self;
  v8 = v4;
  v24 = v8;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1004953F0;
  v20[3] = &unk_1011AD1E8;
  objc_copyWeak(&v22, location);
  v21 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10049551C;
  v17[3] = &unk_1011AEAA0;
  v9 = v21;
  v18 = v9;
  objc_copyWeak(&v19, location);
  LOBYTE(v12) = 1;
  v10 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v14, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v13, v5, v6, v7, v23, 0, v20, v17, v12);
  model = self->_model;
  self->_model = v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100495620;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v16, location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);

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
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v4 = a3;
  v5 = sub_100431D5C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v7, "lat");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v10, "lng");
    *(_DWORD *)buf = 134283777;
    v17 = v9;
    v18 = 2049;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Offline Maps Tip - Received Location Update at %{private}f, %{private}f", buf, 0x16u);

  }
  -[MapsLocationUpdater stopLocationUpdates](self->_locationUpdater, "stopLocationUpdates");
  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004957E8;
  v13[3] = &unk_1011AD1E8;
  objc_copyWeak(&v15, (id *)buf);
  v14 = v4;
  v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
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

- (OfflineMapsFeatureDiscoveryActionDelegate)actionDelegate
{
  return (OfflineMapsFeatureDiscoveryActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_msgInsights, 0);
}

@end
