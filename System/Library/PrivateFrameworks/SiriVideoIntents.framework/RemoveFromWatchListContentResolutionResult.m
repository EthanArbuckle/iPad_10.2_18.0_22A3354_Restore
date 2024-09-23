@implementation RemoveFromWatchListContentResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static RemoveFromWatchListContentResolutionResult.unsupported(forReason:)();
}

- (RemoveFromWatchListContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  RemoveFromWatchListContentResolutionResult *result;

  v5 = sub_21E9D84AC();
  RemoveFromWatchListContentResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
