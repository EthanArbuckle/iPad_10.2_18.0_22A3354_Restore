@implementation ContentSortResolutionResult

+ (id)successWithResolvedContentSort:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContentSortResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithContentSortToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContentSortResolutionResult.confirmationRequired(with:)(a3);
}

- (ContentSortResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_21E9D84AC();
  return (ContentSortResolutionResult *)ContentSortResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
