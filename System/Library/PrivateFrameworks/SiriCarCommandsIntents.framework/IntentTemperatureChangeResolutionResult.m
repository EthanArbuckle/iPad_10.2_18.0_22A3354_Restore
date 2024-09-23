@implementation IntentTemperatureChangeResolutionResult

+ (id)successWithResolvedIntentTemperatureChange:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentTemperatureChangeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithIntentTemperatureChangeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentTemperatureChangeResolutionResult.confirmationRequired(with:)(a3);
}

@end
