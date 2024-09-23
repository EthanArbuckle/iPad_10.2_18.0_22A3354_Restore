@implementation OrdinalReferenceResolutionResult

+ (id)successWithResolvedOrdinalReference:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static OrdinalReferenceResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithOrdinalReferenceToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static OrdinalReferenceResolutionResult.confirmationRequired(with:)(a3);
}

- (OrdinalReferenceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_21E9D84AC();
  return (OrdinalReferenceResolutionResult *)OrdinalReferenceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
