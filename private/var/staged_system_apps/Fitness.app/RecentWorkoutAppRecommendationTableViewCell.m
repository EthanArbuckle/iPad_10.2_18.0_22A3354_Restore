@implementation RecentWorkoutAppRecommendationTableViewCell

- (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell *)sub_100261C54(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell_workoutAppRecommendationCollectionViewController) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/RecentWorkoutAppRecommendationTableViewCell.swift", 60, 2, 51, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell_workoutAppRecommendationCollectionViewController));
}

@end
