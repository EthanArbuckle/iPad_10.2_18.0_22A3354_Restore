@implementation LineSeriesLayer

- (_TtC10FitnessApp15LineSeriesLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC10FitnessApp15LineSeriesLayer *)sub_1005288D8(v5);
}

- (_TtC10FitnessApp15LineSeriesLayer)initWithCoder:(id)a3
{
  sub_100528A60(a3);
  return 0;
}

- (void)layoutSublayers
{
  _TtC10FitnessApp15LineSeriesLayer *v2;

  v2 = self;
  sub_100528D38();

}

- (_TtC10FitnessApp15LineSeriesLayer)init
{
  _TtC10FitnessApp15LineSeriesLayer *result;

  result = (_TtC10FitnessApp15LineSeriesLayer *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.LineSeriesLayer", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_histogram);
  swift_bridgeObjectRelease(*(_QWORD *)&self->histogram[OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_histogram]);
  swift_bridgeObjectRelease(v3);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_emptyGradientLayerPath));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_filledGradientLayerPath));

}

@end
