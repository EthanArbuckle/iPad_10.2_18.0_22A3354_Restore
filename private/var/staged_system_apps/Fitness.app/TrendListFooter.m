@implementation TrendListFooter

- (_TtC10FitnessApp15TrendListFooter)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp15TrendListFooter *)sub_100330678(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp15TrendListFooter)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC10FitnessApp15TrendListFooter *result;

  v4 = OBJC_IVAR____TtC10FitnessApp15TrendListFooter_textView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_10032FFB8();

  result = (_TtC10FitnessApp15TrendListFooter *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/TrendsListViewController.swift", 41, 2, 66, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp15TrendListFooter_textView));
}

@end
