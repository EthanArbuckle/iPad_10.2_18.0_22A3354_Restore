@implementation ODIHorizonalList3

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  ODITitlePoint *v8;
  ODITitlePoint *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("hList3")))
  {
    v8 = (ODITitlePoint *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("matrix1")))
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("radial1")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("radial3")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("radial4")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("radial5")) & 1) == 0
      && !objc_msgSend(v6, "isEqualToString:", CFSTR("radial6")))
    {
      v10 = 0;
      v9 = 0;
      goto LABEL_14;
    }
    v8 = -[ODITitlePoint initWithTitlePointPresentationName:state:]([ODITitlePoint alloc], "initWithTitlePointPresentationName:state:", CFSTR("centerShape"), v7);
LABEL_12:
    v9 = v8;
    if (!v8)
      goto LABEL_13;
    goto LABEL_5;
  }
  v9 = -[ODITitlePoint initWithTitlePointPresentationName:state:]([ODITitlePoint alloc], "initWithTitlePointPresentationName:state:", CFSTR("centerTile"), v7);
  -[ODIHorizonalList3 setMaxPointCount:](v9, "setMaxPointCount:", 4);
  if (!v9)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
LABEL_5:
  -[ODIHorizonalList3 map](v9, "map");
  v10 = 1;
LABEL_14:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mState, 0);
}

- (ODIHorizonalList3)initWithState:(id)a3
{
  id v5;
  ODIHorizonalList3 *v6;
  ODIHorizonalList3 *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ODIHorizonalList3;
  v6 = -[ODIHorizonalList3 init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mMaxPointCount = -1;
    objc_storeStrong((id *)&v6->mState, a3);
  }

  return v7;
}

- (void)setMaxPointCount:(unsigned int)a3
{
  self->mMaxPointCount = a3;
}

- (void)map
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  CGFloat v13;
  void *v14;
  double v15;
  void *v16;
  double MaxY;
  void *v18;
  float v19;
  double v20;
  void *v21;
  id v22;
  CGRect v23;

  -[ODIState diagram](self->mState, "diagram");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "documentPoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODIDrawable sizeOfDiagram:](ODIDrawable, "sizeOfDiagram:", v22);
    v8 = v7 / v6;
    -[ODIState setLogicalBounds:maintainAspectRatio:](self->mState, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, v8);
    -[ODIState setPresentationName:forPointType:](self->mState, "setPresentationName:forPointType:", CFSTR("roof"), 2);
    +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v9, self->mState, 0.0, 0.0, 1.0, (float)(v8 * 0.29), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ODIHorizonalList3 mapRoofStyleFromPoint:shape:](self, "mapRoofStyleFromPoint:shape:", v5, v11);
    +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v5, v11, 1, 0, self->mState);
    objc_msgSend(v5, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v13 = 1.0;
      -[ODIHorizonalList3 mapPillarPoints:bounds:](self, "mapPillarPoints:bounds:", v12, 0.0, (float)((float)(v8 * 0.29) + 0.003), 1.0, (float)(v8 * 0.62));
    }
    else
    {
      +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1.0;
      LODWORD(v15) = 0;
      +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v14, self->mState, 0.0, (float)((float)(v8 * 0.29) + 0.003), 1.0, (float)(v8 * 0.62), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[ODIHorizonalList3 mapOnePillarStyleFromPoint:shape:](self, "mapOnePillarStyleFromPoint:shape:", v3, v16);
    }
    v23.origin.x = 0.0;
    v23.origin.y = (float)((float)(v8 * 0.29) + 0.003);
    v23.size.width = v13;
    v23.size.height = (float)(v8 * 0.62);
    MaxY = CGRectGetMaxY(v23);
    +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MaxY + 0.00300000003;
    LODWORD(v20) = 0;
    +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v18, self->mState, 0.0, v19, 1.0, (float)(v8 - v19), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[ODIHorizonalList3 mapBaseStyleFromPoint:shape:](self, "mapBaseStyleFromPoint:shape:", v3, v21);
  }

}

- (void)mapPillarPoints:(id)a3 bounds:(CGRect)a4
{
  double height;
  double y;
  double x;
  unsigned int v8;
  unsigned int mMaxPointCount;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v8 = objc_msgSend(v17, "count");
  mMaxPointCount = self->mMaxPointCount;
  if (mMaxPointCount >= v8)
    v10 = v8;
  else
    v10 = mMaxPointCount;
  -[ODIState setPresentationName:forPointType:](self->mState, "setPresentationName:forPointType:", 0, 2);
  if ((_DWORD)v10)
  {
    v11 = 0;
    v12 = 0.00300000003;
    do
    {
      objc_msgSend(v17, "objectAtIndex:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = 0;
      +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v14, self->mState, x, y, (float)((float)((float)((float)(v10 - 1) * -0.003) + 1.0) / (float)v10), height, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v13, v16, self->mState);
      +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v13, v16, 1, 1, self->mState);
      x = (float)((float)((float)((float)(v10 - 1) * -0.003) + 1.0) / (float)v10)
        + 0.00300000003
        + x;

      ++v11;
    }
    while (v10 != v11);
  }

}

- (void)mapRoofStyleFromPoint:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", a3, a4, self->mState);
}

- (void)mapOnePillarStyleFromPoint:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("onePillar"), a3, a4, self->mState);
}

- (void)mapBaseStyleFromPoint:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", CFSTR("base"), a3, a4, self->mState);
}

@end
