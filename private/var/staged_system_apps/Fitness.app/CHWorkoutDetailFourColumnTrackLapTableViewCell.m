@implementation CHWorkoutDetailFourColumnTrackLapTableViewCell

- (void)configureHeaderWithWorkout:(id)a3 activityMoveMode:(int64_t)a4 formattingManager:(id)a5
{
  id v8;
  id v9;
  CHWorkoutDetailFourColumnTrackLapTableViewCell *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_1004ECD6C((uint64_t)v8, a4, v9);

}

- (void)configureWithTrackLap:(id)a3 lapIndex:(int64_t)a4 workout:(id)a5 distanceUnit:(unint64_t)a6 activityType:(id)a7 activityMoveMode:(int64_t)a8 isLastCell:(BOOL)a9 formattingManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CHWorkoutDetailFourColumnTrackLapTableViewCell *v20;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a10;
  v20 = self;
  sub_1004ED678(a3, (uint64_t)v17, a6, (uint64_t)v18, a8, a9, v19);

}

- (CHWorkoutDetailFourColumnTrackLapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  CHWorkoutDetailFourColumnTrackLapTableViewCell *v16;
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
  v18.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnTrackLapTableViewCell();
  v16 = -[CHWorkoutDetailFourColumnTableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, v8);

  return v16;
}

- (CHWorkoutDetailFourColumnTrackLapTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnTrackLapTableViewCell();
  return -[CHWorkoutDetailFourColumnTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
