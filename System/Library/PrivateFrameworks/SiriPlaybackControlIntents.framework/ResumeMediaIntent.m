@implementation ResumeMediaIntent

- (ResumeMediaIntent)init
{
  return (ResumeMediaIntent *)ResumeMediaIntent.init()();
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (ResumeMediaIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  ResumeMediaIntent *result;

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
  ResumeMediaIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (ResumeMediaIntent)initWithCoder:(id)a3
{
  id v3;
  ResumeMediaIntent *result;

  v3 = a3;
  ResumeMediaIntent.init(coder:)();
  return result;
}

- (ResumeMediaIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  return (ResumeMediaIntent *)ResumeMediaIntent.init(domain:verb:parametersByName:)();
}

@end
