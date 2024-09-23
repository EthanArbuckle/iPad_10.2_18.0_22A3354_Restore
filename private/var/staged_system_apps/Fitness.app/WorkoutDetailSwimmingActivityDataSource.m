@implementation WorkoutDetailSwimmingActivityDataSource

- (WorkoutDetailSwimmingActivityDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  return (WorkoutDetailSwimmingActivityDataSource *)sub_10021FF54(v9, a4, a5, a6);
}

- (WorkoutDetailSwimmingActivityDataSource)init
{
  WorkoutDetailSwimmingActivityDataSource *result;

  result = (WorkoutDetailSwimmingActivityDataSource *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailSwimmingActivityDataSource", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___WorkoutDetailSwimmingActivityDataSource_supportedPaceDistances));
  v3 = (char *)self + OBJC_IVAR___WorkoutDetailSwimmingActivityDataSource__paceDistance;
  v4 = sub_100047110(&qword_10081EC78);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
