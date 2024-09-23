@implementation SetSubtitleStateDeviceResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249D7F94();
}

- (SetSubtitleStateDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SetSubtitleStateDeviceResolutionResult *result;

  v5 = sub_2249ECD68();
  SetSubtitleStateDeviceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
