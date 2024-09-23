@implementation _STKStickerAttributionInfo

- (NSNumber)adamID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____STKStickerAttributionInfo_adamID));
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKStickerAttributionInfo_bundleIdentifier);
}

- (NSString)name
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKStickerAttributionInfo_name);
}

- (_STKStickerAttributionInfo)initWithAdamID:(id)a3 bundleIdentifier:(id)a4 name:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  objc_super v17;

  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  v8 = sub_247A1AEE4();
  v10 = v9;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v11 = sub_247A1AEE4();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKStickerAttributionInfo_adamID) = (Class)a3;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerAttributionInfo_bundleIdentifier);
  *v13 = v8;
  v13[1] = v10;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerAttributionInfo_name);
  *v14 = v11;
  v14[1] = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for _STKStickerAttributionInfo();
  v15 = a3;
  return -[_STKStickerAttributionInfo init](&v17, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_2479D475C(self, (uint64_t)a2, (void (*)(void))sub_2479ED674);
}

- (_STKStickerAttributionInfo)init
{
  _STKStickerAttributionInfo *result;

  result = (_STKStickerAttributionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
