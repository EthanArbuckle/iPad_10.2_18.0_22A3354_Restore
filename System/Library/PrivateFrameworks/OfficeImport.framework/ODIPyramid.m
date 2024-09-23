@implementation ODIPyramid

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "verticalFlipWithState:", v7);
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("pyramid1")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("pyramid2")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("pyramid4")))
  {
    v8 = v8 ^ 1;
  }
  else if (!objc_msgSend(v6, "isEqualToString:", CFSTR("pyramid3")))
  {
    v9 = 0;
    goto LABEL_6;
  }
  +[ODIPyramid mapWithState:apexUp:](ODIPyramid, "mapWithState:apexUp:", v7, v8);
  v9 = 1;
LABEL_6:

  return v9;
}

+ (void)addTrapezoidForNode:(id)a3 top:(float)a4 height:(float)a5 topBase:(float)a6 bottomBase:(float)a7 state:(id)a8
{
  id v13;
  OITSUBezierPath *v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  id v24;

  v24 = a3;
  v13 = a8;
  v14 = objc_alloc_init(OITSUBezierPath);
  v15 = a4;
  -[OITSUBezierPath moveToPoint:](v14, "moveToPoint:", (float)(a6 * 0.5), a4);
  v16 = (float)(a4 + a5);
  -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", (float)(a7 * 0.5), v16);
  -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", (float)(a7 * -0.5), v16);
  -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", (float)(a6 * -0.5), v15);
  -[OITSUBezierPath closePath](v14, "closePath");
  if (a6 >= a7)
    v17 = a6;
  else
    v17 = a7;
  v18 = v17;
  v19 = v17 * -0.5;
  v20 = a5;
  +[ODIDrawable shapeGeometryForBezierPath:gSpace:](ODIDrawable, "shapeGeometryForBezierPath:gSpace:", v14, v19, v15, v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v21, v13, v19, v15, v18, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v24, v23, v13);

}

+ (void)mapWithState:(id)a3 apexUp:(BOOL)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  float v12;
  unsigned int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  int v20;
  unint64_t v22;
  float v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v29 = a3;
  v6 = objc_msgSend(a1, "nodeCountWithState:");
  v7 = v6 + 1;
  objc_msgSend(v29, "setLogicalBounds:maintainAspectRatio:", 0, -1.0, 0.0, 2.0, (double)(v6 + 1));
  objc_msgSend(v29, "diagram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (v6)
    {
      v11 = 0;
      v12 = (float)v7;
      v13 = 1;
      do
      {
        objc_msgSend(v10, "objectAtIndex:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == 1)
          v19 = 0;
        else
          v19 = v13;
        *(float *)&v15 = (float)v19;
        if (v13 == 1)
          v20 = 2;
        else
          v20 = 1;
        *(float *)&v16 = (float)v20;
        *(float *)&v18 = (float)((float)(*(float *)&v15 + (float)v20) / v12) * 1.36;
        *(float *)&v17 = (float)(*(float *)&v15 / v12) * 1.36;
        objc_msgSend(a1, "addTrapezoidForNode:top:height:topBase:bottomBase:state:", v14, v29, v15, v16, v17, v18);

        v11 = v13;
      }
      while (v6 > v13++);
    }
  }
  else if (v6)
  {
    v22 = 0;
    v23 = (float)v7;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 - 1 == v22)
        *(float *)&v26 = 2.0;
      else
        *(float *)&v26 = 1.0;
      *(float *)&v25 = (float)v22;
      *(float *)&v28 = (float)(1.0 - (float)((float)(*(float *)&v26 + (float)v22) / v23)) * 1.36;
      *(float *)&v27 = (float)(1.0 - (float)((float)v22 / v23)) * 1.36;
      objc_msgSend(a1, "addTrapezoidForNode:top:height:topBase:bottomBase:state:", v24, v29, v25, v26, v27, v28);

      ++v22;
    }
    while (v6 != v22);
  }

}

+ (unint64_t)nodeCountWithState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "diagram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

+ (BOOL)verticalFlipWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int i;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;

  v3 = a3;
  objc_msgSend(v3, "diagram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; i = v8 + 1)
  {
    v8 = i;
    if (objc_msgSend(v6, "count") <= (unint64_t)i)
    {
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "objectAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertySet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("pyramid"));

    if (v12)
      break;

  }
  v13 = objc_msgSend(v10, "customVerticalFlip");

LABEL_7:
  return v13;
}

@end
