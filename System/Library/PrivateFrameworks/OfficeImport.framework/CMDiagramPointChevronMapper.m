@implementation CMDiagramPointChevronMapper

- (void)setIsHomePlate:(BOOL)a3
{
  self->mHomePlate = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CMDrawingContext *mDrawingContext;
  void *v14;
  void *v15;
  CMDrawableStyle *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper stroke](self, "stroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->mHomePlate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("IsHomePlate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 55, v8, v9, v12, self->super.mOrientedBounds, v7, self->super.mDrawingContext);

  mDrawingContext = self->super.mDrawingContext;
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  -[CMDrawingContext transformRectToGroup:](mDrawingContext, "transformRectToGroup:");
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(CMDrawableStyle);
  objc_msgSend(v14, "bounds");
  -[CMDrawableStyle addPositionProperties:](v16, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v15);
  v17.receiver = self;
  v17.super_class = (Class)CMDiagramPointChevronMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v17, sel_addStyleUsingGlobalCacheTo_style_, v15, v16);
  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v15, v14, 1, 1, v7);

}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->mPlaceholder = a3;
}

@end
