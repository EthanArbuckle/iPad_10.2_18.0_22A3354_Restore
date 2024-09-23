@implementation CanonicalFooterAiringView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI25CanonicalFooterAiringView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9EB076C(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI25CanonicalFooterAiringView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI25CanonicalFooterAiringView *result;

  sub_1D9EB0DFC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25CanonicalFooterAiringView)initWithCoder:(id)a3
{
  _TtC8VideosUI25CanonicalFooterAiringView *result;

  sub_1D9EB0EA4(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25CanonicalFooterAiringView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25CanonicalFooterAiringView_imageView));
}

@end
