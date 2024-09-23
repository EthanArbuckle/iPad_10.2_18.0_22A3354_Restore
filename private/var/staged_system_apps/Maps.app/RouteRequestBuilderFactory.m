@implementation RouteRequestBuilderFactory

- (RouteRequestBuilderFactory)initWithTransportTypeRequestInfoProvider:(id)a3 waypointSet:(id)a4
{
  id v7;
  id v8;
  RouteRequestBuilderFactory *v9;
  RouteRequestBuilderFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RouteRequestBuilderFactory;
  v9 = -[RouteRequestBuilderFactory init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transportTypeRequestInfoProvider, a3);
    objc_storeStrong((id *)&v10->_waypointSet, a4);
  }

  return v10;
}

- (void)setUseMetricSystem:(BOOL)a3
{
  self->_useMetricSystemWasManuallySet = 1;
  self->_useMetricSystem = a3;
}

- (BOOL)useMetricSystem
{
  void *v3;
  unsigned __int8 v4;

  if (self->_useMetricSystemWasManuallySet)
    return self->_useMetricSystem;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = objc_msgSend(v3, "_navigation_distanceUsesMetricSystem");

  return v4;
}

- (void)setCountryConfiguration:(id)a3
{
  GEOCountryConfiguration *v5;
  GEOCountryConfiguration **p_countryConfiguration;
  GEOCountryConfiguration *countryConfiguration;
  GEOCountryConfiguration *v8;

  v5 = (GEOCountryConfiguration *)a3;
  countryConfiguration = self->_countryConfiguration;
  p_countryConfiguration = &self->_countryConfiguration;
  if (countryConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_countryConfiguration, a3);
    v5 = v8;
  }

}

- (GEOCountryConfiguration)countryConfiguration
{
  GEOCountryConfiguration *countryConfiguration;

  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
    return countryConfiguration;
  else
    return (GEOCountryConfiguration *)(id)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
}

- (void)setVoiceLanguageIdentifier:(id)a3
{
  NSString *v4;
  NSString *voiceLanguageIdentifier;
  unsigned __int8 v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  voiceLanguageIdentifier = self->_voiceLanguageIdentifier;
  if (voiceLanguageIdentifier != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](voiceLanguageIdentifier, "isEqualToString:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_voiceLanguageIdentifier;
      self->_voiceLanguageIdentifier = v7;

      v4 = v9;
    }
  }

}

- (NSString)voiceLanguageIdentifier
{
  NSString *voiceLanguageIdentifier;
  NSString *v3;
  void *v4;

  voiceLanguageIdentifier = self->_voiceLanguageIdentifier;
  if (voiceLanguageIdentifier)
  {
    v3 = voiceLanguageIdentifier;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVoiceLanguage"));

  }
  return v3;
}

- (GEOLocation)currentUserLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  if (objc_msgSend(v2, "hasLocation") && (objc_msgSend(v2, "isLastLocationStale") & 1) == 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentLocation"));
  else
    v3 = 0;

  return (GEOLocation *)v3;
}

- (unint64_t)navigationMode
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory waypointSet](self, "waypointSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "origin"));
  v4 = objc_msgSend(v3, "isCurrentLocation");

  return v4;
}

- (id)makeRouteRequestBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  RouteRequestBuilder *v13;
  uint64_t v15;
  RouteRequestBuilder *v16;

  v16 = [RouteRequestBuilder alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory waypointSet](self, "waypointSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory transportTypeRequestInfoProvider](self, "transportTypeRequestInfoProvider"));
  v5 = objc_msgSend(v4, "maximumRouteCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory _routeAttributesBuilders](self, "_routeAttributesBuilders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory currentUserLocation](self, "currentUserLocation"));
  v8 = -[RouteRequestBuilderFactory initiator](self, "initiator");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory traits](self, "traits"));
  v10 = -[RouteRequestBuilderFactory isResumingMultipointRoute](self, "isResumingMultipointRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory resumeRouteHandle](self, "resumeRouteHandle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory persistentData](self, "persistentData"));
  LOBYTE(v15) = v10;
  v13 = -[RouteRequestBuilder initWithWaypointSet:maximumRouteCount:routeAttributesBuilders:currentUserLocation:initiator:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:](v16, "initWithWaypointSet:maximumRouteCount:routeAttributesBuilders:currentUserLocation:initiator:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:", v3, v5, v6, v7, v8, v9, v15, v11, v12);

  return v13;
}

- (id)_routeAttributesBuilders
{
  void *v3;
  DefaultRouteAttributesBuilder *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DefaultRouteAttributesBuilder *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = [DefaultRouteAttributesBuilder alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory waypointSet](self, "waypointSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory countryConfiguration](self, "countryConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory voiceLanguageIdentifier](self, "voiceLanguageIdentifier"));
  v9 = -[DefaultRouteAttributesBuilder initWithDestination:countryConfiguration:voiceLanguageIdentifier:useMetricSystem:](v4, "initWithDestination:countryConfiguration:voiceLanguageIdentifier:useMetricSystem:", v6, v7, v8, -[RouteRequestBuilderFactory useMetricSystem](self, "useMetricSystem"));

  objc_msgSend(v3, "addObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory transportTypeRequestInfoProvider](self, "transportTypeRequestInfoProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "makeRouteAttributesBuilderWithNavigationMode:", -[RouteRequestBuilderFactory navigationMode](self, "navigationMode")));

  objc_msgSend(v3, "addObject:", v11);
  return v3;
}

- (TransportTypeRequestInfoProvider)transportTypeRequestInfoProvider
{
  return self->_transportTypeRequestInfoProvider;
}

- (void)setTransportTypeRequestInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transportTypeRequestInfoProvider, a3);
}

- (WaypointSet)waypointSet
{
  return self->_waypointSet;
}

- (void)setWaypointSet:(id)a3
{
  objc_storeStrong((id *)&self->_waypointSet, a3);
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(unint64_t)a3
{
  self->_initiator = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
  objc_storeStrong((id *)&self->_persistentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_waypointSet, 0);
  objc_storeStrong((id *)&self->_transportTypeRequestInfoProvider, 0);
  objc_storeStrong((id *)&self->_voiceLanguageIdentifier, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
}

@end
