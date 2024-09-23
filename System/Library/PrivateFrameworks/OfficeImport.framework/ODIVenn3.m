@implementation ODIVenn3

+ (CGRect)mapGSpaceWithState:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = (float)((float)((float)(unint64_t)(objc_msgSend(a1, "nodeCountWithState:", a3) - 1) * 1.6) + 2.0);
  v4 = 0.0;
  v5 = 0.0;
  v6 = 2.0;
  result.size.height = v6;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a5;
  v8 = TSURectWithCenterAndSize((float)((float)((float)a4 * 1.6) + 1.0), 1.0, 2.0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v15, v7, v8, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v18, v17, v7);
}

@end
