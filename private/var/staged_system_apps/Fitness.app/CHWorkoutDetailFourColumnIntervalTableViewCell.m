@implementation CHWorkoutDetailFourColumnIntervalTableViewCell

- (void)configureHeaderWithWorkout:(id)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 formattingManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHWorkoutDetailFourColumnIntervalTableViewCell *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_1003CBB74((uint64_t)v10, (uint64_t)v11, a5, v12);

}

- (void)configureWithInterval:(id)a3 index:(int64_t)a4 workout:(id)a5 activityType:(id)a6 activityMoveMode:(int64_t)a7 isLastCell:(BOOL)a8 formattingManager:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  CHWorkoutDetailFourColumnIntervalTableViewCell *v20;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = self;
  sub_1003CC328(a3, a4, v17, v18, (void *)a7, a8, v19);

}

- (CHWorkoutDetailFourColumnIntervalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
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
  CHWorkoutDetailFourColumnIntervalTableViewCell *v16;
  objc_super v18;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v8 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnIntervalTableViewCell();
  v16 = -[CHWorkoutDetailFourColumnTableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, v8);

  return v16;
}

- (CHWorkoutDetailFourColumnIntervalTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnIntervalTableViewCell();
  return -[CHWorkoutDetailFourColumnTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
