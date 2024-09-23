@implementation DeviceGroupResolutionResult

+ (id)successWithResolvedDeviceGroup:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E8610();

  return v5;
}

+ (id)disambiguationWithDeviceGroupsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for DeviceGroup();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E8648(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithDeviceGroupToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E8724();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249E8CD8();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E8D14();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E8D6C();
}

- (DeviceGroupResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  DeviceGroupResolutionResult *result;

  v5 = sub_2249ECD68();
  DeviceGroupResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
