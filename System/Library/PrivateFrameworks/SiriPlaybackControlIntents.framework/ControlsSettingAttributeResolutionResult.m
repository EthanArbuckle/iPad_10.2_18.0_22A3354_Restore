@implementation ControlsSettingAttributeResolutionResult

+ (id)successWithResolvedControlsSettingAttribute:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249EA2F0();

  return v5;
}

+ (id)disambiguationWithControlsSettingAttributesToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for ControlsSettingAttribute();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249EA364(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithControlsSettingAttributeToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249EA498();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249EA518();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249EA554();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249EA5AC();
}

- (ControlsSettingAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ControlsSettingAttributeResolutionResult *result;

  v5 = sub_2249ECD68();
  ControlsSettingAttributeResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
