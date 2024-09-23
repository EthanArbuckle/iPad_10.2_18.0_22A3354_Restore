@implementation CMDiagramPointArrowMapper

- (CMDiagramPointArrowMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6
{
  CMDiagramPointArrowMapper *v6;
  CMDiagramPointArrowMapper *v7;
  float v8;
  int v10;
  CMDiagramPointArrowMapper *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMDiagramPointArrowMapper;
  v6 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:](&v13, sel_initWithPoint_drawingContext_orientedBounds_parent_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    -[OADOrientedBounds rotation](v6->super.mOrientedBounds, "rotation");
    if (v8 == -90.0 || v8 == 90.0)
      v10 = 247;
    else
      v10 = 248;
    v7->mArrowType = v10;
    v11 = v7;
  }

  return v7;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CMDrawableStyle *v14;
  void *v15;
  id v16;
  CMDrawableStyle *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v22;
  objc_super v23;

  v6 = a3;
  v21 = a4;
  -[CMDiagramPointMapper transformForPresentationWithName:](self, "transformForPresentationWithName:", CFSTR("arrow"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils transformedBoundsWithBounds:transform:](CMShapeUtils, "transformedBoundsWithBounds:transform:", self->super.mOrientedBounds, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    objc_msgSend(v7, "bounds");
    objc_msgSend(v7, "setBounds:", NSTransposedRectWithSameCenter(v8, v9, v10, v11));
  }
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper stroke](self, "stroke");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 248, v12, v13, 0, v7, v21, self->super.mDrawingContext);

  v14 = objc_alloc_init(CMDrawableStyle);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[CMDrawableStyle addPositionProperties:](v14, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v15);
  v23.receiver = self;
  v23.super_class = (Class)CMDiagramPointArrowMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v23, sel_addStyleUsingGlobalCacheTo_style_, v15, v14);
  v16 = v15;

  v17 = objc_alloc_init(CMDrawableStyle);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMDiagramPointArrowMapper getTextBoundsForBounds:](self, "getTextBoundsForBounds:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  -[CMDrawableStyle addPositionProperties:](v17, "addPositionProperties:");
  objc_msgSend(v16, "addChild:", v18);
  v22.receiver = self;
  v22.super_class = (Class)CMDiagramPointArrowMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v22, sel_addStyleUsingGlobalCacheTo_style_, v18, v17);
  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v18, v19, 1, 1, v21);

}

- (id)getTextBoundsForBounds:(id)a3
{
  id v4;
  void *v5;
  double Width;
  double Height;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  float v17;
  OADOrientedBounds *v18;
  float v19;
  float v20;
  float v21;
  OADOrientedBounds *v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v4 = a3;
  v5 = v4;
  if (self->mArrowType == 248)
  {
    objc_msgSend(v4, "bounds");
    Width = CGRectGetWidth(v24);
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v25);
    objc_msgSend(v5, "bounds");
    v8 = CGRectGetWidth(v26);
    objc_msgSend(v5, "rotation");
    v9 = Width * 0.5;
    v10 = Height * 0.699999988;
    v11 = v8 * 0.25;
    v12 = 0.0;
    if (v13 <= 0.0)
    {
      objc_msgSend(v5, "bounds");
      v12 = CGRectGetHeight(v27) * 0.300000012;
    }
  }
  else
  {
    objc_msgSend(v4, "bounds");
    v14 = CGRectGetWidth(v28);
    objc_msgSend(v5, "bounds");
    v15 = CGRectGetHeight(v29);
    objc_msgSend(v5, "bounds");
    v16 = CGRectGetHeight(v30);
    objc_msgSend(v5, "rotation");
    v9 = v14 * 0.699999988;
    v10 = v15 * 0.5;
    v12 = v16 * 0.25;
    v11 = 0.0;
    if (v17 <= 0.0)
    {
      objc_msgSend(v5, "bounds");
      v11 = CGRectGetWidth(v31) * 0.300000012;
    }
  }
  v18 = [OADOrientedBounds alloc];
  v19 = v12;
  v20 = v9;
  v21 = v10;
  v22 = -[OADOrientedBounds initWithBounds:](v18, "initWithBounds:", v11, v19, v20, v21);

  return v22;
}

- (id)transformPresentationName
{
  return CFSTR("arrow");
}

@end
