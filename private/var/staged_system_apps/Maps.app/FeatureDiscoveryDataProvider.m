@implementation FeatureDiscoveryDataProvider

- (FeatureDiscoveryDataProvider)init
{
  FeatureDiscoveryDataProvider *v2;
  NearbyTransitFeatureDiscoverySource *v3;
  NearbyTransitFeatureDiscoverySource *nearbyTransitDiscoverySource;
  void *v5;
  id v6;
  void *v7;
  RealPaymentPolygonFetcher *v8;
  MapsRealLocationUpdater *v9;
  TransitPayFeatureDiscoverySource *v10;
  void *v11;
  TransitPayFeatureDiscoverySource *v12;
  TransitPayFeatureDiscoverySource *transitPayDiscoverySource;
  void *v14;
  OfflineMapsFeatureDiscoverySource *v15;
  void *v16;
  OfflineMapsFeatureDiscoverySource *v17;
  OfflineMapsFeatureDiscoverySource *offlineMapsFeatureDiscoverySource;
  void *v19;
  OfflineMapsDownloadFeatureTipSource *v20;
  OfflineMapsDownloadFeatureTipSource *offlineMapsDownloadFeatureTipSource;
  void *v22;
  OfflineMapsPairedDeviceDiskSpaceTipSource *v23;
  OfflineMapsPairedDeviceDiskSpaceTipSource *offlineMapsPairedDeviceDiskSpaceTipSource;
  void *v25;
  EVRoutingFeatureDiscoverySource *v26;
  EVRoutingFeatureDiscoverySource *evRoutingFeatureDiscoverySource;
  PreferredNetworksFeatureDiscoverySource *v28;
  PreferredNetworksFeatureDiscoverySource *preferredNetworkFeatureDiscoverySource;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)FeatureDiscoveryDataProvider;
  v2 = -[FeatureDiscoveryDataProvider init](&v32, "init");
  if (v2)
  {
    _GEOConfigAddDelegateListenerForKey(MapsConfig_LagunaBeachHasShownTipKitAlert, off_1014B3A68, &_dispatch_main_q, v2);
    v3 = objc_alloc_init(NearbyTransitFeatureDiscoverySource);
    nearbyTransitDiscoverySource = v2->_nearbyTransitDiscoverySource;
    v2->_nearbyTransitDiscoverySource = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource observers](v2->_nearbyTransitDiscoverySource, "observers"));
    objc_msgSend(v5, "registerObserver:", v2);

    -[NearbyTransitFeatureDiscoverySource updateFeatureAvailabilityIfNecessary](v2->_nearbyTransitDiscoverySource, "updateFeatureAvailabilityIfNecessary");
    v6 = sub_100B3A5D4();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_alloc_init(RealPaymentPolygonFetcher);
    v9 = objc_alloc_init(MapsRealLocationUpdater);
    v10 = [TransitPayFeatureDiscoverySource alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "oneInsights"));
    v12 = -[TransitPayFeatureDiscoverySource initWithInsights:paymentPolygonFetcher:locationUpdater:isActive:](v10, "initWithInsights:paymentPolygonFetcher:locationUpdater:isActive:", v11, v8, v9, MapsFeature_IsEnabled_TransitPay());
    transitPayDiscoverySource = v2->_transitPayDiscoverySource;
    v2->_transitPayDiscoverySource = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayFeatureDiscoverySource observers](v2->_transitPayDiscoverySource, "observers"));
    objc_msgSend(v14, "registerObserver:", v2);

    -[TransitPayFeatureDiscoverySource updateFeatureEligibility](v2->_transitPayDiscoverySource, "updateFeatureEligibility");
    v15 = [OfflineMapsFeatureDiscoverySource alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "oneInsights"));
    v17 = -[OfflineMapsFeatureDiscoverySource initWithInsights:locationUpdater:isActive:](v15, "initWithInsights:locationUpdater:isActive:", v16, v9, GEOSupportsOfflineMaps());
    offlineMapsFeatureDiscoverySource = v2->_offlineMapsFeatureDiscoverySource;
    v2->_offlineMapsFeatureDiscoverySource = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsFeatureDiscoverySource observers](v2->_offlineMapsFeatureDiscoverySource, "observers"));
    objc_msgSend(v19, "registerObserver:", v2);

    -[OfflineMapsFeatureDiscoverySource updateFeatureEligibility](v2->_offlineMapsFeatureDiscoverySource, "updateFeatureEligibility");
    v20 = -[OfflineMapsDownloadFeatureTipSource initWithIsActive:]([OfflineMapsDownloadFeatureTipSource alloc], "initWithIsActive:", GEOSupportsOfflineMaps());
    offlineMapsDownloadFeatureTipSource = v2->_offlineMapsDownloadFeatureTipSource;
    v2->_offlineMapsDownloadFeatureTipSource = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsDownloadFeatureTipSource observers](v2->_offlineMapsDownloadFeatureTipSource, "observers"));
    objc_msgSend(v22, "registerObserver:", v2);

    v23 = -[OfflineMapsPairedDeviceDiskSpaceTipSource initWithIsActive:]([OfflineMapsPairedDeviceDiskSpaceTipSource alloc], "initWithIsActive:", GEOSupportsOfflineMaps());
    offlineMapsPairedDeviceDiskSpaceTipSource = v2->_offlineMapsPairedDeviceDiskSpaceTipSource;
    v2->_offlineMapsPairedDeviceDiskSpaceTipSource = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsPairedDeviceDiskSpaceTipSource observers](v2->_offlineMapsPairedDeviceDiskSpaceTipSource, "observers"));
    objc_msgSend(v25, "registerObserver:", v2);

    v26 = -[EVRoutingFeatureDiscoverySource initWithPriority:delegate:]([EVRoutingFeatureDiscoverySource alloc], "initWithPriority:delegate:", 1, v2);
    evRoutingFeatureDiscoverySource = v2->_evRoutingFeatureDiscoverySource;
    v2->_evRoutingFeatureDiscoverySource = v26;

    v28 = objc_alloc_init(PreferredNetworksFeatureDiscoverySource);
    preferredNetworkFeatureDiscoverySource = v2->_preferredNetworkFeatureDiscoverySource;
    v2->_preferredNetworkFeatureDiscoverySource = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PreferredNetworksFeatureDiscoverySource observers](v2->_preferredNetworkFeatureDiscoverySource, "observers"));
    objc_msgSend(v30, "registerObserver:", v2);

    v2->_showNearbyTransitBanner = -[NearbyTransitFeatureDiscoverySource shouldShowFeature](v2->_nearbyTransitDiscoverySource, "shouldShowFeature");
    v2->_hasInitialData = -[NearbyTransitFeatureDiscoverySource hasInitialData](v2->_nearbyTransitDiscoverySource, "hasInitialData");
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](v2, "_updateAndNotifyObservers:", 0);

  }
  return v2;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  NearbyTransitFeatureDiscoverySource *v4;
  NearbyTransitFeatureDiscoverySource *v5;

  v4 = (NearbyTransitFeatureDiscoverySource *)a3;
  v5 = v4;
  if (self->_nearbyTransitDiscoverySource == v4)
  {
    -[FeatureDiscoveryDataProvider setShowNearbyTransitBanner:](self, "setShowNearbyTransitBanner:", -[NearbyTransitFeatureDiscoverySource shouldShowFeature](v4, "shouldShowFeature"));
    -[FeatureDiscoveryDataProvider setHasInitialData:](self, "setHasInitialData:", -[NearbyTransitFeatureDiscoverySource hasInitialData](self->_nearbyTransitDiscoverySource, "hasInitialData"));
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_transitPayDiscoverySource == v4)
  {
    -[FeatureDiscoveryDataProvider setShowTransitPayBanner:](self, "setShowTransitPayBanner:", -[NearbyTransitFeatureDiscoverySource showFeature](v5, "showFeature"));
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_offlineMapsFeatureDiscoverySource == v4)
  {
    -[FeatureDiscoveryDataProvider setShowOfflineMapsBanner:](self, "setShowOfflineMapsBanner:", -[NearbyTransitFeatureDiscoverySource showFeature](v5, "showFeature"));
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_preferredNetworkFeatureDiscoverySource == v4)
  {
    -[FeatureDiscoveryDataProvider setShowPreferredNetworksBanner:](self, "setShowPreferredNetworksBanner:", -[NearbyTransitFeatureDiscoverySource showFeature](v5, "showFeature"));
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_offlineMapsDownloadFeatureTipSource == v4)
  {
    -[FeatureDiscoveryDataProvider setShowOfflineDownloadingTip:](self, "setShowOfflineDownloadingTip:", -[NearbyTransitFeatureDiscoverySource showFeature](v5, "showFeature"));
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_offlineMapsPairedDeviceDiskSpaceTipSource == v4)
  {
    -[FeatureDiscoveryDataProvider setShowOfflinePairedDeviceDiskSpaceTip:](self, "setShowOfflinePairedDeviceDiskSpaceTip:", -[NearbyTransitFeatureDiscoverySource showFeature](v5, "showFeature"));
    v4 = v5;
  }

}

- (void)source:(id)a3 didUpdateAvailability:(BOOL)a4
{
  EVRoutingFeatureDiscoverySource *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  _QWORD v12[5];
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v6 = (EVRoutingFeatureDiscoverySource *)a3;
  if (self->_evRoutingFeatureDiscoverySource == v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10042F698;
    v12[3] = &unk_1011ACE58;
    v12[4] = self;
    v13 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  else
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[FeatureDiscoveryDataProvider source:didUpdateAvailability:]";
      v16 = 2080;
      v17 = "FeatureDiscoveryDataProvider.m";
      v18 = 1024;
      v19 = 167;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    -[NearbyTransitFeatureDiscoverySource setActive:](self->_nearbyTransitDiscoverySource, "setActive:");
    if (v3)
    {
      -[FeatureDiscoveryDataProvider _updateFeatures](self, "_updateFeatures");
      -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 0);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)FeatureDiscoveryDataProvider;
  -[FeatureDiscoveryDataProvider dealloc](&v3, "dealloc");
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_active)
  {
    v3 = a3;
    -[FeatureDiscoveryDataProvider _updateFeatures](self, "_updateFeatures");
    if (v3)
      -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a3.var1);
}

- (void)updateFeaturesWithSuggestions:(id)a3
{
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (+[RatingRequestHomeAvailability shouldShowRatingRequestDiscoveryBanner](RatingRequestHomeAvailability, "shouldShowRatingRequestDiscoveryBanner"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10042F8B0;
    v5[3] = &unk_1011B60D8;
    v5[4] = &v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  }
  -[FeatureDiscoveryDataProvider setShowRatingsAndPhotosBanner:](self, "setShowRatingsAndPhotosBanner:", *((unsigned __int8 *)v7 + 24));
  -[NearbyTransitFeatureDiscoverySource updateFeatureAvailabilityIfNecessary](self->_nearbyTransitDiscoverySource, "updateFeatureAvailabilityIfNecessary");
  _Block_object_dispose(&v6, 8);

}

- (void)setShowNearbyTransitBanner:(BOOL)a3
{
  if (self->_showNearbyTransitBanner != a3)
  {
    self->_showNearbyTransitBanner = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowTransitPayBanner:(BOOL)a3
{
  if (self->_showTransitPayBanner != a3)
  {
    self->_showTransitPayBanner = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowOfflineMapsBanner:(BOOL)a3
{
  if (self->_showOfflineMapsBanner != a3)
  {
    self->_showOfflineMapsBanner = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowRatingsAndPhotosBanner:(BOOL)a3
{
  if (self->_showRatingsAndPhotosBanner != a3)
  {
    self->_showRatingsAndPhotosBanner = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowEVOnboardingBanner:(BOOL)a3
{
  if (self->_showEVOnboardingBanner != a3)
  {
    self->_showEVOnboardingBanner = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowPreferredNetworksBanner:(BOOL)a3
{
  if (self->_showPreferredNetworksBanner != a3)
  {
    self->_showPreferredNetworksBanner = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowOfflineDownloadingTip:(BOOL)a3
{
  if (self->_showOfflineDownloadingTip != a3)
  {
    self->_showOfflineDownloadingTip = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setShowOfflinePairedDeviceDiskSpaceTip:(BOOL)a3
{
  if (self->_showOfflinePairedDeviceDiskSpaceTip != a3)
  {
    self->_showOfflinePairedDeviceDiskSpaceTip = a3;
    -[FeatureDiscoveryDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)_addNearbyTransitToFavorites
{
  id v2;
  NSObject *v3;
  _TtC4Maps16MapsFavoriteItem *v4;
  void *v5;
  uint8_t v6[16];

  v2 = sub_100431CEC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will add Nearby Transit to Favorites via Feature Discovery", v6, 2u);
  }

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v4 = objc_alloc_init(_TtC4Maps16MapsFavoriteItem);
    -[MapsFavoriteItem setType:](v4, "setType:", 6);
    -[MapsFavoriteItem setIdentifier:](v4, "setIdentifier:", CFSTR("NearbyTransit"));
    -[MapsFavoriteItem setCustomName:](v4, "setCustomName:", CFSTR("NearbyTransit"));
  }
  else
  {
    v4 = (_TtC4Maps16MapsFavoriteItem *)objc_msgSend(objc_alloc((Class)MapsSuggestionsShortcut), "initWithType:identifier:geoMapItem:customName:", 6, CFSTR("NearbyTransit"), 0, CFSTR("NearbyTransit"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v4));

  objc_msgSend(v5, "setMoveToPreferredIndexInFavorites:", 1);
  objc_msgSend(v5, "saveWithCompletion:", &stru_1011B60F8);

}

- (id)_featureTipModelWithPrecedence
{
  void *v3;

  if (-[FeatureDiscoveryDataProvider showOfflineDownloadingTip](self, "showOfflineDownloadingTip"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsDownloadFeatureTipSource offlineMapsDownloadTipModel](self->_offlineMapsDownloadFeatureTipSource, "offlineMapsDownloadTipModel"));
  }
  else if (-[FeatureDiscoveryDataProvider showOfflinePairedDeviceDiskSpaceTip](self, "showOfflinePairedDeviceDiskSpaceTip"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsPairedDeviceDiskSpaceTipSource offlineMapsPairedDeviceDiskSpaceTipModel](self->_offlineMapsPairedDeviceDiskSpaceTipSource, "offlineMapsPairedDeviceDiskSpaceTipModel"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_featureDiscoveryModelWithPrecedence
{
  void *v3;

  if (-[FeatureDiscoveryDataProvider showEVOnboardingBanner](self, "showEVOnboardingBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _modelForEVRouting](self, "_modelForEVRouting"));
  }
  else if (-[FeatureDiscoveryDataProvider showPreferredNetworksBanner](self, "showPreferredNetworksBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _modelForPreferredNetworks](self, "_modelForPreferredNetworks"));
  }
  else if (-[FeatureDiscoveryDataProvider showOfflineMapsBanner](self, "showOfflineMapsBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _modelForOfflineMapsTip](self, "_modelForOfflineMapsTip"));
  }
  else if (-[FeatureDiscoveryDataProvider showTransitPayBanner](self, "showTransitPayBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _modelForTransitPay](self, "_modelForTransitPay"));
  }
  else if (-[FeatureDiscoveryDataProvider showNearbyTransitBanner](self, "showNearbyTransitBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _modelForNearbyTransit](self, "_modelForNearbyTransit"));
  }
  else if (-[FeatureDiscoveryDataProvider showRatingsAndPhotosBanner](self, "showRatingsAndPhotosBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _modelForRatingAndPhotos](self, "_modelForRatingAndPhotos"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_updateFeatures
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *features;
  id v7;

  v7 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _featureTipModelWithPrecedence](self, "_featureTipModelWithPrecedence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider _featureDiscoveryModelWithPrecedence](self, "_featureDiscoveryModelWithPrecedence"));
  if (v3)
    objc_msgSend(v7, "addObject:", v3);
  if (v4)
    objc_msgSend(v7, "addObject:", v4);
  v5 = (NSArray *)objc_msgSend(v7, "copy");
  features = self->_features;
  self->_features = v5;

}

- (id)_modelForRatingAndPhotos
{
  void *v2;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10042FE3C;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10042FE98;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FeatureDiscoveryModel ratingsAndPhotosDiscoveryModelWithActionHandler:cancelHandler:](FeatureDiscoveryModel, "ratingsAndPhotosDiscoveryModelWithActionHandler:cancelHandler:", v6, v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_modelForNearbyTransit
{
  NearbyTransitFeatureDiscoverySource *nearbyTransitDiscoverySource;
  void *v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  nearbyTransitDiscoverySource = self->_nearbyTransitDiscoverySource;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10042FFF0;
  v8[3] = &unk_1011AD260;
  objc_copyWeak(&v9, &location);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100430058;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource discoveryModelWithActionHandler:displayHandler:cancelHandler:](nearbyTransitDiscoverySource, "discoveryModelWithActionHandler:displayHandler:cancelHandler:", v8, &stru_1011B6118, v6));
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_modelForOfflineMapsTip
{
  return -[OfflineMapsFeatureDiscoverySource offlineMapsDiscoveryModel](self->_offlineMapsFeatureDiscoverySource, "offlineMapsDiscoveryModel");
}

- (id)_modelForTransitPay
{
  return -[TransitPayFeatureDiscoverySource transitPayDiscoveryModel](self->_transitPayDiscoverySource, "transitPayDiscoveryModel");
}

- (id)_modelForEVRouting
{
  return -[EVRoutingFeatureDiscoverySource model](self->_evRoutingFeatureDiscoverySource, "model");
}

- (id)_modelForPreferredNetworks
{
  return -[PreferredNetworksFeatureDiscoverySource model](self->_preferredNetworkFeatureDiscoverySource, "model");
}

- (void)setTransitPayActionDelegate:(id)a3
{
  FeatureDiscoveryDataProvider *v4;
  id WeakRetained;
  id obj;

  obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (obj)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->_transitPayActionDelegate);

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)&v4->_transitPayActionDelegate, obj);
      -[TransitPayFeatureDiscoverySource setTransitPayActionDelegate:](v4->_transitPayDiscoverySource, "setTransitPayActionDelegate:", obj);
    }
  }
  objc_sync_exit(v4);

}

- (void)setOfflineMapsDiscoveryActionDelegate:(id)a3
{
  FeatureDiscoveryDataProvider *v4;
  id WeakRetained;
  id obj;

  obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (obj)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->_offlineMapsDiscoveryActionDelegate);

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)&v4->_offlineMapsDiscoveryActionDelegate, obj);
      -[OfflineMapsFeatureDiscoverySource setActionDelegate:](v4->_offlineMapsFeatureDiscoverySource, "setActionDelegate:", obj);
    }
  }
  objc_sync_exit(v4);

}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)showRatingsAndPhotosBanner
{
  return self->_showRatingsAndPhotosBanner;
}

- (NSArray)features
{
  return self->_features;
}

- (UGCPOIEnrichmentActionDelegate)poiEnrichmentActionDelegate
{
  return (UGCPOIEnrichmentActionDelegate *)objc_loadWeakRetained((id *)&self->_poiEnrichmentActionDelegate);
}

- (void)setPoiEnrichmentActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_poiEnrichmentActionDelegate, a3);
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return (TransitPayActionDelegate *)objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);
}

- (OfflineMapsFeatureDiscoveryActionDelegate)offlineMapsDiscoveryActionDelegate
{
  return (OfflineMapsFeatureDiscoveryActionDelegate *)objc_loadWeakRetained((id *)&self->_offlineMapsDiscoveryActionDelegate);
}

- (BOOL)showNearbyTransitBanner
{
  return self->_showNearbyTransitBanner;
}

- (BOOL)showTransitPayBanner
{
  return self->_showTransitPayBanner;
}

- (BOOL)showOfflineMapsBanner
{
  return self->_showOfflineMapsBanner;
}

- (BOOL)showEVOnboardingBanner
{
  return self->_showEVOnboardingBanner;
}

- (BOOL)showPreferredNetworksBanner
{
  return self->_showPreferredNetworksBanner;
}

- (BOOL)showOfflineDownloadingTip
{
  return self->_showOfflineDownloadingTip;
}

- (BOOL)showOfflinePairedDeviceDiskSpaceTip
{
  return self->_showOfflinePairedDeviceDiskSpaceTip;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void)setHasInitialData:(BOOL)a3
{
  self->_hasInitialData = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_offlineMapsDiscoveryActionDelegate);
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_destroyWeak((id *)&self->_poiEnrichmentActionDelegate);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_offlineMapsPairedDeviceDiskSpaceTipSource, 0);
  objc_storeStrong((id *)&self->_offlineMapsDownloadFeatureTipSource, 0);
  objc_storeStrong((id *)&self->_preferredNetworkFeatureDiscoverySource, 0);
  objc_storeStrong((id *)&self->_evRoutingFeatureDiscoverySource, 0);
  objc_storeStrong((id *)&self->_offlineMapsFeatureDiscoverySource, 0);
  objc_storeStrong((id *)&self->_transitPayDiscoverySource, 0);
  objc_storeStrong((id *)&self->_nearbyTransitDiscoverySource, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
