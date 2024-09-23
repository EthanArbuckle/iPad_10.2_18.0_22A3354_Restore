@implementation CMDiagramShapeMapper

- (CMDiagramShapeMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CMDiagramShapeMapper *v17;
  CMDiagramShapeMapper *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CMDiagramShapeMapper;
  v17 = -[CMDiagramMapper initWithOddDiagram:drawingContext:orientedBounds:parent:](&v22, sel_initWithOddDiagram_drawingContext_orientedBounds_parent_, v12, v13, v14, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->mIdentifier, a6);
    -[ODDDiagram documentPoint](v18->super.mDiagram, "documentPoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "children");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18->mChildCount = objc_msgSend(v20, "count");

    v18->mDefaultFontSize = 65.0;
    v18->mMaxMappableTreeDepth = 0;
    v18->mDefaultScale = 1.0;
  }

  return v18;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CMDrawableStyle *v17;
  void *v18;
  OADOrientedBounds *v19;
  OADOrientedBounds *mDiagramShapeBounds;
  double Width;
  float v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v6 = a3;
  v7 = a4;
  -[CMDiagramShapeMapper circumscribedBounds](self, "circumscribedBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  +[CMShapeUtils inscribedBoundsWithBounds:logicalBounds:](CMShapeUtils, "inscribedBoundsWithBounds:logicalBounds:", self->super.super.mOrientedBounds);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(CMDrawableStyle);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils relatvieBoundsWithAbsoluteInnerBounds:parentBounds:](CMShapeUtils, "relatvieBoundsWithAbsoluteInnerBounds:parentBounds:", v16, self->super.super.mOrientedBounds);
  v19 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mDiagramShapeBounds = self->mDiagramShapeBounds;
  self->mDiagramShapeBounds = v19;

  -[OADOrientedBounds bounds](self->mDiagramShapeBounds, "bounds");
  Width = CGRectGetWidth(v28);
  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  v22 = Width / CGRectGetWidth(v29);
  self->mDefaultScale = v22;
  -[OADOrientedBounds bounds](self->mDiagramShapeBounds, "bounds");
  -[CMDrawableStyle addPositionProperties:](v17, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v18);
  v27.receiver = self;
  v27.super_class = (Class)CMDiagramShapeMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v27, sel_addStyleUsingGlobalCacheTo_style_, v18, v17);
  v23 = v18;

  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.mOrientedBounds, "bounds");
  v26 = v25;
  -[OADOrientedBounds bounds](self->super.super.mOrientedBounds, "bounds");
  objc_msgSend(v24, "translateXBy:yBy:", v26);
  -[CMDrawingContext addTransform:](self->super.mDrawingContext, "addTransform:", v24);
  -[CMDiagramShapeMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v23, v7);
  -[CMDrawingContext restoreLastTransform](self->super.mDrawingContext, "restoreLastTransform");

}

- (void)setDefaultFonSize
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[ODDDiagram documentPoint](self->super.mDiagram, "documentPoint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->mChildCount)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeMapper setFonSizeForChildNode:atIndex:](self, "setFonSizeForChildNode:atIndex:", v5, v4);

      ++v4;
    }
    while (self->mChildCount > v4);
  }

}

- (void)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4
{
  -[CMDiagramShapeMapper setFonSizeForChildNode:atIndex:level:](self, "setFonSizeForChildNode:atIndex:level:", a3, a4, 0);
}

- (float)setFonSizeForChildNode:(id)a3 atIndex:(unint64_t)a4 level:(int)a5
{
  id v8;
  CMDiagramPointMapper *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  void *v30;
  float v31;
  float v32;

  v8 = a3;
  v9 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v8, self->super.mDrawingContext, self->super.super.mOrientedBounds, self);
  -[CMDiagramShapeMapper sizeForNode:atIndex:](self, "sizeForNode:atIndex:", v8, a4);
  v11 = v10;
  v13 = v12;
  -[CMDiagramPointMapper transformPresentationName](v9, "transformPresentationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[CMDiagramPointMapper transformForPresentationWithName:](v9, "transformForPresentationWithName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transformSize:", v11, v13);
      v11 = v17;
      v13 = v18;
    }

  }
  -[CMDiagramShapeMapper textSizeForShapeSize:](self, "textSizeForShapeSize:", v11, v13);
  v20 = v19;
  v22 = v21;
  -[CMDiagramPointMapper plainText](v9, "plainText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils fontSizeForText:insideRectangle:](CMShapeUtils, "fontSizeForText:insideRectangle:", v23, v20, v22);
  v25 = v24;

  if (self->mDefaultFontSize > v25)
    self->mDefaultFontSize = v25;
  objc_msgSend(v8, "children");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  if (v27)
  {
    v28 = 0;
    v29 = 1.0;
    do
    {
      objc_msgSend(v26, "objectAtIndex:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeMapper setFonSizeForChildNode:atIndex:level:](self, "setFonSizeForChildNode:atIndex:level:", v30, v28, (a5 + 1));
      if (self->mMaxMappableTreeDepth > a5)
        v31 = -0.0;
      v29 = v29 + v31;

      ++v28;
    }
    while (v27 != v28);
  }
  else
  {
    v29 = 1.0;
  }
  if (self->mMaxMappableTreeDepth == a5 && v13 < (float)((float)(v29 * self->mDefaultFontSize) * 1.2))
  {
    v32 = v13 / v29 / 1.20000005;
    self->mDefaultFontSize = v32;
  }

  return v29;
}

- (float)defaultFontSize
{
  return self->mDefaultFontSize;
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  CGFloat Width;
  double Height;
  double v7;
  CGSize result;
  CGRect v9;
  CGRect v10;

  -[OADOrientedBounds bounds](self->mDiagramShapeBounds, "bounds", a3, a4);
  Width = CGRectGetWidth(v9);
  -[OADOrientedBounds bounds](self->mDiagramShapeBounds, "bounds");
  Height = CGRectGetHeight(v10);
  v7 = Width;
  result.height = Height;
  result.width = v7;
  return result;
}

- (CGRect)circumscribedBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIdentifier, 0);
  objc_storeStrong((id *)&self->mDiagramShapeBounds, 0);
}

@end
