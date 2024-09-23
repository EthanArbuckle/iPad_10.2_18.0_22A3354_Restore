@implementation CMDiagramPointSegmentedPyramidLayerMapper

- (void)setIsPlaceholder:(BOOL)a3
{
  self->mPlaceholder = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  void *v24;
  void *v25;
  CMDrawableStyle *v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v6 = a4;
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper stroke](self, "stroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCE70];
  LODWORD(v10) = 1195593728;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObject:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 5, v7, v8, v13, self->super.mOrientedBounds, v6, self->super.mDrawingContext);

  if (!self->mPlaceholder)
  {
    -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = -[OADOrientedBounds flipY](self->super.mOrientedBounds, "flipY");
    v23 = -0.0;
    if (!v22)
      v23 = v21 * 0.5;
    -[CMDrawingContext transformRectToGroup:](self->super.mDrawingContext, "transformRectToGroup:", v15, v17 + v23, v19);
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(CMDrawableStyle);
    objc_msgSend(v24, "bounds");
    -[CMDrawableStyle addPositionProperties:](v26, "addPositionProperties:");
    objc_msgSend(v27, "addChild:", v25);
    v28.receiver = self;
    v28.super_class = (Class)CMDiagramPointSegmentedPyramidLayerMapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:](&v28, sel_addStyleUsingGlobalCacheTo_style_, v25, v26);
    -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v25, v24, 1, 1, v6);

  }
}

@end
