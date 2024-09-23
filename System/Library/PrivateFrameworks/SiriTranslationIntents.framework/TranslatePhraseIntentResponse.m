@implementation TranslatePhraseIntentResponse

- (int64_t)code
{
  return TranslatePhraseIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_228A38E50(a3);
}

- (TranslatePhraseIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init(code:userActivity:)(a3, a4);
}

- (TranslatePhraseIntentResponse)init
{
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init()();
}

- (TranslatePhraseIntentResponse)initWithCoder:(id)a3
{
  id v3;
  TranslatePhraseIntentResponse *result;

  v3 = a3;
  TranslatePhraseIntentResponse.init(coder:)();
  return result;
}

- (TranslatePhraseIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  TranslatePhraseIntentResponse *result;

  v3 = a3;
  TranslatePhraseIntentResponse.init(backingStore:)();
  return result;
}

- (TranslatePhraseIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  TranslatePhraseIntentResponse *result;

  if (a3)
    v3 = sub_228A3BAA8();
  else
    v3 = 0;
  TranslatePhraseIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
