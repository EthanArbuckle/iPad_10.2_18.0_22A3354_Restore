@implementation ModifyContactAttributeRelatedSiriMatchesResolutionResult

- (ModifyContactAttributeRelatedSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ModifyContactAttributeRelatedSiriMatchesResolutionResult *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  ModifyContactAttributeRelatedSiriMatchesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
