@implementation CHWorkoutDetailPowerTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  return 132.0;
}

- (CHWorkoutDetailPowerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailPowerTableViewCell *)sub_10055B784(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailPowerTableViewCell)initWithCoder:(id)a3
{
  id v4;
  CHWorkoutDetailPowerTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_powerController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_cellPadding) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_cellInset) = (Class)0x4030000000000000;
  v4 = a3;

  result = (CHWorkoutDetailPowerTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailPowerTableViewCell.swift", 48, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 powerSamples:(id)a7 parent:(id)a8
{
  uint64_t v15;
  CHWorkoutDetailHeartRateTableViewCell *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CHWorkoutDetailPowerTableViewCell *v22;
  SEL v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v15 = sub_10001E724(0, (unint64_t *)&qword_100823F18, HKQuantitySample_ptr);
  v16 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, v15);
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = self;
  sub_10055BA14(v17, a4, v19, v20, (uint64_t)v16, v21);

  swift_bridgeObjectRelease(v16, v23, v24, v25, v26, v27, v28, v29);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_powerController));
}

@end
