@implementation CRLShapeConnectionLineKnobTracker

- (BOOL)snapEnabled
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker))
    return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker), "snapEnabled");
  else
    return *((_BYTE *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker__snapEnabled);
}

- (void)setSnapEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v5;

  v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker);
  v5 = self;
  objc_msgSend(v4, "setSnapEnabled:", v3);
  *((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker__snapEnabled) = v3;

}

- (void)beginMovingKnob
{
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v2;

  v2 = self;
  sub_1007FC2B8();

}

- (void)insertDuplicationPreviewInfosWithSender:(id)a3
{
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v5;
  uint64_t v6;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1007FDEAC();

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)shouldHideOtherKnobs
{
  return 1;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 1;
}

- (void)endMovingKnob
{
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v2;

  v2 = self;
  sub_100801620();

}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_100802054(x, y);

}

- (void)crlaxAccessibilityRequestsDuplicateItemInsertFromKnobAt:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1008036D4(x, y);

}

- (void)crlaxAccessibilityRequestsConnectionTo:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[CRLShapeConnectionLineKnobTracker beginMovingKnob](v5, "beginMovingKnob");
  -[CRLShapeConnectionLineKnobTracker moveKnobToCanvasPosition:](v5, "moveKnobToCanvasPosition:", x, y);
  -[CRLShapeConnectionLineKnobTracker endMovingKnob](v5, "endMovingKnob");

}

- (_TtC8Freeform33CRLShapeConnectionLineKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v5;
  id v6;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)sub_100803EE8((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (_TtC8Freeform33CRLShapeConnectionLineKnobTracker)init
{
  return (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)sub_1008038B0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_duplicatedConnectionLine));
}

@end
