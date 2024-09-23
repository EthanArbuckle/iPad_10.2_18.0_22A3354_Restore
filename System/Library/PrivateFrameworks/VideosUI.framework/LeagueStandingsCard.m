@implementation LeagueStandingsCard

- (_TtC8VideosUI19LeagueStandingsCard)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI19LeagueStandingsCard *result;

  sub_1D9A8D1D0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI19LeagueStandingsCard)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9A8D2BC();
}

- (void)dealloc
{
  _TtC8VideosUI19LeagueStandingsCard *v2;

  v2 = self;
  sub_1D9A8D37C();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19LeagueStandingsCard_hostingView));
  OUTLINED_FUNCTION_10_3();
}

- (void)contentSizeCategoryDidChange
{
  _TtC8VideosUI19LeagueStandingsCard *v2;

  v2 = self;
  sub_1D9A8D4B8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI19LeagueStandingsCard *v2;

  v2 = self;
  sub_1D9A8D7FC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  OUTLINED_FUNCTION_8_14();
  v6 = v5;
  v7 = OUTLINED_FUNCTION_21_4();
  sub_1D9A8D904(a4, v7, v8);

  v9 = OUTLINED_FUNCTION_63_0();
  result.height = v10;
  result.width = v9;
  return result;
}

@end
