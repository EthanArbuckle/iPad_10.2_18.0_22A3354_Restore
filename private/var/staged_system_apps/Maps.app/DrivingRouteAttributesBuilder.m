@implementation DrivingRouteAttributesBuilder

- (DrivingRouteAttributesBuilder)initWithDrivePreferences:(id)a3 timing:(id)a4
{
  id v7;
  id v8;
  DrivingRouteAttributesBuilder *v9;
  DrivingRouteAttributesBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DrivingRouteAttributesBuilder;
  v9 = -[DrivingRouteAttributesBuilder init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_drivePreferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (void)fillRouteAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RoutePlanningTiming *timing;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "setMainTransportType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingRouteAttributesBuilder drivePreferences](self, "drivePreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "automobileOptions"));
  objc_msgSend(v4, "setAutomobileOptions:", v6);

  v11 = 0uLL;
  v12 = 0;
  timing = self->_timing;
  if (timing)
  {
    -[RoutePlanningTiming timepoint](timing, "timepoint");
    if ((~BYTE4(v12) & 6) == 0)
    {
      v9 = v11;
      v10 = v12;
      objc_msgSend(v4, "setTimepoint:", &v9);
    }
  }
  objc_msgSend(v4, "addUiContext:", 4);
  objc_msgSend(v4, "setIncludePhonetics:", 1);
  if (GEOConfigGetBOOL(GeoServicesConfig_RoutePreloaderUseCellularCoverage[0], GeoServicesConfig_RoutePreloaderUseCellularCoverage[1]))v8 = MGGetBoolAnswer(CFSTR("contains-cellular-radio"));
  else
    v8 = 0;
  objc_msgSend(v4, "setIncludeCellularCoverage:", v8);

}

- (DrivePreferences)drivePreferences
{
  return self->_drivePreferences;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_drivePreferences, 0);
}

@end
