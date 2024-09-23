@implementation ODIBendingList2

+ (void)mapWithState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  float v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unsigned int v38;
  double v39;
  unint64_t v40;
  void *v41;
  id v42;

  v42 = a3;
  objc_msgSend(v42, "diagram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v38 = objc_msgSend(a1, "mapLogicalBoundsWithShapeSize:spaceSize:maxNodeCount:maxColumnCount:state:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, v42);
  objc_msgSend(v42, "diagram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "children");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 + v38 - 1;

  if (v10 >= v38)
  {
    v11 = 0;
    v12 = 0;
    v40 = v10 / v38 - 1;
    v39 = (double)(v10 / v38 * v38 - v7) * 0.5;
    if (v10 / v38 <= 1)
      v13 = 1;
    else
      v13 = v10 / v38;
    v36 = -v7;
    v37 = v13;
    v35 = 0x3FA8F5C23F7851ECLL;
    do
    {
      if (v38)
      {
        v14 = 0;
        v15 = (float)v12 * *((float *)&v35 + 1);
        v16 = v15;
        v17 = (float)(v15 + *(float *)&v35);
        v18 = v36 + v11;
        do
        {
          if (!(v18 + v14))
            break;
          objc_msgSend(v41, "objectAtIndex:", v11 + v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 == v40)
          {
            v20 = (float)((float)v14 * 1.17) + v39 * 1.16999996;
            v21 = v20;
          }
          else
          {
            v21 = (float)v14 * 1.17;
          }
          +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle", v35, v36);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v23) = 0;
          +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v22, v42, v21, v16, 1.0, 1.06999993, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v19, v24, v42);
          v25 = TSURectWithCenterAndSize((float)(v21 + 0.9), v17, 0.340000004);
          v27 = v26;
          v29 = v28;
          v31 = v30;
          +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v33) = 0;
          +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v32, v42, v25, v27, v29, v31, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("adorn"), v19, v34, v42);
          ++v14;
        }
        while (v38 != v14);
      }
      ++v12;
      v11 += v38;
    }
    while (v12 != v37);
  }

}

@end
