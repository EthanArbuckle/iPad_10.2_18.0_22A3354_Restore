@implementation SportsCanonicalBannerCell

- (_TtC8VideosUI25SportsCanonicalBannerCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI25SportsCanonicalBannerCell *result;

  sub_1DA042590();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25SportsCanonicalBannerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA04269C();
}

- (void)dealloc
{
  _TtC8VideosUI25SportsCanonicalBannerCell *v2;

  v2 = self;
  sub_1DA0427C0();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_uberBackgroundView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_transitionBackgroundView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_newBannerAccessoryView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_newBannerView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_scoreboardUpdateTimer);
  OUTLINED_FUNCTION_15_2();
  swift_release();
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI25SportsCanonicalBannerCell *v2;

  v2 = self;
  sub_1DA042930();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_cellWillBeDisplayed
{
  _TtC8VideosUI25SportsCanonicalBannerCell *v2;

  v2 = self;
  sub_1DA0429FC((SEL *)&selRef_vui_cellWillBeDisplayed, (void (*)(id))sub_1D9C765C0);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_cellDidEndDisplaying
{
  _TtC8VideosUI25SportsCanonicalBannerCell *v2;

  v2 = self;
  sub_1DA0429FC((SEL *)&selRef_vui_cellDidEndDisplaying, (void (*)(id))sub_1D9C76BCC);
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI25SportsCanonicalBannerCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1DA042A80(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)onSystemTraitCollectionDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC8VideosUI25SportsCanonicalBannerCell *v6;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  sub_1DA13F080();
  v6 = self;
  sub_1DA044BB0();

  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

@end
