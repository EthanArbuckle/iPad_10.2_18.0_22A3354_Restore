@implementation PASExtensionPickedAccount

- (NSString)description
{
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *v2;
  void *v3;

  v2 = self;
  PASExtensionPickedAccount.description.getter();

  v3 = (void *)sub_21F7160E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *v4;
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *v5;
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
  v6 = PASExtensionPickedAccount.isEqual(_:)((uint64_t)v8);

  sub_21F649B5C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *v2;
  int64_t v3;

  v2 = self;
  v3 = PASExtensionPickedAccount.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static PASExtensionPickedAccount.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static PASExtensionPickedAccount.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *v5;

  v4 = a3;
  v5 = self;
  PASExtensionPickedAccount.encode(with:)((NSCoder)v4);

}

- (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount)initWithCoder:(id)a3
{
  id v3;
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *v4;

  v3 = a3;
  v4 = (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *)sub_21F64A3B0(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount)init
{
  _TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *result;

  result = (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  sub_21F649B9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21ProximityAppleIDSetup25PASExtensionPickedAccount_imageData), *(_QWORD *)&self->dsid[OBJC_IVAR____TtC21ProximityAppleIDSetup25PASExtensionPickedAccount_imageData]);
}

@end
