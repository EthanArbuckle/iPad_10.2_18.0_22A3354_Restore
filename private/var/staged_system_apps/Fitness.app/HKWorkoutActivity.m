@implementation HKWorkoutActivity

- (HKQuantityType)distanceType
{
  HKWorkoutActivity *v2;
  HKWorkoutConfiguration *v3;
  HKWorkoutActivityType v4;
  id v5;

  v2 = self;
  v3 = -[HKWorkoutActivity workoutConfiguration](v2, "workoutConfiguration");
  v4 = -[HKWorkoutConfiguration activityType](v3, "activityType");

  v5 = (id)_HKWorkoutDistanceTypeForActivityType(v4);
  return (HKQuantityType *)v5;
}

- (double)elapsedTime
{
  HKWorkoutActivity *v2;
  double v3;

  v2 = self;
  v3 = sub_1005AAB30();

  return v3;
}

- (BOOL)hasChartableMetrics
{
  HKWorkoutActivity *v2;
  FIUIWorkoutActivityType *v3;
  CHWorkoutDetailHeartRateTableViewCell *v4;
  uint64_t v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = self;
  v3 = -[HKWorkoutActivity fiui_activityType](v2, "fiui_activityType");
  v4 = (CHWorkoutDetailHeartRateTableViewCell *)sub_10053962C();

  v5 = *(_QWORD *)v4->cellPadding;
  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
  return v5 != 0;
}

- (FIUIWorkoutActivityType)fiui_activityType
{
  HKWorkoutActivity *v2;
  id v3;

  v2 = self;
  v3 = sub_1005AAD98();

  return (FIUIWorkoutActivityType *)v3;
}

- (double)fiui_averageCadence
{
  HKWorkoutActivity *v2;
  double v3;

  v2 = self;
  v3 = sub_1005AB46C(&_HKPrivateMetadataKeyWorkoutAverageCadence, (SEL *)&selRef__countPerMinuteUnit);

  return v3;
}

- (id)fiui_customSplits
{
  HKWorkoutActivity *v2;
  Class isa;
  uint64_t v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  CHWorkoutDetailHeartRateTableViewCell *v15;
  CHWorkoutDetailHeartRateTableViewCell *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  Class v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v2 = self;
  isa = -[HKWorkoutActivity workoutEvents](v2, "workoutEvents");
  if (!isa)
  {
    v4 = sub_10001E724(0, (unint64_t *)&qword_10081ED88, HKWorkoutEvent_ptr);
    v5 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(0, v4);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (id)FICustomSplits(isa);

  v14 = sub_10001E724(0, (unint64_t *)&qword_10081ED88, HKWorkoutEvent_ptr);
  v15 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);

  v16 = sub_1005AB9EC((uint64_t)v15);
  swift_bridgeObjectRelease(v15, v17, v18, v19, v20, v21, v22, v23);
  sub_10001E724(0, &qword_100835968, FIUIWorkoutSplit_ptr);
  v24 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16, v25, v26, v27, v28, v29, v30, v31);
  return v24;
}

- (id)fiui_elevationGain
{
  HKWorkoutActivity *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1005AB088();

  return v3;
}

- (id)fiui_splitsForUserPreferredDistanceUnit:(id)a3
{
  id v4;
  HKWorkoutActivity *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  Class isa;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = self;
  v6 = sub_1005AB2E8(v4);

  sub_10001E724(0, &qword_100835968, FIUIWorkoutSplit_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
  return isa;
}

- (double)fiui_totalStepCount
{
  HKWorkoutActivity *v2;
  double v3;

  v2 = self;
  v3 = sub_1005AB46C(&_HKPrivateMetadataKeyWorkoutStepCount, (SEL *)&selRef_countUnit);

  return v3;
}

@end
