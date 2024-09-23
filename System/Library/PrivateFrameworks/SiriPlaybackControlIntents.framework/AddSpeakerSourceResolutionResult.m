@implementation AddSpeakerSourceResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249D7F94();
}

- (AddSpeakerSourceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  AddSpeakerSourceResolutionResult *result;

  v5 = sub_2249ECD68();
  AddSpeakerSourceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
