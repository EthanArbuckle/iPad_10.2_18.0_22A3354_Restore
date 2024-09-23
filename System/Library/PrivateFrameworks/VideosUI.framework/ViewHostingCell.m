@implementation ViewHostingCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI15ViewHostingCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = self;
  sub_1D9D0CBF4();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUI15ViewHostingCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15ViewHostingCell *result;

  sub_1D9D0D93C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15ViewHostingCell)initWithCoder:(id)a3
{
  _TtC8VideosUI15ViewHostingCell *result;

  sub_1D9D0D9C8(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ViewHostingCell_stackView));
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI15ViewHostingCell____lazy_storage___hostedViewsActionHandler));
}

@end
