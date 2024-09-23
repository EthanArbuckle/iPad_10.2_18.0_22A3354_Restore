@implementation LeagueStandingsLegendItem

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  _TtC8VideosUI25LeagueStandingsLegendItem *v4;
  double v5;
  double v6;
  CGSize result;

  v4 = self;
  sub_1D9F2E1F8();
  OUTLINED_FUNCTION_28_2();
  v5 = v2;
  v6 = v3;
  result.height = v6;
  result.width = v5;
  return result;
}

- (_TtC8VideosUI25LeagueStandingsLegendItem)initWithCoder:(id)a3
{
  sub_1D9F2E488(a3);
  return 0;
}

- (_TtC8VideosUI25LeagueStandingsLegendItem)initWithFrame:(CGRect)a3
{
  sub_1D9F2EF60();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LeagueStandingsLegendItem____lazy_storage___mainStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LeagueStandingsLegendItem_indicatorView));
}

@end
