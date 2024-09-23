@implementation CMDiagramPointListItemL1Mapper

- (CMDiagramPointListItemL1Mapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 listIndex:(unint64_t)a6 parent:(id)a7
{
  CMDiagramPointListItemL1Mapper *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMDiagramPointListItemL1Mapper;
  result = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:](&v9, sel_initWithPoint_drawingContext_orientedBounds_parent_, a3, a4, a5, a7);
  if (result)
    result->mListIndex = a6;
  return result;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  CMDrawableStyle *v7;
  void *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  id v25;
  void *v26;
  CMDrawableStyle *v27;
  void *v28;
  uint64_t v29;
  CMBordersProperty *v30;
  void *v31;
  double Width;
  double v33;
  id v34;
  void *v35;
  void *v36;
  CMDiagramPointListBaseMapper *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  objc_super v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v6 = a3;
  v41 = a4;
  v7 = objc_alloc_init(CMDrawableStyle);
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  -[CMDrawableStyle addPositionProperties:](v7, "addPositionProperties:");
  objc_msgSend(v6, "addChild:", v8);
  v9 = v8;

  v43.receiver = self;
  v43.super_class = (Class)CMDiagramPointListItemL1Mapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v43, sel_addStyleUsingGlobalCacheTo_style_, v9, v7);
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CMDiagramPointMapper stroke](self, "stroke");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "width");
  v19 = v18;
  v20 = v18 * 0.5;
  if (v19 <= 1.5)
    v21 = 0.0;
  else
    v21 = v20;
  -[CMDiagramPointMapper defaultFontSize](self, "defaultFontSize");
  v23 = v22;
  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  v24 = (float)(v23 + v23) * 1.1;
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", (float)-(float)(v19 - v21), (float)-(float)(v19 - v21), CGRectGetWidth(v44) - v21, (float)(v24 - v21));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(CMDrawableStyle);
  objc_msgSend(v25, "bounds");
  -[CMDrawableStyle addPositionProperties:](v27, "addPositionProperties:");
  -[CMDiagramPointMapper fill](self, "fill");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v28, v41);
  v29 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v29;
  -[CMStyle appendPropertyForName:color:](v27, "appendPropertyForName:color:", 0x24F3E6CB8, v29);
  v30 = [CMBordersProperty alloc];
  -[CMBordersProperty setFromOadStroke:atLocation:state:](v30, "setFromOadStroke:atLocation:state:", v40, 0, v41);
  -[CMBordersProperty cssString](v30, "cssString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMStyle appendPropertyString:](v27, "appendPropertyString:", v31);

  objc_msgSend(v9, "addChild:", v26);
  v42.receiver = self;
  v42.super_class = (Class)CMDiagramPointListItemL1Mapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v42, sel_addStyleUsingGlobalCacheTo_style_, v26, v27);
  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v26, v25, 1, 0, v41);
  v45.origin.x = v11;
  v45.origin.y = v13;
  v45.size.width = v15;
  v45.size.height = v17;
  Width = CGRectGetWidth(v45);
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  v33 = CGRectGetHeight(v46) - v24;
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, v24, Width, v33);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[ODDPoint children](self->super.mPoint, "children");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndex:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointListBaseMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v36, self->super.mDrawingContext, v34, self);
    -[CMDiagramPointListBaseMapper mapAt:withState:](v37, "mapAt:withState:", v9, v41);
  }
  else
  {
    -[ODDPoint shapeProperties](self->super.mPoint, "shapeProperties");
    v37 = (CMDiagramPointListBaseMapper *)objc_claimAutoreleasedReturnValue();
    -[CMDiagramPointListBaseMapper setFill:](v37, "setFill:", 0);
    -[CMDiagramPointListBaseMapper setStroke:](v37, "setStroke:", 0);
    -[CMDiagramPointMapper setPresentationName:](self, "setPresentationName:", CFSTR("desTx"));
    -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDiagramPointMapper mapStyledRectangle:at:withState:](self, "mapStyledRectangle:at:withState:", v38, v41, 0.0, v24, Width, v33);
    objc_msgSend(v9, "addChild:", v38);

  }
}

@end
