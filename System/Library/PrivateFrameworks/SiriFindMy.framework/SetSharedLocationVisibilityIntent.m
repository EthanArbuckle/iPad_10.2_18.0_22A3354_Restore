@implementation SetSharedLocationVisibilityIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetSharedLocationVisibilityIntent)init
{
  return (SetSharedLocationVisibilityIntent *)SetSharedLocationVisibilityIntent.init()();
}

- (SetSharedLocationVisibilityIntent)initWithCoder:(id)a3
{
  id v3;
  SetSharedLocationVisibilityIntent *result;

  v3 = a3;
  SetSharedLocationVisibilityIntent.init(coder:)();
  return result;
}

- (SetSharedLocationVisibilityIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetSharedLocationVisibilityIntent *result;

  if (a3)
  {
    v5 = sub_1CCCF2A9C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  SetSharedLocationVisibilityIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetSharedLocationVisibilityIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A54();
  return (SetSharedLocationVisibilityIntent *)SetSharedLocationVisibilityIntent.init(domain:verb:parametersByName:)();
}

@end
