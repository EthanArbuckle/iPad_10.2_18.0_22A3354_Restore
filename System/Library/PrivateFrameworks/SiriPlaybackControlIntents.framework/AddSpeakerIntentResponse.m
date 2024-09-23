@implementation AddSpeakerIntentResponse

- (int64_t)code
{
  return sub_2249DE820();
}

- (void)setCode:(int64_t)a3
{
  sub_2249DE884(a3);
}

- (AddSpeakerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init(code:userActivity:)(a3, a4);
}

- (AddSpeakerIntentResponse)init
{
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init()();
}

- (AddSpeakerIntentResponse)initWithCoder:(id)a3
{
  id v3;
  AddSpeakerIntentResponse *result;

  v3 = a3;
  AddSpeakerIntentResponse.init(coder:)();
  return result;
}

- (AddSpeakerIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  AddSpeakerIntentResponse *result;

  v3 = a3;
  AddSpeakerIntentResponse.init(backingStore:)();
  return result;
}

- (AddSpeakerIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  AddSpeakerIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  AddSpeakerIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
