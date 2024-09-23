@implementation AppReferenceResolutionResult

+ (id)successWithResolvedAppReference:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static AppReferenceResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithAppReferenceToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static AppReferenceResolutionResult.confirmationRequired(with:)(a3);
}

- (AppReferenceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2291C4664();
  return (AppReferenceResolutionResult *)AppReferenceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
