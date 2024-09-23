@implementation CRLImageLayout

- (CRLImageLayout)initWithInfo:(id)a3
{
  CRLImageLayout *v3;
  CRLImageLayout *v4;
  CRLImageLayout *v5;
  CRLImageLayout *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  v3 = -[CRLMediaLayout initWithInfo:](&v9, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (CRLImageLayout *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](v3, "imageInfo"));
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskInfo](v5, "maskInfo"));

      if (v7)
        *(CRLCanvasInfoGeometry **)((char *)&v4->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)1;
    }
    else
    {
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(*(CGPathRef *)((char *)&self->mImageGeometry + 3));
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLImageLayout dealloc](&v3, "dealloc");
}

- (id)geometryForTransforming
{
  void *v3;

  if ((id)-[CRLImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == (id)3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  return v3;
}

- (id)visibleGeometries
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  v3 = -[CRLCanvasAbstractLayout visibleGeometries](&v8, "visibleGeometries");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v5));

    v4 = (void *)v6;
  }
  return v4;
}

- (CRLCanvasInfoGeometry)currentInfoGeometry
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)((char *)&self->mHasAlpha + 3);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));

  }
  return (CRLCanvasInfoGeometry *)v3;
}

- (id)layoutGeometryFromInfo
{
  void *v2;
  CRLCanvasLayoutGeometry *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CRLCanvasLayoutGeometry *v8;
  _OWORD v10[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout currentInfoGeometry](self, "currentInfoGeometry"));
  v3 = [CRLCanvasLayoutGeometry alloc];
  objc_msgSend(v2, "size");
  v5 = v4;
  v7 = v6;
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(v10, 0, sizeof(v10));
  v8 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v3, "initWithSize:transform:", v10, v5, v7);

  return v8;
}

- (id)computeLayoutGeometry
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  CRLCanvasMutableLayoutGeometry *v13;
  id v14;
  CRLCanvasMutableLayoutGeometry *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  CRLCanvasMutableLayoutGeometry *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  CRLBezierPath *v45;
  void *v46;
  double v47;
  CGFloat v48;
  CRLCanvasMutableLayoutGeometry *v49;
  __int128 v50;
  id v51;
  void *v52;
  uint64_t v53;
  CRLCanvasLayoutGeometry *v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double width;
  double height;
  double x;
  double y;
  __int128 v68;
  CGFloat v69;
  CGFloat v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CRLCanvasMutableLayoutGeometry *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  void *v80;
  void *v81;
  CGAffineTransform t2;
  CGAffineTransform v83;
  CGAffineTransform t1;
  _OWORD v85[3];
  CGAffineTransform v86;
  _OWORD v87[3];
  _OWORD v88[3];
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  objc_super v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    objc_msgSend(v8, "maximumFrameSizeForChild:", self);
  }
  else
  {
    v9 = 1.79769313e308;
    v10 = 1.79769313e308;
  }
  if (*(double *)((char *)&self->mLayoutToMaskTransform.ty + 3) != v9
    || *(double *)(&self->mMaskIntersectsImage + 3) != v10)
  {
    *(double *)((char *)&self->mLayoutToMaskTransform.ty + 3) = v9;
    *(double *)(&self->mMaskIntersectsImage + 3) = v10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
  if (v12)
  {
    v13 = (CRLCanvasMutableLayoutGeometry *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo"));
  }
  else
  {
    v95.receiver = self;
    v95.super_class = (Class)CRLImageLayout;
    v14 = -[CRLCanvasLayout computeLayoutGeometry](&v95, "computeLayoutGeometry");
    v13 = (CRLCanvasMutableLayoutGeometry *)objc_claimAutoreleasedReturnValue(v14);
  }
  v15 = v13;
  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), v13);
  *(_QWORD *)&v17 = objc_opt_class(CRLStroke, v16).n128_u64[0];
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout stroke](self, "stroke", v17));
  v21 = sub_100221D0C(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  CGPathRelease(*(CGPathRef *)((char *)&self->mImageGeometry + 3));
  *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3) = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](self, "imageInfo"));
  if (v12)
  {
    objc_msgSend(v12, "setPathScale:", 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "computeLayoutGeometry"));
    v80 = v8;
    v81 = v22;
    v79 = v23;
    if (-[CRLCanvasLayout layoutState](self, "layoutState") != 3)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geometry"));
      objc_msgSend(v25, "angle");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "maskInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "geometry"));
      objc_msgSend(v29, "angle");
      v31 = v27 + v30;

      objc_msgSend(v24, "size");
      v33 = v32;
      v35 = v34;
      CGAffineTransformMakeRotation(&v94, v31 * 0.0174532925);
      -[CRLCanvasLayout scaleForInlineClampingUnrotatedSize:withTransform:](self, "scaleForInlineClampingUnrotatedSize:withTransform:", &v94, v33, v35);
      v37 = v36;
      CGAffineTransformMakeScale(&v93, v36, v36);
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "geometryByTransformingBy:", &v93));

      CGAffineTransformMakeScale(&v92, v37, v37);
      v39 = (CRLCanvasMutableLayoutGeometry *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometry geometryByTransformingBy:](v15, "geometryByTransformingBy:", &v92));

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      objc_msgSend(v40, "setPathScale:", v37);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      objc_msgSend(v41, "setGeometry:", v38);

      objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), v39);
      v24 = (void *)v38;
      v15 = v39;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v12, "path")));
    objc_msgSend(v12, "pathBounds");
    CGAffineTransformMakeTranslation(&v91, -v43, -v44);
    objc_msgSend(v42, "transformUsingAffineTransform:", &v91);
    -[CRLCanvasLayoutGeometry size](v15, "size");
    v45 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    if (v24)
      objc_msgSend(v24, "transform");
    else
      memset(&v89, 0, sizeof(v89));
    CGAffineTransformInvert(&v90, &v89);
    objc_msgSend(v46, "transformUsingAffineTransform:", &v90);
    if (v42)
      v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "intersectBezierPath:", v46));
    else
      v51 = v46;
    v52 = v51;
    if (v51)
    {
      v53 = (uint64_t)objc_msgSend(v51, "elementCount");
      BYTE3(self->mLayoutToMaskTransform.tx) = v53 > 1;
      if (v53 >= 2)
      {
        v54 = (CRLCanvasLayoutGeometry *)CGPathRetain((CGPathRef)objc_msgSend(objc_retainAutorelease(v52), "CGPath"));
        *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3) = v54;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v54));
        objc_msgSend(v55, "boundsIncludingCRLStroke:", v81);
        v57 = v56;
        v59 = v58;
        v61 = v60;
        v63 = v62;

        objc_msgSend(v24, "size");
        v98.origin.x = sub_10005FDDC();
        width = v98.size.width;
        height = v98.size.height;
        v100.origin.x = v57;
        v100.origin.y = v59;
        v100.size.width = v61;
        v100.size.height = v63;
        v99 = CGRectUnion(v98, v100);
        x = v99.origin.x;
        y = v99.origin.y;
        v49 = -[CRLCanvasLayoutGeometry initWithFrame:]([CRLCanvasMutableLayoutGeometry alloc], "initWithFrame:", v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);
        if (v24)
          objc_msgSend(v24, "transform");
        else
          memset(v88, 0, sizeof(v88));
        -[CRLCanvasMutableLayoutGeometry transformBy:](v49, "transformBy:", v88);
        if (v15)
          -[CRLCanvasLayoutGeometry transform](v15, "transform");
        else
          memset(v87, 0, sizeof(v87));
        -[CRLCanvasMutableLayoutGeometry transformBy:](v49, "transformBy:", v87);
        v69 = -x;
        v70 = -y;
        -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v69, v70, width, height);
        CGAffineTransformMakeTranslation(&v86, v69, v70);
        v71 = *(_OWORD *)&v86.c;
        *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3) = *(_OWORD *)&v86.a;
        *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3) = v71;
        *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3) = *(_OWORD *)&v86.tx;
LABEL_39:
        if (v24)
          objc_msgSend(v24, "transform");
        else
          memset(&v83, 0, sizeof(v83));
        CGAffineTransformInvert(&t1, &v83);
        v72 = *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3);
        *(_OWORD *)&t2.a = *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3);
        *(_OWORD *)&t2.c = v72;
        *(_OWORD *)&t2.tx = *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3);
        CGAffineTransformConcat(&v86, &t1, &t2);
        v73 = *(_OWORD *)&v86.c;
        *(_OWORD *)((char *)&self->mMaskLayout + 3) = *(_OWORD *)&v86.a;
        *(_OWORD *)((char *)&self->mLayoutToImageTransform.a + 3) = v73;
        *(_OWORD *)((char *)&self->mLayoutToImageTransform.c + 3) = *(_OWORD *)&v86.tx;

        v8 = v80;
        v22 = v81;
        v23 = v79;
        goto LABEL_43;
      }
    }
    else
    {
      BYTE3(self->mLayoutToMaskTransform.tx) = 0;
    }
    if (v15)
      -[CRLCanvasLayoutGeometry transform](v15, "transform");
    else
      memset(v85, 0, sizeof(v85));
    v49 = (CRLCanvasMutableLayoutGeometry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "geometryByTransformingBy:", v85));
    objc_msgSend(v24, "size");
    -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", sub_10005FDDC());
    v68 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3) = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3) = v68;
    *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3) = *(_OWORD *)&CGAffineTransformIdentity.tx;
    goto LABEL_39;
  }
  v77 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v78 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3) = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3) = v77;
  v76 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3) = v76;
  BYTE3(self->mLayoutToMaskTransform.tx) = 0;
  if (v22 && objc_msgSend(v22, "shouldRender"))
  {
    objc_msgSend(v22, "renderedWidth");
    v48 = v47 * 0.5;
    v49 = (CRLCanvasMutableLayoutGeometry *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometry geometryByOutsettingBy:](v15, "geometryByOutsettingBy:", v48, v48));
    CGAffineTransformMakeTranslation(&v86, v48, v48);
    v50 = *(_OWORD *)&v86.c;
    *(_OWORD *)((char *)&self->mMaskLayout + 3) = *(_OWORD *)&v86.a;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.a + 3) = v50;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.c + 3) = *(_OWORD *)&v86.tx;
    -[CRLCanvasLayoutGeometry size](v15, "size");
    v96.origin.x = sub_10005FDDC();
    v97 = CGRectOffset(v96, v48, v48);
    -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
  }
  else
  {
    v15 = v15;
    *(_OWORD *)((char *)&self->mMaskLayout + 3) = v78;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.a + 3) = v77;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.c + 3) = v76;
    -[CRLCanvasLayoutGeometry size](v15, "size");
    -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", sub_10005FDDC());
    v49 = v15;
  }
LABEL_43:
  v74 = v49;

  return v74;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  -[CRLMediaLayout processChangedProperty:](&v8, "processChangedProperty:");
  if ((uint64_t)a3 <= 35)
  {
    if (a3 == 15)
    {
      -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
      -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
      return;
    }
    if (a3 != 18)
      goto LABEL_13;
  }
  else if (a3 != 36)
  {
    if (a3 == 37)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      v6 = v5;
      v7 = 7;
      goto LABEL_11;
    }
    if (a3 == 38)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      v6 = v5;
      v7 = 19;
LABEL_11:
      objc_msgSend(v5, "processChangedProperty:", v7);

      return;
    }
LABEL_13:
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
      -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    }
    return;
  }
  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
  -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
  if (a3 == 18)
    *(CGFloat *)((char *)&self->mLastParentLimitedSize.width + 3) = 0.0;
}

- (id)childInfosForChildLayouts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  v3 = -[CRLCanvasLayout childInfosForChildLayouts](&v9, "childInfosForChildLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](self, "imageInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maskInfo"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v6));

    v4 = (void *)v7;
  }

  return v4;
}

- (void)updateChildrenFromInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRLImageLayout *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v27.receiver = self;
  v27.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout updateChildrenFromInfo](&v27, "updateChildrenFromInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](self, "imageInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskInfo"));

  v5 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.height + 3);
  if (!v4)
  {
    *(CGFloat *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) = 0.0;
LABEL_27:

    goto LABEL_28;
  }
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.height
                                                                      + 3), "maskInfo"));
    if (v6 == v4)
    {
      v7 = (CRLImageLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3), "parent"));

      if (v7 == self)
        goto LABEL_28;
    }
    else
    {

    }
  }
  v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.height + 3);
  *(CGFloat *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) = 0.0;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));

        if (v15 == v4)
        {
          objc_opt_class(CRLMaskLayout, v16);
          v18 = sub_1002223BC(v17, v14);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.height + 3);
          *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) = v19;

          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_17:

  if (!*(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.height + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247E90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11D38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247EB0);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout updateChildrenFromInfo]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v22, 397, 0, "invalid nil value for '%{public}s'", "mMaskLayout");

    goto LABEL_27;
  }
LABEL_28:

}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  CGAffineTransform v29;
  CGAffineTransform t1;
  CGAffineTransform v31;
  CGAffineTransform t2;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v3 = a3;
  if (*(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.height + 3)
    && *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3))
  {
    *(_QWORD *)&v5 = objc_opt_class(CRLStroke, a2).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout stroke](self, "stroke", v5));
    v9 = sub_100221D0C(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3)));
    memset(&v34, 0, sizeof(v34));
    -[CRLImageLayout layoutToMaskTransform](self, "layoutToMaskTransform");
    if (v3)
      -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
    else
      -[CRLCanvasAbstractLayout transform](self, "transform");
    CGAffineTransformConcat(&v34, &t1, &v29);
    v33 = v34;
    objc_msgSend(v11, "transformUsingAffineTransform:", &v33);
    if (v10 && objc_msgSend(v10, "shouldRender"))
    {
      objc_msgSend(v11, "takeAttributesFromStroke:", v10);
      objc_msgSend(v11, "boundsIncludingStroke");
    }
    else
    {
      objc_msgSend(v11, "bounds");
    }
    x = v17;
    y = v18;
    width = v19;
    height = v20;

  }
  else
  {
    memset(&v34, 0, sizeof(v34));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "fullTransform");
    else
      memset(&v34, 0, sizeof(v34));

    if (v3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
        v16 = v15;
        if (v15)
          objc_msgSend(v15, "transformInRoot");
        else
          memset(&t2, 0, sizeof(t2));
        v31 = v34;
        CGAffineTransformConcat(&v33, &v31, &t2);
        v34 = v33;

      }
    }
    v33 = v34;
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.width = 1.0;
    v35.size.height = 1.0;
    v36 = CGRectApplyAffineTransform(v35, &v33);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGAffineTransform *p_t1;
  CGAffineTransform *p_t2;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  char v19;
  char v20;
  CGAffineTransform v21;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v24;
  CGRect v25;
  CGRect result;

  if (-[CRLImageLayout isResizingInMaskEditMode](self, "isResizingInMaskEditMode"))
  {
    if ((id)-[CRLImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == (id)2)
    {
LABEL_3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
      objc_msgSend(v3, "size");
      v4 = sub_10005FDDC();
      v6 = v5;
      v8 = v7;
      v10 = v9;

      memset(&v24, 0, sizeof(v24));
      -[CRLImageLayout layoutToImageTransform](self, "layoutToImageTransform");
      -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
      p_t1 = (CGAffineTransform *)&v20;
      p_t2 = (CGAffineTransform *)&v19;
LABEL_7:
      CGAffineTransformConcat(&v24, p_t1, p_t2);
      v21 = v24;
      v25.origin.x = v4;
      v25.origin.y = v6;
      v25.size.width = v8;
      v25.size.height = v10;
      return CGRectApplyAffineTransform(v25, &v21);
    }
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
    objc_msgSend(v14, "size");
    v4 = sub_10005FDDC();
    v6 = v15;
    v8 = v16;
    v10 = v17;

    memset(&v24, 0, sizeof(v24));
    -[CRLImageLayout layoutToMaskTransform](self, "layoutToMaskTransform");
    -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
    p_t1 = &t1;
    p_t2 = &t2;
    goto LABEL_7;
  }
  if (-[CRLImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode"))
  {
    if ((id)-[CRLImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") != (id)3)
      goto LABEL_3;
    goto LABEL_6;
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLImageLayout;
  -[CRLCanvasAbstractLayout alignmentFrameForProvidingGuidesInRoot](&v18, "alignmentFrameForProvidingGuidesInRoot");
  return result;
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v7;
  void *v8;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), "geometryByTranslatingBy:", a3.x, a3.y));
    v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
    *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v7;

  }
  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  -[CRLCanvasAbstractLayout offsetGeometryBy:](&v9, "offsetGeometryBy:", x, y);
}

- (BOOL)hasAlpha
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)((char *)&self->mLastParentLimitedSize.width + 3);
  if (!v2)
  {
    *(_QWORD *)((char *)&self->mLastParentLimitedSize.width + 3) = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](self, "imageInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageAssetPayload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providerForAsset:shouldValidate:", v6, 0));

    objc_opt_class(CRLBitmapImageProvider, v8);
    v10 = sub_100221D0C(v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v11 && objc_msgSend(v11, "isOpaque"))
      *(_QWORD *)((char *)&self->mLastParentLimitedSize.width + 3) = 2;

    v2 = *(_QWORD *)((char *)&self->mLastParentLimitedSize.width + 3);
  }
  return v2 == 1;
}

- (BOOL)isInvisible
{
  CGPath *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGRect BoundingBox;
  CGRect v14;

  v3 = -[CRLImageLayout pathToStroke](self, "pathToStroke");
  if (v3)
  {
    BoundingBox = CGPathGetBoundingBox(v3);
    x = BoundingBox.origin.x;
    y = BoundingBox.origin.y;
    width = BoundingBox.size.width;
    height = BoundingBox.size.height;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    objc_msgSend(v8, "size");
    x = sub_10005FDDC();
    y = v9;
    width = v10;
    height = v11;

  }
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  return CGRectIsNull(v14);
}

- (BOOL)shouldDisplayGuides
{
  objc_super v4;

  if (-[CRLImageLayout isResizingInMaskEditMode](self, "isResizingInMaskEditMode")
    || -[CRLImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode"))
  {
    return 1;
  }
  if (BYTE3(self->mBaseInfoGeometry))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  return -[CRLCanvasLayout shouldDisplayGuides](&v4, "shouldDisplayGuides");
}

- (BOOL)maskIntersectsImage
{
  return BYTE3(self->mLayoutToMaskTransform.tx);
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  -[CRLBoardItemLayout beginDynamicOperationWithRealTimeCommands:](&v9, "beginDynamicOperationWithRealTimeCommands:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
  objc_msgSend(v5, "beginDynamicOperationWithRealTimeCommands:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
  v7 = objc_msgSend(v6, "copy");
  v8 = *(void **)((char *)&self->mLastParentLimitedSize.height + 3);
  *(_QWORD *)((char *)&self->mLastParentLimitedSize.height + 3) = v7;

}

- (void)endDynamicOperation
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = *(void **)((char *)&self->mLastParentLimitedSize.height + 3);
  *(CGFloat *)((char *)&self->mLastParentLimitedSize.height + 3) = 0.0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
  objc_msgSend(v4, "endDynamicOperation");

  v5.receiver = self;
  v5.super_class = (Class)CRLImageLayout;
  -[CRLBoardItemLayout endDynamicOperation](&v5, "endDynamicOperation");
}

- (void)beginResize
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout beginResize](&v6, "beginResize");
  -[CRLImageLayout p_createDynamicCopiesIfNeeded](self, "p_createDynamicCopiesIfNeeded");
  if ((id)-[CRLImageLayout maskEditMode](self, "maskEditMode") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    objc_msgSend(v3, "size");
    -[CRLCanvasLayout setInitialBoundsForStandardKnobs:](self, "setInitialBoundsForStandardKnobs:", sub_10005FDDC());

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    v5 = objc_msgSend(v4, "copy");
    -[CRLCanvasLayout setOriginalGeometry:](self, "setOriginalGeometry:", v5);

  }
}

- (void)endResize
{
  objc_super v3;

  -[CRLImageLayout p_destroyDynamicCopiesIfNeeded](self, "p_destroyDynamicCopiesIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout endResize](&v3, "endResize");
}

- (id)commandToResetToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  _TtC8Freeform15CRLCommandGroup *v7;
  id v8;
  void *v9;
  CRLBezierPath *v10;
  CRLBezierPathSource *v11;
  CRLCanvasInfoGeometry *v12;
  _TtC8Freeform17CRLCommandSetMask *v13;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](self, "imageInfo"));
  v7 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v15.receiver = self;
  v15.super_class = (Class)CRLImageLayout;
  v8 = -[CRLMediaLayout commandToResetToSize:](&v15, "commandToResetToSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[CRLCommandGroup addCommand:](v7, "addCommand:", v9);
  if (!-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    v10 = objc_alloc_init(CRLBezierPath);
    -[CRLBezierPath appendBezierPathWithRect:](v10, "appendBezierPathWithRect:", sub_10005FDDC());
    v11 = -[CRLBezierPathSource initWithBezierPath:]([CRLBezierPathSource alloc], "initWithBezierPath:", v10);
    v12 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", width, height);
    v13 = -[CRLCommandSetMask initWithImageItem:maskGeometry:maskPath:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskGeometry:maskPath:", v6, v12, v11);
    -[CRLCommandGroup addCommand:](v7, "addCommand:", v13);

  }
  return v7;
}

- (void)beginDrag
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout beginDrag](&v3, "beginDrag");
  -[CRLImageLayout p_createDynamicCopiesIfNeeded](self, "p_createDynamicCopiesIfNeeded");
  if ((id)-[CRLImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") == (id)3)
  {
    -[CRLCanvasLayout invalidateSize](self, "invalidateSize");
    -[CRLCanvasLayout validate](self, "validate");
  }
  else
  {
    -[CRLImageLayout maskEditModeForDragging](self, "maskEditModeForDragging");
  }
}

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    if ((id)-[CRLImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") == (id)3)
    {
      v15 = objc_msgSend(*(id *)((char *)&self->mHasAlpha + 3), "mutableCopy");
      objc_msgSend(v15, "position");
      objc_msgSend(v15, "setPosition:", sub_1000603D0(v7, v8, x));
      -[CRLImageLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      objc_msgSend(v9, "dragBy:", x, y);

LABEL_9:
      return;
    }
    if ((id)-[CRLImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") == (id)2)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      objc_msgSend(v15, "dragBy:", x, y);
      goto LABEL_9;
    }
    v16.receiver = self;
    v16.super_class = (Class)CRLImageLayout;
    -[CRLBoardItemLayout dragBy:](&v16, "dragBy:", x, y);
    if (!*(_QWORD *)((char *)&self->mLastParentLimitedSize.height + 3))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247ED0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E11DC4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247EF0);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout dragBy:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 616, 0, "invalid nil value for '%{public}s'", "mBaseImageLayoutGeometry");

    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), "geometryByTranslatingBy:", x, y));
    v14 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
    *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v13;

  }
}

- (void)endDrag
{
  objc_super v3;

  if (!-[CRLImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode"))
    objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), *(id *)((char *)&self->mLastParentLimitedSize.height + 3));
  -[CRLImageLayout p_destroyDynamicCopiesIfNeeded](self, "p_destroyDynamicCopiesIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout endDrag](&v3, "endDrag");
}

- (void)beginRotate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout beginRotate](&v3, "beginRotate");
  -[CRLImageLayout p_createDynamicCopiesIfNeeded](self, "p_createDynamicCopiesIfNeeded");
}

- (void)endRotate
{
  objc_super v3;

  -[CRLImageLayout p_destroyDynamicCopiesIfNeeded](self, "p_destroyDynamicCopiesIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout endRotate](&v3, "endRotate");
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform t2;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;

  memset(&v18, 0, sizeof(v18));
  v7 = *(void **)((char *)&self->mLastParentLimitedSize.height + 3);
  if (v7)
    objc_msgSend(v7, "fullTransform");
  else
    memset(&v16, 0, sizeof(v16));
  CGAffineTransformInvert(&t1, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout infoGeometryBeforeDynamicOperation](self, "infoGeometryBeforeDynamicOperation"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "fullTransform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v18, &t1, &t2);

  v12 = v18;
  CGAffineTransformInvert(&v13, &v12);
  v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v14, &v13, &v12);
  v12 = v18;
  return CGAffineTransformConcat(retstr, &v14, &v12);
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4;
  _OWORD v5[3];
  _BYTE v6[48];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLImageLayout;
  -[CRLBoardItemLayout takeRotationFromTracker:](&v7, "takeRotationFromTracker:", v4);
  if (v4)
    objc_msgSend(v4, "rotateTransform");
  else
    memset(v5, 0, sizeof(v5));
  -[CRLImageLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v5);
  -[CRLImageLayout resizeWithTransform:](self, "resizeWithTransform:", v6);

}

- (CGPoint)centerForRotation
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[CRLImageLayout isRotatingInMaskEditMode](self, "isRotatingInMaskEditMode"))
  {
    -[CRLImageLayout centerForRotationInMaskMode](self, "centerForRotationInMaskMode");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLImageLayout;
    -[CRLCanvasLayout centerForRotation](&v5, "centerForRotation");
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)centerForRotationInMaskMode
{
  void *v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
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
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double x;
  double y;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGPoint result;

  if ((id)-[CRLImageLayout maskEditModeForRotating](self, "maskEditModeForRotating") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    objc_msgSend(v3, "size");
    v4 = sub_10005FDDC();
    v8 = sub_100061400(v4, v5, v6, v7);
    v10 = v9;

    -[CRLImageLayout layoutToImageTransform](self, "layoutToImageTransform");
    v11 = v39;
    v12 = v37;
    v13 = v10 * v38 + v36 * v8;
    v14 = v40;
    v15 = v41;
LABEL_5:
    x = v14 + v13;
    y = v15 + v10 * v11 + v12 * v8;
    goto LABEL_15;
  }
  if ((id)-[CRLImageLayout maskEditModeForRotating](self, "maskEditModeForRotating") == (id)2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometry"));
    objc_msgSend(v17, "size");
    v18 = sub_10005FDDC();
    v8 = sub_100061400(v18, v19, v20, v21);
    v10 = v22;

    -[CRLImageLayout layoutToMaskTransform](self, "layoutToMaskTransform");
    v11 = v33;
    v12 = v31;
    v13 = v10 * v32 + v30 * v8;
    v14 = v34;
    v15 = v35;
    goto LABEL_5;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101247F10);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E11E50();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101247F30);
  v25 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v25);
  x = CGPointZero.x;
  y = CGPointZero.y;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout centerForRotationInMaskMode]"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 682, 0, "asking for mask mode center of rotation when not in mask edit mode");

LABEL_15:
  v28 = x;
  v29 = y;
  result.y = v29;
  result.x = v28;
  return result;
}

- (CGPoint)centerForConnecting
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64_t v16;
  double v17;
  float64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v23;
  objc_super v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout i_wrapPath](self, "i_wrapPath"));
  if ((uint64_t)objc_msgSend(v3, "elementCount") < 2)
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLImageLayout;
    -[CRLCanvasLayout centerForConnecting](&v24, "centerForConnecting");
    v23.f64[0] = v16;
    v18 = v17;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout i_wrapPath](self, "i_wrapPath"));
    objc_msgSend(v4, "bounds");
    v9 = sub_100061400(v5, v6, v7, v8);
    v21 = v10;
    v22 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "transform");
      v13 = v25;
      v14 = v26;
      v15 = v27;
    }
    else
    {
      v15 = 0uLL;
      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
      v13 = 0uLL;
      v14 = 0uLL;
    }
    v23 = vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v21), v13, v22));
    v18 = v23.f64[1];

  }
  v19 = v23.f64[0];
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  objc_super v8;
  _OWORD v9[3];

  if ((id)-[CRLImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == (id)2)
    return 0;
  if ((id)-[CRLImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "transform");
    else
      memset(v9, 0, sizeof(v9));
    v7 = sub_100079330((double *)v9, 0.0001);

    if (!v7)
      return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  return -[CRLCanvasLayout canAspectRatioLockBeChangedByUser](&v8, "canAspectRatioLockBeChangedByUser");
}

- (BOOL)resizeMayChangeAspectRatio
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  objc_super v8;
  _OWORD v9[3];

  if ((id)-[CRLImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == (id)2)
    return 1;
  if ((id)-[CRLImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "transform");
    else
      memset(v9, 0, sizeof(v9));
    v7 = sub_100079330((double *)v9, 0.0001);

    if (!v7)
      return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  return -[CRLCanvasLayout resizeMayChangeAspectRatio](&v8, "resizeMayChangeAspectRatio");
}

- (BOOL)shouldSnapWhileResizing
{
  objc_super v4;

  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode")
    && (id)-[CRLImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == (id)3)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  return -[CRLCanvasAbstractLayout shouldSnapWhileResizing](&v4, "shouldSnapWhileResizing");
}

- (void)resizeWithTransform:(CGAffineTransform *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  CGAffineTransform *p_t2;
  __int128 v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v24;

  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode")
    && (id)-[CRLImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") != (id)3)
  {
    if ((id)-[CRLImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") != (id)2)
      return;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v12 = v11;
    v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v24.c = v15;
    *(_OWORD *)&v24.tx = *(_OWORD *)&a3->tx;
    p_t2 = &v24;
    goto LABEL_20;
  }
  memset(&v24, 0, sizeof(v24));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout originalImageGeometry](self, "originalImageGeometry"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "fullTransform");
  else
    memset(&t1, 0, sizeof(t1));
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v24, &t1, &t2);

  t2 = v24;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &t2));
  -[CRLImageLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v8);

  if ((id)-[CRLImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == (id)3)
  {
    memset(&t2, 0, sizeof(t2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout originalImageGeometry](self, "originalImageGeometry"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v21, &v20);
    v16 = *(void **)((char *)&self->mHasAlpha + 3);
    if (v16)
      objc_msgSend(v16, "transform");
    else
      memset(&v19, 0, sizeof(v19));
    CGAffineTransformConcat(&t2, &v21, &v19);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v17 = t2;
    CGAffineTransformInvert(&v18, &v17);
    p_t2 = &v18;
    v11 = v12;
    goto LABEL_20;
  }
  if (!-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode")
    && (-[CRLCanvasLayout layoutState](self, "layoutState") == 4
     || -[CRLCanvasLayout layoutState](self, "layoutState") == 5))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v12 = v11;
    v13 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v13;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    p_t2 = &t2;
LABEL_20:
    objc_msgSend(v11, "resizeWithTransform:", p_t2);

  }
}

- (void)takeSizeFromTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  -[CRLBoardItemLayout takeSizeFromTracker:](&v4, "takeSizeFromTracker:", a3);
  -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)takeScaledImageGeometry:(id)a3 maskGeometry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!BYTE3(self->mBaseInfoGeometry))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247F50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11ED0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247F70);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout takeScaledImageGeometry:maskGeometry:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 767, 0, "wrong mode");

  }
  -[CRLImageLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
  objc_msgSend(v11, "takeScaledMaskGeometry:", v7);

  -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)beginFreeTransformWithTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout beginFreeTransformWithTracker:](&v4, "beginFreeTransformWithTracker:", a3);
  -[CRLImageLayout p_createDynamicCopiesIfNeeded](self, "p_createDynamicCopiesIfNeeded");
}

- (void)endFreeTransform
{
  objc_super v3;

  -[CRLImageLayout p_destroyDynamicCopiesIfNeeded](self, "p_destroyDynamicCopiesIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  -[CRLCanvasLayout endFreeTransform](&v3, "endFreeTransform");
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  unsigned int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLImageLayout;
  v4 = a3;
  -[CRLBoardItemLayout takeFreeTransformFromTracker:](&v6, "takeFreeTransformFromTracker:", v4);
  v5 = objc_msgSend(v4, "isResizing", v6.receiver, v6.super_class);

  if (v5)
    -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  id v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  __int128 v12;
  _OWORD v13[3];
  _QWORD v14[5];

  v7 = a3;
  objc_opt_class(_TtC8Freeform12CRLImageItem, v8);
  v10 = sub_1002223BC(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100253348;
  v14[3] = &unk_101247F98;
  v14[4] = v11;
  v12 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a4->tx;
  -[CRLImageLayout p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:](self, "p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:", v13, v14);

}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  id v4;
  _OWORD v6[3];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1002534A8;
  v12 = sub_1002534B8;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002534C0;
  v7[3] = &unk_101247FC0;
  v7[4] = self;
  v7[5] = &v8;
  v3 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&a3->tx;
  -[CRLImageLayout p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:](self, "p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:", v6, v7);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)p_calculateClampModelValuesWithAdditionalTransform:(CGAffineTransform *)a3 andPerformBlock:(id)a4
{
  void (**v6)(id, void *, void *, id);
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _OWORD v19[3];
  _OWORD v20[3];

  v6 = (void (**)(id, void *, void *, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
  v8 = *(_OWORD *)&a3->c;
  v20[0] = *(_OWORD *)&a3->a;
  v20[1] = v8;
  v20[2] = *(_OWORD *)&a3->tx;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometryByTransformingBy:", v20));

  if (v9)
    objc_msgSend(v9, "fullTransform");
  else
    memset(v19, 0, sizeof(v19));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", v19));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pureGeometry"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "computeInfoGeometryFromPureLayoutGeometry:", v13));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathSource"));
    v18 = objc_msgSend(v17, "copy");

    objc_msgSend(v15, "size");
    objc_msgSend(v18, "scaleToNaturalSize:");
    v6[2](v6, v10, v15, v18);

  }
  else
  {
    v6[2](v6, v10, 0, 0);
  }

}

- (CRLSmartPathSource)smartPathSource
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathSource"));
  objc_opt_class(CRLPathSource, v4);
  v11 = sub_10022209C(v3, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return (CRLSmartPathSource *)v12;
}

- (CGRect)pathBoundsWithoutStroke
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout smartPathSource](self, "smartPathSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bezierPath"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)maskWasReset
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247FE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11F50();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248000);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout maskWasReset]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 882, 0, "Mask should never be reset in mask edit mode");

  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = 0;
}

- (void)maskWasApplied
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248020);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11FD0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248040);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout maskWasApplied]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 887, 0, "maskWasApplied should not be called in mask edit mode");

  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)1;
}

- (void)beginEditingMaskInMaskEditMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248060);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E120F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248080);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout beginEditingMaskInMaskEditMode:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 892, 0, "Invalid parameter not satisfying: %{public}s", "(maskEditMode == CRLMaskEditModeEditingImage) || (maskEditMode == CRLMaskEditModeEditingMask)");

  }
  if (-[CRLImageLayout maskEditMode](self, "maskEditMode") == a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012480A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12050();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012480C0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout beginEditingMaskInMaskEditMode:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 893, 0, "already editing mask in mode %ld", a3);

  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("CRLImageLayoutMaskEditModeDidChangeNotification"), self);

}

- (void)endMaskEditMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((id)-[CRLImageLayout maskEditMode](self, "maskEditMode") != (id)3
    && (id)-[CRLImageLayout maskEditMode](self, "maskEditMode") != (id)2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012480E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12180();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248100);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout endMaskEditMode]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 899, 0, "not in mask edit mode");

  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("CRLImageLayoutMaskEditModeDidChangeNotification"), self);

}

- (BOOL)isInMaskEditMode
{
  return (id)-[CRLImageLayout maskEditMode](self, "maskEditMode") == (id)2
      || (id)-[CRLImageLayout maskEditMode](self, "maskEditMode") == (id)3;
}

- (BOOL)isDraggingInMaskEditMode
{
  _BOOL4 v3;

  v3 = -[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  if (v3)
    LOBYTE(v3) = -[CRLCanvasLayout layoutState](self, "layoutState") == 2
              || -[CRLCanvasLayout layoutState](self, "layoutState") == 5;
  return v3;
}

- (BOOL)isRotatingInMaskEditMode
{
  _BOOL4 v3;

  v3 = -[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  if (v3)
    LOBYTE(v3) = -[CRLCanvasLayout layoutState](self, "layoutState") == 3
              || -[CRLCanvasLayout layoutState](self, "layoutState") == 5;
  return v3;
}

- (BOOL)isResizingInMaskEditMode
{
  _BOOL4 v3;

  v3 = -[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  if (v3)
    LOBYTE(v3) = -[CRLCanvasLayout layoutState](self, "layoutState") == 4
              || -[CRLCanvasLayout layoutState](self, "layoutState") == 5;
  return v3;
}

- (int64_t)maskEditModeForDragging
{
  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
    return 3;
  else
    return -[CRLImageLayout maskEditMode](self, "maskEditMode");
}

- (int64_t)maskEditModeForRotating
{
  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
    return 3;
  else
    return -[CRLImageLayout maskEditMode](self, "maskEditMode");
}

- (int64_t)maskEditModeForResizing
{
  if (BYTE3(self->mBaseInfoGeometry))
    return 3;
  else
    return -[CRLImageLayout maskEditMode](self, "maskEditMode");
}

- (int64_t)maskEditModeForFreeTransforming
{
  if (-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
    return 3;
  else
    return -[CRLImageLayout maskEditMode](self, "maskEditMode");
}

- (int64_t)maskEditModeForLayoutState
{
  unsigned int v3;

  v3 = -[CRLCanvasLayout layoutState](self, "layoutState");
  switch(v3)
  {
    case 5u:
      return -[CRLImageLayout maskEditModeForFreeTransforming](self, "maskEditModeForFreeTransforming");
    case 3u:
      return -[CRLImageLayout maskEditModeForRotating](self, "maskEditModeForRotating");
    case 2u:
      return -[CRLImageLayout maskEditModeForDragging](self, "maskEditModeForDragging");
  }
  return -[CRLImageLayout maskEditModeForResizing](self, "maskEditModeForResizing");
}

- (void)maskModeScaleDidBegin
{
  BYTE3(self->mBaseInfoGeometry) = 1;
  objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3), "maskModeScaleDidBegin");
}

- (void)maskModeScaleDidEnd
{
  BYTE3(self->mBaseInfoGeometry) = 0;
  objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3), "maskModeScaleDidEnd");
}

- (_TtC8Freeform12CRLImageItem)imageInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLImageItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLImageItem *)v8;
}

- (CRLCanvasLayoutGeometry)imageGeometry
{
  return (CRLCanvasLayoutGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super._boundsForStandardKnobs.size.width
                                                                            + 3));
}

- (CRLCanvasLayoutGeometry)originalImageGeometry
{
  return (CRLCanvasLayoutGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->mLastParentLimitedSize.height
                                                                            + 3));
}

- (CRLCanvasLayoutGeometry)imageGeometryInRoot
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = objc_msgSend(*(id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), "mutableCopy");
  v4 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry", v10, v11, v12));
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "transform");
      }
      else
      {
        v11 = 0u;
        v12 = 0u;
        v10 = 0u;
      }
      objc_msgSend(v3, "transformBy:", &v10);

      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parent"));
      v5 = (void *)v8;
    }
    while (v8);
  }
  return (CRLCanvasLayoutGeometry *)v3;
}

- (id)inspectorGeometry
{
  void *v3;
  id v4;
  CRLCanvasLayoutGeometry *v5;
  void *v6;
  CRLCanvasLayoutGeometry *v8;
  objc_super v9;
  objc_super v10;

  if ((id)-[CRLImageLayout maskEditMode](self, "maskEditMode") == (id)3
    || (id)-[CRLImageLayout maskEditMode](self, "maskEditMode") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout p_inspectorGeometryForUnmaskedImage](self, "p_inspectorGeometryForUnmaskedImage"));
    v4 = objc_msgSend(v3, "mutableCopy");

    v10.receiver = self;
    v10.super_class = (Class)CRLImageLayout;
    v5 = -[CRLCanvasLayout inspectorGeometry](&v10, "inspectorGeometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v6, "size");
    objc_msgSend(v4, "setSize:");

    return v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLImageLayout;
    v8 = -[CRLCanvasLayout inspectorGeometry](&v9, "inspectorGeometry");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (id)p_inspectorGeometryForUnmaskedImage
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v17 = v4;
  v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v5 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if (objc_msgSend(v6, "isRootLayoutForInspectorGeometry"))
        break;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
      v8 = v7;
      if (v7)
      {
        v12[0] = v16;
        v12[1] = v17;
        v12[2] = v18;
        objc_msgSend(v7, "transformByConcatenatingTransformTo:", v12);
      }
      else
      {
        v14 = 0u;
        v15 = 0u;
        v13 = 0u;
      }
      v16 = v13;
      v17 = v14;
      v18 = v15;

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
      v6 = (void *)v9;
    }
    while (v9);

  }
  v13 = v16;
  v14 = v17;
  v15 = v18;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometryByTransformingBy:", &v13));

  return v10;
}

- (BOOL)hasMaskingPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));

  if (v3 && !*(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248120);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12200();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248140);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout hasMaskingPath]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1043, 0, "If image has masking path it must specify a path to stroke");

  }
  return v3 != 0;
}

- (CGPath)pathToStroke
{
  return *(CGPath **)((char *)&self->mImageGeometry + 3);
}

- (CGSize)sizeOfFrameRectIncludingCoverage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (*(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout stroke](self, "stroke"));
    objc_msgSend(v3, "boundsIncludingCRLStroke:", v4);
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    objc_msgSend(v3, "size");
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGAffineTransform)layoutToImageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)&self[10].tx + 3);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self[10].c + 3);
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)((char *)&self[11].a + 3);
  return self;
}

- (CGAffineTransform)layoutToMaskTransform
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)&self[11].tx + 3);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self[11].c + 3);
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)((char *)&self[12].a + 3);
  return self;
}

- (CRLMaskLayout)maskLayout
{
  return (CRLMaskLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super._boundsForStandardKnobs.size.height
                                                                  + 3));
}

- (id)computeWrapPath
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  CRLBezierPath *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  CRLBezierPath *v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageInfo](self, "imageInfo"));
  *(_QWORD *)&v5 = objc_opt_class(CRLStroke, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout stroke](self, "stroke", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
    v11 = objc_msgSend(v10, "shouldRender");
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "computeLayoutGeometry"));

  memset(&v50, 0, sizeof(v50));
  if (v12)
  {
    if (v14)
      objc_msgSend(v14, "transform");
    else
      memset(&v49, 0, sizeof(v49));
    CGAffineTransformInvert(&v50, &v49);
  }
  else
  {
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v50.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v50.c = v15;
    *(_OWORD *)&v50.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "providerForAsset:shouldValidate:", v17, 1));

  if (v11 && -[CRLImageLayout hasAlpha](self, "hasAlpha") && (objc_msgSend(v18, "isError") & 1) == 0)
  {
    objc_msgSend(v18, "naturalSize");
    v44 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
    v20 = (id)objc_claimAutoreleasedReturnValue(v44);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracedPath"));
    v20 = objc_msgSend(v19, "copy");

  }
  objc_msgSend(v20, "bounds");
  if (!CGRectIsEmpty(v51))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    objc_msgSend(v24, "size");
    v26 = v25;
    v28 = v27;

    v29 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v48.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v48.c = v29;
    *(_OWORD *)&v48.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if ((objc_msgSend(v18, "isError") & 1) == 0)
    {
      objc_msgSend(v18, "naturalSize");
      CGAffineTransformMakeScale(&v48, v26 / v30, v28 / v31);
      v47 = v48;
      objc_msgSend(v20, "transformUsingAffineTransform:", &v47);
    }
    if (v12)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout maskLayout](self, "maskLayout"));
      v47 = v50;
      objc_msgSend(v20, "transformUsingAffineTransform:", &v47);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v32, "path")));
      objc_msgSend(v32, "pathBounds");
      CGAffineTransformMakeTranslation(&v46, -v34, -v35);
      objc_msgSend(v33, "transformUsingAffineTransform:", &v46);
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "intersectBezierPath:", v33));

      if (!v11)
        goto LABEL_21;
    }
    else
    {
      v23 = v20;
      if (!v11)
        goto LABEL_21;
    }
    objc_msgSend(v23, "takeAttributesFromStroke:", v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "strokedCopy"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uniteWithBezierPath:", v36));

    v23 = (id)v37;
    goto LABEL_21;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v21, "size");
  v22 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
  v23 = (id)objc_claimAutoreleasedReturnValue(v22);

LABEL_21:
  if ((uint64_t)objc_msgSend(v23, "elementCount") >= 2)
  {
    objc_msgSend(v23, "bounds");
    v39 = fmin(v38, 0.0);
    v41 = fmin(v40, 0.0);
    if (!sub_10005FDF0(CGPointZero.x, CGPointZero.y, v39, v41))
    {
      CGAffineTransformMakeTranslation(&v45, -v39, -v41);
      objc_msgSend(v23, "transformUsingAffineTransform:", &v45);
    }
  }
  v42 = v23;

  return v42;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (BOOL)allowsConnections
{
  return !-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode");
}

- (void)p_createDynamicCopiesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  _OWORD v10[3];

  if (*(unint64_t *)((char *)&self->mHasAlpha + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248160);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12280();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248180);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_createDynamicCopiesIfNeeded]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1165, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
  if (-[CRLImageLayout p_shouldUseDynamicInfoGeometryForOperation](self, "p_shouldUseDynamicInfoGeometryForOperation"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayout imageGeometry](self, "imageGeometry"));
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "fullTransform");
    else
      memset(v10, 0, sizeof(v10));
    v8 = objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", v10));
    v9 = *(void **)((char *)&self->mHasAlpha + 3);
    *(unint64_t *)((char *)&self->mHasAlpha + 3) = v8;

  }
}

- (BOOL)p_shouldUseDynamicInfoGeometryForOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[CRLCanvasLayout layoutState](self, "layoutState"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012481A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E123B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012481C0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_shouldUseDynamicInfoGeometryForOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1174, 0, "expected inequality between %{public}s and %{public}s", "self.layoutState", "CRLCanvasLayoutStatic");

  }
  if (-[CRLCanvasLayout layoutState](self, "layoutState") == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012481E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1230C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248200);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_shouldUseDynamicInfoGeometryForOperation]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1176, 0, "expected inequality between %{public}s and %{public}s", "self.layoutState", "CRLCanvasLayoutDynamic");

  }
  return (id)-[CRLImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == (id)3
      || !-[CRLImageLayout isInMaskEditMode](self, "isInMaskEditMode")
      && (-[CRLCanvasLayout layoutState](self, "layoutState") == 4
       || -[CRLCanvasLayout layoutState](self, "layoutState") == 3
       || -[CRLCanvasLayout layoutState](self, "layoutState") == 5);
}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  if (!*(unint64_t *)((char *)&self->mHasAlpha + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248220);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12464();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248240);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_setDynamicInfoGeometry:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1195, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
  v8 = objc_msgSend(v4, "copy");
  v9 = *(void **)((char *)&self->mHasAlpha + 3);
  *(unint64_t *)((char *)&self->mHasAlpha + 3) = (unint64_t)v8;

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");

}

- (void)p_destroyDynamicCopiesIfNeeded
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[CRLImageLayout p_shouldUseDynamicInfoGeometryForOperation](self, "p_shouldUseDynamicInfoGeometryForOperation");
  v4 = *(void **)((char *)&self->mHasAlpha + 3);
  if ((v3 & 1) != 0)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012482A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E124F0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012482C0);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_destroyDynamicCopiesIfNeeded]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1209, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

      v4 = *(void **)((char *)&self->mHasAlpha + 3);
    }
    *(unint64_t *)((char *)&self->mHasAlpha + 3) = 0;

    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
    -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
  }
  else if (v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248260);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1257C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248280);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_destroyDynamicCopiesIfNeeded]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1205, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
}

- (int64_t)maskEditMode
{
  return *(int64_t *)((char *)&self->mDynamicInfoGeometry + 3);
}

- (BOOL)isInMaskScaleMode
{
  return BYTE3(self->mBaseInfoGeometry);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->mBaseImageLayoutGeometry + 3), 0);
  objc_storeStrong((id *)((char *)&self->mHasAlpha + 3), 0);
  objc_storeStrong((id *)((char *)&self->mLastParentLimitedSize.height + 3), 0);
  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3), 0);
  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), 0);
}

@end
