@implementation CHWorkoutDetailSegmentDataSource

- (CHWorkoutDetailSegmentDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  CHWorkoutDetailSegmentDataSource *v12;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (CHWorkoutDetailSegmentDataSource *)sub_100290428(v9, v10, a5, v11);

  return v12;
}

- (CHWorkoutDetailSegmentDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHWorkoutDetailSegmentDataSource *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (CHWorkoutDetailSegmentDataSource *)sub_100290834(v7, v8, v9);

  return v10;
}

- (CHWorkoutDetailSegmentDataSource)init
{
  CHWorkoutDetailSegmentDataSource *result;

  result = (CHWorkoutDetailSegmentDataSource *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailSegmentDataSource", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailSegmentDataSource__metrics;
  v4 = sub_100047110((uint64_t *)&unk_100826820);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHWorkoutDetailSegmentDataSource__columns;
  v6 = sub_100047110(&qword_10082B700);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailSegmentDataSource_defaultColumns));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailSegmentDataSource_columnSizes));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDetailSegmentDataSource_delegate));
}

@end
