@implementation LeagueStandingsLegendFooter

- (_TtC8VideosUI27LeagueStandingsLegendFooter)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI27LeagueStandingsLegendFooter *result;

  sub_1DA0281C4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI27LeagueStandingsLegendFooter)initWithCoder:(id)a3
{
  _TtC8VideosUI27LeagueStandingsLegendFooter *result;

  sub_1DA028230(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC8VideosUI27LeagueStandingsLegendFooter *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1DA028500();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI27LeagueStandingsLegendFooter_legendView));
}

@end
