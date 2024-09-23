@implementation CanonicalFooterSectionView

- (_TtC8VideosUI26CanonicalFooterSectionView)init
{
  _TtC8VideosUI26CanonicalFooterSectionView *result;

  sub_1D9EE5048();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26CanonicalFooterSectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9EE5130();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat width;
  _TtC8VideosUI26CanonicalFooterSectionView *v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a4;
  width = a3.width;
  v6 = self;
  v7 = sub_1D9EE5224(v4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (VUILabel)accessibilityHeaderView
{
  _TtC8VideosUI26CanonicalFooterSectionView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9EB34B8();

  return (VUILabel *)v3;
}

- (_TtC8VideosUI26CanonicalFooterSectionView)initWithFrame:(CGRect)a3
{
  sub_1D9EE5D20();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26CanonicalFooterSectionView_headerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26CanonicalFooterSectionView_footerView);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26CanonicalFooterSectionView_prototypeItemHeaderLabel);
  OUTLINED_FUNCTION_19_5();
}

@end
