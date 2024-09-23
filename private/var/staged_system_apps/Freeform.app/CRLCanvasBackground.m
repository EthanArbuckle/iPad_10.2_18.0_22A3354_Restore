@implementation CRLCanvasBackground

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform19CRLCanvasBackground_icc);
}

- (void)setIcc:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform19CRLCanvasBackground_icc, a3);
}

- (_TtC8Freeform19CRLCanvasBackground)initWithICC:(id)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform19CRLCanvasBackground_icc, 0);
  swift_unknownObjectWeakAssign(v5, a3);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLCanvasBackground();
  return -[CRLCanvasBackground init](&v7, "init");
}

- (Class)layerClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLCanvasBackgroundLayer();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)viewClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLCanvasBackgroundView();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (CRLCanvasBackgroundAlignmentProvider)alignmentProvider
{
  return (CRLCanvasBackgroundAlignmentProvider *)0;
}

- (double)contentsScaleForCanvasBackgroundLayer:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC8Freeform19CRLCanvasBackground *v8;
  id v9;
  double v10;
  double v11;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform19CRLCanvasBackground_icc);
  if (!Strong)
    return 1.0;
  v6 = (void *)Strong;
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, "canvas");
  objc_msgSend(v9, "contentsScale");
  v11 = v10;

  return v11;
}

- (CGPoint)canvasCenterInCanvasBackgroundLayer:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)originOffsetForCanvasBackgroundLayer:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contentOffsetForCanvasBackgroundLayer:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (_TtC8Freeform19CRLCanvasBackground)init
{
  _TtC8Freeform19CRLCanvasBackground *result;

  result = (_TtC8Freeform19CRLCanvasBackground *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCanvasBackground", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLCanvasBackground_icc);
}

@end
