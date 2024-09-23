@implementation PlayLiveServiceLiveServiceResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static PlayLiveServiceLiveServiceResolutionResult.unsupported(forReason:)();
}

- (PlayLiveServiceLiveServiceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  PlayLiveServiceLiveServiceResolutionResult *result;

  v5 = sub_21E9D84AC();
  PlayLiveServiceLiveServiceResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
