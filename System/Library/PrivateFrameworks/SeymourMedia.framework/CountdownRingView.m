@implementation CountdownRingView

- (_TtC12SeymourMedia17CountdownRingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21A189EA8();
}

- (_TtC12SeymourMedia17CountdownRingView)initWithFrame:(CGRect)a3
{
  _TtC12SeymourMedia17CountdownRingView *result;

  result = (_TtC12SeymourMedia17CountdownRingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21A0E0118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownStep));
  sub_21A0E0118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownWindUp));
  sub_21A0E0118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownFadeOut));
  sub_21A0E0118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownCompleted));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_countdownView));
}

- (void)countdownAnimatorDidFinishAnimating:(id)a3
{
  void (**v5)(uint64_t);
  void (*v6)(uint64_t);
  id v7;
  _TtC12SeymourMedia17CountdownRingView *v8;
  uint64_t v9;

  v5 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownCompleted);
  swift_beginAccess();
  v6 = *v5;
  if (*v5)
  {
    v7 = a3;
    v8 = self;
    v9 = sub_21A111AF0((uint64_t)v6);
    v6(v9);
    sub_21A0E0118((uint64_t)v6);

  }
}

- (void)countdownAnimator:(id)a3 performingAnimation:(id)a4 withDuration:(double)a5
{
  id v7;
  _TtC12SeymourMedia17CountdownRingView *v8;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  sub_21A189F98(a4);

  swift_unknownObjectRelease();
}

@end
