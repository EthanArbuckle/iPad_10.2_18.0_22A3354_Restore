@implementation MediaShowcasingGradientView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI27MediaShowcasingGradientView *v7;
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
  sub_1D9E95B88(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC8VideosUI27MediaShowcasingGradientView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI27MediaShowcasingGradientView *result;

  sub_1D9E96A6C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI27MediaShowcasingGradientView)initWithCoder:(id)a3
{
  _TtC8VideosUI27MediaShowcasingGradientView *result;

  sub_1D9E96AF4(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MediaShowcasingGradientView_maskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MediaShowcasingGradientView_backgroundBlurView));
  swift_release();
}

@end
