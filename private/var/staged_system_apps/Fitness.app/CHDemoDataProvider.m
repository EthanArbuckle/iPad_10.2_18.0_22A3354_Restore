@implementation CHDemoDataProvider

- (NSArray)workouts
{
  CHWorkoutDetailHeartRateTableViewCell *v2;
  NSArray v3;
  SEL v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts);
  if (v2)
  {
    sub_10027D46C();
    swift_bridgeObjectRetain(v2);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (CHDemoDataProvider)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  CHDemoDataProvider *v7;
  __n128 v8;
  uint64_t v9;
  objc_class *v10;
  objc_super v12;

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  static Date.now.getter(v8);
  v9 = static DemoUtilities.fetchWorkouts(startingDate:)(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts) = (Class)v9;

  v10 = (objc_class *)type metadata accessor for DemoDataProvider();
  v12.receiver = v7;
  v12.super_class = v10;
  return -[CHDemoDataProvider init](&v12, "init");
}

- (BOOL)hasDemoWorkouts
{
  uint64_t v2;
  uint64_t v4;
  CHDemoDataProvider *v5;
  uint64_t v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts);
  if (v2)
  {
    if ((unint64_t)v2 >> 62)
    {
      if (v2 >= 0)
        v4 = v2 & 0xFFFFFFFFFFFFFF8;
      else
        v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts);
      v5 = self;
      swift_bridgeObjectRetain(v2);
      v6 = _CocoaArrayWrapper.endIndex.getter(v4);

      swift_bridgeObjectRelease(v2);
      if (v6)
        return 1;
    }
    else if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      return 1;
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts));
}

@end
