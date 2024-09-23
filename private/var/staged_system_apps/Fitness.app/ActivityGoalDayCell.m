@implementation ActivityGoalDayCell

- (_TtC10FitnessApp19ActivityGoalDayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp19ActivityGoalDayCell *)sub_10050A544(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp19ActivityGoalDayCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  _TtC10FitnessApp19ActivityGoalDayCell *result;

  v5 = OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_dayLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_goalView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8, 0);

  result = (_TtC10FitnessApp19ActivityGoalDayCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivityGoalDayCell.swift", 36, 2, 32, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_goalView));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate);
}

- (void)setupGoalViewValueChanged:(id)a3 value:(id)a4
{
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  id v13;
  _TtC10FitnessApp19ActivityGoalDayCell *v14;

  v7 = (char *)self + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = *((_QWORD *)v7 + 1);
    swift_getObjectType(Strong);
    v11 = *(void (**)(void))(v10 + 8);
    v12 = a3;
    v13 = a4;
    v14 = self;
    v11();

    swift_unknownObjectRelease(v9);
  }
}

@end
