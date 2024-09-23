@implementation ContactAttributeTypeResolutionResult

+ (id)successWithResolvedContactAttributeType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContactAttributeTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithContactAttributeTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContactAttributeTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (ContactAttributeTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ContactAttributeTypeResolutionResult *)ContactAttributeTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
