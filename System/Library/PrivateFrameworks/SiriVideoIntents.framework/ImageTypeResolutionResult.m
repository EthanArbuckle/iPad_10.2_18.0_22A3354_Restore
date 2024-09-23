@implementation ImageTypeResolutionResult

+ (id)successWithResolvedImageType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ImageTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithImageTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ImageTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (ImageTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_21E9D84AC();
  return (ImageTypeResolutionResult *)ImageTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
