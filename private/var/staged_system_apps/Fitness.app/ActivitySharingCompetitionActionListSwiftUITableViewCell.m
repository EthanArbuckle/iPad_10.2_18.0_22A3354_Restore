@implementation ActivitySharingCompetitionActionListSwiftUITableViewCell

- (_TtC10FitnessApp56ActivitySharingCompetitionActionListSwiftUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  _TtC10FitnessApp56ActivitySharingCompetitionActionListSwiftUITableViewCell *v16;
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
  v18.super_class = (Class)type metadata accessor for ActivitySharingCompetitionActionListSwiftUITableViewCell();
  v16 = -[ActivitySharingCompetitionActionListSwiftUITableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, v8);

  return v16;
}

- (_TtC10FitnessApp56ActivitySharingCompetitionActionListSwiftUITableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySharingCompetitionActionListSwiftUITableViewCell();
  return -[ActivitySharingCompetitionActionListSwiftUITableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
