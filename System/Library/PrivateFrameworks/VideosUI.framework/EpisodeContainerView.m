@implementation EpisodeContainerView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI20EpisodeContainerView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  sub_1D9C3A690(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC8VideosUI20EpisodeContainerView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI20EpisodeContainerView *result;

  sub_1D9C3A8E8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI20EpisodeContainerView)initWithCoder:(id)a3
{
  _TtC8VideosUI20EpisodeContainerView *result;

  sub_1D9C3A994(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_headerView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_decorationView));
}

@end
