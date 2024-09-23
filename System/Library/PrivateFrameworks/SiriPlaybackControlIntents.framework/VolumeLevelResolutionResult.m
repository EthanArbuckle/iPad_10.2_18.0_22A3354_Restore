@implementation VolumeLevelResolutionResult

+ (id)successWithResolvedVolumeLevel:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_224836FAC();

  return v5;
}

+ (id)disambiguationWithVolumeLevelsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for VolumeLevel();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E7E50(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithVolumeLevelToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E7F2C();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_224836F7C();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E8238();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E8290();
}

- (VolumeLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  VolumeLevelResolutionResult *result;

  v5 = sub_2249ECD68();
  VolumeLevelResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
