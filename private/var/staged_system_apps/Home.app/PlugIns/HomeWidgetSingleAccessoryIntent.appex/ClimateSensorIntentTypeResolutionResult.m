@implementation ClimateSensorIntentTypeResolutionResult

+ (id)successWithResolvedClimateSensorIntentType:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static ClimateSensorIntentTypeResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithClimateSensorIntentTypesToDisambiguate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = type metadata accessor for ClimateSensorIntentType();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  v7 = static ClimateSensorIntentTypeResolutionResult.disambiguation(with:)(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

+ (id)confirmationRequiredWithClimateSensorIntentTypeToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = static ClimateSensorIntentTypeResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/ClimateSensorIntentType.swift", 61, 2, 47, 0);
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/ClimateSensorIntentType.swift", 61, 2, 52, 0);
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/ClimateSensorIntentType.swift", 61, 2, 57, 0);
  __break(1u);
  return result;
}

@end
