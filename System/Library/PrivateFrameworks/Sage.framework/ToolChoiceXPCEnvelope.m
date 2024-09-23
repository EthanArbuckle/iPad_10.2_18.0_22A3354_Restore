@implementation ToolChoiceXPCEnvelope

- (NSData)_toolChoice
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_245759494);
}

- (void)set_toolChoice:(id)a3
{
  sub_2457594DC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Sage21ToolChoiceXPCEnvelope__toolChoice);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ToolChoiceXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ToolChoiceXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage21ToolChoiceXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage21ToolChoiceXPCEnvelope *)ToolChoiceXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage21ToolChoiceXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  ToolChoiceXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage21ToolChoiceXPCEnvelope)init
{
  ToolChoiceXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage21ToolChoiceXPCEnvelope__toolChoice);
}

@end
