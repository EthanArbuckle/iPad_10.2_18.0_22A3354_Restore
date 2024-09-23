@implementation SKEUserSpecificInfo

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static UserSpecificInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static UserSpecificInfo.supportsSecureCoding = a3;
}

- (SKEUserSpecificInfo)initWithCoder:(id)a3
{
  return (SKEUserSpecificInfo *)UserSpecificInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SKEUserSpecificInfo *v5;

  v4 = a3;
  v5 = self;
  UserSpecificInfo.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  SKEUserSpecificInfo *v4;
  SKEUserSpecificInfo *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = UserSpecificInfo.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSString)debugDescription
{
  SKEUserSpecificInfo *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  UserSpecificInfo.debugDescription.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x1B5E432E8](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (SKEUserSpecificInfo)init
{
  SKEUserSpecificInfo *result;

  result = (SKEUserSpecificInfo *)_swift_stdlib_reportUnimplementedInitializer();
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
