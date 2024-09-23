@implementation CMDiagramSegmentedPyramidMapper

- (unint64_t)pointCount
{
  if (self->super.mChildCount >= 9)
    return 9;
  else
    return self->super.mChildCount;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  OADOrientedBounds *v11;
  OADOrientedBounds *mOrientedBounds;
  void *v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  if (v9 > v10)
  {
    v7 = v7 + (v9 - v10) * 0.5;
LABEL_5:
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v7, v8, v10);
    v11 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
    mOrientedBounds = self->super.super.super.mOrientedBounds;
    self->super.super.super.mOrientedBounds = v11;

    goto LABEL_6;
  }
  if (v9 < v10)
  {
    v8 = v8 + (v10 - v9) * 0.5;
    v10 = v9;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v15 = v14;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v13, "translateXBy:yBy:", v15);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v13);
  -[CMDiagramSegmentedPyramidMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v16, v6);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CMDiagramPointSegmentedPyramidLayerMapper *v16;
  BOOL v17;
  void *v18;
  void *v19;
  CMDiagramPointSegmentedPyramidLayerMapper *v20;
  void *v21;
  CMDiagramPointSegmentedPyramidLayerMapper *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CMDiagramSegmentedPyramidMapper pointCount](self, "pointCount");
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramSegmentedPyramidMapper _suggestedBoundsForPyramidLayerWithIndex:inLayer:andSlice:](self, "_suggestedBoundsForPyramidLayerWithIndex:inLayer:andSlice:", v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v12 & 1) != 0)
        objc_msgSend(v14, "setFlipY:", 1);
      v16 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointSegmentedPyramidLayerMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v13, self->super.super.mDrawingContext, v15, self);
      -[CMDiagramPointSegmentedPyramidLayerMapper mapAt:withState:](v16, "mapAt:withState:", v23, v6);
      v17 = v12 + 1 > (unint64_t)(2 * v11);
      if (v12 + 1 <= (unint64_t)(2 * v11))
        ++v12;
      else
        v12 = 0;
      if (v17)
        ++v11;

      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  if (v12 - 1 < (unint64_t)(2 * v11))
  {
    do
    {
      -[CMDiagramSegmentedPyramidMapper _suggestedBoundsForPyramidLayerWithIndex:inLayer:andSlice:](self, "_suggestedBoundsForPyramidLayerWithIndex:inLayer:andSlice:", v9, v11, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((v12 & 1) != 0)
        objc_msgSend(v18, "setFlipY:", 1);
      v20 = [CMDiagramPointSegmentedPyramidLayerMapper alloc];
      objc_msgSend(v8, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:](v20, "initWithPoint:drawingContext:orientedBounds:parent:", v21, self->super.super.mDrawingContext, v19, self);

      -[CMDiagramPointSegmentedPyramidLayerMapper setIsPlaceholder:](v22, "setIsPlaceholder:", 1);
      -[CMDiagramPointSegmentedPyramidLayerMapper mapAt:withState:](v22, "mapAt:withState:", v23, v6);

      ++v12;
      ++v9;
    }
    while (((2 * v11) | 1) != v12);
  }

}

- (unint64_t)layerCount
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -[CMDiagramSegmentedPyramidMapper pointCount](self, "pointCount");
  if (!v2)
    return 1;
  v3 = 0;
  v4 = 0;
  do
  {
    if (v3 + 1 <= ((2 * v4) | 1uLL))
    {
      ++v3;
    }
    else
    {
      ++v4;
      v3 = 0;
    }
    --v2;
  }
  while (v2);
  return v4 + 1;
}

- (id)_suggestedBoundsForPyramidLayerWithIndex:(unint64_t)a3 inLayer:(unint64_t)a4 andSlice:(unint64_t)a5
{
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v8 = -[CMDiagramSegmentedPyramidMapper layerCount](self, "layerCount", a3);
  v9 = (float)(1.0 / (float)v8);
  v10 = (double)(a4 + 1);
  v11 = v10 * v9;
  if (a4)
  {
    v12 = 0.5 - v10 * v9 * 0.5;
    v13 = (double)a4 * v9;
    v14 = (float)(1.0 / (float)v8);
    v11 = CGRectGetWidth(*(CGRect *)(&v11 - 2)) / v10;
  }
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.super.super.mOrientedBounds, 0.5 - v10 * v9 * 0.5 + v11 * (double)a5 * 0.5, (double)a4 * v9, v11, v9);
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

  -[CMDiagramSegmentedPyramidMapper _suggestedBoundsForPyramidLayerWithIndex:inLayer:andSlice:](self, "_suggestedBoundsForPyramidLayerWithIndex:inLayer:andSlice:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5 * 0.5;
  v8 = v7 / 3.0;

  v9 = v8;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
