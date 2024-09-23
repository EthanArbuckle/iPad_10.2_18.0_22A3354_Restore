@implementation SwitchProfileIntent

- (SwitchProfileIntent)init
{
  return (SwitchProfileIntent *)SwitchProfileIntent.init()();
}

- (SwitchProfileIntent)initWithCoder:(id)a3
{
  id v3;
  SwitchProfileIntent *result;

  v3 = a3;
  SwitchProfileIntent.init(coder:)();
  return result;
}

- (SwitchProfileIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SwitchProfileIntent *result;

  if (a3)
  {
    v5 = sub_2463C0618();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  SwitchProfileIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SwitchProfileIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2463C0618();
  sub_2463C0618();
  if (a5)
    sub_2463C05D0();
  return (SwitchProfileIntent *)SwitchProfileIntent.init(domain:verb:parametersByName:)();
}

@end
