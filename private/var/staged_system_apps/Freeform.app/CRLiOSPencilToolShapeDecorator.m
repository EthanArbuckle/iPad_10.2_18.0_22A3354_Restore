@implementation CRLiOSPencilToolShapeDecorator

- (_TtC8Freeform30CRLiOSPencilToolShapeDecorator)init
{
  id v3;
  _TtC8Freeform30CRLiOSPencilToolShapeDecorator *v4;
  objc_class *v5;
  objc_super v7;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLiOSPencilToolShapeDecorator_isHoveredWithObjectEraser) = 0;
  v3 = objc_allocWithZone((Class)type metadata accessor for CRLiOSPencilHoverToolPreviewer());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, "init");
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8Freeform30CRLiOSPencilToolShapeDecorator_previewHelper) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CRLiOSPencilToolShapeDecorator();
  return -[CRLiOSPencilToolShapeDecorator init](&v7, "init");
}

- (void).cxx_destruct
{

}

- (NSArray)decoratorOverlayRenderables
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtC8Freeform30CRLiOSPencilToolShapeDecorator *v7;
  id v8;
  Class isa;
  id v10;
  uint64_t v11;
  Class v12;

  v3 = (void *)objc_opt_self(CRLCanvasRenderable);
  v4 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100EEF400;
  v6 = *(void **)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform30CRLiOSPencilToolShapeDecorator_previewHelper)
                + OBJC_IVAR____TtC8Freeform30CRLiOSPencilHoverToolPreviewer_shapeLayer);
  *(_QWORD *)(v5 + 32) = v6;
  specialized Array._endMutation()(v5);
  sub_1004B8930(0, (unint64_t *)&qword_1013E7790, CALayer_ptr);
  v7 = self;
  v8 = v6;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v10 = objc_msgSend(v3, "renderablesFromLayers:", isa, swift_bridgeObjectRelease().n128_f64[0]);

  v11 = sub_1004B8930(0, (unint64_t *)&qword_1013EE6D0, off_101229820);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  v12 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v12;
}

@end
