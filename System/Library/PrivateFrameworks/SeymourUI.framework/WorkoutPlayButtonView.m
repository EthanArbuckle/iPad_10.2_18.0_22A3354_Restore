@implementation WorkoutPlayButtonView

- (_TtC9SeymourUI21WorkoutPlayButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21WorkoutPlayButtonView *)sub_22B357E38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21WorkoutPlayButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B358960();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI21WorkoutPlayButtonView *v2;

  v2 = self;
  sub_22B358688();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlayButtonView_playButton));
}

@end
