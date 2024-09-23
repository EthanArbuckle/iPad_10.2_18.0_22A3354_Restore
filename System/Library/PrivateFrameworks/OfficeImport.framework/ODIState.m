@implementation ODIState

- (ODIState)initWithDiagram:(id)a3 group:(id)a4 drawingTheme:(id)a5
{
  id v9;
  id v10;
  id v11;
  ODIState *v12;
  ODIState *v13;
  ODIState *v14;
  uint64_t v15;
  OADOrientedBounds *mDiagramOrientedBounds;
  NSMutableArray *v17;
  NSMutableArray *mPresentationNames;
  int v19;
  NSMutableArray *v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *mDefaultStyleLabelNames;
  NSMutableArray *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)ODIState;
  v12 = -[ODIState init](&v31, sel_init);
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mDiagram, a3);
    objc_storeStrong((id *)&v13->mGroup, a4);
    objc_storeStrong((id *)&v13->mDrawingTheme, a5);
    +[OAITOrientedBounds absoluteOrientedBoundsOfDrawable:](OAITOrientedBounds, "absoluteOrientedBoundsOfDrawable:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    mDiagramOrientedBounds = v14->mDiagramOrientedBounds;
    v14->mDiagramOrientedBounds = (OADOrientedBounds *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mPresentationNames = v14->mPresentationNames;
    v14->mPresentationNames = v17;

    v19 = 6;
    do
    {
      v20 = v14->mPresentationNames;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v20, "addObject:", v21);

      --v19;
    }
    while (v19);
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mDefaultStyleLabelNames = v14->mDefaultStyleLabelNames;
    v14->mDefaultStyleLabelNames = v22;

    -[NSMutableArray addObject:](v14->mDefaultStyleLabelNames, "addObject:", CFSTR("asst0"));
    v24 = v14->mDefaultStyleLabelNames;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v24, "addObject:", v25);

    -[NSMutableArray addObject:](v14->mDefaultStyleLabelNames, "addObject:", CFSTR("node1"));
    -[NSMutableArray addObject:](v14->mDefaultStyleLabelNames, "addObject:", CFSTR("parChTrans2D1"));
    v26 = v14->mDefaultStyleLabelNames;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v26, "addObject:", v27);

    -[NSMutableArray addObject:](v14->mDefaultStyleLabelNames, "addObject:", CFSTR("sibTrans2D1"));
    v28 = v14->mDefaultStyleLabelNames;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v28, "addObject:", v29);

  }
  return v14;
}

- (id)diagram
{
  return self->mDiagram;
}

- (id)diagramOrientedBounds
{
  return self->mDiagramOrientedBounds;
}

- (CGRect)logicalBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mLogicalBounds.origin.x;
  y = self->mLogicalBounds.origin.y;
  width = self->mLogicalBounds.size.width;
  height = self->mLogicalBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLogicalBounds:(CGRect)a3 maintainAspectRatio:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  CGFloat v15;
  float v16;
  double v17;
  float v18;
  double v19;
  CGFloat v20;
  double v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    +[ODIDrawable sizeOfDiagram:](ODIDrawable, "sizeOfDiagram:", self->mDiagram);
    v11 = v10 / v9;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v12 = CGRectGetHeight(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v13 = v12 / CGRectGetWidth(v24);
    v14 = v11;
    if (v11 >= v13)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v17 = CGRectGetWidth(v27);
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v18 = -(CGRectGetHeight(v28) - v17 * v14);
      y = y + (float)(v18 * -0.5);
      height = height + v18;
    }
    else
    {
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v15 = CGRectGetHeight(v25) / v14;
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v16 = v15 - CGRectGetWidth(v26);
      x = x + (float)(v16 * -0.5);
      width = width + v16;
    }
  }
  self->mLogicalBounds.origin.x = x;
  self->mLogicalBounds.origin.y = y;
  self->mLogicalBounds.size.width = width;
  self->mLogicalBounds.size.height = height;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v19 = CGRectGetHeight(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v20 = CGRectGetWidth(v30);
  if (v19 >= v20)
    v20 = v19;
  v21 = floor(log10(v20));
  if (v21 < 4.0)
    v21 = 4.0;
  v22 = llround(__exp10(v21));
  self->mScale = (double)v22;
  -[OADGroup setLogicalBounds:](self->mGroup, "setLogicalBounds:", self->mLogicalBounds.origin.x * (double)v22, self->mLogicalBounds.origin.y * (double)v22, self->mLogicalBounds.size.width * (double)v22, self->mLogicalBounds.size.height * (double)v22);
}

- (double)scale
{
  return self->mScale;
}

- (void)setLogicalBounds:(CGRect)a3
{
  -[ODIState setLogicalBounds:maintainAspectRatio:](self, "setLogicalBounds:maintainAspectRatio:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)group
{
  return self->mGroup;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->mGroup, a3);
}

- (id)presentationNameForPointType:(int)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->mPresentationNames, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setPresentationName:(id)a3 forPointType:(int)a4
{
  id v6;
  NSMutableArray *mPresentationNames;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  mPresentationNames = self->mPresentationNames;
  v8 = v6;
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableArray replaceObjectAtIndex:withObject:](mPresentationNames, "replaceObjectAtIndex:withObject:", a4, v8);
  v9 = v10;
  if (!v10)
  {

    v9 = 0;
  }

}

- (id)defaultStyleLabelNameForPointType:(int)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->mDefaultStyleLabelNames, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setDefaultStyleLabelName:(id)a3 forPointType:(int)a4
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->mDefaultStyleLabelNames, "replaceObjectAtIndex:withObject:", a4, a3);
}

- (int)pointCount
{
  return self->mPointCount;
}

- (void)setPointCount:(int)a3
{
  self->mPointCount = a3;
}

- (int)pointIndex
{
  return self->mPointIndex;
}

- (void)setPointIndex:(int)a3
{
  self->mPointIndex = a3;
}

- (id)textStyle
{
  return self->mTextStyle;
}

- (void)setTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->mTextStyle, a3);
}

- (id)drawingTheme
{
  return self->mDrawingTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingTheme, 0);
  objc_storeStrong((id *)&self->mTextStyle, 0);
  objc_storeStrong((id *)&self->mDefaultStyleLabelNames, 0);
  objc_storeStrong((id *)&self->mPresentationNames, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
  objc_storeStrong((id *)&self->mDiagramOrientedBounds, 0);
  objc_storeStrong((id *)&self->mDiagram, 0);
}

@end
