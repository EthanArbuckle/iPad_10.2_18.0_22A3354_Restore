@implementation WorkoutDetailSectionHeader

- (void)configureWithTitle:(id)a3 buttonAction:(id)a4
{
  void *v6;
  uint64_t v7;
  CHWorkoutDetailHeartRateTableViewCell *v8;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  uint64_t v10;
  _TtC10FitnessApp26WorkoutDetailSectionHeader *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (v6)
  {
    v10 = swift_allocObject(&unk_1007A5730, 24, 7);
    *(_QWORD *)(v10 + 16) = v6;
    v6 = sub_1004FCDF4;
  }
  else
  {
    v10 = 0;
  }
  v11 = self;
  sub_10003482C(v7, v9, 0, 0, (uint64_t)v6, v10, 0.0);
  sub_100022BA4((uint64_t)v6, v10);

  swift_bridgeObjectRelease(v9, v12, v13, v14, v15, v16, v17, v18);
}

- (_TtC10FitnessApp26WorkoutDetailSectionHeader)initWithReuseIdentifier:(id)a3
{
  CHWorkoutDetailHeartRateTableViewCell *v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  NSString v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC10FitnessApp26WorkoutDetailSectionHeader *v14;
  objc_super v16;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v6 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for WorkoutDetailSectionHeader();
  v14 = -[ActivityTileSectionHeader initWithReuseIdentifier:](&v16, "initWithReuseIdentifier:", v6);

  return v14;
}

- (_TtC10FitnessApp26WorkoutDetailSectionHeader)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailSectionHeader();
  return -[ActivityTileSectionHeader initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
