@implementation CHWorkoutDetailFourColumnDownhillRunTableViewCell

- (void)configureHeaderWithFormattingManager:(id)a3
{
  id v4;
  CHWorkoutDetailFourColumnDownhillRunTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001B774C(v4);

}

- (void)configureWithDownhillRunsStats:(id)a3 activityType:(id)a4 formattingManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHWorkoutDetailFourColumnDownhillRunTableViewCell *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1001B7D50((int)v8, (uint64_t)v9, v10);

}

- (void)configureWithDownhillRun:(id)a3 downhillRunIndex:(int64_t)a4 activityType:(id)a5 isLastCell:(BOOL)a6 formattingManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  CHWorkoutDetailFourColumnDownhillRunTableViewCell *v16;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = self;
  sub_1001B8090(a3, a4, (uint64_t)v14, a6, v15);

}

- (CHWorkoutDetailFourColumnDownhillRunTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  CHWorkoutDetailFourColumnDownhillRunTableViewCell *v9;
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
  v11.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnDownhillRunTableViewCell();
  v9 = -[CHWorkoutDetailFourColumnTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (CHWorkoutDetailFourColumnDownhillRunTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnDownhillRunTableViewCell();
  return -[CHWorkoutDetailFourColumnTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
