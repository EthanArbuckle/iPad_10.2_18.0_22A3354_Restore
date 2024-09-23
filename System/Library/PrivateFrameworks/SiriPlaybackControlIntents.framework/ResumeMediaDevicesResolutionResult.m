@implementation ResumeMediaDevicesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249D49C4();
}

- (ResumeMediaDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ResumeMediaDevicesResolutionResult *result;

  v5 = sub_2249ECD68();
  ResumeMediaDevicesResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
