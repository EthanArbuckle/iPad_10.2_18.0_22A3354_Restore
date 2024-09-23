@implementation TSDAudioLayout

- (TSDAudioLayout)initWithInfo:(id)a3
{
  TSDAudioLayout *v3;
  TSDAudioLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDAudioLayout;
  v3 = -[TSDMediaLayout initWithInfo:](&v6, sel_initWithInfo_, a3);
  v4 = v3;
  if (v3)
  {
    if (!-[TSDAudioLayout movieInfo](v3, "movieInfo"))
    {

      v4 = 0;
    }
    -[TSDLayout invalidateFrame](v4, "invalidateFrame");
  }
  return v4;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)resizeMayChangeAspectRatio
{
  return 0;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (id)layoutGeometryFromInfo
{
  TSDMutableLayoutGeometry *v2;

  v2 = -[TSDLayoutGeometry initWithInfoGeometry:]([TSDMutableLayoutGeometry alloc], "initWithInfoGeometry:", -[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"));
  -[TSDMutableLayoutGeometry setSize:](v2, "setSize:", 130.0, 66.0);
  return (id)-[TSDMutableLayoutGeometry copy](v2, "copy");
}

- (BOOL)shouldDisplayGuides
{
  return 0;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  _BOOL4 v3;
  TSDLayoutGeometry *v5;
  TSDAbstractLayout *v6;
  CGAffineTransform v7;
  CGAffineTransform t2;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  v3 = a3;
  memset(&v10, 0, sizeof(v10));
  v5 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v5)
  {
    -[TSDLayoutGeometry fullTransform](v5, "fullTransform");
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    if (!v3)
      goto LABEL_10;
  }
  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    v6 = -[TSDAbstractLayout parent](self, "parent");
    if (v6)
      -[TSDAbstractLayout transformInRoot](v6, "transformInRoot");
    else
      memset(&t2, 0, sizeof(t2));
    v7 = v10;
    CGAffineTransformConcat(&v9, &v7, &t2);
    v10 = v9;
  }
LABEL_10:
  v9 = v10;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  return CGRectApplyAffineTransform(v11, &v9);
}

- (CGRect)alignmentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](self, "geometry"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)allowsConnections
{
  return 0;
}

- (BOOL)canFlip
{
  return 0;
}

- (int)wrapType
{
  return 5;
}

- (id)movieInfo
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return (id)TSUDynamicCast();
}

@end
