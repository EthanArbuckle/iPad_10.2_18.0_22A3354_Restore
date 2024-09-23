@implementation ConversationParaphraseResultXPC

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static ConversationParaphraseResultXPC.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static ConversationParaphraseResultXPC.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime31ConversationParaphraseResultXPC *v5;

  v4 = a3;
  v5 = self;
  ConversationParaphraseResultXPC.encode(with:)((NSCoder)v4);

}

- (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC)initWithCoder:(id)a3
{
  id v3;
  _TtC14SiriKitRuntime31ConversationParaphraseResultXPC *v4;

  v3 = a3;
  v4 = (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC *)specialized ConversationParaphraseResultXPC.init(coder:)(v3);

  return v4;
}

- (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC)init
{
  _TtC14SiriKitRuntime31ConversationParaphraseResultXPC *result;

  result = (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of ActionParaphrase?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime31ConversationParaphraseResultXPC_paraphrase);
  swift_bridgeObjectRelease();
}

@end
