@implementation FindDeviceAndPlaySoundIntentResponse

- (int64_t)code
{
  return FindDeviceAndPlaySoundIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_1CCCEA0E8(a3);
}

- (FindDeviceAndPlaySoundIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init(code:userActivity:)(a3, a4);
}

- (FindDeviceAndPlaySoundIntentResponse)init
{
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init()();
}

- (FindDeviceAndPlaySoundIntentResponse)initWithCoder:(id)a3
{
  id v3;
  FindDeviceAndPlaySoundIntentResponse *result;

  v3 = a3;
  FindDeviceAndPlaySoundIntentResponse.init(coder:)();
  return result;
}

- (FindDeviceAndPlaySoundIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  FindDeviceAndPlaySoundIntentResponse *result;

  v3 = a3;
  FindDeviceAndPlaySoundIntentResponse.init(backingStore:)();
  return result;
}

- (FindDeviceAndPlaySoundIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  FindDeviceAndPlaySoundIntentResponse *result;

  if (a3)
    v3 = sub_1CCCF2A54();
  else
    v3 = 0;
  FindDeviceAndPlaySoundIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
