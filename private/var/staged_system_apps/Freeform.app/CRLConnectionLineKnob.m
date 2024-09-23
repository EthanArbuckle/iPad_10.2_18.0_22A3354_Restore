@implementation CRLConnectionLineKnob

+ (double)unscaledConnectionKnobOffsetWithEdgeKnob
{
  return 25.0;
}

+ (double)unscaledConnectionKnobOffsetWithoutEdgeKnob
{
  return 19.0;
}

- (_TtC8Freeform21CRLConnectionLineKnob)initWithTag:(unint64_t)a3 onRep:(id)a4
{
  return (_TtC8Freeform21CRLConnectionLineKnob *)sub_100A179A0(a3, a4);
}

- (void)dealloc
{
  _TtC8Freeform21CRLConnectionLineKnob *v2;

  v2 = self;
  sub_100A17CEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLConnectionLineKnob_animatedLayer));
}

- (void)updateRenderableImage
{
  _TtC8Freeform21CRLConnectionLineKnob *v2;

  v2 = self;
  sub_100A17F5C();

}

- (id)createKnobRenderable
{
  void *v3;
  _TtC8Freeform21CRLConnectionLineKnob *v4;
  id v5;
  id v6;
  void *v7;

  v3 = (void *)objc_opt_self(CRLCanvasRenderable);
  v4 = self;
  v5 = objc_msgSend(v3, "renderable");
  v6 = -[CRLCanvasButtonKnob knobImage](v4, "knobImage");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "size");

  }
  objc_msgSend(v5, "setBounds:", sub_10005FDDC());

  return v5;
}

- (void)didCreateKnobRenderable
{
  _TtC8Freeform21CRLConnectionLineKnob *v2;

  v2 = self;
  sub_100A180E4();

}

- (void)cursorEnteredKnobAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8Freeform21CRLConnectionLineKnob *v9;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  sub_100A181D0((uint64_t)a4, x, y);

}

- (void)cursorExitedKnobAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8Freeform21CRLConnectionLineKnob *v9;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  sub_100A18338((uint64_t)a4, x, y);

}

- (_TtC8Freeform21CRLConnectionLineKnob)initWithImage:(id)a3 highlightedImage:(id)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v9;
  id v10;
  id v11;
  _TtC8Freeform21CRLConnectionLineKnob *result;

  v9 = a3;
  v10 = a4;
  v11 = a7;
  result = (_TtC8Freeform21CRLConnectionLineKnob *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLConnectionLineKnob", 30, "init(image:highlightedImage:radius:tag:on:)", 43, 0);
  __break(1u);
  return result;
}

@end
