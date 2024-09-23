@implementation PostalAddress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PostalAddress)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  PostalAddress.init(identifier:display:pronunciationHint:)();
}

- (PostalAddress)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (PostalAddress *)PostalAddress.init(coder:)();
}

@end
