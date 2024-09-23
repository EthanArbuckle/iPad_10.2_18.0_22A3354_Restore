@implementation SetSubtitleStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetSubtitleStateIntent)init
{
  return (SetSubtitleStateIntent *)SetSubtitleStateIntent.init()();
}

- (SetSubtitleStateIntent)initWithCoder:(id)a3
{
  id v3;
  SetSubtitleStateIntent *result;

  v3 = a3;
  SetSubtitleStateIntent.init(coder:)();
  return result;
}

- (SetSubtitleStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SetSubtitleStateIntent *result;

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
  SetSubtitleStateIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SetSubtitleStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  SetSubtitleStateIntent *result;

  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  SetSubtitleStateIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
