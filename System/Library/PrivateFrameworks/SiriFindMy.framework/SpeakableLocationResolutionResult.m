@implementation SpeakableLocationResolutionResult

+ (id)successWithResolvedSpeakableLocation:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SpeakableLocationResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithSpeakableLocationsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for SpeakableLocation();
  v3 = sub_1CCCF2C34();
  swift_getObjCClassMetadata();
  static SpeakableLocationResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithSpeakableLocationToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SpeakableLocationResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static SpeakableLocationResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_1CCCEDC14();
  sub_1CCCF2C34();
  static SpeakableLocationResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static SpeakableLocationResolutionResult.confirmationRequired(with:)();
}

- (SpeakableLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SpeakableLocationResolutionResult *result;

  v5 = sub_1CCCF2A54();
  SpeakableLocationResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
