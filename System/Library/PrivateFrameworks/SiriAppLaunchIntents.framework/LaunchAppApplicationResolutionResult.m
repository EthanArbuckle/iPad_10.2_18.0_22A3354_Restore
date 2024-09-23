@implementation LaunchAppApplicationResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static LaunchAppApplicationResolutionResult.unsupported(forReason:)();
}

- (LaunchAppApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  LaunchAppApplicationResolutionResult *result;

  v5 = sub_2291C4664();
  LaunchAppApplicationResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
