@implementation SwitchProfileAccountResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SwitchProfileAccountResolutionResult.unsupported(forReason:)();
}

- (SwitchProfileAccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SwitchProfileAccountResolutionResult *result;

  v5 = sub_2463C05D0();
  SwitchProfileAccountResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
