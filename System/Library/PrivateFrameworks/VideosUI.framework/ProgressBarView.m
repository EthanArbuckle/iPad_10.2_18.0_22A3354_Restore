@implementation ProgressBarView

- (_TtC8VideosUI15ProgressBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15ProgressBarView *)sub_1DA045220();
}

- (_TtC8VideosUI15ProgressBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA0453F0();
}

- (void)drawRect:(CGRect)a3
{
  id v3;
  id v4;

  OUTLINED_FUNCTION_2_0();
  v4 = v3;
  OUTLINED_FUNCTION_11();
  sub_1DA0459F4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_progressTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_gradientStartColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_gradientEndColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_completeTintColor));
}

@end
