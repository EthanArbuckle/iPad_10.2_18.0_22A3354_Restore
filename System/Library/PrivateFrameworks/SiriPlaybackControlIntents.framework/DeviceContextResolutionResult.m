@implementation DeviceContextResolutionResult

+ (id)successWithResolvedDeviceContext:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E641C();

  return v5;
}

+ (id)disambiguationWithDeviceContextsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for DeviceContext();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E6490(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithDeviceContextToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E65C4();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249E6644();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E6680();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E66D8();
}

- (DeviceContextResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  DeviceContextResolutionResult *result;

  v5 = sub_2249ECD68();
  DeviceContextResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
