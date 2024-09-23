@implementation ODICycle5

+ (CGSize)nodeSizeWithState:(id)a3
{
  long double v3;
  float v4;
  double v5;
  double v6;
  CGSize result;

  v3 = sin(3.14159265 / (double)(unint64_t)objc_msgSend(a1, "nodeCountWithState:", a3));
  *(float *)&v3 = (v3 + v3) * 0.6;
  v4 = *(float *)&v3 * 0.7;
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

  objc_msgSend(a1, "boundingBoxWithIsTight:state:", 0, a3);
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

+ (float)normalizedAngle:(float)a3
{
  return (float)((float)(a3 / 360.0) - floorf(a3 / 360.0)) * 360.0;
}

+ (void)addShapeForTransition:(id)a3 startAngle:(float)a4 endAngle:(float)a5 state:(id)a6
{
  id v10;
  id v11;
  double v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  OITSUBezierPath *v26;
  void *v27;
  double v28;
  void *v29;
  CGAffineTransform v30;

  v10 = a3;
  v11 = a6;
  *(float *)&v12 = a4;
  objc_msgSend(a1, "normalizedAngle:", v12);
  v14 = v13;
  *(float *)&v15 = a5;
  objc_msgSend(a1, "normalizedAngle:", v15);
  if (v16 >= v14)
    v17 = v16;
  else
    v17 = v16 + 360.0;
  v18 = (double *)MEMORY[0x24BDBEFB0];
  v19 = TSURectWithCenterAndSize(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 2.0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = objc_alloc_init(OITSUBezierPath);
  CGAffineTransformMakeRotation(&v30, v14 * 3.14159265 / 180.0);
  -[OITSUBezierPath moveToPoint:](v26, "moveToPoint:", vaddq_f64(*(float64x2_t *)&v30.tx, vaddq_f64(*(float64x2_t *)&v30.a, vmulq_f64(*(float64x2_t *)&v30.c, (float64x2_t)0))));
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](v26, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v17 < v14, *v18, v18[1], 1.0, v14, v17);
  +[ODIDrawable shapeGeometryForBezierPath:gSpace:](ODIDrawable, "shapeGeometryForBezierPath:gSpace:", v26, v19, v21, v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v27, v11, v19, v21, v23, v25, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapStyleForTransition:shape:state:", v10, v29, v11);

}

+ (void)mapStyleForTransition:(id)a3 shape:(id)a4 state:(id)a5
{
  +[ODIDrawable map1dArrowStyleFromPoint:shape:state:](ODIDrawable, "map1dArrowStyleFromPoint:shape:state:", a3, a4, a5);
}

+ (float)intersectionAngleNextToAngle:(float)a3 isAfter:(BOOL)a4 state:(id)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __double2 v16;
  uint64_t v17;
  int v18;
  float v19;
  float v20;
  float v21;
  double v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  float v29;
  uint64_t v30;
  float v31;
  float v32;
  char v33;
  char v34;
  float v35;
  float v36;
  double v37;
  uint64_t v38;
  char v39;
  char v40;
  float v41;
  _BOOL4 v42;
  float v43;
  float v44;
  _BOOL4 v46;
  void *v47;
  int v48;
  _DWORD v49[4];
  _QWORD v50[2];

  v5 = a4;
  v50[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v50[0] = 0;
  *(float *)&v9 = a3;
  objc_msgSend(a1, "normalizedAngle:", v9);
  v11 = v10;
  v46 = v5;
  v47 = v8;
  objc_msgSend(a1, "nodeSizeWithState:", v8);
  v13 = v12;
  v15 = v14;
  v16 = __sincos_stret(v11 * 3.14159265 / 180.0);
  v17 = 0;
  v18 = 0;
  v19 = v16.__cosval - v13 * 0.5;
  v20 = v16.__sinval - v15 * 0.5;
  v21 = v16.__cosval + v13 * 0.5;
  v22 = v16.__sinval + v15 * 0.5;
  *(float *)&v22 = v22;
  *(float *)v49 = v19;
  *(float *)&v49[1] = v20;
  v23 = 1;
  *(float *)&v49[2] = v21;
  v49[3] = LODWORD(v22);
  do
  {
    v24 = 0;
    v48 = *((_DWORD *)&qword_22A4BE918 + v17);
    v25 = v23 & 1;
    if ((v23 & 1) != 0)
      v26 = 3;
    else
      v26 = 2;
    v27 = 1;
    do
    {
      v28 = v27;
      v29 = *(float *)&v49[2 * *((_DWORD *)&qword_22A4BE918 + v24) + v48];
      if (fabsf(v29) <= 1.0)
      {
        v30 = 0;
        v31 = sqrtf(1.0 - (float)(v29 * v29));
        v32 = *(float *)&v49[v25];
        v33 = 1;
        do
        {
          v34 = v33;
          v35 = v31 * (float)*((int *)&unk_22A4BE760 + v30);
          if (v35 > v32 && v35 < *(float *)&v49[v26])
          {
            if ((_DWORD)v25)
              v36 = v29;
            else
              v36 = v31 * (float)*((int *)&unk_22A4BE760 + v30);
            if (!(_DWORD)v25)
              v35 = v29;
            v37 = (float)(atan2f(v35, v36) * 180.0) / 3.14159265;
            *(float *)&v37 = v37;
            objc_msgSend(a1, "normalizedAngle:", v37);
            *((_DWORD *)v50 + v18++) = LODWORD(v22);
          }
          v33 = 0;
          v30 = 1;
        }
        while ((v34 & 1) != 0);
      }
      v27 = 0;
      v24 = 1;
    }
    while ((v28 & 1) != 0);
    v23 = 0;
    v17 = 1;
  }
  while ((v25 & 1) != 0);
  v38 = 0;
  LODWORD(v22) = 1135869952;
  if (!v46)
    *(float *)&v22 = 0.0;
  v39 = 1;
  do
  {
    v40 = v39;
    v41 = *((float *)v50 + v38) - v11;
    if (v41 < 0.0)
      v41 = v41 + 360.0;
    v42 = v41 >= *(float *)&v22;
    if (!v46)
      v42 = v41 <= *(float *)&v22;
    if (!v42)
      *(float *)&v22 = v41;
    v38 = 1;
    v39 = 0;
  }
  while ((v40 & 1) != 0);
  *(float *)&v22 = v11 + *(float *)&v22;
  objc_msgSend(a1, "normalizedAngle:", v22);
  v44 = v43;

  return v44;
}

+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v8;
  double v9;
  double v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  float v16;
  id v17;

  v17 = a3;
  v8 = a5;
  v9 = (double)(unint64_t)objc_msgSend(a1, "nodeCountWithState:", v8);
  v10 = (double)a4 * 360.0 / v9 + -90.0;
  *(float *)&v10 = v10;
  objc_msgSend(a1, "intersectionAngleNextToAngle:isAfter:state:", 1, v8, v10);
  v12 = v11;
  v13 = (double)(a4 + 1) * 360.0 / v9 + -90.0;
  *(float *)&v13 = v13;
  objc_msgSend(a1, "intersectionAngleNextToAngle:isAfter:state:", 0, v8, v13);
  if (*(float *)&v14 < v12)
    *(float *)&v14 = *(float *)&v14 + 360.0;
  v16 = (float)(v12 + *(float *)&v14) * 0.5;
  *(float *)&v15 = (float)((float)(*(float *)&v14 - v12) * 0.7) * 0.5;
  *(float *)&v14 = v16 - *(float *)&v15;
  *(float *)&v15 = v16 + *(float *)&v15;
  objc_msgSend(a1, "addShapeForTransition:startAngle:endAngle:state:", v17, v8, v14, v15);

}

+ (BOOL)map1NodeWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "setLogicalBounds:", 0.0, 0.0, 1.0, 0.699999988);
  objc_msgSend(v4, "diagram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v8, v4, 0.0, 0.0, 1.0, 0.699999988);
  return 1;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  return 0;
}

@end
