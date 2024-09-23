@implementation SetPlaybackSpeedIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetPlaybackSpeedIntent)init
{
  return (SetPlaybackSpeedIntent *)SetPlaybackSpeedIntent.init()();
}

- (SetPlaybackSpeedIntent)initWithCoder:(id)a3
{
  id v3;
  SetPlaybackSpeedIntent *result;

  v3 = a3;
  SetPlaybackSpeedIntent.init(coder:)();
  return result;
}

- (SetPlaybackSpeedIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetPlaybackSpeedIntent *result;

  if (a3)
  {
    v5 = sub_2249ECDD4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  SetPlaybackSpeedIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetPlaybackSpeedIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  SetPlaybackSpeedIntent *result;

  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  SetPlaybackSpeedIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
