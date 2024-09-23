@implementation PeriodFlowResolutionResult

+ (id)successWithResolvedPeriodFlow:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static PeriodFlowResolutionResult.success(with:)();
}

+ (id)confirmationRequiredWithPeriodFlowToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static PeriodFlowResolutionResult.confirmationRequired(with:)();
}

- (PeriodFlowResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  PeriodFlowResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (PeriodFlowResolutionResult *)PeriodFlowResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
