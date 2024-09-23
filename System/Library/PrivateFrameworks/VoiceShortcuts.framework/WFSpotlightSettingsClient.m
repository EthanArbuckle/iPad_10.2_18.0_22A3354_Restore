@implementation WFSpotlightSettingsClient

+ (WFSpotlightSettingsClient)shared
{
  return (WFSpotlightSettingsClient *)static SpotlightSettingsClient.shared.getter();
}

- (BOOL)isSpotlightEnabledForBundleIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  WFSpotlightSettingsClient *v7;
  Swift::String v8;

  v4 = sub_1C1546BD0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = SpotlightSettingsClient.isSpotlightEnabled(for:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (WFSpotlightSettingsClient)init
{
  return (WFSpotlightSettingsClient *)SpotlightSettingsClient.init()();
}

@end
