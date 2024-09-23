@implementation CMDiagramChevronMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v9 = v8;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v7);
  -[CMDiagramChevronMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v10, v6);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CMDiagramChevronMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7 * 0.7;

  v9 = v8;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t mChildCount;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  CGRect v25;
  CGRect v26;

  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  mChildCount = self->super.mChildCount;
  v10 = CGRectGetWidth(v25) / (double)mChildCount;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v11 = v10 / CGRectGetHeight(v26);
  v12 = (float)(1.0 / (float)mChildCount);
  v13 = v12 / 10.0;
  v14 = sqrt(v11 * v12 * 0.5);
  if (v11 <= 2.0)
    v15 = v14;
  else
    v15 = 1.0;
  v16 = v12 * 0.5 + (double)a3 * v12 - v12 * 0.5;
  v17 = v13 / 3.0;
  v18 = v13 / 3.0 + v12;
  if (a3)
    v19 = v13 / 3.0;
  else
    v19 = 0.0;
  v20 = v16 - v19;
  if (a3)
    v17 = 0.0;
  v21 = v18 - v17;
  v22 = mChildCount - 1 <= a3 || *((_BYTE *)&self->super.mDefaultScale + 4) == 0;
  v23 = v21 + v13 * 1.1;
  if (!v22)
    v21 = v23;
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.super.super.mOrientedBounds, v20, (1.0 - v15) * 0.5, v21);
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  CMDiagramPointChevronMapper *v13;
  CMDiagramPointChevronMapper *v14;
  BOOL v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v8, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramChevronMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointChevronMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v11, self->super.super.mDrawingContext, v12, self);
      v14 = v13;
      if (i)
        v15 = 1;
      else
        v15 = *((_BYTE *)&self->super.mDefaultScale + 4) == 0;
      v16 = !v15;
      -[CMDiagramPointChevronMapper setIsHomePlate:](v13, "setIsHomePlate:", v16);
      -[CMDiagramPointChevronMapper mapAt:withState:](v14, "mapAt:withState:", v17, v6);

    }
  }

}

- (void)setIsHChevron:(BOOL)a3
{
  *((_BYTE *)&self->super.mDefaultScale + 4) = a3;
}

@end
