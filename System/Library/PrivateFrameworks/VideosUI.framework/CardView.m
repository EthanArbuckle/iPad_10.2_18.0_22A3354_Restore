@implementation CardView

- (_TtC8VideosUI8CardView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI8CardView *result;

  sub_1D97BA7C4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)mainImageLoadedNotificationHandler
{
  _TtC8VideosUI8CardView *v2;

  v2 = self;
  sub_1D97BA8F4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI8CardView *v4;
  double v5;
  double v6;
  CGSize result;

  v4 = self;
  sub_1D973E12C();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)vuiDebugUI
{
  _TtC8VideosUI8CardView *v2;
  char v3;

  v2 = self;
  v3 = sub_1D97BAFF4();

  return v3 & 1;
}

- (_TtC8VideosUI8CardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C64C54();
}

- (void)dealloc
{
  _TtC8VideosUI8CardView *v2;

  v2 = self;
  sub_1D9C64D4C();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_imageAndOverlayContainerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_imageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_appImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_overlayView);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_button);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_downloadIndicator);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI8CardView_attributionView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI8CardView_bottomSeparatorView));
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC8VideosUI8CardView *v4;

  v4 = self;
  sub_1D9C64E8C(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (VUIImageView)accessibilityImageView
{
  void *v2;
  _TtC8VideosUI8CardView *v3;

  v3 = self;
  sub_1D9C6661C();
  OUTLINED_FUNCTION_214();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (VUIImageView)accessibilityAppImageView
{
  void *v2;
  _TtC8VideosUI8CardView *v3;

  v3 = self;
  sub_1D9C66660();
  OUTLINED_FUNCTION_214();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (UIView)accessibilityOverlayView
{
  void *v2;
  _TtC8VideosUI8CardView *v3;

  v3 = self;
  sub_1D9C666A4();
  OUTLINED_FUNCTION_214();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

- (NSArray)accessibilityLabelViews
{
  uint64_t v2;
  _TtC8VideosUI8CardView *v3;
  uint64_t v4;
  void *v5;

  v3 = self;
  sub_1D9C6671C();
  OUTLINED_FUNCTION_214();
  if (!v2)
    return (NSArray *)OUTLINED_FUNCTION_111(0);
  OUTLINED_FUNCTION_236(v4, (unint64_t *)&qword_1EDA95040);
  v5 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v5);
}

- (UIView)accessibilityButton
{
  void *v2;
  _TtC8VideosUI8CardView *v3;

  v3 = self;
  sub_1D9C66760();
  OUTLINED_FUNCTION_214();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

@end
