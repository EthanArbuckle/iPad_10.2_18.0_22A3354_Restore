@implementation WOEffortUtilities

+ (void)saveWithQuantity:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _s9WorkoutUI15EffortUtilitiesC4save8quantity7workout0G8Activity11healthStore10completionySo10HKQuantityCSg_So9HKWorkoutCSo0mH0CSgSo08HKHealthJ0CySb_s5Error_pSgtcSgtFZ_0(a3, v11, a5, v13, (void (*)(uint64_t, _QWORD))nullsub_1, 0);

}

+ (id)fetchDemoExertionForWorkout:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = _s9WorkoutUI15EffortUtilitiesC17fetchDemoExertion03forA0So10HKQuantityCSgSo9HKWorkoutC_tFZ_0(v3);

  return v4;
}

+ (void)fetchExertionForWorkout:(id)a3 activity:(id)a4 healthStore:(id)a5 completion:(id)a6
{
  sub_24A6E4D48((int)a1, (int)a2, a3, a4, a5, a6, (void (*)(id, void *, id, uint64_t, void *))sub_24A6E744C);
}

+ (void)fetchExertionCollectionForWorkout:(id)a3 activity:(id)a4 healthStore:(id)a5 completion:(id)a6
{
  sub_24A6E4D48((int)a1, (int)a2, a3, a4, a5, a6, (void (*)(id, void *, id, uint64_t, void *))sub_24A6E826C);
}

- (WOEffortUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffortUtilities();
  return -[WOEffortUtilities init](&v3, sel_init);
}

+ (id)analyticsTaskIdentifierWithWorkout:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  _s9WorkoutUI15EffortUtilitiesC23analyticsTaskIdentifier7workoutSSSo9HKWorkoutC_tFZ_0(v3);

  v4 = (void *)sub_24A77B980();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)analyticsTaskIdentifierWithWorkoutActivity:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[2];

  v4 = sub_24A778854();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = objc_msgSend(v8, sel_UUID);
  sub_24A77883C();

  sub_24A778824();
  v12[0] = 0xD000000000000016;
  v12[1] = 0x800000024A78F3E0;
  sub_24A77BA4C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  v10 = (void *)sub_24A77B980();
  swift_bridgeObjectRelease();
  return v10;
}

+ (void)sendDidViewTrainingLoadAnalyticsFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_24A7786B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7786A4();
  _s9WorkoutUI15EffortUtilitiesC32sendDidViewTrainingLoadAnalytics4fromy10Foundation3URLV_tFZ_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (void)sendPostWorkoutAnalyticsWithWorkout:(id)a3 perceivedEffortQuantity:(id)a4 estimatedEffortQuantity:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  char IsIndoor;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[3];
  char v17;
  id v18;
  id v19;
  unint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, sel_workoutActivityType);
  IsIndoor = _HKWorkoutIsIndoor(v7);
  v12 = v8;
  v13 = v9;
  v16[0] = 0xD000000000000025;
  v16[1] = 0x800000024A78F400;
  v16[2] = v10;
  v17 = IsIndoor;
  v18 = a4;
  v19 = a5;
  v20 = sub_24A64C3D4(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRetain();
  v14 = v12;
  v15 = v13;
  swift_bridgeObjectRetain();
  sub_24A75402C((uint64_t)v16);

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
}

+ (void)sendPostWorkoutAnalyticsWithWorkoutActivity:(id)a3 perceivedEffortQuantity:(id)a4 estimatedEffortQuantity:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _s9WorkoutUI15EffortUtilitiesC08sendPostA9Analytics15workoutActivity09perceivedC8Quantity09estimatedcK0ySo09HKWorkoutI0C_So10HKQuantityCSgALtFZ_0(v7, a4, a5);

}

+ (void)sendUpdatedEffortAnalyticsEventWithWorkout:(id)a3 workoutActivity:(id)a4 perceivedEffortQuantity:(id)a5 estimatedEffortQuantity:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE v17[56];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  sub_24A754D9C(v13, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)v17);
  sub_24A7542A0((uint64_t)v17);
  sub_24A754F00((uint64_t)v17);

}

@end
