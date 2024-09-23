@implementation ToolXPCEnvelope

- (NSData)_tool
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_245759A5C);
}

- (void)set_tool:(id)a3
{
  sub_2457594DC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Sage15ToolXPCEnvelope__tool);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ToolXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ToolXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage15ToolXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage15ToolXPCEnvelope *)ToolXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage15ToolXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  ToolXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage15ToolXPCEnvelope)init
{
  ToolXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage15ToolXPCEnvelope__tool);
}

@end
