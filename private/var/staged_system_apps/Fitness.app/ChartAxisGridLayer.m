@implementation ChartAxisGridLayer

- (_TtC10FitnessApp18ChartAxisGridLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC10FitnessApp18ChartAxisGridLayer *)sub_1001AF198(v5);
}

- (_TtC10FitnessApp18ChartAxisGridLayer)initWithCoder:(id)a3
{
  sub_1001AF2B8(a3);
  return 0;
}

- (void)layoutSublayers
{
  _TtC10FitnessApp18ChartAxisGridLayer *v2;

  v2 = self;
  sub_1001AF4BC();

}

- (_TtC10FitnessApp18ChartAxisGridLayer)init
{
  _TtC10FitnessApp18ChartAxisGridLayer *result;

  result = (_TtC10FitnessApp18ChartAxisGridLayer *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ChartAxisGridLayer", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18ChartAxisGridLayer_overlayStrokeColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp18ChartAxisGridLayer_lineDashPattern));
}

@end
