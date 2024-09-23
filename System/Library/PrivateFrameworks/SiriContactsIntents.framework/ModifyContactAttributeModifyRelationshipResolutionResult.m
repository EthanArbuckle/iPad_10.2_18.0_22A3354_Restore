@implementation ModifyContactAttributeModifyRelationshipResolutionResult

- (ModifyContactAttributeModifyRelationshipResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ModifyContactAttributeModifyRelationshipResolutionResult *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  ModifyContactAttributeModifyRelationshipResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
