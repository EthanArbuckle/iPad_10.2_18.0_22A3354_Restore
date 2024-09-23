@implementation CMDiagramSegmentedPieMapper

- (int)pointCount
{
  uint64_t v2;

  if (self->super.mChildCount >= 7)
    LODWORD(v2) = 7;
  else
    return self->super.mChildCount;
  return v2;
}

- (void)setDrawArrows:(BOOL)a3
{
  *((_BYTE *)&self->super.mDefaultScale + 4) = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double Width;
  CGFloat v16;
  OADOrientedBounds *v17;
  OADOrientedBounds *mOrientedBounds;
  void *v19;
  double v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22 = a3;
  v6 = a4;
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  if (v9 <= v10)
  {
    if (v9 < v10)
    {
      v12 = v8 + (v10 - v9) * 0.5;
      v14 = v9;
    }
  }
  else
  {
    v11 = v7 + (v9 - v10) * 0.5;
    v13 = v10;
  }
  v23.origin.x = v11;
  v23.origin.y = v12;
  v23.size.width = v13;
  v23.size.height = v14;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v11;
  v24.origin.y = v12;
  v24.size.width = v13;
  v24.size.height = v14;
  v16 = (Width + CGRectGetHeight(v24)) * 0.04;
  v25.origin.x = v11;
  v25.origin.y = v12;
  v25.size.width = v13;
  v25.size.height = v14;
  v26 = CGRectInset(v25, v16, v16);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  v17 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.super.super.mOrientedBounds;
  self->super.super.super.mOrientedBounds = v17;

  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v21 = v20;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v19, "translateXBy:yBy:", v21);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v19);
  -[CMDiagramSegmentedPieMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v22, v6);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  void *v14;
  void *v15;
  CMDiagramPointSegmentedPieMapper *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CMDiagramSegmentedPieMapper pointCount](self, "pointCount");
  if (v9)
  {
    v10 = 0;
    v11 = v9;
    v12 = (double)(unint64_t)v9;
    v13 = 2;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramSegmentedPieMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointSegmentedPieMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v14, self->super.super.mDrawingContext, v15, self);
      -[CMDiagramPointSegmentedPieMapper setStartAngle:](v16, "setStartAngle:", 1.57079633 - (double)(v13 - 2) * 3.14159265 / v12);
      -[CMDiagramPointSegmentedPieMapper setStopAngle:](v16, "setStopAngle:", 1.57079633 - (double)v13 * 3.14159265 / v12);
      -[CMDiagramPointSegmentedPieMapper setDrawArrows:](v16, "setDrawArrows:", *((unsigned __int8 *)&self->super.mDefaultScale + 4));
      v17 = v10 + 1;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("wedge%lu"), v10 + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramPointMapper setPresentationName:](v16, "setPresentationName:", v18);

      -[CMDiagramPointSegmentedPieMapper setSegmentIndex:](v16, "setSegmentIndex:", v17 - 1);
      -[CMDiagramPointSegmentedPieMapper setSegmentCount:](v16, "setSegmentCount:", v11);
      -[CMDiagramPointSegmentedPieMapper mapAt:withState:](v16, "mapAt:withState:", v19, v6);

      v13 += 2;
      v10 = v17;
    }
    while (v17 != v11);
  }

}

- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3
{
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds", a3);
  return +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, 0.0);
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

  -[CMDiagramSegmentedPieMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5 / 6.0;
  v8 = v7 / 6.0;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
