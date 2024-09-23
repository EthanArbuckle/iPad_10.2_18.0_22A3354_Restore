@implementation SearchNoContentView

- (_TtC8VideosUI19SearchNoContentView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI19SearchNoContentView *result;

  sub_1D9F207A4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI19SearchNoContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F20DD4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI19SearchNoContentView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9F2179C(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_queryDescriptionBar));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19SearchNoContentView_searchQueryDescriptionBannerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19SearchNoContentView_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19SearchNoContentView_subtitleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19SearchNoContentView_messageLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19SearchNoContentView_attributionsView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19SearchNoContentView_debugLabel);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
}

@end
