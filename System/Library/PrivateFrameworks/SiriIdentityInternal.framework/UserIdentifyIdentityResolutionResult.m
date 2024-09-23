@implementation UserIdentifyIdentityResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static UserIdentifyIdentityResolutionResult.unsupported(forReason:)();
}

- (UserIdentifyIdentityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  UserIdentifyIdentityResolutionResult *result;

  v5 = sub_2463C05D0();
  UserIdentifyIdentityResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
