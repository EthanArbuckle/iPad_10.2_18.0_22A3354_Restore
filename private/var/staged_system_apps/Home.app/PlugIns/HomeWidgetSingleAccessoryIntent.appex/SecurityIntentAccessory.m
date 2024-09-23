@implementation SecurityIntentAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecurityIntentAccessory)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  if (a5)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v15 = v14;
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  return (SecurityIntentAccessory *)SecurityIntentAccessory.init(identifier:display:pronunciationHint:)(v7, v9, v10, v12, v13, v15);
}

- (SecurityIntentAccessory)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecurityIntentAccessory();
  return -[SecurityIntentAccessory initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
