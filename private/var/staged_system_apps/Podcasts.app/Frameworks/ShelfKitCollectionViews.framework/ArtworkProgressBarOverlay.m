@implementation ArtworkProgressBarOverlay

- (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressStyle) = 1;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progress) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_playing) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ArtworkProgressBarOverlay.swift", 55, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *v2;

  v2 = self;
  sub_135F8();

}

- (void)updateProgressViewOpacity
{
  _TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *v2;

  v2 = self;
  sub_13868();

}

- (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *result;

  result = (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ArtworkProgressBarOverlay", 49, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(void **)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressBarSettings];
  v4 = *(void **)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressBarSettings
                                           + 7];
  objc_release(*(id *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressBarSettings
                                            + 7]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressView));
}

@end
