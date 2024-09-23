@implementation TransitRequestInfoProvider

- (TransitRequestInfoProvider)initWithPreferences:(id)a3 timing:(id)a4
{
  id v7;
  id v8;
  TransitRequestInfoProvider *v9;
  TransitRequestInfoProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransitRequestInfoProvider;
  v9 = -[TransitRequestInfoProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (TransitPreferences)transitPreferences
{
  return (TransitPreferences *)self->_preferences;
}

- (id)makeRouteAttributesBuilderWithNavigationMode:(unint64_t)a3
{
  return -[TransitRouteAttributesBuilder initWithTransitPreferences:timing:]([TransitRouteAttributesBuilder alloc], "initWithTransitPreferences:timing:", self->_preferences, self->_timing);
}

- (void)updateWithRefinedWaypoints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RoutePlanningTiming *timing;
  RoutePlanningTiming *v12;
  RoutePlanningTiming *v13;
  _QWORD v14[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timezone"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timezone"));

  timing = self->_timing;
  if (timing)
    -[RoutePlanningTiming timepoint](timing, "timepoint");
  else
    memset(v14, 0, sizeof(v14));
  v12 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithTimePoint:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithTimePoint:departureTimeZone:arrivalTimeZone:", v14, v7, v10));
  v13 = self->_timing;
  self->_timing = v12;

}

- (unint64_t)maximumRouteCount
{
  void *v2;
  id v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)5)
    v4 = &MapsConfig_RoutePlanningTransitRequestMaximumNumberOfRoutesMac;
  else
    v4 = &MapsConfig_RoutePlanningTransitRequestMaximumNumberOfRoutes;
  v5 = &off_1014B3B18;
  if (v3 != (id)5)
    v5 = &off_1014B3B08;
  return GEOConfigGetUInteger(*v4, *v5);
}

- (WatchSyncedPreferences)preferences
{
  return self->_preferences;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
