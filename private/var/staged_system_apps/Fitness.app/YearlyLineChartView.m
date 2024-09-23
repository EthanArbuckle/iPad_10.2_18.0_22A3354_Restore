@implementation YearlyLineChartView

- (_TtC10FitnessApp19YearlyLineChartView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp19YearlyLineChartView *)sub_100585E00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp19YearlyLineChartView)initWithCoder:(id)a3
{
  sub_10058637C(a3);
  return 0;
}

- (void)layoutSubviews
{
  _TtC10FitnessApp19YearlyLineChartView *v2;

  v2 = self;
  sub_1005868D0();

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_lineSeriesLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_maximumValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_averageValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_averageLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_gestureOverlay));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_monthStrings));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_monthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_monthFormatter));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_canonicalUnit));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_months));
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_histogram);
  swift_bridgeObjectRelease(*(_QWORD *)&self->axisLayer[OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_histogram]);
  swift_bridgeObjectRelease(v3);
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_fitHistogram);
  swift_bridgeObjectRelease(*(_QWORD *)&self->axisLayer[OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_fitHistogram]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_xPositions));
}

@end
