@implementation ODIArrow

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  int v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("arrow1")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("arrow6")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("arrow5"));
    v7 = 0;
    v8 = 0;
    if (!v10)
      goto LABEL_5;
  }
  +[ODIArrow mapWithState:outward:](ODIArrow, "mapWithState:outward:", v6, v7);
  v8 = 1;
LABEL_5:

  return v8;
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

+ (void)mapWithState:(id)a3 outward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  int v28;
  void *v29;
  long double v30;
  double v31;
  float v32;
  float v33;
  unint64_t v34;
  float v35;
  float v36;
  unint64_t v37;
  float v38;
  double v39;
  float v40;
  float v41;
  float v42;
  double v43;
  double v44;
  float v45;
  float v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  double v53;
  float v54;
  float v55;
  uint64_t v56;
  unsigned int i;
  void *v58;
  float v59;
  __double2 v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  float v71;
  float v72;
  float v73;
  double tx;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(a1, "nodeCountWithState:", v6);
  objc_msgSend(v6, "diagram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 2)
  {
    objc_msgSend(v6, "setLogicalBounds:", TSURectWithCenterAndSize(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 2.0999999));
    v15 = 0;
    v16 = 1;
    do
    {
      v17 = v16;
      objc_msgSend(v10, "objectAtIndex:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = TSURectWithCenterAndSize((float)((float)(2 * v15 - 1) * 0.55), 0.0, 1.0);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 180 * (v15 ^ 1);
      if (v4)
        *(float *)&v27 = (float)v28;
      else
        *(float *)&v27 = (float)v28 + 180.0;
      +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v26, v6, v19, v21, v23, v25, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v18, v29, v6);

      v16 = 0;
      v15 = 1;
    }
    while ((v17 & 1) != 0);
  }
  else if (v7 == 1)
  {
    objc_msgSend(v6, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
    +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      *(float *)&v12 = -90.0;
    else
      *(float *)&v12 = 90.0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v11, v6, 0.0, 0.0, 1.0, 1.0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v14, v13, v6);

  }
  else
  {
    v30 = tan(2.82743331 / (double)v7);
    v31 = v30 + v30;
    if (v4)
    {
      v32 = 0.5 / v31;
      v33 = 1.0 / v31 + -0.649999976;
      if (v32 >= v33)
        v33 = v32;
    }
    else
    {
      v33 = 1.0 / v31 + -0.349999994;
    }
    v71 = v33;
    if (v7)
    {
      LODWORD(v34) = 0;
      tx = v33;
      v35 = 0.33;
      if (v4)
        v35 = 0.5;
      v73 = v35;
      v36 = 0.66;
      if (!v4)
        v36 = 0.5;
      v72 = v36;
      v37 = v7 - 3;
      v38 = 0.0;
      v39 = -0.5;
      v40 = 0.0;
      do
      {
        v41 = ((float)((float)((float)v34 + (float)v34) / (float)v7) + v39) * 3.14159265;
        memset(&v79, 0, sizeof(v79));
        CGAffineTransformMakeTranslation(&v79, tx, 0.0);
        memset(&v78, 0, sizeof(v78));
        CGAffineTransformMakeRotation(&v78, v41);
        t1 = v79;
        memset(&v77, 0, sizeof(v77));
        t2 = v78;
        CGAffineTransformConcat(&v77, &t1, &t2);
        v42 = 0.0;
        if (v37 <= 3)
          v42 = flt_22A4BE7C0[v37];
        v43 = v42;
        v44 = (v77.tx + v77.a + v77.c * 0.0) * (float)(1.0 - v42);
        v45 = v44 + v43 * (v77.tx + v77.a + v77.c * 0.25);
        if (v38 >= v45)
          v45 = v38;
        v46 = v44 + v43 * (v77.tx + v77.a - v77.c * 0.25);
        if (v45 >= v46)
          v38 = v45;
        else
          v38 = v46;
        if (v7 == 7)
        {
          v47 = v73;
          v39 = -0.5;
        }
        else
        {
          v47 = 0.0;
          v39 = -0.5;
          if (v7 == 5)
            v47 = v72;
        }
        v48 = v77.ty + v77.d * v39 + v77.b * 0.649999976;
        v49 = v47;
        v50 = (v77.ty + v77.b + v77.d * 0.0) * (float)(1.0 - v47);
        v51 = v50 + v47 * (v77.ty + v77.b + v77.d * 0.25);
        if (v7 == 3)
          v51 = v77.ty + v77.d * 0.5 + v77.b * 0.649999976;
        v52 = v51;
        v53 = v50 + v49 * (v77.ty + v77.b - v77.d * 0.25);
        if (v7 != 3)
          v48 = v53;
        if (v40 >= v52)
          v54 = v40;
        else
          v54 = v52;
        v55 = v48;
        if (v54 >= v55)
          v40 = v54;
        else
          v40 = v55;
        v34 = (v34 + 1);
      }
      while (v7 > v34);
    }
    else
    {
      v40 = 0.0;
      v38 = 0.0;
    }
    objc_msgSend(v6, "setLogicalBounds:", (float)-v38, (float)-(float)(v71 + 1.0), (float)(v38 + v38), (float)((float)(v71 + 1.0) + v40));
    if (v7)
    {
      v56 = 0;
      for (i = 0; i < v7; v56 = ++i)
      {
        objc_msgSend(v10, "objectAtIndex:", v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (double)i * 360.0 / (double)v7 + -90.0;
        v60 = __sincos_stret(v59 * 3.14159265 / 180.0);
        v61 = TSURectWithCenterAndSize(v60.__cosval * (float)(v71 + 0.5), v60.__sinval * (float)(v71 + 0.5), 1.0);
        v63 = v62;
        v65 = v64;
        v67 = v66;
        +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.349999994, 0.25);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          *(float *)&v69 = (double)i * 360.0 / (double)v7 + -90.0;
        else
          *(float *)&v69 = v59 + 180.0;
        +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v68, v6, v61, v63, v65, v67, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v58, v70, v6);

      }
    }
  }

}

@end
