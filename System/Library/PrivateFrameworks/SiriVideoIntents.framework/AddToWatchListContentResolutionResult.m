@implementation AddToWatchListContentResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static AddToWatchListContentResolutionResult.unsupported(forReason:)();
}

- (AddToWatchListContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  AddToWatchListContentResolutionResult *result;

  v5 = sub_21E9D84AC();
  AddToWatchListContentResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
