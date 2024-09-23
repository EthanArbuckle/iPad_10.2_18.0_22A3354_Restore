@implementation QualifierResolutionResult

+ (id)successWithResolvedQualifier:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContactAttributeTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithQualifierToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContactAttributeTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (QualifierResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (QualifierResolutionResult *)QualifierResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
