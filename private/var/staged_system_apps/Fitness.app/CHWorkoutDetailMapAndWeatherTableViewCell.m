@implementation CHWorkoutDetailMapAndWeatherTableViewCell

- (CHWorkoutDetailNavigationDelegate)navigationDelegate
{
  return (CHWorkoutDetailNavigationDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_navigationDelegate, a3);
}

- (CHWorkoutDetailAnalyticsHandler)analyticsHandler
{
  return (CHWorkoutDetailAnalyticsHandler *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_analyticsHandler);
}

- (void)setAnalyticsHandler:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_analyticsHandler, a3);
}

+ (double)preferredHeightForWorkout:(id)a3
{
  return 132.0;
}

- (CHWorkoutDetailMapAndWeatherTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailMapAndWeatherTableViewCell *)sub_10048DC24(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailMapAndWeatherTableViewCell)initWithCoder:(id)a3
{
  id v5;
  CHWorkoutDetailMapAndWeatherTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_mapAndWeatherViewModel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_snapshotGenerator) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_navigationDelegate, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_analyticsHandler, 0);
  v5 = a3;

  result = (CHWorkoutDetailMapAndWeatherTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailMapAndWeatherTableViewCell.swift", 56, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 parent:(id)a7 locationReadings:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CHWorkoutDetailMapAndWeatherTableViewCell *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = self;
  sub_10048EA54(v14, (uint64_t)a4, v17, v19);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_mapAndWeatherViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_snapshotGenerator));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_navigationDelegate);
  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_analyticsHandler);
}

@end
