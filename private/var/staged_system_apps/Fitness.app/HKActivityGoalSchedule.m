@implementation HKActivityGoalSchedule

+ (id)scheduleFrom:(id)a3 goalType:(int64_t)a4
{
  uint64_t v6;
  CHWorkoutDetailHeartRateTableViewCell *v7;
  char *v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = type metadata accessor for GoalDay();
  v7 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  v8 = sub_100467C4C((uint64_t)v7, a4);
  swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  return v8;
}

- (id)goalQuantityForToday
{
  HKActivityGoalSchedule *v2;
  id v3;

  v2 = self;
  v3 = sub_1004679E8();

  return v3;
}

@end
