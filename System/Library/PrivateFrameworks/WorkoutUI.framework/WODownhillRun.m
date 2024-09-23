@implementation WODownhillRun

- (NSDate)startTime
{
  return (NSDate *)(id)sub_24A7787AC();
}

- (NSDate)endTime
{
  return (NSDate *)(id)sub_24A7787AC();
}

- (double)workoutTime
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___WODownhillRun_workoutTime);
  swift_beginAccess();
  return *v2;
}

- (void)setWorkoutTime:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___WODownhillRun_workoutTime);
  swift_beginAccess();
  *v4 = a3;
}

- (HKQuantity)averageSpeed
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_averageSpeed));
}

- (HKQuantity)maximumSpeed
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_maximumSpeed));
}

- (HKQuantity)alpineSlope
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_alpineSlope));
}

- (HKQuantity)elevationAscended
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_elevationAscended));
}

- (HKQuantity)elevationDescended
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_elevationDescended));
}

- (HKQuantity)distance
{
  return (HKQuantity *)sub_24A6CB460((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WODownhillRun_distance);
}

- (void)setDistance:(id)a3
{
  sub_24A6CB4FC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___WODownhillRun_distance);
}

- (HKQuantity)averageHeartRate
{
  return (HKQuantity *)sub_24A6CB460((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WODownhillRun_averageHeartRate);
}

- (void)setAverageHeartRate:(id)a3
{
  sub_24A6CB4FC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___WODownhillRun_averageHeartRate);
}

- (WODownhillRun)initWithDownhillRunEvent:(id)a3 workoutTime:(double)a4 distance:(id)a5 averageHeartRate:(id)a6
{
  id v9;
  id v10;
  id v11;
  WODownhillRun *v12;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (WODownhillRun *)sub_24A6CCCC0(v9, a5, a6, a4);

  return v12;
}

+ (id)makeDownhillRunWithDownhillRunEvent:(id)a3 workout:(id)a4 healthStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = _s9WorkoutUI11DownhillRunC04makecD008downhillD5Event7workout11healthStoreACSo09HKWorkoutG0C_So0K0CSo08HKHealthJ0CtFZ_0(v7, v8, v9);

  return v10;
}

+ (double)calculateWorkoutTimeWithDateInterval:(id)a3 pauseResumeEvents:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  uint64_t v11;

  v5 = sub_24A7783F8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7783C8();
  if (a4)
  {
    sub_24A64F254(0, &qword_2579472F8);
    a4 = (id)sub_24A77BB18();
  }
  v9 = _s9WorkoutUI11DownhillRunC09calculateA4Time12dateInterval17pauseResumeEventsSd10Foundation04DateH0V_SaySo14HKWorkoutEventCGSgtFZ_0((uint64_t)v8, a4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

+ (BOOL)supportsWithActivityType:(unint64_t)a3
{
  return a3 == 61 || a3 == 67;
}

- (WODownhillRun)init
{
  WODownhillRun *result;

  result = (WODownhillRun *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___WODownhillRun_startTime;
  v4 = sub_24A778818();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___WODownhillRun_endTime, v4);

}

- (NSString)description
{
  WODownhillRun *v2;
  void *v3;

  v2 = self;
  DownhillRun.description.getter();

  v3 = (void *)sub_24A77B980();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
