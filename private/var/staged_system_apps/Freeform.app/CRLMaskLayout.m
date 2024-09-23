@implementation CRLMaskLayout

- (CRLMaskLayout)initWithInfo:(id)a3
{
  CRLMaskLayout *v3;
  CRLMaskLayout *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLMaskLayout;
  v3 = -[CRLCanvasLayout initWithInfo:](&v7, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout maskInfo](v3, "maskInfo"));

    if (v5)
    {
      BYTE2(v4->super.mInfoGeometryBeforeDynamicOperation) |= 3u;
      *(CGFloat *)((char *)&v4->mCachedTightPathBoundsNoScale.size.height + 2) = 1.0;
      *(double *)((char *)&v4->mPathScale + 2) = 1.0;
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

  CGPathRelease(*(CGPathRef *)((char *)&self->mMaskInvalidFlags + 2));
  CGPathRelease(*(CGPathRef *)((char *)&self->mCachedPath + 2));
  v3.receiver = self;
  v3.super_class = (Class)CRLMaskLayout;
  -[CRLMaskLayout dealloc](&v3, "dealloc");
}

- (id)dependentLayouts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v2));

  return v3;
}

- (id)computeLayoutGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CRLCanvasLayoutGeometry *v14;
  CRLCanvasLayoutGeometry *v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  CGAffineTransform v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;

  -[CRLMaskLayout p_cachedTightPathBoundsNoScale](self, "p_cachedTightPathBoundsNoScale");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout infoGeometry](self, "infoGeometry"));
  objc_msgSend(v11, "position");
  v13 = v12;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  objc_msgSend(v11, "center");
  if (v11)
  {
    objc_msgSend(v11, "transformBasedOnPoint:centeredAtPoint:", sub_1000603D0(v4, v6, v13));
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
  }
  v14 = [CRLCanvasLayoutGeometry alloc];
  v22[0] = v23;
  v22[1] = v24;
  v22[2] = v25;
  v15 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v14, "initWithSize:transform:", v22, v8, v10);
  -[CRLMaskLayout pathScale](self, "pathScale");
  v17 = v16;
  -[CRLMaskLayout pathScale](self, "pathScale");
  CGAffineTransformMakeScale(&v21, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometry geometryByTransformingBy:](v15, "geometryByTransformingBy:", &v21));

  return v19;
}

- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v26;
  CGAffineTransform v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout infoGeometryBeforeDynamicOperation](self, "infoGeometryBeforeDynamicOperation"));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  if (v13)
  {
    v14 = *(double *)((char *)&self->mPathScale + 2);
  }
  else
  {
    -[CRLMaskLayout pathScale](self, "pathScale");
    v14 = v15;
  }

  CGAffineTransformMakeScale(&v27, 1.0 / v14, 1.0 / v14);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometryByTransformingBy:", &v27));
  v17 = (void *)v16;
  memset(&v26, 0, sizeof(v26));
  if (v11)
  {
    objc_msgSend(v11, "fullTransform");
    if (v17)
    {
LABEL_12:
      objc_msgSend(v17, "fullTransform");
      goto LABEL_15;
    }
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    if (v16)
      goto LABEL_12;
  }
  memset(&v23, 0, sizeof(v23));
LABEL_15:
  CGAffineTransformInvert(&t2, &v23);
  CGAffineTransformConcat(&v26, &t1, &t2);
  memset(&v22, 0, sizeof(v22));
  if (v4)
    objc_msgSend(v4, "fullTransform");
  else
    memset(&v21, 0, sizeof(v21));
  v20 = v26;
  CGAffineTransformConcat(&v22, &v20, &v21);
  v20 = v22;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &v20));

  return v18;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLMaskLayout;
  -[CRLCanvasLayout processChangedProperty:](&v12, "processChangedProperty:");
  if (a3 == 19)
  {
    -[CRLMaskLayout invalidatePath](self, "invalidatePath");
    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasController"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForLayout:", v5));

    objc_msgSend(v11, "processChangedProperty:", 36);
  }

}

- (void)invalidate
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLMaskLayout;
  -[CRLCanvasLayout invalidate](&v10, "invalidate");
  *(_QWORD *)&v4 = objc_opt_class(CRLCanvasLayout, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v4));
  v8 = sub_100221D0C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "invalidateFrame");

}

- (void)invalidatePath
{
  CGPoint origin;
  CGSize size;

  BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) |= 1u;
  CGPathRelease(*(CGPathRef *)((char *)&self->mMaskInvalidFlags + 2));
  *(_QWORD *)((char *)&self->mMaskInvalidFlags + 2) = 0;
  CGPathRelease(*(CGPathRef *)((char *)&self->mCachedPath + 2));
  *(CGPath **)((char *)&self->mCachedPath + 2) = 0;
  BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) |= 2u;
  origin = CGRectZero.origin;
  size = CGRectZero.size;
  *(CGPoint *)((char *)&self->mCachedPathNoScale + 2) = CGRectZero.origin;
  *(CGSize *)((char *)&self->mCachedTightPathBounds.origin.y + 2) = size;
  *(CGPoint *)((char *)&self->mCachedTightPathBounds.size.height + 2) = origin;
  *(CGSize *)((char *)&self->mCachedTightPathBoundsNoScale.origin.y + 2) = size;
}

- (CGRect)alignmentFrame
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double width;
  double v17;
  double height;
  void *v19;
  double v20;
  double x;
  double v22;
  double y;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isResizingInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    objc_msgSend(v5, "size");
    v6 = sub_10005FDDC();
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "layoutToMaskTransform");
    else
      memset(&v34, 0, sizeof(v34));
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    v36 = CGRectApplyAffineTransform(v35, &v34);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
  }
  else
  {
    -[CRLCanvasAbstractLayout frameInParent](self, "frameInParent");
    width = v15;
    height = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    objc_msgSend(v19, "frame");
    x = v20;
    y = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stroke"));

    if (v14 && objc_msgSend(v14, "shouldRender"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", x, y, width, height));
      objc_msgSend(v26, "boundsIncludingCRLStroke:", v14);
      v28 = sub_1000603B8(x, y, v27);
      x = sub_1000603D0(x, y, v28);
      y = v29;

    }
  }

  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGAffineTransform)originalTransformForProvidingGuides
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  CGAffineTransform *result;
  objc_super v10;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v6 = objc_msgSend(v5, "isResizingInMaskEditMode");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "layoutToMaskTransform");
      objc_msgSend(v8, "originalTransformForProvidingGuides");
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(retstr, &t1, &t2);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLMaskLayout;
    return (CGAffineTransform *)-[CGAffineTransform originalTransformForProvidingGuides](&v10, "originalTransformForProvidingGuides");
  }
  return result;
}

- (BOOL)shouldSnapWhileResizing
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLMaskLayout;
  if (!-[CRLCanvasAbstractLayout shouldSnapWhileResizing](&v8, "shouldSnapWhileResizing"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transformInRoot");
  else
    memset(v7, 0, sizeof(v7));
  v5 = sub_100079384((double *)v7);

  return v5;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  void *v2;
  double v3;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  objc_msgSend(v2, "alignmentFrameForProvidingGuidesInRoot");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLMaskLayout;
  -[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:](&v4, "beginDynamicOperationWithRealTimeCommands:", a3);
  -[CRLMaskLayout p_createDynamicCopies](self, "p_createDynamicCopies");
}

- (void)resizeWithTransform:(CGAffineTransform *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform t2;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform v35;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  if (objc_msgSend(v5, "isResizingInMaskEditMode"))
  {

LABEL_4:
    memset(&v35, 0, sizeof(v35));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalImageGeometry"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(&v35, 0, sizeof(v35));

    t1 = v35;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v33, &t1, &t2);
    t1 = v35;
    CGAffineTransformInvert(&v31, &t1);
    CGAffineTransformConcat(&t1, &v33, &v31);
    v12 = *(_OWORD *)&t1.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&a3->c = v12;
    *(_OWORD *)&a3->tx = *(_OWORD *)&t1.tx;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
    v14 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometryByTransformingBy:", &t1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout computeInfoGeometryFromPureLayoutGeometry:](self, "computeInfoGeometryFromPureLayoutGeometry:", v15));
    -[CRLMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v16);

    return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v7 = objc_msgSend(v6, "isRotatingInMaskEditMode");

  if (v7)
    goto LABEL_4;
  memset(&v35, 0, sizeof(v35));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originalImageGeometry"));
  v19 = v18;
  if (v18)
    objc_msgSend(v18, "transform");
  else
    memset(&v35, 0, sizeof(v35));

  memset(&t1, 0, sizeof(t1));
  t2 = v35;
  v20 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v29.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v29.c = v20;
  *(_OWORD *)&v29.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v30, &t2, &v29);
  sub_100079264((uint64_t)&v30, &t1);
  v21 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v21;
  v23 = *(_OWORD *)&a3->a;
  v22 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  v29 = v35;
  *(_OWORD *)&v28.a = v23;
  *(_OWORD *)&v28.c = v22;
  *(_OWORD *)&v28.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&t2, &v29, &v28);
  v29 = t1;
  CGAffineTransformInvert(&v27, &v29);
  v28 = t2;
  CGAffineTransformConcat(&v29, &v28, &v27);
  t2 = v29;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v29 = t2;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "geometryByTransformingBy:", &v29));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout computeInfoGeometryFromPureLayoutGeometry:](self, "computeInfoGeometryFromPureLayoutGeometry:", v25));
  -[CRLMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v26);

}

- (BOOL)wantsParentResizeTransform
{
  return 1;
}

- (void)takeScaledMaskGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!BYTE2(self->mDynamicPathSource))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B008);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16718();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B028);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout takeScaledMaskGeometry:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 242, 0, "wrong mode");

  }
  -[CRLMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v4);

}

- (void)endDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMaskLayout;
  -[CRLCanvasLayout endDynamicOperation](&v3, "endDynamicOperation");
  -[CRLMaskLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");
}

- (void)resetDynamicGeometryToModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!*(_QWORD *)((char *)&self->mOriginalPathScale + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B048);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16798();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B068);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout resetDynamicGeometryToModel]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 254, 0, "Should only be called when we have a dynamic info geometry to reset!");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout maskInfo](self, "maskInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  -[CRLMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v7);

}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  void *v6;
  void *v7;
  __int128 v8;
  CGAffineTransform *result;
  _OWORD v10[3];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v7 = v6;
  if (v6)
  {
    v8 = *(_OWORD *)&a4->c;
    v10[0] = *(_OWORD *)&a4->a;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&a4->tx;
    objc_msgSend(v6, "layoutTransformInInfoSpace:", v10);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (BOOL)shouldBeIncludedInParentFrameForCulling
{
  return 0;
}

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v7 = objc_msgSend(v6, "isDraggingInMaskEditMode");

  if ((v7 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B088);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16818();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B0A8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout dragBy:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 273, 0, "should be called only when dragging in mask mode");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageGeometry"));
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "transform");
  else
    memset(&v21, 0, sizeof(v21));
  CGAffineTransformInvert(&v22, &v21);
  v14 = sub_10006214C((float64x2_t *)&v22, x, y);

  v15 = objc_msgSend(*(id *)((char *)&self->mOriginalPathScale + 2), "mutableCopy");
  if (objc_msgSend(v11, "maskEditModeForDragging") == (id)3)
  {
    objc_msgSend(v15, "position");
    v18 = sub_1000603B8(v16, v17, v14);
LABEL_18:
    objc_msgSend(v15, "setPosition:", v18, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
    goto LABEL_19;
  }
  if (objc_msgSend(v11, "maskEditModeForDragging") == (id)2)
  {
    objc_msgSend(v15, "position");
    v18 = sub_1000603D0(v19, v20, v14);
    goto LABEL_18;
  }
LABEL_19:
  -[CRLMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v15, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);

}

- (void)maskModeScaleDidBegin
{
  BYTE2(self->mDynamicPathSource) = 1;
}

- (void)maskModeScaleDidEnd
{
  BYTE2(self->mDynamicPathSource) = 0;
}

- (BOOL)shouldDisplayGuides
{
  void *v3;
  int v4;
  void *v6;
  int v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isResizingInMaskEditMode") & 1) != 0)
  {

    return 0;
  }
  v4 = BYTE2(self->mDynamicPathSource);

  if (v4)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout imageLayout](self, "imageLayout"));
  v7 = objc_msgSend(v6, "isDraggingInMaskEditMode");

  if ((v7 & 1) != 0)
    return 1;
  v8.receiver = self;
  v8.super_class = (Class)CRLMaskLayout;
  return -[CRLCanvasLayout shouldDisplayGuides](&v8, "shouldDisplayGuides");
}

- (id)maskInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLMaskInfo, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (CGRect)pathBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLMaskLayout p_cachedTightPathBounds](self, "p_cachedTightPathBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)pathSource
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout maskInfo](self, "maskInfo"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));

  }
  return v3;
}

- (void)setPathScale:(double)a3
{
  id v4;

  if (*(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.height + 2) != a3)
  {
    *(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.height + 2) = a3;
    -[CRLMaskLayout invalidatePath](self, "invalidatePath");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    -[CRLCanvasAbstractLayout setGeometry:](self, "setGeometry:", v4);

  }
}

- (void)dynamicMovePathKnobDidBegin
{
  CRLCanvasInfoGeometry *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout pathSource](self, "pathSource"));
  v3 = (CRLCanvasInfoGeometry *)objc_msgSend(v5, "copy");
  v4 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = v3;

}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  double v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CRLMaskLayout pathScale](self, "pathScale");
  v9 = sub_1000603DC(x, y, 1.0 / v8);
  v11 = v10;
  v12 = *(id *)((char *)&self->mDynamicInfoGeometry + 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knob"));

  v14 = objc_msgSend(v13, "tag");
  -[CRLMaskLayout pathBounds](self, "pathBounds");
  objc_msgSend(v12, "setControlKnobPosition:toPoint:", v14, sub_1000603D0(v9, v11, v15));

  -[CRLMaskLayout invalidatePath](self, "invalidatePath");
  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
}

- (BOOL)hasSmartPath
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout pathSource](self, "pathSource"));
  objc_opt_class(CRLPathSource, v3);
  v10 = sub_10022209C(v2, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11 != 0;
}

- (unint64_t)numberOfControlKnobs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout pathSource](self, "pathSource"));
  objc_opt_class(CRLPathSource, v3);
  v10 = sub_10022209C(v2, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_msgSend(v11, "numberOfControlKnobs");
  return (unint64_t)v12;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  double v17;
  id v18;

  y = a4.y;
  x = a4.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout pathSource](self, "pathSource"));
  objc_opt_class(CRLPathSource, v9);
  v16 = sub_10022209C(v8, v10, 1, v11, v12, v13, v14, v15, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v18 = (id)objc_claimAutoreleasedReturnValue(v16);

  -[CRLMaskLayout pathBounds](self, "pathBounds");
  objc_msgSend(v18, "setControlKnobPosition:toPoint:", a3, sub_1000603D0(x, y, v17));

}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout pathSource](self, "pathSource"));
  objc_opt_class(CRLPathSource, v6);
  v13 = sub_10022209C(v5, v7, 1, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  objc_msgSend(v14, "getControlKnobPosition:", a3);
  v16 = v15;
  v18 = v17;
  -[CRLMaskLayout pathScale](self, "pathScale");
  v20 = sub_1000603DC(v16, v18, v19);
  v22 = v21;
  -[CRLMaskLayout pathBounds](self, "pathBounds");
  v24 = sub_1000603B8(v20, v22, v23);
  v26 = v25;

  v27 = v24;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (id)infoGeometry
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)((char *)&self->mOriginalPathScale + 2);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));

  }
  return v3;
}

- (void)p_calculateCachedPathIfNecessary
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  id v7;
  CGAffineTransform v8;

  if ((BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) & 1) != 0)
  {
    -[CRLMaskLayout pathScale](self, "pathScale", 0, 0, 0, 0, 0, 0);
    v4 = v3;
    -[CRLMaskLayout pathScale](self, "pathScale");
    CGAffineTransformMakeScale(&v8, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout pathSource](self, "pathSource"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bezierPath")));
    *(CGPath **)((char *)&self->mCachedPath + 2) = CGPathCreateCopy((CGPathRef)objc_msgSend(v7, "CGPath"));

    *(_QWORD *)((char *)&self->mMaskInvalidFlags + 2) = CGPathCreateCopyByTransformingPath(*(CGPathRef *)((char *)&self->mCachedPath + 2), &v8);
    BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) &= ~1u;
  }
}

- (CGPath)p_cachedPath
{
  -[CRLMaskLayout p_calculateCachedPathIfNecessary](self, "p_calculateCachedPathIfNecessary");
  return *(CGPath **)((char *)&self->mMaskInvalidFlags + 2);
}

- (CGPath)p_cachedPathNoScale
{
  -[CRLMaskLayout p_calculateCachedPathIfNecessary](self, "p_calculateCachedPathIfNecessary");
  return *(CGPath **)((char *)&self->mCachedPath + 2);
}

- (void)p_calculateTightPathBoundsIfNecessary
{
  CGFloat *v3;
  CGRect PathBoundingBox;
  CGRect v5;

  if ((BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) & 2) != 0)
  {
    v3 = (CGFloat *)((char *)&self->mCachedPathNoScale + 2);
    PathBoundingBox = CGPathGetPathBoundingBox(-[CRLMaskLayout p_cachedPath](self, "p_cachedPath"));
    *v3 = PathBoundingBox.origin.x;
    v3[1] = PathBoundingBox.origin.y;
    v3[2] = PathBoundingBox.size.width;
    v3[3] = PathBoundingBox.size.height;
    v5 = CGPathGetPathBoundingBox(-[CRLMaskLayout p_cachedPathNoScale](self, "p_cachedPathNoScale"));
    *(CGFloat *)((char *)&self->mCachedTightPathBounds.size.height + 2) = v5.origin.x;
    *(CGFloat *)((char *)&self->mCachedTightPathBoundsNoScale.origin.x + 2) = v5.origin.y;
    *(CGFloat *)((char *)&self->mCachedTightPathBoundsNoScale.origin.y + 2) = v5.size.width;
    *(CGFloat *)((char *)&self->mCachedTightPathBoundsNoScale.size.width + 2) = v5.size.height;
    BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) &= ~2u;
  }
}

- (CGRect)p_cachedTightPathBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLMaskLayout p_calculateTightPathBoundsIfNecessary](self, "p_calculateTightPathBoundsIfNecessary");
  v3 = *(double *)((char *)&self->mCachedPathNoScale + 2);
  v4 = *(double *)((char *)&self->mCachedTightPathBounds.origin.x + 2);
  v5 = *(double *)((char *)&self->mCachedTightPathBounds.origin.y + 2);
  v6 = *(double *)((char *)&self->mCachedTightPathBounds.size.width + 2);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_cachedTightPathBoundsNoScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLMaskLayout p_calculateTightPathBoundsIfNecessary](self, "p_calculateTightPathBoundsIfNecessary");
  v3 = *(double *)((char *)&self->mCachedTightPathBounds.size.height + 2);
  v4 = *(double *)((char *)&self->mCachedTightPathBoundsNoScale.origin.x + 2);
  v5 = *(double *)((char *)&self->mCachedTightPathBoundsNoScale.origin.y + 2);
  v6 = *(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.width + 2);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)p_createDynamicCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CRLCanvasInfoGeometry *v15;
  void *v16;
  void *v17;

  if (*(_QWORD *)((char *)&self->mOriginalPathScale + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B0C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16924();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B0E8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_createDynamicCopies]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 433, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B108);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16898();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B128);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_createDynamicCopies]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 434, 0, "expected nil value for '%{public}s'", "mDynamicPathSource");

  }
  -[CRLMaskLayout pathScale](self, "pathScale");
  *(_QWORD *)((char *)&self->mPathScale + 2) = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout maskInfo](self, "maskInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v12 = objc_claimAutoreleasedReturnValue(-[CRLMaskLayout computeInfoGeometryFromPureLayoutGeometry:](self, "computeInfoGeometryFromPureLayoutGeometry:", v11));
  v13 = *(void **)((char *)&self->mOriginalPathScale + 2);
  *(_QWORD *)((char *)&self->mOriginalPathScale + 2) = v12;

  -[CRLMaskLayout setPathScale:](self, "setPathScale:", 1.0);
  -[CRLMaskLayout invalidatePath](self, "invalidatePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathSource"));
  v15 = (CRLCanvasInfoGeometry *)objc_msgSend(v14, "copy");
  v16 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = v15;

  v17 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  objc_msgSend(*(id *)((char *)&self->mOriginalPathScale + 2), "size");
  objc_msgSend(v17, "scaleToNaturalSize:");

}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  id *v5;
  void *v6;
  void *v7;
  CRLCanvasInfoGeometry *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = (id *)((char *)&self->mOriginalPathScale + 2);
  objc_storeStrong((id *)((char *)&self->mOriginalPathScale + 2), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskLayout maskInfo](self, "maskInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathSource"));
  v8 = (CRLCanvasInfoGeometry *)objc_msgSend(v7, "copy");
  v9 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = v8;

  objc_opt_class(CRLScalarPathSource, v10);
  v12 = sub_100221D0C(v11, *(void **)((char *)&self->mDynamicInfoGeometry + 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "shouldShowKnob") & 1) == 0)
  {
    objc_msgSend(*v5, "size");
    objc_msgSend(*(id *)((char *)&self->mDynamicInfoGeometry + 2), "setNaturalSize:");
  }
  else
  {
    v15 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
    objc_msgSend(*v5, "size");
    objc_msgSend(v15, "scaleToNaturalSize:");
  }
  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLMaskLayout invalidatePath](self, "invalidatePath");

}

- (void)p_destroyDynamicCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!*(_QWORD *)((char *)&self->mOriginalPathScale + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B148);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16A3C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B168);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_destroyDynamicCopies]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 466, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
  if (!*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B188);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E169B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B1A8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_destroyDynamicCopies]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 467, 0, "invalid nil value for '%{public}s'", "mDynamicPathSource");

  }
  v9 = *(void **)((char *)&self->mOriginalPathScale + 2);
  *(double *)((char *)&self->mOriginalPathScale + 2) = 0.0;

  v10 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = 0;

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLMaskLayout invalidatePath](self, "invalidatePath");
}

- (double)pathScale
{
  return *(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.height + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->mDynamicInfoGeometry + 2), 0);
  objc_storeStrong((id *)((char *)&self->mOriginalPathScale + 2), 0);
}

@end
