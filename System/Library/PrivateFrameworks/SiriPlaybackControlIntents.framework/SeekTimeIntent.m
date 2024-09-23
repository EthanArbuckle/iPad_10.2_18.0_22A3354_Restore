@implementation SeekTimeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SeekTimeIntent)init
{
  return (SeekTimeIntent *)SeekTimeIntent.init()();
}

- (SeekTimeIntent)initWithCoder:(id)a3
{
  id v3;
  SeekTimeIntent *result;

  v3 = a3;
  SeekTimeIntent.init(coder:)();
  return result;
}

- (SeekTimeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SeekTimeIntent *result;

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
  SeekTimeIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SeekTimeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  SeekTimeIntent *result;

  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  SeekTimeIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
