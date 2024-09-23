@implementation DayViewStandChartTableViewCell

- (UILabel)idleHoursLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_idleHoursLabel));
}

- (UIButton)editGoalButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_editGoalButton));
}

- (_TtC10FitnessApp22ActivityStandChartView)chartView
{
  return (_TtC10FitnessApp22ActivityStandChartView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_chartView));
}

- (_TtC10FitnessApp30DayViewStandChartTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC10FitnessApp30DayViewStandChartTableViewCell *result;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  sub_10018B4DC(a3, (uint64_t)a4, v6);
  return result;
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  id v5;
  _TtC10FitnessApp30DayViewStandChartTableViewCell *v6;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_idleHoursLabel);
  v4 = (void *)objc_opt_self(UIFont);
  v6 = self;
  v5 = objc_msgSend(v4, "preferredFontForTextStyle:", UIFontTextStyleCaption1);
  objc_msgSend(v3, "setFont:", v5);

  -[DayViewStandChartTableViewCell setNeedsLayout](v6, "setNeedsLayout");
}

- (_TtC10FitnessApp30DayViewStandChartTableViewCell)initWithCoder:(id)a3
{
  sub_10018D710(a3);
  return 0;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DayViewStandChartTableViewCell();
  v2 = (char *)v5.receiver;
  -[DayViewStandChartTableViewCell layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_editGoalButton];
  v4 = objc_msgSend(v3, "layer", v5.receiver, v5.super_class);
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v6) * 0.5);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_labelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_idleHoursLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_editGoalButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_chartView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_chartData));
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_onEditGoal), *(_QWORD *)&self->isWheelchair[OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_onEditGoal]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_chartBuckets));
}

@end
