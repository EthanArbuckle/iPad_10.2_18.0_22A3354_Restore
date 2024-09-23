@implementation TSDImageLayout

- (TSDImageLayout)initWithInfo:(id)a3
{
  TSDImageLayout *v3;
  TSDImageLayout *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDImageLayout;
  v3 = -[TSDMediaLayout initWithInfo:](&v7, sel_initWithInfo_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = -[TSDImageLayout imageInfo](v3, "imageInfo");
    if (v5)
    {
      if (objc_msgSend(v5, "maskInfo"))
        v4->mMaskEditMode = 1;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mMaskLayout = 0;
  self->mImageGeometry = 0;

  self->mBaseImageLayoutGeometry = 0;
  self->mDynamicInfoGeometry = 0;
  CGPathRelease(self->mPathToStroke);

  self->mTracedPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  -[TSDDrawableLayout dealloc](&v3, sel_dealloc);
}

- (id)geometryForTransforming
{
  if (-[TSDImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == 3)
    return -[TSDImageLayout imageGeometry](self, "imageGeometry");
  else
    return -[TSDAbstractLayout geometry](self, "geometry");
}

- (id)visibleGeometries
{
  _BOOL4 v3;
  TSDLayoutGeometry *v4;
  void *v5;
  TSDLayoutGeometry **v6;
  uint64_t v7;
  TSDLayoutGeometry *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  v4 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v3)
  {
    v10[0] = v4;
    v10[1] = -[TSDImageLayout imageGeometry](self, "imageGeometry");
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = (TSDLayoutGeometry **)v10;
    v7 = 2;
  }
  else
  {
    v9 = v4;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v9;
    v7 = 1;
  }
  return (id)objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9);
}

- (id)currentInfoGeometry
{
  if (self->mDynamicInfoGeometry)
    return self->mDynamicInfoGeometry;
  else
    return (id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
}

- (id)layoutGeometryFromInfo
{
  id v2;
  TSDLayoutGeometry *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v9[3];

  v2 = -[TSDImageLayout currentInfoGeometry](self, "currentInfoGeometry");
  v3 = [TSDLayoutGeometry alloc];
  objc_msgSend(v2, "size");
  v5 = v4;
  v7 = v6;
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(v9, 0, sizeof(v9));
  return -[TSDLayoutGeometry initWithSize:transform:](v3, "initWithSize:transform:", v9, v5, v7);
}

- (id)computeLayoutGeometry
{
  id v3;
  TSDMutableLayoutGeometry *v4;
  TSDMutableLayoutGeometry *v5;
  void *v6;
  id v7;
  void *v8;
  TSDLayoutGeometry *v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  TSDBezierPath *v14;
  double v15;
  double v16;
  TSDLayoutGeometry *v17;
  __int128 v18;
  TSDBezierPath *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  int v30;
  TSDBezierPath *v31;
  CGPath *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat width;
  CGFloat height;
  double x;
  double y;
  TSDMutableLayoutGeometry *v45;
  TSDMutableLayoutGeometry *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  const CGPath *v51;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  double v81;
  double v82;
  double v83;
  id v84;
  void *v85;
  void *v86;
  TSDLayoutGeometry *v87;
  double v89;
  CGFloat v90;
  __int128 v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  __int128 v100;
  __int128 v101;
  double v102;
  __int128 v103;
  double v104;
  __int128 v105;
  CGAffineTransform v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  CGAffineTransform t2;
  CGAffineTransform v110;
  CGAffineTransform t1;
  _OWORD v112[3];
  _OWORD v113[3];
  _OWORD v114[3];
  CGAffineTransform v115;
  CGAffineTransform v116;
  char v117[48];
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  objc_super v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;

  v3 = -[TSDImageLayout maskLayout](self, "maskLayout");
  if (v3)
  {
    v4 = -[TSDLayout layoutGeometryFromProvider](self, "layoutGeometryFromProvider");
  }
  else
  {
    v122.receiver = self;
    v122.super_class = (Class)TSDImageLayout;
    v4 = -[TSDLayout computeLayoutGeometry](&v122, sel_computeLayoutGeometry);
  }
  v5 = v4;

  self->mImageGeometry = (TSDLayoutGeometry *)v5;
  objc_opt_class();
  -[TSDMediaLayout stroke](self, "stroke");
  v6 = (void *)TSUDynamicCast();
  CGPathRelease(self->mPathToStroke);
  self->mPathToStroke = 0;
  -[TSDMediaLayout setShouldRenderFrameStroke:](self, "setShouldRenderFrameStroke:", 0);
  v7 = -[TSDImageLayout imageInfo](self, "imageInfo");
  v8 = v7;
  if (v3)
  {
    v9 = (TSDLayoutGeometry *)objc_msgSend(v3, "computeLayoutGeometry");
    if (-[TSDLayout layoutState](self, "layoutState") != 3)
    {
      -[TSDLayoutGeometry size](v9, "size");
      -[TSDLayout scaleForInlineClampingUnrotatedSize:withGeometry:](self, "scaleForInlineClampingUnrotatedSize:withGeometry:", -[TSDAbstractLayout geometry](self, "geometry"), v10, v11);
      v13 = v12;
      CGAffineTransformMakeScale(&v121, v12, v12);
      v9 = -[TSDLayoutGeometry geometryByTransformingBy:](v9, "geometryByTransformingBy:", &v121);
      CGAffineTransformMakeScale(&v120, v13, v13);
      v5 = -[TSDLayoutGeometry geometryByTransformingBy:](v5, "geometryByTransformingBy:", &v120);
      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "setPathScale:", v13);
      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "setGeometry:", v9);

      self->mImageGeometry = (TSDLayoutGeometry *)v5;
    }
    v14 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", objc_msgSend(v3, "path"));
    objc_msgSend(v3, "pathBounds");
    CGAffineTransformMakeTranslation(&v118, -v15, -v16);
    -[TSDBezierPath transformUsingAffineTransform:](v14, "transformUsingAffineTransform:", &v118);
LABEL_10:
    -[TSDLayoutGeometry size](v5, "size");
    v19 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
    if (objc_msgSend(v8, "instantAlphaPath"))
    {
      v20 = (void *)objc_msgSend((id)objc_msgSend(v8, "instantAlphaPath"), "copy");
      -[TSDImageLayout imageDataToVisualSizeTransform](self, "imageDataToVisualSizeTransform");
      objc_msgSend(v20, "transformUsingAffineTransform:", v117);
      objc_msgSend(v20, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v19 = v20;
      if (v9)
      {
LABEL_12:
        -[TSDLayoutGeometry transform](v9, "transform");
        goto LABEL_15;
      }
    }
    else
    {
      v22 = *MEMORY[0x24BDBF090];
      v24 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v26 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v28 = *(double *)(MEMORY[0x24BDBF090] + 24);
      if (v9)
        goto LABEL_12;
    }
    memset(&v115, 0, sizeof(v115));
LABEL_15:
    CGAffineTransformInvert(&v116, &v115);
    -[TSDBezierPath transformUsingAffineTransform:](v19, "transformUsingAffineTransform:", &v116);
    if (v14)
      v19 = -[TSDBezierPath intersectBezierPath:](v14, "intersectBezierPath:", v19);
    if (v19)
    {
      v29 = -[TSDBezierPath elementCount](v19, "elementCount");
      self->mMaskIntersectsImage = v29 > 1;
      if (v29 > 1)
        goto LABEL_22;
    }
    else
    {
      self->mMaskIntersectsImage = 0;
    }
    if (!objc_msgSend(v6, "isFrame"))
    {
      if (v5)
        -[TSDLayoutGeometry transform](v5, "transform");
      else
        memset(v112, 0, sizeof(v112));
      v46 = -[TSDLayoutGeometry geometryByTransformingBy:](v9, "geometryByTransformingBy:", v112);
      -[TSDLayoutGeometry size](v9, "size");
      -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", TSDRectWithSize());
      v77 = MEMORY[0x24BDBD8B8];
      v78 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&self->mLayoutToMaskTransform.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&self->mLayoutToMaskTransform.c = v78;
      *(_OWORD *)&self->mLayoutToMaskTransform.tx = *(_OWORD *)(v77 + 32);
LABEL_48:
      if (v9)
        -[TSDLayoutGeometry transform](v9, "transform");
      else
        memset(&v110, 0, sizeof(v110));
      CGAffineTransformInvert(&t1, &v110);
      v79 = *(_OWORD *)&self->mLayoutToMaskTransform.c;
      *(_OWORD *)&t2.a = *(_OWORD *)&self->mLayoutToMaskTransform.a;
      *(_OWORD *)&t2.c = v79;
      *(_OWORD *)&t2.tx = *(_OWORD *)&self->mLayoutToMaskTransform.tx;
      CGAffineTransformConcat(&v119, &t1, &t2);
      v80 = *(_OWORD *)&v119.c;
      *(_OWORD *)&self->mLayoutToImageTransform.a = *(_OWORD *)&v119.a;
      *(_OWORD *)&self->mLayoutToImageTransform.c = v80;
      *(_OWORD *)&self->mLayoutToImageTransform.tx = *(_OWORD *)&v119.tx;
      goto LABEL_52;
    }
LABEL_22:
    v30 = objc_msgSend(v6, "isFrame");
    v104 = v22;
    v102 = v24;
    if (v14 && v30)
      v31 = v14;
    else
      v31 = v19;
    v32 = CGPathRetain(-[TSDBezierPath CGPath](v31, "CGPath"));
    self->mPathToStroke = v32;
    -[TSDBezierPath boundsIncludingTSDStroke:](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v32), "boundsIncludingTSDStroke:", v6);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[TSDLayoutGeometry size](v9, "size");
    v123.origin.x = TSDRectWithSize();
    width = v123.size.width;
    height = v123.size.height;
    v127.origin.x = v34;
    v127.origin.y = v36;
    v127.size.width = v38;
    v127.size.height = v40;
    v124 = CGRectUnion(v123, v127);
    x = v124.origin.x;
    y = v124.origin.y;
    v45 = -[TSDLayoutGeometry initWithFrame:]([TSDMutableLayoutGeometry alloc], "initWithFrame:", v124.origin.x, v124.origin.y, v124.size.width, v124.size.height);
    if (v9)
      -[TSDLayoutGeometry transform](v9, "transform");
    else
      memset(v114, 0, sizeof(v114));
    -[TSDMutableLayoutGeometry transformBy:](v45, "transformBy:", v114);
    if (v5)
      -[TSDLayoutGeometry transform](v5, "transform");
    else
      memset(v113, 0, sizeof(v113));
    -[TSDMutableLayoutGeometry transformBy:](v45, "transformBy:", v113);
    v46 = v45;
    v47 = -x;
    v48 = -y;
    if (v3)
    {
      v49 = v47;
      v50 = v48;
      v26 = width;
      v28 = height;
    }
    else
    {
      v125.origin.x = v104;
      v125.origin.y = v102;
      v125.size.width = v26;
      v125.size.height = v28;
      v51 = CGPathCreateWithRect(v125, 0);
      TSDPathBoundsIncludingStroke(v51, v6);
      if (v52 <= 0.0)
        v53 = v52;
      else
        v53 = 0.0;
      v49 = TSDSubtractPoints(v104, v102, v53);
      v50 = v54;
      CGPathRelease(v51);
    }
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v49, v50, v26, v28);
    CGAffineTransformMakeTranslation(&v119, v47, v48);
    v55 = *(_OWORD *)&v119.c;
    *(_OWORD *)&self->mLayoutToMaskTransform.a = *(_OWORD *)&v119.a;
    *(_OWORD *)&self->mLayoutToMaskTransform.c = v55;
    *(_OWORD *)&self->mLayoutToMaskTransform.tx = *(_OWORD *)&v119.tx;
    goto LABEL_48;
  }
  if (objc_msgSend(v7, "instantAlphaPath"))
  {
    v17 = [TSDLayoutGeometry alloc];
    -[TSDLayoutGeometry size](self->mImageGeometry, "size");
    v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v119.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v119.c = v18;
    *(_OWORD *)&v119.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v9 = -[TSDLayoutGeometry initWithSize:transform:](v17, "initWithSize:transform:", &v119);
    v14 = 0;
    goto LABEL_10;
  }
  v56 = MEMORY[0x24BDBD8B8];
  v57 = *MEMORY[0x24BDBD8B8];
  v58 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&self->mLayoutToMaskTransform.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&self->mLayoutToMaskTransform.c = v58;
  v59 = *(_OWORD *)(v56 + 32);
  *(_OWORD *)&self->mLayoutToMaskTransform.tx = v59;
  self->mMaskIntersectsImage = 0;
  if (v6
    && (v103 = v58,
        v105 = v57,
        v101 = v59,
        v60 = objc_msgSend(v6, "shouldRender"),
        v59 = v101,
        v58 = v103,
        v57 = v105,
        v60))
  {
    if (objc_msgSend(v6, "isFrame", *(double *)&v105, *(double *)&v103, *(double *)&v101))
    {
      -[TSDLayoutGeometry size](v5, "size");
      v61 = TSDRectWithSize();
      v63 = v62;
      v65 = v64;
      v67 = v66;
      objc_msgSend(v6, "coverageRect:");
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;
      v76 = (void *)-[TSDMutableLayoutGeometry mutableCopy](v5, "mutableCopy");
      objc_msgSend(v76, "setSize:", v73, v75);
      if (v76)
        objc_msgSend(v76, "transform");
      else
        memset(&v107, 0, sizeof(v107));
      CGAffineTransformTranslate(&v108, &v107, v69, v71);
      v106 = v108;
      objc_msgSend(v76, "setTransform:", &v106);
      v46 = v76;
      v98 = -v69;
      v99 = -v71;
      CGAffineTransformMakeTranslation(&v119, v98, v99);
      v100 = *(_OWORD *)&v119.c;
      *(_OWORD *)&self->mLayoutToImageTransform.a = *(_OWORD *)&v119.a;
      *(_OWORD *)&self->mLayoutToImageTransform.c = v100;
      *(_OWORD *)&self->mLayoutToImageTransform.tx = *(_OWORD *)&v119.tx;
      v92 = v61;
      v93 = v63;
      v94 = v65;
      v95 = v67;
      v96 = v98;
      v97 = v99;
    }
    else
    {
      objc_msgSend(v6, "width");
      v90 = v89 * 0.5;
      v46 = -[TSDLayoutGeometry geometryByOutsettingBy:](v5, "geometryByOutsettingBy:", v90, v90);
      CGAffineTransformMakeTranslation(&v119, v90, v90);
      v91 = *(_OWORD *)&v119.c;
      *(_OWORD *)&self->mLayoutToImageTransform.a = *(_OWORD *)&v119.a;
      *(_OWORD *)&self->mLayoutToImageTransform.c = v91;
      *(_OWORD *)&self->mLayoutToImageTransform.tx = *(_OWORD *)&v119.tx;
      -[TSDLayoutGeometry size](v5, "size");
      v92 = TSDRectWithSize();
      v96 = v90;
      v97 = v90;
    }
    v126 = CGRectOffset(*(CGRect *)&v92, v96, v97);
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v126.origin.x, v126.origin.y, v126.size.width, v126.size.height);
  }
  else
  {
    *(_OWORD *)&self->mLayoutToImageTransform.a = v57;
    *(_OWORD *)&self->mLayoutToImageTransform.c = v58;
    *(_OWORD *)&self->mLayoutToImageTransform.tx = v59;
    -[TSDLayoutGeometry size](v5, "size");
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", TSDRectWithSize());
    v46 = v5;
  }
LABEL_52:
  if (objc_msgSend(v6, "isFrame"))
  {
    if (self->mPathToStroke)
    {
      -[TSDBezierPath bounds](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:"), "bounds");
    }
    else
    {
      -[TSDLayoutGeometry size](v5, "size");
      v81 = TSDRectWithSize();
    }
    objc_msgSend(v6, "coverageRectWithoutAdornment:", v81);
    -[TSDMediaLayout setShouldRenderFrameStroke:](self, "setShouldRenderFrameStroke:", objc_msgSend(v6, "shouldRenderForSizeIncludingCoverage:", v82, v83));
  }
  v84 = -[TSDLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  if (!v84)
    return v46;
  v85 = v84;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return v46;
  v86 = (void *)objc_msgSend(v85, "adjustLayoutGeometry:forLayout:", v46, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v87 = self->mImageGeometry;
    self->mImageGeometry = (TSDLayoutGeometry *)(id)objc_msgSend(v85, "adjustImageGeometry:withLayoutGeometry:forLayout:", self->mImageGeometry, v46, self);
  }
  return v86;
}

- (void)processChangedProperty:(int)a3
{
  TSDAbstractLayout *v5;
  TSDAbstractLayout *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDImageLayout;
  -[TSDMediaLayout processChangedProperty:](&v7, sel_processChangedProperty_);
  if (a3 == 517)
  {
    -[TSDLayout invalidateFrame](self, "invalidateFrame");
LABEL_8:
    -[TSDMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
    -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    goto LABEL_9;
  }
  if ((a3 & 0xFFFFFFFE) == 0x200)
    goto LABEL_8;
  if ((a3 & 0xFFFFFFFE) != 0x210)
  {
    if (a3 == 521)
    {
      -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");

      self->mTracedPath = 0;
    }
    return;
  }
  -[TSDLayout invalidateFrame](self, "invalidateFrame");
  -[TSDMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
  -[TSDLayout invalidateChildren](self, "invalidateChildren");
  -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  if (a3 != 529)
  {
    if (a3 == 528)
    {

      self->mTracedPath = 0;
      self->mHasAlpha = 0;
    }
    return;
  }
LABEL_9:
  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) != 0
    || -[TSDInfo isAnchoredToText](-[TSDLayout info](self, "info"), "isAnchoredToText"))
  {
    v5 = -[TSDAbstractLayout parent](self, "parent");
    if (v5)
    {
      v6 = v5;
      while ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v6 = -[TSDAbstractLayout parent](v6, "parent");
        if (!v6)
          return;
      }
      -[TSDAbstractLayout wrappableChildInvalidated:](v6, "wrappableChildInvalidated:", self);
    }
  }
}

- (void)updateChildrenFromInfo
{
  void *v3;
  TSDMaskLayout *mMaskLayout;
  id v5;
  TSDMaskLayout *v6;
  TSDMaskLayout *v7;

  v3 = (void *)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "maskInfo");
  mMaskLayout = self->mMaskLayout;
  if ((v3 != 0) == (mMaskLayout == 0) || -[TSDMaskLayout maskInfo](mMaskLayout, "maskInfo") != v3)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = self->mMaskLayout;
    if (v3)
    {
      if (v6)
      {

        self->mMaskLayout = 0;
      }
      v7 = (TSDMaskLayout *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "layoutClass")), "initWithInfo:", v3);
      self->mMaskLayout = v7;
      objc_msgSend(v5, "addObject:", v7);
    }
    else
    {

      self->mMaskLayout = 0;
    }
    -[TSDAbstractLayout setChildren:](self, "setChildren:", v5);

    -[TSDDrawableLayout invalidate](self, "invalidate");
  }
  -[NSArray makeObjectsPerformSelector:](-[TSDAbstractLayout children](self, "children"), "makeObjectsPerformSelector:", sel_updateChildrenFromInfo);
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  TSDBezierPath *v6;
  TSDLayoutGeometry *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  TSDAbstractLayout *v16;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect result;

  v3 = a3;
  if (!self->mMaskLayout && !objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath")
    || !self->mPathToStroke)
  {
    memset(&v22, 0, sizeof(v22));
    v7 = -[TSDAbstractLayout geometry](self, "geometry");
    if (v7)
    {
      -[TSDLayoutGeometry fullTransform](v7, "fullTransform");
      if (!v3)
        goto LABEL_23;
    }
    else
    {
      memset(&v22, 0, sizeof(v22));
      if (!v3)
      {
LABEL_23:
        v21 = v22;
        v8 = 0;
        v9 = 0;
        v10 = 1.0;
        v11 = 1.0;
        goto LABEL_24;
      }
    }
    if (-[TSDAbstractLayout parent](self, "parent"))
    {
      v16 = -[TSDAbstractLayout parent](self, "parent");
      if (v16)
        -[TSDAbstractLayout transformInRoot](v16, "transformInRoot");
      else
        memset(&t2, 0, sizeof(t2));
      v19 = v22;
      CGAffineTransformConcat(&v21, &v19, &t2);
      v22 = v21;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  -[TSDMediaLayout stroke](self, "stroke");
  v5 = (void *)TSUDynamicCast();
  v6 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", self->mPathToStroke);
  memset(&v22, 0, sizeof(v22));
  -[TSDImageLayout layoutToMaskTransform](self, "layoutToMaskTransform");
  if (v3)
    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
  else
    -[TSDAbstractLayout transform](self, "transform");
  CGAffineTransformConcat(&v22, &t1, &v17);
  v21 = v22;
  -[TSDBezierPath transformUsingAffineTransform:](v6, "transformUsingAffineTransform:", &v21);
  if (v5 && objc_msgSend(v5, "shouldRender"))
  {
    if (objc_msgSend(v5, "isFrame")
      && -[TSDImageLayout shouldRenderFrameStroke](self, "shouldRenderFrameStroke"))
    {
      -[TSDBezierPath bounds](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", self->mPathToStroke), "bounds");
      objc_msgSend(v5, "coverageRect:");
      v21 = v22;
LABEL_24:
      *(CGRect *)&v12 = CGRectApplyAffineTransform(*(CGRect *)&v8, &v21);
      goto LABEL_25;
    }
    -[TSDBezierPath takeAttributesFromStroke:](v6, "takeAttributesFromStroke:", v5);
    -[TSDBezierPath boundsIncludingStroke](v6, "boundsIncludingStroke");
  }
  else
  {
    -[TSDBezierPath bounds](v6, "bounds");
  }
LABEL_25:
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
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
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform *p_t1;
  CGAffineTransform *p_t2;
  objc_super v19;
  _OWORD v20[3];
  _OWORD v21[3];
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;
  CGRect v26;
  CGRect result;

  if (-[TSDImageLayout isResizingInMaskEditMode](self, "isResizingInMaskEditMode"))
  {
    if (-[TSDImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == 2)
    {
LABEL_3:
      objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
      v3 = TSDRectWithSize();
      v5 = v4;
      v7 = v6;
      v9 = v8;
      memset(&v25, 0, sizeof(v25));
      if (self)
      {
        -[TSDImageLayout layoutToImageTransform](self, "layoutToImageTransform");
        -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
      }
      else
      {
        memset(v21, 0, sizeof(v21));
        memset(v20, 0, sizeof(v20));
      }
      p_t1 = (CGAffineTransform *)v21;
      p_t2 = (CGAffineTransform *)v20;
LABEL_14:
      CGAffineTransformConcat(&v25, p_t1, p_t2);
      v22 = v25;
      v26.origin.x = v3;
      v26.origin.y = v5;
      v26.size.width = v7;
      v26.size.height = v9;
      *(CGRect *)&v13 = CGRectApplyAffineTransform(v26, &v22);
      goto LABEL_15;
    }
LABEL_7:
    objc_msgSend((id)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry"), "size");
    v3 = TSDRectWithSize();
    v5 = v10;
    v7 = v11;
    v9 = v12;
    memset(&v25, 0, sizeof(v25));
    if (self)
    {
      -[TSDImageLayout layoutToMaskTransform](self, "layoutToMaskTransform");
      -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    p_t1 = &t1;
    p_t2 = &t2;
    goto LABEL_14;
  }
  if (-[TSDImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode"))
  {
    if (-[TSDImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") != 3)
      goto LABEL_3;
    goto LABEL_7;
  }
  v19.receiver = self;
  v19.super_class = (Class)TSDImageLayout;
  -[TSDAbstractLayout alignmentFrameForProvidingGuidesInRoot](&v19, sel_alignmentFrameForProvidingGuidesInRoot);
LABEL_15:
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y;
  double x;
  id v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v7 = -[TSDLayoutGeometry geometryByTranslatingBy:](self->mImageGeometry, "geometryByTranslatingBy:", a3.x, a3.y);

    self->mImageGeometry = (TSDLayoutGeometry *)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDImageLayout;
  -[TSDAbstractLayout offsetGeometryBy:](&v8, sel_offsetGeometryBy_, x, y);
}

- (BOOL)hasAlpha
{
  void *v4;

  if (!self->mHasAlpha)
  {
    self->mHasAlpha = 1;
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "imageData"), 0);
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      if (objc_msgSend(v4, "isOpaque"))
        self->mHasAlpha = 2;
    }
  }
  return self->mHasAlpha == 1;
}

- (BOOL)isInvisible
{
  CGPath *v3;
  CGRect BoundingBox;

  v3 = -[TSDImageLayout pathToStroke](self, "pathToStroke");
  if (v3)
  {
    BoundingBox = CGPathGetBoundingBox(v3);
  }
  else
  {
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    BoundingBox.origin.x = TSDRectWithSize();
  }
  return CGRectIsNull(BoundingBox);
}

- (BOOL)shouldDisplayGuides
{
  objc_super v4;

  if (-[TSDImageLayout isResizingInMaskEditMode](self, "isResizingInMaskEditMode")
    || -[TSDImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode"))
  {
    return 1;
  }
  if (self->mScalingInMaskMode)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return -[TSDLayout shouldDisplayGuides](&v4, sel_shouldDisplayGuides);
}

- (BOOL)shouldRenderFrameStroke
{
  objc_super v4;

  if (-[TSDImageLayout isInInstantAlphaMode](self, "isInInstantAlphaMode"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return -[TSDMediaLayout shouldRenderFrameStroke](&v4, sel_shouldRenderFrameStroke);
}

- (BOOL)maskIntersectsImage
{
  return self->mMaskIntersectsImage;
}

- (void)beginDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  -[TSDLayout beginDynamicOperation](&v3, sel_beginDynamicOperation);
  objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "beginDynamicOperation");
  self->mBaseImageLayoutGeometry = (TSDLayoutGeometry *)objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "copy");
  -[TSDImageLayout p_createDynamicCopies](self, "p_createDynamicCopies");
}

- (void)endDynamicOperation
{
  objc_super v3;

  -[TSDImageLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");

  self->mBaseImageLayoutGeometry = 0;
  objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "endDynamicOperation");
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  -[TSDLayout endDynamicOperation](&v3, sel_endDynamicOperation);
}

- (void)beginResize
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDImageLayout;
  -[TSDLayout beginResize](&v6, sel_beginResize);
  if (-[TSDImageLayout maskEditMode](self, "maskEditMode") == 3)
  {
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    self->super.super.super.super.mInitialBoundsForStandardKnobs.origin.x = TSDRectWithSize();
    self->super.super.super.super.mInitialBoundsForStandardKnobs.origin.y = v3;
    self->super.super.super.super.mInitialBoundsForStandardKnobs.size.width = v4;
    self->super.super.super.super.mInitialBoundsForStandardKnobs.size.height = v5;

    self->super.super.super.super.mBaseGeometry = (TSDLayoutGeometry *)objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "copy");
  }
}

- (void)beginDrag
{
  objc_super v3;

  if (-[TSDImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") == 3)
  {
    -[TSDLayout i_setBaseCapturedAlignmentFrameOriginForInline](self, "i_setBaseCapturedAlignmentFrameOriginForInline");
    -[TSDLayout invalidateSize](self, "invalidateSize");
    -[TSDLayout validate](self, "validate");
  }
  else
  {
    -[TSDImageLayout maskEditModeForDragging](self, "maskEditModeForDragging");
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  -[TSDLayout beginDrag](&v3, sel_beginDrag);
}

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    if (-[TSDImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") == 3)
    {
      v7 = (void *)-[TSDInfoGeometry mutableCopy](self->mDynamicInfoGeometry, "mutableCopy");
      objc_msgSend(v7, "position");
      objc_msgSend(v7, "setPosition:", TSDAddPoints(v8, v9, x));
      -[TSDImageLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v7);

      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "dragBy:", x, y);
      if (-[TSDInfo owningAttachment](-[TSDLayout info](self, "info"), "owningAttachment"))
      {
        -[TSDLayout invalidatePosition](self, "invalidatePosition");
        objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", self);
        -[TSDAbstractLayout fixTransformFromLastInterimPosition](self, "fixTransformFromLastInterimPosition");
      }
    }
    else if (-[TSDImageLayout maskEditModeForDragging](self, "maskEditModeForDragging") == 2)
    {
      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "dragBy:", x, y);
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)TSDImageLayout;
      -[TSDDrawableLayout dragBy:](&v13, sel_dragBy_, x, y);
      if (!self->mBaseImageLayoutGeometry)
      {
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout dragBy:]");
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 744, CFSTR("invalid nil value for '%s'"), "mBaseImageLayoutGeometry");
      }
      v12 = -[TSDLayoutGeometry geometryByTranslatingBy:](self->mImageGeometry, "geometryByTranslatingBy:", x, y);

      self->mImageGeometry = (TSDLayoutGeometry *)v12;
    }
  }
}

- (BOOL)i_useBaseCapturedAlignmentFrameOriginForInline
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return -[TSDLayout i_useBaseCapturedAlignmentFrameOriginForInline](&v4, sel_i_useBaseCapturedAlignmentFrameOriginForInline)|| -[TSDImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode")|| -[TSDImageLayout isRotatingInMaskEditMode](self, "isRotatingInMaskEditMode");
}

- (void)endDrag
{
  objc_super v3;

  if (!-[TSDImageLayout isDraggingInMaskEditMode](self, "isDraggingInMaskEditMode"))
  {

    self->mImageGeometry = self->mBaseImageLayoutGeometry;
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  -[TSDLayout endDrag](&v3, sel_endDrag);
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  TSDLayoutGeometry *mBaseImageLayoutGeometry;
  void *v8;
  __int128 v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;

  memset(&v17, 0, sizeof(v17));
  mBaseImageLayoutGeometry = self->mBaseImageLayoutGeometry;
  if (mBaseImageLayoutGeometry)
    -[TSDLayoutGeometry fullTransform](mBaseImageLayoutGeometry, "fullTransform");
  else
    memset(&v15, 0, sizeof(v15));
  CGAffineTransformInvert(&t1, &v15);
  v8 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  if (v8)
    objc_msgSend(v8, "fullTransform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v17, &t1, &t2);
  v11 = v17;
  CGAffineTransformInvert(&v12, &v11);
  v9 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v13, &v12, &v11);
  v11 = v17;
  return CGAffineTransformConcat(retstr, &v13, &v11);
}

- (void)takeRotationFromTracker:(id)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (!a3)
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
    if (self)
      goto LABEL_3;
LABEL_5:
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    goto LABEL_6;
  }
  objc_msgSend(a3, "rotateTransform");
  if (!self)
    goto LABEL_5;
LABEL_3:
  -[TSDImageLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", &v5);
LABEL_6:
  -[TSDImageLayout resizeWithTransform:asChild:](self, "resizeWithTransform:asChild:", &v8, objc_msgSend((id)objc_msgSend(a3, "rep", v5, v6, v7, v8, v9, v10), "layout") != (_QWORD)self);
}

- (CGPoint)centerForRotation
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[TSDImageLayout isRotatingInMaskEditMode](self, "isRotatingInMaskEditMode"))
  {
    -[TSDImageLayout centerForRotationInMaskMode](self, "centerForRotationInMaskMode");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDImageLayout;
    -[TSDLayout centerForRotation](&v5, sel_centerForRotation);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)centerForRotationInMaskMode
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGPoint result;

  if (-[TSDImageLayout maskEditModeForRotating](self, "maskEditModeForRotating") == 3)
  {
    if (objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath"))
    {
      objc_msgSend((id)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath"), "bounds");
      v7 = TSDCenterOfRect(v3, v4, v5, v6);
      v9 = v8;
      if (self)
      {
        -[TSDImageLayout imageDataToVisualSizeTransform](self, "imageDataToVisualSizeTransform");
        v10 = v67;
        v11 = v66;
        v12 = v69;
        v13 = v68;
        v14 = v71;
        v15 = v70;
      }
      else
      {
        v14 = 0.0;
        v12 = 0.0;
        v10 = 0.0;
        v15 = 0.0;
        v13 = 0.0;
        v11 = 0.0;
      }
      v39 = v15 + v9 * v13 + v11 * v7;
      v40 = v14 + v9 * v12 + v10 * v7;
      if (self)
      {
        -[TSDImageLayout layoutToImageTransform](self, "layoutToImageTransform");
        v42 = v60;
        v41 = v61;
        v44 = v62;
        v43 = v63;
        v45 = v64;
        v27 = v65;
      }
      else
      {
        v27 = 0.0;
        v43 = 0.0;
        v41 = 0.0;
        v45 = 0.0;
        v44 = 0.0;
        v42 = 0.0;
      }
      v29 = v45 + v40 * v44 + v42 * v39;
      v38 = v40 * v43 + v41 * v39;
      goto LABEL_18;
    }
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    v33 = TSDRectWithSize();
    v20 = TSDCenterOfRect(v33, v34, v35, v36);
    v22 = v37;
    if (self)
    {
      -[TSDImageLayout layoutToImageTransform](self, "layoutToImageTransform");
      v24 = v54;
      v23 = v55;
      v26 = v56;
      v25 = v57;
      v28 = v58;
      v27 = v59;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (-[TSDImageLayout maskEditModeForRotating](self, "maskEditModeForRotating") == 2)
  {
    objc_msgSend((id)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry"), "size");
    v16 = TSDRectWithSize();
    v20 = TSDCenterOfRect(v16, v17, v18, v19);
    v22 = v21;
    if (self)
    {
      -[TSDImageLayout layoutToMaskTransform](self, "layoutToMaskTransform");
      v24 = v48;
      v23 = v49;
      v26 = v50;
      v25 = v51;
      v28 = v52;
      v27 = v53;
LABEL_12:
      v29 = v28 + v22 * v26 + v24 * v20;
      v38 = v22 * v25 + v23 * v20;
LABEL_18:
      v30 = v27 + v38;
      goto LABEL_19;
    }
LABEL_11:
    v27 = 0.0;
    v25 = 0.0;
    v23 = 0.0;
    v28 = 0.0;
    v26 = 0.0;
    v24 = 0.0;
    goto LABEL_12;
  }
  v29 = *MEMORY[0x24BDBEFB0];
  v30 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v31 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v32 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout centerForRotationInMaskMode]");
  objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 817, CFSTR("asking for mask mode center of rotation when not in mask edit mode"));
LABEL_19:
  v46 = v29;
  v47 = v30;
  result.y = v47;
  result.x = v46;
  return result;
}

- (CGPoint)centerForConnecting
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  TSDLayoutGeometry *v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  CGPoint result;

  if (objc_msgSend(-[TSDDrawableLayout i_wrapPath](self, "i_wrapPath"), "elementCount") < 2)
  {
    v17.receiver = self;
    v17.super_class = (Class)TSDImageLayout;
    -[TSDLayout centerForConnecting](&v17, sel_centerForConnecting);
  }
  else
  {
    objc_msgSend(-[TSDDrawableLayout i_wrapPath](self, "i_wrapPath"), "bounds");
    v7 = TSDCenterOfRect(v3, v4, v5, v6);
    v15 = v8;
    v16 = v7;
    v9 = -[TSDAbstractLayout geometry](self, "geometry");
    if (v9)
    {
      -[TSDLayoutGeometry transform](v9, "transform");
      v10 = v18;
      v11 = v19;
      v12 = v20;
    }
    else
    {
      v12 = 0uLL;
      v10 = 0uLL;
      v11 = 0uLL;
    }
    v13 = vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, v15), v10, v16));
    v14 = v13.f64[1];
  }
  result.x = v13.f64[0];
  result.y = v14;
  return result;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;
  _OWORD v7[3];

  if (-[TSDImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    if (-[TSDImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") != 1)
      goto LABEL_8;
    v4 = (void *)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry");
    if (v4)
      objc_msgSend(v4, "transform");
    else
      memset(v7, 0, sizeof(v7));
    v3 = TSDIsTransformAxisAlignedWithThreshold((double *)v7, 0.0001);
    if (v3)
    {
LABEL_8:
      v6.receiver = self;
      v6.super_class = (Class)TSDImageLayout;
      LOBYTE(v3) = -[TSDLayout canAspectRatioLockBeChangedByUser](&v6, sel_canAspectRatioLockBeChangedByUser);
    }
  }
  return v3;
}

- (BOOL)resizeMayChangeAspectRatio
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;
  _OWORD v7[3];

  if (-[TSDImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") == 2)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    if (-[TSDImageLayout maskEditModeForResizing](self, "maskEditModeForResizing") != 1)
      goto LABEL_8;
    v4 = (void *)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry");
    if (v4)
      objc_msgSend(v4, "transform");
    else
      memset(v7, 0, sizeof(v7));
    v3 = TSDIsTransformAxisAlignedWithThreshold((double *)v7, 0.0001);
    if (v3)
    {
LABEL_8:
      v6.receiver = self;
      v6.super_class = (Class)TSDImageLayout;
      LOBYTE(v3) = -[TSDLayout resizeMayChangeAspectRatio](&v6, sel_resizeMayChangeAspectRatio);
    }
  }
  return v3;
}

- (BOOL)shouldSnapWhileResizing
{
  objc_super v4;

  if (-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode")
    && -[TSDImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == 3)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return -[TSDAbstractLayout shouldSnapWhileResizing](&v4, sel_shouldSnapWhileResizing);
}

- (void)resizeWithTransform:(CGAffineTransform *)a3 asChild:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  __int128 v8;
  void *v9;
  id v10;
  __int128 v11;
  CGAffineTransform *p_t2;
  __int128 v13;
  TSDInfoGeometry *mDynamicInfoGeometry;
  id v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;

  v4 = a4;
  if (-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode")
    && -[TSDImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") != 3)
  {
    if (-[TSDImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") != 2)
      return;
    v10 = -[TSDImageLayout maskLayout](self, "maskLayout");
    v13 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v23.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v23.c = v13;
    *(_OWORD *)&v23.tx = *(_OWORD *)&a3->tx;
    p_t2 = &v23;
    goto LABEL_21;
  }
  if (v4)
  {
    a3->tx = 0.0;
    a3->ty = 0.0;
  }
  memset(&v23, 0, sizeof(v23));
  v7 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  if (v7)
    objc_msgSend(v7, "fullTransform");
  else
    memset(&t1, 0, sizeof(t1));
  v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v23, &t1, &t2);
  t2 = v23;
  -[TSDImageLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", +[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", &t2));
  if (-[TSDImageLayout maskEditModeForLayoutState](self, "maskEditModeForLayoutState") == 3)
  {
    memset(&t2, 0, sizeof(t2));
    v9 = (void *)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "geometry");
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(&v19, 0, sizeof(v19));
    CGAffineTransformInvert(&v20, &v19);
    mDynamicInfoGeometry = self->mDynamicInfoGeometry;
    if (mDynamicInfoGeometry)
      -[TSDInfoGeometry transform](mDynamicInfoGeometry, "transform");
    else
      memset(&v18, 0, sizeof(v18));
    CGAffineTransformConcat(&t2, &v20, &v18);
    v15 = -[TSDImageLayout maskLayout](self, "maskLayout");
    v16 = t2;
    CGAffineTransformInvert(&v17, &v16);
    p_t2 = &v17;
    v10 = v15;
    goto LABEL_21;
  }
  if (!-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode")
    && -[TSDLayout layoutState](self, "layoutState") == 4)
  {
    v10 = -[TSDImageLayout maskLayout](self, "maskLayout");
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    p_t2 = &t2;
LABEL_21:
    objc_msgSend(v10, "resizeWithTransform:asChild:", p_t2, 0);
  }
}

- (id)smartPathSource
{
  objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "pathSource");
  objc_opt_class();
  return (id)TSUClassAndProtocolCast();
}

- (CGRect)pathBoundsWithoutStroke
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_msgSend(-[TSDImageLayout smartPathSource](self, "smartPathSource"), "bezierPath"), "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)maskWasReset
{
  void *v3;
  uint64_t v4;

  if (-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout maskWasReset]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 952, CFSTR("Mask should never be reset in mask edit mode"));
  }
  self->mMaskEditMode = 0;
}

- (void)maskWasApplied
{
  void *v3;
  uint64_t v4;

  if (-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout maskWasApplied]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 958, CFSTR("maskWasApplied should not be called in mask edit mode"));
  }
  self->mMaskEditMode = 1;
}

- (void)beginEditingImageInMaskEditMode
{
  void *v3;
  uint64_t v4;

  if (-[TSDImageLayout maskEditMode](self, "maskEditMode") == 3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout beginEditingImageInMaskEditMode]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 964, CFSTR("already editing image in mask edit mode"));
  }
  self->mMaskEditMode = 3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDImageLayoutMaskEditModeDidChangeNotification"), self);
}

- (void)beginEditingMaskInMaskEditMode
{
  void *v3;
  uint64_t v4;

  if (-[TSDImageLayout maskEditMode](self, "maskEditMode") == 2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout beginEditingMaskInMaskEditMode]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 971, CFSTR("already editing mask in mask edit mode"));
  }
  self->mMaskEditMode = 2;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDImageLayoutMaskEditModeDidChangeNotification"), self);
}

- (void)endMaskEditMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (-[TSDImageLayout isInInstantAlphaMode](self, "isInInstantAlphaMode"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout endMaskEditMode]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 978, CFSTR("Cannot end mask edit mode while still editing instant alpha"));
  }
  if (-[TSDImageLayout maskEditMode](self, "maskEditMode") != 3
    && -[TSDImageLayout maskEditMode](self, "maskEditMode") != 2)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout endMaskEditMode]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 979, CFSTR("not in mask edit mode"));
  }
  self->mMaskEditMode = 1;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDImageLayoutMaskEditModeDidChangeNotification"), self);
}

- (BOOL)isInMaskEditMode
{
  return -[TSDImageLayout maskEditMode](self, "maskEditMode") == 2
      || -[TSDImageLayout maskEditMode](self, "maskEditMode") == 3;
}

- (BOOL)isDraggingInMaskEditMode
{
  _BOOL4 v3;

  v3 = -[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  if (v3)
    LOBYTE(v3) = -[TSDLayout layoutState](self, "layoutState") == 2;
  return v3;
}

- (BOOL)isRotatingInMaskEditMode
{
  _BOOL4 v3;

  v3 = -[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  if (v3)
    LOBYTE(v3) = -[TSDLayout layoutState](self, "layoutState") == 3;
  return v3;
}

- (BOOL)isResizingInMaskEditMode
{
  _BOOL4 v3;

  v3 = -[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode");
  if (v3)
    LOBYTE(v3) = -[TSDLayout layoutState](self, "layoutState") == 4;
  return v3;
}

- (int)maskEditModeForDragging
{
  if (-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
    return 3;
  else
    return -[TSDImageLayout maskEditMode](self, "maskEditMode");
}

- (int)maskEditModeForRotating
{
  if (-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
    return 3;
  else
    return -[TSDImageLayout maskEditMode](self, "maskEditMode");
}

- (int)maskEditModeForResizing
{
  if (self->mScalingInMaskMode)
    return 3;
  else
    return -[TSDImageLayout maskEditMode](self, "maskEditMode");
}

- (int)maskEditModeForLayoutState
{
  int v3;

  v3 = -[TSDLayout layoutState](self, "layoutState");
  if (v3 == 3)
    return -[TSDImageLayout maskEditModeForRotating](self, "maskEditModeForRotating");
  if (v3 == 2)
    return -[TSDImageLayout maskEditModeForDragging](self, "maskEditModeForDragging");
  return -[TSDImageLayout maskEditModeForResizing](self, "maskEditModeForResizing");
}

- (void)maskModeScaleDidBegin
{
  self->mScalingInMaskMode = 1;
  -[TSDMaskLayout maskModeScaleDidBegin](self->mMaskLayout, "maskModeScaleDidBegin");
}

- (void)maskModeScaleDidEnd
{
  self->mScalingInMaskMode = 0;
  -[TSDMaskLayout maskModeScaleDidEnd](self->mMaskLayout, "maskModeScaleDidEnd");
}

- (void)beginInstantAlphaMode
{
  void *v3;
  uint64_t v4;

  if (!-[TSDImageLayout isInMaskEditMode](self, "isInMaskEditMode"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout beginInstantAlphaMode]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1073, CFSTR("must be editing the mask when editing instant alpha"));
  }
  self->mInInstantAlphaMode = 1;
}

- (void)endInstantAlphaMode
{
  self->mInInstantAlphaMode = 0;
  -[TSDImageLayout endMaskEditMode](self, "endMaskEditMode");
}

- (id)imageInfo
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return (id)TSUDynamicCast();
}

- (id)imageGeometry
{
  return self->mImageGeometry;
}

- (id)originalImageGeometry
{
  return self->mBaseImageLayoutGeometry;
}

- (id)imageGeometryInRoot
{
  void *v3;
  TSDAbstractLayout *v4;
  TSDAbstractLayout *v5;
  TSDLayoutGeometry *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = (void *)-[TSDLayoutGeometry mutableCopy](self->mImageGeometry, "mutableCopy");
  v4 = -[TSDAbstractLayout parent](self, "parent");
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = -[TSDAbstractLayout geometry](v5, "geometry", v8, v9, v10);
      if (v6)
      {
        -[TSDLayoutGeometry transform](v6, "transform");
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
        v8 = 0u;
      }
      objc_msgSend(v3, "transformBy:", &v8);
      v5 = -[TSDAbstractLayout parent](v5, "parent");
    }
    while (v5);
  }
  return v3;
}

- (id)inspectorGeometry
{
  id v3;
  __int128 v4;
  TSDAbstractLayout *v5;
  TSDAbstractLayout *v6;
  TSDLayoutGeometry *v7;
  objc_super v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (-[TSDImageLayout maskEditMode](self, "maskEditMode") == 3)
  {
    v3 = -[TSDImageLayout imageGeometry](self, "imageGeometry");
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v14 = *MEMORY[0x24BDBD8B8];
    v15 = v4;
    v16 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v5 = -[TSDAbstractLayout parent](self, "parent");
    if (v5)
    {
      v6 = v5;
      do
      {
        if (-[TSDAbstractLayout isRootLayoutForInspectorGeometry](v6, "isRootLayoutForInspectorGeometry"))
          break;
        v7 = -[TSDAbstractLayout geometry](v6, "geometry");
        if (v7)
        {
          v10[0] = v14;
          v10[1] = v15;
          v10[2] = v16;
          -[TSDLayoutGeometry transformByConcatenatingTransformTo:](v7, "transformByConcatenatingTransformTo:", v10);
        }
        else
        {
          v12 = 0u;
          v13 = 0u;
          v11 = 0u;
        }
        v14 = v11;
        v15 = v12;
        v16 = v13;
        v6 = -[TSDAbstractLayout parent](v6, "parent");
      }
      while (v6);
    }
    v11 = v14;
    v12 = v15;
    v13 = v16;
    return (id)objc_msgSend(v3, "geometryByTransformingBy:", &v11);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDImageLayout;
    return -[TSDLayout inspectorGeometry](&v9, sel_inspectorGeometry);
  }
}

- (BOOL)hasMaskingPath
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (-[TSDImageLayout maskLayout](self, "maskLayout")
    || (v3 = objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath")) != 0)
  {
    if (!self->mPathToStroke)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout hasMaskingPath]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1135, CFSTR("If image has masking path it must specify a path to stroke"));
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (CGPath)pathToStroke
{
  return self->mPathToStroke;
}

- (CGSize)sizeOfFrameRectIncludingCoverage
{
  CGPath *mPathToStroke;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  mPathToStroke = self->mPathToStroke;
  if (mPathToStroke)
  {
    TSDPathBoundsIncludingStroke(mPathToStroke, -[TSDMediaLayout stroke](self, "stroke"));
    v4 = v3;
    v6 = v5;
  }
  else
  {
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGAffineTransform)layoutToImageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].c;
  return self;
}

- (CGAffineTransform)layoutToMaskTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[10].c;
  return self;
}

- (CGAffineTransform)imageDataToVisualSizeTransform
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGAffineTransform *result;
  double v10;
  double v11;
  uint64_t v12;
  __int128 v13;

  objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
  v6 = v5;
  v8 = v7;
  result = (CGAffineTransform *)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "naturalSize");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (v10 > 0.0 || v11 > 0.0)
    return CGAffineTransformMakeScale(retstr, v6 / v10, v8 / v11);
  v12 = MEMORY[0x24BDBD8B8];
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  return result;
}

- (id)maskLayout
{
  return self->mMaskLayout;
}

- (id)imageAdjustments
{
  if (self->mIsUpdatingImageAdjustments)
    return self->mDynamicImageAdjustments;
  else
    return (id)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "imageAdjustments");
}

- (BOOL)isDynamicallyChangingImageAdjustments
{
  return self->mIsUpdatingImageAdjustments;
}

- (void)dynamicImageAdjustmentsChangeDidBegin
{
  self->mIsUpdatingImageAdjustments = 1;
  self->mDynamicImageAdjustments = (TSDImageAdjustments *)objc_msgSend((id)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "imageAdjustments"), "copy");
}

- (void)dynamicImageAdjustmentsUpdateToValue:(id)a3
{

  self->mDynamicImageAdjustments = (TSDImageAdjustments *)objc_msgSend(a3, "copy");
}

- (void)dynamicImageAdjustmentsChangeDidEnd
{
  self->mIsUpdatingImageAdjustments = 0;

  self->mDynamicImageAdjustments = 0;
}

- (CGRect)boundsInfluencingExteriorWrap
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[TSDMediaLayout alignmentFrame](self, "alignmentFrame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    -[TSDAbstractLayout rectInRoot:](-[TSDAbstractLayout parent](self, "parent"), "rectInRoot:", x, y, width, height);
    x = v11;
    y = v12;
    width = v13;
    height = v14;
  }
  v15 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
  if (v15)
  {
    objc_msgSend(v15, "margin");
    if (v16 > 0.0)
    {
      v17 = -v16;
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v23 = CGRectInset(v22, v17, v17);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
    }
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)i_computeWrapPath
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v11;
  id v12;
  TSDBezierPath *v13;
  TSDBezierPath *mTracedPath;
  TSDBezierPath *v15;
  TSDBezierPath *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  TSDBezierPath *v24;
  double v25;
  double v26;
  TSDBezierPath *v27;
  double v28;
  TSDBezierPath *v29;
  TSDBezierPath *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  _OWORD v40[3];
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGRect v43;

  v3 = -[TSDImageLayout imageInfo](self, "imageInfo");
  objc_opt_class();
  -[TSDMediaLayout stroke](self, "stroke");
  v4 = (void *)TSUDynamicCast();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "shouldRender"))
  {
    v6 = objc_msgSend(v5, "isFrame");
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = objc_msgSend(v3, "instantAlphaPath");
  v9 = -[TSDImageLayout maskLayout](self, "maskLayout");
  v10 = (void *)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "computeLayoutGeometry");
  memset(&v42, 0, sizeof(v42));
  if (v9)
  {
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(&v41, 0, sizeof(v41));
    CGAffineTransformInvert(&v42, &v41);
    if (v8)
    {
LABEL_22:
      v12 = (id)objc_msgSend((id)objc_msgSend(v3, "instantAlphaPath"), "copy");
      if (self)
        -[TSDImageLayout imageDataToVisualSizeTransform](self, "imageDataToVisualSizeTransform");
      else
        memset(v40, 0, sizeof(v40));
      objc_msgSend(v12, "transformUsingAffineTransform:", v40);
      v39 = v42;
      objc_msgSend(v12, "transformUsingAffineTransform:", &v39);
      if (v6)
        goto LABEL_26;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v42.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v42.c = v11;
    *(_OWORD *)&v42.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    if (v8)
      goto LABEL_22;
  }
  v12 = 0;
  if (v6)
  {
LABEL_26:
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
    v28 = TSDRectWithSize();
    if (v8 && !v9)
      objc_msgSend(v5, "boundsForPath:", v12, v28);
    v16 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v28);
    goto LABEL_38;
  }
LABEL_10:
  if (v7 && -[TSDImageLayout hasAlpha](self, "hasAlpha"))
  {
    objc_msgSend(v3, "naturalSize");
    v13 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
  }
  else
  {
    mTracedPath = self->mTracedPath;
    if (!mTracedPath)
    {
      mTracedPath = (TSDBezierPath *)(id)objc_msgSend(v3, "tracedPath");
      self->mTracedPath = mTracedPath;
    }
    v13 = (TSDBezierPath *)-[TSDBezierPath copy](mTracedPath, "copy");
  }
  v15 = v13;
  -[TSDBezierPath bounds](v13, "bounds");
  if (CGRectIsEmpty(v43))
  {
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
    v16 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
  }
  else
  {
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v3, "naturalSize");
    memset(&v39, 0, sizeof(v39));
    CGAffineTransformMakeScale(&v39, v18 / v21, v20 / v22);
    v38 = v39;
    -[TSDBezierPath transformUsingAffineTransform:](v15, "transformUsingAffineTransform:", &v38);
    if (v9)
    {
      v23 = -[TSDImageLayout maskLayout](self, "maskLayout");
      v38 = v42;
      -[TSDBezierPath transformUsingAffineTransform:](v15, "transformUsingAffineTransform:", &v38);
      v24 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", objc_msgSend(v23, "path"));
      objc_msgSend(v23, "pathBounds");
      CGAffineTransformMakeTranslation(&v37, -v25, -v26);
      -[TSDBezierPath transformUsingAffineTransform:](v24, "transformUsingAffineTransform:", &v37);
      v27 = -[TSDBezierPath intersectBezierPath:](v15, "intersectBezierPath:", v24);
    }
    else
    {
      v27 = v15;
    }
    v16 = v27;
    if (v8)
      v16 = -[TSDBezierPath intersectBezierPath:](v27, "intersectBezierPath:", v12);
    if (v7)
    {
      -[TSDBezierPath takeAttributesFromStroke:](v16, "takeAttributesFromStroke:", v5);
      v29 = -[TSDBezierPath uniteWithBezierPath:](v16, "uniteWithBezierPath:", -[TSDBezierPath outlineStroke](v16, "outlineStroke"));
      if (v29)
      {
        v30 = v29;
        if (-[TSDBezierPath elementCount](v29, "elementCount") > 0)
          v16 = v30;
      }
    }
  }

LABEL_38:
  if (-[TSDBezierPath elementCount](v16, "elementCount") >= 2)
  {
    -[TSDBezierPath bounds](v16, "bounds");
    v32 = fmin(v31, 0.0);
    v34 = fmin(v33, 0.0);
    if (!TSDNearlyEqualPoints(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v32, v34))
    {
      CGAffineTransformMakeTranslation(&v36, -v32, -v34);
      -[TSDBezierPath transformUsingAffineTransform:](v16, "transformUsingAffineTransform:", &v36);
    }
  }
  return v16;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (void)p_createDynamicCopies
{
  void *v3;
  uint64_t v4;

  if (self->mDynamicInfoGeometry)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout p_createDynamicCopies]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1356, CFSTR("expected nil value for '%s'"), "mDynamicInfoGeometry");
  }
  self->mDynamicInfoGeometry = (TSDInfoGeometry *)objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "copy");
}

- (void)p_setDynamicInfoGeometry:(id)a3
{

  self->mDynamicInfoGeometry = (TSDInfoGeometry *)objc_msgSend(a3, "copy");
  -[TSDLayout invalidateFrame](self, "invalidateFrame");
  -[TSDMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
}

- (void)p_destroyDynamicCopies
{
  TSDInfoGeometry *mDynamicInfoGeometry;
  void *v4;
  uint64_t v5;

  mDynamicInfoGeometry = self->mDynamicInfoGeometry;
  if (!mDynamicInfoGeometry)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageLayout p_destroyDynamicCopies]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1372, CFSTR("invalid nil value for '%s'"), "mDynamicInfoGeometry");
    mDynamicInfoGeometry = self->mDynamicInfoGeometry;
  }

  self->mDynamicInfoGeometry = 0;
  -[TSDLayout invalidateFrame](self, "invalidateFrame");
  -[TSDMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
}

- (int)maskEditMode
{
  return self->mMaskEditMode;
}

- (BOOL)isInMaskScaleMode
{
  return self->mScalingInMaskMode;
}

- (BOOL)isInInstantAlphaMode
{
  return self->mInInstantAlphaMode;
}

@end
