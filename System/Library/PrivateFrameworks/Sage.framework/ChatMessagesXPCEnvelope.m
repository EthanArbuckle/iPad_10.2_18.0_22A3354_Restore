@implementation ChatMessagesXPCEnvelope

- (NSData)_messages
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_24575B014);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ChatMessagesXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ChatMessagesXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage23ChatMessagesXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage23ChatMessagesXPCEnvelope *)ChatMessagesXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage23ChatMessagesXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  ChatMessagesXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage23ChatMessagesXPCEnvelope)init
{
  ChatMessagesXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage23ChatMessagesXPCEnvelope__messages);
}

@end
