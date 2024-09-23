@implementation SKRConversationTurnDataXPC

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SKRConversationTurnDataXPC *v5;

  v4 = a3;
  v5 = self;
  ConversationTurnDataXPC.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRConversationTurnDataXPC)initWithCoder:(id)a3
{
  return (SKRConversationTurnDataXPC *)ConversationTurnDataXPC.init(coder:)(a3);
}

- (SKRConversationTurnDataXPC)init
{
  SKRConversationTurnDataXPC *result;

  result = (SKRConversationTurnDataXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
