@implementation WalkingRouteAttributesBuilder

- (WalkingRouteAttributesBuilder)initWithWalkPreferences:(id)a3
{
  id v5;
  WalkingRouteAttributesBuilder *v6;
  WalkingRouteAttributesBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WalkingRouteAttributesBuilder;
  v6 = -[WalkingRouteAttributesBuilder init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_walkPreferences, a3);

  return v7;
}

- (void)fillRouteAttributes:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setMainTransportType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WalkingRouteAttributesBuilder walkPreferences](self, "walkPreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "walkingOptions"));
  objc_msgSend(v7, "setWalkingOptions:", v5);

  objc_msgSend(v7, "addUiContext:", 4);
  objc_msgSend(v7, "setIncludePhonetics:", 1);
  if (GEOConfigGetBOOL(GeoServicesConfig_RoutePreloaderUseCellularCoverage[0], GeoServicesConfig_RoutePreloaderUseCellularCoverage[1]))v6 = MGGetBoolAnswer(CFSTR("contains-cellular-radio"));
  else
    v6 = 0;
  objc_msgSend(v7, "setIncludeCellularCoverage:", v6);

}

- (WalkPreferences)walkPreferences
{
  return self->_walkPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkPreferences, 0);
}

@end
