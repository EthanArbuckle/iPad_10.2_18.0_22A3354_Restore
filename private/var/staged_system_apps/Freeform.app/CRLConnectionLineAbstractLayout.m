@implementation CRLConnectionLineAbstractLayout

- (CRLConnectionLineAbstractLayout)initWithInfo:(id)a3
{
  id v4;
  uint64_t v5;
  CRLConnectionLineAbstractLayout *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLConnectionLineAbstractLayout;
  v6 = -[CRLShapeLayout initWithInfo:](&v12, "initWithInfo:", v4);
  if (v6)
  {
    objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v5);
    v8 = sub_100221D0C(v7, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionLinePathSource"));
    BYTE6(v6->mDynamicOutsetType) = objc_msgSend(v10, "userDidSetControlPoint");

    HIBYTE(v6->mDynamicOutsetType) = 0;
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260618);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E381EC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260638);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout dealloc]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 123, 0, "expected nil value for '%{public}s'", "mConnectedFrom");

  }
  v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260658);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38158();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260678);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout dealloc]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 124, 0, "expected nil value for '%{public}s'", "mConnectedTo");

  }
  v11.receiver = self;
  v11.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout dealloc](&v11, "dealloc");
}

- (double)outsetFrom
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (BYTE3(self->mResizeControlPoints[2].x))
    return *(double *)((char *)&self->mResizeControlPoints[2].y + 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));

  objc_msgSend(v4, "outsetFrom");
  v6 = v5;

  return v6;
}

- (double)outsetTo
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (BYTE3(self->mResizeControlPoints[2].x))
    return *(double *)(&self->mUseDynamicOutsets + 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));

  objc_msgSend(v4, "outsetTo");
  v6 = v5;

  return v6;
}

- (void)setConnectedFrom:(id)a3
{
  CRLConnectionLineAbstractLayout *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (CRLConnectionLineAbstractLayout *)a3;
  if (v4 == self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260698);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38280();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012606B8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setConnectedFrom:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 144, 0, "trying to connect a c-line to itself");

  }
  objc_storeWeak((id *)((char *)&self->mConnectedPathSource + 3), v4);

}

- (void)setConnectedTo:(id)a3
{
  CRLConnectionLineAbstractLayout *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (CRLConnectionLineAbstractLayout *)a3;
  if (v4 == self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012606D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38300();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012606F8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setConnectedTo:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 149, 0, "trying to connect a c-line to itself");

  }
  objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), v4);

}

- (void)setTemporaryConnectedFromInfo:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mConnectedFromInfo + 3), a3);
  -[CRLConnectionLineAbstractLayout invalidateConnections](self, "invalidateConnections");
}

- (void)setTemporaryConnectedToInfo:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mConnectedToInfo + 3), a3);
  -[CRLConnectionLineAbstractLayout invalidateConnections](self, "invalidateConnections");
}

- (CGPoint)g_getNormalizedPosition:(CGPoint)a3 inLayout:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  double x;
  float64x2_t v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGPoint result;

  v15 = *(__int128 *)&a3.y;
  x = a3.x;
  v4 = a4;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "pureTransformInRoot", v15);
  else
    memset(&v18, 0, sizeof(v18));
  CGAffineTransformInvert(&v19, &v18);
  v17 = vaddq_f64(*(float64x2_t *)&v19.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v19.c, *(double *)&v15), *(float64x2_t *)&v19.a, x));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pureGeometry"));
  objc_msgSend(v6, "size");
  v7 = sub_10005FDDC();
  v10 = sub_1000626B8(v17.f64[0], v17.f64[1], v7, v8, v9);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)setHeadMagnetPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260718);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38380();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260738);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setHeadMagnetPosition:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 169, 0, "Must have connected-to when setting head magnet position");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
    -[CRLConnectionLineAbstractLayout g_getNormalizedPosition:inLayout:](self, "g_getNormalizedPosition:inLayout:", v11, x, y);
    *(unint64_t *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3) = v12;
    *(unint64_t *)((char *)&self->mTailNearestMagnetTypeForRouting + 3) = v13;

    *(double *)((char *)&self->mTailMagnetNormalizedPosition.x + 3) = x;
    *(double *)((char *)&self->mTailMagnetNormalizedPosition.y + 3) = y;
    BYTE4(self->mDynamicOutsetType) = 0;
  }
}

- (void)setTailMagnetPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260758);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38400();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260778);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setTailMagnetPosition:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 178, 0, "Must have connected-from when setting tail magnet position");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    -[CRLConnectionLineAbstractLayout g_getNormalizedPosition:inLayout:](self, "g_getNormalizedPosition:inLayout:", v11, x, y);
    *(_QWORD *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3) = v12;
    *(_QWORD *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3) = v13;

    *(double *)((char *)&self->mHeadMagnetCanvasPosition.x + 3) = x;
    *(double *)((char *)&self->mHeadMagnetCanvasPosition.y + 3) = y;
    BYTE5(self->mDynamicOutsetType) = 0;
  }
}

- (void)overrideHeadMagnetNormalizedPosition:(CGPoint)a3
{
  *(unint64_t *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3) = *(_QWORD *)&a3.x;
  *(unint64_t *)((char *)&self->mTailNearestMagnetTypeForRouting + 3) = *(_QWORD *)&a3.y;
  BYTE4(self->mDynamicOutsetType) = 1;
}

- (void)overrideTailMagnetNormalizedPosition:(CGPoint)a3
{
  *(CGFloat *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3) = a3.x;
  *(CGFloat *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3) = a3.y;
  BYTE5(self->mDynamicOutsetType) = 1;
}

- (id)getClippedHeadPortion
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v3, "size");
  if (v4 == 0.0 || fabs(v4) < 0.00999999978)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    objc_msgSend(v5, "size");
    v7 = v6;

    v8 = 0;
    if (v7 == 0.0 || fabs(v7) < 0.00999999978)
      return v8;
  }
  else
  {

  }
  v9 = *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3);
  -[CRLConnectionLineAbstractLayout headClipT](self, "headClipT");
  v8 = objc_msgSend(v9, "copyFromSegment:t:toSegment:t:", 1, 1);
  memset(&v20, 0, sizeof(v20));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v20, 0, sizeof(v20));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometryInParent"));
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v17 = v20;
    CGAffineTransformConcat(&v19, &t1, &v17);
    v20 = v19;

  }
  v19 = v20;
  objc_msgSend(v8, "transformUsingAffineTransform:", &v19);
  return v8;
}

- (id)getClippedTailPortion
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v3, "size");
  if (v4 == 0.0 || fabs(v4) < 0.00999999978)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    objc_msgSend(v5, "size");
    v7 = v6;

    v8 = 0;
    if (v7 == 0.0 || fabs(v7) < 0.00999999978)
      return v8;
  }
  else
  {

  }
  v9 = *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3);
  -[CRLConnectionLineAbstractLayout tailClipT](self, "tailClipT");
  v8 = objc_msgSend(v9, "copyFromSegment:t:toSegment:t:", 1, 1, 0.0, v10);
  memset(&v21, 0, sizeof(v21));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&v21, 0, sizeof(v21));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geometryInParent"));
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v18 = v21;
    CGAffineTransformConcat(&v20, &t1, &v18);
    v21 = v20;

  }
  v20 = v21;
  objc_msgSend(v8, "transformUsingAffineTransform:", &v20);
  return v8;
}

- (BOOL)isValidConnectionDestination:(id)a3 forLineEnd:(unint64_t)a4
{
  void *v4;
  void *v5;
  CRLConnectionLineAbstractLayout *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  BOOL v34;
  char v35;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char isKindOfClass;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v8 = (CRLConnectionLineAbstractLayout *)a3;
  *(_QWORD *)&v10 = objc_opt_class(CRLConnectionLineRep, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvas"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repForLayout:", self));
  v17 = sub_100221D0C(v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvas"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvasController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "repForLayout:", v8));

  if (v8 == self)
    goto LABEL_31;
  if (a4 == 11)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    if ((CRLConnectionLineAbstractLayout *)v24 != v8)
    {
      v19 = (void *)v24;
      self = (CRLConnectionLineAbstractLayout *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
      v25 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
      if ((CRLConnectionLineAbstractLayout *)v25 != v8)
      {
        v5 = (void *)v25;
        v26 = 0;
        goto LABEL_12;
      }

LABEL_31:
      v35 = 0;
      goto LABEL_32;
    }
LABEL_10:

    goto LABEL_31;
  }
  if (a4 != 10)
  {
    v26 = 0;
    goto LABEL_12;
  }
  v27 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  if ((CRLConnectionLineAbstractLayout *)v27 == v8)
    goto LABEL_10;
  v50 = (void *)v27;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
  if ((CRLConnectionLineAbstractLayout *)v28 == v8)
  {

    goto LABEL_31;
  }
  v49 = (void *)v28;
  v26 = 1;
LABEL_12:
  objc_opt_class(CRLConnectionLineAbstractLayout, v23);
  if ((objc_opt_isKindOfClass(v8, v29) & 1) == 0 && objc_msgSend(v18, "canConnectToRep:", v22))
  {
    v48 = v4;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](v8, "pureGeometry"));
    objc_msgSend(v30, "size");
    if (v31 == 0.0 || fabs(v31) < 0.00999999978)
    {

      v34 = 1;
    }
    else
    {
      v47 = v5;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](v8, "pureGeometry"));
      objc_msgSend(v32, "size");
      v34 = fabs(v33) < 0.00999999978 || v33 == 0.0;

      v5 = v47;
    }
    v4 = v48;
    if ((v26 & 1) == 0)
      goto LABEL_27;
LABEL_21:

    if (a4 != 11)
    {

      goto LABEL_30;
    }

    goto LABEL_29;
  }
  v34 = 1;
  if (v26)
    goto LABEL_21;
LABEL_27:
  if (a4 != 11)
    goto LABEL_30;

LABEL_29:
LABEL_30:
  if (v34)
    goto LABEL_31;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interactiveCanvasController"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "freehandDrawingToolkit"));
  if (objc_msgSend(v38, "isInDrawingMode")
    && (objc_opt_class(CRLShapeLayout, v39), (objc_opt_isKindOfClass(v8, v40) & 1) != 0)
    && (v41 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](v8, "parent"))) != 0)
  {
    v42 = (void *)v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](v8, "parent"));
    objc_opt_class(CRLGroupLayout, v44);
    isKindOfClass = objc_opt_isKindOfClass(v43, v45);

    v35 = isKindOfClass ^ 1;
  }
  else
  {

    v35 = 1;
  }
LABEL_32:

  return v35 & 1;
}

- (BOOL)shouldValidate
{
  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  return BYTE3(self->mOldConnectedFrom);
}

- (void)i_willValidateLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLCanvasLayout i_willValidateLayout](&v3, "i_willValidateLayout");
  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
}

- (id)reliedOnLayouts
{
  void *v3;
  id WeakRetained;
  id v5;
  id *v6;
  id v7;
  id v8;

  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (id *)((char *)&self->mConnectedInfoGeometry + 3);
  v7 = objc_loadWeakRetained(v6);

  if (v7)
  {
    v8 = objc_loadWeakRetained(v6);
    objc_msgSend(v3, "addObject:", v8);

  }
  return v3;
}

- (id)additionalLayoutsForRepCreation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout reliedOnLayouts](self, "reliedOnLayouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return v3;
}

- (BOOL)isDraggable
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLConnectionLineAbstractLayout;
  v3 = -[CRLStyledLayout isDraggable](&v5, "isDraggable");
  if (v3)
    LOBYTE(v3) = !-[CRLConnectionLineAbstractLayout p_isConnectedToLockedObjects](self, "p_isConnectedToLockedObjects");
  return v3;
}

- (BOOL)p_isConnectedToLockedObjects
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo", v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
  v16 = sub_100221D0C(v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if ((objc_msgSend(v9, "locked") & 1) != 0)
    v18 = 1;
  else
    v18 = objc_msgSend(v17, "locked");

  return v18;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)supportsFlipping
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
    v4 = v5 == 0;

  }
  return v4;
}

- (CGAffineTransform)connectedInfoGeometryTransform
{
  CGAffineTransform *result;

  result = *(CGAffineTransform **)((char *)&self->mOriginalPathSource + 3);
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (double)distanceBetweenConnectionPoints
{
  id *v3;
  id WeakRetained;
  void *v5;
  id *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = (id *)((char *)&self->mConnectedPathSource + 3);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  if (!WeakRetained)
    return -1.0;
  v5 = WeakRetained;
  v6 = (id *)((char *)&self->mConnectedInfoGeometry + 3);
  v7 = objc_loadWeakRetained(v6);

  if (!v7)
    return -1.0;
  v8 = objc_loadWeakRetained(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry"));
  objc_msgSend(v9, "center");
  v11 = v10;
  v13 = v12;

  v14 = objc_loadWeakRetained(v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geometry"));
  objc_msgSend(v15, "center");
  v17 = v16;
  v19 = v18;

  return sub_10006108C(v11, v13, v17, v19);
}

- (void)parentDidChange
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

  if (!v3)
    -[CRLConnectionLineAbstractLayout removeConnections](self, "removeConnections");
  -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLBoardItemLayout parentDidChange](&v4, "parentDidChange");
}

- (void)processChangedProperty:(unint64_t)a3
{
  double v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x20)
  {
    -[CRLConnectionLineAbstractLayout invalidateAndCleanupConnectedLayouts](self, "invalidateAndCleanupConnectedLayouts");
  }
  else if (a3 == 19)
  {
    *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v5));
    v9 = objc_msgSend(v8, "layoutClass");

    if (v7 != v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
      objc_msgSend(v11, "invalidateLayoutForRecreation:", self);

    }
    *(_QWORD *)&v12 = objc_opt_class(CRLConnectionLinePathSource, v10).n128_u64[0];
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource", v12));
    v16 = sub_100221D0C(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    BYTE6(self->mDynamicOutsetType) = objc_msgSend(v17, "userDidSetControlPoint");
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x22)
  {
    -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
    -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
    -[CRLConnectionLineAbstractLayout p_updateMagnetsFromInfo](self, "p_updateMagnetsFromInfo");
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout processChangedProperty:](&v18, "processChangedProperty:", a3);
}

- (void)p_updateMagnetsFromInfo
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
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectionLineInfo](self, "connectionLineInfo"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260798);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38480();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012607B8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout p_updateMagnetsFromInfo]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 334, 0, "invalid nil value for '%{public}s'", "self.connectionLineInfo");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectionLineInfo](self, "connectionLineInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectionLinePathSource"));

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headMagnet"));
  if (v9
    && (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo")),
        v11,
        v10,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headMagnet"));
    *(_QWORD *)&self->mDrawClippedTailPortion = objc_msgSend(v12, "magnetType");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headMagnet"));
    objc_msgSend(v13, "magnetNormalizedPosition");
    *(unint64_t *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3) = v14;
    *(unint64_t *)((char *)&self->mTailNearestMagnetTypeForRouting + 3) = v15;

  }
  else
  {
    *(_QWORD *)&self->mDrawClippedTailPortion = 0;
  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tailMagnet"));
  if (v16
    && (v17 = (void *)v16,
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom")),
        v18,
        v17,
        v18))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tailMagnet"));
    *(_QWORD *)&self->mUserDidSetControlPoint = objc_msgSend(v19, "magnetType");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tailMagnet"));
    objc_msgSend(v20, "magnetNormalizedPosition");
    *(_QWORD *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3) = v21;
    *(_QWORD *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3) = v22;

  }
  else
  {
    *(_QWORD *)&self->mUserDidSetControlPoint = 0;
  }
  v23 = *(_QWORD *)&self->mDrawClippedTailPortion;
  if (v23)
  {
    if (v23 != 1)
      LOBYTE(v23) = 0;
    BYTE3(self->mDynamicOutsetTo) = v23;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
    BYTE3(self->mDynamicOutsetTo) = v24 != 0;

  }
  v25 = *(_QWORD *)&self->mUserDidSetControlPoint;
  if (v25)
  {
    if (v25 != 1)
      LOBYTE(v25) = 0;
    BYTE4(self->mDynamicOutsetTo) = v25;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    BYTE4(self->mDynamicOutsetTo) = v26 != 0;

  }
}

- (void)connectedLayoutInvalidated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  CRLConnectionLineAbstractLayout *v13;
  double v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  if (-[CRLCanvasLayout layoutState](self, "layoutState") != 2
    || !-[CRLCanvasLayout isBeingTransformed](self, "isBeingTransformed"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutController"));
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutsForInfo:", v6));

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v7);
            v13 = *(CRLConnectionLineAbstractLayout **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
            if (v13 != self)
            {
              *(_QWORD *)&v14 = objc_opt_class(CRLConnectionLineAbstractLayout, v9).n128_u64[0];
              if (-[CRLConnectionLineAbstractLayout isMemberOfClass:](v13, "isMemberOfClass:", v15, v14))
                -[CRLConnectionLineAbstractLayout invalidateConnections](v13, "invalidateConnections");
            }
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

    }
    -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
    -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
    *(_DWORD *)((char *)&self->super.mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
    -[CRLBoardItemLayout invalidate](self, "invalidate");
    -[CRLBoardItemLayout invalidateWrap](self, "invalidateWrap");
  }

}

- (void)connectedLayoutDisconnected:(id)a3
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (id *)((char *)&self->mConnectedPathSource + 3);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained == v8
    || (v4 = (id *)((char *)&self->mConnectedInfoGeometry + 3),
        v6 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3)),
        v6,
        v7 = v8,
        v6 == v8))
  {
    objc_storeWeak(v4, 0);
    -[CRLConnectionLineAbstractLayout invalidateConnections](self, "invalidateConnections");
    v7 = v8;
  }

}

- (void)invalidateAndCleanupConnectedLayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  id v13;

  -[CRLConnectionLineAbstractLayout invalidateConnections](self, "invalidateConnections");
  v13 = (id)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectionLineInfo](self, "connectionLineInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardItemOwner"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getConnectedFromWithBoardItemOwner:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getConnectedToWithBoardItemOwner:", v4));
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", v6));
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained && !v7)
  {
    v10 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    objc_msgSend(v10, "removeConnectedLayout:", self);

    objc_storeWeak((id *)((char *)&self->mConnectedPathSource + 3), 0);
  }
  v11 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v11 && !v8)
  {
    v12 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    objc_msgSend(v12, "removeConnectedLayout:", self);

    objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), 0);
  }

}

- (void)removeConnections
{
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;

  BYTE3(self->mOldConnectedFrom) = 0;
  v3 = (id *)((char *)&self->mConnectedPathSource + 3);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "removeConnectedLayout:", self);

  }
  v6 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    objc_msgSend(v7, "removeConnectedLayout:", self);

  }
  objc_storeWeak(v3, 0);
  objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), 0);
}

- (void)invalidateConnections
{
  BYTE3(self->mOldConnectedFrom) = 0;
  -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");
  -[CRLBoardItemLayout invalidate](self, "invalidate");
}

- (void)invalidatePosition
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLCanvasLayout invalidatePosition](&v4, "invalidatePosition");
  -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  v3 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
  *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3) = 0;

}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLCanvasLayout invalidateSize](&v3, "invalidateSize");
  -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
}

- (BOOL)p_doesMainBoardContainInfo:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v4 = a3;
  objc_opt_class(_TtC8Freeform12CRLBoardItem, v5);
  v7 = sub_1002223BC(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainBoard"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "id"));
    v15 = objc_msgSend(v13, "containsObject:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)checkConnections
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  BOOL v35;
  BOOL v36;
  int v37;
  _BYTE *v38;
  void *v39;
  id v40;
  id v41;
  id v42;

  v42 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectionLineInfo](self, "connectionLineInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "boardItemOwner"));

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedFromInfo + 3));
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedFromInfo + 3));
    v8 = 0;
LABEL_3:
    v9 = 0;
    goto LABEL_9;
  }
  if (v5)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getConnectedFromWithBoardItemOwner:", v5));
  else
    v8 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", v8));
  v10 = objc_loadWeakRetained((id *)((char *)&self->mConnectedFrom + 3));

  if (v10 == v7)
    goto LABEL_3;
  objc_storeWeak((id *)((char *)&self->mConnectedFrom + 3), v7);
  v9 = 1;
LABEL_9:
  v11 = objc_loadWeakRetained((id *)((char *)&self->mConnectedToInfo + 3));

  if (!v11)
  {
    if (v5)
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getConnectedToWithBoardItemOwner:", v5));
    else
      v14 = 0;
    v15 = (void *)v14;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:"));
    v16 = objc_loadWeakRetained((id *)((char *)&self->mConnectedTo + 3));

    if (v16 == v12)
    {
      v13 = v15;
      if (!v9)
        goto LABEL_33;
    }
    else
    {
      objc_storeWeak((id *)((char *)&self->mConnectedTo + 3), v12);
      v13 = v15;
    }
LABEL_18:
    v40 = v13;
    v41 = v8;
    v39 = v5;
    -[CRLConnectionLineAbstractLayout invalidateConnections](self, "invalidateConnections");
    v38 = (char *)&self->mOldConnectedFrom + 3;
    goto LABEL_19;
  }
  v12 = objc_loadWeakRetained((id *)((char *)&self->mConnectedToInfo + 3));
  v13 = 0;
  if ((v9 & 1) != 0)
    goto LABEL_18;
LABEL_33:
  if (!BYTE3(self->mOldConnectedFrom))
  {
    v38 = (char *)&self->mOldConnectedFrom + 3;
    v39 = v5;
    v40 = v13;
    v41 = v8;
LABEL_19:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layoutForInfo:childOfLayout:", v7, v17));
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layoutForInfo:childOfLayout:", v12, v17));
    v20 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

    if (v18 != v20)
    {
      v21 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

      if (v21)
      {
        v22 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
        objc_msgSend(v22, "removeConnectedLayout:", self);

      }
      v23 = objc_storeWeak((id *)((char *)&self->mConnectedPathSource + 3), v18);

      if (v18)
      {
        v24 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
        objc_msgSend(v24, "addConnectedLayout:", self);

      }
    }
    v25 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

    if (v19 != v25)
    {
      v26 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

      if (v26)
      {
        v27 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
        objc_msgSend(v27, "removeConnectedLayout:", self);

      }
      v28 = objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), v19);

      if (v19)
      {
        v29 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
        objc_msgSend(v29, "addConnectedLayout:", self);

      }
    }
    v30 = v3;
    v31 = (v12 != 0) ^ (v19 == 0);
    v32 = (v7 != 0) ^ (v18 == 0);
    v13 = v40;
    if (v12 == v40 && v7 == v41)
    {
      v33 = -[CRLConnectionLineAbstractLayout p_doesMainBoardContainInfo:](self, "p_doesMainBoardContainInfo:", v12);
      v34 = -[CRLConnectionLineAbstractLayout p_doesMainBoardContainInfo:](self, "p_doesMainBoardContainInfo:", v7);
      if ((v12 != 0) != (v19 == 0))
      {
        v31 = 1;
      }
      else
      {
        if (v19)
          v35 = 1;
        else
          v35 = v12 == 0;
        if (v35)
          v31 = 0;
        else
          v31 = v33 ^ 1;
      }
      v13 = v40;
      if ((v7 != 0) == (v18 == 0))
      {
        if (v18)
          v36 = 1;
        else
          v36 = v7 == 0;
        if (v36)
          v37 = 0;
        else
          v37 = v34 ^ 1;
        if (!v37)
          goto LABEL_46;
        goto LABEL_44;
      }
      v32 = 1;
    }
    if (!v32)
    {
LABEL_46:
      -[CRLConnectionLineAbstractLayout p_updateMagnetsFromInfo](self, "p_updateMagnetsFromInfo");

      v3 = v30;
      v5 = v39;
      v8 = v41;
      goto LABEL_47;
    }
LABEL_44:
    if (v31)
    {
      *v38 = 1;
      -[CRLShapeLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    }
    goto LABEL_46;
  }
LABEL_47:

}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6
{
  return 0;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)clipPath:(id)a3 onLayout:(id)a4 outset:(double)a5 reversed:(BOOL)a6 isValid:(BOOL *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  CRLPathIntersection *v18;
  id WeakRetained;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  double v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  BOOL v39;
  _BOOL4 v40;
  void *v41;
  char *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  _BYTE *v52;
  CRLPathIntersection *v53;
  double x;
  double y;
  double v56;
  char *v57;
  CRLPathIntersection *v58;
  void *v60;
  void *v61;
  void *v62;
  BOOL *v63;
  _BYTE *v64;
  void *v65;
  id v66;
  id v67;
  _OWORD v68[3];
  _QWORD v69[2];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  objc_msgSend(v12, "length");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathForClippingConnectionLines"));
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "isEmpty") & 1) == 0)
  {
    v63 = a7;
    if (a5 <= 0.0)
    {
      v27 = v17;
LABEL_17:
      v24 = v27;
LABEL_20:
      v67 = objc_msgSend(v24, "copy", v63);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
      v32 = v31;
      v65 = v17;
      v66 = v13;
      if (v31)
        objc_msgSend(v31, "transform");
      else
        memset(v68, 0, sizeof(v68));
      objc_msgSend(v67, "transformUsingAffineTransform:", v68);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v12, "addIntersectionsWithPath:to:allIntersections:reversed:", v67, v33, 1, 0);
      if (!objc_msgSend(v33, "count"))
        goto LABEL_51;
      objc_msgSend(v33, "sortUsingSelector:", "compareSegmentAndT:");
      v34 = (uint64_t)objc_msgSend(v33, "count");
      if (v34 < 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012607D8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E38514();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012607F8);
        v60 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:]"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v61, v62, 674, 0, "Out-of-bounds type assignment was clamped to max");

        v34 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v35 = v8 ? v34 - 1 : 0;
      v36 = v8 ? -1 : 1;
      if (v35 >= v34 || v35 < 0)
      {
LABEL_51:
        v52 = v64;
        v17 = v65;
        *v64 = 1;
        v13 = v66;
      }
      else
      {
        v37 = 1.0 / v15;
        v38 = 1.0 - 1.0 / v15;
        while (1)
        {
          v18 = (CRLPathIntersection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", v35));
          v35 += v36;
          v39 = v35 >= v34 || v35 < 0;
          v40 = !v39;
          if (v40)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", v35));
            v42 = (char *)objc_msgSend(v41, "segment");
            objc_msgSend(v41, "t");
            v44 = v43;

          }
          else if (v8)
          {
            v42 = 0;
            v44 = 0.0;
          }
          else
          {
            v42 = (char *)objc_msgSend(v12, "elementCount") - 1;
            v44 = 1.0;
          }
          v45 = (double)(uint64_t)&v42[-[CRLPathIntersection segment](v18, "segment")] * 0.5;
          v46 = ceil(v45);
          v47 = floor(v45);
          if (v8)
            v47 = v46;
          v48 = (uint64_t)v47;
          -[CRLPathIntersection t](v18, "t");
          objc_msgSend(v12, "pointAt:fromElement:", v48, (v44 + v49) * 0.5);
          if ((objc_msgSend(v67, "containsPoint:") & 1) == 0)
          {
            -[CRLPathIntersection t](v18, "t");
            if (v50 > v37)
            {
              -[CRLPathIntersection t](v18, "t");
              if (v51 < v38)
                break;
            }
          }

          if (!v40)
            goto LABEL_51;
        }
        v52 = v64;
        v17 = v65;
        *v64 = 1;
        v13 = v66;
        if (v18)
          goto LABEL_59;
      }
      if (v8)
      {
        objc_msgSend(v12, "pointAt:fromElement:", (char *)objc_msgSend(v12, "elementCount") - 1, 0.99);
        if (objc_msgSend(v67, "containsPoint:"))
        {
          v53 = [CRLPathIntersection alloc];
          x = CGPointZero.x;
          y = CGPointZero.y;
          v56 = 0.0;
          v57 = 0;
LABEL_57:
          v18 = -[CRLPathIntersection initWithSegment:atT:atPoint:](v53, "initWithSegment:atT:atPoint:", v57, v56, x, y);
          *v52 = 0;
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {
        objc_msgSend(v12, "pointAt:fromElement:", 1, 0.01);
        if (objc_msgSend(v67, "containsPoint:"))
        {
          v58 = [CRLPathIntersection alloc];
          v57 = (char *)objc_msgSend(v12, "elementCount") - 1;
          x = CGPointZero.x;
          y = CGPointZero.y;
          v56 = 1.0;
          v53 = v58;
          goto LABEL_57;
        }
      }
      v18 = 0;
      goto LABEL_59;
    }
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mTemporaryConnectedFromInfo + 3));
    if (WeakRetained == v17)
    {
      v28 = *(double *)((char *)&self->mCachedFromWrapPath + 3);

      if (v28 == a5)
      {
        v29 = 1363;
LABEL_16:
        v27 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v29);
        goto LABEL_17;
      }
    }
    else
    {

    }
    v20 = objc_loadWeakRetained((id *)((char *)&self->mTemporaryConnectedToInfo + 3));
    if (v20 != v17)
    {

LABEL_9:
      objc_msgSend(v17, "setLineWidth:", a5 + a5, a7);
      objc_msgSend(v17, "setLineJoinStyle:", 1);
      objc_msgSend(v17, "setLineCapStyle:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "strokedCopy"));
      v69[0] = v17;
      v69[1] = v21;
      v22 = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v23));

      v25 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
      if (v25 == v13)
      {
        objc_storeStrong((id *)((char *)&self->mCachedFromOutset + 3), v24);
        objc_storeWeak((id *)((char *)&self->mTemporaryConnectedFromInfo + 3), v22);
        v26 = 1347;
      }
      else
      {
        objc_storeStrong((id *)((char *)&self->mCachedToOutset + 3), v24);
        objc_storeWeak((id *)((char *)&self->mTemporaryConnectedToInfo + 3), v22);
        v26 = 1355;
      }
      *(double *)((char *)&self->super.super.super.super.super.super.isa + v26) = a5;
      v17 = v22;
      goto LABEL_20;
    }
    v30 = *(double *)((char *)&self->mCachedToWrapPath + 3);

    if (v30 != a5)
      goto LABEL_9;
    v29 = 1371;
    goto LABEL_16;
  }
  v18 = 0;
LABEL_60:

  return v18;
}

- (void)updateConnectedPath
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __objc2_class **p_superclass;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CRLCanvasInfoGeometry *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CRLCanvasInfoGeometry *v30;
  CRLCanvasInfoGeometry *v31;
  void *v32;
  void *v33;
  void *v34;
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
  CRLBezierPath *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double y;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CRLCanvasInfoGeometry *v68;
  void *v69;
  void *v70;
  void *v71;
  CRLBezierPath *v72;
  void *v73;
  CRLConnectionLineMagnet *v74;
  CRLConnectionLineMagnet *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSArray *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id v86;
  CGAffineTransform v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  double v98;
  double v99;
  __int128 v100;
  double v101;
  double v102;

  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    if (v5 == v6)
      v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  v8 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    if (v10 == v11)
      v12 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  p_superclass = &OBJC_METACLASS___CRLAXZorderButton.superclass;
  *(_QWORD *)&v16 = objc_opt_class(CRLConnectionLinePathSource, v14).n128_u64[0];
  v17 = v15;
  v18 = *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3);
  if (v18)
  {
    v19 = sub_100221D0C(v15, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v16));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pathSource"));
    v23 = sub_100221D0C(v17, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v23);

  }
  v24 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
  if (v24)
  {
    v25 = v24;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v25 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "geometry"));

  }
  v96 = xmmword_100EEC438;
  v97 = xmmword_100EEC438;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bezierPath"));
  objc_msgSend(v27, "getStartPoint:andEndPoint:", &v97, &v96);

  if (-[CRLConnectionLineAbstractLayout canEndpointsCoincide](self, "canEndpointsCoincide")
    || !sub_10005FDF0(*(double *)&v96, *((double *)&v96 + 1), *(double *)&v97, *((double *)&v97 + 1)))
  {
    v28 = v20;
    v31 = v25;
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLinePathSource pathSourceOfLength:](CRLConnectionLinePathSource, "pathSourceOfLength:", 100.0));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bezierPath"));
    objc_msgSend(v29, "getStartPoint:andEndPoint:", &v97, &v96);

    v30 = [CRLCanvasInfoGeometry alloc];
    -[CRLCanvasInfoGeometry position](v25, "position");
    v31 = -[CRLCanvasInfoGeometry initWithPosition:size:](v30, "initWithPosition:size:");

    if (sub_10005FDF0(*(double *)&v96, *((double *)&v96 + 1), *(double *)&v97, *((double *)&v97 + 1)))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260818);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E38594();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260838);
      v32 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout updateConnectedPath]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 758, 0, "Head and tail should no longer be equal.");

      p_superclass = (__objc2_class **)(&OBJC_METACLASS___CRLAXZorderButton + 8);
    }
  }
  v94 = 0u;
  v95 = 0u;
  v93 = 0u;
  if (v31)
  {
    -[CRLCanvasInfoGeometry transform](v31, "transform");
    v35 = *((double *)&v93 + 1);
    v36 = *(double *)&v93;
    v37 = *((double *)&v94 + 1);
    v38 = *(double *)&v94;
    v40 = *((double *)&v95 + 1);
    v39 = *(double *)&v95;
  }
  else
  {
    v40 = 0.0;
    v39 = 0.0;
    v37 = 0.0;
    v38 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
  }
  v41 = *((double *)&v97 + 1) * v38 + v36 * *(double *)&v97;
  v42 = v39 + v41;
  v43 = v40 + *((double *)&v97 + 1) * v37 + v35 * *(double *)&v97;
  v44 = v38 * *((double *)&v96 + 1) + v36 * *(double *)&v96;
  v45 = v37 * *((double *)&v96 + 1) + v35 * *(double *)&v96;
  if (BYTE3(self->mAcumulatedDrag.x))
  {
    v46 = *(double *)((char *)&self->mAcumulatedDrag.y + 3);
    v47 = *(double *)&self->mUseResizePoints[3];
  }
  else
  {
    v46 = v39 + v41;
    v47 = v40 + *((double *)&v97 + 1) * v37 + v35 * *(double *)&v97;
    if (v7)
    {
      -[CRLConnectionLineAbstractLayout p_getPositionForMagnet:forLayout:forEnd:](self, "p_getPositionForMagnet:forLayout:forEnd:", -[CRLConnectionLineAbstractLayout tailMagnetType](self, "tailMagnetType"), v7, 10);
      v46 = v48;
      v47 = v49;
      *(double *)((char *)&self->mHeadMagnetCanvasPosition.x + 3) = v48;
      *(double *)((char *)&self->mHeadMagnetCanvasPosition.y + 3) = v49;
    }
  }
  v50 = v39 + v44;
  v51 = v40 + v45;
  if (BYTE5(self->mAcumulatedDrag.x))
  {
    v52 = *(double *)((char *)&self->mResizeControlPoints[1].x + 3);
    v53 = *(double *)((char *)&self->mResizeControlPoints[1].y + 3);
  }
  else
  {
    v52 = v50;
    v53 = v51;
    if (v12)
    {
      -[CRLConnectionLineAbstractLayout p_getPositionForMagnet:forLayout:forEnd:](self, "p_getPositionForMagnet:forLayout:forEnd:", -[CRLConnectionLineAbstractLayout headMagnetType](self, "headMagnetType"), v12, 11);
      v52 = v54;
      v53 = v55;
      *(double *)((char *)&self->mTailMagnetNormalizedPosition.x + 3) = v54;
      *(double *)((char *)&self->mTailMagnetNormalizedPosition.y + 3) = v55;
    }
  }
  if (!-[CRLConnectionLineAbstractLayout canEndpointsCoincide](self, "canEndpointsCoincide")
    && sub_10005FDF0(v46, v47, v52, v53)
    || (sub_1000637EC() & 1) != 0
    || sub_1000637EC())
  {
    BYTE5(self->mOldConnectedFrom) = 0;
    BYTE4(self->mOldConnectedFrom) = 0;
    objc_storeStrong((id *)((char *)&self->mOriginalPathSource + 3), v31);
    v56 = (CRLBezierPath *)objc_msgSend(v28, "copy");
    v57 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
    *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = v56;

    v58 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    v59 = *(void **)(&self->super.mOkayToSetGeometry + 3);
    *(_QWORD *)(&self->super.mOkayToSetGeometry + 3) = v58;

    y = CGPointZero.y;
    objc_msgSend(*(id *)(&self->super.mOkayToSetGeometry + 3), "moveToPoint:", CGPointZero.x, y);
    objc_msgSend(*(id *)(&self->super.mOkayToSetGeometry + 3), "lineToPoint:", CGPointZero.x, y);
  }
  else
  {
    BYTE5(self->mOldConnectedFrom) = 1;
    v98 = v46;
    v99 = v47;
    if (BYTE4(self->mAcumulatedDrag.x))
    {
      v100 = *(__int128 *)((char *)self->mResizeControlPoints + 3);
    }
    else
    {
      -[CRLConnectionLineAbstractLayout controlPointForPointA:pointB:andOriginalA:originalB:](self, "controlPointForPointA:pointB:andOriginalA:originalB:", v46, v47, v52, v53, v42, v43, v50, v51);
      *(_QWORD *)&v100 = v61;
      *((_QWORD *)&v100 + 1) = v62;
    }
    v101 = v52;
    v102 = v53;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout createConnectedPathFrom:to:withControlPoints:clipPath:](self, "createConnectedPathFrom:to:withControlPoints:clipPath:", v7, v12, &v98, 1));
    v86 = v7;
    v85 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout createConnectedPathFrom:to:withControlPoints:clipPath:](self, "createConnectedPathFrom:to:withControlPoints:clipPath:", v7, v12, &v98, 0));
    objc_msgSend(v63, "bounds");
    v68 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v64, v65, v66, v67);
    v69 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3) = (CRLConnectionLinePathSource *)v68;

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v70, "moveToPoint:", v98, v99);
    objc_msgSend(v70, "lineToPoint:", v100);
    objc_msgSend(v70, "lineToPoint:", v101, v102);
    v71 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    if (v71)
      objc_msgSend(v71, "transform");
    else
      memset(&v91, 0, sizeof(v91));
    CGAffineTransformInvert(&v92, &v91);
    objc_msgSend(v70, "transformUsingAffineTransform:", &v92);
    v72 = (CRLBezierPath *)objc_msgSend(objc_alloc((Class)(p_superclass + 409)), "initWithBezierPath:", v70);
    v73 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
    *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = v72;

    objc_msgSend(*(id *)((char *)&self->mUnclippedBezierPath + 3), "setType:", objc_msgSend(v28, "type"));
    objc_msgSend(v28, "outsetFrom");
    objc_msgSend(*(id *)((char *)&self->mUnclippedBezierPath + 3), "setOutsetFrom:");
    objc_msgSend(v28, "outsetTo");
    objc_msgSend(*(id *)((char *)&self->mUnclippedBezierPath + 3), "setOutsetTo:");
    v74 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", *(_QWORD *)&self->mDrawClippedTailPortion, *(double *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3), *(double *)((char *)&self->mTailNearestMagnetTypeForRouting + 3));
    objc_msgSend(*(id *)((char *)&self->mUnclippedBezierPath + 3), "setHeadMagnet:", v74);

    v75 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", *(_QWORD *)&self->mUserDidSetControlPoint, *(double *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3), *(double *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3));
    objc_msgSend(*(id *)((char *)&self->mUnclippedBezierPath + 3), "setTailMagnet:", v75);

    objc_msgSend(*(id *)((char *)&self->mUnclippedBezierPath + 3), "setUserDidSetControlPoint:", BYTE6(self->mDynamicOutsetType));
    v76 = *(_QWORD *)&self->mDrawClippedTailPortion;
    if (v76)
    {
      v77 = v63;
      if (v76 != 1)
        LOBYTE(v76) = 0;
      BYTE3(self->mDynamicOutsetTo) = v76;
    }
    else
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
      BYTE3(self->mDynamicOutsetTo) = v78 != 0;

      v77 = v63;
    }
    v79 = *(_QWORD *)&self->mUserDidSetControlPoint;
    if (v79)
    {
      v80 = (NSArray *)v85;
      if (v79 != 1)
        LOBYTE(v79) = 0;
      BYTE4(self->mDynamicOutsetTo) = v79;
    }
    else
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
      BYTE4(self->mDynamicOutsetTo) = v81 != 0;

      v80 = (NSArray *)v85;
    }
    v82 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    if (v82)
      objc_msgSend(v82, "transform");
    else
      memset(&v89, 0, sizeof(v89));
    CGAffineTransformInvert(&v90, &v89);
    objc_msgSend(v77, "transformUsingAffineTransform:", &v90);
    objc_storeStrong((id *)(&self->super.mOkayToSetGeometry + 3), v77);
    v83 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    if (v83)
      objc_msgSend(v83, "transform");
    else
      memset(&v87, 0, sizeof(v87));
    v7 = v86;
    CGAffineTransformInvert(&v88, &v87);
    -[NSArray transformUsingAffineTransform:](v80, "transformUsingAffineTransform:", &v88);
    v84 = *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3);
    *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3) = v80;

  }
}

- (BOOL)isInvisible
{
  return !BYTE3(self->mOldConnectedFrom) || BYTE4(self->mOldConnectedFrom) == 0;
}

- (BOOL)i_visibleLine
{
  return BYTE4(self->mOldConnectedFrom);
}

- (void)i_setVisibleLine:(BOOL)a3
{
  BYTE4(self->mOldConnectedFrom) = a3;
}

- (BOOL)canEndpointsCoincide
{
  return 0;
}

- (BOOL)canBeIntersected
{
  return 0;
}

- (BOOL)canResetTextAndObjectHandles
{
  return 0;
}

- (CRLConnectionLinePathSource)connectedPathSource
{
  void *v3;

  v3 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
  if (!v3 || !BYTE3(self->mOldConnectedFrom))
  {
    -[CRLConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath");
    v3 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
  }
  return (CRLConnectionLinePathSource *)v3;
}

- (id)pathSource
{
  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  return -[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource");
}

- (id)layoutInfoGeometry
{
  void *v3;

  v3 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
  if (!v3 || !BYTE3(self->mOldConnectedFrom))
  {
    -[CRLConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath");
    v3 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
  }
  return v3;
}

- (CGRect)boundsForStandardKnobs
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout path](self, "path"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CRLShapeLayout pathBounds](self, "pathBounds");
  v13 = -v12;
  v15 = -v14;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return CGRectOffset(v16, v13, v15);
}

- (void)invalidatePath
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout invalidatePath](&v5, "invalidatePath");
  -[CRLBoardItemLayout invalidate](self, "invalidate");
  if (!-[CRLCanvasLayout isPositionInvalid](self, "isPositionInvalid"))
    -[CRLConnectionLineAbstractLayout invalidatePosition](self, "invalidatePosition");
  v3 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
  *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = 0;

  v4 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  *(_QWORD *)(&self->super.mOkayToSetGeometry + 3) = 0;

}

- (BOOL)pathIsLineSegment
{
  return 1;
}

- (BOOL)pathIsOpen
{
  return 1;
}

- (CGRect)frameForMiniFormatterPositioning
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  if (*(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3))
    v3 = *(_DWORD *)((char *)&self->super.mCachedPathBoundsStruct.originalCachedRect.size.width + 3) == 0;
  else
    v3 = 1;
  v17.receiver = self;
  v17.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLCanvasLayout frameForMiniFormatterPositioning](&v17, "frameForMiniFormatterPositioning");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v3)
  {
    v12 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
    *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = 0;

    *(_DWORD *)((char *)&self->super.mCachedPathBoundsStruct.originalCachedRect.size.width + 3) = 0;
  }
  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)path
{
  void *v3;

  v3 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  if (!v3 || !BYTE3(self->mOldConnectedFrom))
  {
    -[CRLConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath");
    v3 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  }
  return v3;
}

- (CGPoint)unclippedHeadPoint
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  objc_super v9;
  double v10;
  double v11;
  CGPoint result;

  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (WeakRetained)
  {
    v10 = 0.0;
    v11 = 0.0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", 0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bezierPath"));
    objc_msgSend(v5, "getStartPoint:andEndPoint:", &v8, &v10);

    v6 = v10;
    v7 = v11;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLConnectionLineAbstractLayout;
    -[CRLShapeLayout unclippedHeadPoint](&v9, "unclippedHeadPoint");
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)unclippedTailPoint
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  objc_super v9;
  double v10;
  double v11;
  CGPoint result;

  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    v10 = 0.0;
    v11 = 0.0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", 0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bezierPath"));
    objc_msgSend(v5, "getStartPoint:andEndPoint:", &v10, &v8);

    v6 = v10;
    v7 = v11;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLConnectionLineAbstractLayout;
    -[CRLShapeLayout unclippedTailPoint](&v9, "unclippedTailPoint");
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldDisplayGuides
{
  id WeakRetained;
  BOOL v4;
  id v5;

  -[CRLConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  if (WeakRetained)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    v4 = v5 == 0;

  }
  return v4;
}

- (id)i_originalPathSource
{
  return *(id *)((char *)&self->mClippedBezierPath + 3);
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  void *v4;
  CRLBezierPath *v5;
  void *v6;
  void *v7;
  CRLEditableBezierPathSource *v8;
  void *v9;
  CRLPKStrokePathCompactData *v10;
  void *v11;
  CRLBezierPath *WeakRetained;
  void *v13;
  CRLBezierPath *v14;
  void *v15;
  double *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:](&v28, "beginDynamicOperationWithRealTimeCommands:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource"));
  v5 = (CRLBezierPath *)objc_msgSend(v4, "copy");
  v6 = *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3);
  *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3) = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource"));
  v8 = (CRLEditableBezierPathSource *)objc_msgSend(v7, "copy");
  v9 = *(CRLEditableBezierPathSource **)((char *)&self->super.mCachedEditableBezierPathSource + 3);
  *(CRLEditableBezierPathSource **)((char *)&self->super.mCachedEditableBezierPathSource + 3) = v8;

  v10 = (CRLPKStrokePathCompactData *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  v11 = *(CRLPKStrokePathCompactData **)((char *)&self->super.mDynamicPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->super.mDynamicPencilKitStrokePathCompactData + 3) = v10;

  WeakRetained = (CRLBezierPath *)objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  v13 = *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3) = WeakRetained;

  v14 = (CRLBezierPath *)objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
  v15 = *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3) = v14;

  *(CGPoint *)((char *)&self->mLooseEndPosition + 3) = CGPointZero;
  v16 = (double *)((char *)&self->mOldConnectedTo + 3);
  v17 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
  if (v17)
    -[CRLConnectionLineAbstractLayout unclippedTailPoint](self, "unclippedTailPoint");
  else
    -[CRLConnectionLineAbstractLayout unclippedHeadPoint](self, "unclippedHeadPoint");
  *(_QWORD *)v16 = v18;
  *(_QWORD *)(&self->mValidLine + 1) = v19;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "transform");
    v22 = v25;
    v23 = v26;
    v24 = v27;
  }
  else
  {
    v24 = 0uLL;
    v22 = 0uLL;
    v23 = 0uLL;
  }
  *(float64x2_t *)v16 = vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, *(double *)(&self->mValidLine + 1)), v22, *v16));

  *(_WORD *)((char *)&self->mAcumulatedDrag.x + 3) = 0;
  BYTE5(self->mAcumulatedDrag.x) = 0;
}

- (void)endDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout endDynamicOperation](&v6, "endDynamicOperation");
  v3 = *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3);
  *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3) = 0;

  v4 = *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3) = 0;

  v5 = *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3) = 0;

  *(_WORD *)((char *)&self->mAcumulatedDrag.x + 3) = 0;
  BYTE5(self->mAcumulatedDrag.x) = 0;
}

- (CGPoint)i_accumulatedDrag
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->mLooseEndPosition.x + 3);
  v3 = *(double *)((char *)&self->mLooseEndPosition.y + 3);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)pauseDynamicTransformation
{
  id WeakRetained;
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  CGFloat v12;
  void *v13;
  CRLPathSource *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  float64x2_t v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLCanvasLayout pauseDynamicTransformation](&v24, "pauseDynamicTransformation");
  if (-[CRLCanvasLayout layoutState](self, "layoutState") == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    if (WeakRetained)
      -[CRLConnectionLineAbstractLayout unclippedTailPoint](self, "unclippedTailPoint");
    else
      -[CRLConnectionLineAbstractLayout unclippedHeadPoint](self, "unclippedHeadPoint");
    v16 = v5;
    v17 = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "transform", v16, v17);
      v8 = v21;
      v9 = v22;
      v10 = v23;
    }
    else
    {
      v10 = 0uLL;
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
      v8 = 0uLL;
      v9 = 0uLL;
    }
    v18 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, *(double *)&v16), v8, *(double *)&v17));

    v11 = sub_1000603B8(v18.f64[0], v18.f64[1], *(double *)((char *)&self->mOldConnectedTo + 3));
    *(double *)((char *)&self->mLooseEndPosition.x + 3) = v11;
    *(CGFloat *)((char *)&self->mLooseEndPosition.y + 3) = v12;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeTranslation(&v20, v11, v12);
    v13 = *(CRLPKStrokePathCompactData **)((char *)&self->super.mDynamicPencilKitStrokePathCompactData + 3);
    v19 = v20;
    v14 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometryByAppendingTransform:", &v19));
    v15 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3) = v14;

  }
}

- (CGSize)minimumSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  double width;
  double height;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom")),
        v5,
        v4,
        v5))
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLConnectionLineAbstractLayout;
    -[CRLShapeLayout minimumSize](&v17, "minimumSize");
    width = v8;
    height = v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;

  v15 = fmin(width, v12);
  v16 = fmin(height, v14);
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)hasControlKnobsInStraightLine
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLinePathSource, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v8, "getControlKnobPosition:", 10);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "getControlKnobPosition:", 12);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "getControlKnobPosition:", 11);
  v18 = v17;
  v20 = v19;
  if (sub_1000600B4(v10, v12, v14, v16, v17, v19))
  {
    v21 = sub_1000603DC(v10, v12, 0.25);
    v22 = sub_1000603B8(v14, v16, v21);
    v24 = v23;
    v25 = sub_1000603DC(v18, v20, 0.25);
    v26 = sub_1000603B8(v22, v24, v25);
    v28 = sub_1000603DC(v26, v27, 2.0);
    v30 = v29;
    v31 = sub_1000603B8(v10, v12, v28);
    v33 = v32;
    v34 = sub_1000603B8(v28, v30, v18);
    v36 = sub_1000603C4(v31, v33, v34, v35) > 0.0;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (BOOL)isStraightLine
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  if (!-[CRLConnectionLineAbstractLayout hasControlKnobsInStraightLine](self, "hasControlKnobsInStraightLine"))
    return 0;
  *(_QWORD *)&v4 = objc_opt_class(CRLConnectionLinePathSource, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource", v4));
  v8 = sub_100221D0C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "type") == (id)1)
  {
    objc_msgSend(v9, "getControlKnobPosition:", 10);
    v11 = v10;
    v13 = v12;
    objc_msgSend(v9, "getControlKnobPosition:", 11);
    v16 = 1;
    if (v11 != v14 && vabdd_f64(v11, v14) >= 0.00999999978)
      v16 = vabdd_f64(v13, v15) < 0.00999999978 || v13 == v15;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (int64_t)connectionType
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int64_t v10;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLinePathSource, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_msgSend(v8, "type");
  if (v9 == (id)1)
  {
    v10 = 2;
  }
  else if (v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = -[CRLConnectionLineAbstractLayout hasControlKnobsInStraightLine](self, "hasControlKnobsInStraightLine") ^ 1;
  }

  return v10;
}

+ (id)localizedDescriptionForConnectionType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Corner");
  }
  else if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Curve");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Straight");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (id)commandForSettingConnectionType:(int64_t)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _TtC8Freeform15CRLCommandGroup *v20;
  void *v21;
  void *v22;
  _TtC8Freeform23CRLCommandSetPathSource *v23;
  void *v24;
  _TtC8Freeform23CRLCommandSetPathSource *v25;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v26;
  void *v27;
  void *v28;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v29;
  void *v30;
  _QWORD v32[2];

  *(_QWORD *)&v5 = objc_opt_class(CRLConnectionLinePathSource, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout pathSource](self, "pathSource", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = objc_msgSend(v10, "copy");
    v12 = v11;
    if (a3 == 2)
    {
      objc_msgSend(v11, "setType:", 1);
      -[CRLConnectionLineAbstractLayout getControlKnobPosition:](self, "getControlKnobPosition:", 12);
    }
    else
    {
      if (a3 == 1)
      {
        objc_msgSend(v11, "setType:", 0);
        if (-[CRLConnectionLineAbstractLayout hasControlKnobsInStraightLine](self, "hasControlKnobsInStraightLine"))
          objc_msgSend(v12, "bend");
        goto LABEL_11;
      }
      if (a3)
      {
LABEL_11:
        v20 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Set Connection Line Type"), 0, CFSTR("UndoStrings")));
        -[CRLCommandGroup setActionString:](v20, "setActionString:", v22);

        v23 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
        v25 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:](v23, "initWithShapeItem:pathSource:", v24, v12);

        v26 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout boardItem](self, "boardItem"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
        v29 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:](v26, "initWithBoardItem:geometry:", v27, v28);

        v32[0] = v25;
        v32[1] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
        -[CRLCommandGroup addCommands:](v20, "addCommands:", v30);

        goto LABEL_12;
      }
      objc_msgSend(v11, "setType:", 0);
      objc_msgSend(v10, "getControlKnobPosition:", 10);
      v14 = v13;
      v16 = v15;
      objc_msgSend(v10, "getControlKnobPosition:", 11);
      v19 = sub_100061A8C(v14, v16, v17, v18, 0.5);
    }
    objc_msgSend(v12, "setControlKnobPosition:toPoint:", 12, v19);
    goto LABEL_11;
  }
  v20 = 0;
LABEL_12:

  return v20;
}

- (id)commandToToggleConnectionType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectionLineInfo](self, "connectionLineInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));
  v5 = objc_msgSend(v4, "type");
  if (v5 == (id)1)
  {
    v6 = -[CRLConnectionLineAbstractLayout hasControlKnobsInStraightLine](self, "hasControlKnobsInStraightLine") ^ 1;
  }
  else if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 2;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout commandForSettingConnectionType:](self, "commandForSettingConnectionType:", v6));

  return v7;
}

- (void)beginDynamicOutsetChange
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[CRLConnectionLineAbstractLayout beginDynamicOperationWithRealTimeCommands:](self, "beginDynamicOperationWithRealTimeCommands:", 0);
  *(_QWORD *)&v4 = objc_opt_class(CRLConnectionLinePathSource, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathSource"));
  v9 = sub_100221D0C(v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  -[CRLConnectionLineAbstractLayout setUseDynamicOutsets:](self, "setUseDynamicOutsets:", 1);
  objc_msgSend(v10, "outsetFrom");
  -[CRLConnectionLineAbstractLayout setDynamicOutsetFrom:](self, "setDynamicOutsetFrom:");
  objc_msgSend(v10, "outsetTo");
  -[CRLConnectionLineAbstractLayout setDynamicOutsetTo:](self, "setDynamicOutsetTo:");

}

- (void)endDynamicOutsetChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _TtC8Freeform15CRLCommandGroup *v15;
  void *v16;
  void *v17;
  _TtC8Freeform23CRLCommandSetPathSource *v18;
  void *v19;
  _TtC8Freeform23CRLCommandSetPathSource *v20;
  id v21;

  -[CRLConnectionLineAbstractLayout endDynamicOperation](self, "endDynamicOperation");
  -[CRLConnectionLineAbstractLayout setUseDynamicOutsets:](self, "setUseDynamicOutsets:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));

  *(_QWORD *)&v6 = objc_opt_class(CRLConnectionLinePathSource, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathSource"));
  v11 = sub_100221D0C(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = objc_msgSend(v12, "copy");
  -[CRLConnectionLineAbstractLayout dynamicOutsetFrom](self, "dynamicOutsetFrom");
  objc_msgSend(v13, "setOutsetFrom:");
  -[CRLConnectionLineAbstractLayout dynamicOutsetTo](self, "dynamicOutsetTo");
  objc_msgSend(v13, "setOutsetTo:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "commandController"));
  v15 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Offset Setting"), 0, CFSTR("UndoStrings")));
  -[CRLCommandGroup setActionString:](v15, "setActionString:", v17);

  v18 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v20 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:](v18, "initWithShapeItem:pathSource:", v19, v13);

  -[CRLCommandGroup addCommand:](v15, "addCommand:", v20);
  objc_msgSend(v14, "enqueueCommand:", v15);

}

- (BOOL)i_shouldTryToScaleCachedRectsDuringResize
{
  return 0;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout takeSizeFromTracker:](&v8, "takeSizeFromTracker:", v4);
  if (v4)
  {
    objc_msgSend(v4, "transformForLayout:", self);
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  -[CRLConnectionLineAbstractLayout p_resizeWithTransform:preservingAspectRatio:](self, "p_resizeWithTransform:preservingAspectRatio:", &v5, objc_msgSend(v4, "currentlyPreservingAspectRatio", v5, v6, v7));

}

- (void)p_resizeWithTransform:(CGAffineTransform *)a3 preservingAspectRatio:(BOOL)a4
{
  void *v7;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CRLPathSource *v23;
  void *v24;
  CRLConnectionLinePathSource *v25;
  void *v26;
  void *v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  void *v38;
  void *v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  double v60;
  double v61;
  double v62;
  double v63;

  v62 = 0.0;
  v63 = 0.0;
  v60 = 0.0;
  v61 = 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->mClippedBezierPath + 3), "bezierPath"));
  objc_msgSend(v7, "getStartPoint:andEndPoint:", &v60, &v62);

  objc_msgSend(*(id *)((char *)&self->mClippedBezierPath + 3), "getControlKnobPosition:", 12);
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v45 = ty + v63 * d + b * v62;
  v46 = tx + v63 * c + a3->a * v62;
  v43 = ty + d * v61 + b * v60;
  v44 = tx + c * v61 + a3->a * v60;
  v47 = ty + v13 * d + b * v14;
  v48 = tx + v13 * c + a3->a * v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  objc_msgSend(v15, "moveToPoint:", v44, v43);
  objc_msgSend(v15, "lineToPoint:", v48, v47);
  objc_msgSend(v15, "lineToPoint:", v46, v45);
  if (!a4)
  {
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    if (!sub_10005FDF0(v16, v18, CGPointZero.x, CGPointZero.y))
    {
      v20 = -v17;
      v21 = -v19;
      CGAffineTransformMakeTranslation(&v59, v20, v21);
      objc_msgSend(v15, "transformUsingAffineTransform:", &v59);
      v22 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
      CGAffineTransformMakeTranslation(&v58, v20, v21);
      v23 = (CRLPathSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geometryByAppendingTransform:", &v58));
      v24 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
      *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3) = v23;

    }
  }
  v25 = -[CRLConnectionLinePathSource initWithBezierPath:]([CRLConnectionLinePathSource alloc], "initWithBezierPath:", v15);
  -[CRLConnectionLinePathSource setType:](v25, "setType:", objc_msgSend(*(id *)((char *)&self->mClippedBezierPath + 3), "type"));
  objc_storeStrong((id *)((char *)&self->super.mCachedEditableBezierPathSource + 3), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFromInfo](self, "connectedFromInfo"));

  if (!v26)
  {
    BYTE3(self->mAcumulatedDrag.x) = 1;
    v27 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    if (v27)
    {
      objc_msgSend(v27, "transform");
      v28 = v55;
      v29 = v56;
      v30 = v57;
    }
    else
    {
      v30 = 0uLL;
      v28 = 0uLL;
      v29 = 0uLL;
    }
    *(float64x2_t *)((char *)&self->mAcumulatedDrag.y + 3) = vaddq_f64(v30, vmlaq_n_f64(vmulq_n_f64(v29, v43), v28, v44));
  }
  v31 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFromInfo](self, "connectedFromInfo"));
  if (!v31
    || (v32 = (void *)v31,
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedToInfo](self, "connectedToInfo")),
        v33,
        v32,
        !v33))
  {
    BYTE4(self->mAcumulatedDrag.x) = 1;
    v34 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    if (v34)
    {
      objc_msgSend(v34, "transform");
      v35 = v52;
      v36 = v53;
      v37 = v54;
    }
    else
    {
      v37 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
    }
    *(float64x2_t *)((char *)self->mResizeControlPoints + 3) = vaddq_f64(v37, vmlaq_n_f64(vmulq_n_f64(v36, v47), v35, v48));
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedToInfo](self, "connectedToInfo"));

  if (!v38)
  {
    BYTE5(self->mAcumulatedDrag.x) = 1;
    v39 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    if (v39)
    {
      objc_msgSend(v39, "transform");
      v40 = v49;
      v41 = v50;
      v42 = v51;
    }
    else
    {
      v42 = 0uLL;
      v40 = 0uLL;
      v41 = 0uLL;
    }
    *(float64x2_t *)((char *)&self->mResizeControlPoints[1] + 3) = vaddq_f64(v42, vmlaq_n_f64(vmulq_n_f64(v41, v45), v40, v46));
  }
  -[CRLConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  -[CRLShapeLayout invalidateFrame](self, "invalidateFrame");

}

- (void)takeFreeTransformFromTracker:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLConnectionLineAbstractLayout;
  -[CRLShapeLayout takeFreeTransformFromTracker:](&v3, "takeFreeTransformFromTracker:", a3);
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource"));
  objc_msgSend(v4, "getControlKnobPosition:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  double *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  y = a3.y;
  x = a3.x;
  v23.receiver = self;
  v23.super_class = (Class)CRLConnectionLineAbstractLayout;
  v7 = a4;
  -[CRLShapeLayout dynamicallyMovedSmartShapeKnobTo:withTracker:](&v23, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "transform");
    v11 = *((double *)&v20 + 1);
    v10 = *(double *)&v20;
    v13 = *((double *)&v21 + 1);
    v12 = *(double *)&v21;
    v15 = *((double *)&v22 + 1);
    v14 = *(double *)&v22;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    v15 = 0.0;
    v13 = 0.0;
    v11 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
  }
  v16 = v14 + y * v12 + v10 * x;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knob"));
  v18 = objc_msgSend(v17, "tag");

  if (v18 == (id)10)
  {
    BYTE3(self->mAcumulatedDrag.x) = 1;
    *(double *)((char *)&self->mAcumulatedDrag.y + 3) = v16;
    v19 = (double *)&self->mUseResizePoints[3];
    goto LABEL_10;
  }
  if (v18 == (id)12)
  {
    BYTE4(self->mAcumulatedDrag.x) = 1;
    *(double *)((char *)&self->mResizeControlPoints[0].x + 3) = v16;
    v19 = (double *)((char *)&self->mResizeControlPoints[0].y + 3);
    goto LABEL_10;
  }
  if (v18 == (id)11)
  {
    BYTE5(self->mAcumulatedDrag.x) = 1;
    *(double *)((char *)&self->mResizeControlPoints[1].x + 3) = v16;
    v19 = (double *)((char *)&self->mResizeControlPoints[1].y + 3);
LABEL_10:
    *v19 = v15 + y * v13 + v11 * x;
  }
  -[CRLConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath", v20, v21, v22, v23.receiver, v23.super_class);
  -[CRLConnectionLineAbstractLayout invalidatePosition](self, "invalidatePosition");
}

- (BOOL)shouldAdjustForStrokeWidthForCollabCursor
{
  return 0;
}

- (id)p_infoForConnectingToInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v14 = sub_100221DDC(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLConnectedInfoReplacing);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = v4;
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "infoToConnectToForConnectionLineConnectedToInfo:", v4));

  }
  return v16;
}

- (CGPoint)p_getPositionForMagnet:(unint64_t)a3 forLayout:(id)a4 forEnd:(unint64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  int *v12;
  double *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
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

  v8 = a4;
  v9 = v8;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(v8, "centerForConnecting");
      goto LABEL_12;
    case 2uLL:
      objc_msgSend(v8, "cardinalNorthPosition");
      goto LABEL_12;
    case 3uLL:
      objc_msgSend(v8, "cardinalEastPosition");
      goto LABEL_12;
    case 4uLL:
      objc_msgSend(v8, "cardinalSouthPosition");
      goto LABEL_12;
    case 5uLL:
      objc_msgSend(v8, "cardinalWestPosition");
LABEL_12:
      v18 = v10;
      v17 = v11;
      goto LABEL_22;
    case 6uLL:
    case 7uLL:
      v12 = &OBJC_IVAR___CRLConnectionLineAbstractLayout_mHeadMagnetNormalizedPosition;
      if (a5 == 10)
        v12 = &OBJC_IVAR___CRLConnectionLineAbstractLayout_mTailMagnetNormalizedPosition;
      v13 = (double *)((char *)self + *v12);
      v14 = *v13;
      v15 = v13[1];
      if (a5 == 10)
      {
        v16 = 1533;
      }
      else
      {
        if (a5 != 11)
          goto LABEL_18;
        v16 = 1532;
      }
      if (*((_BYTE *)&self->super.super.super.super.super.super.isa + v16))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry"));
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "fullTransform");
          v21 = v37;
          v22 = v36;
          v23 = v39;
          v24 = v38;
          v25 = v41;
          v26 = v40;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
LABEL_18:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pureGeometry"));
      v20 = v27;
      if (v27)
      {
        objc_msgSend(v27, "fullTransform");
        v21 = v31;
        v22 = v30;
        v23 = v33;
        v24 = v32;
        v25 = v35;
        v26 = v34;
        goto LABEL_21;
      }
LABEL_20:
      v25 = 0.0;
      v23 = 0.0;
      v21 = 0.0;
      v26 = 0.0;
      v24 = 0.0;
      v22 = 0.0;
LABEL_21:
      v18 = v26 + v15 * v24 + v22 * v14;
      v17 = v25 + v15 * v23 + v21 * v14;

LABEL_22:
      v28 = v18;
      v29 = v17;
      result.y = v29;
      result.x = v28;
      return result;
    default:
      v17 = 0.0;
      v18 = 0.0;
      goto LABEL_22;
  }
}

- (CRLCanvasLayout)connectedFrom
{
  return (CRLCanvasLayout *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource
                                                                                   + 3)));
}

- (CRLCanvasLayout)connectedTo
{
  return (CRLCanvasLayout *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry
                                                                                   + 3)));
}

- (CRLCanvasElementInfo)connectedFromInfo
{
  return (CRLCanvasElementInfo *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->mConnectedFrom
                                                                                        + 3)));
}

- (void)setConnectedFromInfo:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mConnectedFrom + 3), a3);
}

- (CRLCanvasElementInfo)connectedToInfo
{
  return (CRLCanvasElementInfo *)objc_loadWeakRetained((id *)((char *)&self->mConnectedTo + 3));
}

- (void)setConnectedToInfo:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mConnectedTo + 3), a3);
}

- (CRLCanvasElementInfo)temporaryConnectedFromInfo
{
  return (CRLCanvasElementInfo *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->mConnectedFromInfo
                                                                                        + 3)));
}

- (CRLCanvasElementInfo)temporaryConnectedToInfo
{
  return (CRLCanvasElementInfo *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->mConnectedToInfo
                                                                                        + 3)));
}

- (BOOL)validLine
{
  return BYTE5(self->mOldConnectedFrom);
}

- (BOOL)useDynamicOutsets
{
  return BYTE3(self->mResizeControlPoints[2].x);
}

- (void)setUseDynamicOutsets:(BOOL)a3
{
  BYTE3(self->mResizeControlPoints[2].x) = a3;
}

- (double)dynamicOutsetFrom
{
  return *(double *)((char *)&self->mResizeControlPoints[2].y + 3);
}

- (void)setDynamicOutsetFrom:(double)a3
{
  *(double *)((char *)&self->mResizeControlPoints[2].y + 3) = a3;
}

- (double)dynamicOutsetTo
{
  return *(double *)(&self->mUseDynamicOutsets + 3);
}

- (void)setDynamicOutsetTo:(double)a3
{
  *(double *)(&self->mUseDynamicOutsets + 3) = a3;
}

- (unint64_t)dynamicOutsetType
{
  return *(_QWORD *)((char *)&self->mDynamicOutsetFrom + 3);
}

- (void)setDynamicOutsetType:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->mDynamicOutsetFrom + 3) = a3;
}

- (unint64_t)headMagnetType
{
  return *(_QWORD *)&self->mDrawClippedTailPortion;
}

- (void)setHeadMagnetType:(unint64_t)a3
{
  *(_QWORD *)&self->mDrawClippedTailPortion = a3;
}

- (unint64_t)tailMagnetType
{
  return *(_QWORD *)&self->mUserDidSetControlPoint;
}

- (void)setTailMagnetType:(unint64_t)a3
{
  *(_QWORD *)&self->mUserDidSetControlPoint = a3;
}

- (CGPoint)headMagnetNormalizedPosition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3);
  v3 = *(double *)((char *)&self->mTailNearestMagnetTypeForRouting + 3);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)tailMagnetNormalizedPosition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3);
  v3 = *(double *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)headMagnetCanvasPosition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->mTailMagnetNormalizedPosition.x + 3);
  v3 = *(double *)((char *)&self->mTailMagnetNormalizedPosition.y + 3);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)tailMagnetCanvasPosition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->mHeadMagnetCanvasPosition.x + 3);
  v3 = *(double *)((char *)&self->mHeadMagnetCanvasPosition.y + 3);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)clipHead
{
  return BYTE3(self->mDynamicOutsetTo);
}

- (void)setClipHead:(BOOL)a3
{
  BYTE3(self->mDynamicOutsetTo) = a3;
}

- (BOOL)clipTail
{
  return BYTE4(self->mDynamicOutsetTo);
}

- (void)setClipTail:(BOOL)a3
{
  BYTE4(self->mDynamicOutsetTo) = a3;
}

- (double)headClipT
{
  return *(double *)((char *)&self->mHeadMagnetType + 3);
}

- (void)setHeadClipT:(double)a3
{
  *(double *)((char *)&self->mHeadMagnetType + 3) = a3;
}

- (double)tailClipT
{
  return *(double *)((char *)&self->mTailMagnetType + 3);
}

- (void)setTailClipT:(double)a3
{
  *(double *)((char *)&self->mTailMagnetType + 3) = a3;
}

- (BOOL)drawClippedHeadPortion
{
  return BYTE5(self->mDynamicOutsetTo);
}

- (void)setDrawClippedHeadPortion:(BOOL)a3
{
  BYTE5(self->mDynamicOutsetTo) = a3;
}

- (BOOL)drawClippedTailPortion
{
  return BYTE6(self->mDynamicOutsetTo);
}

- (void)setDrawClippedTailPortion:(BOOL)a3
{
  BYTE6(self->mDynamicOutsetTo) = a3;
}

- (BOOL)magnetsAdjusted
{
  return HIBYTE(self->mDynamicOutsetTo);
}

- (void)setMagnetsAdjusted:(BOOL)a3
{
  HIBYTE(self->mDynamicOutsetTo) = a3;
}

- (BOOL)headHasHorizontalFlip
{
  return self->mDynamicOutsetType;
}

- (void)setHeadHasHorizontalFlip:(BOOL)a3
{
  LOBYTE(self->mDynamicOutsetType) = a3;
}

- (BOOL)headHasVerticalFlip
{
  return BYTE1(self->mDynamicOutsetType);
}

- (void)setHeadHasVerticalFlip:(BOOL)a3
{
  BYTE1(self->mDynamicOutsetType) = a3;
}

- (BOOL)tailHasHorizontalFlip
{
  return BYTE2(self->mDynamicOutsetType);
}

- (void)setTailHasHorizontalFlip:(BOOL)a3
{
  BYTE2(self->mDynamicOutsetType) = a3;
}

- (BOOL)tailHasVerticalFlip
{
  return BYTE3(self->mDynamicOutsetType);
}

- (void)setTailHasVerticalFlip:(BOOL)a3
{
  BYTE3(self->mDynamicOutsetType) = a3;
}

- (BOOL)overridenHeadMagnetNormalizedPosition
{
  return BYTE4(self->mDynamicOutsetType);
}

- (BOOL)overridenTailMagnetNormalizedPosition
{
  return BYTE5(self->mDynamicOutsetType);
}

- (BOOL)userDidSetControlPoint
{
  return BYTE6(self->mDynamicOutsetType);
}

- (void)setUserDidSetControlPoint:(BOOL)a3
{
  BYTE6(self->mDynamicOutsetType) = a3;
}

- (CRLCanvasLayout)headNearestLayoutForRouting
{
  return (CRLCanvasLayout *)objc_loadWeakRetained((id *)((char *)&self->mHeadClipT + 3));
}

- (void)setHeadNearestLayoutForRouting:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mHeadClipT + 3), a3);
}

- (CRLCanvasLayout)tailNearestLayoutForRouting
{
  return (CRLCanvasLayout *)objc_loadWeakRetained((id *)((char *)&self->mTailClipT + 3));
}

- (void)setTailNearestLayoutForRouting:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mTailClipT + 3), a3);
}

- (unint64_t)headNearestMagnetTypeForRouting
{
  return *(unint64_t *)((char *)&self->mHeadNearestLayoutForRouting + 3);
}

- (void)setHeadNearestMagnetTypeForRouting:(unint64_t)a3
{
  *(CRLCanvasLayout **)((char *)&self->mHeadNearestLayoutForRouting + 3) = (CRLCanvasLayout *)a3;
}

- (unint64_t)tailNearestMagnetTypeForRouting
{
  return *(unint64_t *)((char *)&self->mTailNearestLayoutForRouting + 3);
}

- (void)setTailNearestMagnetTypeForRouting:(unint64_t)a3
{
  *(CRLCanvasLayout **)((char *)&self->mTailNearestLayoutForRouting + 3) = (CRLCanvasLayout *)a3;
}

- (BOOL)controlKnobPositionChangedFromRouting
{
  return HIBYTE(self->mDynamicOutsetType);
}

- (void)setControlKnobPositionChangedFromRouting:(BOOL)a3
{
  HIBYTE(self->mDynamicOutsetType) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->mTailClipT + 3));
  objc_destroyWeak((id *)((char *)&self->mHeadClipT + 3));
  objc_storeStrong((id *)((char *)&self->mCachedToOutsetWrapPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedFromOutsetWrapPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedToOutset + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedFromOutset + 3), 0);
  objc_destroyWeak((id *)((char *)&self->mTemporaryConnectedToInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mTemporaryConnectedFromInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedToInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedFromInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedTo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedFrom + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedInfoGeometry + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedPathSource + 3));
  objc_storeStrong((id *)((char *)&self->mOriginalPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mUnclippedBezierPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mClippedBezierPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3), 0);
  objc_storeStrong((id *)(&self->super.mOkayToSetGeometry + 3), 0);
}

@end
