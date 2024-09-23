@implementation IntentRelativeTemperatureChangeResolutionResult

+ (id)successWithResolvedIntentRelativeTemperatureChange:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentRelativeTemperatureChangeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithIntentRelativeTemperatureChangeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentRelativeTemperatureChangeResolutionResult.confirmationRequired(with:)(a3);
}

@end
