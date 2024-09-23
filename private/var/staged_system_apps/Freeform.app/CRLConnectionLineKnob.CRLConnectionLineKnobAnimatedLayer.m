@implementation CRLConnectionLineKnob.CRLConnectionLineKnobAnimatedLayer

- (_TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer *)sub_100A19118(v5);
}

- (_TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100A1B53C();
}

- (_TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer)init
{
  _TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer *result;

  result = (_TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLConnectionLineKnobAnimatedLayer", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer_containerLayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer_resizeKnobLayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer_connectionKnobCurrentImage));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer_connectionKnobLayer));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC8Freeform21CRLConnectionLineKnobP33_96EC3ACD086E6EEC09C8AECDD8231E3A34CRLConnectionLineKnobAnimatedLayer_owningKnob);
}

@end
