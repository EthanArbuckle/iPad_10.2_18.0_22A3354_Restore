@implementation FMDRequestTrackedLocations

- (FMDRequestTrackedLocations)initWithAccount:(id)a3 currentLocation:(id)a4 trackedLocations:(id)a5 locationTracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FMDRequestTrackedLocations *v14;
  FMDRequestTrackedLocations *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMDRequestTrackedLocations;
  v14 = -[FMDRequest initWithAccount:](&v17, "initWithAccount:", v10);
  v15 = v14;
  if (v14)
  {
    -[FMDRequestTrackedLocations setAccount:](v14, "setAccount:", v10);
    -[FMDRequestTrackedLocations setCurrentLocation:](v15, "setCurrentLocation:", v11);
    -[FMDRequestTrackedLocations setTrackedLocations:](v15, "setTrackedLocations:", v12);
    -[FMDRequestTrackedLocations setLocationTracker:](v15, "setLocationTracker:", v13);
  }

  return v15;
}

- (id)urlTemplateType
{
  return CFSTR("trackedLocations");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMDRequestTrackedLocations;
  v3 = -[FMDRequest requestBody](&v10, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestTrackedLocations trackedLocations](self, "trackedLocations"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("trackedLocations"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestTrackedLocations currentLocation](self, "currentLocation"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestTrackedLocations currentLocation](self, "currentLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryValue"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("currentLocation"));
  }
  return v4;
}

- (BOOL)canRequestBeRetriedNow
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestTrackedLocations locationTracker](self, "locationTracker"));
  v4 = objc_msgSend(v3, "isTrackingOn");

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestTrackedLocations;
  return -[FMDRequest canRequestBeRetriedNow](&v6, "canRequestBeRetriedNow");
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FMDLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (NSArray)trackedLocations
{
  return self->_trackedLocations;
}

- (void)setTrackedLocations:(id)a3
{
  objc_storeStrong((id *)&self->_trackedLocations, a3);
}

- (FMDLocationTracker)locationTracker
{
  return (FMDLocationTracker *)objc_loadWeakRetained((id *)&self->_locationTracker);
}

- (void)setLocationTracker:(id)a3
{
  objc_storeWeak((id *)&self->_locationTracker, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationTracker);
  objc_storeStrong((id *)&self->_trackedLocations, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
