@implementation DayViewRingsConfigurationCell

- (_TtC10FitnessApp29DayViewRingsConfigurationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  _TtC10FitnessApp29DayViewRingsConfigurationCell *result;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  sub_1003B23F8(a3, (uint64_t)a4, v6);
  return result;
}

- (void)onLeftButtonPressed:(id)a3
{
  id v4;
  _TtC10FitnessApp29DayViewRingsConfigurationCell *v5;

  v4 = a3;
  v5 = self;
  sub_1003B34F8(&OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onUnpauseRings, &OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onChangeGoals);

}

- (void)onRightButtonPressed:(id)a3
{
  id v4;
  _TtC10FitnessApp29DayViewRingsConfigurationCell *v5;

  v4 = a3;
  v5 = self;
  sub_1003B34F8(&OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onEditPauseRings, &OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onPauseRings);

}

- (_TtC10FitnessApp29DayViewRingsConfigurationCell)initWithCoder:(id)a3
{
  sub_1003B32A8(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_rightButton));
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onChangeGoals), *(_QWORD *)&self->leftButton[OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onChangeGoals]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onPauseRings), *(_QWORD *)&self->leftButton[OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onPauseRings]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onUnpauseRings), *(_QWORD *)&self->leftButton[OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onUnpauseRings]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onEditPauseRings), *(_QWORD *)&self->leftButton[OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onEditPauseRings]);
}

@end
