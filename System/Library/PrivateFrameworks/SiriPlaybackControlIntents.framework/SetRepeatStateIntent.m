@implementation SetRepeatStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetRepeatStateIntent)init
{
  return (SetRepeatStateIntent *)SetRepeatStateIntent.init()();
}

- (SetRepeatStateIntent)initWithCoder:(id)a3
{
  id v3;
  SetRepeatStateIntent *result;

  v3 = a3;
  SetRepeatStateIntent.init(coder:)();
  return result;
}

- (SetRepeatStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetRepeatStateIntent *result;

  if (a3)
  {
    v5 = sub_2249ECDD4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  SetRepeatStateIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetRepeatStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  return (SetRepeatStateIntent *)SetRepeatStateIntent.init(domain:verb:parametersByName:)();
}

@end
