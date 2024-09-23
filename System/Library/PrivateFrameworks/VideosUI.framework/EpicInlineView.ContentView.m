@implementation EpicInlineView.ContentView

- (_TtCC8VideosUI14EpicInlineView11ContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI14EpicInlineView11ContentView *)sub_1DA0E50F8();
}

- (_TtCC8VideosUI14EpicInlineView11ContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA0E55CC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtCC8VideosUI14EpicInlineView11ContentView *v7;
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
  sub_1DA0E572C(a4, width, height);
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
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_mainGradientColor);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_hostMediaController);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_didHostMediaController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_backgroundMediaController);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_verticalStackView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_logoImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_channelLogoView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_epicBannerView);
  swift_weakDestroy();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView____lazy_storage___logoGradientView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView____lazy_storage___gradientContainerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_visualEffectView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView____lazy_storage___gradientLayer);
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_opacityMaskLayer));
}

@end
