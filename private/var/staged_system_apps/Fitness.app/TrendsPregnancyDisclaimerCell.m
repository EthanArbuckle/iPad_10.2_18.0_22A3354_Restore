@implementation TrendsPregnancyDisclaimerCell

- (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell *)sub_1004A605C(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC10FitnessApp29TrendsPregnancyDisclaimerCell *result;

  v5 = OBJC_IVAR____TtC10FitnessApp29TrendsPregnancyDisclaimerCell_textView;
  sub_10001E724(0, &qword_1008261E0, UILabel_ptr);
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1004C2368();

  result = (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/TrendsPregnancyDisclaimerCell.swift", 46, 2, 48, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29TrendsPregnancyDisclaimerCell_textView));
}

@end
