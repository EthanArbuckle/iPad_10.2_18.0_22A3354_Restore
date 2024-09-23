@implementation WorkoutTimeInZoneView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = INFINITY;
  v3 = 33.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC10FitnessApp21WorkoutTimeInZoneView)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp21WorkoutTimeInZoneView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_dividerHeight) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp21WorkoutTimeInZoneView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F4ELL, 0xEF6465746E656D65, "FitnessApp/WorkoutTimeInZoneView.swift", 38, 2, 181, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  _TtC10FitnessApp21WorkoutTimeInZoneView *v6;
  id v7;
  double v8;
  double v9;
  id v10;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_dividerHeight);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v10 = v3;
    v7 = -[WorkoutTimeInZoneView traitCollection](v6, "traitCollection");
    objc_msgSend(v7, "displayScale");
    v9 = v8;

    objc_msgSend(v10, "setConstant:", 1.0 / v9);
  }
}

- (_TtC10FitnessApp21WorkoutTimeInZoneView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp21WorkoutTimeInZoneView *result;

  result = (_TtC10FitnessApp21WorkoutTimeInZoneView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutTimeInZoneView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_zone));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_dividerHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_zoneNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_rangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_barContainerView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->zone[OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_unit]);
}

@end
