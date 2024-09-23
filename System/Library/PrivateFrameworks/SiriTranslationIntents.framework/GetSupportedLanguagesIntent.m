@implementation GetSupportedLanguagesIntent

- (GetSupportedLanguagesIntent)init
{
  return (GetSupportedLanguagesIntent *)GetSupportedLanguagesIntent.init()();
}

- (GetSupportedLanguagesIntent)initWithCoder:(id)a3
{
  id v3;
  GetSupportedLanguagesIntent *result;

  v3 = a3;
  GetSupportedLanguagesIntent.init(coder:)();
  return result;
}

- (GetSupportedLanguagesIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  GetSupportedLanguagesIntent *result;

  if (a3)
  {
    v5 = sub_228A3BAE4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  GetSupportedLanguagesIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (GetSupportedLanguagesIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_228A3BAE4();
  sub_228A3BAE4();
  if (a5)
    sub_228A3BAA8();
  return (GetSupportedLanguagesIntent *)GetSupportedLanguagesIntent.init(domain:verb:parametersByName:)();
}

@end
