@implementation TrendDetailVO2MaxChartView

- (_TtC10FitnessApp26TrendDetailVO2MaxChartView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp26TrendDetailVO2MaxChartView *result;

  sub_1002A6E28();
  return result;
}

- (void)setupFontsWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp26TrendDetailVO2MaxChartView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002A7F18();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC10FitnessApp26TrendDetailVO2MaxChartView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A8F30();
  return 0;
}

- (void)layoutSubviews
{
  _TtC10FitnessApp26TrendDetailVO2MaxChartView *v2;

  v2 = self;
  sub_1002A93E4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_labelRightLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_title365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_title90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_meter365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_meter90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill90));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_labels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_labelsByBucket));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill90CenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill365CenterYConstraint));
}

@end
