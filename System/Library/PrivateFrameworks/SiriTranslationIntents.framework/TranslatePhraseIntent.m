@implementation TranslatePhraseIntent

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (TranslatePhraseIntent)init
{
  return (TranslatePhraseIntent *)TranslatePhraseIntent.init()();
}

- (TranslatePhraseIntent)initWithCoder:(id)a3
{
  id v3;
  TranslatePhraseIntent *result;

  v3 = a3;
  TranslatePhraseIntent.init(coder:)();
  return result;
}

- (TranslatePhraseIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  TranslatePhraseIntent *result;

  if (a3)
  {
    v5 = sub_228A3BAE4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  TranslatePhraseIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (TranslatePhraseIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_228A3BAE4();
  sub_228A3BAE4();
  if (a5)
    sub_228A3BAA8();
  return (TranslatePhraseIntent *)TranslatePhraseIntent.init(domain:verb:parametersByName:)();
}

@end
