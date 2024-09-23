@implementation CMDiagramMapper

- (CMDiagramMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CMDiagramMapper *v15;
  CMDiagramMapper *v16;
  CMDrawableStyle *v17;
  CMDrawableStyle *mStyle;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CMDiagramMapper;
  v15 = -[CMDrawableMapper initWithParent:](&v20, sel_initWithParent_, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->mDiagram, a3);
    objc_storeStrong((id *)&v16->mDrawingContext, a4);
    objc_storeStrong((id *)&v16->super.mOrientedBounds, a5);
    v17 = objc_alloc_init(CMDrawableStyle);
    mStyle = v16->super.mStyle;
    v16->super.mStyle = v17;

  }
  return v16;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  CMDrawableStyle *mStyle;
  void *v9;
  CMDrawableStyle *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  mStyle = self->super.mStyle;
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addChild:", v9);
  v10 = self->super.mStyle;
  v20.receiver = self;
  v20.super_class = (Class)CMDiagramMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v20, sel_addStyleUsingGlobalCacheTo_style_, v9, v10);
  v11 = v9;

  -[ODDDiagram documentPoint](self->mDiagram, "documentPoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v12, "propertySet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutTypeId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMDiagramMapper identifierFromLayoutTypeId:](self, "identifierFromLayoutTypeId:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CMDiagramMapper copyDiagramMapperForId:](self, "copyDiagramMapperForId:", v17);
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "mapAt:withState:", v11, v7);

  }
}

- (id)identifierFromLayoutTypeId:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("urn:microsoft.com/office/officeart/2005/8/layout/")) & 1) != 0)
  {
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("#"));
    if (v5)
    {
      objc_msgSend(v3, "substringToIndex:", v4);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v6;
    }
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("urn:microsoft.com/office/officeart/2005/8/layout/"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyDiagramMapperForId:(id)a3
{
  id v4;
  int v5;
  CMDiagramSegmentedPieMapper *v6;
  __objc2_class **v7;

  v4 = a3;
  v5 = +[CMDiagramMapper diagramTypeFromString:](CMDiagramMapper, "diagramTypeFromString:", v4);
  v6 = 0;
  v7 = off_24F399048;
  switch(v5)
  {
    case 1:
      goto LABEL_15;
    case 2:
      v7 = off_24F399088;
      goto LABEL_15;
    case 3:
      v6 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:]([CMDiagramSegmentedPieMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:", self->mDiagram, self->mDrawingContext, self->super.mOrientedBounds, v4, self);
      -[CMDiagramSegmentedPieMapper setDrawArrows:](v6, "setDrawArrows:", 0);
      break;
    case 4:
      v7 = off_24F399050;
      goto LABEL_15;
    case 5:
      v6 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:]([CMDiagramChevronMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:", self->mDiagram, self->mDrawingContext, self->super.mOrientedBounds, v4, self);
      -[CMDiagramSegmentedPieMapper setIsHChevron:](v6, "setIsHChevron:", 1);
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      v7 = off_24F399090;
      goto LABEL_15;
    case 10:
      v6 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:]([CMDiagramSegmentedPieMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:", self->mDiagram, self->mDrawingContext, self->super.mOrientedBounds, v4, self);
      -[CMDiagramSegmentedPieMapper setDrawArrows:](v6, "setDrawArrows:", 1);
      break;
    case 11:
      v7 = off_24F399098;
      goto LABEL_15;
    case 12:
      v7 = off_24F399058;
      goto LABEL_15;
    case 13:
      v7 = off_24F3990A0;
      goto LABEL_15;
    case 15:
      v7 = off_24F399078;
      goto LABEL_15;
    case 16:
      v6 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:]([CMDiagramPyramidMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:", self->mDiagram, self->mDrawingContext, self->super.mOrientedBounds, v4, self);
      -[CMDiagramSegmentedPieMapper setIsFlipped:](v6, "setIsFlipped:", 1);
      break;
    case 17:
      v7 = off_24F399080;
      goto LABEL_15;
    case 18:
      v7 = &off_24F3990A8;
LABEL_15:
      v6 = (CMDiagramSegmentedPieMapper *)objc_msgSend(objc_alloc(*v7), "initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:", self->mDiagram, self->mDrawingContext, self->super.mOrientedBounds, v4, self);
      break;
    default:
      break;
  }

  return v6;
}

+ (int)diagramTypeFromString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("arrow4")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("arrow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hList1")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("lProcess2")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("hList3")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pyramid1")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pyramid3")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hierarchy")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("orgChart1")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pyramid4")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("chevron1")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hChevron3")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cycle1")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cycle2")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cycle5")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cycle7")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cycle8")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("chart3")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hProcess3")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("default")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("process1")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("bProcess4")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("venn1")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)diagram
{
  return self->mDiagram;
}

- (id)styleMatrix
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[CMMapper parent](self, "parent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(v3, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_5;
    }
    objc_msgSend(v3, "styleMatrix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingContext, 0);
  objc_storeStrong((id *)&self->mDiagram, 0);
}

@end
