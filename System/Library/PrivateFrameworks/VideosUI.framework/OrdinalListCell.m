@implementation OrdinalListCell

- (_TtC8VideosUI15OrdinalListCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15OrdinalListCell *result;

  sub_1D9F4D20C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15OrdinalListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F4D2D8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI15OrdinalListCell *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9F4D38C(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalListCell_numberLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalListCell_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalListCell_subtitleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalListCell_cellImageView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalListCell____lazy_storage___bottomSeparatorView));
}

- (id)zoomSourceView
{
  _TtC8VideosUI15OrdinalListCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9F4E708();

  return v3;
}

@end
