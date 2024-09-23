@implementation AppletMemoryInfo

- (NSString)description
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))sub_20A0B6144);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545CA3A0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545CA3A0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService16AppletMemoryInfo *v5;

  v4 = a3;
  v5 = self;
  sub_20A0B64E0(v4);

}

- (_TtC9SEService16AppletMemoryInfo)initWithCoder:(id)a3
{
  return (_TtC9SEService16AppletMemoryInfo *)AppletMemoryInfo.init(coder:)(a3);
}

- (_TtC9SEService16AppletMemoryInfo)init
{
  _TtC9SEService16AppletMemoryInfo *result;

  result = (_TtC9SEService16AppletMemoryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
