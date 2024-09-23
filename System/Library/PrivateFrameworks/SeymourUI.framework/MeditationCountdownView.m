@implementation MeditationCountdownView

- (_TtC9SeymourUI23MeditationCountdownView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  _TtC9SeymourUI23MeditationCountdownView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownStep);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownWindUp);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownFadeOut);
  *v6 = 0;
  v6[1] = 0;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownCompleted);
  *v7 = 0;
  v7[1] = 0;
  v8 = a3;

  result = (_TtC9SeymourUI23MeditationCountdownView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for MeditationCountdownView();
  -[MeditationCountdownView layoutSubviews](&v2, sel_layoutSubviews);
}

- (_TtC9SeymourUI23MeditationCountdownView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI23MeditationCountdownView *result;

  result = (_TtC9SeymourUI23MeditationCountdownView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownStep));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownWindUp));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownFadeOut));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownCompleted));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_countdownRingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_centerAnimationView));
}

@end
