@implementation ModifyContactAttributeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (ModifyContactAttributeIntent)init
{
  return (ModifyContactAttributeIntent *)ModifyContactAttributeIntent.init()();
}

- (ModifyContactAttributeIntent)initWithCoder:(id)a3
{
  id v3;
  ModifyContactAttributeIntent *result;

  v3 = a3;
  ModifyContactAttributeIntent.init(coder:)();
  return result;
}

- (ModifyContactAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  ModifyContactAttributeIntent *result;

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
  ModifyContactAttributeIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (ModifyContactAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  ModifyContactAttributeIntent.init(domain:verb:parametersByName:)();
}

@end
