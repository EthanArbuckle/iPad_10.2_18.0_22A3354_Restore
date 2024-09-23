@implementation CRLShapeLayout

- (CRLShapeLayout)initWithInfo:(id)a3
{
  CRLShapeLayout *v3;
  CRLShapeLayout *v4;
  CRLShapeLayout *v5;
  CRLShapeLayout *v6;
  __int128 v7;
  __objc2_class *v8;
  NSArray *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLShapeLayout;
  v3 = -[CRLCanvasLayout initWithInfo:](&v12, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (CRLShapeLayout *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](v3, "shapeInfo"));
    if (v5)
    {
      v6 = v5;
      BYTE3(v4->super.mDynamicOpacity) = -1;
      *(_OWORD *)((char *)&v4->mClippedPathRotatedTransform.c + 3) = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)((char *)&v4->mCachedClippedPathRotatedStroked.originalCachedRect.size.height + 3) = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)((char *)&v4->mClippedPathRotatedTransform.a + 3) = v7;
      if (-[CRLShapeLayout isFreehandDrawingShape](v5, "isFreehandDrawingShape"))
        v8 = CRLShapeLayoutHelperFreehandDrawing;
      else
        v8 = CRLShapeLayoutHelperDefault;
      v9 = (NSArray *)objc_msgSend([v8 alloc], "initWithShapeLayout:", v4);
      v10 = *(NSArray **)((char *)&v4->mDynamicStrokeOffsetArray + 3);
      *(NSArray **)((char *)&v4->mDynamicStrokeOffsetArray + 3) = v9;

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
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (*(CRLStroke **)((char *)&self->mInitialStroke + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258538);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BBA4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258558);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 90, 0, "expected nil value for '%{public}s'", "mDynamicFill");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeLayout;
  -[CRLShapeLayout dealloc](&v6, "dealloc");
}

- (id)layoutGeometryFromInfo
{
  id v3;
  objc_super v4;

  if (*(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
    return -[CRLCanvasLayoutGeometry initWithInfoGeometry:]([CRLCanvasLayoutGeometry alloc], "initWithInfoGeometry:", *(CRLPathSource **)((char *)&self->mCachedPathSource + 3));
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLayout;
  v3 = -[CRLBoardItemLayout layoutGeometryFromInfo](&v4, "layoutGeometryFromInfo");
  return (id)objc_claimAutoreleasedReturnValue(v3);
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
  double v11;
  double v12;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CRLCanvasLayoutGeometry *v40;
  CRLCanvasLayoutGeometry *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    objc_msgSend(v8, "maximumFrameSizeForChild:", self);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v10 = 1.79769313e308;
    v12 = 1.79769313e308;
  }
  if (v10 == *(double *)(&self->mIsDynamicallyInvisible + 3) && v12 == *(double *)((char *)&self->mHelper + 3))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  }
  else
  {
    *(double *)(&self->mIsDynamicallyInvisible + 3) = v10;
    *(double *)((char *)&self->mHelper + 3) = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathSource"));

  }
  if (v10 >= 1.79769313e308 && v12 >= 1.79769313e308)
  {
    v16 = 0;
    goto LABEL_22;
  }
  v17 = objc_msgSend(v15, "copy");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  objc_msgSend(v18, "center");
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  objc_msgSend(v23, "position");
  v25 = v24;

  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  if (v26)
  {
    v27 = sub_1000603B8(v20, v22, v25);
    objc_msgSend(v26, "transformBasedOnPoint:centeredAtPoint:", CGPointZero.x, CGPointZero.y, v27, v28);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
  }

  v43 = v46;
  v44 = v47;
  v45 = v48;
  -[CRLStyledLayout scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:](self, "scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:", &v43, v17);
  v30 = v29;
  if (v29 == 1.0)
  {
    if (v15 != *(void **)((char *)&self->mHeadCutT + 3))
    {
      v16 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(v17, "naturalSize");
    objc_msgSend(v17, "scaleToNaturalSize:", sub_1000603DC(v31, v32, v30));
  }
  v16 = v17;
LABEL_21:

LABEL_22:
  v33 = *(void **)((char *)&self->mHeadCutT + 3);
  *(_QWORD *)((char *)&self->mHeadCutT + 3) = v16;
  v34 = v16;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  if (v35 != v15)
  {

LABEL_25:
    -[CRLShapeLayout invalidatePath](self, "invalidatePath");
    -[CRLShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
    goto LABEL_26;
  }

  if ((v34 != 0) == (v33 == 0))
    goto LABEL_25;
LABEL_26:
  -[CRLShapeLayout pathBounds](self, "pathBounds");
  v37 = v36;
  v39 = v38;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  -[CRLShapeLayout computeLayoutTransform](self, "computeLayoutTransform");
  v40 = [CRLCanvasLayoutGeometry alloc];

  v43 = v46;
  v44 = v47;
  v45 = v48;
  v41 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v40, "initWithSize:transform:", &v43, v37, v39);

  return v41;
}

- (CGAffineTransform)computeLayoutTransform
{
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGAffineTransform v10;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&v11, 0, sizeof(v11));

  -[CRLShapeLayout pathBounds](self, "pathBounds");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v10 = v11;
  return CGAffineTransformTranslate(retstr, &v10, v7, v8);
}

- (BOOL)shouldBringCardinalMagnetsInward
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[CRLShapeLayout numberOfControlKnobs](self, "numberOfControlKnobs"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bezierPath"));
  v3 = (uint64_t)objc_msgSend(v5, "elementCount") < 8;

  return v3;
}

- (void)p_performBlockOkayToSetGeometry:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void (**)(_QWORD))a3;
  if (BYTE3(self->mLastParentLimitedSize.width))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258578);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BC30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258598);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_performBlockOkayToSetGeometry:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 178, 0, "Reentrant geometry changing okay logic");

    v8 = BYTE3(self->mLastParentLimitedSize.width);
  }
  else
  {
    v8 = 0;
  }
  BYTE3(self->mLastParentLimitedSize.width) = 1;
  v4[2](v4);
  BYTE3(self->mLastParentLimitedSize.width) = v8;

}

- (void)setGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  double y;
  double v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  double v22;
  CGPoint v23;
  float64x2_t v24;
  objc_super v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t1;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;

  v4 = a3;
  if (!BYTE3(self->mLastParentLimitedSize.width))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012585B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BCB0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012585D8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout setGeometry:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 186, 0, "You should not be setting the geometry on a shape except via its own validation logic, or via -offsetGeometryBy: Please talk to drawables if you think you want to do this.");

  }
  if (*(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v9 = v8;
    if (v8)
    {
      if ((objc_msgSend(v8, "isEqual:", v4) & 1) != 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      if ((objc_msgSend(v9, "differsInMoreThanTranslationFrom:", v4) & 1) == 0)
      {
        if (v4)
        {
          objc_msgSend(v4, "transform");
          v11 = v35;
          v12 = v36;
          v13 = v37;
        }
        else
        {
          v13 = 0uLL;
          v36 = 0u;
          v37 = 0u;
          v35 = 0u;
          v11 = 0uLL;
          v12 = 0uLL;
        }
        y = CGPointZero.y;
        v23 = CGPointZero;
        v24 = vaddq_f64(v13, vmlaq_n_f64(vmulq_n_f64(v12, y), v11, CGPointZero.x));
        objc_msgSend(v9, "transform", *(_QWORD *)&y, v10);
        v15 = sub_1000603B8(v24.f64[0], v24.f64[1], vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v22), v32, v23.x)).f64[0]);
        *(double *)((char *)&self->mClippedPathRotatedTransform.tx + 3) = sub_1000603D0(*(double *)((char *)&self->mClippedPathRotatedTransform.tx+ 3), *(double *)((char *)&self->mClippedPathRotatedTransform.ty+ 3), v15);
        *(_QWORD *)((char *)&self->mClippedPathRotatedTransform.ty + 3) = v16;
        v17 = (_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3);
        v18 = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3);
        *(_OWORD *)&v31.a = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3);
        *(_OWORD *)&v31.c = v18;
        *(_OWORD *)&v31.tx = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3);
        if (sub_1000791B0(&v31) == 0.0)
        {
          *(double *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.height + 3) = sub_1000603D0(*(double *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.height + 3), *(double *)((char *)&self->mCachedAlignmentFrame.isValid + 3), v15);
          *(_QWORD *)((char *)&self->mCachedAlignmentFrame.isValid + 3) = v19;
          memset(&v31, 0, sizeof(v31));
          objc_msgSend(v9, "transform");
          CGAffineTransformInvert(&t2, &v29);
          v20 = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3);
          *(_OWORD *)&t1.a = *v17;
          *(_OWORD *)&t1.c = v20;
          *(_OWORD *)&t1.tx = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3);
          CGAffineTransformConcat(&v31, &t1, &t2);
          if (v4)
            objc_msgSend(v4, "transform");
          else
            memset(&v27, 0, sizeof(v27));
          v26 = v31;
          CGAffineTransformConcat(&t1, &v26, &v27);
          v21 = *(_OWORD *)&t1.c;
          *v17 = *(_OWORD *)&t1.a;
          *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3) = v21;
          *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3) = *(_OWORD *)&t1.tx;
        }
        else
        {
          *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
        }
        goto LABEL_28;
      }
    }
    if (!-[CRLShapeLayout p_dynamicallyUpdatingStrokedFramesDuringResize](self, "p_dynamicallyUpdatingStrokedFramesDuringResize")|| -[CRLCanvasLayout layoutState](self, "layoutState") != 4&& -[CRLCanvasLayout layoutState](self, "layoutState") != 5)
    {
      *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
      *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
    }
    goto LABEL_28;
  }
LABEL_29:
  v25.receiver = self;
  v25.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout setGeometry:](&v25, "setGeometry:", v4);

}

- (CGRect)alignmentFrame
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v8;
  CGRect result;

  v2 = (double *)((char *)&self->mClippedPathRotatedTransform.tx + 3);
  if (*(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3))
  {
    v3 = *v2;
    v4 = *(double *)((char *)&self->mClippedPathRotatedTransform.ty + 3);
    v5 = *(double *)((char *)&self->mCachedAlignmentFrame.cachedRect.origin.x + 3);
    v6 = *(double *)((char *)&self->mCachedAlignmentFrame.cachedRect.origin.y + 3);
  }
  else
  {
    -[CRLCanvasAbstractLayout transform](self, "transform");
    -[CRLShapeLayout shapeFrameWithTransform:](self, "shapeFrameWithTransform:", &v8);
    *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  CGAffineTransform v13;
  objc_super v14;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect result;

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLShapeLayout;
    v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v7;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    -[CRLStyledLayout baseFrameForFrameForCullingWithAdditionalTransform:](&v14, "baseFrameForFrameForCullingWithAdditionalTransform:", &t1);
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    -[CRLCanvasAbstractLayout transform](self, "transform");
    v12 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v12;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&t1, &v13, &t2);
    t2 = t1;
    -[CRLShapeLayout shapeFrameWithTransform:](self, "shapeFrameWithTransform:", &t2);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  void *v3;
  double *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

  if (v3)
  {
    v4 = (double *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.height + 3);
    if (!*(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3)
      || (-[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot"),
          v5 = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3),
          *(_OWORD *)&t1.a = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3),
          *(_OWORD *)&t1.c = v5,
          *(_OWORD *)&t1.tx = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3),
          !CGAffineTransformEqualToTransform(&t1, &t2)))
    {
      -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
      -[CRLShapeLayout shapeFrameWithTransform:](self, "shapeFrameWithTransform:", &v15);
      *(_QWORD *)v4 = v6;
      *(_QWORD *)((char *)&self->mCachedAlignmentFrame.isValid + 3) = v7;
      *(_QWORD *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.x + 3) = v8;
      *(_QWORD *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.y + 3) = v9;
      -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
      v10 = *(_OWORD *)&t1.c;
      *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3) = *(_OWORD *)&t1.a;
      *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3) = v10;
      *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3) = *(_OWORD *)&t1.tx;
      *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 1;
    }
    v11 = *v4;
    v12 = *(double *)((char *)&self->mCachedAlignmentFrame.isValid + 3);
    v13 = *(double *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.x + 3);
    v14 = *(double *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.y + 3);
  }
  else
  {
    -[CRLShapeLayout alignmentFrame](self, "alignmentFrame");
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout processChangedProperty:](&v7, "processChangedProperty:");
  switch(a3)
  {
    case 0xFuLL:
      if (!-[CRLShapeLayout i_isInsideResizingFreehandDrawing](self, "i_isInsideResizingFreehandDrawing"))
      {
        -[CRLShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
        -[CRLShapeLayout p_invalidateHead](self, "p_invalidateHead");
        -[CRLShapeLayout p_invalidateTail](self, "p_invalidateTail");
        -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
        v5 = *(void **)((char *)&self->mHeadCutT + 3);
        if (v5)
        {
          *(double *)((char *)&self->mHeadCutT + 3) = 0.0;

          -[CRLShapeLayout invalidatePath](self, "invalidatePath");
        }
      }
      return;
    case 0x13uLL:
      -[CRLShapeLayout invalidatePath](self, "invalidatePath");
      v6 = *(void **)((char *)&self->mHeadCutT + 3);
      *(double *)((char *)&self->mHeadCutT + 3) = 0.0;

      goto LABEL_8;
    case 0x15uLL:
      -[CRLShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
      -[CRLShapeLayout p_invalidateHead](self, "p_invalidateHead");
      goto LABEL_8;
    case 0x16uLL:
      -[CRLShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
      -[CRLShapeLayout p_invalidateTail](self, "p_invalidateTail");
LABEL_8:
      -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
      break;
    default:
      return;
  }
}

- (CGRect)boundsForStandardKnobs
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGRect v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  objc_msgSend(v3, "naturalSize");
  v4 = sub_10005FDDC();
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[CRLShapeLayout pathBounds](self, "pathBounds");
  v12 = -v11;
  v14 = -v13;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectOffset(v15, v12, v14);
}

- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  __int128 v4;
  _OWORD v5[3];
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)CRLShapeLayout;
  v4 = *(_OWORD *)&a4->c;
  v5[0] = *(_OWORD *)&a4->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a4->tx;
  -[CRLStyledLayout frameForCullingWithBaseFrame:additionalTransform:](&v6, "frameForCullingWithBaseFrame:additionalTransform:", v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v7, -1.0, -1.0);
}

- (CGRect)frameForPartitioning
{
  CGRect v2;

  -[CRLCanvasLayout frameForCulling](self, "frameForCulling");
  return CGRectInset(v2, 1.0, 1.0);
}

- (id)dependentLayoutsForDrag
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout dependentLayouts](self, "dependentLayouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crl_arrayOfObjectsPassingTest:", &stru_101258618));

  return v3;
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLPathSource *v10;
  void *v11;
  CGAffineTransform v12;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout dragBy:](&v13, "dragBy:");
  v6 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258638);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BD30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258658);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dragBy:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 333, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

    v6 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  }
  CGAffineTransformMakeTranslation(&v12, x, y);
  v10 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByAppendingTransform:", &v12));
  v11 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v10;

}

- (BOOL)shouldAdjustForStrokeWidthForCollabCursor
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;
  void *v7;
  void *v8;
  double v9;

  if (!-[CRLShapeLayout pathIsLineSegment](self, "pathIsLineSegment"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));
  objc_msgSend(v4, "size");
  if (v5 == 0.0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
    objc_msgSend(v8, "size");
    v6 = v9 == 0.0;

  }
  return v6;
}

- (id)stroke
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stroke"));

  }
  return v3;
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLPKStrokePathCompactData *v8;
  void *v9;

  if (*(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BDBC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258698);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicStrokeWidthChangeDidBegin]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 355, 0, "expected nil value for '%{public}s'", "mDynamicStroke");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stroke"));
  v8 = (CRLPKStrokePathCompactData *)objc_msgSend(v7, "mutableCopy");
  v9 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3) = v8;

}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012586B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BE48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012586D8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicStrokeWidthUpdateToValue:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 360, 0, "invalid nil value for '%{public}s'", "mDynamicStroke");

    v5 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  }
  objc_msgSend(v5, "setWidth:", a3);
  -[CRLShapeLayout processChangedProperty:](self, "processChangedProperty:", 15);
  if (-[CRLCanvasLayout layoutState](self, "layoutState") != 4
    && -[CRLCanvasLayout layoutState](self, "layoutState") != 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasController"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repForLayout:", self));
    objc_msgSend(v12, "processChangedProperty:", 15);

  }
}

- (void)dynamicStrokeWidthChangeDidEnd
{
  void *v2;

  v2 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3) = 0;

}

- (BOOL)isStrokeBeingManipulated
{
  return *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3) != 0;
}

- (BOOL)currentlySupportsAddingFrames
{
  return !-[CRLShapeLayout pathIsOpen](self, "pathIsOpen");
}

- (_TtC8Freeform12CRLShapeItem)shapeInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLShapeItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLShapeItem *)v8;
}

- (CRLPathSource)pathSource
{
  void *v2;
  id v3;
  void *v5;

  v2 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  if (v2 || (v2 = *(void **)((char *)&self->mHeadCutT + 3)) != 0)
  {
    v3 = v2;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathSource"));

  }
  return (CRLPathSource *)v3;
}

- (CRLBezierPath)maskPath
{
  void *v2;
  id v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3);
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v3, "isEmpty") & 1) == 0)
      return (CRLBezierPath *)v3;
    goto LABEL_6;
  }
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v5));
  v9 = sub_100221D0C(v7, v8);
  v3 = (id)objc_claimAutoreleasedReturnValue(v9);

  if (!v3)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskPath"));
LABEL_7:

  v3 = (id)v10;
  return (CRLBezierPath *)v3;
}

- (NSArray)pencilKitStrokes
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v17;
  objc_class *v18;
  objc_class *v19;
  void *v20;
  id v21;

  if (*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3)
    || *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3)
    || *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3)
    || *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3))
  {
    *(_QWORD *)&v3 = objc_opt_class(CRLPencilKitInkStroke, a2).n128_u64[0];
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke", v3));
    v7 = sub_1002223BC(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pencilKitStrokePathCompactData](self, "pencilKitStrokePathCompactData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout maskPath](self, "maskPath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pencilKitStrokesFromPath:inkStroke:strokePathCompactData:maskPath:](CRLPKStrokeConverter, "pencilKitStrokesFromPath:inkStroke:strokePathCompactData:maskPath:", v9, v8, v10, v11));

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012586F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2BED4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101258718);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout pencilKitStrokes]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 432, 0, "invalid nil value for '%{public}s'", "inkStroke");

      v12 = 0;
    }
  }
  else
  {
    *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, a2).n128_u64[0];
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v17));
    v21 = sub_1002223BC(v19, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v21);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pencilKitStrokes"));
  }

  return (NSArray *)v12;
}

- (NSArray)pencilKitStrokesInParentInfoSpace
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if (*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3)
    || *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3)
    || *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3)
    || *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3)
    || *(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "transform");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pencilKitStrokes](self, "pencilKitStrokes"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003B951C;
    v14[3] = &unk_1012379D8;
    v15 = v18;
    v16 = v19;
    v17 = v20;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crl_arrayByTransformingWithBlock:", v14));
  }
  else
  {
    *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, a2).n128_u64[0];
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v9));
    v13 = sub_1002223BC(v11, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pencilKitStrokesInParentSpace"));
  }
  v7 = (void *)v6;

  return (NSArray *)v7;
}

- (CRLPKStrokePathCompactData)pencilKitStrokePathCompactData
{
  void *v2;
  id v3;
  double v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;

  v2 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, a2).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v5));
    v9 = sub_1002223BC(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pencilKitStrokePathCompactData"));
  }
  return (CRLPKStrokePathCompactData *)v3;
}

- (id)editablePathSource
{
  void *v3;
  void *v4;
  CRLPathSource *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  CRLPathSource *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v5 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));

  objc_opt_class(CRLEditableBezierPathSource, v6);
  v8 = sub_100221D0C(v7, v3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = (id)v9;
    v11 = *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3);
    *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3) = 0;

    v12 = *(CRLPathSource **)((char *)&self->mOriginalShrunkenPathSource + 3);
    *(CRLPathSource **)((char *)&self->mOriginalShrunkenPathSource + 3) = 0;

  }
  else
  {
    if (v5 != *(CRLPathSource **)((char *)&self->mOriginalShrunkenPathSource + 3))
    {
      v13 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(+[CRLEditableBezierPathSource editableBezierPathSourceWithPathSource:](CRLEditableBezierPathSource, "editableBezierPathSourceWithPathSource:", v3));
      v14 = *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3);
      *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3) = v13;

      objc_storeStrong((id *)((char *)&self->mOriginalShrunkenPathSource + 3), v3);
    }
    v10 = *(id *)((char *)&self->mShrunkenPathSource + 3);
  }

  return v10;
}

- (CRLSmartPathSource)smartPathSource
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (CRLSmartPathSource *)v10;
}

- (BOOL)pathIsOpen
{
  return -[CRLShapeLayout p_cachedPathIsOpen](self, "p_cachedPathIsOpen");
}

- (BOOL)pathIsLineSegment
{
  return -[CRLShapeLayout p_cachedPathIsLineSegment](self, "p_cachedPathIsLineSegment");
}

- (CRLCanvasInfoGeometry)layoutInfoGeometry
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
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

- (CGPoint)headPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  v3 = *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3);
  v4 = *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.ty + 3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)tailPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  v3 = *(double *)((char *)&self->mHeadPoint.x + 3);
  v4 = *(double *)((char *)&self->mHeadPoint.y + 3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)headLineEndPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLShapeLayout p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  v3 = *(double *)((char *)&self->mTailPoint.x + 3);
  v4 = *(double *)((char *)&self->mTailPoint.y + 3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)tailLineEndPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLShapeLayout p_validateTailLineEnd](self, "p_validateTailLineEnd");
  v3 = *(double *)((char *)&self->mHeadLineEndPoint.x + 3);
  v4 = *(double *)((char *)&self->mHeadLineEndPoint.y + 3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)headLineEndAngle
{
  -[CRLShapeLayout p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  return *(double *)((char *)&self->mTailLineEndPoint.x + 3);
}

- (double)tailLineEndAngle
{
  -[CRLShapeLayout p_validateTailLineEnd](self, "p_validateTailLineEnd");
  return *(double *)((char *)&self->mTailLineEndPoint.y + 3);
}

- (BOOL)isTailEndOnLeft
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  -[CRLShapeLayout tailLineEndPoint](self, "tailLineEndPoint");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transform");
    v10 = v32;
    v9 = v31;
    v12 = v34;
    v11 = v33;
    v13 = v36;
    v14 = v35;
  }
  else
  {
    v13 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    v14 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
  }

  -[CRLShapeLayout headLineEndPoint](self, "headLineEndPoint");
  v25 = v16;
  v26 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot"));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "transform");
    v19 = v28;
    v20 = v29;
    v21 = v30;
  }
  else
  {
    v21 = 0uLL;
    v19 = 0uLL;
    v20 = 0uLL;
  }
  *(_QWORD *)&v27 = *(_OWORD *)&vaddq_f64(v21, vmlaq_n_f64(vmulq_n_f64(v20, v25), v19, v26));

  v22 = sub_1000603B8(v14 + v6 * v11 + v9 * v4, v13 + v6 * v12 + v10 * v4, v27);
  if (fabs(v22) < 1.0)
    v22 = v23;
  return v22 < 0.0;
}

- (double)lineEndScale:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(-[CRLShapeLayout strokeHeadLineEnd](self, "strokeHeadLineEnd"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[CRLShapeLayout strokeTailLineEnd](self, "strokeTailLineEnd"));
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
  objc_msgSend(v6, "width");
  objc_msgSend(v5, "scaleForStrokeWidth:");
  v8 = v7;

  return v8;
}

- (CRLBezierPath)clippedPathForLineEnds
{
  id v3;
  void *v4;

  if (SBYTE3(self->super.mDynamicOpacity) < 0)
  {
    v3 = -[CRLShapeLayout p_createClippedPath](self, "p_createClippedPath");
    v4 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);
    *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3) = v3;

    BYTE3(self->super.mDynamicOpacity) &= ~0x80u;
  }
  return (CRLBezierPath *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height
                                                                  + 3));
}

- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v8[3];
  CGRect result;

  v3 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&a3->tx;
  -[CRLShapeLayout shapeFrameWithTransform:strokeDrawOptions:](self, "shapeFrameWithTransform:strokeDrawOptions:", v8, 7);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3 strokeDrawOptions:(unint64_t)a4
{
  char v4;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  __int128 v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;
  CGRect v44;

  v4 = a4;
  -[CRLShapeLayout pathBounds](self, "pathBounds");
  v9 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v34.c = v9;
  *(_OWORD *)&v34.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformTranslate(&v35, &v34, -v7, -v8);
  v10 = *(_OWORD *)&v35.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v35.a;
  *(_OWORD *)&a3->c = v10;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v35.tx;
  if ((v4 & 1) != 0)
  {
    v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v35.c = v15;
    *(_OWORD *)&v35.tx = *(_OWORD *)&a3->tx;
    if (sub_100079A6C(&v35.a))
    {
      -[CRLShapeLayout p_cachedClippedPathStroked](self, "p_cachedClippedPathStroked");
      v16 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v16;
      *(_OWORD *)&v35.tx = *(_OWORD *)&a3->tx;
      v37 = CGRectApplyAffineTransform(v36, &v35);
    }
    else
    {
      v17 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v17;
      *(_OWORD *)&v35.tx = *(_OWORD *)&a3->tx;
      -[CRLShapeLayout p_updatedCachedClipRectIfNeededForRotation:](self, "p_updatedCachedClipRectIfNeededForRotation:", &v35);
    }
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  if (-[CRLShapeLayout pathIsOpen](self, "pathIsOpen"))
  {
    if ((v4 & 2) != 0)
    {
      v18 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
      v19 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v19;
      *(_OWORD *)&v35.tx = *(_OWORD *)&a3->tx;
      objc_msgSend(v18, "boundsOfLineEndForHead:transform:", 1, &v35);
      v43.origin.x = v20;
      v43.origin.y = v21;
      v43.size.width = v22;
      v43.size.height = v23;
      v38.origin.x = x;
      v38.origin.y = y;
      v38.size.width = width;
      v38.size.height = height;
      v39 = CGRectUnion(v38, v43);
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;
    }
    if ((v4 & 4) != 0)
    {
      v24 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
      v25 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v25;
      *(_OWORD *)&v35.tx = *(_OWORD *)&a3->tx;
      objc_msgSend(v24, "boundsOfLineEndForHead:transform:", 0, &v35);
      v44.origin.x = v26;
      v44.origin.y = v27;
      v44.size.width = v28;
      v44.size.height = v29;
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v41 = CGRectUnion(v40, v44);
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
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

- (BOOL)isInvisible
{
  return BYTE3(self->mDynamicFill);
}

- (BOOL)isInvisibleAutosizingShape
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  unsigned int v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));
  v5 = objc_msgSend(v4, "widthValid");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  v8 = objc_msgSend(v7, "heightValid");

  if (v5 && (v8 & 1) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvas"));
    v9 = objc_msgSend(v11, "shouldShowInstructionalTextForLayout:", self) ^ 1;

  }
  return v9;
}

- (CGPoint)centerForConnecting
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  v13.receiver = self;
  v13.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout centerForConnecting](&v13, "centerForConnecting");
  v4 = v3;
  v6 = v5;
  if (-[CRLShapeLayout isInvisibleAutosizingShape](self, "isInvisibleAutosizingShape"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
    objc_msgSend(v8, "center");
    v4 = v9;
    v6 = v10;

  }
  v11 = v4;
  v12 = v6;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(*(id *)((char *)&self->mDynamicStrokeOffsetArray + 3), "aliasedAlignmentFrameForScale:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)aliasPathForScale:(double)a3 adjustedStroke:(id *)a4 adjustedPath:(id *)a5 startDelta:(CGPoint *)a6 endDelta:(CGPoint *)a7
{
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
  -[CRLShapeLayout aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:](self, "aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:", v13, a4, a5, a6, a7, a3);

}

- (void)aliasPathForScale:(double)a3 originalStroke:(id)a4 adjustedStroke:(id *)a5 adjustedPath:(id *)a6 startDelta:(CGPoint *)a7 endDelta:(CGPoint *)a8
{
  void *v8;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  CGPoint *v24;
  uint64_t v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGPoint *v33;
  unsigned int v34;
  CGPoint *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  CGFloat v50;
  CGFloat v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  id *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  void *v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  CGFloat v77;
  char v78;
  id v79;
  id v80;
  CGPoint *v81;
  id *v82;
  id *v83;
  id *v84;
  id *v85;
  id *v86;
  void *v87;
  id v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  CGRect v97;
  CGRect v98;

  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v87 = v15;
  if (!-[CRLShapeLayout pathIsOpen](self, "pathIsOpen"))
  {
LABEL_17:
    v24 = a7;
    v25 = objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    goto LABEL_22;
  }
  v82 = a6;
  v85 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headLineEnd"));
  if (v16)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headLineEnd"));
    a5 = (id *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if ((objc_msgSend(v8, "isEqual:", a5) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headLineEnd"));
      if ((objc_msgSend(v18, "isNone") & 1) == 0)
      {

        a5 = v85;
        goto LABEL_21;
      }
      v79 = v18;
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tailLineEnd"));
  if (!v19)
  {
    v23 = 0;
    if (!v17)
      goto LABEL_14;
    goto LABEL_13;
  }
  v20 = (void *)v19;
  v81 = a7;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tailLineEnd"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if ((objc_msgSend(v21, "isEqual:", v22) & 1) != 0)
  {

    v23 = 0;
    a7 = v81;
    if ((v17 & 1) == 0)
      goto LABEL_14;
LABEL_13:

    goto LABEL_14;
  }
  v78 = v17;
  v26 = a5;
  v27 = v8;
  v28 = v14;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tailLineEnd"));
  v23 = objc_msgSend(v29, "isNone") ^ 1;

  v14 = v28;
  v8 = v27;
  a5 = v26;

  a7 = v81;
  if ((v78 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  a6 = v82;
  if (v16)
  {

  }
  a5 = v85;
  if ((v23 & 1) == 0)
    goto LABEL_17;
LABEL_21:
  v24 = a7;
  v25 = objc_claimAutoreleasedReturnValue(-[CRLShapeLayout clippedPathForLineEnds](self, "clippedPathForLineEnds"));
LABEL_22:
  v30 = (void *)v25;
  memset(&v95, 0, sizeof(v95));
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "canvas"));

  v33 = a8;
  if ((objc_msgSend(v32, "isPrinting") & 1) != 0)
    v34 = 1;
  else
    v34 = objc_msgSend(v32, "isDrawingIntoPDF");
  v35 = v24;
  if (a5)
    *a5 = objc_retainAutorelease(v14);
  if (a6)
    *a6 = objc_msgSend(v30, "copy");
  if (v24)
    *v24 = CGPointZero;
  if (a8)
    *a8 = CGPointZero;
  if (v30)
  {
    v96 = v95;
    if (((!sub_100079384(&v96.a) | v34) & 1) == 0)
    {
      -[CRLShapeLayout pathBounds](self, "pathBounds");
      v37 = v36;
      v39 = v38;
      if (!objc_msgSend(v14, "shouldRender") || objc_msgSend(v14, "shouldAntialiasDefeat"))
      {
        v80 = objc_msgSend(v14, "mutableCopy");
        v40 = 0.0;
        if (objc_msgSend(v80, "shouldRender"))
        {
          objc_msgSend(v14, "width");
          v42 = v41 * a3;
          v40 = 1.0;
          if (v42 > 1.0)
          {
            v40 = sub_1003C65A0(v42);
            objc_msgSend(v80, "setWidth:", v40 / a3);
          }
          objc_msgSend(v14, "width");
          objc_msgSend(v80, "setActualWidth:");
        }
        v86 = a5;
        if (v24)
        {
          if (a8)
          {
LABEL_62:
            v49 = objc_msgSend(v30, "copy");
            objc_msgSend(v30, "elementAtIndex:associatedPoints:", 0, &v96);
            if (v35)
              *v35 = *(CGPoint *)&v96.a;
            if (v33)
            {
              objc_msgSend(v30, "currentPoint");
              v33->x = v50;
              v33->y = v51;
            }
            v93 = v95;
            CGAffineTransformTranslate(&v94, &v93, -v37, -v39);
            v95 = v94;
            objc_msgSend(v49, "transformUsingAffineTransform:", &v94);
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
            objc_opt_class(CRLScalarPathSource, v53);
            if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0 && objc_msgSend(v52, "isCurveContinuous"))
            {
              v89 = objc_msgSend(v52, "copy");
              objc_msgSend(v49, "bounds");
              v57 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));
              *(float *)&v58 = a3;
              *(float *)&v59 = v40;
              v60 = a6;
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "aliasedPathWithViewScale:effectiveStrokeWidth:", v58, v59));
              objc_msgSend(v61, "bounds");
              v63 = v62;
              v65 = v64;
              v67 = v66;
              v69 = v68;

              a6 = v60;
              v35 = v24;
              v94 = v95;
              CGAffineTransformInvert(&v92, &v94);
              v97.origin.x = v63;
              v97.origin.y = v65;
              v97.size.width = v67;
              v97.size.height = v69;
              v98 = CGRectApplyAffineTransform(v97, &v92);
              objc_msgSend(v89, "scaleToNaturalSize:", v98.size.width, v98.size.height);
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bezierPathWithoutFlips"));

              v94 = v95;
              objc_msgSend(v70, "transformUsingAffineTransform:", &v94);
              objc_msgSend(v70, "bounds");
              v72 = v63 - v71;
              objc_msgSend(v70, "bounds");
              CGAffineTransformMakeTranslation(&v91, v72, v65 - v73);
              objc_msgSend(v70, "transformUsingAffineTransform:", &v91);
              v49 = v89;
            }
            else
            {
              *(float *)&v55 = a3;
              *(float *)&v56 = v40;
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "aliasedPathWithViewScale:effectiveStrokeWidth:", v55, v56));
            }

            v94 = v95;
            CGAffineTransformInvert(&v90, &v94);
            objc_msgSend(v70, "transformUsingAffineTransform:", &v90);
            *(CGPoint *)&v94.a = CGPointZero;
            objc_msgSend(v70, "elementAtIndex:associatedPoints:", 0, &v94);
            if (v35)
            {
              v35->x = sub_1000603B8(v94.a, v94.b, v35->x);
              v35->y = v74;
            }
            if (v33)
            {
              objc_msgSend(v70, "currentPoint");
              v33->x = sub_1000603B8(v75, v76, v33->x);
              v33->y = v77;
            }
            if (v86)
              *v86 = objc_retainAutorelease(v80);
            if (a6)
              *a6 = objc_retainAutorelease(v70);

            goto LABEL_79;
          }
        }
        else
        {
          v83 = a6;
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101258738);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E2BFEC();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101258758);
          v33 = a8;
          v43 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:]"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 716, 0, "invalid nil value for '%{public}s'", "startDelta");

          v35 = 0;
          a6 = v83;
          if (a8)
            goto LABEL_62;
        }
        v84 = a6;
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101258778);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E2BF60();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101258798);
        v33 = a8;
        v46 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:]"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 717, 0, "invalid nil value for '%{public}s'", "endDelta");

        v35 = v24;
        a6 = v84;
        goto LABEL_62;
      }
    }
  }
LABEL_79:

}

- (CRLFill)fill
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(CRLStroke **)((char *)&self->mInitialStroke + 3);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fill"));

  }
  return (CRLFill *)v3;
}

- (BOOL)canBeIntersected
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (-[CRLShapeLayout pathIsLineSegment](self, "pathIsLineSegment"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  objc_opt_class(CRLCanvasLayout, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v3 = objc_msgSend(v7, "allowIntersectionOfChildLayout:", self);

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)canBeDivided
{
  return -[CRLShapeLayout p_cachedPathHasAtLeastTwoVisuallyDistinctSubregions](self, "p_cachedPathHasAtLeastTwoVisuallyDistinctSubregions");
}

- (BOOL)canResetTextAndObjectHandles
{
  return !-[CRLShapeLayout pathIsLineSegment](self, "pathIsLineSegment");
}

- (BOOL)supportsCalloutAttributes
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLCalloutPathSource, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  LOBYTE(v5) = v8 != 0;

  return v5;
}

- (void)invalidateFrame
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout invalidateFrame](&v12, "invalidateFrame");
  *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
  if (-[CRLCanvasLayout layoutState](self, "layoutState") == 2)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout dependentLayoutsForDrag](self, "dependentLayoutsForDrag", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "invalidateFrame");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)invalidatePath
{
  void *v3;

  BYTE3(self->super.mDynamicOpacity) |= 0xFu;
  v3 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);
  *(_QWORD *)(&self->super._suppressesShadowsAndReflections + 3) = 0;

  -[CRLShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
  -[CRLShapeLayout p_invalidateHead](self, "p_invalidateHead");
  -[CRLShapeLayout p_invalidateTail](self, "p_invalidateTail");
  -[CRLShapeLayout p_invalidateClippedPath](self, "p_invalidateClippedPath");
}

- (void)invalidatePathBounds
{
  CGPoint origin;
  CGSize size;

  *(_DWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3) = 0;
  origin = CGRectZero.origin;
  size = CGRectZero.size;
  *(CGPoint *)((char *)&self->mCachedPath + 3) = CGRectZero.origin;
  *(CGSize *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin + 3) = size;
  *(CGPoint *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.height + 3) = origin;
  *(CGSize *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin + 3) = size;
  -[CRLShapeLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (BOOL)i_isInsideResizingFreehandDrawing
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;

  *(_QWORD *)&v3 = objc_opt_class(CRLFreehandDrawingLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info", v10));
  v14 = sub_100221D0C(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v8 && (objc_msgSend(v8, "layoutState") == 4 || objc_msgSend(v8, "layoutState") == 5))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v17 = objc_msgSend(v15, "isNonGroupedChild:", v16) ^ 1;

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)p_dynamicallyUpdatingStrokedFramesDuringResize
{
  unsigned int v3;
  void *v4;
  void *v5;

  if (-[CRLShapeLayout i_isInsideResizingFreehandDrawing](self, "i_isInsideResizingFreehandDrawing"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
      v3 = objc_msgSend(v5, "shouldRender") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 1;
    }

  }
  return v3;
}

- (void)beginResize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout beginResize](&v3, "beginResize");
  -[CRLShapeLayout p_beginResizeOrFreeTransform](self, "p_beginResizeOrFreeTransform");
}

- (void)beginFreeTransformWithTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout beginFreeTransformWithTracker:](&v4, "beginFreeTransformWithTracker:", a3);
  -[CRLShapeLayout p_beginResizeOrFreeTransform](self, "p_beginResizeOrFreeTransform");
}

- (void)p_beginResizeOrFreeTransform
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;

  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3))
  {
    if (-[CRLShapeLayout i_isInsideResizingFreehandDrawing](self, "i_isInsideResizingFreehandDrawing"))
    {
      -[CRLShapeLayout dynamicStrokeWidthChangeDidBegin](self, "dynamicStrokeWidthChangeDidBegin");
      if (*(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3))
        -[CRLShapeLayout dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin](self, "dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin");
    }
  }
  -[CRLShapeLayout p_cachedPathBounds](self, "p_cachedPathBounds");
  *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.cachedRect.size.width + 3) = v3;
  *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.cachedRect.size.height + 3) = v4;
  *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.origin.x + 3) = v5;
  *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.origin.y + 3) = v6;
  -[CRLShapeLayout p_cachedPathBoundsWithoutStroke](self, "p_cachedPathBoundsWithoutStroke");
  *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.size.width + 3) = v7;
  *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.size.height + 3) = v8;
  *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.origin.x + 3) = v9;
  *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.origin.y + 3) = v10;
  -[CRLShapeLayout alignmentFrame](self, "alignmentFrame");
  *(_QWORD *)((char *)&self->mCachedAlignmentFrame.cachedRect.size.width + 3) = v11;
  *(_QWORD *)((char *)&self->mCachedAlignmentFrame.cachedRect.size.height + 3) = v12;
  *(_QWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.origin.x + 3) = v13;
  *(_QWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.origin.y + 3) = v14;
  -[CRLShapeLayout p_cachedClippedPathStroked](self, "p_cachedClippedPathStroked");
  *(_QWORD *)((char *)&self->mCachedClippedPathStroked.cachedRect.size.width + 3) = v15;
  *(_QWORD *)((char *)&self->mCachedClippedPathStroked.cachedRect.size.height + 3) = v16;
  *(_QWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.origin.x + 3) = v17;
  *(_QWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.origin.y + 3) = v18;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v26 = 0uLL;
  v23[0] = v24;
  v23[1] = v25;
  v23[2] = 0uLL;
  -[CRLShapeLayout p_updatedCachedClipRectIfNeededForRotation:](self, "p_updatedCachedClipRectIfNeededForRotation:", v23);
  *(_QWORD *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.size.width + 3) = v19;
  *(_QWORD *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.size.height + 3) = v20;
  *(_QWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.origin.x + 3) = v21;
  *(_QWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.origin.y + 3) = v22;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char isKindOfClass;
  void *v54;
  void *v55;
  CRLEditableBezierPathSource *v56;
  void *v57;
  void *v58;
  void *v59;
  CRLPathSource *v60;
  void *v61;
  void *v62;
  CRLBezierPath *v63;
  void *v64;
  void *v65;
  CRLPathSource *v66;
  void *v67;
  CRLPKStrokePathCompactData *v68;
  void *v69;
  void *v70;
  unsigned __int8 v71;
  void *v72;
  CRLPathSource *v73;
  void *v74;
  void *v75;
  CRLBezierPath *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  CRLCanvasInfoGeometry *v81;
  void *v82;
  objc_super v83[3];
  objc_super v84;

  v84.receiver = self;
  v84.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout beginDynamicOperationWithRealTimeCommands:](&v84, "beginDynamicOperationWithRealTimeCommands:", a3);
  if (*(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012587B8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      sub_100E2C5F0();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012587D8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 913, 0, "expected nil value for '%{public}s'", "mInitialPathSource");

  }
  if (*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012587F8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      sub_100E2C564();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258818);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 914, 0, "expected nil value for '%{public}s'", "mDynamicPathSource");

  }
  if (*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258838);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      sub_100E2C4D8();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258858);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 916, 0, "expected nil value for '%{public}s'", "mInitialInfoGeometry");

  }
  if (*(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258878);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      sub_100E2C44C();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258898);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 917, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012588B8);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      sub_100E2C3C0();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012588D8);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 919, 0, "expected nil value for '%{public}s'", "mInitialStroke");

  }
  if (*(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012588F8);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      sub_100E2C334();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258918);
    v25 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 920, 0, "expected nil value for '%{public}s'", "mDynamicStroke");

  }
  if (*(CRLPathSource **)((char *)&self->mInitialPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258938);
    v28 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      sub_100E2C2A8();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258958);
    v29 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 922, 0, "expected nil value for '%{public}s'", "mInitialMaskPath");

  }
  if (*(CRLPathSource **)((char *)&self->mDynamicPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258978);
    v32 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      sub_100E2C21C();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258998);
    v33 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 923, 0, "expected nil value for '%{public}s'", "mDynamicMaskPath");

  }
  if (*(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012589B8);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
      sub_100E2C190();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012589D8);
    v37 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 925, 0, "expected nil value for '%{public}s'", "mDynamicStrokeOffsetArray");

  }
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012589F8);
    v40 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
      sub_100E2C104();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258A18);
    v41 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 927, 0, "expected nil value for '%{public}s'", "mInitialPencilKitStrokePathCompactData");

  }
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258A38);
    v44 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      sub_100E2C078();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258A58);
    v45 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 928, 0, "expected nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "pathSource"));
  objc_opt_class(CRLEditableBezierPathSource, v51);
  isKindOfClass = objc_opt_isKindOfClass(v50, v52);

  if ((isKindOfClass & 1) != 0)
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout editablePathSource](self, "editablePathSource"));
  else
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v55 = v54;
  v56 = (CRLEditableBezierPathSource *)objc_msgSend(v54, "copy");
  v57 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3) = v56;

  v58 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  objc_msgSend(v49, "size");
  objc_msgSend(v58, "scaleToNaturalSize:");
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout maskPath](self, "maskPath"));
  v60 = (CRLPathSource *)objc_msgSend(v59, "copy");
  v61 = *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3);
  *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3) = v60;

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v63 = (CRLBezierPath *)objc_msgSend(v62, "copy");
  v64 = *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3) = v63;

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout maskPath](self, "maskPath"));
  v66 = (CRLPathSource *)objc_msgSend(v65, "copy");
  v67 = *(CRLPathSource **)((char *)&self->mInitialPathSource + 3);
  *(CRLPathSource **)((char *)&self->mInitialPathSource + 3) = v66;

  if (-[CRLCanvasLayout isInTopLevelContainerForEditing](self, "isInTopLevelContainerForEditing"))
    goto LABEL_115;
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "geometry"));
  if ((objc_msgSend(v69, "widthValid") & 1) == 0)
  {

LABEL_120:
    if (v48)
      objc_msgSend(v48, "computeFullTransform");
    else
      memset(v83, 0, sizeof(v83));
    v68 = (CRLPKStrokePathCompactData *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", v83));
    goto LABEL_124;
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "geometry"));
  v71 = objc_msgSend(v70, "heightValid");

  if ((v71 & 1) == 0)
    goto LABEL_120;
LABEL_115:
  v68 = (CRLPKStrokePathCompactData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "geometry"));
LABEL_124:
  v72 = *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) = v68;

  v73 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout captureDynamicInfoGeometryToBeginDynamicOperation](self, "captureDynamicInfoGeometryToBeginDynamicOperation"));
  v74 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v73;

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
  v76 = (CRLBezierPath *)objc_msgSend(v75, "copy");
  v77 = *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3) = v76;

  objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v78);
  if ((objc_opt_isKindOfClass(v48, v79) & 1) != 0)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pencilKitStrokePathCompactData](self, "pencilKitStrokePathCompactData"));
    v81 = (CRLCanvasInfoGeometry *)objc_msgSend(v80, "copy");
    v82 = *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3);
    *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3) = v81;

  }
}

- (id)captureDynamicInfoGeometryToBeginDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasInfoGeometry *v7;
  CRLCanvasInfoGeometry *v8;
  _OWORD v10[3];

  if (!*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258A78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2C67C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258A98);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout captureDynamicInfoGeometryToBeginDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 962, 0, "invalid nil value for '%{public}s'", "mInitialInfoGeometry");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v7 = [CRLCanvasInfoGeometry alloc];
  if (v6)
    objc_msgSend(v6, "fullTransform");
  else
    memset(v10, 0, sizeof(v10));
  v8 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v7, "initWithFullTransform:widthValid:heightValid:", v10, objc_msgSend(*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), "widthValid"), objc_msgSend(*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), "heightValid"));

  return v8;
}

- (void)endDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  if (!*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258AB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2C8AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258AD8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 968, 0, "invalid nil value for '%{public}s'", "mDynamicPathSource");

  }
  if (!*(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258AF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2C820();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258B18);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 969, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

  }
  if (!*(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258B38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2C794();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258B58);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 970, 0, "invalid nil value for '%{public}s'", "mInitialPathSource");

  }
  if (!*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258B78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2C708();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258B98);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 971, 0, "invalid nil value for '%{public}s'", "mInitialInfoGeometry");

  }
  v24.receiver = self;
  v24.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout endDynamicOperation](&v24, "endDynamicOperation");
  v15 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3) = 0;

  v16 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = 0;

  v17 = *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3);
  *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3) = 0;

  v18 = *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3) = 0;

  v19 = *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) = 0;

  v20 = *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3) = 0;

  v21 = *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3);
  *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3) = 0;

  v22 = *(CRLPathSource **)((char *)&self->mInitialPathSource + 3);
  *(CRLPathSource **)((char *)&self->mInitialPathSource + 3) = 0;

  v23 = *(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3);
  *(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3) = 0;

  BYTE3(self->mDynamicFill) = 0;
}

- (CGSize)minimumSize
{
  void *v3;
  void *v4;
  unsigned int v5;
  double width;
  double height;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containingGroup"));
  v5 = objc_msgSend(v4, "isFreehandDrawing");

  if (v5)
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bezierPath"));
    v11 = objc_msgSend(v10, "isLineSegment");

    width = 0.001;
    height = 0.0;
    if (!v11)
      height = 0.001;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)p_canResizeViaTransform
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));
  objc_opt_class(CRLBezierPathSource, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathSource"));
    objc_opt_class(CRLEditableBezierPathSource, v10);
    isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12, "geometry"));

  LOBYTE(v12) = objc_msgSend(v13, "widthValid");
  LOBYTE(v12) = isKindOfClass & objc_msgSend(v13, "heightValid") & v12;

  return v12;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout takeSizeFromTracker:](&v22, "takeSizeFromTracker:", v4);
  if (-[CRLCanvasLayout isInTopLevelContainerForEditing](self, "isInTopLevelContainerForEditing"))
  {
    if (v4)
    {
      objc_msgSend(v4, "flippedIfNecessaryTransformForLayout:", self);
      goto LABEL_7;
    }
  }
  else if (v4)
  {
    objc_msgSend(v4, "transformForLayout:", self);
    goto LABEL_7;
  }
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
LABEL_7:
  v19 = v16;
  v20 = v17;
  v21 = v18;
  if (v4)
  {
    objc_msgSend(v4, "resizeTransform");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v5 = objc_msgSend(v4, "currentlyPreservingAspectRatio", v13, v14, v15);
  objc_msgSend(v4, "currentSizeForLayout:", self);
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self));
  v11 = objc_msgSend(v4, "hasHorizontalFlip");
  v12 = objc_msgSend(v4, "hasVerticalFlip");
  v16 = v19;
  v17 = v20;
  v18 = v21;
  -[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:](self, "p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:", &v13, &v16, v5, v10, v11, v12, v7, v9);

}

- (void)p_applyResizeTransform:(CGAffineTransform *)a3 transformInParentSpace:(CGAffineTransform *)a4 preservingAspectRatio:(BOOL)a5 layoutSize:(CGSize)a6 geometryForLayout:(id)a7 hasHorizontalFlip:(BOOL)a8 hasVerticalFlip:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  double width;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  double v28;
  CGFloat v29;
  unsigned int v30;
  id v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  char isKindOfClass;
  uint64_t v50;
  id v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  Class v71;
  NSString *v72;
  void *v73;
  CRLCanvasInfoGeometry *v74;
  void *v75;
  void *v76;
  CRLCanvasInfoGeometry *v77;
  CRLBezierPath *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id *v85;
  __int128 v86;
  double v87;
  double v88;
  double v89;
  float v90;
  float v91;
  float v92;
  BOOL v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  float v98;
  double v99;
  float v100;
  float v101;
  double v102;
  float v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  unsigned __int8 v111;
  __int128 v112;
  CRLShapeLayout *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  uint64_t v122;
  void *v123;
  __int128 v124;
  double v125;
  double v126;
  double v127;
  double v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __int128 v140;
  char *v141;
  _BOOL4 v143;
  CRLShapeLayout *v144;
  id v145;
  CGAffineTransform v146;
  CGAffineTransform v147;
  CGAffineTransform v148;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v151;
  _OWORD v152[3];
  CGAffineTransform v153;
  CGAffineTransform v154;
  CGAffineTransform v155;
  _OWORD v156[3];
  CGAffineTransform v157;
  CGRect v158;
  CGRect v159;

  v9 = a9;
  v10 = a8;
  height = a6.height;
  width = a6.width;
  v143 = a5;
  v145 = a7;
  if (-[CRLCanvasLayout layoutState](self, "layoutState") == 1 || !-[CRLCanvasLayout layoutState](self, "layoutState"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258BB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CB3C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258BD8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1035, 0, "A shape taking a size should not be in a generic dynamic state, or static state");

  }
  v18 = (id *)((char *)&self->mDynamicMaskPath + 3);
  if (!*(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258BF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CAB0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258C18);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1046, 0, "invalid nil value for '%{public}s'", "mInitialPathSource");

  }
  if (!*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258C38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CA24();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258C58);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 1047, 0, "invalid nil value for '%{public}s'", "mInitialInfoGeometry");

  }
  memset(&v157, 0, sizeof(v157));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
  v26 = v25;
  if (v25)
    objc_msgSend(v25, "transform");
  else
    memset(v156, 0, sizeof(v156));
  v27 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v155.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v155.c = v27;
  *(_OWORD *)&v155.tx = *(_OWORD *)&a4->tx;
  sub_100079650(&v155, v156, &v157);

  v155 = v157;
  v28 = sub_100079240(&v155.a);
  memset(&v155, 0, sizeof(v155));
  CGAffineTransformMakeScale(&v155, v28, v29);
  v30 = -[CRLShapeLayout p_canResizeViaTransform](self, "p_canResizeViaTransform");
  v31 = *v18;
  if (v30 && !v143)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bezierPath"));
    v33 = objc_msgSend(v32, "copy");

    v154 = v157;
    objc_msgSend(v33, "transformUsingAffineTransform:", &v154);
    objc_msgSend(v33, "bounds");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    objc_msgSend(v33, "bounds");
    v43 = v42;
    v45 = v44;
    if (!sub_10005FDF0(v42, v44, CGPointZero.x, CGPointZero.y))
    {
      CGAffineTransformMakeTranslation(&v153, -v43, -v45);
      objc_msgSend(v33, "transformUsingAffineTransform:", &v153);
    }
    v47 = *v18;
    objc_opt_class(CRLBezierPathSource, v46);
    isKindOfClass = objc_opt_isKindOfClass(v47, v48);
    v51 = *v18;
    if ((isKindOfClass & 1) != 0)
    {
      *(_QWORD *)&v52 = objc_opt_class(*v18, v50).n128_u64[0];
      v54 = v53;
      v55 = objc_msgSend(v33, "copy", v52);
      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "pathSourceWithBezierPath:", v55));
    }
    else
    {
      objc_opt_class(CRLEditableBezierPathSource, v50);
      if ((objc_opt_isKindOfClass(v51, v61) & 1) == 0)
      {
        v66 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101258C78);
        v67 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E2C938((uint64_t)&self->mDynamicMaskPath + 3, v67, v66);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101258C98);
        v68 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v68);
        v55 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
        objc_opt_class(*v18, v70);
        v72 = NSStringFromClass(v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v69, 1073, 0, "Unexpected path source class! (%{public}@) We don't know how to build a path source for it.", v73);

        v57 = 0;
        goto LABEL_55;
      }
      *(_QWORD *)&v63 = objc_opt_class(*v18, v62).n128_u64[0];
      v65 = v64;
      v55 = objc_msgSend(v33, "copy", v63);
      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "editableBezierPathSourceWithBezierPath:", v55));
    }
    v57 = (id)v56;
LABEL_55:

    v74 = [CRLCanvasInfoGeometry alloc];
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
    v76 = v75;
    if (v75)
      objc_msgSend(v75, "fullTransform");
    else
      memset(v152, 0, sizeof(v152));
    v77 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v74, "initWithFullTransform:widthValid:heightValid:", v152, objc_msgSend(*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), "widthValid"), objc_msgSend(*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), "heightValid"));

    v58 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry geometryWithNewBounds:](v77, "geometryWithNewBounds:", v35, v37, v39, v41));
    goto LABEL_59;
  }
  v57 = objc_msgSend(v31, "copy");
  objc_msgSend(v57, "scaleToNaturalSize:", width, height);
  v58 = objc_msgSend(v145, "copy");
  if (-[CRLCanvasLayout isInTopLevelContainerForEditing](self, "isInTopLevelContainerForEditing"))
  {
    v59 = objc_msgSend(*v18, "hasHorizontalFlip");
    v60 = objc_msgSend(*v18, "hasVerticalFlip");
    objc_msgSend(v57, "setHasHorizontalFlip:", v59 ^ v10);
    objc_msgSend(v57, "setHasVerticalFlip:", v60 ^ v9);
  }
LABEL_59:
  if (*(CRLPathSource **)((char *)&self->mInitialPathSource + 3))
  {
    if (-[CRLShapeLayout i_isInsideResizingFreehandDrawing](self, "i_isInsideResizingFreehandDrawing"))
    {
      v78 = (CRLBezierPath *)objc_msgSend(*(id *)((char *)&self->mInitialPathSource + 3), "copy");
      objc_msgSend(*v18, "naturalSize");
      v80 = v79;
      v82 = v81;
      objc_msgSend(v57, "naturalSize");
      CGAffineTransformMakeScale(&v151, v83 / v80, v84 / v82);
      -[CRLBezierPath transformUsingAffineTransform:](v78, "transformUsingAffineTransform:", &v151);
    }
    else
    {
      v78 = objc_alloc_init(CRLBezierPath);
    }
  }
  else
  {
    v78 = 0;
  }
  v85 = (id *)((char *)&self->mCachedEditableBezierPathSource + 3);
  objc_storeStrong((id *)((char *)&self->mCachedEditableBezierPathSource + 3), v57);
  objc_storeStrong((id *)((char *)&self->mCachedPathSource + 3), v58);
  objc_storeStrong((id *)((char *)&self->mDynamicPathSource + 3), v78);
  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3)
    && -[CRLShapeLayout i_isInsideResizingFreehandDrawing](self, "i_isInsideResizingFreehandDrawing"))
  {
    v86 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v154.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v154.c = v86;
    *(_OWORD *)&v154.tx = *(_OWORD *)&a3->tx;
    v87 = sub_100079240(&v154.a);
    v89 = v88;
    v90 = v87;
    v91 = v88;
    v92 = fminf(v90, v91);
    v93 = vabdd_f64(0.0, v92) < 0.00999999978 || v92 == 0.0;
    v94 = fmaxf(v90, v91);
    v95 = v93 ? v94 : v92;
    objc_msgSend(*(id *)((char *)&self->mInitialMaskPath + 3), "width");
    -[CRLShapeLayout dynamicStrokeWidthUpdateToValue:](self, "dynamicStrokeWidthUpdateToValue:", v96 * v95);
    v97 = *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3);
    if (v97)
    {
      objc_msgSend(v97, "renderScaleX");
      v99 = v87 * v98;
      if (v99 == 0.0 || vabdd_f64(0.0, v99) < 0.00999999978)
      {
        objc_msgSend(*(id *)((char *)&self->mDynamicInfoGeometry + 3), "renderScaleX");
        v99 = v100;
      }
      objc_msgSend(*(id *)((char *)&self->mInitialInfoGeometry + 3), "renderScaleY");
      v102 = v89 * v101;
      if (v102 == 0.0 || vabdd_f64(0.0, v102) < 0.00999999978)
      {
        objc_msgSend(*(id *)((char *)&self->mDynamicInfoGeometry + 3), "renderScaleY");
        v102 = v103;
      }
      -[CRLShapeLayout dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:y:](self, "dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:y:", v99, v102);
    }
  }
  v104 = BYTE3(self->super.mDynamicOpacity);
  -[CRLShapeLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
  BYTE3(self->super.mDynamicOpacity) = BYTE3(self->super.mDynamicOpacity) & 0xF1 | v104 & 0xE;
  if (-[CRLShapeLayout i_shouldTryToScaleCachedRectsDuringResize](self, "i_shouldTryToScaleCachedRectsDuringResize"))
  {
    if (-[CRLShapeLayout p_canResizeViaTransform](self, "p_canResizeViaTransform"))
    {
      objc_msgSend(*v85, "naturalSize");
      *(double *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.height + 3) = sub_10005FDDC();
      *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.isValid + 3) = v105;
      *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.x + 3) = v106;
      *(_QWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.y + 3) = v107;
      *(_DWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.width + 3) = 1;
    }
    if (-[CRLShapeLayout p_dynamicallyUpdatingStrokedFramesDuringResize](self, "p_dynamicallyUpdatingStrokedFramesDuringResize")&& v143)
    {
      v108 = objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
      if (v108
        && (v109 = (void *)v108,
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke")),
            v111 = objc_msgSend(v110, "shouldRender"),
            v110,
            v109,
            (v111 & 1) != 0))
      {
        v112 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&v154.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&v154.c = v112;
        *(_OWORD *)&v154.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
        v113 = self;
        v144 = v113;
        do
        {
          if (!-[CRLShapeLayout isBeingManipulated](v113, "isBeingManipulated"))
            break;
          v114 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](v113, "originalPureGeometry"));
          v115 = v114;
          if (v114)
            objc_msgSend(v114, "transform");
          else
            memset(&t2, 0, sizeof(t2));
          t1 = v154;
          CGAffineTransformConcat(&v154, &t1, &t2);

          *(_QWORD *)&v117 = objc_opt_class(CRLCanvasLayout, v116).n128_u64[0];
          v119 = v118;
          v120 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](v113, "parent", v117));
          v121 = sub_100221D0C(v119, v120);
          v122 = objc_claimAutoreleasedReturnValue(v121);

          v113 = (CRLShapeLayout *)v122;
        }
        while (v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", *(double *)((char *)&v144->mCachedPathBoundsStruct.cachedRect.size.width + 3), *(double *)((char *)&v144->mCachedPathBoundsStruct.cachedRect.size.height + 3), *(double *)((char *)&v144->mCachedPathBoundsStruct.originalCachedRect.origin.x + 3), *(double *)((char *)&v144->mCachedPathBoundsStruct.originalCachedRect.origin.y + 3)));
        v124 = *(_OWORD *)&a3->c;
        *(_OWORD *)&v148.a = *(_OWORD *)&a3->a;
        *(_OWORD *)&v148.c = v124;
        *(_OWORD *)&v148.tx = *(_OWORD *)&a3->tx;
        memset(&t1, 0, sizeof(t1));
        v147 = v154;
        sub_100079650(&v148, &v147, &t1);
        v148 = t1;
        objc_msgSend(v123, "transformUsingAffineTransform:", &v148);
        objc_msgSend(v123, "bounds");
        v126 = v125;
        v128 = v127;
        v130 = v129;
        v132 = v131;
        v133 = *(_OWORD *)&a3->c;
        *(_OWORD *)&v148.a = *(_OWORD *)&a3->a;
        *(_OWORD *)&v148.c = v133;
        *(_OWORD *)&v148.tx = *(_OWORD *)&a3->tx;
        v147 = v154;
        sub_100079650(&v148, &v147, &v146);
        v134 = sub_1000603B8(v126, v128, vaddq_f64(*(float64x2_t *)&v146.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v146.c, CGPointZero.y), *(float64x2_t *)&v146.a, CGPointZero.x)).f64[0]);
        v136 = v135;

      }
      else
      {
        objc_msgSend(*v85, "naturalSize");
        v134 = sub_10005FDDC();
        v136 = v137;
        v130 = v138;
        v132 = v139;
      }
      *(double *)((char *)&self->mCachedPath + 3) = v134;
      *(_QWORD *)(&self->mCachedPathHasAtLeastTwoVisuallyDistinctSubregions + 1) = v136;
      *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.x + 3) = v130;
      *(_QWORD *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.y + 3) = v132;
      *(_DWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.width + 3) = 1;
      v158 = *(CGRect *)((char *)&self->mCachedAlignmentFrame.cachedRect.size.width + 3);
      v140 = *(_OWORD *)&a4->c;
      *(_OWORD *)&v154.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&v154.c = v140;
      *(_OWORD *)&v154.tx = *(_OWORD *)&a4->tx;
      *(CGRect *)((char *)&self->mClippedPathRotatedTransform.tx + 3) = CGRectApplyAffineTransform(v158, &v154);
      *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 1;
      v141 = (char *)&self->mCachedPathBoundsWithoutStrokeStruct.isValid + 3;
      v159 = *(CGRect *)(v141 + 1);
      v154 = v155;
      *(CGRect *)v141 = CGRectApplyAffineTransform(v159, &v154);
      *((_DWORD *)v141 + 16) = 1;
    }
  }

}

- (void)endResize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout endResize](&v3, "endResize");
  -[CRLShapeLayout p_endResizeOrFreeTransform](self, "p_endResizeOrFreeTransform");
}

- (void)endFreeTransform
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout endFreeTransform](&v3, "endFreeTransform");
  -[CRLShapeLayout p_endResizeOrFreeTransform](self, "p_endResizeOrFreeTransform");
}

- (void)p_endResizeOrFreeTransform
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
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
  id v25;

  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3))
  {
    if (-[CRLShapeLayout i_isInsideResizingFreehandDrawing](self, "i_isInsideResizingFreehandDrawing"))
    {
      -[CRLShapeLayout dynamicStrokeWidthChangeDidEnd](self, "dynamicStrokeWidthChangeDidEnd");
      if (*(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3))
        -[CRLShapeLayout dynamicPencilKitStrokePathCompactDataRenderScaleDidEnd](self, "dynamicPencilKitStrokePathCompactDataRenderScaleDidEnd");
    }
  }
  objc_opt_class(CRLScalarPathSource, a2);
  v4 = sub_100221D0C(v3, *(void **)((char *)&self->mCachedEditableBezierPathSource + 3));
  v25 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (v25)
  {
    objc_msgSend(v25, "scalar");
    v7 = v6;
    objc_msgSend(v25, "maxScalar");
    objc_msgSend(v25, "setScalar:", sub_1003C65EC(v7, 0.0, v8));
  }
  objc_opt_class(CRLPointPathSource, v5);
  v10 = sub_100221D0C(v9, *(void **)((char *)&self->mCachedEditableBezierPathSource + 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "minPointValue");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "maxPointValue");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "point");
    v22 = v21;
    v24 = sub_1003C65EC(v23, v14, v18);
    objc_msgSend(v12, "setPoint:", v24, sub_1003C65EC(v22, v16, v20));
  }
  -[CRLShapeLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");

}

- (id)finalInfoGeometryForResize
{
  return *(id *)((char *)&self->mCachedPathSource + 3);
}

- (void)dynamicallyMovingLineSegmentWithTracker:(id)a3
{
  void *v4;
  CRLPathSource *v5;
  void *v6;
  CRLPathSource *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentGeometry"));
  v5 = (CRLPathSource *)objc_msgSend(v4, "copy");

  v6 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v5;
  v7 = v5;

  objc_msgSend(*(id *)((char *)&self->mCachedPathSource + 3), "size");
  objc_msgSend(*(id *)((char *)&self->mCachedEditableBezierPathSource + 3), "setNaturalSize:");

  -[CRLShapeLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[7];

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));
  if (!objc_msgSend(v7, "isCanvasInteractive"))
  {

LABEL_6:
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003BE190;
    v17[3] = &unk_10122EDB8;
    *(CGFloat *)&v17[5] = x;
    *(CGFloat *)&v17[6] = y;
    v17[4] = self;
    -[CRLShapeLayout p_performBlockOkayToSetGeometry:](self, "p_performBlockOkayToSetGeometry:", v17);
    return;
  }
  v8 = -[CRLShapeLayout isBeingManipulated](self, "isBeingManipulated");

  if (!v8)
    goto LABEL_6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasController"));

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tmCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12, "controllingTM"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tracker"));

  objc_opt_class(CRLShapeLineSegmentKnobTracker, v15);
  LOBYTE(v12) = objc_opt_isKindOfClass(v14, v16);

  if ((v12 & 1) == 0)
    goto LABEL_6;
}

- (void)setDynamicGeometry:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CRLShapeLayout *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003BE244;
  v5[3] = &unk_10122D3D8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[CRLShapeLayout p_performBlockOkayToSetGeometry:](self, "p_performBlockOkayToSetGeometry:", v5);

}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  id v8;
  void *v9;
  id v10;
  double v11;

  y = a3.y;
  x = a3.x;
  v8 = *(id *)((char *)&self->mCachedEditableBezierPathSource + 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "knob"));
  v10 = objc_msgSend(v9, "tag");
  -[CRLShapeLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  objc_msgSend(v8, "setControlKnobPosition:toPoint:", v10, sub_1000603B8(x, y, v11));

  -[CRLShapeLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
}

- (void)dynamicMovePathKnobDidBegin
{
  void *v3;
  double v4;
  uint64_t v5;
  CRLEditableBezierPathSource *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLPathSource *v10;
  void *v11;
  _OWORD v12[3];

  v3 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  *(_QWORD *)&v4 = objc_opt_class(CRLEditableBezierPathSource, a2).n128_u64[0];
  if ((objc_msgSend(v3, "isMemberOfClass:", v5, v4) & 1) == 0)
  {
    v6 = (CRLEditableBezierPathSource *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout editablePathSource](self, "editablePathSource"));
    v7 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
    *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3) = v6;

  }
  objc_msgSend(*(id *)((char *)&self->mCachedEditableBezierPathSource + 3), "setLockedFlipTransform:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "fullTransform");
  else
    memset(v12, 0, sizeof(v12));
  v10 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", v12));
  v11 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v10;

}

- (void)dynamicallyMovedPathKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  -[CRLShapeLayout p_updateResizeInfoGeometryFromDynamicPathSource](self, "p_updateResizeInfoGeometryFromDynamicPathSource", a4, a3.x, a3.y);
  -[CRLShapeLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
}

- (void)dynamicMovePathKnobDidEnd
{
  -[CRLShapeLayout p_updateResizeInfoGeometryFromDynamicPathSource](self, "p_updateResizeInfoGeometryFromDynamicPathSource");
  objc_msgSend(*(id *)((char *)&self->mCachedEditableBezierPathSource + 3), "setLockedFlipTransform:", 0);
  objc_msgSend(*(id *)((char *)&self->mCachedEditableBezierPathSource + 3), "alignToOrigin");
}

- (void)dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasInfoGeometry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258CB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CC48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258CD8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1393, 0, "expected nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pencilKitStrokePathCompactData](self, "pencilKitStrokePathCompactData"));
  v7 = (CRLCanvasInfoGeometry *)objc_msgSend(v6, "copy");
  v8 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = v7;

  if (!*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258CF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CBBC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258D18);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1398, 0, "invalid nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");

  }
}

- (void)dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:(double)a3 y:(double)a4
{
  double v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v5 = a3;
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258D38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CCD4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258D58);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:y:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1402, 0, "invalid nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");

    v7 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  }
  *(float *)&a3 = v5;
  objc_msgSend(v7, "setRenderScaleX:", a3);
  *(float *)&v11 = a4;
  objc_msgSend(*(id *)((char *)&self->mDynamicInfoGeometry + 3), "setRenderScaleY:", v11);
}

- (void)dynamicPencilKitStrokePathCompactDataRenderScaleDidEnd
{
  void *v2;

  v2 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = 0;

}

- (BOOL)supportsRotation
{
  return 1;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLPathSource *v7;
  void *v8;
  _OWORD v9[3];
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout takeRotationFromTracker:](&v14, "takeRotationFromTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));

  if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
  {
    v7 = (CRLPathSource *)objc_msgSend(v6, "copy");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    if (v4)
      objc_msgSend(v4, "rotateTransform");
    else
      memset(v10, 0, sizeof(v10));
    -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v10);
    v9[0] = v11;
    v9[1] = v12;
    v9[2] = v13;
    v7 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByAppendingTransform:", v9));
  }
  v8 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v7;

  -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  CRLPathSource *v11;
  void *v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout takeFreeTransformFromTracker:](&v21, "takeFreeTransformFromTracker:", v4);
  if ((objc_msgSend(v4, "hasEverResized") & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    if (v4)
      objc_msgSend(v4, "resizeTransformForLayout:", self);
    objc_msgSend(v4, "currentSizeForLayout:", self);
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self));
    v14 = v18;
    v15 = v19;
    v16 = v20;
    v13[0] = v18;
    v13[1] = v19;
    v13[2] = v20;
    -[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:](self, "p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:", &v14, v13, 1, v9, 0, 0, v6, v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometry"));

    if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
    {
      v11 = (CRLPathSource *)objc_msgSend(v9, "copy");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      if (v4)
        objc_msgSend(v4, "freeTransformForLayout:", self);
      else
        memset(v17, 0, sizeof(v17));
      -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v17);
      v14 = v18;
      v15 = v19;
      v16 = v20;
      v11 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometryByAppendingTransform:", &v14));
    }
    v12 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
    *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v11;

    -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
  }

}

- (id)finalInfoGeometryForFreeTransform
{
  return *(id *)((char *)&self->mCachedPathSource + 3);
}

- (BOOL)isBeingManipulated
{
  objc_super v4;

  if (-[CRLShapeLayout isStrokeBeingManipulated](self, "isStrokeBeingManipulated"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLayout;
  return -[CRLCanvasLayout isBeingManipulated](&v4, "isBeingManipulated");
}

- (CRLLineEnd)strokeHeadLineEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headLineEnd"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headLineEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "strokeLineEnd:", v7));

  }
  else
  {
    v8 = 0;
  }

  return (CRLLineEnd *)v8;
}

- (CRLLineEnd)strokeTailLineEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tailLineEnd"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tailLineEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "strokeLineEnd:", v7));

  }
  else
  {
    v8 = 0;
  }

  return (CRLLineEnd *)v8;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
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
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  objc_opt_class(CRLPathSource, v8);
  v15 = sub_10022209C(v7, v9, 1, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);

  objc_msgSend(v16, "setControlKnobPosition:toPoint:", a3, x, y);
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  objc_opt_class(CRLPathSource, v5);
  v12 = sub_10022209C(v4, v6, 1, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "getControlKnobPosition:", a3);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (*(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258D78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CD60();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258D98);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicallySetBezierPathSource:atUnscaledOrigin:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1501, 0, "expected nil value for '%{public}s'", "mDynamicStrokeOffsetArray");

  }
  -[CRLShapeLayout dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:](self, "dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:", v7, 0, x, y);

}

- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4 withPatternOffsetsBySubpath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  Swift::String v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CRLCanvasInfoGeometry *v24;
  CRLCanvasInfoGeometry *v25;
  void *v26;
  void *v27;
  CRLCanvasInfoGeometry *v28;
  void *v29;
  void *v30;
  void *v31;

  v8 = a3;
  v9 = a5;
  if (!*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258DB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CDEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258DD8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1508, 0, "invalid nil value for '%{public}s'", "mDynamicPathSource");

  }
  objc_storeStrong((id *)((char *)&self->mCachedEditableBezierPathSource + 3), a3);
  objc_storeStrong((id *)((char *)&self->mLastParentLimitedSize.height + 3), a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->mCachedEditableBezierPathSource + 3), "bezierPath"));
  v14 = objc_msgSend(v13, "bounds");
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v17, v19, fmax(v21, 1.0), fmax(v23, 1.0));
  v25 = [CRLCanvasInfoGeometry alloc];
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "geometryInRoot"));
  v28 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v25, "initWithLayoutGeometry:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry geometryRelativeToGeometry:](v24, "geometryRelativeToGeometry:", v28));

  if (objc_msgSend(v29, "isEqual:", *(CRLPathSource **)((char *)&self->mCachedPathSource + 3)))
  {
    BYTE3(self->super.mDynamicOpacity) |= 1u;
    v30 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);
    *(_QWORD *)(&self->super._suppressesShadowsAndReflections + 3) = 0;

    BYTE3(self->super.mDynamicOpacity) |= 0x80u;
    v31 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);
    *(CGFloat *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3) = 0.0;

    *(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3) = 0;
    *(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3) = 0;
  }
  else
  {
    objc_storeStrong((id *)((char *)&self->mCachedPathSource + 3), v29);
    -[CRLShapeLayout invalidatePath](self, "invalidatePath");
    -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
  }

}

- (void)dynamicallyMakeShapeInvisible
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  BYTE3(self->mDynamicFill) = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));

  v4 = v6;
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", self));
    if (v5)
      objc_msgSend(v6, "invalidateContentLayersForRep:", v5);

    v4 = v6;
  }

}

- (void)invalidateExteriorWrap
{
  uint64_t v3;
  double v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout invalidateExteriorWrap](&v12, "invalidateExteriorWrap");
  *(_QWORD *)&v4 = objc_opt_class(CRLShapeRep, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvas"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForLayout:", self));
  v10 = sub_1002223BC(v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v11, "invalidateExteriorWrap");
}

- (id)computeWrapPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout fill](self, "fill"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isClear") ^ 1;
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout computeWrapPathClosed:](self, "computeWrapPathClosed:", v5));

  return v6;
}

- (id)computeWrapPathClosed:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  CGAffineTransform v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "shouldRender"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    v9 = objc_msgSend(v8, "copy");

    objc_msgSend(v9, "takeAttributesFromStroke:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "strokedCopy"));
    if (a3 || objc_msgSend(v9, "isEffectivelyClosed"))
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniteWithBezierPath:", v5));
    else
      v10 = v5;
    v11 = v10;

    if (-[CRLShapeLayout pathIsOpen](self, "pathIsOpen"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout p_unitePath:withLineEndForHead:stroke:](self, "p_unitePath:withLineEndForHead:stroke:", v11, 1, v7));

      v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout p_unitePath:withLineEndForHead:stroke:](self, "p_unitePath:withLineEndForHead:stroke:", v17, 0, v7));
    }
  }
  else
  {
    v11 = objc_msgSend(v5, "copy");
  }

  -[CRLShapeLayout pathBounds](self, "pathBounds");
  v13 = v12;
  v15 = v14;
  if (!sub_10005FDF0(CGPointZero.x, CGPointZero.y, v12, v14))
  {
    CGAffineTransformMakeTranslation(&v18, -v13, -v15);
    objc_msgSend(v11, "transformUsingAffineTransform:", &v18);
  }

  return v11;
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  _BOOL8 v5;
  __int128 v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeLayout;
  v7 = *(_OWORD *)&a4->c;
  v10 = *(_OWORD *)&a4->a;
  v11 = v7;
  v12 = *(_OWORD *)&a4->tx;
  v8 = a3;
  -[CRLCanvasLayout transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:](&v13, "transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:", v8, &v10, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource", v10, v11, v12, v13.receiver, v13.super_class));
  objc_msgSend(v8, "setPathSource:", v9);

}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  id v5;
  void *v6;
  _TtC8Freeform15CRLCommandGroup *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _TtC8Freeform23CRLCommandSetPathSource *v19;
  _TtC8Freeform15CRLCommandGroup *v20;
  _TtC8Freeform15CRLCommandGroup *v21;
  _OWORD v23[3];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CRLShapeLayout;
  v4 = *(_OWORD *)&a3->c;
  v23[0] = *(_OWORD *)&a3->a;
  v23[1] = v4;
  v23[2] = *(_OWORD *)&a3->tx;
  v5 = -[CRLCanvasLayout commandToClampModelToLayoutSizeWithAdditionalTransform:](&v24, "commandToClampModelToLayoutSizeWithAdditionalTransform:", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  -[CRLCommandGroup addCommandIfNotNil:](v7, "addCommandIfNotNil:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  objc_msgSend(v9, "naturalSize");
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathSource"));
  objc_msgSend(v14, "naturalSize");
  v16 = v15;
  v18 = v17;

  if (v11 != v16 || v13 != v18)
  {
    v19 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v8, v9);
    -[CRLCommandGroup addCommand:](v7, "addCommand:", v19);

  }
  if (-[CRLCommandGroup isEmpty](v7, "isEmpty"))
    v20 = 0;
  else
    v20 = v7;
  v21 = v20;

  return v21;
}

- (void)validate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003BFA98;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  -[CRLShapeLayout p_performBlockOkayToSetGeometry:](self, "p_performBlockOkayToSetGeometry:", v2);
}

- (id)p_cachedPath
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((BYTE3(self->super.mDynamicOpacity) & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bezierPath"));
    v5 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);
    *(_QWORD *)(&self->super._suppressesShadowsAndReflections + 3) = v4;

    BYTE3(self->super.mDynamicOpacity) &= ~1u;
  }
  return *(id *)(&self->super._suppressesShadowsAndReflections + 3);
}

- (CGRect)p_cachedPathBounds
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)&self->mCachedPath + 3);
  if (*(_DWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.width + 3))
  {
    v3 = *v2;
    v4 = *(double *)(&self->mCachedPathHasAtLeastTwoVisuallyDistinctSubregions + 1);
    v5 = *(double *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.x + 3);
    v6 = *(double *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.y + 3);
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->mDynamicStrokeOffsetArray + 3), "computePathBounds");
    *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_cachedClippedPathStroked
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  __int128 v9;
  _OWORD v10[3];
  CGRect result;

  v2 = (double *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.isValid + 3);
  if (*(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3))
  {
    v3 = *v2;
    v4 = *(double *)((char *)&self->mCachedClippedPath + 3);
    v5 = *(double *)((char *)&self->mCachedClippedPathStroked.cachedRect.origin.x + 3);
    v6 = *(double *)((char *)&self->mCachedClippedPathStroked.cachedRect.origin.y + 3);
  }
  else
  {
    if (objc_msgSend(*(id *)((char *)&self->mDynamicStrokeOffsetArray + 3), "shouldComputeSeparateClippedPathBounds"))
    {
      v8 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
      v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v10[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v10[1] = v9;
      v10[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      objc_msgSend(v8, "computeClippedPathBoundsWithTransform:", v10);
    }
    else
    {
      -[CRLShapeLayout p_cachedPathBounds](self, "p_cachedPathBounds");
    }
    *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_updatedCachedClipRectIfNeededForRotation:(CGAffineTransform *)a3
{
  __int128 v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  double *v9;
  _DWORD *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  CGRect result;

  v5 = *(_OWORD *)&a3->c;
  v29 = *(_OWORD *)&a3->a;
  v30 = v5;
  v6 = (char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.height + 3;
  v7 = *(_OWORD *)&a3->c;
  v25 = *(_OWORD *)&a3->a;
  v26 = v7;
  v27 = 0;
  v28 = 0;
  v8 = *(_OWORD *)((char *)&self->mClippedPathRotatedTransform.a + 3);
  v24[0] = *(_OWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.height + 3);
  v24[1] = v8;
  v24[2] = *(_OWORD *)((char *)&self->mClippedPathRotatedTransform.c + 3);
  if (sub_10005FEA0(&v25, v24))
  {
    v9 = (double *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.height + 3);
    v10 = (_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3);
    if (*(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3))
    {
      v11 = *v9;
      v12 = *(double *)((char *)&self->mCachedClippedPathStroked.isValid + 3);
      v13 = *(double *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.origin.x + 3);
      v14 = *(double *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.origin.y + 3);
      goto LABEL_11;
    }
    v15 = 1;
  }
  else
  {
    v15 = -[CRLCanvasLayout layoutState](self, "layoutState") != 4
       && -[CRLCanvasLayout layoutState](self, "layoutState") != 5;
    v9 = (double *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.height + 3);
    v10 = (_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3);
  }
  v16 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
  v25 = v29;
  v26 = v30;
  v27 = 0;
  v28 = 0;
  objc_msgSend(v16, "computeClippedPathBoundsWithTransform:", &v25);
  v13 = v17;
  v14 = v18;
  if (v15)
  {
    *v9 = v11;
    v9[1] = v12;
    v9[2] = v17;
    v9[3] = v18;
    v19 = v30;
    *(_OWORD *)v6 = v29;
    *((_OWORD *)v6 + 1) = v19;
    *((_QWORD *)v6 + 4) = 0;
    *((_QWORD *)v6 + 5) = 0;
    *v10 = 1;
  }
LABEL_11:
  v20 = sub_1000603D0(v11, v12, a3->tx);
  v22 = v13;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)p_cachedPathBoundsWithoutStroke
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (double *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.height + 3);
  if (*(_DWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.width + 3))
  {
    v3 = *v2;
    v4 = *(double *)((char *)&self->mCachedPathBoundsStruct.isValid + 3);
    v5 = *(double *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.x + 3);
    v6 = *(double *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.y + 3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    objc_msgSend(v7, "bounds");
    v3 = v8;
    v4 = v9;
    v5 = v10;
    v6 = v11;

    *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)p_cachedPathIsOpen
{
  void *v3;

  if ((BYTE3(self->super.mDynamicOpacity) & 2) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    *((_BYTE *)&self->mShapeInvalidFlags + 3) = objc_msgSend(v3, "isOpen");

    BYTE3(self->super.mDynamicOpacity) &= ~2u;
  }
  return *((_BYTE *)&self->mShapeInvalidFlags + 3);
}

- (BOOL)p_cachedPathIsLineSegment
{
  void *v3;

  if ((BYTE3(self->super.mDynamicOpacity) & 4) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    *((_BYTE *)&self->mShapeInvalidFlags + 4) = objc_msgSend(v3, "isLineSegment");

    BYTE3(self->super.mDynamicOpacity) &= ~4u;
  }
  return *((_BYTE *)&self->mShapeInvalidFlags + 4);
}

- (BOOL)p_cachedPathHasAtLeastTwoVisuallyDistinctSubregions
{
  void *v3;

  if ((BYTE3(self->super.mDynamicOpacity) & 8) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    *((_BYTE *)&self->mShapeInvalidFlags + 5) = objc_msgSend(v3, "hasAtLeastTwoVisuallyDistinctSubregions");

    BYTE3(self->super.mDynamicOpacity) &= ~8u;
  }
  return *((_BYTE *)&self->mShapeInvalidFlags + 5);
}

- (void)p_invalidateHead
{
  BYTE3(self->super.mDynamicOpacity) |= 0x30u;
  -[CRLShapeLayout p_invalidateClippedPath](self, "p_invalidateClippedPath");
}

- (void)p_invalidateTail
{
  BYTE3(self->super.mDynamicOpacity) |= 0x50u;
  -[CRLShapeLayout p_invalidateClippedPath](self, "p_invalidateClippedPath");
}

- (void)p_invalidateClippedPath
{
  void *v2;

  BYTE3(self->super.mDynamicOpacity) |= 0x80u;
  *(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3) = 0;
  v2 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);
  *(CGFloat *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3) = 0.0;

}

- (void)p_validateHeadAndTail
{
  id v3;

  if ((BYTE3(self->super.mDynamicOpacity) & 0x10) != 0)
  {
    BYTE3(self->super.mDynamicOpacity) &= ~0x10u;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    objc_msgSend(v3, "getStartPoint:andEndPoint:", (char *)&self->mHeadPoint.x + 3, (char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3);

  }
}

- (void)p_validateHeadLineEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];

  -[CRLShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  if ((BYTE3(self->super.mDynamicOpacity) & 0x20) != 0)
  {
    BYTE3(self->super.mDynamicOpacity) &= ~0x20u;
    memset(v9, 0, 24);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headLineEnd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tailLineEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
    +[CRLBezierPath lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:](CRLBezierPath, "lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:", v3, 1, v5, v7, v8, *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3), *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.ty + 3), *(double *)((char *)&self->mHeadPoint.x + 3), *(double *)((char *)&self->mHeadPoint.y + 3));

    *(CGFloat *)((char *)&self->mTailLineEndPoint.x + 3) = 0.0;
    *(CGPoint *)((char *)&self->mTailPoint + 3) = *(CGPoint *)((char *)v9 + 8);
    *(double *)((char *)&self->mHeadLineEndAngle + 3) = 0.0;
    *(int64_t *)((char *)&self->mHeadCutSegment + 3) = 0;
  }
}

- (void)p_validateTailLineEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];

  -[CRLShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  if ((BYTE3(self->super.mDynamicOpacity) & 0x40) != 0)
  {
    BYTE3(self->super.mDynamicOpacity) &= ~0x40u;
    memset(v9, 0, 24);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headLineEnd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tailLineEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
    +[CRLBezierPath lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:](CRLBezierPath, "lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:", v3, 0, v5, v7, v8, *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3), *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.ty + 3), *(double *)((char *)&self->mHeadPoint.x + 3), *(double *)((char *)&self->mHeadPoint.y + 3));

    *(CGFloat *)((char *)&self->mTailLineEndPoint.y + 3) = 0.0;
    *(CGPoint *)((char *)&self->mHeadLineEndPoint + 3) = *(CGPoint *)((char *)v9 + 8);
    *(double *)((char *)&self->mTailLineEndAngle + 3) = 0.0;
    *(int64_t *)((char *)&self->mTailCutSegment + 3) = 0;
  }
}

- (id)p_createClippedPath
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  if (!-[CRLShapeLayout pathIsOpen](self, "pathIsOpen"))
    return (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
  v4 = objc_msgSend(v3, "supportsWidth");

  if (!v4)
    return (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
  -[CRLShapeLayout p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  -[CRLShapeLayout p_validateTailLineEnd](self, "p_validateTailLineEnd");
  v5 = *(_QWORD *)((char *)&self->mTailLineEndPoint.x + 3);
  v6 = *(_QWORD *)((char *)&self->mHeadLineEndAngle + 3);
  v20 = *(__int128 *)((char *)&self->mTailPoint + 3);
  v7 = *(int64_t *)((char *)&self->mHeadCutSegment + 3);
  v16 = *(__int128 *)((char *)&self->mHeadLineEndPoint + 3);
  v8 = *(_QWORD *)((char *)&self->mTailLineEndPoint.y + 3);
  v9 = *(_QWORD *)((char *)&self->mTailLineEndAngle + 3);
  v10 = *(int64_t *)((char *)&self->mTailCutSegment + 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout stroke](self, "stroke"));
  v18 = v10;
  v19 = v5;
  v21 = v6;
  v22 = v7;
  v15 = v8;
  v17 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath createClippedPath:headPositioning:tailPositioning:stroke:](CRLBezierPath, "createClippedPath:headPositioning:tailPositioning:stroke:", v11, &v19, &v15, v12));

  if (!v13)
    return (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout path](self, "path"));
  return v13;
}

- (id)p_unitePath:(id)a3 withLineEndForHead:(BOOL)a4 stroke:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v8;
  if (v6)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout strokeHeadLineEnd](self, "strokeHeadLineEnd"));
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout strokeTailLineEnd](self, "strokeTailLineEnd"));
  v12 = v11;
  v13 = v10;
  if (v11)
  {
    v13 = v10;
    if ((objc_msgSend(v11, "isNone") & 1) == 0)
    {
      if (v6)
      {
        -[CRLShapeLayout headLineEndPoint](self, "headLineEndPoint");
        v15 = v14;
        v17 = v16;
        -[CRLShapeLayout headLineEndAngle](self, "headLineEndAngle");
      }
      else
      {
        -[CRLShapeLayout tailLineEndPoint](self, "tailLineEndPoint");
        v15 = v19;
        v17 = v20;
        -[CRLShapeLayout tailLineEndAngle](self, "tailLineEndAngle");
      }
      v21 = v18;
      -[CRLShapeLayout lineEndScale:](self, "lineEndScale:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForLineEnd:wrapPath:atPoint:atAngle:withScale:", v12, 1, v15, v17, v21, v22));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniteWithBezierPath:", v23));

    }
  }

  return v13;
}

- (void)p_updateResizeInfoGeometryFromDynamicPathSource
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CRLPathSource *v12;
  void *v13;
  id v14;

  v14 = *(id *)((char *)&self->mCachedEditableBezierPathSource + 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bezierPath"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->mCachedPathSource + 3), "geometryWithNewBounds:", v5, v7, v9, v11));
  v13 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v12;

  objc_msgSend(v14, "alignToOrigin");
}

- (id)commandForSettingCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCornerRadius:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCornerRadius:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingNumberOfSides:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingNumberOfSides:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingNumberOfSides:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingStarPoints:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingStarPoints:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingStarPoints:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingStarRadius:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingStarRadius:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingStarRadius:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingArrowHead:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingArrowHead:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingArrowHead:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingArrowIndent:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingArrowIndent:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingArrowIndent:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingCalloutCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutCornerRadius:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCalloutCornerRadius:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (id)commandForSettingCalloutTailSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutTailSize:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCalloutTailSize:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (double)adjustedCalloutTailPositionXWithValue:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
  v7 = objc_msgSend(v6, "isAnchoredAtRight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout inspectorGeometry](self, "inspectorGeometry"));
  +[CRLPathSourceCommandHelper adjustedCalloutTailPositionXWithValue:isAnchoredAtRight:layoutGeometry:](CRLPathSourceCommandHelper, "adjustedCalloutTailPositionXWithValue:isAnchoredAtRight:layoutGeometry:", v7, v8, a3);
  v10 = v9;

  return v10;
}

- (id)commandForSettingCalloutTailPositionX:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvas"));
  v9 = objc_msgSend(v8, "isAnchoredAtRight");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout inspectorGeometry](self, "inspectorGeometry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutTailPositionX:withPathSource:shapeItem:isAnchoredAtRight:layoutGeometry:](CRLPathSourceCommandHelper, "commandForSettingCalloutTailPositionX:withPathSource:shapeItem:isAnchoredAtRight:layoutGeometry:", v5, v6, v9, v10, a3));

  return v11;
}

- (id)commandForSettingCalloutTailPositionY:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout pathSource](self, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutTailPositionY:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCalloutTailPositionY:withPathSource:shapeItem:", v5, v6, a3));

  return v7;
}

- (CRLFill)dynamicFill
{
  return *(CRLFill **)((char *)&self->mInitialStroke + 3);
}

- (void)setDynamicFill:(id)a3
{
  objc_storeStrong((id *)((char *)&self->mInitialStroke + 3), a3);
}

- (NSArray)dynamicPatternOffsetsBySubpath
{
  return *(NSArray **)((char *)&self->mLastParentLimitedSize.height + 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->mLastParentLimitedSize.height + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicStrokeOffsetArray + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicStroke + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialStroke + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialPencilKitStrokePathCompactData + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialMaskPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialInfoGeometry + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicMaskPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicInfoGeometry + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedEditableBezierPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mOriginalShrunkenPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mShrunkenPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mTailCutT + 3), 0);
  objc_storeStrong((id *)((char *)&self->mHeadCutT + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3), 0);
  objc_storeStrong((id *)(&self->super._suppressesShadowsAndReflections + 3), 0);
}

@end
