@implementation LegacyArtworkCheckmarkProgressOverlay

- (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_progressStyle) = 2;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_checkmarkInset) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_progress) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_playing) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/LegacyArtworkCheckmarkProgressOverlay.swift", 67, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *v2;

  v2 = self;
  sub_148D10();

}

- (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *result;

  result = (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.LegacyArtworkCheckmarkProgressOverlay", 61, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_checkmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_blurredImageBackgroundView));
}

@end
