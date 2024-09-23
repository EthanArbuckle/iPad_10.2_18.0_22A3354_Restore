@implementation CHWorkoutDetailSwimmingSplitDataSource

- (CHWorkoutDetailSwimmingSplitDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  return (CHWorkoutDetailSwimmingSplitDataSource *)sub_100470830(v9, a4, a5, a6);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailSwimmingSplitDataSource__metrics;
  v4 = sub_100047110(&qword_1008351A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.isa+ OBJC_IVAR___CHWorkoutDetailSwimmingSplitDataSource_averagePaces), v5, v6, v7, v8, v9, v10, v11);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.isa+ OBJC_IVAR___CHWorkoutDetailSwimmingSplitDataSource_columns), v12, v13, v14, v15, v16, v17, v18);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.isa+ OBJC_IVAR___CHWorkoutDetailSwimmingSplitDataSource_columnSizes), v19, v20, v21, v22, v23, v24, v25);
}

@end
