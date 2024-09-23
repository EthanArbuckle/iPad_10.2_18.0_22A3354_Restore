@implementation LeagueRankView

- (_TtC8VideosUI14LeagueRankView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9D57140();
}

- (_TtC8VideosUI14LeagueRankView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI14LeagueRankView *result;

  sub_1D9D571C8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC8VideosUI14LeagueRankView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1D9D572C8();
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
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___mainContainerView));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14LeagueRankView_indicatorView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14LeagueRankView_starView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14LeagueRankView_rankTextView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___favoritesSpacer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___indicatorSpacer);
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___rankSpacer));
}

@end
