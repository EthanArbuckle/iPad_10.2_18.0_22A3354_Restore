@implementation CRLWPKnobPositioning_i

- (double)knobRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLWPKnobPositioning_i_knobRadius);
}

- (BOOL)shouldCreateKnobsForSelection:(id)a3 inStorage:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform22CRLWPKnobPositioning_i *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100A2C39C(v6);

  return v9 & 1;
}

- (_TtC8Freeform22CRLWPKnobPositioning_i)initWithLayout:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLWPKnobPositioning_i_knobRadius) = (Class)0x402E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLWPKnobPositioning_i_layout) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLWPKnobPositioning_i();
  v4 = a3;
  return -[CRLWPKnobPositioning_i init](&v6, "init");
}

- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform22CRLWPKnobPositioning_i *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100A2B81C(v6, v7);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)centerOfSelectionHeadPinIn:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC8Freeform22CRLWPKnobPositioning_i *v8;
  id v9;
  double v10;
  double v11;
  CGFloat v12[2];
  CGPoint result;

  v5 = type metadata accessor for CRLTextRange();
  v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = qword_1013DCB58;
  v8 = self;
  if (v7 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v9 = (id)qword_10147ECB0;
  swift_bridgeObjectRetain(v6);
  sub_100A2BD60((uint64_t)v8, v6, v12);

  swift_bridgeObjectRelease_n(v6, 2);
  v10 = v12[0];
  v11 = v12[1];
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)centerOfSelectionTailPinIn:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC8Freeform22CRLWPKnobPositioning_i *v8;
  id v9;
  double v10;
  double v11;
  CGFloat v12[2];
  CGPoint result;

  v5 = type metadata accessor for CRLTextRange();
  v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = qword_1013DCB58;
  v8 = self;
  if (v7 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v9 = (id)qword_10147ECB0;
  swift_bridgeObjectRetain(v6);
  sub_100A2C038((uint64_t)v8, v6, v12);

  swift_bridgeObjectRelease_n(v6, 2);
  v10 = v12[0];
  v11 = v12[1];
  result.y = v11;
  result.x = v10;
  return result;
}

- (_TtC8Freeform22CRLWPKnobPositioning_i)init
{
  _TtC8Freeform22CRLWPKnobPositioning_i *result;

  result = (_TtC8Freeform22CRLWPKnobPositioning_i *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPKnobPositioning_i", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
