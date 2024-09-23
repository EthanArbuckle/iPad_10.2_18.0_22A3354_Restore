@implementation IntentClimateResolutionResult

+ (id)successWithResolvedIntentClimate:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentClimateResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithIntentClimateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentClimateResolutionResult.confirmationRequired(with:)(a3);
}

@end
