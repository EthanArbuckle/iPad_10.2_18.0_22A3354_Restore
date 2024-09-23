@implementation CHWorkoutDetailFourColumnSegmentTableViewCell

- (void)configureHeaderWithWorkout:(id)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 formattingManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHWorkoutDetailFourColumnSegmentTableViewCell *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_100253BC4((uint64_t)v10, (uint64_t)v11, a5, v12);

}

- (void)configureWithSegment:(id)a3 segmentIndex:(int64_t)a4 workout:(id)a5 trackDistanceUnit:(unint64_t)a6 activityType:(id)a7 activityMoveMode:(int64_t)a8 isLastCell:(BOOL)a9 formattingManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CHWorkoutDetailFourColumnSegmentTableViewCell *v20;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a10;
  v20 = self;
  sub_10025438C(a3, a4, (uint64_t)v17, a6, (uint64_t)v18, a8, a9, v19);

}

- (CHWorkoutDetailFourColumnSegmentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  CHWorkoutDetailFourColumnSegmentTableViewCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSegmentTableViewCell();
  v9 = -[CHWorkoutDetailFourColumnTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (CHWorkoutDetailFourColumnSegmentTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSegmentTableViewCell();
  return -[CHWorkoutDetailFourColumnTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
