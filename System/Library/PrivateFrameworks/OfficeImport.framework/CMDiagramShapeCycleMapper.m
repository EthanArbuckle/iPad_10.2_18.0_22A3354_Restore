@implementation CMDiagramShapeCycleMapper

- (CMDiagramShapeCycleMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CMDiagramShapeCycleMapper *v17;
  CMDiagramShapeCycleMapper *v18;
  int v19;
  int v20;
  CMDiagramShapeCycleMapper *v21;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CMDiagramShapeCycleMapper;
  v17 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:](&v23, sel_initWithOddDiagram_drawingContext_orientedBounds_identifier_parent_, v12, v13, v14, v15, v16);
  v18 = v17;
  if (v17)
  {
    LOBYTE(v17->mScale) = 0;
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("cycle1")))
    {
      LOBYTE(v18->mScale) = 0;
      *(_DWORD *)&v18->mCircularArrows = 6;
      v18->mDiagramType = 251;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("cycle2")))
    {
      LOBYTE(v18->mScale) = 0;
      v19 = 247;
      v20 = 7;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("cycle5")) & 1) != 0)
    {
      v19 = 251;
      v20 = 8;
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("cycle7")))
      {
LABEL_11:
        *((_DWORD *)&v18->super.mDefaultScale + 1) = 1065353216;
        v21 = v18;
        goto LABEL_12;
      }
      v19 = 247;
      v20 = 9;
    }
    *(_DWORD *)&v18->mCircularArrows = v20;
    v18->mDiagramType = v19;
    goto LABEL_11;
  }
LABEL_12:

  return v18;
}

- (CGRect)circumscribedBounds
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  CGFloat v15;
  CGRect v16;

  v3 = ODIRegularPolygonBoundsMapper(self->super.mChildCount, 0.5, -90.0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[CMDiagramShapeCycleMapper nodeSize](self, "nodeSize");
  v11 = v10 * 0.5;
  v13 = v12 * 0.5;
  if (v11 <= v13)
    v11 = v13;
  v14 = v11;
  v15 = (float)-v14;
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  return CGRectInset(v16, v15, v15);
}

- (CGSize)nodeSize
{
  double v2;
  double v3;
  double v4;
  long double v5;
  CGSize result;

  switch(*(_DWORD *)&self->mCircularArrows)
  {
    case 6:
    case 8:
      v2 = sin(3.14159265 / (double)self->super.mChildCount) * 0.6;
      v3 = 0.699999988;
      goto LABEL_6;
    case 7:
      v5 = sin(2.19911482 / (double)self->super.mChildCount);
      v2 = v5 * 0.5 + v5 * 0.5;
      v4 = v2;
      break;
    case 9:
      v2 = sin(3.14159265 / (double)self->super.mChildCount) * 0.6;
      v3 = 0.5;
LABEL_6:
      v4 = v2 * v3;
      break;
    default:
      v2 = *MEMORY[0x24BDBF148];
      v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
      break;
  }
  result.height = v4;
  result.width = v2;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  OADOrientedBounds *v16;
  OADOrientedBounds *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  CGRectGetWidth(v23);
  -[CMDiagramShapeCycleMapper circumscribedBounds](self, "circumscribedBounds");
  CGRectGetWidth(v24);
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  CGRectGetWidth(v25);
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  CGRectGetHeight(v26);
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v9 = v8;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  objc_msgSend(v20, "translateXBy:yBy:", v9);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v20);
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  if (self->super.mChildCount)
  {
    v10 = 0;
    while (1)
    {
      objc_msgSend(v21, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeCycleMapper nodeBoundsWithIndex:](self, "nodeBoundsWithIndex:", v10);
      +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
      v16 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v12, v13, v14, v15);
      v17 = v16;
      v18 = *(_DWORD *)&self->mCircularArrows - 6;
      if (v18 >= 4)
        break;
      v19 = (void *)objc_msgSend(objc_alloc(*off_24F3BF848[v18]), "initWithPoint:drawingContext:orientedBounds:parent:", v11, self->super.super.mDrawingContext, v16, self);
      objc_msgSend(v19, "mapAt:withState:", v22, v6);
      -[CMDiagramShapeCycleMapper mapTransitionPointAt:index:withState:](self, "mapTransitionPointAt:index:withState:", v22, v10, v6);

      if (self->super.mChildCount <= ++v10)
        goto LABEL_7;
    }

  }
LABEL_7:

}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  double Width;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  CGFloat height;
  double v12;
  CGFloat v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds", a3);
  Width = CGRectGetWidth(v20);
  -[CMDiagramShapeCycleMapper circumscribedBounds](self, "circumscribedBounds");
  v7 = CGRectGetWidth(v21);
  -[CMDiagramShapeCycleMapper nodeBoundsWithIndex:](self, "nodeBoundsWithIndex:", a4);
  x = v22.origin.x;
  y = v22.origin.y;
  v10 = v22.size.width;
  height = v22.size.height;
  v12 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = v10;
  v23.size.height = height;
  v13 = CGRectGetHeight(v23);
  v14 = Width / v7;
  v15 = v14;
  v16 = v12 * v15 * 0.707106781;
  v17 = v13 * v15 * 0.707106781;
  v18 = v16;
  result.height = v17;
  result.width = v18;
  return result;
}

- (CGRect)nodeBoundsWithIndex:(unint64_t)a3
{
  float v4;
  __float2 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v4 = (double)(2 * a3) * 3.14159265 / (double)self->super.mChildCount + -1.57079633;
  v5 = __sincosf_stret(v4);
  -[CMDiagramShapeCycleMapper nodeSize](self, "nodeSize");
  v7 = TSURectWithCenterAndSize((float)(v5.__cosval * 0.5), (float)(v5.__sinval * 0.5), v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)mapTransitionPointAt:(id)a3 index:(unsigned int)a4 withState:(id)a5
{
  uint64_t v6;
  id v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double mChildCount;
  unsigned int v16;
  float v17;
  float v18;
  uint64_t v19;
  void *v20;
  CMDiagramPointTransitionMapper *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v6 = *(_QWORD *)&a4;
  v22 = a3;
  v8 = a5;
  v9 = *(_DWORD *)&self->mCircularArrows;
  if (v9 == 8 || v9 == 6)
  {
    -[CMDiagramShapeCycleMapper mapTransitionArrowsAt:index:withState:](self, "mapTransitionArrowsAt:index:withState:", v22, v6, v8);
  }
  else
  {
    -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "siblingTransition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
    -[CMDiagramShapeCycleMapper circumscribedBounds](self, "circumscribedBounds", CGRectGetWidth(v23));
    CGRectGetWidth(v24);
    mChildCount = (double)self->super.mChildCount;
    sin(2.19911482 / mChildCount);
    v16 = (2 * v6) | 1;
    cos(3.14159265 / mChildCount);
    v17 = (double)v16 * 3.14159265 / mChildCount + -1.57079633;
    cosf(v17);
    -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
    CGRectGetWidth(v25);
    v18 = (double)v16 * 3.14159265 / mChildCount + -1.57079633;
    sinf(v18);
    -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
    CGRectGetHeight(v26);
    sin(3.14159265 / (double)self->super.mChildCount);
    TSURectWithOriginAndSize(v19);
    +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CMDiagramPointTransitionMapper initWithPoint:drawingContext:orientedBounds:shapeType:adjustValues:parent:]([CMDiagramPointTransitionMapper alloc], "initWithPoint:drawingContext:orientedBounds:shapeType:adjustValues:parent:", v14, self->super.super.mDrawingContext, v20, self->mDiagramType, 0, self);
    -[CMDiagramPointTransitionMapper mapAt:withState:](v21, "mapAt:withState:", v22, v8);

  }
}

- (void)mapTransitionArrowsAt:(id)a3 index:(unsigned int)a4 withState:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double Width;
  double v13;
  unint64_t mChildCount;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  float v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  void *v53;
  CMDiagramPointTransitionMapper *v54;
  id v55;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v56 = a3;
  v55 = a5;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "siblingTransition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  Width = CGRectGetWidth(v57);
  -[CMDiagramShapeCycleMapper circumscribedBounds](self, "circumscribedBounds");
  v13 = CGRectGetWidth(v58);
  mChildCount = self->super.mChildCount;
  -[CMDiagramShapeCycleMapper nodeSize](self, "nodeSize");
  v16 = v15;
  v17 = (double)a4 * 360.0 / (double)mChildCount + -90.0;
  *(float *)&v17 = v17;
  +[CMShapeUtils intersectionAngleNextToAngle:isAfter:nodeSize:](CMShapeUtils, "intersectionAngleNextToAngle:isAfter:nodeSize:", 1, v17, v16, v18);
  v20 = v19;
  v21 = self->super.mChildCount;
  -[CMDiagramShapeCycleMapper nodeSize](self, "nodeSize");
  v23 = v22;
  v24 = (double)(a4 + 1) * 360.0 / (double)v21 + -90.0;
  *(float *)&v24 = v24;
  +[CMShapeUtils intersectionAngleNextToAngle:isAfter:nodeSize:](CMShapeUtils, "intersectionAngleNextToAngle:isAfter:nodeSize:", 0, v24, v23, v25);
  v27 = Width / v13;
  if (v26 < v20)
    v26 = v26 + 360.0;
  v28 = v26 - v20;
  v29 = (float)(v20 + v26) * 0.5;
  v30 = (float)(v28 * 0.7) * 0.5;
  v31 = (float)((float)(v29 - v30) + 180.0) * 3.14159265 / 180.0;
  v32 = (float)((float)(v29 + v30) + 180.0) * 3.14159265 / 180.0;
  v33 = v32;
  v34 = 1.0;
  if (*(_DWORD *)&self->mCircularArrows != 8)
  {
    *(float *)&v32 = sinf((float)(v33 - v31) * 0.5);
    v34 = (float)((float)((float)(*(float *)&v32 * 0.5) + (float)(*(float *)&v32 * 0.5)) * v27) * 0.1;
  }
  v35 = (void *)MEMORY[0x24BDBCE70];
  *(float *)&v32 = v33;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v38 = v31;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v41 = v34;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, v37, v39, v40, v42, v43, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v46 = v45;
  v48 = v47;
  v49 = *MEMORY[0x24BDBEFB0];
  v50 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[CMDiagramShapeCycleMapper nodeSize](self, "nodeSize");
  *(float *)&v51 = v51 * v27 * 0.5 + (float)(v34 * 0.5);
  v52 = *(float *)&v51;
  v59.origin.x = v49;
  v59.origin.y = v50;
  v59.size.width = v46;
  v59.size.height = v48;
  v60 = CGRectInset(v59, v52, v52);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[CMDiagramPointTransitionMapper initWithPoint:drawingContext:orientedBounds:shapeType:adjustValues:parent:]([CMDiagramPointTransitionMapper alloc], "initWithPoint:drawingContext:orientedBounds:shapeType:adjustValues:parent:", v11, self->super.super.mDrawingContext, v53, self->mDiagramType, v44, self);
  -[CMDiagramPointTransitionMapper mapAt:withState:](v54, "mapAt:withState:", v56, v55);

}

@end
