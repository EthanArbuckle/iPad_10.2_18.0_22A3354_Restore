@implementation TVWorkoutPlanRepetitionDetailView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *MEMORY[0x24BEBE590];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView_stackView), sel_intrinsicContentSize);
  v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView_stackView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v7 = a3;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setAxis_, 1);
  objc_msgSend(v8, sel_setSpacing_, 24.0);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView *result;

  result = (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView_stackView));
}

@end
