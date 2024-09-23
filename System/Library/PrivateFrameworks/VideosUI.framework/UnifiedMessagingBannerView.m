@implementation UnifiedMessagingBannerView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI26UnifiedMessagingBannerView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9E31D30(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI26UnifiedMessagingBannerView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI26UnifiedMessagingBannerView *result;

  sub_1D9E31EBC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26UnifiedMessagingBannerView)initWithCoder:(id)a3
{
  _TtC8VideosUI26UnifiedMessagingBannerView *result;

  sub_1D9E31F34(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UnifiedMessagingBannerView_bannerContentView));
  swift_release();
}

@end
