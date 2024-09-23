@implementation DayViewActivityRingsTableViewCell

- (_TtC10FitnessApp33DayViewActivityRingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC10FitnessApp33DayViewActivityRingsTableViewCell *)sub_1002D1378(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp33DayViewActivityRingsTableViewCell)initWithCoder:(id)a3
{
  sub_1002D2EE8(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_activitySummary));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_pauseRingsCoordinator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_layoutConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_ringsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_pauseRingsLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_pauseRingsDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33DayViewActivityRingsTableViewCell_pauseRingsResumeDateLabel));
}

@end
