@implementation SetAudioLanguageIntentResponse

- (int64_t)code
{
  return sub_2249D89D4();
}

- (void)setCode:(int64_t)a3
{
  sub_2249D8A3C(a3);
}

- (SetAudioLanguageIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetAudioLanguageIntentResponse)init
{
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init()();
}

- (SetAudioLanguageIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetAudioLanguageIntentResponse *result;

  v3 = a3;
  SetAudioLanguageIntentResponse.init(coder:)();
  return result;
}

- (SetAudioLanguageIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetAudioLanguageIntentResponse *result;

  v3 = a3;
  SetAudioLanguageIntentResponse.init(backingStore:)();
  return result;
}

- (SetAudioLanguageIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetAudioLanguageIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetAudioLanguageIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
