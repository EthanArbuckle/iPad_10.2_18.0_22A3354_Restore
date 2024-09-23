@implementation SetGeoFenceFriendResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return (id)static SetGeoFenceFriendResolutionResult.unsupported(forReason:)(a3);
}

- (SetGeoFenceFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SetGeoFenceFriendResolutionResult *result;

  v5 = sub_1CCCF2A54();
  SetGeoFenceFriendResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
