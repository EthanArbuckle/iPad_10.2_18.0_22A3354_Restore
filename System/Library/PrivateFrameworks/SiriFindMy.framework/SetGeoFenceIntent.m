@implementation SetGeoFenceIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetGeoFenceIntent)init
{
  return (SetGeoFenceIntent *)SetGeoFenceIntent.init()();
}

- (SetGeoFenceIntent)initWithCoder:(id)a3
{
  id v3;
  SetGeoFenceIntent *result;

  v3 = a3;
  SetGeoFenceIntent.init(coder:)();
  return result;
}

- (SetGeoFenceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetGeoFenceIntent *result;

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
  SetGeoFenceIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetGeoFenceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  SetGeoFenceIntent *result;

  sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A54();
  SetGeoFenceIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
