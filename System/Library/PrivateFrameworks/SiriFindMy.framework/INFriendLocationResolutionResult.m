@implementation INFriendLocationResolutionResult

+ (id)successWithResolvedINFriendLocation:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static INFriendLocationResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithINFriendLocationsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for INFriendLocation();
  v3 = sub_1CCCF2C34();
  swift_getObjCClassMetadata();
  static INFriendLocationResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithINFriendLocationToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static INFriendLocationResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static INFriendLocationResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_1CCCEDC14();
  sub_1CCCF2C34();
  static INFriendLocationResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static INFriendLocationResolutionResult.confirmationRequired(with:)();
}

- (INFriendLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  INFriendLocationResolutionResult *result;

  v5 = sub_1CCCF2A54();
  INFriendLocationResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
