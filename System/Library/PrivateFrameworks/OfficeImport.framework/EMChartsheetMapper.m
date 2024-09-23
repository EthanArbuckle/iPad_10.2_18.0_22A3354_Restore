@implementation EMChartsheetMapper

- (EMChartsheetMapper)initWithChartSheet:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  EMChartsheetMapper *v9;
  EMChartsheetMapper *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;

  v7 = a3;
  v8 = a4;
  v9 = -[CMMapper initWithParent:](self, "initWithParent:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mChartSheet, a3);
    if (objc_msgSend(v7, "areBoundsSet"))
    {
      objc_msgSend(v7, "bounds");
      v10->mBox.origin.x = v11;
      v10->mBox.origin.y = v12;
      v10->mBox.size.width = v13;
      v10->mBox.size.height = v14;
    }
  }

  return v10;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  EMDrawableMapper *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[EDChartSheet mainChart](self->mChartSheet, "mainChart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[EDChartSheet bounds](self->mChartSheet, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = v8;
    if (v13 == 0.0 && v8 == 0.0)
    {
      objc_msgSend(v7, "clientData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "anchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "position");
        v10 = v18;
        v12 = v19;
        objc_msgSend(v17, "size");
        v14 = v20;
        v15 = v21;
      }

    }
    v22 = -[EMDrawableMapper initWithChartDrawable:box:parent:]([EMDrawableMapper alloc], "initWithChartDrawable:box:parent:", v7, self, v10, v12, v14, v15);
    -[EMDrawableMapper mapAt:withState:](v22, "mapAt:withState:", v23, v6);

  }
}

- (int)width
{
  return (int)self->mBox.size.width;
}

- (int)preprocessWidthWithState:(id)a3
{
  double width;

  width = self->mBox.size.width;
  if (width <= 0.0)
    return (int)980.0;
  return (int)width;
}

- (int)preprocessHeightWithState:(id)a3
{
  double height;

  height = self->mBox.size.height;
  if (height <= 0.0)
    return (int)600.0;
  return (int)height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChartSheet, 0);
}

@end
