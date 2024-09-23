@implementation CMDiagramPointTextMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OADOrientedBounds *v10;
  CMDrawableStyle *v11;
  void *v12;
  id v13;
  objc_super v14;

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
  v11 = objc_alloc_init(CMDrawableStyle);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](v10, "bounds");
  -[CMDrawableStyle addPositionProperties:](v11, "addPositionProperties:");
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  objc_msgSend(v6, "addChild:", v12);
  v14.receiver = self;
  v14.super_class = (Class)CMDiagramPointTextMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v14, sel_addStyleUsingGlobalCacheTo_style_, v12, v11);
  v13 = v12;

  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v13, v10, 1, 0, v7);
}

@end
