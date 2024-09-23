@implementation PASAccountContextExtension

- (NSString)description
{
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *v2;
  void *v3;

  v2 = self;
  PASAccountContextExtension.description.getter();

  v3 = (void *)sub_21F7160E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *v4;
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21F716458();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PASAccountContextExtension.isEqual(_:)((uint64_t)v8);

  sub_21F649B5C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *v2;
  int64_t v3;

  v2 = self;
  v3 = PASAccountContextExtension.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static PASAccountContextExtension.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static PASAccountContextExtension.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *v5;

  v4 = a3;
  v5 = self;
  PASAccountContextExtension.encode(with:)((NSCoder)v4);

}

- (_TtC21ProximityAppleIDSetup26PASAccountContextExtension)initWithCoder:(id)a3
{
  id v3;
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *v4;

  v3 = a3;
  v4 = (_TtC21ProximityAppleIDSetup26PASAccountContextExtension *)sub_21F66BAB8(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup26PASAccountContextExtension)init
{
  _TtC21ProximityAppleIDSetup26PASAccountContextExtension *result;

  result = (_TtC21ProximityAppleIDSetup26PASAccountContextExtension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityAppleIDSetup26PASAccountContextExtension_flowStepAllSetContext));
}

@end
