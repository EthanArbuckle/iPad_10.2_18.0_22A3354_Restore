@implementation SiriMatch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriMatch)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  SiriMatch.init(identifier:display:pronunciationHint:)();
}

- (SiriMatch)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SiriMatch *)SiriMatch.init(coder:)();
}

@end
