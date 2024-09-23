@implementation CastBannerCollectionViewCell

- (_TtC8VideosUI28CastBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI28CastBannerCollectionViewCell *)sub_1DA0A5C3C();
}

- (_TtC8VideosUI28CastBannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA0A5D0C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI28CastBannerCollectionViewCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1DA0A5DD8(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)prepareForReuse
{
  _TtC8VideosUI28CastBannerCollectionViewCell *v2;

  v2 = self;
  sub_1DA0A6594();

}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_titleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_attributionTextView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_descriptionView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_monogramView));
}

@end
