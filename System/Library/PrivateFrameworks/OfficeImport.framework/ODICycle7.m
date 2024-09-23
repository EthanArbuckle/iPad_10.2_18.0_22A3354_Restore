@implementation ODICycle7

+ (CGSize)nodeSizeWithState:(id)a3
{
  long double v3;
  float v4;
  double v5;
  double v6;
  CGSize result;

  v3 = sin(3.14159265 / (double)(unint64_t)objc_msgSend(a1, "nodeCountWithState:", a3));
  *(float *)&v3 = (v3 + v3) * 0.6;
  v4 = *(float *)&v3 * 0.5;
  v5 = *(float *)&v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
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

+ (void)addShapeForNode:(id)a3 relativeBounds:(CGRect)a4 state:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v10 = a5;
  LODWORD(v11) = 1045220557;
  +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:](ODIDrawable, "shapeGeometryForRoundedRectangleWithRadius:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v12, v10, x, y, width, height, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v15, v14, v10);

}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v8 = a5;
  objc_msgSend(a1, "nodeBoundsWithIndex:state:", v6, v8);
  objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v9, v8);

}

+ (void)addShapeForTransition:(id)a3 relativeBounds:(CGRect)a4 rotation:(float)a5 state:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v12 = a6;
  +[ODIDrawable shapeGeometryForDoubleArrowWithControlPoint:](ODIDrawable, "shapeGeometryForDoubleArrowWithControlPoint:", 0.1, 0.15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a5;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, v12, x, y, width, height, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v16, v15, v12);

}

+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v8;
  unint64_t v9;
  float v10;
  __double2 v11;
  float cosval;
  __float2 v13;
  float v14;
  id v15;

  v15 = a3;
  v8 = a5;
  v9 = objc_msgSend(a1, "nodeCountWithState:", v8);
  v10 = (double)((2 * a4) | 1) * 3.14159265 / (double)v9 + -1.57079633;
  v11 = __sincos_stret(3.14159265 / (double)v9);
  cosval = v11.__cosval;
  v13 = __sincosf_stret(v10);
  v14 = (v11.__sinval + v11.__sinval) * 0.4;
  objc_msgSend(a1, "addShapeForTransition:relativeBounds:rotation:state:", v15, v8, TSURectWithCenterAndSize((float)(v13.__cosval * cosval), (float)(v13.__sinval * cosval), v14));

}

+ (BOOL)map1NodeWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "setLogicalBounds:", 0.0, 0.0, 1.0, 0.5);
  objc_msgSend(v4, "diagram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v8, v4, 0.0, 0.0, 1.0, 0.5);
  return 1;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  id v4;
  double *v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;

  v4 = a3;
  v5 = (double *)MEMORY[0x24BDBEFB0];
  objc_msgSend(v4, "setLogicalBounds:", TSURectWithCenterAndSize(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0));
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    objc_msgSend(v4, "setPointIndex:", v6);
    objc_msgSend(v4, "diagram");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentPoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v8 & 1) != 0)
      v13 = -0.625;
    else
      v13 = 0.625;
    objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v12, v4, TSURectWithCenterAndSize(0.0, v13, 1.0));
    v14 = TSURectWithCenterAndSize(*v5, v5[1], 0.5625);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "siblingTransition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
      *(float *)&v22 = 90.0;
    else
      *(float *)&v22 = 270.0;
    objc_msgSend(a1, "addShapeForTransition:relativeBounds:rotation:state:", v21, v4, v14, v16, v18, v20, v22);

    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);

  return 1;
}

@end
