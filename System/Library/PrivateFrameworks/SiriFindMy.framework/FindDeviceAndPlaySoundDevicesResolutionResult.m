@implementation FindDeviceAndPlaySoundDevicesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static FindDeviceAndPlaySoundDevicesResolutionResult.unsupported(forReason:)();
}

- (FindDeviceAndPlaySoundDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  FindDeviceAndPlaySoundDevicesResolutionResult *result;

  v5 = sub_1CCCF2A54();
  FindDeviceAndPlaySoundDevicesResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
