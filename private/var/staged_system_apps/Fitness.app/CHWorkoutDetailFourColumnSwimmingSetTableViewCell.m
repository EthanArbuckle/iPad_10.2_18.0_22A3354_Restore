@implementation CHWorkoutDetailFourColumnSwimmingSetTableViewCell

+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  uint64_t v13;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (IndexPath.row.getter(v10))
    v11 = 83.0;
  else
    v11 = 32.0;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (void)configureHeader
{
  CHWorkoutDetailFourColumnSwimmingSetTableViewCell *v2;

  v2 = self;
  sub_1001BC1E0();

}

- (void)configureWithSwimmingSet:(id)a3 index:(int64_t)a4 isLastCell:(BOOL)a5 formattingManager:(id)a6
{
  id v11;
  id v12;
  CHWorkoutDetailFourColumnSwimmingSetTableViewCell *v13;

  v11 = a3;
  v12 = a6;
  v13 = self;
  sub_1001BC628(a3, a4, a5, (uint64_t)v12);

}

- (CHWorkoutDetailFourColumnSwimmingSetTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  CHWorkoutDetailFourColumnSwimmingSetTableViewCell *v9;
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
  v11.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSwimmingSetTableViewCell();
  v9 = -[CHWorkoutDetailFourColumnTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (CHWorkoutDetailFourColumnSwimmingSetTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSwimmingSetTableViewCell();
  return -[CHWorkoutDetailFourColumnTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
