@implementation BarSeriesLayer

- (_TtC10FitnessApp14BarSeriesLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC10FitnessApp14BarSeriesLayer *)sub_1003D8CE4(v5);
}

- (void)layoutSublayers
{
  _TtC10FitnessApp14BarSeriesLayer *v2;

  v2 = self;
  sub_1003D9604();

}

- (_TtC10FitnessApp14BarSeriesLayer)initWithCoder:(id)a3
{
  sub_1003D97B0(a3);
  return 0;
}

- (_TtC10FitnessApp14BarSeriesLayer)init
{
  _TtC10FitnessApp14BarSeriesLayer *result;

  result = (_TtC10FitnessApp14BarSeriesLayer *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.BarSeriesLayer", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp14BarSeriesLayer_histogram);
  swift_bridgeObjectRelease(*(_QWORD *)&self->histogram[OBJC_IVAR____TtC10FitnessApp14BarSeriesLayer_histogram]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp14BarSeriesLayer_colors));

}

@end
