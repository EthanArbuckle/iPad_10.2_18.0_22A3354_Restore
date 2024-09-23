@implementation CMDiagramPointListBaseMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  CMDrawableStyle *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMBordersProperty *v23;
  void *v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CMDrawableStyle);
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper stroke](self, "stroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "width");
  v11 = v10;
  v12 = v10 * 0.5;
  if (v11 <= 1.5)
    v13 = 0.0;
  else
    v13 = v12;
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v18 = CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", x - (float)(v11 - v13), y - (float)(v11 - v13), v18 - v13, CGRectGetHeight(v27) - v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  -[CMDrawableStyle addPositionProperties:](v8, "addPositionProperties:");
  -[CMDiagramPointMapper fill](self, "fill");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v21, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMStyle appendPropertyForName:color:](v8, "appendPropertyForName:color:", 0x24F3E6CB8, v22);
  v23 = [CMBordersProperty alloc];
  -[CMBordersProperty setFromOadStroke:atLocation:state:](v23, "setFromOadStroke:atLocation:state:", v9, 0, v7);
  -[CMBordersProperty cssString](v23, "cssString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMStyle appendPropertyString:](v8, "appendPropertyString:", v24);

  objc_msgSend(v6, "addChild:", v20);
  v25.receiver = self;
  v25.super_class = (Class)CMDiagramPointListBaseMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v25, sel_addStyleUsingGlobalCacheTo_style_, v20, v8);
  -[CMDiagramPointListBaseMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v20, v19, 1, 0, v7);

}

- (void)mapTextAt:(id)a3 withBounds:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 withState:(id)a7
{
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v10 = a3;
  v11 = a7;
  -[CMDiagramPointMapper baseTextListStyleWithBounds:isCentered:](self, "baseTextListStyleWithBounds:isCentered:", a4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)CMDiagramPointListBaseMapper;
  -[CMDiagramPointMapper mapSiblingTextAt:style:level:withState:](&v13, sel_mapSiblingTextAt_style_level_withState_, v10, v12, 1, v11);

}

@end
