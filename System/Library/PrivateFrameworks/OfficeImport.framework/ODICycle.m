@implementation ODICycle

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  __objc2_class **v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cycle1")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("cycle2")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("cycle8")) & 1) != 0)
  {
    v7 = off_24F3993B8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cycle3")) & 1) != 0)
  {
    v7 = off_24F3993C0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cycle4")) & 1) != 0)
  {
    v7 = off_24F3993C8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cycle5")) & 1) != 0)
  {
    v7 = off_24F3993D0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cycle6")) & 1) != 0)
  {
    v7 = off_24F3993D8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cycle7")) & 1) != 0)
  {
    v7 = off_24F3993E0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("chart3")) & 1) != 0)
  {
    v7 = off_24F3993B0;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("gear1")))
    {
      v8 = 0;
      goto LABEL_6;
    }
    v7 = off_24F3993E8;
  }
  -[__objc2_class mapWithState:](*v7, "mapWithState:", v6);
  v8 = 1;
LABEL_6:

  return v8;
}

+ (void)mapWithState:(id)a3
{
  unint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(a1, "nodeCountWithState:");
  objc_msgSend(v13, "setPointCount:", v4);
  if (v4 == 2)
  {
    v5 = objc_msgSend(a1, "map2NodeWithState:", v13);
LABEL_5:
    if ((v5 & 1) != 0)
      goto LABEL_10;
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    v5 = objc_msgSend(a1, "map1NodeWithState:", v13);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(a1, "mapGSpaceWithState:", v13);
  objc_msgSend(v13, "setLogicalBounds:");
  objc_msgSend(v13, "diagram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPointIndex:", v10);
      objc_msgSend(a1, "mapNode:index:state:", v11, v10, v13);
      objc_msgSend(v11, "siblingTransition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "mapTransition:index:state:", v12, v10, v13);

      v9 = (v10 + 1);
      v10 = v9;
    }
    while (v4 > v9);
  }

LABEL_10:
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

+ (CGSize)nodeSizeWithState:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGRect)boundingBoxWithIsTight:(BOOL)a3 state:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  v6 = a4;
  if (a3)
    v7 = ODIRegularPolygonBounds(objc_msgSend(a1, "nodeCountWithState:", v6), 1.0, -90.0);
  else
    v7 = TSURectWithCenterAndSize(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 2.0);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  objc_msgSend(a1, "nodeSizeWithState:", v6);
  v16 = v15 * -0.5;
  v18 = v17 * -0.5;
  v27.origin.x = v11;
  v27.origin.y = v12;
  v27.size.width = v13;
  v27.size.height = v14;
  v28 = CGRectInset(v27, v16, v18);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (CGRect)nodeBoundsWithIndex:(unsigned int)a3 state:(id)a4
{
  id v6;
  unint64_t v7;
  double v8;
  double v9;
  __float2 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v6 = a4;
  v7 = objc_msgSend(a1, "nodeCountWithState:", v6);
  objc_msgSend(a1, "nodeSizeWithState:", v6);
  v9 = v8;
  *(float *)&v8 = (double)(2 * a3) * 3.14159265 / (double)v7 + -1.57079633;
  v10 = __sincosf_stret(*(float *)&v8);
  v11 = TSURectWithCenterAndSize(v10.__cosval, v10.__sinval, v9);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
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

+ (BOOL)map1NodeWithState:(id)a3
{
  return 0;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  return 0;
}

@end
