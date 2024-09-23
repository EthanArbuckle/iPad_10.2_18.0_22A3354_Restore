@implementation CMDiagramArrowMapper

+ (void)initialize
{
  _MergedGlobals_25 = 0x3F8000003F000000;
  *(_QWORD *)&dword_255AFDA00 = 0x3EB333333F800000;
  qword_255AFDA08 = 0x3D4CCCCD3F266666;
  *(_QWORD *)&dword_255AFDA10 = 0x3F6666663F333333;
}

- (CMDiagramArrowMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12;
  CMDiagramArrowMapper *v13;
  CMDiagramArrowMapper *v14;
  unint64_t mChildCount;
  float v16;
  int v17;
  float v18;
  float v19;
  char v20;
  float v21;
  float v22;
  objc_super v24;

  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CMDiagramArrowMapper;
  v13 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:](&v24, sel_initWithOddDiagram_drawingContext_orientedBounds_identifier_parent_, a3, a4, a5, v12, a7);
  v14 = v13;
  if (v13)
  {
    v13->super.mDefaultFontSize = 65.0;
    v13->super.mMaxMappableTreeDepth = 0;
    mChildCount = v13->super.mChildCount;
    *((_BYTE *)&v13->super.mDefaultScale + 4) = mChildCount == 1;
    v16 = *(float *)&dword_255AFDA14;
    v17 = objc_msgSend(v12, "isEqualToString:", CFSTR("arrow5"));
    v18 = tan(v16 * 3.14159265 / (double)mChildCount);
    v19 = v18 + v18;
    if (v17)
    {
      v20 = 0;
      v21 = (float)(*((float *)&_MergedGlobals_25 + 1) / v19) - *(float *)&dword_255AFDA04;
    }
    else
    {
      v22 = *(float *)&_MergedGlobals_25 / v19;
      v21 = (float)(*((float *)&_MergedGlobals_25 + 1) / v19) - *(float *)&qword_255AFDA08;
      if (v22 > v21)
        v21 = v22;
      v20 = 1;
    }
    *((_BYTE *)&v14->super.mDefaultScale + 5) = v20;
    *(float *)&v14->mIsVertical = v21 + (float)(*(float *)&dword_255AFDA00 * 0.5);
  }

  return v14;
}

- (CGRect)circumscribedBounds
{
  unint64_t mChildCount;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect result;

  mChildCount = self->super.mChildCount;
  v4 = 0.0;
  if (mChildCount == 1)
  {
    v5 = 1.0;
    v7 = 0.0;
    v6 = 1.0;
  }
  else if (mChildCount == 2)
  {
    v5 = (float)(*((float *)&qword_255AFDA08 + 1) + (float)(*(float *)&dword_255AFDA00 * 2.0));
    v6 = *((float *)&_MergedGlobals_25 + 1);
    v7 = 0.0;
  }
  else
  {
    v8.origin.x = ODIRegularPolygonBoundsMapper(mChildCount, *(float *)&self->mIsVertical, -90.0);
    *(CGRect *)&v4 = CGRectInset(v8, (float)(*(float *)&dword_255AFDA00 * -0.5), (float)(*(float *)&dword_255AFDA00 * -0.5));
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v7;
  result.origin.x = v4;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  void *v6;
  double v7;
  double v8;
  unint64_t mChildCount;
  void *v10;
  double v11;
  CMDiagramPointArrowMapper *v12;
  void *v13;
  void *v14;
  void *v15;
  CMDiagramPointArrowMapper *v16;
  float v17;
  double Width;
  float v19;
  double v20;
  float v21;
  CGFloat Height;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  double v27;
  char v28;
  double v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  CMDiagramPointArrowMapper *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  uint64_t v45;
  void *v46;
  CMDiagramPointArrowMapper *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v51 = a3;
  v50 = a4;
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v8 = v7;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  objc_msgSend(v6, "translateXBy:yBy:", v8);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v6);
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  mChildCount = self->super.mChildCount;
  v49 = v6;
  if (mChildCount == 2)
  {
    v17 = *(float *)&dword_255AFDA00;
    -[CMDiagramArrowMapper circumscribedBounds](self, "circumscribedBounds");
    Width = CGRectGetWidth(v52);
    v19 = *((float *)&qword_255AFDA08 + 1);
    -[CMDiagramArrowMapper circumscribedBounds](self, "circumscribedBounds");
    v20 = CGRectGetWidth(v53);
    v21 = *((float *)&_MergedGlobals_25 + 1);
    -[CMDiagramArrowMapper circumscribedBounds](self, "circumscribedBounds");
    Height = CGRectGetHeight(v54);
    v23 = 0;
    v24 = v17 / Width;
    v25 = v19 / v20;
    *(float *)&Height = v21 / Height;
    v26 = v24 + v25;
    v27 = v24;
    v28 = 1;
    v29 = *(float *)&Height;
    do
    {
      v30 = v28;
      -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint", v49);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "children");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndex:", v23);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v32) = *((unsigned __int8 *)&self->super.mDefaultScale + 5);
      +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.mDiagramShapeBounds, (float)(v26 * (float)(int)v23), 0.0, v27, v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = 180 * v23 - 90;
      *(float *)&v37 = (float)v36;
      if (!(_DWORD)v32)
        *(float *)&v37 = -(float)v36;
      objc_msgSend(v34, "setRotation:", v37);
      v38 = -[CMDiagramPointArrowMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointArrowMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v33, self->super.super.mDrawingContext, v35, self);
      -[CMDiagramPointArrowMapper mapAt:withState:](v38, "mapAt:withState:", v51, v50);

      v28 = 0;
      v23 = 1;
    }
    while ((v30 & 1) != 0);
  }
  else if (mChildCount == 1)
  {
    +[CMShapeUtils relatvieBoundsWithAbsoluteInnerBounds:parentBounds:](CMShapeUtils, "relatvieBoundsWithAbsoluteInnerBounds:parentBounds:", self->super.mDiagramShapeBounds, self->super.mDiagramShapeBounds);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setRotation:", v11);
    v12 = [CMDiagramPointArrowMapper alloc];
    -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CMDiagramPointArrowMapper initWithPoint:drawingContext:orientedBounds:parent:](v12, "initWithPoint:drawingContext:orientedBounds:parent:", v15, self->super.super.mDrawingContext, v10, self);

    -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
    -[CMDiagramPointArrowMapper mapAt:withState:](v16, "mapAt:withState:", v51, v50);

  }
  else if ((_DWORD)mChildCount)
  {
    v39 = 0;
    do
    {
      -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint", v49);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "children");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndex:", v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)mChildCount == 2)
      {
        v43 = (double)v39 * 360.0 / (double)2u;
        v44 = v43 + -90.0;
      }
      else
      {
        v44 = (double)v39 * 360.0 / (double)mChildCount;
      }
      cos((float)(v44 + -90.0) * 3.14159265 / 180.0);
      -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
      CGRectGetWidth(v55);
      sin((float)(v44 + -90.0) * 3.14159265 / 180.0);
      -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
      CGRectGetHeight(v56);
      TSURectWithOriginAndSize(v45);
      +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[CMDiagramPointArrowMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointArrowMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v42, self->super.super.mDrawingContext, v46, self);
      -[CMDiagramPointArrowMapper mapAt:withState:](v47, "mapAt:withState:", v51, v50);

      ++v39;
    }
    while (mChildCount != v39);
  }
  v48 = v49;
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform", v49);

}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  double Width;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;
  CGRect v14;

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds", a3, a4);
  Width = CGRectGetWidth(v13);
  -[CMDiagramArrowMapper circumscribedBounds](self, "circumscribedBounds");
  v6 = Width / CGRectGetWidth(v14);
  v7 = *(float *)&_MergedGlobals_25;
  if (*((_BYTE *)&self->super.mDefaultScale + 4))
    v8 = *(float *)&dword_255AFDA10;
  else
    v8 = *(float *)&_MergedGlobals_25;
  v9 = v8 * v6;
  if (!*((_BYTE *)&self->super.mDefaultScale + 4))
    v7 = *(float *)&dword_255AFDA10;
  v10 = (float)(v7 * v6);
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)textSizeForShapeSize:(CGSize)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  CGSize result;

  v3 = *(float *)&dword_255AFDA10;
  if (*((_BYTE *)&self->super.mDefaultScale + 4))
    v4 = *(float *)&_MergedGlobals_25;
  else
    v4 = *(float *)&dword_255AFDA10;
  if (!*((_BYTE *)&self->super.mDefaultScale + 4))
    v3 = *(float *)&_MergedGlobals_25;
  v5 = *(float *)&dword_255AFDA00;
  if (*((_BYTE *)&self->super.mDefaultScale + 4))
    v6 = *((float *)&_MergedGlobals_25 + 1);
  else
    v6 = *(float *)&dword_255AFDA00;
  if (!*((_BYTE *)&self->super.mDefaultScale + 4))
    v5 = *((float *)&_MergedGlobals_25 + 1);
  v7 = a3.width * v4 / v6;
  v8 = a3.height * v3 / v5;
  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
