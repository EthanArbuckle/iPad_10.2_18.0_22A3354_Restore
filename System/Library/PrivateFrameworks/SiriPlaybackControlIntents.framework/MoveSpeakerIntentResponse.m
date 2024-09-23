@implementation MoveSpeakerIntentResponse

- (int64_t)code
{
  return sub_2249DF5E0();
}

- (void)setCode:(int64_t)a3
{
  sub_2249DF644(a3);
}

- (MoveSpeakerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init(code:userActivity:)(a3, a4);
}

- (MoveSpeakerIntentResponse)init
{
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init()();
}

- (MoveSpeakerIntentResponse)initWithCoder:(id)a3
{
  id v3;
  MoveSpeakerIntentResponse *result;

  v3 = a3;
  MoveSpeakerIntentResponse.init(coder:)();
  return result;
}

- (MoveSpeakerIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  MoveSpeakerIntentResponse *result;

  v3 = a3;
  MoveSpeakerIntentResponse.init(backingStore:)();
  return result;
}

- (MoveSpeakerIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  MoveSpeakerIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  MoveSpeakerIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
