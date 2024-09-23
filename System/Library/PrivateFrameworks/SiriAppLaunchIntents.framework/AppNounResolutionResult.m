@implementation AppNounResolutionResult

+ (id)successWithResolvedAppNoun:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static AppNounResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithAppNounToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static AppNounResolutionResult.confirmationRequired(with:)(a3);
}

- (AppNounResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2291C4664();
  return (AppNounResolutionResult *)AppNounResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
