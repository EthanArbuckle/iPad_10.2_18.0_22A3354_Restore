@implementation CloseAppIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (CloseAppIntent)init
{
  return (CloseAppIntent *)CloseAppIntent.init()();
}

- (CloseAppIntent)initWithCoder:(id)a3
{
  id v3;
  CloseAppIntent *result;

  v3 = a3;
  CloseAppIntent.init(coder:)();
  return result;
}

- (CloseAppIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  CloseAppIntent *result;

  if (a3)
  {
    v5 = sub_2291C46B8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  CloseAppIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (CloseAppIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2291C46B8();
  sub_2291C46B8();
  if (a5)
    sub_2291C4664();
  return (CloseAppIntent *)CloseAppIntent.init(domain:verb:parametersByName:)();
}

@end
