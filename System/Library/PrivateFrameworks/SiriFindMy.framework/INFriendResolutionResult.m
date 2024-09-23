@implementation INFriendResolutionResult

+ (id)successWithResolvedINFriend:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static INFriendResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithINFriendsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for INFriend();
  v3 = sub_1CCCF2C34();
  swift_getObjCClassMetadata();
  static INFriendResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithINFriendToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static INFriendResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static INFriendResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_1CCCEDC14();
  sub_1CCCF2C34();
  static INFriendResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static INFriendResolutionResult.confirmationRequired(with:)();
}

- (INFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  INFriendResolutionResult *result;

  v5 = sub_1CCCF2A54();
  INFriendResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
