@implementation EnvironmentObserver

- (EnvironmentObserver)init
{
  EnvironmentObserver *v2;
  void *v3;
  unsigned int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EnvironmentObserver;
  v2 = -[EnvironmentObserver init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v4 = objc_msgSend(v3, "isInternalInstall");

    if (v4)
    {
      _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_CustomEnvironmentConfiguration[0], GeoServicesConfig_CustomEnvironmentConfiguration[1], &_dispatch_main_q, v2);
      _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ResourceManifestEnvironment[0], GeoServicesConfig_ResourceManifestEnvironment[1], &_dispatch_main_q, v2);

      _GEOConfigAddDelegateListenerForKey(MapsConfig_ShowEnvironmentNameRule, off_1014B2DA8, &_dispatch_main_q, v2);
      _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_UseProductionURLs[0], GeoServicesConfig_UseProductionURLs[1], &_dispatch_main_q, v2);

    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)EnvironmentObserver;
  -[EnvironmentObserver dealloc](&v3, "dealloc");
}

- (void)updateCurrentEnvironmentName
{
  uint64_t Dictionary;
  void *v4;
  void *v5;
  uint64_t ValueWithSourceString;
  uint64_t Integer;
  uint64_t BOOL;
  void *v9;
  void *v10;
  void *v11;

  Dictionary = GEOConfigGetDictionary(GeoServicesConfig_CustomEnvironmentConfiguration[0], GeoServicesConfig_CustomEnvironmentConfiguration[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(Dictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GEOResourceManifestEnvironmentKey));
  if (!v5)
  {
    ValueWithSourceString = GEOConfigGetValueWithSourceString(GeoServicesConfig_ResourceManifestEnvironment[0]);
    v5 = 0;

  }
  Integer = GEOConfigGetInteger(MapsConfig_ShowEnvironmentNameRule, off_1014B2DA8);
  if (Integer == 2)
    goto LABEL_6;
  if (Integer != 1)
  {
    BOOL = 0;
    goto LABEL_15;
  }
  if (v5)
  {
LABEL_6:
    BOOL = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentObserver mapView](self, "mapView"));
    if ((objc_msgSend(v9, "_isUsingDevResourceStyleSheet") & 1) != 0)
    {
      BOOL = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      if (objc_msgSend(v10, "isInternalInstall"))
        BOOL = GEOConfigGetBOOL(GeoServicesConfig_UseProductionURLs[0], GeoServicesConfig_UseProductionURLs[1]);
      else
        BOOL = 0;

    }
  }
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentObserver mapView](self, "mapView"));
  objc_msgSend(v11, "_setShowsCurrentEnvironmentName:", BOOL);

}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
}

@end
