@implementation FindFriendFriendResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static FindFriendFriendResolutionResult.unsupported(forReason:)();
}

- (FindFriendFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  FindFriendFriendResolutionResult *result;

  v5 = sub_1CCCF2A54();
  FindFriendFriendResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
