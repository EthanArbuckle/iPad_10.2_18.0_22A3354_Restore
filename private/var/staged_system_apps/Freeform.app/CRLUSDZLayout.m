@implementation CRLUSDZLayout

- (CGRect)boundsInRoot
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1006CFA1C(self, (uint64_t)a2, (double (*)(void))sub_1006CF650);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)alignmentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1006CFA1C(self, (uint64_t)a2, (double (*)(void))sub_1006CF830);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform13CRLUSDZLayout *v5;
  CRLCanvasLayoutGeometry *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CRLCanvasLayoutGeometry *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  v5 = self;
  v6 = -[CRLCanvasLayout pureGeometryInRoot](v5, "pureGeometryInRoot");
  if (v6)
  {
    v11 = v6;
    -[CRLCanvasLayoutGeometry frame](v6, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v7 = v13;
    v8 = v15;
    v9 = v17;
    v10 = v19;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)boundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1006CFA1C(self, (uint64_t)a2, (double (*)(void))sub_1006CFA78);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)computeLayoutGeometry
{
  id v2;
  id result;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLUSDZLayout();
  v2 = v7.receiver;
  result = -[CRLCanvasLayout computeLayoutGeometry](&v7, "computeLayoutGeometry");
  if (result)
  {
    v4 = result;
    v5 = sub_1006D0A58();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v4, "frame", v7.receiver, v7.super_class);
      objc_msgSend(v6, "setNaturalBounds:");

      v2 = v6;
    }

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3
{
  id v5;
  _TtC8Freeform13CRLUSDZLayout *v6;
  char *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1006CFC84(a3);

  return v7;
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  __int128 v4;

  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  return self;
}

- (id)computeWrapPath
{
  _TtC8Freeform13CRLUSDZLayout *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1006CFF9C();
  v4 = v3;

  return v4;
}

- (CRLBezierPath)pathForClippingConnectionLines
{
  _TtC8Freeform13CRLUSDZLayout *v2;
  CRLBezierPath *result;
  CRLBezierPath *v4;

  v2 = self;
  result = (CRLBezierPath *)-[CRLUSDZLayout computeWrapPath](v2, "computeWrapPath");
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (_TtC8Freeform13CRLUSDZLayout)initWithInfo:(id)a3
{
  swift_unknownObjectRetain(a3);
  return (_TtC8Freeform13CRLUSDZLayout *)sub_1006D08C4((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform13CRLUSDZLayout_cachedWrapPath));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform13CRLUSDZLayout_cachedHitTestManager));
}

@end
