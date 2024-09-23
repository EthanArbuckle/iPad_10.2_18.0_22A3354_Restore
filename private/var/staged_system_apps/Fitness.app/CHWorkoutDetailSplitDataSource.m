@implementation CHWorkoutDetailSplitDataSource

- (CHWorkoutDetailSplitDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  return (CHWorkoutDetailSplitDataSource *)sub_1004A22C8(v9, a4, a5, a6);
}

- (CHWorkoutDetailSplitDataSource)init
{
  CHWorkoutDetailSplitDataSource *result;

  result = (CHWorkoutDetailSplitDataSource *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailSplitDataSource", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailSplitDataSource__metrics;
  v4 = sub_100047110(&qword_1008351A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHWorkoutDetailSplitDataSource__columns;
  v6 = sub_100047110(&qword_10082B700);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR___CHWorkoutDetailSplitDataSource_defaultColumns), v7, v8, v9, v10, v11, v12, v13);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR___CHWorkoutDetailSplitDataSource_columnSizes), v14, v15, v16, v17, v18, v19, v20);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDetailSplitDataSource_delegate));
}

@end
