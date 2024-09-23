@implementation TomatometerTableView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI20TomatometerTableView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v6 = self;
  sub_1D9BC1F8C(a4, width);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI20TomatometerTableView *v2;

  v2 = self;
  sub_1D9BC2920();

}

- (NSArray)accessibilityItemViews
{
  uint64_t v2;
  _TtC8VideosUI20TomatometerTableView *v3;
  void *v4;

  v3 = self;
  sub_1D9BC2AA4();
  OUTLINED_FUNCTION_214();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAB2E80);
    v4 = (void *)sub_1DA1440F0();
    OUTLINED_FUNCTION_79();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (_TtC8VideosUI20TomatometerTableView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI20TomatometerTableView *result;

  sub_1D9BC2C74();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI20TomatometerTableView)initWithCoder:(id)a3
{
  id v3;
  _TtC8VideosUI20TomatometerTableView *result;

  v3 = a3;
  sub_1D9BC2CD8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (double)vuiBaselineHeight
{
  _TtC8VideosUI20TomatometerTableView *v2;
  double result;

  v2 = self;
  sub_1D9BC2DB4();
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_59();
  return result;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v7;
  _TtC8VideosUI20TomatometerTableView *v8;
  double result;

  v7 = a3;
  v8 = self;
  sub_1D9BC2E70((uint64_t)a3, a4);

  OUTLINED_FUNCTION_2_79();
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  _TtC8VideosUI20TomatometerTableView *v2;
  double result;

  v2 = self;
  sub_1D9BC2FE4();
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_59();
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  _TtC8VideosUI20TomatometerTableView *v4;
  double result;

  v4 = self;
  sub_1D9BC30BC(a3);
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_59();
  return result;
}

@end
