@implementation GetSupportedLanguagesIntentResponse

- (int64_t)code
{
  return GetSupportedLanguagesIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_228A39DE8(a3);
}

- (GetSupportedLanguagesIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetSupportedLanguagesIntentResponse)init
{
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init()();
}

- (GetSupportedLanguagesIntentResponse)initWithCoder:(id)a3
{
  id v3;
  GetSupportedLanguagesIntentResponse *result;

  v3 = a3;
  GetSupportedLanguagesIntentResponse.init(coder:)();
  return result;
}

- (GetSupportedLanguagesIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  GetSupportedLanguagesIntentResponse *result;

  v3 = a3;
  GetSupportedLanguagesIntentResponse.init(backingStore:)();
  return result;
}

- (GetSupportedLanguagesIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  GetSupportedLanguagesIntentResponse *result;

  if (a3)
    v3 = sub_228A3BAA8();
  else
    v3 = 0;
  GetSupportedLanguagesIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
