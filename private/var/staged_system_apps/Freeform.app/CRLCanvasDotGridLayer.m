@implementation CRLCanvasDotGridLayer

+ (double)kCRLUnscaledSpacingBetweenDotCenters
{
  return 25.0;
}

- (void)layoutSublayers
{
  _TtC8Freeform21CRLCanvasDotGridLayer *v2;

  v2 = self;
  sub_100C62F04();

}

- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithCanvasBackgroundDelegate:(id)a3 viewScale:(double)a4
{
  _TtC8Freeform21CRLCanvasDotGridLayer *v6;

  swift_unknownObjectRetain(a3);
  v6 = (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100C63C98((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  return v6;
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)init
{
  return (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100C63664();
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100C63754(v5);
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100C638B8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_outerReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_innerReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_imageTileLayer));

}

@end
