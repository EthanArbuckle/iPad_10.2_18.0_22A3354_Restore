@implementation LegacyArtworkProgressBarOverlay

- (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressStyle) = 1;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progress) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_playing) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/LegacyArtworkProgressBarOverlay.swift", 61, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *v2;

  v2 = self;
  sub_129EC0();

}

- (void)updateProgressViewOpacity
{
  _TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *v2;

  v2 = self;
  sub_12A218();

}

- (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *result;

  result = (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.LegacyArtworkProgressBarOverlay", 55, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(void **)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressBarSettings];
  v4 = *(void **)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressBarSettings
                                           + 7];
  objc_release(*(id *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressBarSettings
                                            + 7]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_blurredImageBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressView));
}

@end
