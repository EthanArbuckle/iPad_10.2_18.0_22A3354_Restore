@implementation CardioFitnessLevelResolutionResult

+ (id)successWithResolvedCardioFitnessLevel:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static CardioFitnessLevelResolutionResult.success(with:)();
}

+ (id)confirmationRequiredWithCardioFitnessLevelToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static CardioFitnessLevelResolutionResult.confirmationRequired(with:)();
}

- (CardioFitnessLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  CardioFitnessLevelResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (CardioFitnessLevelResolutionResult *)CardioFitnessLevelResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
