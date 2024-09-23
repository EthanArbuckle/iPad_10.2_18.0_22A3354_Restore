@implementation AddSpeakerIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (AddSpeakerIntent)init
{
  return (AddSpeakerIntent *)AddSpeakerIntent.init()();
}

- (AddSpeakerIntent)initWithCoder:(id)a3
{
  id v3;
  AddSpeakerIntent *result;

  v3 = a3;
  AddSpeakerIntent.init(coder:)();
  return result;
}

- (AddSpeakerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  AddSpeakerIntent *result;

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
  AddSpeakerIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (AddSpeakerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  AddSpeakerIntent *result;

  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  AddSpeakerIntent.init(domain:verb:parametersByName:)();
  return result;
}

@end
