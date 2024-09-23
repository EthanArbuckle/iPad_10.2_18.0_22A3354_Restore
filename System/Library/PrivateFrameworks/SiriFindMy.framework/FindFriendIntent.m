@implementation FindFriendIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (FindFriendIntent)init
{
  return (FindFriendIntent *)FindFriendIntent.init()();
}

- (FindFriendIntent)initWithCoder:(id)a3
{
  id v3;
  FindFriendIntent *result;

  v3 = a3;
  FindFriendIntent.init(coder:)();
  return result;
}

- (FindFriendIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  FindFriendIntent *result;

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
  FindFriendIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (FindFriendIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A54();
  return (FindFriendIntent *)FindFriendIntent.init(domain:verb:parametersByName:)();
}

@end
