@implementation IntentRadioBandResolutionResult

+ (id)successWithResolvedIntentRadioBand:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentRadioBandResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithIntentRadioBandToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentRadioBandResolutionResult.confirmationRequired(with:)(a3);
}

@end
