@implementation DeepLaunchIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (DeepLaunchIntent)init
{
  return (DeepLaunchIntent *)DeepLaunchIntent.init()();
}

- (DeepLaunchIntent)initWithCoder:(id)a3
{
  id v3;
  DeepLaunchIntent *result;

  v3 = a3;
  DeepLaunchIntent.init(coder:)();
  return result;
}

- (DeepLaunchIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  DeepLaunchIntent *result;

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
  DeepLaunchIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (DeepLaunchIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  DeepLaunchIntent *result;

  sub_2291C46B8();
  sub_2291C46B8();
  if (a5)
    sub_2291C4664();
  DeepLaunchIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
