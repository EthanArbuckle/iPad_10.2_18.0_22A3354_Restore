@implementation CMDiagramPyramidMapper

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
  -[CMDiagramPyramidMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v10, v6);
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

  -[CMDiagramPyramidMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7 * 0.9;

  v9 = v8;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3
{
  unint64_t mChildCount;
  unint64_t v4;

  mChildCount = self->super.mChildCount;
  if (*((_BYTE *)&self->super.mDefaultScale + 4))
    v4 = mChildCount - a3;
  else
    v4 = a3 + 1;
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.super.super.mOrientedBounds, 0.5 - (float)(1.0 / (float)mChildCount) * (double)v4 * 0.5, (double)a3 * (float)(1.0 / (float)mChildCount));
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
  CMDiagramPointPyramidLayerMapper *v13;
  double Height;
  double v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a3;
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
      -[CMDiagramPyramidMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointPyramidLayerMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v11, self->super.super.mDrawingContext, v12, self);
      -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
      Height = CGRectGetHeight(v17);
      -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
      v15 = Height / CGRectGetWidth(v18);
      if (*((_BYTE *)&self->super.mDefaultScale + 4))
        v15 = -v15;
      -[CMDiagramPointPyramidLayerMapper setPyramidAspectRatio:](v13, "setPyramidAspectRatio:", v15);
      -[CMDiagramPointPyramidLayerMapper mapAt:withState:](v13, "mapAt:withState:", v16, v6);

    }
  }

}

- (void)setIsFlipped:(BOOL)a3
{
  *((_BYTE *)&self->super.mDefaultScale + 4) = a3;
}

@end
