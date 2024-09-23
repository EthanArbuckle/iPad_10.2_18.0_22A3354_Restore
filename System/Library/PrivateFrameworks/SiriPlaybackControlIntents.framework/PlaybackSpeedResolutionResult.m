@implementation PlaybackSpeedResolutionResult

+ (id)successWithResolvedPlaybackSpeed:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E9B38();

  return v5;
}

+ (id)disambiguationWithPlaybackSpeedsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for PlaybackSpeed();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E9BAC(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithPlaybackSpeedToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E9CE0();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249E9D60();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E9D9C();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E9DF4();
}

- (PlaybackSpeedResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  PlaybackSpeedResolutionResult *result;

  v5 = sub_2249ECD68();
  PlaybackSpeedResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
