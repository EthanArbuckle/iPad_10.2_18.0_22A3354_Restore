@implementation SyndicationCell

- (_TtC8VideosUI15SyndicationCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15SyndicationCell *result;

  sub_1D9D699DC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15SyndicationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9D69BD8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI15SyndicationCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9D69CA8(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)vui_cellWillBeDisplayed
{
  _TtC8VideosUI15SyndicationCell *v2;

  v2 = self;
  sub_1D9D6A830((const char **)&selRef_vui_cellWillBeDisplayed, 1);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_cellDidSelect
{
  _TtC8VideosUI15SyndicationCell *v2;

  v2 = self;
  sub_1D9D6A830((const char **)&selRef_vui_cellDidSelect, 0);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI15SyndicationCell *v2;

  v2 = self;
  sub_1D9D6A914();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15SyndicationCell_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15SyndicationCell_subtitleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15SyndicationCell_imageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15SyndicationCell_attributionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15SyndicationCell_badgeView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15SyndicationCell____lazy_storage___bottomSeparatorView);
  swift_bridgeObjectRelease();
}

@end
