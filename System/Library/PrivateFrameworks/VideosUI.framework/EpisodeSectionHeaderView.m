@implementation EpisodeSectionHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8VideosUI24EpisodeSectionHeaderView *v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1D9E5C610(width);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI24EpisodeSectionHeaderView *v2;

  v2 = self;
  sub_1D9E5C810();

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI24EpisodeSectionHeaderView *v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v6 = self;
  sub_1D9E5C618(a4, width);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8VideosUI24EpisodeSectionHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI24EpisodeSectionHeaderView *result;

  sub_1D9E5C8D0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI24EpisodeSectionHeaderView)initWithCoder:(id)a3
{
  _TtC8VideosUI24EpisodeSectionHeaderView *result;

  sub_1D9E5C94C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24EpisodeSectionHeaderView_buttonView));
  swift_release();
}

@end
