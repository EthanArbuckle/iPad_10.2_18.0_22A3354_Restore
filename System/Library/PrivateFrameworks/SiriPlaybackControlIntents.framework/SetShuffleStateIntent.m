@implementation SetShuffleStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetShuffleStateIntent)init
{
  return (SetShuffleStateIntent *)SetShuffleStateIntent.init()();
}

- (SetShuffleStateIntent)initWithCoder:(id)a3
{
  id v3;
  SetShuffleStateIntent *result;

  v3 = a3;
  SetShuffleStateIntent.init(coder:)();
  return result;
}

- (SetShuffleStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetShuffleStateIntent *result;

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
  SetShuffleStateIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetShuffleStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  return (SetShuffleStateIntent *)SetShuffleStateIntent.init(domain:verb:parametersByName:)();
}

@end
