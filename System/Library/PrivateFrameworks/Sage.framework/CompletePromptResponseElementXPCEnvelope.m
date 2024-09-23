@implementation CompletePromptResponseElementXPCEnvelope

- (NSData)_event
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_24575CCA8);
}

- (void)set_event:(id)a3
{
  sub_2457594DC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Sage40CompletePromptResponseElementXPCEnvelope__event);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static CompletePromptResponseElementXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static CompletePromptResponseElementXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage40CompletePromptResponseElementXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage40CompletePromptResponseElementXPCEnvelope *)CompletePromptResponseElementXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage40CompletePromptResponseElementXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  CompletePromptResponseElementXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage40CompletePromptResponseElementXPCEnvelope)init
{
  CompletePromptResponseElementXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage40CompletePromptResponseElementXPCEnvelope__event);
}

@end
