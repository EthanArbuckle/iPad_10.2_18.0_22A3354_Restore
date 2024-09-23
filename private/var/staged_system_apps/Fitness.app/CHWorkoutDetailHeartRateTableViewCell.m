@implementation CHWorkoutDetailHeartRateTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  return 132.0;
}

- (CHWorkoutDetailHeartRateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailHeartRateTableViewCell *)sub_1002C8478(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailHeartRateTableViewCell)initWithCoder:(id)a3
{
  id v4;
  CHWorkoutDetailHeartRateTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_heartRateController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_cellPadding) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_cellInset) = (Class)0x4030000000000000;
  v4 = a3;

  result = (CHWorkoutDetailHeartRateTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailHeartRateTableViewCell.swift", 52, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 heartRateReadings:(id)a7 averageHeartRate:(id)a8 parent:(id)a9
{
  uint64_t v16;
  CHWorkoutDetailHeartRateTableViewCell *v17;
  void (**v18)(char *, id);
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CHWorkoutDetailHeartRateTableViewCell *v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v16 = sub_10001E724(0, &qword_10082D158, HKHeartRateSummaryReading_ptr);
  v17 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, v16);
  v18 = (void (**)(char *, id))a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  v24 = self;
  sub_1002C8708(v18, a4, v20, v21, (uint64_t)v17, v22, v23);

  swift_bridgeObjectRelease(v17, v25, v26, v27, v28, v29, v30, v31, a9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_heartRateController));
}

@end
