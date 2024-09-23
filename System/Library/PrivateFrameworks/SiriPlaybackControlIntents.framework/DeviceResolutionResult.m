@implementation DeviceResolutionResult

+ (id)successWithResolvedDevice:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_224816330();

  return v5;
}

+ (id)disambiguationWithDevicesToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for Device();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E4C84(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithDeviceToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E4D9C();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_224816368();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E53AC();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E5404();
}

- (DeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  DeviceResolutionResult *result;

  v5 = sub_2249ECD68();
  DeviceResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
