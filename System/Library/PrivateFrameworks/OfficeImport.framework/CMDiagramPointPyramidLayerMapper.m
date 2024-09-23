@implementation CMDiagramPointPyramidLayerMapper

- (void)setPyramidAspectRatio:(double)a3
{
  self->mPyramidAspectRatio = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double mPyramidAspectRatio;
  void *v12;
  void *v13;
  void *v14;
  CMDrawingContext *mDrawingContext;
  void *v16;
  void *v17;
  CMDrawableStyle *v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper stroke](self, "stroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCE70];
  mPyramidAspectRatio = self->mPyramidAspectRatio;
  *(float *)&mPyramidAspectRatio = mPyramidAspectRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", mPyramidAspectRatio);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 249, v8, v9, v14, self->super.mOrientedBounds, v7, self->super.mDrawingContext);

  mDrawingContext = self->super.mDrawingContext;
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  -[CMDrawingContext transformRectToGroup:](mDrawingContext, "transformRectToGroup:");
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(CMDrawableStyle);
  objc_msgSend(v16, "bounds");
  -[CMDrawableStyle addPositionProperties:](v18, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v17);
  v19.receiver = self;
  v19.super_class = (Class)CMDiagramPointPyramidLayerMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v19, sel_addStyleUsingGlobalCacheTo_style_, v17, v18);
  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v17, v16, 1, 1, v7);

}

@end
