@implementation DocumentRegistrationXPCResponse

- (NSData)_registration
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_24575A998);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static DocumentRegistrationXPCResponse.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static DocumentRegistrationXPCResponse.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage31DocumentRegistrationXPCResponse)initWithCoder:(id)a3
{
  return (_TtC4Sage31DocumentRegistrationXPCResponse *)DocumentRegistrationXPCResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage31DocumentRegistrationXPCResponse *v5;

  v4 = a3;
  v5 = self;
  DocumentRegistrationXPCResponse.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage31DocumentRegistrationXPCResponse)init
{
  DocumentRegistrationXPCResponse.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage31DocumentRegistrationXPCResponse__registration);
}

@end
