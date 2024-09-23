@implementation CRLMovieLayout

- (CRLMovieLayout)initWithInfo:(id)a3
{
  CRLMovieLayout *v3;
  CRLMovieLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLMovieLayout;
  v3 = -[CRLMediaLayout initWithInfo:](&v6, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
    -[CRLCanvasLayout invalidateFrame](v3, "invalidateFrame");
  return v4;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (id)layoutGeometryFromInfo
{
  id v3;
  objc_super v4;

  if (*(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3))
    return -[CRLCanvasLayoutGeometry initWithInfoGeometry:]([CRLCanvasLayoutGeometry alloc], "initWithInfoGeometry:", *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3));
  v4.receiver = self;
  v4.super_class = (Class)CRLMovieLayout;
  v3 = -[CRLBoardItemLayout layoutGeometryFromInfo](&v4, "layoutGeometryFromInfo");
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (_TtC8Freeform12CRLMovieItem)movieInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLMovieItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLMovieItem *)v8;
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CGAffineTransform v12;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLMovieLayout;
  -[CRLBoardItemLayout dragBy:](&v13, "dragBy:");
  v6 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012478E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E111FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247908);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieLayout dragBy:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 65, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    v6 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  }
  CGAffineTransformMakeTranslation(&v12, x, y);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByAppendingTransform:", &v12));
  v11 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v10;

}

- (void)takeRotationFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _OWORD v9[3];
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLMovieLayout;
  -[CRLBoardItemLayout takeRotationFromTracker:](&v14, "takeRotationFromTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));

  if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
  {
    v7 = objc_msgSend(v6, "copy");
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
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByAppendingTransform:", v9));
  }
  v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v7;

  -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLMovieLayout;
  v4 = a3;
  -[CRLBoardItemLayout takeSizeFromTracker:](&v8, "takeSizeFromTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self, v8.receiver, v8.super_class));

  v6 = objc_msgSend(v5, "copy");
  v7 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v6;

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _OWORD v9[3];
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLMovieLayout;
  -[CRLBoardItemLayout takeFreeTransformFromTracker:](&v14, "takeFreeTransformFromTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));

  if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
  {
    v7 = objc_msgSend(v6, "copy");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    if (v4)
      objc_msgSend(v4, "freeTransformForLayout:", self);
    else
      memset(v10, 0, sizeof(v10));
    -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v10);
    v9[0] = v11;
    v9[1] = v12;
    v9[2] = v13;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByAppendingTransform:", v9));
  }
  v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v7;

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
  v4.super_class = (Class)CRLMovieLayout;
  -[CRLBoardItemLayout beginDynamicOperationWithRealTimeCommands:](&v4, "beginDynamicOperationWithRealTimeCommands:", a3);
  -[CRLMovieLayout p_createDynamicCopies](self, "p_createDynamicCopies");
}

- (void)endDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMovieLayout;
  -[CRLBoardItemLayout endDynamicOperation](&v3, "endDynamicOperation");
  -[CRLMovieLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");
}

- (id)computeLayoutGeometry
{
  void *v3;
  uint64_t v4;
  CRLCanvasLayoutGeometry *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CRLCanvasLayoutGeometry *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  id v33;
  id v34;
  CGAffineTransform v36;
  _OWORD v37[3];
  _OWORD v38[3];
  CGRect v39;
  CGRect v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo"));
  if (-[CRLCanvasLayout layoutState](self, "layoutState") == 3
    || -[CRLCanvasLayout layoutState](self, "layoutState") == 5)
  {
    v5 = [CRLCanvasLayoutGeometry alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;
    if (v3)
      objc_msgSend(v3, "transform");
    else
      memset(v38, 0, sizeof(v38));
    v11 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v5, "initWithSize:transform:", v38, v8, v10);

    v3 = v11;
  }
  *(_QWORD *)&v12 = objc_opt_class(CRLStroke, v4).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout stroke](self, "stroke", v12));
  v16 = sub_100221D0C(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  *(_QWORD *)&v19 = objc_opt_class(CRLCanvasLayout, v18).n128_u64[0];
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v19));
  v23 = sub_100221D0C(v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (v24)
  {
    objc_msgSend(v3, "size");
    v26 = v25;
    v28 = v27;
    if (v3)
      objc_msgSend(v3, "transform");
    else
      memset(v37, 0, sizeof(v37));
    -[CRLMovieLayout scaleForInlineClampingUnrotatedSize:withTransform:](self, "scaleForInlineClampingUnrotatedSize:withTransform:", v37, v26, v28);
    CGAffineTransformMakeScale(&v36, v29, v29);
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometryByTransformingBy:", &v36));

    v3 = (void *)v30;
  }
  if (v17 && objc_msgSend(v17, "shouldRender"))
  {
    objc_msgSend(v17, "renderedWidth");
    v32 = v31 * 0.5;
    v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometryByOutsettingBy:", v32, v32));
    objc_msgSend(v3, "size");
    v39.origin.x = sub_10005FDDC();
    v40 = CGRectOffset(v39, v32, v32);
  }
  else
  {
    v33 = v3;
    objc_msgSend(v33, "size");
    v40.origin.x = sub_10005FDDC();
  }
  -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  v34 = v33;

  return v34;
}

- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withTransform:(CGAffineTransform *)a4
{
  CRLBezierPathSource *v6;
  __int128 v7;
  double v8;
  double v9;
  _OWORD v11[3];

  v6 = -[CRLBezierPathSource initWithNaturalSize:]([CRLBezierPathSource alloc], "initWithNaturalSize:", a3.width, a3.height);
  v7 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a4->tx;
  -[CRLStyledLayout scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:](self, "scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:", v11, v6);
  v9 = v8;

  return v9;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;

  v3 = a3;
  memset(&v13, 0, sizeof(v13));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "fullTransform");
  else
    memset(&v13, 0, sizeof(v13));

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "transformInRoot");
      else
        memset(&t2, 0, sizeof(t2));
      v10 = v13;
      CGAffineTransformConcat(&v12, &v10, &t2);
      v13 = v12;

    }
  }
  v12 = v13;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  return CGRectApplyAffineTransform(v14, &v12);
}

- (void)p_createDynamicCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (*(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247928);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11290();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247948);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieLayout p_createDynamicCopies]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 185, 0, "expected nil value for '%{public}s'", "_dynamicInfoGeometry");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  v8 = objc_msgSend(v7, "copy");
  v9 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(_QWORD *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v8;

}

- (void)p_destroyDynamicCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247968);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11324();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247988);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieLayout p_destroyDynamicCopies]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 190, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    v3 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  }
  *(CGFloat *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = 0.0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), 0);
}

@end
