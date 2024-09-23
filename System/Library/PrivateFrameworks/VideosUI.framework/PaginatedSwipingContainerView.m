@implementation PaginatedSwipingContainerView

- (_TtC8VideosUI29PaginatedSwipingContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI29PaginatedSwipingContainerView *)sub_1D9CC526C();
}

- (_TtC8VideosUI29PaginatedSwipingContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CC5320();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI29PaginatedSwipingContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v5 = self;
  v6 = OUTLINED_FUNCTION_21_4();
  sub_1D9CC5B44(a4, v6, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI29PaginatedSwipingContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29PaginatedSwipingContainerView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29PaginatedSwipingContainerView_metadataView));
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _TtC8VideosUI29PaginatedSwipingContainerView *v4;

  v4 = self;
  LOBYTE(a3) = sub_1D9CC5CA0(a3);

  return a3 & 1;
}

@end
