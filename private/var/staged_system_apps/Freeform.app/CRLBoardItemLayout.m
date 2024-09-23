@implementation CRLBoardItemLayout

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLBoardItem *)v8;
}

- (id)computeWrapPath
{
  void *v2;
  CRLBezierPath *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "size");
  v3 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)i_wrapPath
{
  void *v3;
  CRLCanvasInfoGeometry *v4;
  void *v5;

  v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  if (!v3)
  {
    v4 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout computeWrapPath](self, "computeWrapPath"));
    v5 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
    *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = v4;

    v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  }
  return v3;
}

- (id)pathForClippingConnectionLines
{
  void *v3;
  void *v4;
  CRLBezierPath *v5;
  void *v6;

  v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout i_wrapPath](self, "i_wrapPath"));
    v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath exteriorOfBezierPath:](CRLBezierPath, "exteriorOfBezierPath:", v4));
    v6 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
    *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = v5;

    v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  }
  return v3;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout invalidate](&v3, "invalidate");
  -[CRLBoardItemLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)invalidateExteriorWrap
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout invalidateExteriorWrap](&v5, "invalidateExteriorWrap");
  v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = 0;

  v4 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = 0;

}

- (id)layoutGeometryFromInfo
{
  id v3;
  objc_super v4;

  if (*(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2))
    return -[CRLCanvasLayoutGeometry initWithInfoGeometry:]([CRLCanvasLayoutGeometry alloc], "initWithInfoGeometry:", *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2));
  v4.receiver = self;
  v4.super_class = (Class)CRLBoardItemLayout;
  v3 = -[CRLCanvasLayout layoutGeometryFromInfo](&v4, "layoutGeometryFromInfo");
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4;
  void *v5;
  CRLCanvasInfoGeometry *v6;
  void *v7;
  _OWORD v8[3];
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout takeRotationFromTracker:](&v13, "takeRotationFromTracker:", v4);
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (v4)
    objc_msgSend(v4, "rotateTransform");
  else
    memset(v9, 0, sizeof(v9));
  -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v9);
  v5 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  v8[0] = v10;
  v8[1] = v11;
  v8[2] = v12;
  v6 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryByAppendingTransform:", v8));
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v6;

  -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  CRLCanvasInfoGeometry *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLBoardItemLayout;
  v4 = a3;
  -[CRLCanvasLayout takeSizeFromTracker:](&v8, "takeSizeFromTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self, v8.receiver, v8.super_class));

  v6 = (CRLCanvasInfoGeometry *)objc_msgSend(v5, "copy");
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v6;

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  void *v5;
  CRLCanvasInfoGeometry *v6;
  void *v7;
  _OWORD v8[3];
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout takeFreeTransformFromTracker:](&v13, "takeFreeTransformFromTracker:", v4);
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (v4)
    objc_msgSend(v4, "freeTransformForLayout:", self);
  else
    memset(v9, 0, sizeof(v9));
  -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v9);
  v5 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  v8[0] = v10;
  v8[1] = v11;
  v8[2] = v12;
  v6 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryByAppendingTransform:", v8));
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v6;

  if (objc_msgSend(v4, "isResizing"))
  {
    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
    -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  }
  else
  {
    -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
  }

}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:](&v4, "beginDynamicOperationWithRealTimeCommands:", a3);
  -[CRLBoardItemLayout p_createDynamicBoardItemCopies](self, "p_createDynamicBoardItemCopies");
}

- (void)endDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout endDynamicOperation](&v3, "endDynamicOperation");
  -[CRLBoardItemLayout p_destroyDynamicBoardItemCopies](self, "p_destroyDynamicBoardItemCopies");
}

- (void)p_createDynamicBoardItemCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLBezierPath *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRLCanvasInfoGeometry *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));

  if (*(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257520);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A084();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257540);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_createDynamicBoardItemCopies]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 159, 0, "expected nil value for '%{public}s'", "_infoGeometryBeforeDynamicOperation");

  }
  v8 = (CRLBezierPath *)objc_msgSend(v4, "copy");
  v9 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2) = v8;

  if (*(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257560);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29FF8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257580);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_createDynamicBoardItemCopies]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 162, 0, "expected nil value for '%{public}s'", "_dynamicInfoGeometry");

  }
  v13 = (CRLCanvasInfoGeometry *)objc_msgSend(v4, "copy");
  v14 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v13;

}

- (void)p_destroyDynamicBoardItemCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012575A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A19C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012575C0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_destroyDynamicBoardItemCopies]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 168, 0, "invalid nil value for '%{public}s'", "_infoGeometryBeforeDynamicOperation");

    v3 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  }
  *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2) = 0;

  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012575E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A110();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257600);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_destroyDynamicBoardItemCopies]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 171, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = 0;

}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLCanvasInfoGeometry *v10;
  void *v11;
  CGAffineTransform v12;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout dragBy:](&v13, "dragBy:");
  v6 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257620);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A228();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257640);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout dragBy:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 186, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    v6 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  }
  CGAffineTransformMakeTranslation(&v12, x, y);
  v10 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByAppendingTransform:", &v12));
  v11 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v10;

  -[CRLBoardItemLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)setGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "isEqual:", v4) & 1) == 0
    && objc_msgSend(v6, "differsInMoreThanTranslationFrom:", v4))
  {
    -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasAbstractLayout setGeometry:](&v7, "setGeometry:", v4);

}

- (void)parentDidChange
{
  objc_super v3;

  -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  v3.receiver = self;
  v3.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout parentDidChange](&v3, "parentDidChange");
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)p_addVisibleGeometriesFromInfo:(id)a3 intoArray:(id)a4 withTransform:(CGAffineTransform *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  __int128 v21;
  void *v22;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutForInfo:childOfLayout:", v8, self));

  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257660);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A2B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257680);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_addVisibleGeometriesFromInfo:intoArray:withTransform:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 219, 0, "invalid nil value for '%{public}s'", "layout");

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "visibleGeometries"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v21 = *(_OWORD *)&a5->c;
        v23[0] = *(_OWORD *)&a5->a;
        v23[1] = v21;
        v23[2] = *(_OWORD *)&a5->tx;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometryByTransformingBy:", v23));
        objc_msgSend(v9, "addObject:", v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

}

- (void)invalidateParentForWrap
{
  if (-[CRLCanvasLayout isBeingManipulated](self, "isBeingManipulated"))
    -[CRLBoardItemLayout invalidateWrap](self, "invalidateWrap");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_infoGeometryBeforeDynamicOperation + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cachedPathForClippingConnectionLines + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cachedWrapPath + 2), 0);
  objc_storeStrong((id *)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2), 0);
}

@end
