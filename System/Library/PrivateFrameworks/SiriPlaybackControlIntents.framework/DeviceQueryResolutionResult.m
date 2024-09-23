@implementation DeviceQueryResolutionResult

+ (id)successWithResolvedDeviceQuery:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E7708();

  return v5;
}

+ (id)disambiguationWithDeviceQuerysToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for DeviceQuery();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E777C(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithDeviceQueryToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E78B0();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249E7930();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E796C();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E79C4();
}

- (DeviceQueryResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  DeviceQueryResolutionResult *result;

  v5 = sub_2249ECD68();
  DeviceQueryResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
