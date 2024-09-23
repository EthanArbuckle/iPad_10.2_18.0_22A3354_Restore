@implementation ActivitySharingFriendDetailCompetitionGraphTableViewCell

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell *)sub_10030C500(a3, (uint64_t)a4, v6);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell_graphView), "preferredHeight", a3.width, a3.height);
  v7 = v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell)initWithCoder:(id)a3
{
  void *v5;
  id v6;
  objc_class *v7;
  uint64_t v8;
  objc_class *v9;
  _TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell *result;

  v5 = (void *)objc_opt_self(ASCompetitionGraphView);
  v6 = a3;
  v7 = (objc_class *)objc_msgSend(v5, "companionGraph");
  if (!v7)
    __break(1u);
  v8 = OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell_graphView;
  v9 = v7;
  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = v9;

  result = (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySharingFriendDetailCompetitionGraphTableViewCell.swift", 73, 2, 45, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell_graphView));
}

@end
