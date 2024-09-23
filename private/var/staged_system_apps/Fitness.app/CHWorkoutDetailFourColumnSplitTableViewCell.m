@implementation CHWorkoutDetailFourColumnSplitTableViewCell

- (void)configureHeaderWithActivityType:(id)a3
{
  id v4;
  CHWorkoutDetailFourColumnSplitTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100342454(v4);

}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 unit:(id)a5 split:(id)a6 splitIndex:(int64_t)a7 splitDistance:(double)a8 isLastCell:(BOOL)a9 dataCalculator:(id)a10 formattingManager:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CHWorkoutDetailFourColumnSplitTableViewCell *v23;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a10;
  v22 = a11;
  v23 = self;
  sub_100343A0C(v17, a4, v20, a7, a9, v21, v22);

}

- (CHWorkoutDetailFourColumnSplitTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  CHWorkoutDetailFourColumnSplitTableViewCell *v16;
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
  v18.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSplitTableViewCell();
  v16 = -[CHWorkoutDetailFourColumnTableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, v8);

  return v16;
}

- (CHWorkoutDetailFourColumnSplitTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSplitTableViewCell();
  return -[CHWorkoutDetailFourColumnTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void)configureWithSwimmingSplit:(id)a3 splitIndex:(int64_t)a4 isLastCell:(BOOL)a5 formattingManager:(id)a6
{
  id v10;
  id v11;
  CHWorkoutDetailFourColumnSplitTableViewCell *v12;

  v10 = a3;
  v11 = a6;
  v12 = self;
  sub_1003433CC(v10, (char *)a4, a5, v11);

}

@end
