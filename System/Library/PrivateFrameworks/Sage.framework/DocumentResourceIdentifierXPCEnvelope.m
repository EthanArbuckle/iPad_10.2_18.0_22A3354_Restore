@implementation DocumentResourceIdentifierXPCEnvelope

- (NSData)_documentIdentifier
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_2457591A4);
}

- (void)set_documentIdentifier:(id)a3
{
  sub_2457594DC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Sage37DocumentResourceIdentifierXPCEnvelope__documentIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static DocumentResourceIdentifierXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static DocumentResourceIdentifierXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage37DocumentResourceIdentifierXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage37DocumentResourceIdentifierXPCEnvelope *)DocumentResourceIdentifierXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage37DocumentResourceIdentifierXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  DocumentResourceIdentifierXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage37DocumentResourceIdentifierXPCEnvelope)init
{
  DocumentResourceIdentifierXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage37DocumentResourceIdentifierXPCEnvelope__documentIdentifier);
}

@end
