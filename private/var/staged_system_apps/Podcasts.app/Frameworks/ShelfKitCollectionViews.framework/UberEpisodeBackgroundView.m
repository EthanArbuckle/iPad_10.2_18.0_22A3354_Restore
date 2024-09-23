@implementation UberEpisodeBackgroundView

- (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView *result;

  sub_1D8480(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9798();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView *v6;

  v5 = a3;
  v6 = self;
  sub_1D8BE8(a3);

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView *v2;

  v2 = self;
  sub_1D9494();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_gradientOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_navGradientView));
  sub_B7AE8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient), *(_QWORD *)&self->backgroundImageView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(_QWORD *)&self->blurView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(_QWORD *)&self->gradientOverlayView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(_QWORD *)&self->navGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(_QWORD *)&self->zoomFactor[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(_QWORD *)&self->offset[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void **)&self->$__lazy_storage_$_lightGradient[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient]);
  sub_B7AE8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient), *(_QWORD *)&self->backgroundImageView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient], *(_QWORD *)&self->blurView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient], *(_QWORD *)&self->gradientOverlayView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient], *(_QWORD *)&self->navGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient], *(_QWORD *)&self->zoomFactor[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient], *(_QWORD *)&self->offset[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient], *(void **)&self->$__lazy_storage_$_lightGradient[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient]);
}

@end
