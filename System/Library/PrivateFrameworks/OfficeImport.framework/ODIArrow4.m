@implementation ODIArrow4

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a4;
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("arrow4"));
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "diagram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentPoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "children");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
    objc_msgSend(a1, "pointAtIndex:points:", 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pointAtIndex:points:", 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable sizeOfDiagram:](ODIDrawable, "sizeOfDiagram:", v8);
    v16 = v15 / v14;
    objc_msgSend(v6, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, v16);
    +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.400000006, 0.25);
    v17 = objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = -1028390912;
    v31 = (void *)v17;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v17, v6, 0.0, 0.0, (float)(v16 * 0.48), 0.330000013, v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("upArrow"), v12, v30, v6);
    +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.400000006, 0.25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = -1014562816;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v19, v6, 0.100000001, (float)(v16 * 0.52), (float)(v16 * 0.48), 0.330000013, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("downArrow"), v13, v21, v6);
    if (v11)
    {
      v32 = v13;
      v29 = v8;
      +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = 0;
      +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v22, v6, 0.340000004, 0.0, 0.560000002, (float)(v16 * 0.48), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setPresentationName:forPointType:", CFSTR("upArrowText"), 2);
      +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v12, v24, v6);
      +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v12, v24, 0, 1, v6);

      v8 = v29;
      v13 = v32;
      if (v11 >= 2)
      {
        +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = 0;
        +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v25, v6, 0.439999998, (float)(v16 * 0.52), 0.560000002, (float)(v16 * 0.48), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setPresentationName:forPointType:", CFSTR("downArrowText"), 2);
        +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v32, v27, v6);
        +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v32, v27, 0, 1, v6);

        v8 = v29;
        v13 = v32;
      }
    }

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
