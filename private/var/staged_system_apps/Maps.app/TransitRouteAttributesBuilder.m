@implementation TransitRouteAttributesBuilder

- (TransitRouteAttributesBuilder)initWithTransitPreferences:(id)a3 timing:(id)a4
{
  id v7;
  id v8;
  TransitRouteAttributesBuilder *v9;
  TransitRouteAttributesBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransitRouteAttributesBuilder;
  v9 = -[TransitRouteAttributesBuilder init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (void)fillRouteAttributes:(id)a3
{
  id v4;
  RoutePlanningTiming *timing;
  void *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "setMainTransportType:", 1);
  objc_msgSend(v4, "setRoutePointTypeForTransportType:", objc_msgSend(v4, "mainTransportType"));
  v9 = 0uLL;
  v10 = 0;
  timing = self->_timing;
  if (timing)
  {
    -[RoutePlanningTiming timepoint](timing, "timepoint");
    if ((~BYTE4(v10) & 6) == 0)
    {
      v7 = v9;
      v8 = v10;
      objc_msgSend(v4, "setTimepoint:", &v7);
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences transitOptions](self->_preferences, "transitOptions"));
  objc_msgSend(v4, "setTransitOptions:", v6);

}

- (TransitPreferences)preferences
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
