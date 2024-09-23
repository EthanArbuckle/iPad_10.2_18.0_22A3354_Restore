@implementation Contact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Contact)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  Contact.init(identifier:display:pronunciationHint:)();
}

- (Contact)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (Contact *)Contact.init(coder:)();
}

@end
