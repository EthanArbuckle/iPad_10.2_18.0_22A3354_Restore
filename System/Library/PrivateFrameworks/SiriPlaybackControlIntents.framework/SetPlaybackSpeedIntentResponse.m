@implementation SetPlaybackSpeedIntentResponse

- (int64_t)code
{
  return sub_2249E0E10();
}

- (void)setCode:(int64_t)a3
{
  sub_2249E0E78(a3);
}

- (SetPlaybackSpeedIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetPlaybackSpeedIntentResponse)init
{
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init()();
}

- (SetPlaybackSpeedIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetPlaybackSpeedIntentResponse *result;

  v3 = a3;
  SetPlaybackSpeedIntentResponse.init(coder:)();
  return result;
}

- (SetPlaybackSpeedIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetPlaybackSpeedIntentResponse *result;

  v3 = a3;
  SetPlaybackSpeedIntentResponse.init(backingStore:)();
  return result;
}

- (SetPlaybackSpeedIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetPlaybackSpeedIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetPlaybackSpeedIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
