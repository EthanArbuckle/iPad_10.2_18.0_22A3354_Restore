@implementation QueryDescriptionBannerViewCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI30QueryDescriptionBannerViewCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9EDD5E0(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI30QueryDescriptionBannerViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI30QueryDescriptionBannerViewCell *result;

  sub_1D9EDE95C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI30QueryDescriptionBannerViewCell)initWithCoder:(id)a3
{
  _TtC8VideosUI30QueryDescriptionBannerViewCell *result;

  sub_1D9EDEA08(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_customPreviewTarget);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_textBackgroundView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_textView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_additionalInfoView));
}

@end
