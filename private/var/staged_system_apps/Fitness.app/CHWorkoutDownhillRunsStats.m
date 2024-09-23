@implementation CHWorkoutDownhillRunsStats

- (HKQuantity)maximumSpeed
{
  CHWorkoutDownhillRunsStats *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRunsStats.maximumSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationAscended
{
  CHWorkoutDownhillRunsStats *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRunsStats.elevationAscended.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationDescended
{
  CHWorkoutDownhillRunsStats *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRunsStats.elevationDescended.getter();

  return (HKQuantity *)v3;
}

- (int64_t)runsCount
{
  CHWorkoutDownhillRunsStats *v2;
  int64_t v3;

  v2 = self;
  v3 = DownhillRunsStats.runsCount.getter();

  return v3;
}

- (HKQuantity)averageHeartRate
{
  CHWorkoutDownhillRunsStats *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRunsStats.averageHeartRate.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)averageSpeed
{
  CHWorkoutDownhillRunsStats *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRunsStats.averageSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)distance
{
  CHWorkoutDownhillRunsStats *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DownhillRunsStats.distance.getter();

  return (HKQuantity *)v3;
}

- (double)duration
{
  CHWorkoutDownhillRunsStats *v2;
  double v3;

  v2 = self;
  v3 = DownhillRunsStats.duration.getter();

  return v3;
}

- (CHWorkoutDownhillRunsStats)initWithDownhillRuns:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  CHWorkoutDownhillRunsStats *v7;
  __n128 v8;
  objc_super v10;

  v5 = type metadata accessor for DownhillRun(0, a2);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v6 = type metadata accessor for DownhillRunsStats(0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___CHWorkoutDownhillRunsStats_downhillRunsStats) = (Class)DownhillRunsStats.init(downhillRuns:)(v8);

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for DownhillRunsStatsBridge();
  return -[CHWorkoutDownhillRunsStats init](&v10, "init");
}

- (CHWorkoutDownhillRunsStats)initWithDownhillRunBridges:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for DownhillRunBridge();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (CHWorkoutDownhillRunsStats *)sub_1002620D0(v5);
}

- (CHWorkoutDownhillRunsStats)init
{
  CHWorkoutDownhillRunsStats *result;

  result = (CHWorkoutDownhillRunsStats *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.DownhillRunsStatsBridge", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDownhillRunsStats_downhillRunsStats));
}

@end
