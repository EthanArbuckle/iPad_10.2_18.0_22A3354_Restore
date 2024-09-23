@implementation StyledProgressBarView

- (_TtC8VideosUI21StyledProgressBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI21StyledProgressBarView *)sub_1DA0E1EA0();
}

- (_TtC8VideosUI21StyledProgressBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA0E24C8();
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v7;
  _TtC8VideosUI21StyledProgressBarView *v8;

  v7 = a5;
  v8 = self;
  sub_1DA0E258C(a3);

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI21StyledProgressBarView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1DA0E2684(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)accessibilityProgress
{
  _TtC8VideosUI21StyledProgressBarView *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1D9BADB84();
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_progressBarView));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_shadowImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_progressTintColor);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_gradientStartColor);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_gradientEndColor);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_completeTintColor));
}

@end
