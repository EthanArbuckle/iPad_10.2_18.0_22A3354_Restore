@implementation OverlayView

- (_TtC8VideosUI11OverlayView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI11OverlayView *result;

  sub_1D9BACE00();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI11OverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9BACF10();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI11OverlayView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9BAD00C(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (VUILabel)accessibilityTitleLabel
{
  _TtC8VideosUI11OverlayView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9BADB84();

  return (VUILabel *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11OverlayView_gradientLayer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11OverlayView_gradientView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11OverlayView_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11OverlayView_textBadge);

}

@end
