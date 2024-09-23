@implementation ODIBending

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;
  double v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("default")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("matrix2")))
  {
    v8 = objc_alloc((Class)a1);
    v9 = 0;
LABEL_7:
    v10 = (void *)objc_msgSend(v8, "initWithArrows:", v9);
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("process5")) & 1) != 0
    || objc_msgSend(v6, "hasPrefix:", CFSTR("bProcess")))
  {
    v8 = objc_alloc((Class)a1);
    v9 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("bList2")))
  {
    v12 = 0;
    +[ODIBendingList2 mapWithState:](ODIBendingList2, "mapWithState:", v7);
    v11 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("matrix3")))
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArrows:", 0);
    LODWORD(v13) = 1.0;
    objc_msgSend(v10, "setRectHeight:", v13);
    objc_msgSend(v10, "setMaxNodeCount:", 4);
    objc_msgSend(v10, "setMaxColumnCount:", 2);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("radial2")))
      goto LABEL_16;
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArrows:", 0);
    LODWORD(v14) = 1.0;
    objc_msgSend(v10, "setRectHeight:", v14);
  }
LABEL_8:
  if (!v10)
  {
LABEL_16:
    v12 = 0;
    v11 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v10, "mapWithState:", v7);
  v11 = 1;
  v12 = v10;
LABEL_17:

  return v11;
}

- (ODIBending)initWithArrows:(BOOL)a3
{
  _BOOL4 v3;
  ODIBending *v4;
  double v5;
  ODIBending *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ODIBending;
  v4 = -[ODIBending init](&v8, sel_init);
  v6 = v4;
  if (v4)
  {
    LODWORD(v5) = 1036831949;
    if (v3)
      *(float *)&v5 = 0.4;
    v4->mSpaceWidth = *(float *)&v5;
    v4->mSpaceHeight = *(float *)&v5;
    v4->mWithArrows = v3;
    LODWORD(v5) = 1058642330;
    -[ODIBending setRectHeight:](v4, "setRectHeight:", v5);
    *(_QWORD *)&v6->mMaxNodeCount = -1;
  }
  return v6;
}

- (void)setRectHeight:(float)a3
{
  self->mRectHeight = a3;
}

- (void)setMaxNodeCount:(unsigned int)a3
{
  self->mMaxNodeCount = a3;
}

- (void)setMaxColumnCount:(unsigned int)a3
{
  self->mMaxColumnCount = a3;
}

- (void)mapWithState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int mMaxNodeCount;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  __objc2_class *v12;
  unint64_t v13;
  float v14;
  unsigned int v15;
  void *v16;
  float mRectHeight;
  float mSpaceHeight;
  float mSpaceWidth;
  double v20;
  void *v21;
  double v22;
  unsigned int v23;
  void *v24;
  double v25;
  float v26;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  unsigned int v37;
  double v38;
  void *v39;
  void *v40;
  __objc2_class *v41;
  __objc2_class *v42;
  void *v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  id v53;

  v53 = a3;
  objc_msgSend(v53, "diagram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (self->mMaxNodeCount >= v7)
    mMaxNodeCount = v7;
  else
    mMaxNodeCount = self->mMaxNodeCount;
  v9 = +[ODIBending mapLogicalBoundsWithShapeSize:spaceSize:maxNodeCount:maxColumnCount:state:](ODIBending, "mapLogicalBoundsWithShapeSize:spaceSize:maxNodeCount:maxColumnCount:state:", 1.0, self->mRectHeight, self->mSpaceWidth, self->mSpaceHeight);
  if (!v9)
    goto LABEL_27;
  v47 = v9 - 1;
  if (v9 > v47 + mMaxNodeCount)
    goto LABEL_27;
  v50 = 0;
  v10 = 0;
  v11 = mMaxNodeCount - 1;
  v45 = v9 - 2;
  v12 = &OBJC_METACLASS___ODXLayoutNode;
  v48 = v9;
  LODWORD(v44) = (v47 + mMaxNodeCount) / v9;
  HIDWORD(v44) = v9;
  v46 = v6;
  do
  {
    v13 = 0;
    v49 = v11;
    v14 = (float)v10;
    v15 = v45;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", (v50 + v13), v44);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      mRectHeight = self->mRectHeight;
      mSpaceWidth = self->mSpaceWidth;
      mSpaceHeight = self->mSpaceHeight;
      LODWORD(v20) = 1036831949;
      objc_msgSend(&v12[21], "shapeGeometryForRoundedRectangleWithRadius:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (v10 & 1) != 0 ? v15 + 1 : v13;
      LODWORD(v22) = 0;
      objc_msgSend(&v12[21], "addShapeWithBounds:rotation:geometry:state:", v21, v53, (float)((float)(mSpaceWidth + 1.0) * (float)v23), (float)((float)(mRectHeight + mSpaceHeight) * v14), 1.0, mRectHeight, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&v12[21], "mapStyleAndTextFromPoint:shape:state:", v16, v24, v53);
      if (v49 == v13)
        break;
      if (self->mWithArrows)
      {
        if ((v10 & 1) != 0)
        {
          if (v13 >= v47)
          {
            v26 = (float)(self->mSpaceHeight * 0.5)
                + (float)(self->mRectHeight + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight)));
            v25 = 0.5;
            goto LABEL_20;
          }
          v25 = (float)((float)(self->mSpaceWidth * 0.5)
                      + (float)((float)((float)v15 * (float)(self->mSpaceWidth + 1.0)) + 1.0));
          v26 = (float)(self->mRectHeight * 0.5) + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight));
          v28 = 1127481344;
        }
        else
        {
          if (v13 < v47)
          {
            v25 = (float)((float)(self->mSpaceWidth * 0.5)
                        + (float)((float)((float)v13 * (float)(self->mSpaceWidth + 1.0)) + 1.0));
            v26 = (float)(self->mRectHeight * 0.5) + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight));
            v27 = 0;
LABEL_22:
            v29 = TSURectWithCenterAndSize(v25, v26, *(double *)"");
            v31 = v30;
            v33 = v32;
            v35 = v34;
            objc_msgSend(&v12[21], "shapeGeometryForRightArrowWithControlPoint:", 0.5, 0.15);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v24;
            v52 = v16;
            v37 = v15;
            LODWORD(v38) = v27;
            objc_msgSend(&v12[21], "addShapeWithBounds:rotation:geometry:state:", v36, v53, v29, v31, v33, v35, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v21;
            v41 = v12;
            v42 = v12 + 21;
            objc_msgSend(v52, "siblingTransition");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[__objc2_class mapStyleAndTextFromPoint:shape:state:](v42, "mapStyleAndTextFromPoint:shape:state:", v43, v39, v53);

            v6 = v46;
            v12 = v41;
            v21 = v40;
            v15 = v37;
            v24 = v51;
            v16 = v52;
            goto LABEL_23;
          }
          v25 = (float)((float)((float)v47 * (float)(self->mSpaceWidth + 1.0)) + 0.5);
          v26 = (float)(self->mSpaceHeight * 0.5)
              + (float)(self->mRectHeight + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight)));
LABEL_20:
          v28 = 1119092736;
        }
        v27 = v28;
        goto LABEL_22;
      }
LABEL_23:

      ++v13;
      --v15;
      if (v48 == v13)
        goto LABEL_26;
    }

LABEL_26:
    ++v10;
    v11 = v49 - HIDWORD(v44);
    v50 += v48;
  }
  while (v10 != (_DWORD)v44);
LABEL_27:

}

+ (unsigned)mapLogicalBoundsWithShapeSize:(CGSize)a3 spaceSize:(CGSize)a4 maxNodeCount:(unsigned int)a5 maxColumnCount:(unsigned int)a6 state:(id)a7
{
  double height;
  double width;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  unsigned int v28;
  unsigned int v29;
  float v30;
  float v31;
  unsigned int v32;
  unsigned int v33;
  float v34;
  float v35;
  double v36;
  unsigned int v37;
  double v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  double v45;
  CGRect v46;
  CGRect v47;

  height = a4.height;
  width = a4.width;
  v11 = a3.height;
  v12 = a3.width;
  v13 = a7;
  objc_msgSend(v13, "diagram");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "documentPoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 < a5)
    a5 = v17;
  if (a5 < a6)
    a6 = a5;
  objc_msgSend(v13, "diagramOrientedBounds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v46.origin.x = v20;
  v46.origin.y = v22;
  v46.size.width = v24;
  v46.size.height = v26;
  v45 = CGRectGetWidth(v46);
  v47.origin.x = v20;
  v47.origin.y = v22;
  v47.size.width = v24;
  v47.size.height = v26;
  v27 = CGRectGetHeight(v47);
  if (!a6)
    goto LABEL_15;
  v28 = 0;
  v29 = 0;
  v32 = a6 + 1 > 2 ? a6 + 1 : 2;
  v33 = v32 - 1;
  v34 = 0.0;
  v30 = v45;
  v31 = v27;
  v35 = v30 / v31;
  v36 = 1.0;
  do
  {
    v37 = v28 + 1;
    v38 = width * (double)v28;
    v39 = v38 + v36 * v12;
    v40 = height * (double)((a5 + v28) / v37 - 1) + (double)((a5 + v28) / v37) * v11;
    v41 = fminf((float)(v39 / v40) / v35, 1.0) / (v38 / v12 + v36);
    if (v34 * 0.999 < v41)
    {
      v34 = v41;
      v29 = v28 + 1;
    }
    v36 = v36 + 1.0;
    ++v28;
  }
  while (v33 != v37);
  if (v29)
  {
    v42 = width * (double)(v29 - 1) + (double)v29 * v12;
    v43 = height * (double)((a5 - 1 + v29) / v29 - 1) + (double)((a5 - 1 + v29) / v29) * v11;
    objc_msgSend(v13, "setLogicalBounds:", 0.0, 0.0, v42, v43);
  }
  else
  {
LABEL_15:
    objc_msgSend(v13, "setLogicalBounds:", 0.0, 0.0, 0.0, 0.0);
    v29 = 0;
  }

  return v29;
}

@end
