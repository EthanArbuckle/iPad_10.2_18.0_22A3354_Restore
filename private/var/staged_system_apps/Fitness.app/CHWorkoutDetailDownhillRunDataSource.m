@implementation CHWorkoutDetailDownhillRunDataSource

- (CHWorkoutDetailDownhillRunDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  return (CHWorkoutDetailDownhillRunDataSource *)sub_1001E0CF8(a3, a4, a5);
}

- (CHWorkoutDetailDownhillRunDataSource)init
{
  CHWorkoutDetailDownhillRunDataSource *result;

  result = (CHWorkoutDetailDownhillRunDataSource *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailDownhillRunDataSource", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailDownhillRunDataSource__metrics;
  v4 = sub_100047110((uint64_t *)&unk_100826820);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailDownhillRunDataSource_columns));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailDownhillRunDataSource_defaultColumns));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailDownhillRunDataSource_columnSizes));
}

@end
