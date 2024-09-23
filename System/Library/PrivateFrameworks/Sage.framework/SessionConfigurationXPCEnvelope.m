@implementation SessionConfigurationXPCEnvelope

- (NSData)_configuration
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_24575C6BC);
}

- (void)set_configuration:(id)a3
{
  sub_2457594DC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Sage31SessionConfigurationXPCEnvelope__configuration);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SessionConfigurationXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SessionConfigurationXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage31SessionConfigurationXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage31SessionConfigurationXPCEnvelope *)SessionConfigurationXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage31SessionConfigurationXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  SessionConfigurationXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage31SessionConfigurationXPCEnvelope)init
{
  SessionConfigurationXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage31SessionConfigurationXPCEnvelope__configuration);
}

@end
