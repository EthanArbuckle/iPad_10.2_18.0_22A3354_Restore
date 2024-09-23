@implementation CRLCanvasBackgroundLayer

- (double)viewScale
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_viewScale);
}

- (void)setViewScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_viewScale) = a3;
  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled) == 1)
    -[CRLCanvasBackgroundLayer setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled) = a3;
  -[CRLCanvasBackgroundLayer setNeedsLayout](self, "setNeedsLayout");
}

- (CGAffineTransform)dynamicTransform
{
  char *v3;
  __int128 v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform;
  v4 = *(_OWORD *)((char *)&self->c + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self->a
                                    + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v3 + 2);
  return self;
}

- (void)setDynamicTransform:(CGAffineTransform *)a3
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform);
  v4 = *(_OWORD *)&a3->c;
  v5 = *(_OWORD *)&a3->tx;
  *v3 = *(_OWORD *)&a3->a;
  v3[1] = v4;
  v3[2] = v5;
  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled) == 1
    && (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_scalesWithCanvas) & 1) == 0)
  {
    -[CRLCanvasBackgroundLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)scalesWithCanvas
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_scalesWithCanvas);
}

- (void)setScalesWithCanvas:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_scalesWithCanvas) = a3;
  -[CRLCanvasBackgroundLayer setNeedsLayout](self, "setNeedsLayout");
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithCanvasBackgroundDelegate:(id)a3 viewScale:(double)a4
{
  _TtC8Freeform24CRLCanvasBackgroundLayer *v6;

  swift_unknownObjectRetain(a3);
  v6 = (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_1004E32C4((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  return v6;
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)init
{
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_1004E2CF8();
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_1004E2DE8(v5);
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_1004E3058(a3);
}

- (void)tearDown
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_canvasBackgroundDelegate, 0);
  -[CRLCanvasBackgroundLayer setDelegate:](self, "setDelegate:", 0);
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)layoutSublayers
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CRLCanvasBackgroundLayer();
  -[CRLCanvasBackgroundLayer layoutSublayers](&v2, "layoutSublayers");
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_canvasBackgroundDelegate);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return 0;
}

@end
