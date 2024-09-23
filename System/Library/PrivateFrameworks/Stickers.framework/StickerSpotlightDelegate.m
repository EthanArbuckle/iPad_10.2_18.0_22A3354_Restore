@implementation StickerSpotlightDelegate

- (id)bundleIdentifier
{
  return (id)sub_247A1AEC0();
}

- (id)attributeSetForObject:(id)a3
{
  id v4;
  _TtC8Stickers24StickerSpotlightDelegate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_247A19500(v4);

  return v6;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  sub_247A1ADAC();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for StickerSpotlightDelegate();
  v8 = -[NSCoreDataCoreSpotlightDelegate initForStoreWithDescription:coordinator:](&v10, sel_initForStoreWithDescription_coordinator_, v6, v7);

  return v8;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Stickers24StickerSpotlightDelegate_logger;
  v3 = sub_247A1ADB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
