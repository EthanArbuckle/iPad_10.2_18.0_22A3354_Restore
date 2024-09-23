@implementation DeviceSpecificityLevelResolutionResult

+ (id)successWithResolvedDeviceSpecificityLevel:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static DeviceSpecificityLevelResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithDeviceSpecificityLevelToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static DeviceSpecificityLevelResolutionResult.confirmationRequired(with:)(a3);
}

- (DeviceSpecificityLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_1CCCF2A54();
  return (DeviceSpecificityLevelResolutionResult *)DeviceSpecificityLevelResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
