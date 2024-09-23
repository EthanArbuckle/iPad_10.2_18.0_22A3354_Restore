@implementation EpisodePlayProgressView

- (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView *)sub_182898(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s23ShelfKitCollectionViews23EpisodePlayProgressViewC5coderACSo7NSCoderC_tcfc_0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double *v4;
  double v5;
  double v6;
  _BYTE v7[24];
  CGSize result;

  width = a3.width;
  v4 = (double *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_barHeight);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_barHeight, v7, 0, 0);
  v5 = *v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews23EpisodePlayProgressView *v2;

  v2 = self;
  sub_183300();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_backgroundShapeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_foregroundShapeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_borderShapeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_progressColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_trackColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_borderColor));
}

@end
