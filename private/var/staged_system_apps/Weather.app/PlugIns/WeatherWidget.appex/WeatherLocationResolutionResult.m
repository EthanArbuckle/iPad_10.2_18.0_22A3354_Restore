@implementation WeatherLocationResolutionResult

+ (id)successWithResolvedWeatherLocation:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static WeatherLocationResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithWeatherLocationsToDisambiguate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = type metadata accessor for WeatherLocation();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  static WeatherLocationResolutionResult.disambiguation(with:)(v6);
  v8 = v7;
  swift_bridgeObjectRelease(v6);
  return v8;
}

+ (id)confirmationRequiredWithWeatherLocationToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static WeatherLocationResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  static WeatherLocationResolutionResult.success(with:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, v3, v4);
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_100174C4C();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  static WeatherLocationResolutionResult.disambiguation(with:)(v5, v6, v7, v8, v9);
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  static WeatherLocationResolutionResult.confirmationRequired(with:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, v3, v4);
}

- (WeatherLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  WeatherLocationResolutionResult *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  WeatherLocationResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
