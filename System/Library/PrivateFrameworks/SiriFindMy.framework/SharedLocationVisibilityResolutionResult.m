@implementation SharedLocationVisibilityResolutionResult

+ (id)successWithResolvedSharedLocationVisibility:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SharedLocationVisibilityResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithSharedLocationVisibilityToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SharedLocationVisibilityResolutionResult.confirmationRequired(with:)(a3);
}

- (SharedLocationVisibilityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_1CCCF2A54();
  return (SharedLocationVisibilityResolutionResult *)SharedLocationVisibilityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
