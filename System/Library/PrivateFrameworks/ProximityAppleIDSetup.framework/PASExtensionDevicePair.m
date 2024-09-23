@implementation PASExtensionDevicePair

- (NSString)description
{
  _TtC21ProximityAppleIDSetup22PASExtensionDevicePair *v2;
  void *v3;

  v2 = self;
  PASExtensionDevicePair.description.getter();

  v3 = (void *)sub_21F7160E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC21ProximityAppleIDSetup22PASExtensionDevicePair *v4;
  _TtC21ProximityAppleIDSetup22PASExtensionDevicePair *v5;
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
  v6 = PASExtensionDevicePair.isEqual(_:)((uint64_t)v8);

  sub_21F649B5C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  return PASExtensionDevicePair.hash.getter();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static PASExtensionDevicePair.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static PASExtensionDevicePair.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21ProximityAppleIDSetup22PASExtensionDevicePair *v5;

  v4 = a3;
  v5 = self;
  PASExtensionDevicePair.encode(with:)((NSCoder)v4);

}

- (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair)initWithCoder:(id)a3
{
  id v3;
  _TtC21ProximityAppleIDSetup22PASExtensionDevicePair *v4;

  v3 = a3;
  v4 = (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair *)sub_21F675558(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair)init
{
  _TtC21ProximityAppleIDSetup22PASExtensionDevicePair *result;

  result = (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
