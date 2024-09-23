@implementation LaunchAppIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (LaunchAppIntent)init
{
  return (LaunchAppIntent *)LaunchAppIntent.init()();
}

- (LaunchAppIntent)initWithCoder:(id)a3
{
  id v3;
  LaunchAppIntent *result;

  v3 = a3;
  LaunchAppIntent.init(coder:)();
  return result;
}

- (LaunchAppIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  LaunchAppIntent *result;

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
  LaunchAppIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (LaunchAppIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2291C46B8();
  sub_2291C46B8();
  if (a5)
    sub_2291C4664();
  return (LaunchAppIntent *)LaunchAppIntent.init(domain:verb:parametersByName:)();
}

@end
