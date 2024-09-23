@implementation DayViewTitleAndValueLabelPair

- (CGSize)intrinsicContentSize
{
  _TtC10FitnessApp29DayViewTitleAndValueLabelPair *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_100013FBC();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp29DayViewTitleAndValueLabelPair *)sub_100039040(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateFonts
{
  _TtC10FitnessApp29DayViewTitleAndValueLabelPair *v2;

  v2 = self;
  sub_1001C3AFC();

}

- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)initWithCoder:(id)a3
{
  sub_1001C3BB0(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueLabelTextColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabelTextColor[OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueAttributedText));
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabelTextColor[OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueLabelText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleBaselineConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueBaselineConstraint));
}

@end
