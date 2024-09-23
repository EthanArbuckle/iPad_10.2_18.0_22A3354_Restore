@implementation WorkoutCountdownView

- (_TtC9SeymourUI20WorkoutCountdownView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2A6DAC();
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for WorkoutCountdownView();
  -[WorkoutCountdownView layoutSubviews](&v2, sel_layoutSubviews);
}

- (_TtC9SeymourUI20WorkoutCountdownView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI20WorkoutCountdownView *result;

  result = (_TtC9SeymourUI20WorkoutCountdownView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownStep));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownWindUp));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownFadeOut));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownCompleted));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_countdownRingView));
}

@end
