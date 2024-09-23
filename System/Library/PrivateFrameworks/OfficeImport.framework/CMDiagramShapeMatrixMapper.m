@implementation CMDiagramShapeMatrixMapper

- (CMDiagramShapeMatrixMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CMDiagramShapeMatrixMapper *v17;
  CMDiagramShapeMatrixMapper *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CMDiagramShapeMatrixMapper;
  v17 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:](&v20, sel_initWithOddDiagram_drawingContext_orientedBounds_identifier_parent_, v12, v13, v14, v15, v16);
  v18 = v17;
  if (v17)
  {
    v17->mColumnCount = 0;
    v17->mRowCount = 0;
    v17->mIsSnake = 0;
    v17->mHasArrows = 0;
    v17->mIsHorizontal = 1;
    v17->mIsLinear = 0;
    v17->mRectWidth = 1.0;
    v17->mRectHeight = 1.0;
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("default")))
    {
      v18->mIsSnake = 0;
      v18->mHasArrows = 0;
    }
    else if (objc_msgSend(v15, "hasPrefix:", CFSTR("bProcess")))
    {
      v18->mHasArrows = 1;
      v18->mIsSnake = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("process1")))
    {
      v18->mHasArrows = 1;
      v18->mIsSnake = 0;
      v18->mIsLinear = 1;
    }
    -[CMDiagramShapeMatrixMapper setColumnsAndRowsCount](v18, "setColumnsAndRowsCount");
  }

  return v18;
}

- (void)setColumnsAndRowsCount
{
  unint64_t v3;
  unint64_t v4;

  if (self->mIsHorizontal)
  {
    v3 = -[CMDiagramShapeMatrixMapper columnCount](self, "columnCount");
    self->mColumnCount = v3;
    if (v3)
      v4 = (v3 + self->super.mChildCount - 1) / v3;
    else
      v4 = 0;
    self->mRowCount = v4;
  }
}

- (unint64_t)columnCount
{
  unint64_t mChildCount;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  unsigned int v14;
  float v15;
  float v16;
  uint64_t v17;
  float v18;
  unint64_t v19;
  float v20;
  double v21;
  float v22;
  float v23;
  float v24;
  CGRect v26;
  CGRect v27;

  mChildCount = self->super.mChildCount;
  if (!self->mIsLinear)
  {
    -[CMDiagramShapeMatrixMapper circumscribedBounds](self, "circumscribedBounds");
    v5 = v4;
    v7 = v6;
    -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
    v12 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v13 = CGRectGetHeight(v27);
    self->mRectWidth = 0.0;
    v14 = 0;
    if ((_DWORD)mChildCount)
    {
      v15 = v13;
      if ((mChildCount + 1) > 2)
        v17 = (mChildCount + 1);
      else
        v17 = 2;
      v18 = 0.0;
      v19 = 1;
      v16 = v12;
      v20 = v16 / v15;
      do
      {
        v21 = (double)(v19 - 1) * 0.100000001;
        v22 = v21 + (double)v19 * v5;
        v23 = (double)((v19 - 1 + mChildCount) / v19 - 1) * 0.100000001 + (double)((v19 - 1 + mChildCount) / v19) * v7;
        v24 = fminf((float)(v22 / v23) / v20, 1.0) / (v21 / v5 + (double)v19);
        if (v18 * 0.999 < v24)
        {
          self->mRectWidth = v24;
          v18 = v24;
          v14 = v19;
        }
        ++v19;
      }
      while (v17 != v19);
    }
    return v14;
  }
  return mChildCount;
}

- (CGRect)circumscribedBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.600000024;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 1.0;
  result.size.height = v2;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t mColumnCount;
  double v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  CMDiagramPointMapper *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  void *v30;
  void *v31;
  CMDiagramPointTransitionMapper *v32;
  uint64_t v33;
  CMDiagramPointTransitionMapper *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  id v39;
  id v40;

  v40 = a3;
  v39 = a4;
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 208;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v9 = v8;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  objc_msgSend(v6, "translateXBy:yBy:", v9);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v6);
  -[CMDiagramShapeMatrixMapper circumscribedBounds](self, "circumscribedBounds");
  v11 = v10;
  -[CMDiagramShapeMatrixMapper gapSize](self, "gapSize");
  v13 = v12;
  v15 = v14;
  mColumnCount = self->mColumnCount;
  -[CMDiagramShapeMatrixMapper gapRatio](self, "gapRatio");
  v36 = mColumnCount - 1;
  *(float *)&v17 = 1.0 / (v17 * (double)(mColumnCount - 1) / v11 + (double)mColumnCount);
  self->mRectWidth = *(float *)&v17;
  self->mRectHeight = *(float *)&v17;
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  objc_msgSend(v18, "children");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (LODWORD(self->super.mChildCount))
  {
    v19 = 0;
    v37 = mColumnCount;
    do
    {
      v20 = v19 / mColumnCount;
      v21 = v19 % mColumnCount;
      if (((v19 / mColumnCount) & 1) != 0 && self->mIsSnake)
        v21 = mColumnCount + ~v21;
      objc_msgSend(v38, "objectAtIndex:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", *(Class *)((char *)&self->super.super.super.super.super.isa + v7), (self->mRectWidth + v13 * self->mRectWidth) * (double)v21, (self->mRectHeight + v15 * self->mRectHeight) * (double)v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v22, self->super.super.mDrawingContext, v23, self);
      -[CMDiagramPointMapper mapAt:withState:](v24, "mapAt:withState:", v40, v39);
      if (!self->mHasArrows)
        goto LABEL_25;
      objc_msgSend(v22, "siblingTransition");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (!v25)
      {

        goto LABEL_28;
      }
      v27 = v7;
      if ((v20 & 1) != 0)
      {
        v28 = !self->mIsSnake;
        if (v21)
        {
          if (self->mIsSnake)
            v28 = 0;
          else
LABEL_15:
            v28 = 1;
          v29 = 0;
          goto LABEL_17;
        }
      }
      else
      {
        if (v21 != v36)
          goto LABEL_15;
        v28 = 1;
      }
      v29 = 1;
LABEL_17:
      TSURectWithOriginAndSize(v25);
      +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", *(Class *)((char *)&self->super.super.super.super.super.isa + v27));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29)
        objc_msgSend(v30, "setFlipY:", 1);
      if (!v28)
        objc_msgSend(v31, "setFlipX:", 1);
      v32 = [CMDiagramPointTransitionMapper alloc];
      if (v29)
        v33 = 248;
      else
        v33 = 247;
      v34 = -[CMDiagramPointTransitionMapper initWithPoint:drawingContext:orientedBounds:shapeType:parent:](v32, "initWithPoint:drawingContext:orientedBounds:shapeType:parent:", v26, self->super.super.mDrawingContext, v31, v33, self);
      -[CMDiagramPointTransitionMapper mapAt:withState:](v34, "mapAt:withState:", v40, v39);

      v7 = v27;
      mColumnCount = v37;
LABEL_25:

      ++v19;
    }
    while (v19 < LODWORD(self->super.mChildCount));
  }
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");
LABEL_28:

}

- (CGSize)gapSize
{
  double v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  CGSize result;

  -[CMDiagramShapeMatrixMapper gapRatio](self, "gapRatio");
  v4 = v3;
  -[CMDiagramShapeMatrixMapper circumscribedBounds](self, "circumscribedBounds");
  v6 = v4 / v5;
  -[CMDiagramShapeMatrixMapper gapRatio](self, "gapRatio");
  v8 = v7;
  -[CMDiagramShapeMatrixMapper circumscribedBounds](self, "circumscribedBounds");
  v10 = v8 / v9;
  v11 = v6;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)gapRatio
{
  double result;

  result = 0.100000001;
  if (self->mHasArrows)
    return 0.5;
  return result;
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  double Width;
  float mRectWidth;
  CGFloat Height;
  float v8;
  float v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;
  CGRect v14;

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds", a3, a4);
  Width = CGRectGetWidth(v13);
  mRectWidth = self->mRectWidth;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  Height = CGRectGetHeight(v14);
  v8 = Width * mRectWidth;
  v9 = Height * self->mRectHeight;
  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
