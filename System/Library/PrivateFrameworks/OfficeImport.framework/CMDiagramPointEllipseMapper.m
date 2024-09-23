@implementation CMDiagramPointEllipseMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OADOrientedBounds *v10;
  void *v11;
  void *v12;
  void *v13;
  CMDrawableStyle *v14;
  void *v15;
  id v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  -[CMDiagramPointMapper transformPresentationName](self, "transformPresentationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CMDiagramPointMapper transformForPresentationWithName:](self, "transformForPresentationWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeUtils transformedBoundsWithBounds:transform:](CMShapeUtils, "transformedBoundsWithBounds:transform:", self->super.mOrientedBounds, v9);
    v10 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = self->super.mOrientedBounds;
  }
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper stroke](self, "stroke");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 3, v11, v12, 0, self->super.mOrientedBounds, v7, self->super.mDrawingContext);

  -[CMDiagramPointMapper plainText](self, "plainText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(CMDrawableStyle);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
    -[CMDrawableStyle addPositionProperties:](v14, "addPositionProperties:");
    objc_msgSend(v6, "addChild:", v15);
    v17.receiver = self;
    v17.super_class = (Class)CMDiagramPointEllipseMapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:](&v17, sel_addStyleUsingGlobalCacheTo_style_, v15, v14);
    v16 = v15;

    -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v16, v10, 1, 0, v7);
    -[CMDiagramPointMapper mapChlidrenAt:withState:](self, "mapChlidrenAt:withState:", v16, v7);

  }
  else
  {
    v16 = v6;
  }

}

@end
