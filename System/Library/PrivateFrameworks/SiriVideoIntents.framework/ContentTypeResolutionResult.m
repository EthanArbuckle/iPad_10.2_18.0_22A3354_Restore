@implementation ContentTypeResolutionResult

+ (id)successWithResolvedContentType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContentTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithContentTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContentTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (ContentTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_21E9D84AC();
  return (ContentTypeResolutionResult *)ContentTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
