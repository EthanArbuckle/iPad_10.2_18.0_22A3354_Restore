@implementation SRSmartRepliesConversationTurn

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies30SRSmartRepliesConversationTurn *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesConversationTurn.encode(with:)((NSCoder)v4);

}

- (_TtC12SmartReplies30SRSmartRepliesConversationTurn)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies30SRSmartRepliesConversationTurn *)SRSmartRepliesConversationTurn.init(coder:)(a3);
}

- (_TtC12SmartReplies30SRSmartRepliesConversationTurn)init
{
  _TtC12SmartReplies30SRSmartRepliesConversationTurn *result;

  result = (_TtC12SmartReplies30SRSmartRepliesConversationTurn *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesConversationTurn_timestamp, (uint64_t *)&demangling cache variable for type metadata for Date?);
}

@end
