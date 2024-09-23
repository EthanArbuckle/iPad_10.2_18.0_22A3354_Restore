@implementation FindDeviceAndPlaySoundIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (FindDeviceAndPlaySoundIntent)init
{
  return (FindDeviceAndPlaySoundIntent *)FindDeviceAndPlaySoundIntent.init()();
}

- (FindDeviceAndPlaySoundIntent)initWithCoder:(id)a3
{
  id v3;
  FindDeviceAndPlaySoundIntent *result;

  v3 = a3;
  FindDeviceAndPlaySoundIntent.init(coder:)();
  return result;
}

- (FindDeviceAndPlaySoundIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  FindDeviceAndPlaySoundIntent *result;

  if (a3)
  {
    v5 = sub_1CCCF2A9C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  FindDeviceAndPlaySoundIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (FindDeviceAndPlaySoundIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A54();
  return (FindDeviceAndPlaySoundIntent *)FindDeviceAndPlaySoundIntent.init(domain:verb:parametersByName:)();
}

@end
