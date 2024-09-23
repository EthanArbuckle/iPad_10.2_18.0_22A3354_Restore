@implementation CHWorkoutDetailEffortTableViewCell

- (CHWorkoutDetailEffortTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (CHWorkoutDetailEffortTableViewCell *)sub_1002B927C(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailEffortTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002BCDB8();
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 parent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CHWorkoutDetailEffortTableViewCell *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_1002B9B40(v10, a4, v12, v13);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_effortController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_effortView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_effortHolder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_workout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_workoutActivity));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_noteSink));
}

@end
