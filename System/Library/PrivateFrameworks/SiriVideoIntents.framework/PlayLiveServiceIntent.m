@implementation PlayLiveServiceIntent

- (PlayLiveServiceIntent)init
{
  return (PlayLiveServiceIntent *)PlayLiveServiceIntent.init()();
}

- (PlayLiveServiceIntent)initWithCoder:(id)a3
{
  id v3;
  PlayLiveServiceIntent *result;

  v3 = a3;
  PlayLiveServiceIntent.init(coder:)();
  return result;
}

- (PlayLiveServiceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  PlayLiveServiceIntent *result;

  if (a3)
  {
    v5 = sub_21E9D8524();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  PlayLiveServiceIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (PlayLiveServiceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_21E9D8524();
  sub_21E9D8524();
  if (a5)
    sub_21E9D84AC();
  return (PlayLiveServiceIntent *)PlayLiveServiceIntent.init(domain:verb:parametersByName:)();
}

@end
