@implementation CHWorkoutDownhillRun

- (WODownhillRun)downhillRun
{
  return (WODownhillRun *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___CHWorkoutDownhillRun_downhillRun));
}

- (NSDate)startTime
{
  return (NSDate *)sub_100476C60(self, (uint64_t)a2, (void (*)(void))&DownhillRun.startTime.getter);
}

- (NSDate)endTime
{
  return (NSDate *)sub_100476C60(self, (uint64_t)a2, (void (*)(void))&DownhillRun.endTime.getter);
}

- (double)workoutTime
{
  CHWorkoutDownhillRun *v2;
  double v3;

  v2 = self;
  v3 = dispatch thunk of DownhillRun.workoutTime.getter();

  return v3;
}

- (HKQuantity)averageSpeed
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRun.averageSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)maximumSpeed
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRun.maximumSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)alpineSlope
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRun.alpineSlope.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationAscended
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRun.elevationAscended.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationDescended
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRun.elevationDescended.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)distance
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)dispatch thunk of DownhillRun.distance.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)averageHeartRate
{
  CHWorkoutDownhillRun *v2;
  void *v3;

  v2 = self;
  v3 = (void *)dispatch thunk of DownhillRun.averageHeartRate.getter();

  return (HKQuantity *)v3;
}

- (CHWorkoutDownhillRun)initWithDownhillRun:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDownhillRun_downhillRun) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DownhillRunBridge();
  v4 = a3;
  return -[CHWorkoutDownhillRun init](&v6, "init");
}

- (NSString)description
{
  void *v2;
  CHWorkoutDownhillRun *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDownhillRun_downhillRun);
  v3 = self;
  v4 = objc_msgSend(v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

+ (BOOL)supportsActivityType:(unint64_t)a3
{
  type metadata accessor for DownhillRun(0, a2);
  return static DownhillRun.supports(activityType:)(a3) & 1;
}

- (CHWorkoutDownhillRun)init
{
  CHWorkoutDownhillRun *result;

  result = (CHWorkoutDownhillRun *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.DownhillRunBridge", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
