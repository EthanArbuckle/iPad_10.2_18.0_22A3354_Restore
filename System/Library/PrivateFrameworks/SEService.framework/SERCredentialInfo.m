@implementation SERCredentialInfo

- (_TtC9SEService17SERCredentialInfo)init
{
  _TtC9SEService17SERCredentialInfo *result;

  result = (_TtC9SEService17SERCredentialInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SEService17SERCredentialInfo_requiredMemoryForCredential));
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545C9E50;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545C9E50 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService17SERCredentialInfo *v5;

  v4 = a3;
  v5 = self;
  SERCredentialInfo.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService17SERCredentialInfo)initWithCoder:(id)a3
{
  return (_TtC9SEService17SERCredentialInfo *)SERCredentialInfo.init(coder:)(a3);
}

@end
