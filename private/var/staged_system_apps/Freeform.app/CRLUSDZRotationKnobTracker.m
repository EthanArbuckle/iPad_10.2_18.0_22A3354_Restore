@implementation CRLUSDZRotationKnobTracker

- (BOOL)allowHUDToDisplay
{
  return 0;
}

- (void)beginMovingKnob
{
  _TtC8Freeform26CRLUSDZRotationKnobTracker *v2;

  v2 = self;
  sub_1004F57C4();

}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 1;
}

- (void)commitChangesForReps:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC8Freeform26CRLUSDZRotationKnobTracker *v8;

  v5 = sub_1004F6160();
  v6 = sub_1004F619C();
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  v8 = self;
  sub_1004F5A34();

  swift_bridgeObjectRelease(v7);
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform26CRLUSDZRotationKnobTracker *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1004F5B8C(x, y);

}

- (void)endMovingKnob
{
  _TtC8Freeform26CRLUSDZRotationKnobTracker *v2;

  v2 = self;
  sub_1004F5ED8();

}

- (_TtC8Freeform26CRLUSDZRotationKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v5;
  id v6;
  _TtC8Freeform26CRLUSDZRotationKnobTracker *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC8Freeform26CRLUSDZRotationKnobTracker *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLUSDZRotationKnobTracker", 35, "init(rep:knob:)", 15, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform26CRLUSDZRotationKnobTracker)init
{
  _TtC8Freeform26CRLUSDZRotationKnobTracker *result;

  result = (_TtC8Freeform26CRLUSDZRotationKnobTracker *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLUSDZRotationKnobTracker", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.super.isa
                                                        + OBJC_IVAR____TtC8Freeform26CRLUSDZRotationKnobTracker_delegate));
}

@end
