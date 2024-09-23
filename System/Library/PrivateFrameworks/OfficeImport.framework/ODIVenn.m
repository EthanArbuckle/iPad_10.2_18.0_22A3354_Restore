@implementation ODIVenn

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  __objc2_class **v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("venn1")) & 1) != 0)
  {
    v7 = off_24F3993F0;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("venn3")))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = off_24F3993F8;
  }
  -[__objc2_class mapWithState:](*v7, "mapWithState:", v6);
  v8 = 1;
LABEL_7:

  return v8;
}

+ (void)mapWithState:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(a1, "nodeCountWithState:");
  objc_msgSend(v15, "diagram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 1)
  {
    objc_msgSend(v15, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
    +[ODIDrawable shapeGeometryForEllipse](ODIDrawable, "shapeGeometryForEllipse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v8, v15, 0.0, 0.0, 1.0, 1.0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v11, v10, v15);

  }
  else
  {
    objc_msgSend(a1, "mapGSpaceWithState:", v15);
    objc_msgSend(v15, "setLogicalBounds:");
    if (v4)
    {
      v12 = 0;
      v13 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "mapNode:index:state:", v14, v13, v15);

        v12 = (v13 + 1);
        v13 = v12;
      }
      while (v4 > v12);
    }
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

+ (CGRect)mapGSpaceWithState:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
