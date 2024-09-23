@implementation GetVolumeLevelIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (GetVolumeLevelIntent)init
{
  return (GetVolumeLevelIntent *)GetVolumeLevelIntent.init()();
}

- (GetVolumeLevelIntent)initWithCoder:(id)a3
{
  id v3;
  GetVolumeLevelIntent *result;

  v3 = a3;
  GetVolumeLevelIntent.init(coder:)();
  return result;
}

- (GetVolumeLevelIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  GetVolumeLevelIntent *result;

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
  GetVolumeLevelIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (GetVolumeLevelIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  return (GetVolumeLevelIntent *)GetVolumeLevelIntent.init(domain:verb:parametersByName:)();
}

@end
