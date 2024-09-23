@implementation CMDiagramShapeArrow4Mapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v9 = v8;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v7);
  -[CMDiagramShapeArrow4Mapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v10, v6);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  float v10;
  double Height;
  double Width;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  CMDiagramPointMapper *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  CGFloat v24;
  OADOrientedBounds *v25;
  CMDrawableStyle *v26;
  void *v27;
  void *v28;
  CMDrawableStyle *v29;
  void *v30;
  void *v31;
  double v32;
  OADOrientedBounds *v33;
  CMDiagramPointMapper *v34;
  void *v35;
  void *v36;
  CGFloat v37;
  OADOrientedBounds *v38;
  OADOrientedBounds *v39;
  void *v40;
  void *v41;
  id v42;
  OADOrientedBounds *v43;
  id v44;
  objc_super v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v44 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v42 = v6;
    -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
    v10 = CGRectGetHeight(v47) * 0.479999989;
    if (v9 == 1)
    {
      -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
      Height = CGRectGetHeight(v48);
    }
    else
    {
      Height = v10;
    }
    -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
    Width = CGRectGetWidth(v49);
    -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = Height;
    v16 = v10;
    v17 = v15;
    v43 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", 0.0, 0.0, v10, v15);
    v18 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v41, self->super.super.mDrawingContext, v43, self);
    -[CMDiagramPointMapper setPresentationName:](v18, "setPresentationName:", CFSTR("upArrow"));
    -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](v18, "applyDiagramStyleToShapeProperties");
    -[CMDiagramPointMapper fill](v18, "fill");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDiagramPointMapper stroke](v18, "stroke");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 248, v19, v20, 0, v43, v6, self->super.super.mDrawingContext);

    -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
    v21 = Width * 0.100000001;
    v22 = v10 + 1.0;
    v23 = (float)(v10 + 1.0);
    v24 = CGRectGetWidth(v50) - v16 - v21;
    v25 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v23, 0.0, v24, v15);
    v26 = objc_alloc_init(CMDrawableStyle);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDrawableStyle addPositionProperties:](v26, "addPositionProperties:", v23, 0.0, v24, v15);
    objc_msgSend(v44, "addChild:", v27);
    v46.receiver = self;
    v46.super_class = (Class)CMDiagramShapeArrow4Mapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:](&v46, sel_addStyleUsingGlobalCacheTo_style_, v27, v26);
    -[CMDiagramPointMapper setPresentationName:](v18, "setPresentationName:", CFSTR("upArrowText"));
    -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](v18, "applyDiagramStyleToShapeProperties");
    -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](v18, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v27, v25, 1, 0, v42);
    if (v9 == 1)
    {
      v28 = v27;
      v29 = v26;
    }
    else
    {
      v39 = v25;
      -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "children");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndex:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (float)(v15 + 1.0);
      v33 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v21, v32, v16, v15);
      -[OADOrientedBounds setFlipY:](v33, "setFlipY:", 1);
      v34 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v40, self->super.super.mDrawingContext, v43, self);
      -[CMDiagramPointMapper setPresentationName:](v34, "setPresentationName:", CFSTR("downArrow"));
      -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](v34, "applyDiagramStyleToShapeProperties");
      -[CMDiagramPointMapper fill](v34, "fill");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramPointMapper stroke](v34, "stroke");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 248, v35, v36, 0, v33, v42, self->super.super.mDrawingContext);

      -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
      v37 = CGRectGetWidth(v51) - v16 - v21;
      v38 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", (float)(v22 + v21), v32, v37, v17);
      v29 = objc_alloc_init(CMDrawableStyle);

      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[CMDrawableStyle addPositionProperties:](v29, "addPositionProperties:", (float)(v22 + v21), v32, v37, v17);
      objc_msgSend(v44, "addChild:", v28);
      v45.receiver = self;
      v45.super_class = (Class)CMDiagramShapeArrow4Mapper;
      -[CMMapper addStyleUsingGlobalCacheTo:style:](&v45, sel_addStyleUsingGlobalCacheTo_style_, v28, v29);
      -[CMDiagramPointMapper setPresentationName:](v34, "setPresentationName:", CFSTR("downArrowText"));
      -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](v34, "applyDiagramStyleToShapeProperties");
      -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](v34, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v28, v38, 1, 0, v42);

      v25 = v39;
    }

    v6 = v42;
  }

}

@end
