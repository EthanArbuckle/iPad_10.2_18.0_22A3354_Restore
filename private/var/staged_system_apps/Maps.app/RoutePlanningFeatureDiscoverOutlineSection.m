@implementation RoutePlanningFeatureDiscoverOutlineSection

- (RoutePlanningFeatureDiscoverOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  RoutePlanningFeatureDiscoverOutlineSection *v8;
  RoutePlanningFeatureDiscoveryProvider *v9;
  RoutePlanningFeatureDiscoveryProvider *featureDiscoveryProvider;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RoutePlanningFeatureDiscoverOutlineSection;
  v8 = -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](&v15, "initWithCollectionView:sectionIdentifier:", v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(FeatureDiscoveryCollectionViewCell), CFSTR("FeatureDiscovery"));
    v9 = objc_alloc_init(RoutePlanningFeatureDiscoveryProvider);
    featureDiscoveryProvider = v8->_featureDiscoveryProvider;
    v8->_featureDiscoveryProvider = v9;

    objc_initWeak(&location, v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100655670;
    v12[3] = &unk_1011BEFB8;
    objc_copyWeak(&v13, &location);
    -[RoutePlanningFeatureDiscoveryProvider setChangeHandler:](v8->_featureDiscoveryProvider, "setChangeHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningFeatureDiscoverOutlineSection;
  v4 = -[RoutePlanningOutlineSection listLayoutSectionConfigurationAtIndex:layoutEnvironment:](&v7, "listLayoutSectionConfigurationAtIndex:layoutEnvironment:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "setSeparatorStyle:", 0);
  return v5;
}

- (BOOL)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4
{
  return -[RoutePlanningFeatureDiscoveryProvider updateWithTransportType:routeCollection:](self->_featureDiscoveryProvider, "updateWithTransportType:routeCollection:", a3, a4);
}

- (void)setTransitPayActionDelegate:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  if (a3)
  {
    -[RoutePlanningFeatureDiscoveryProvider setTransitPayActionDelegate:](self->_featureDiscoveryProvider, "setTransitPayActionDelegate:");
  }
  else
  {
    v3 = sub_10043253C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      v9 = 1024;
      v10 = 794;
      v11 = 2082;
      v12 = "-[RoutePlanningFeatureDiscoverOutlineSection setTransitPayActionDelegate:]";
      v13 = 2082;
      v14 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v7, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      v9 = 1024;
      v10 = 794;
      v11 = 2082;
      v12 = "-[RoutePlanningFeatureDiscoverOutlineSection setTransitPayActionDelegate:]";
      v13 = 2082;
      v14 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v7, 0x26u);
    }

  }
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFeatureDiscoveryProvider suggestedModel](self->_featureDiscoveryProvider, "suggestedModel", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->super._collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("FeatureDiscovery"), a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFeatureDiscoveryProvider suggestedModel](self->_featureDiscoveryProvider, "suggestedModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureDiscoveryView"));
  objc_msgSend(v6, "setModel:", v5);

  objc_msgSend(v4, "setContext:", 1);
  return v4;
}

- (void)willDisplayCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningFeatureDiscoverOutlineSection;
  -[RoutePlanningOutlineSection willDisplayCell:forIndexPath:](&v9, "willDisplayCell:forIndexPath:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "featureDiscoveryView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
  objc_msgSend(v8, "markAsDisplayed");

}

- (void)_requireReload
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection host](self, "host"));
  objc_msgSend(v3, "outlineSectionRequiresReload:", self);

}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFeatureDiscoveryProvider suggestedModel](self->_featureDiscoveryProvider, "suggestedModel"));
  v3 = v2 != 0;

  return v3;
}

- (void)markFeatureDiscoveryViewShown
{
  -[RoutePlanningFeatureDiscoveryProvider markFeatureDiscoveryViewShown](self->_featureDiscoveryProvider, "markFeatureDiscoveryViewShown");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDiscoveryProvider, 0);
}

@end
