@implementation ODICycle2

+ (float)nodeRadiusWithState:(id)a3
{
  return sin(2.19911482 / (double)(unint64_t)objc_msgSend(a1, "nodeCountWithState:", a3));
}

+ (CGSize)nodeSizeWithState:(id)a3
{
  float v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "nodeRadiusWithState:", a3);
  v4 = (float)(v3 + v3);
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGRect)mapGSpaceWithState:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "boundingBoxWithIsTight:state:", 1, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  uint64_t v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v6 = *(_QWORD *)&a4;
  v20 = a3;
  v8 = a5;
  objc_msgSend(a1, "nodeBoundsWithIndex:state:", v6, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v17, v8, v10, v12, v14, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v20, v19, v8);
}

+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v8;
  unint64_t v9;
  float v10;
  float v11;
  float v12;
  __double2 v13;
  float cosval;
  __float2 v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  id v27;

  v27 = a3;
  v8 = a5;
  v9 = objc_msgSend(a1, "nodeCountWithState:", v8);
  objc_msgSend(a1, "nodeRadiusWithState:", v8);
  v11 = v10;
  LODWORD(a1) = (2 * a4) | 1;
  v13 = __sincos_stret(3.14159265 / (double)v9);
  cosval = v13.__cosval;
  v12 = (double)a1 * 3.14159265 / (double)v9 + -1.57079633;
  v15 = __sincosf_stret(v12);
  v16 = -((float)(v11 + v11) - v13.__sinval * 2.0) * 0.55;
  v17 = TSURectWithCenterAndSize((float)(v15.__cosval * cosval), (float)(v15.__sinval * cosval), v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.5, 0.15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = (float)((180 * (_DWORD)a1) / v9);
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v24, v8, v17, v19, v21, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v27, v26, v8);

}

+ (BOOL)map1NodeWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v3, "diagram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v8, v3, 0.0, 0.0, 1.0, 1.0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v7, v10, v3);
  return 1;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v34;

  v3 = a3;
  objc_msgSend(v3, "setLogicalBounds:", TSURectWithCenterAndSize(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 4.80000019));
  v4 = 0;
  v5 = 1;
  v34 = 0.9;
  do
  {
    v6 = v5;
    objc_msgSend(v3, "setPointIndex:", v4, *(_QWORD *)&v34);
    objc_msgSend(v3, "diagram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentPoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v6 & 1) != 0)
      v11 = -1;
    else
      v11 = 1;
    v12 = TSURectWithCenterAndSize((float)((float)v11 * 1.4), 0.0, 2.0);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v19, v3, v12, v14, v16, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v10, v21, v3);
    v22 = TSURectWithCenterAndSize(0.0, (double)v11 * v34, 1.20000001);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.35, 0.2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 & 1) != 0)
      *(float *)&v30 = 0.0;
    else
      *(float *)&v30 = 180.0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v29, v3, v22, v24, v26, v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siblingTransition");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v32, v31, v3);

    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);

  return 1;
}

@end
