@implementation GetContactAttributeSiriMatchesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return (id)static GetContactAttributeSiriMatchesResolutionResult.unsupported(forReason:)(a3);
}

- (GetContactAttributeSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  GetContactAttributeSiriMatchesResolutionResult *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  GetContactAttributeSiriMatchesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
