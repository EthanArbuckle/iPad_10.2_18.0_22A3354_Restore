@implementation CHWorkoutsListTableViewCell

- (CHWorkoutsListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (CHWorkoutsListTableViewCell *)sub_1001104D0(a3, (uint64_t)a4, v6);
}

- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  CHWorkoutsListTableViewCell *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  sub_100110A00(v10, v11, v12, a6, 1, 0, 0);

}

- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  CHWorkoutsListTableViewCell *v17;

  v12 = _Block_copy(a7);
  if (v12)
  {
    v13 = swift_allocObject(&unk_100786AA8, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_100106890;
  }
  else
  {
    v13 = 0;
  }
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  sub_100110A00(v14, v15, v16, a6, 1, (uint64_t)v12, v13);
  sub_100022BA4((uint64_t)v12, v13);

}

+ (double)preferredHeightForWorkout:(id)a3 formattingManager:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (CHWorkoutsListTableViewCell)initWithCoder:(id)a3
{
  CHWorkoutsListTableViewCell *result;

  result = (CHWorkoutsListTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutsListTableViewCell.swift", 42, 2, 91, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutsListTableViewCell();
  v2 = v3.receiver;
  -[CHWorkoutsListTableViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_100111E58();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutsListTableViewCell_workoutContentView));
}

@end
