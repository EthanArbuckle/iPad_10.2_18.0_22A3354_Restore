@implementation PeriodProjectionFocusResolutionResult

+ (id)successWithResolvedPeriodProjectionFocus:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static PeriodProjectionFocusResolutionResult.success(with:)();
}

+ (id)confirmationRequiredWithPeriodProjectionFocusToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static PeriodProjectionFocusResolutionResult.confirmationRequired(with:)();
}

- (PeriodProjectionFocusResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  PeriodProjectionFocusResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (PeriodProjectionFocusResolutionResult *)PeriodProjectionFocusResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
