@implementation CHWorkoutDetailAnalyticsEventBuilder

- (CHWorkoutDetailAnalyticsEventBuilder)initWithWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  CHWorkoutDetailAnalyticsEventBuilder *v7;

  v5 = a3;
  v6 = a4;
  v7 = (CHWorkoutDetailAnalyticsEventBuilder *)sub_100377630((uint64_t)v5, a4);

  return v7;
}

- (NSString)analyticsEventName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSDictionary)analyticsPayload
{
  CHWorkoutDetailAnalyticsEventBuilder *v2;
  CHWorkoutDetailHeartRateTableViewCell *v3;
  NSDictionary v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = self;
  v3 = (CHWorkoutDetailHeartRateTableViewCell *)sub_100376F64();

  if (v3)
  {
    sub_100139CE8();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSDictionary *)v4.super.isa;
}

- (CHWorkoutDetailAnalyticsEventBuilder)init
{
  CHWorkoutDetailAnalyticsEventBuilder *result;

  result = (CHWorkoutDetailAnalyticsEventBuilder *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailAnalyticsEventBuilder", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDetailAnalyticsEventBuilder_events));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailAnalyticsEventBuilder_presentedDetails));
}

- (void)didExpandDetailSection:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CHWorkoutDetailAnalyticsEventBuilder *v7;
  CHWorkoutDetailHeartRateTableViewCell *v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE v16[24];
  uint64_t v17[2];

  v4 = sub_10037339C(a3);
  v6 = v5;
  swift_beginAccess((char *)self + OBJC_IVAR___CHWorkoutDetailAnalyticsEventBuilder_presentedDetails, v16, 33, 0);
  v7 = self;
  sub_100142388(v17, v4, v6);
  v8 = (CHWorkoutDetailHeartRateTableViewCell *)v17[1];
  swift_endAccess(v16);

  swift_bridgeObjectRelease(v8, v9, v10, v11, v12, v13, v14, v15);
}

- (void)didPresentRouteView
{
  sub_1003775A8((char *)self, (uint64_t)a2, 0x6569566574756F72, 0xE900000000000077);
}

- (void)didPresentMediaMomentItem
{
  sub_1003775A8((char *)self, (uint64_t)a2, 0x6D6F4D616964656DLL, 0xEF6D657449746E65);
}

- (void)didPresentHeartRateNoDataInfo
{
  sub_1003775A8((char *)self, (uint64_t)a2, 0x7461527472616568, 0xEF617461446F4E65);
}

@end
