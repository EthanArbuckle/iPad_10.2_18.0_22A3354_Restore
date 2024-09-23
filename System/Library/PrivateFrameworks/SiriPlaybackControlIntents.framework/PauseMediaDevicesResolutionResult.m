@implementation PauseMediaDevicesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249D49C4();
}

- (PauseMediaDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  PauseMediaDevicesResolutionResult *result;

  v5 = sub_2249ECD68();
  PauseMediaDevicesResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
