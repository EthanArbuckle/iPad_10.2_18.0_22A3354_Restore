@implementation CRLSceneCaptureSnapshotLayer

- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform28CRLSceneCaptureSnapshotLayer *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_layerToDraw, 0);
  v5 = a3;

  result = (_TtC8Freeform28CRLSceneCaptureSnapshotLayer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLSceneCaptureSnapshotLayer.swift", 43, 2, 19, 0);
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  char *v5;
  void *Strong;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSceneCaptureSnapshotLayer();
  v4 = a3;
  v5 = (char *)v7.receiver;
  -[CRLSceneCaptureSnapshotLayer drawInContext:](&v7, "drawInContext:", v4);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v5[OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_layerToDraw]);
  objc_msgSend(Strong, "renderInContext:", v4, v7.receiver, v7.super_class);

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_10085A270(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_10085A2B8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_10085A270(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_10085A2B8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setBounds_);
}

- (CGPoint)position
{
  double v2;
  double v3;
  CGPoint result;

  sub_10085A270(self, (uint64_t)a2, (SEL *)&selRef_position);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  sub_10085A374(self, a3.x, a3.y, (uint64_t)a2, (const char **)&selRef_setPosition_);
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  sub_10085A270(self, (uint64_t)a2, (SEL *)&selRef_anchorPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  sub_10085A374(self, a3.x, a3.y, (uint64_t)a2, (const char **)&selRef_setAnchorPoint_);
}

- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)init
{
  _TtC8Freeform28CRLSceneCaptureSnapshotLayer *result;

  result = (_TtC8Freeform28CRLSceneCaptureSnapshotLayer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSceneCaptureSnapshotLayer", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)initWithLayer:(id)a3
{
  _TtC8Freeform28CRLSceneCaptureSnapshotLayer *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtC8Freeform28CRLSceneCaptureSnapshotLayer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSceneCaptureSnapshotLayer", 37, "init(layer:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_layerToDraw);
}

@end
