@implementation SetVolumeLevelIntent

- (SetVolumeLevelIntent)init
{
  return (SetVolumeLevelIntent *)SetVolumeLevelIntent.init()();
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetVolumeLevelIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetVolumeLevelIntent *result;

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
  SetVolumeLevelIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetVolumeLevelIntent)initWithCoder:(id)a3
{
  id v3;
  SetVolumeLevelIntent *result;

  v3 = a3;
  SetVolumeLevelIntent.init(coder:)();
  return result;
}

- (SetVolumeLevelIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  SetVolumeLevelIntent *result;

  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  SetVolumeLevelIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
