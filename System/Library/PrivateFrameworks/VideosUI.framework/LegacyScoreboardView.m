@implementation LegacyScoreboardView

- (_TtC8VideosUI20LegacyScoreboardView)init
{
  _TtC8VideosUI20LegacyScoreboardView *result;

  sub_1D9C67558();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI20LegacyScoreboardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C677BC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI20LegacyScoreboardView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = self;
  sub_1D9C68738(a4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI20LegacyScoreboardView)initWithFrame:(CGRect)a3
{
  sub_1D9C68EAC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20LegacyScoreboardView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20LegacyScoreboardView_materialBackgroundView));
  swift_bridgeObjectRelease();
  swift_release();
}

@end
