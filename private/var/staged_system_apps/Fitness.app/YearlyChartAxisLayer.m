@implementation YearlyChartAxisLayer

- (_TtC10FitnessApp20YearlyChartAxisLayer)init
{
  return (_TtC10FitnessApp20YearlyChartAxisLayer *)sub_10013A284();
}

- (_TtC10FitnessApp20YearlyChartAxisLayer)initWithCoder:(id)a3
{
  sub_10013A4E4(a3);
  return 0;
}

- (_TtC10FitnessApp20YearlyChartAxisLayer)initWithLayer:(id)a3
{
  _TtC10FitnessApp20YearlyChartAxisLayer *v5;
  _QWORD v7[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v7, a3);
  swift_unknownObjectRelease(a3);
  v5 = -[YearlyChartAxisLayer init](self, "init");
  _s10FitnessApp24HistoryViewActionContextVwxx_0(v7);
  return v5;
}

- (void)layoutSublayers
{
  _TtC10FitnessApp20YearlyChartAxisLayer *v2;

  v2 = self;
  sub_10013AB28();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20YearlyChartAxisLayer_strokeLightColor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20YearlyChartAxisLayer_strokeDarkColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp20YearlyChartAxisLayer_lineDashPattern));

}

@end
