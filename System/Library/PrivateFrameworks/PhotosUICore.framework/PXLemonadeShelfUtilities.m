@implementation PXLemonadeShelfUtilities

+ (id)shelfIdentifierWithSlug:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;
  void *v7;
  char v9;

  v3 = sub_1A7AE3764();
  v5 = v4;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  LemonadeShelfIdentifier.init(slug:)(v6);
  if (v9 == 23)
  {
    static LemonadeShelfIdentifier.standardSuffix.getter();
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    sub_1A7AE3878();
    swift_bridgeObjectRelease();
  }
  else
  {
    LemonadeShelfIdentifier.rawValue.getter();
  }
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC12PhotosUICore24PXLemonadeShelfUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXLemonadeShelfUtilities();
  return -[PXLemonadeShelfUtilities init](&v3, sel_init);
}

@end
