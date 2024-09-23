@implementation TrophyCaseAwardDetailWorkoutCell

- (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell *)sub_10048D668(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell *result;

  v5 = OBJC_IVAR____TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell_workoutContentView;
  v6 = objc_allocWithZone((Class)type metadata accessor for WorkoutsListContentView());
  v7 = a3;
  v8 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)v8;

  result = (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/TrophyCaseAwardDetailWorkoutCell.swift", 49, 2, 27, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell_workoutContentView));
}

@end
