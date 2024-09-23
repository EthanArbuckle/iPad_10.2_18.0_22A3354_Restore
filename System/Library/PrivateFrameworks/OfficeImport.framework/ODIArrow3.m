@implementation ODIArrow3

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6;
  char v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  float v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a4;
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("arrow3"));
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "diagram");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "documentPoint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(a1, "pointAtIndex:points:", 0, v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pointAtIndex:points:", 1, v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable sizeOfDiagram:](ODIDrawable, "sizeOfDiagram:", v31);
    v12 = v11 / v10;
    objc_msgSend(v6, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, v12);
    +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
    v13 = objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = -1014562816;
    v29 = (void *)v13;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, v6, 0.119999997, (float)(v12 * 0.05), (float)(v12 * 0.41), 0.310000002, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("downArrow"), v33, v28, v6);
    +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = -1028390912;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v15, v6, 0.569999993, (float)(v12 * 0.54), (float)(v12 * 0.41), 0.310000002, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("upArrow"), v32, v17, v6);
    if (v9)
    {
      +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 0;
      +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v18, v6, 0.529999971, 0.0, 0.319999993, (float)(v12 * 0.43), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setPresentationName:forPointType:", CFSTR("downArrowText"), 2);
      +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v33, v20, v6);
      +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v33, v20, 1, 1, v6);

      if (v9 >= 2)
      {
        +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = 0;
        +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v21, v6, 0.150000006, (float)(v12 * 0.57), 0.319999993, (float)(v12 * 0.43), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setPresentationName:forPointType:", CFSTR("upArrowText"), 2);
        +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v32, v23, v6);
        +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v32, v23, 1, 1, v6);

      }
    }
    +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = v12 * -4.96;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v24, v6, 0.140000001, (float)(v12 * 0.457), 0.72, (float)(v12 * 0.023), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("divider"), v30, v26, v6);
  }

  return v7;
}

+ (id)pointAtIndex:(unsigned int)a3 points:(id)a4
{
  id v5;
  ODDNodePoint *v6;

  v5 = a4;
  if (objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    v6 = objc_alloc_init(ODDNodePoint);
    -[ODDNodePoint setType:](v6, "setType:", 2);
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (ODDNodePoint *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
