@implementation ModifyContactAttributeModifyNickNameResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return (id)static GetContactAttributeSiriMatchesResolutionResult.unsupported(forReason:)(a3);
}

- (ModifyContactAttributeModifyNickNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ModifyContactAttributeModifyNickNameResolutionResult *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  ModifyContactAttributeModifyNickNameResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
