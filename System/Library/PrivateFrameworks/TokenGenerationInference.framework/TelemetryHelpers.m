@implementation TelemetryHelpers

+ (void)emitFileResidentInfoWithAssetIdentifier:(id)a3 residentPages:(int64_t)a4 totalPages:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static TelemetryHelpers.emitFileResidentInfo(assetIdentifier:residentPages:totalPages:)(v7, v8, a4, a5);
  swift_bridgeObjectRelease();
}

- (_TtC24TokenGenerationInference16TelemetryHelpers)init
{
  return (_TtC24TokenGenerationInference16TelemetryHelpers *)TelemetryHelpers.init()();
}

@end
