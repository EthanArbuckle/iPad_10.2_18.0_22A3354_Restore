@implementation CHWorkoutDetailIntervalDataSource

- (CHWorkoutDetailIntervalDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  CHWorkoutDetailIntervalDataSource *v12;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___CHWorkoutDetailIntervalDataSource____lazy_storage___configuration) = (Class)1;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (CHWorkoutDetailIntervalDataSource *)sub_100290428(v9, v10, a5, v11);

  return v12;
}

- (CHWorkoutDetailIntervalDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHWorkoutDetailIntervalDataSource *v10;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___CHWorkoutDetailIntervalDataSource____lazy_storage___configuration) = (Class)1;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (CHWorkoutDetailIntervalDataSource *)sub_100290834(v7, v8, v9);

  return v10;
}

- (void).cxx_destruct
{
  sub_10017C76C(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR___CHWorkoutDetailIntervalDataSource____lazy_storage___configuration));
}

@end
