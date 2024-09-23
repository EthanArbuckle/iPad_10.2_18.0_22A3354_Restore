@implementation ODIVenn1

+ (CGRect)mapGSpaceWithState:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  float v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(a1, "nodeCountWithState:", v4);
  v6 = v5;
  v7 = -180.0;
  if (v5 != 2)
    v7 = -90.0;
  v8 = ODIRegularPolygonBounds(v5, 1.0, v7);
  if (v6 < 5)
    v20 = CGRectInset(*(CGRect *)&v8, -1.20000005, -1.20000005);
  else
    v20 = CGRectInset(*(CGRect *)&v8, -0.300000012, -0.180000007);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  float v12;
  __float2 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  float v35;
  __float2 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  id v46;

  v46 = a3;
  v8 = a5;
  v9 = objc_msgSend(a1, "nodeCountWithState:", v8);
  v10 = a4 + 1;
  if (v9 < 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circ%d"), a4 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresentationName:forPointType:", v11, 2);
    v35 = -(dbl_22A4BEA30[v9 == 2] - (double)a4 * (6.28318531 / (double)v9));
    v36 = __sincosf_stret(v35);
    v37 = TSURectWithCenterAndSize(v36.__cosval, v36.__sinval, 2.4000001);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v44, v8, v37, v39, v41, v43, v45);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v46, v23, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circ%dTx"), a4 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresentationName:forPointType:", v11, 2);
    v12 = (double)a4 * (6.28318531 / (double)v9) + -1.57079633;
    v13 = __sincosf_stret(v12);
    v14 = TSURectWithCenterAndSize(v13.__cosval, v13.__sinval, 0.600000024);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v21, v8, v14, v16, v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v46, v23, v8);
    objc_msgSend(v46, "setText:", 0);
    v24 = TSURectWithCenterAndSize((float)(v13.__cosval * 0.25), (float)(v13.__sinval * 0.25), 0.699999988);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v31, v8, v24, v26, v28, v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circ%d"), v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", v34, v46, v33, v8);

  }
}

@end
