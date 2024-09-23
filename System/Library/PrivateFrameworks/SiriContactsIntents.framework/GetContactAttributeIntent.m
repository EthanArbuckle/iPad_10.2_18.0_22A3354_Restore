@implementation GetContactAttributeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (GetContactAttributeIntent)init
{
  return (GetContactAttributeIntent *)GetContactAttributeIntent.init()();
}

- (GetContactAttributeIntent)initWithCoder:(id)a3
{
  id v3;
  GetContactAttributeIntent *result;

  v3 = a3;
  GetContactAttributeIntent.init(coder:)();
  return result;
}

- (GetContactAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  GetContactAttributeIntent *result;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  GetContactAttributeIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (GetContactAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  GetContactAttributeIntent.init(domain:verb:parametersByName:)();
}

@end
