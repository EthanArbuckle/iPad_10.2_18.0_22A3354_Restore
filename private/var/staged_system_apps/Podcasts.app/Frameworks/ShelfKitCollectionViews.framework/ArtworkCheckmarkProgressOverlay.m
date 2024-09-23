@implementation ArtworkCheckmarkProgressOverlay

- (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_progressStyle) = 2;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_checkmarkInset) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_progress) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_playing) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ArtworkCheckmarkProgressOverlay.swift", 61, 2, 25, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *v2;

  v2 = self;
  sub_2459FC();

}

- (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *result;

  result = (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ArtworkCheckmarkProgressOverlay", 55, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_checkmarkImageView));
}

@end
