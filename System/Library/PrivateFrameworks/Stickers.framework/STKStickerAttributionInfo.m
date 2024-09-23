@implementation STKStickerAttributionInfo

- (NSNumber)adamID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___STKStickerAttributionInfo_adamID));
}

- (NSString)bundleIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___STKStickerAttributionInfo_bundleIdentifier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_247A1AEE4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerAttributionInfo_bundleIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)name
{
  void *v2;

  if (*(_QWORD *)&self->adamID[OBJC_IVAR___STKStickerAttributionInfo_name])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_247A1AEC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  STKStickerAttributionInfo *v4;
  STKStickerAttributionInfo *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_247A1B244();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_247A15C5C((uint64_t)v8);

  sub_2479DFA90((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  STKStickerAttributionInfo *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_247A15EF4();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STKStickerAttributionInfo)initWithCoder:(id)a3
{
  return (STKStickerAttributionInfo *)Sticker.AttributionInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  STKStickerAttributionInfo *v5;

  v4 = a3;
  v5 = self;
  sub_247A16518(v4);

}

- (NSString)description
{
  STKStickerAttributionInfo *v2;
  void *v3;

  v2 = self;
  sub_247A16958();

  v3 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (STKStickerAttributionInfo)init
{
  STKStickerAttributionInfo *result;

  result = (STKStickerAttributionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
