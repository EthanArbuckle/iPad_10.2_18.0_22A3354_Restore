@implementation VolumeSettingUnitResolutionResult

+ (id)successWithResolvedVolumeSettingUnit:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E17CC(a3);
}

+ (id)confirmationRequiredWithVolumeSettingUnitToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E1804(a3);
}

- (VolumeSettingUnitResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2249ECD68();
  return (VolumeSettingUnitResolutionResult *)VolumeSettingUnitResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
