@implementation FullScreenVideoControls

- (_TtC23ShelfKitCollectionViews23FullScreenVideoControls)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews23FullScreenVideoControls *result;

  sub_292A2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews23FullScreenVideoControls)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_293E68();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews23FullScreenVideoControls *v2;

  v2 = self;
  sub_293918();

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 47.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  sub_293FC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_backdrop));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_progressBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_progressBarFill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_currentTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_totalDurationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_durationFormatter));
}

@end
