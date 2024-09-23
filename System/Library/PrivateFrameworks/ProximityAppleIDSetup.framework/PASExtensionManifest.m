@implementation PASExtensionManifest

- (_TtC21ProximityAppleIDSetup20PASExtensionManifest)init
{
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *result;

  result = (_TtC21ProximityAppleIDSetup20PASExtensionManifest *)sub_21F7165FC();
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *v2;
  void *v3;

  v2 = self;
  PASExtensionManifest.description.getter();

  v3 = (void *)sub_21F7160E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *v4;
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *v5;
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
  v6 = PASExtensionManifest.isEqual(_:)((uint64_t)v8);

  sub_21F649B5C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_21F71623C();
  v4 = sub_21F71623C();

  return v4 ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static PASExtensionManifest.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static PASExtensionManifest.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC21ProximityAppleIDSetup20PASExtensionManifest_isAccountPickerAvailable);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_21F7160E0();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

  v8 = *((unsigned __int8 *)&v6->super.isa
       + OBJC_IVAR____TtC21ProximityAppleIDSetup20PASExtensionManifest_wantsFullScreenPresentation);
  v9 = (id)sub_21F7160E0();
  objc_msgSend(v5, sel_encodeBool_forKey_, v8, v9);

}

- (_TtC21ProximityAppleIDSetup20PASExtensionManifest)initWithCoder:(id)a3
{
  id v3;
  _TtC21ProximityAppleIDSetup20PASExtensionManifest *v4;

  v3 = a3;
  v4 = (_TtC21ProximityAppleIDSetup20PASExtensionManifest *)sub_21F6C20F4(v3);

  return v4;
}

@end
