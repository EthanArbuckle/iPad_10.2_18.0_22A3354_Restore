@implementation LeagueStandingsLegendView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  _TtC8VideosUI25LeagueStandingsLegendView *v4;
  double v5;
  double v6;
  CGSize result;

  v4 = self;
  sub_1D9AF84D0();
  OUTLINED_FUNCTION_28_2();
  v5 = v2;
  v6 = v3;
  result.height = v6;
  result.width = v5;
  return result;
}

- (_TtC8VideosUI25LeagueStandingsLegendView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI25LeagueStandingsLegendView *result;

  sub_1D9AF86AC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25LeagueStandingsLegendView)initWithCoder:(id)a3
{
  _TtC8VideosUI25LeagueStandingsLegendView *result;

  sub_1D9AF8788(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI25LeagueStandingsLegendView____lazy_storage___mainStack));
}

@end
