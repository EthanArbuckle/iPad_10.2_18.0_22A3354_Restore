@implementation CHWorkoutDetailSwimmingSetDataSource

- (CHWorkoutDetailSwimmingSetDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9;
  id v10;
  CHWorkoutDetailSwimmingSetDataSource *result;

  v9 = a3;
  v10 = a4;
  sub_1001C1CBC(v9, a4, a5, a6);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource__swimmingSets;
  v4 = sub_100047110(&qword_1008255B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_columns));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_columnSizes));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_distanceColor));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_paceColor));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_restColor));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_timeColor));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailSwimmingSetDataSource_swolfColor));
}

@end
