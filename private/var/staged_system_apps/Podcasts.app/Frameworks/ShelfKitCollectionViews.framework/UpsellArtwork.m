@implementation UpsellArtwork

- (_TtC23ShelfKitCollectionViews13UpsellArtwork)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC23ShelfKitCollectionViews13UpsellArtwork *result;

  v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_titleBar;
  v6 = type metadata accessor for UpsellTitleBar();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");

  result = (_TtC23ShelfKitCollectionViews13UpsellArtwork *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/UpsellArtworkHeader.swift", 49, 2, 65, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews13UpsellArtwork)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews13UpsellArtwork *result;

  result = (_TtC23ShelfKitCollectionViews13UpsellArtwork *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.UpsellArtwork", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_titleBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_upsellShowGridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_upsellInformation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_objectGraph));
}

@end
