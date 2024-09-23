@implementation CMDiagramShapeVennMapper

- (CGRect)circumscribedBounds
{
  unint64_t mChildCount;
  double v3;
  CGFloat v7;
  CGFloat v8;

  mChildCount = self->super.mChildCount;
  v3 = ODIRegularPolygonBoundsMapper(mChildCount, 1.0, -90.0);
  if (mChildCount < 5)
  {
    v7 = -1.20000005;
    v8 = -1.20000005;
  }
  else
  {
    v7 = -0.300000012;
    v8 = -0.180000007;
  }
  return CGRectInset(*(CGRect *)&v3, v7, v8);
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  OADOrientedBounds *v16;
  CMDiagramPointEllipseMapper *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v20 = a3;
  v19 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  CGRectGetWidth(v22);
  -[CMDiagramShapeVennMapper circumscribedBounds](self, "circumscribedBounds");
  CGRectGetWidth(v23);
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  CGRectGetWidth(v24);
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  CGRectGetHeight(v25);
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v9 = v8;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v7);
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  if (self->super.mChildCount)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v21, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeVennMapper nodeBoundsWithIndex:](self, "nodeBoundsWithIndex:", v10);
      +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
      v16 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v12, v13, v14, v15);
      v17 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointEllipseMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v11, self->super.super.mDrawingContext, v16, self);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circ%d"), ++v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramPointMapper setPresentationName:](v17, "setPresentationName:", v18);

      -[CMDiagramPointEllipseMapper mapAt:withState:](v17, "mapAt:withState:", v20, v19);
    }
    while (self->super.mChildCount > v10);
  }

}

- (CGSize)textSizeForShapeSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds", a3.width, a3.height);
  v4 = v3 * 0.4;
  v6 = v5 * 0.4;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGRect)nodeBoundsWithIndex:(unsigned int)a3
{
  unint64_t mChildCount;
  double v4;
  float v5;
  float v6;
  __float2 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  mChildCount = self->super.mChildCount;
  v4 = dbl_22A4D56F0[mChildCount > 4];
  if (mChildCount <= 4)
    v5 = 1.0;
  else
    v5 = 0.25;
  v6 = (double)(2 * a3) * 3.14159265 / (double)mChildCount + -1.57079633;
  v7 = __sincosf_stret(v6);
  v8 = TSURectWithCenterAndSize((float)(v5 * v7.__cosval), (float)(v5 * v7.__sinval), v4);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end
