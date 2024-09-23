@implementation CMDiagramListMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  float mDefaultFontSize;
  float v9;
  float Height;
  double v11;
  double Width;
  CMDrawableStyle *v13;
  void *v14;
  OADOrientedBounds *v15;
  OADOrientedBounds *mDiagramShapeBounds;
  id v17;
  void *v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v6 = a3;
  v7 = a4;
  *((_DWORD *)&self->super.mDefaultScale + 1) = 1077936128;
  -[CMDiagramListMapper setDefaultFonSize](self, "setDefaultFonSize");
  mDefaultFontSize = self->super.mDefaultFontSize;
  v9 = *(&self->super.mDefaultScale + 1);
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  Height = (float)(mDefaultFontSize * 0.5) + (float)((float)(mDefaultFontSize * 1.5) * v9);
  if (CGRectGetHeight(v22) < Height)
  {
    -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
    Height = CGRectGetHeight(v23);
  }
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v11 = CGRectGetHeight(v24);
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  Width = CGRectGetWidth(v25);
  v13 = objc_alloc_init(CMDrawableStyle);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, (v11 - Height) * 0.5, Width);
  v15 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mDiagramShapeBounds = self->super.mDiagramShapeBounds;
  self->super.mDiagramShapeBounds = v15;

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  -[CMDrawableStyle addPositionProperties:](v13, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v14);
  v21.receiver = self;
  v21.super_class = (Class)CMDiagramListMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v21, sel_addStyleUsingGlobalCacheTo_style_, v14, v13);
  v17 = v14;

  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v20 = v19;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v18, "translateXBy:yBy:", v20);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v18);
  -[CMDiagramListMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v17, v7);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (void)setDefaultFonSize
{
  void *v3;
  unint64_t v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  id v9;
  CGRect v10;
  CGRect v11;

  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->super.mChildCount)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramListMapper setFonSizeForChildNode:atIndex:level:](self, "setFonSizeForChildNode:atIndex:level:", v5, v4, 0);

      ++v4;
    }
    while (self->super.mChildCount > v4);
  }
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v6 = CGRectGetHeight(v10) / (float)((float)(*(&self->super.mDefaultScale + 1) * 1.5) + 0.5);
  if (self->super.mDefaultFontSize > v6)
    self->super.mDefaultFontSize = v6;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v7 = CGRectGetWidth(v11)
     / (float)((float)self->super.mChildCount + (float)((float)(self->super.mChildCount - 1) * 0.14));
  v8 = v7 * 0.25;
  if (self->super.mDefaultFontSize > v8)
    self->super.mDefaultFontSize = v8;

}

- (float)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4 level:(int)a5
{
  id v7;
  CMDiagramPointMapper *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  void *v20;
  float v21;

  v7 = a3;
  v8 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v7, self->super.super.mDrawingContext, self->super.super.super.mOrientedBounds, self);
  -[CMDiagramListMapper textSize](self, "textSize");
  v10 = v9;
  v12 = v11;
  -[CMDiagramPointMapper plainText](v8, "plainText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils fontSizeForText:insideRectangle:](CMShapeUtils, "fontSizeForText:insideRectangle:", v13, v10, v12);
  v15 = v14;

  if (self->super.mDefaultFontSize > v15)
    self->super.mDefaultFontSize = v15;
  objc_msgSend(v7, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    v18 = 0;
    v19 = 1.0;
    do
    {
      objc_msgSend(v16, "objectAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramListMapper setFonSizeForChildNode:atIndex:level:](self, "setFonSizeForChildNode:atIndex:level:", v20, v18, (a5 + 1));
      if (self->super.mMaxMappableTreeDepth > a5)
        v21 = -0.0;
      v19 = v19 + v21;

      ++v18;
    }
    while (v17 != v18);
  }
  else
  {
    v19 = 1.0;
  }
  if (*(&self->super.mDefaultScale + 1) < v19)
    *(&self->super.mDefaultScale + 1) = v19;

  return v19;
}

- (CGSize)textSize
{
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v3 = CGRectGetWidth(v6)
     / (float)((float)self->super.mChildCount + (float)((float)(self->super.mChildCount - 1) * 0.14));
  v4 = 97.5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->super.mChildCount)
  {
    v7 = 0;
    do
      -[CMDiagramListMapper mapListItemAt:index:withState:](self, "mapListItemAt:index:withState:", v8, v7++, v6);
    while (self->super.mChildCount > v7);
  }

}

- (void)mapListItemAt:(id)a3 index:(unint64_t)a4 withState:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CMDiagramPointListItemL1Mapper *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  -[CMDiagramListMapper suggestedBoundsForHListItemWithIndex:](self, "suggestedBoundsForHListItemWithIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CMDiagramPointListItemL1Mapper initWithPoint:drawingContext:orientedBounds:listIndex:parent:]([CMDiagramPointListItemL1Mapper alloc], "initWithPoint:drawingContext:orientedBounds:listIndex:parent:", v12, self->super.super.mDrawingContext, v9, a4, self);
  -[CMDiagramPointListItemL1Mapper mapAt:withState:](v13, "mapAt:withState:", v14, v8);

}

- (id)suggestedBoundsForHListItemWithIndex:(unint64_t)a3
{
  CGFloat v5;
  CGRect v7;
  CGRect v8;

  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v5 = CGRectGetWidth(v7)
     / (float)((float)self->super.mChildCount + (float)((float)(self->super.mChildCount - 1) * 0.14));
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  return +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v5 * (double)a3 * 1.13999999, 0.0, v5, CGRectGetHeight(v8));
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

  -[CMDiagramListMapper suggestedBoundsForHListItemWithIndex:](self, "suggestedBoundsForHListItemWithIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
