@implementation DefaultRouteAttributesBuilder

- (DefaultRouteAttributesBuilder)initWithDestination:(id)a3 countryConfiguration:(id)a4 voiceLanguageIdentifier:(id)a5 useMetricSystem:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  DefaultRouteAttributesBuilder *v13;
  GEOComposedWaypoint *v14;
  GEOComposedWaypoint *destinationWaypoint;
  NSString *v16;
  NSString *voiceLanguageIdentifier;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DefaultRouteAttributesBuilder;
  v13 = -[DefaultRouteAttributesBuilder init](&v19, "init");
  if (v13)
  {
    v14 = (GEOComposedWaypoint *)objc_msgSend(v10, "copy");
    destinationWaypoint = v13->_destinationWaypoint;
    v13->_destinationWaypoint = v14;

    objc_storeStrong((id *)&v13->_configuration, a4);
    v16 = (NSString *)objc_msgSend(v12, "copy");
    voiceLanguageIdentifier = v13->_voiceLanguageIdentifier;
    v13->_voiceLanguageIdentifier = v16;

    v13->_useMetricSystem = a6;
  }

  return v13;
}

- (void)fillRouteAttributes:(id)a3
{
  void *v4;
  void *v5;
  uint64_t IsEnabled;
  uint64_t BOOL;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultRouteAttributesBuilder configuration](self, "configuration"));
  objc_msgSend(v9, "setRoutePointTypeForTransportType:countryConfiguration:", 4, v4);

  objc_msgSend(v9, "setIncludeManeuverIcons:", 1);
  objc_msgSend(v9, "setIncludeTrafficAlongRoute:", 1);
  objc_msgSend(v9, "setIncludeTrafficIncidents:", 1);
  objc_msgSend(v9, "setIncludeLaneGuidance:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (!objc_msgSend(v5, "supportsAdvancedMap"))
  {

    objc_msgSend(v9, "setIncludeLaneWidths:", 0);
    goto LABEL_5;
  }
  IsEnabled = MapsFeature_IsEnabled(MapsFeaturesConfig_ShelbyvilleTerrain[0], MapsFeaturesConfig_ShelbyvilleTerrain[1]);

  objc_msgSend(v9, "setIncludeLaneWidths:", IsEnabled);
  if (!(_DWORD)IsEnabled)
  {
LABEL_5:
    BOOL = 0;
    goto LABEL_6;
  }
  BOOL = GEOConfigGetBOOL(MapsConfig_EnableLaneFlowline, off_1014B3D68);
LABEL_6:
  objc_msgSend(v9, "setDirectZilchByLaneFlowlines:", BOOL);
  objc_msgSend(v9, "addUiContext:", 2);
  objc_msgSend(v9, "addUiContext:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultRouteAttributesBuilder voiceLanguageIdentifier](self, "voiceLanguageIdentifier"));
  objc_msgSend(v9, "setPhoneticLocaleIdentifier:", v8);

  objc_msgSend(v9, "setIncludeCrossLanguagePhonetics:", GEOConfigGetBOOL(MapsConfig_DebugNavigationMultilingualPhonetics, off_1014B2D98));
  objc_msgSend(v9, "setUseMetricThreshold:", -[DefaultRouteAttributesBuilder useMetricSystem](self, "useMetricSystem"));

}

- (GEOComposedWaypoint)destinationWaypoint
{
  return self->_destinationWaypoint;
}

- (GEOCountryConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)voiceLanguageIdentifier
{
  return self->_voiceLanguageIdentifier;
}

- (BOOL)useMetricSystem
{
  return self->_useMetricSystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLanguageIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
}

@end
