@implementation UserIdentifyIntent

- (UserIdentifyIntent)init
{
  return (UserIdentifyIntent *)UserIdentifyIntent.init()();
}

- (UserIdentifyIntent)initWithCoder:(id)a3
{
  id v3;
  UserIdentifyIntent *result;

  v3 = a3;
  UserIdentifyIntent.init(coder:)();
  return result;
}

- (UserIdentifyIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  UserIdentifyIntent *result;

  if (a3)
  {
    v5 = sub_2463C0618();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  UserIdentifyIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (UserIdentifyIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2463C0618();
  sub_2463C0618();
  if (a5)
    sub_2463C05D0();
  return (UserIdentifyIntent *)UserIdentifyIntent.init(domain:verb:parametersByName:)();
}

@end
