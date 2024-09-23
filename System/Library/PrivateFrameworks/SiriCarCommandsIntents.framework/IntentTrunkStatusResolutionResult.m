@implementation IntentTrunkStatusResolutionResult

+ (id)successWithResolvedIntentTrunkStatus:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentTrunkStatusResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithIntentTrunkStatusToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentTrunkStatusResolutionResult.confirmationRequired(with:)(a3);
}

@end
