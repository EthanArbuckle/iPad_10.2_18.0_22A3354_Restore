@implementation TrendPairTableViewCell

- (_TtC10FitnessApp19TrendListMetricView)leadingView
{
  return (_TtC10FitnessApp19TrendListMetricView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingView));
}

- (_TtC10FitnessApp19TrendListMetricView)trailingView
{
  return (_TtC10FitnessApp19TrendListMetricView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingView));
}

- (_TtC10FitnessApp22TrendPairTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp22TrendPairTableViewCell *)sub_1004F69DC(a3, (uint64_t)a4, v6);
}

- (void)selectionButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp22TrendPairTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1004F6EFC((uint64_t)v4);

}

- (void)prepareForReuse
{
  _TtC10FitnessApp22TrendPairTableViewCell *v2;

  v2 = self;
  sub_1004F7AF0();

}

- (_TtC10FitnessApp22TrendPairTableViewCell)initWithCoder:(id)a3
{
  sub_1004F7C04(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_paddingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_selectionStackView));
  swift_release(*(_QWORD *)&self->leadingView[OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_selectionFunction]);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingMetric, &qword_10082EDD0);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingMetric, &qword_10082EDD0);
}

@end
