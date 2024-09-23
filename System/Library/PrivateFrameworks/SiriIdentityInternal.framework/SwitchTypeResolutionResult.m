@implementation SwitchTypeResolutionResult

+ (id)successWithResolvedSwitchType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SwitchTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithSwitchTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SwitchTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (SwitchTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2463C05D0();
  return (SwitchTypeResolutionResult *)SwitchTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
