@implementation HKWorkout

- (void)makeDownhillRunBridgesWithHealthStore:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  HKWorkout *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1007942B0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject(&unk_1007942D8, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_1002AE468;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a3;
  v10 = self;
  swift_retain(v7);
  HKWorkout.makeDownhillRuns(healthStore:completion:)(v9, sub_1002AE494, v8);

  swift_release(v7);
  swift_release(v8);
}

- (NSArray)downhillRunEventsBridge
{
  HKWorkout *v2;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  NSArray v7;

  v2 = self;
  v3 = -[HKWorkout downhillRunEvents](v2, "downhillRunEvents");
  if (v3)
  {
    v4 = v3;
    v5 = sub_1000DCD38();
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7.super.isa = 0;
  }
  return (NSArray *)v7.super.isa;
}

+ (id)kIntervalWorkoutStepMetadataKey
{
  return sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DA90, (uint64_t)&qword_10086A540, &qword_10086A548, (uint64_t)sub_10032BE20);
}

+ (id)kIntervalWorkoutStepSuccessful
{
  return sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DA98, (uint64_t)&qword_10086A550, &qword_10086A558, (uint64_t)sub_10032BE58);
}

+ (id)kRaceWorkoutAveragePaceOnRouteMetadataKey
{
  return sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DAA0, (uint64_t)&qword_10086A560, (uint64_t *)algn_10086A568, (uint64_t)sub_10032BE90);
}

+ (id)kRaceWorkoutReferenceWorkoutUUIDMetadataKey
{
  return sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DAA8, (uint64_t)&qword_10086A570, (uint64_t *)algn_10086A578, (uint64_t)sub_10032BED0);
}

+ (id)kTrackTrackIdentifierMetadataKey
{
  return String._bridgeToObjectiveC()();
}

+ (id)kIntervalWorkoutStepDistanceGoalAchievedDateKey
{
  return sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DAB0, (uint64_t)&qword_10086A580, &qword_10086A588, (uint64_t)sub_10032BF3C);
}

+ (id)kIntervalWorkoutStepDistanceGoalAchievedDurationKey
{
  return sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DAB8, (uint64_t)&qword_10086A590, &qword_10086A598, (uint64_t)sub_10032BF74);
}

- (BOOL)hasChartableMetrics
{
  HKWorkout *v2;
  id v3;
  void *v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  uint64_t v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = self;
  v3 = -[HKWorkout fiui_activityType](v2, "fiui_activityType");
  if (v3)
  {
    v4 = v3;
    v5 = (CHWorkoutDetailHeartRateTableViewCell *)sub_10053962C();

    v6 = *(_QWORD *)v5->cellPadding;
    swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
    LOBYTE(v3) = v6 != 0;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (double)elapsedTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  HKWorkout *v10;
  id v11;
  id v12;
  double v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v16 - v8;
  v10 = self;
  v11 = -[HKWorkout endDate](v10, "endDate");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v12 = -[HKWorkout startDate](v10, "startDate");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v13 = Date.timeIntervalSince(_:)(v7);
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  v14(v9, v3);

  return v13;
}

- (BOOL)shouldUseCircularGradientImage
{
  HKWorkout *v2;
  char v3;

  v2 = self;
  v3 = sub_10032C670();

  return v3 & 1;
}

- (BOOL)isIntervalWorkout
{
  HKWorkout *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10032C9E0();

  return v3;
}

- (BOOL)isRaceWorkout
{
  HKWorkout *v2;
  char v3;

  v2 = self;
  v3 = sub_10032D578((unsigned int *)&enum case for ConfigurationType.race(_:));

  return v3 & 1;
}

- (BOOL)shouldShowRaceResults
{
  HKWorkout *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10032CED0();

  return v3;
}

- (double)raceTime
{
  HKWorkout *v2;
  double v3;

  v2 = self;
  v3 = sub_10032D0B8();

  return v3;
}

- (BOOL)didWinRace
{
  HKWorkout *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10032D3B0();

  return v3;
}

- (BOOL)isPacerWorkout
{
  HKWorkout *v2;
  char v3;

  v2 = self;
  v3 = sub_10032D578((unsigned int *)&enum case for ConfigurationType.pacer(_:));

  return v3 & 1;
}

- (BOOL)isMultiSportWorkout
{
  return (id)-[HKWorkout workoutActivityType](self, "workoutActivityType") == (id)82;
}

- (double)raceWorkoutReferencePace
{
  HKWorkout *v2;
  double v3;

  v2 = self;
  v3 = sub_10032D9EC((double (*)(void))&RaceWorkoutConfiguration.referenceRouteAveragePace.getter);

  return v3;
}

- (double)raceWorkoutDisplayDistance
{
  HKWorkout *v2;
  double v3;

  v2 = self;
  v3 = sub_10032D9EC((double (*)(void))&RaceWorkoutConfiguration.lastWorkoutDistance.getter);

  return v3;
}

- (BOOL)supportsTrackWorkout
{
  HKWorkout *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10032DB34();

  return v3 & 1;
}

- (BOOL)isTrackWorkout
{
  HKWorkout *v2;
  NSNumber *v3;
  BOOL v4;

  v2 = self;
  if (-[HKWorkout supportsTrackWorkout](v2, "supportsTrackWorkout"))
  {
    v3 = -[HKWorkout trackId](v2, "trackId");

    if (!v3)
      return 0;
    v4 = 1;
    v2 = (HKWorkout *)v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSNumber)trackId
{
  HKWorkout *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10032DCA8();

  return (NSNumber *)v3;
}

- (id)serializedConfigurationDataIncludingRoute:(BOOL)a3
{
  HKWorkout *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  Class isa;

  v4 = self;
  v5 = sub_10032DDD0(a3);
  v7 = v6;

  if (v7 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000DC774(v5, v7);
  }
  return isa;
}

- (BOOL)serializedConfigurationContainsRoute
{
  HKWorkout *v2;
  char v3;

  v2 = self;
  v3 = sub_10032DFE4();

  return v3 & 1;
}

- (NSData)serializedConfigurationRouteSnapshotData
{
  HKWorkout *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = sub_10032E1C8();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000DC774((uint64_t)v3, v5);
  }
  return (NSData *)isa;
}

- (id)serializedConfigurationWithEmbedding:(id)a3 snapshot:(id)a4
{
  id v4;
  id v7;
  HKWorkout *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  HKWorkout *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  Class isa;

  v4 = a4;
  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = v4;
    v4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v11 = 0xF000000000000000;
  }
  v14 = sub_10032E330(a3, (uint64_t)v4, v11);
  v16 = v15;
  sub_1000DC774((uint64_t)v4, v11);

  if (v16 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000DC774(v14, v16);
  }
  return isa;
}

- (id)displayDetail:(id)a3
{
  id v4;
  HKWorkout *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  CHWorkoutDetailHeartRateTableViewCell *v7;
  NSString v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = self;
  sub_10032E838(v4);
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)expectedIntervalDistanceForStepKeyPath:(id)a3
{
  uint64_t v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  HKWorkout *v7;
  NSString v8;
  id v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = String._bridgeToObjectiveC()();
  v9 = -[HKWorkout requiredDistanceForIntervalTimeGoalForStepKeyPath:](v7, "requiredDistanceForIntervalTimeGoalForStepKeyPath:", v8);

  if (!v9)
    v9 = sub_10032F598(v4, (uint64_t)v6, (void *)1);

  swift_bridgeObjectRelease(v6, v10, v11, v12, v13, v14, v15, v16);
  return v9;
}

- (id)expectedIntervalDurationForStepKeyPath:(id)a3
{
  uint64_t v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  HKWorkout *v7;
  id v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_10032F598(v4, (uint64_t)v6, (void *)2);

  swift_bridgeObjectRelease(v6, v9, v10, v11, v12, v13, v14, v15);
  return v8;
}

- (id)requiredDistanceForIntervalTimeGoalForStepKeyPath:(id)a3
{
  uint64_t v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  HKWorkout *v7;
  id v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_10032F928(v4, (uint64_t)v6);

  swift_bridgeObjectRelease(v6, v9, v10, v11, v12, v13, v14, v15);
  return v8;
}

@end
