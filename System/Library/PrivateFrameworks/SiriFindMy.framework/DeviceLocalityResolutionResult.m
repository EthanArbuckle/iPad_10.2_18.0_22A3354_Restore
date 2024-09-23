@implementation DeviceLocalityResolutionResult

+ (id)successWithResolvedDeviceLocality:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static DeviceLocalityResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithDeviceLocalityToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static DeviceLocalityResolutionResult.confirmationRequired(with:)(a3);
}

- (DeviceLocalityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_1CCCF2A54();
  return (DeviceLocalityResolutionResult *)DeviceLocalityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
