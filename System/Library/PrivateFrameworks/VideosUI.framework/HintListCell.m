@implementation HintListCell

- (_TtC8VideosUI12HintListCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI12HintListCell *result;

  sub_1D9F31E74();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI12HintListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F31F20();
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9F31FC4(v4, v3);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  double v7;
  double v8;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9F32538(a4, v5, v4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)prepareForReuse
{
  _TtC8VideosUI12HintListCell *v2;

  v2 = self;
  sub_1D9F325E0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _TtC8VideosUI12HintListCell *v4;

  v4 = self;
  sub_1D9F32690(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI12HintListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI12HintListCell____lazy_storage___accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI12HintListCell____lazy_storage___bottomSeparatorView));
}

@end
