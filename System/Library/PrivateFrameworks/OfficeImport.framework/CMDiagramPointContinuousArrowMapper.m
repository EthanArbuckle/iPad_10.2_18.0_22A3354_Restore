@implementation CMDiagramPointContinuousArrowMapper

- (void)setIsArrow:(BOOL)a3
{
  self->mIsArrow = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  CMDrawingContext *mDrawingContext;
  void *v9;
  void *v10;
  CMDrawableStyle *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  mDrawingContext = self->super.mDrawingContext;
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  -[CMDrawingContext transformRectToGroup:](mDrawingContext, "transformRectToGroup:");
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(CMDrawableStyle);
  objc_msgSend(v9, "bounds");
  -[CMDrawableStyle addPositionProperties:](v11, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v10);
  v12.receiver = self;
  v12.super_class = (Class)CMDiagramPointContinuousArrowMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v12, sel_addStyleUsingGlobalCacheTo_style_, v10, v11);
  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v10, v9, 1, 1, v7);

}

@end
