@implementation LeagueStandingsLegendIndicatorView

- (_TtC8VideosUI34LeagueStandingsLegendIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DD7A08();
}

- (_TtC8VideosUI34LeagueStandingsLegendIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI34LeagueStandingsLegendIndicatorView *)sub_1D9DD7A88();
}

- (CGSize)intrinsicContentSize
{
  _TtC8VideosUI34LeagueStandingsLegendIndicatorView *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = self;
  sub_1D9DD7BA4();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI34LeagueStandingsLegendIndicatorView *v5;
  double v6;
  double v7;
  CGSize result;

  v5 = self;
  sub_1D9DD7D4C(a4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI34LeagueStandingsLegendIndicatorView *v2;

  v2 = self;
  sub_1D9DD7F64();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LeagueStandingsLegendIndicatorView_indicatorImageView));
}

@end
