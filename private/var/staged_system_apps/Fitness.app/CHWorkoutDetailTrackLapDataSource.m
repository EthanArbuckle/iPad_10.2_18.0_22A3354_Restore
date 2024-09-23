@implementation CHWorkoutDetailTrackLapDataSource

- (unint64_t)distanceUnit
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit);
}

- (void)setDistanceUnit:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit) = (Class)a3;
}

- (CHWorkoutDetailTrackLapDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  CHWorkoutDetailTrackLapDataSource *v12;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit) = (Class)1;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (CHWorkoutDetailTrackLapDataSource *)sub_100290428(v9, v10, a5, v11);

  return v12;
}

- (CHWorkoutDetailTrackLapDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHWorkoutDetailTrackLapDataSource *v10;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit) = (Class)1;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (CHWorkoutDetailTrackLapDataSource *)sub_100290834(v7, v8, v9);

  return v10;
}

@end
