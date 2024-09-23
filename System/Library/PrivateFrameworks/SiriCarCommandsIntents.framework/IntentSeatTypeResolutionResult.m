@implementation IntentSeatTypeResolutionResult

+ (id)successWithResolvedIntentSeatType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentSeatTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithIntentSeatTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static IntentSeatTypeResolutionResult.confirmationRequired(with:)(a3);
}

@end
