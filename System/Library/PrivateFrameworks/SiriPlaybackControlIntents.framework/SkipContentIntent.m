@implementation SkipContentIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SkipContentIntent)init
{
  return (SkipContentIntent *)SkipContentIntent.init()();
}

- (SkipContentIntent)initWithCoder:(id)a3
{
  id v3;
  SkipContentIntent *result;

  v3 = a3;
  SkipContentIntent.init(coder:)();
  return result;
}

- (SkipContentIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SkipContentIntent *result;

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
  SkipContentIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SkipContentIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  return (SkipContentIntent *)SkipContentIntent.init(domain:verb:parametersByName:)();
}

@end
