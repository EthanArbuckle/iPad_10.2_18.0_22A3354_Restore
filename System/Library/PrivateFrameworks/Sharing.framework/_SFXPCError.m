@implementation _SFXPCError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFXPCError)initWithCoder:(id)a3
{
  return (_SFXPCError *)_SFXPCError.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _SFXPCError *v5;

  v4 = a3;
  v5 = self;
  _SFXPCError.encode(with:)((NSCoder)v4);

}

- (_SFXPCError)init
{
  _SFXPCError *result;

  result = (_SFXPCError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
