@implementation CHWorkoutDetailBurnBarTableViewCell

- (CHWorkoutDetailBurnBarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  CHWorkoutDetailBurnBarTableViewCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView) = 0;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WorkoutDetailBurnBarTableViewCell();
  v9 = -[CHWorkoutDetailBurnBarTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (void)configureWithFitnessAppContext:(id)a3 workout:(id)a4 scoreSummaryWrapper:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHWorkoutDetailBurnBarTableViewCell *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1001985C0((uint64_t)v8, v9, (uint64_t)v10);

}

- (CHWorkoutDetailBurnBarTableViewCell)initWithCoder:(id)a3
{
  id v4;
  CHWorkoutDetailBurnBarTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView) = 0;
  v4 = a3;

  result = (CHWorkoutDetailBurnBarTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailBurnBarTableViewCell.swift", 50, 2, 50, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView));
}

@end
