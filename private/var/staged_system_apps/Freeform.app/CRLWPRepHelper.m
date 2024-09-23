@implementation CRLWPRepHelper

+ (id)forCurrentPlatform:(id)a3
{
  objc_class *v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v4 = (objc_class *)type metadata accessor for CRLWPRepHelper();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretLineSnapAmount] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretHeightMult] = 0x3FF8000000000000;
  v6 = swift_unknownObjectWeakInit(&v5[OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_wpRep]);
  swift_unknownObjectWeakAssign(v6, a3);
  v8.receiver = v5;
  v8.super_class = v4;
  return objc_msgSendSuper2(&v8, "init");
}

- (double)floatingCaretLineSnapAmount
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretLineSnapAmount);
}

- (void)setFloatingCaretLineSnapAmount:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretLineSnapAmount) = a3;
}

- (double)floatingCaretHeightMult
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretHeightMult);
}

- (void)setFloatingCaretHeightMult:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretHeightMult) = a3;
}

- (id)colorForGhostCaret
{
  return objc_msgSend(objc_allocWithZone((Class)CRLColor), "initWithRed:green:blue:alpha:", 0.67, 0.67, 0.67, 1.0);
}

- (CGPoint)anchorPointForCaretLayer:(BOOL)a3 rotated:(BOOL)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = 0.5;
  v5 = 1.0;
  if (!a3)
    v5 = 0.5;
  if (!a4)
    v5 = 0.0;
  if (!a4 || !a3)
    v4 = 0.0;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGRect)boundsForCaretLayer:(CGRect)result
{
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 0.0;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)positionForCaretLayer:(CGRect)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = floor(a3.origin.x + a3.size.width * -0.5);
  v4 = floor(a3.origin.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)cornerRadiusForFloatingCaret:(id)a3
{
  return 0.0;
}

- (void)addLiftAnimationToFloatingCursor:(id)a3 floatingCaretLayer:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform14CRLWPRepHelper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10065AB00(v7);

}

- (_TtC8Freeform14CRLWPRepHelper)init
{
  _TtC8Freeform14CRLWPRepHelper *result;

  result = (_TtC8Freeform14CRLWPRepHelper *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPRepHelper", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_wpRep);
}

@end
