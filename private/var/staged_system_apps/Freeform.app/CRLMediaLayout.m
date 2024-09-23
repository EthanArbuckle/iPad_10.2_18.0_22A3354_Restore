@implementation CRLMediaLayout

- (BOOL)supportsRotation
{
  return 0;
}

- (void)processChangedProperty:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLMediaLayout;
  -[CRLCanvasLayout processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 == 15)
  {
    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
    -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
  }
}

- (CRLMediaLayout)initWithInfo:(id)a3
{
  CRLMediaLayout *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLMediaLayout;
  result = -[CRLCanvasLayout initWithInfo:](&v4, "initWithInfo:", a3);
  if (result)
    BYTE3(result->_cachedAlignmentFrame.size.width) |= 1u;
  return result;
}

- (_TtC8Freeform12CRLMediaItem)mediaItem
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLMediaItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLMediaItem *)v8;
}

- (BOOL)isStrokeBeingManipulated
{
  return *(_QWORD *)((char *)&self->_cachedAlignmentFrame.size.height + 3) != 0;
}

- (id)stroke
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)((char *)&self->_cachedAlignmentFrame.size.height + 3);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout mediaItem](self, "mediaItem"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stroke"));

  }
  return v3;
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout mediaItem](self, "mediaItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stroke"));
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = *(void **)((char *)&self->_cachedAlignmentFrame.size.height + 3);
  *(_QWORD *)((char *)&self->_cachedAlignmentFrame.size.height + 3) = v4;

}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)((char *)&self->_cachedAlignmentFrame.size.height + 3), "setWidth:", a3);
  -[CRLMediaLayout processChangedProperty:](self, "processChangedProperty:", 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvas"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repForLayout:", self));
  objc_msgSend(v6, "processChangedProperty:", 15);

}

- (void)dynamicStrokeWidthChangeDidEnd
{
  void *v2;

  v2 = *(void **)((char *)&self->_cachedAlignmentFrame.size.height + 3);
  *(CGFloat *)((char *)&self->_cachedAlignmentFrame.size.height + 3) = 0.0;

}

- (void)setGeometry:(id)a3
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
  uint64_t v14;
  objc_super v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  if ((BYTE3(self->_cachedAlignmentFrame.size.width) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "differsInMoreThanTranslationFrom:", v4) & 1) == 0)
    {
      if (v4)
      {
        objc_msgSend(v4, "transform");
        v8 = *((double *)&v16 + 1);
        v7 = *(double *)&v16;
        v10 = *((double *)&v17 + 1);
        v9 = *(double *)&v17;
        v11 = *((double *)&v18 + 1);
        v12 = *(double *)&v18;
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v16 = 0u;
        v11 = 0.0;
        v10 = 0.0;
        v8 = 0.0;
        v12 = 0.0;
        v9 = 0.0;
        v7 = 0.0;
      }
      objc_msgSend(v6, "transform");
      if ((BYTE3(self->_cachedAlignmentFrame.size.width) & 1) == 0)
      {
        v13 = sub_1000603B8(v12 + CGPointZero.y * v9 + v7 * CGPointZero.x, v11 + CGPointZero.y * v10 + v8 * CGPointZero.x, vaddq_f64((float64x2_t)v15[3], vmlaq_n_f64(vmulq_n_f64((float64x2_t)v15[2], CGPointZero.y), (float64x2_t)v15[1], CGPointZero.x)).f64[0]);
        *(double *)((char *)&self->super.mDynamicOpacity + 3) = sub_1000603D0(*(double *)((char *)&self->super.mDynamicOpacity + 3), *(double *)(&self->super._suppressesShadowsAndReflections+ 3), v13);
        *(_QWORD *)(&self->super._suppressesShadowsAndReflections + 3) = v14;
      }
    }
    else
    {
      -[CRLMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
    }

  }
  v15[0].receiver = self;
  v15[0].super_class = (Class)CRLMediaLayout;
  -[objc_super setGeometry:](v15, "setGeometry:", v4);

}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101248BB0);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLMediaLayout computeAlignmentFrameInRoot:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaLayout.m";
    v32 = 1024;
    v33 = 118;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101248BD0);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v27 = v4;
    v28 = 2114;
    v29 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaLayout computeAlignmentFrameInRoot:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaLayout.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 118, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLMediaLayout computeAlignmentFrameInRoot:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (CGRect)alignmentFrame
{
  CRLMediaLayout *v3;
  objc_class *v4;
  CRLCanvasAbstractLayout *v5;
  NSMutableArray *v6;
  CRLCanvasLayoutGeometry *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if ((BYTE3(self->_cachedAlignmentFrame.size.width) & 1) != 0)
  {
    v3 = (CRLMediaLayout *)((char *)&self->super.mDynamicOpacity + 3);
    -[CRLMediaLayout computeAlignmentFrameInRoot:](self, "computeAlignmentFrameInRoot:", 0);
    v3->super.super.super.super.super.isa = v4;
    v3->super.super.super.super._parent = v5;
    v3->super.super.super.super._children = v6;
    v3->super.super.super.super._geometry = v7;
    BYTE3(self->_cachedAlignmentFrame.size.width) &= ~1u;
  }
  v8 = *(double *)((char *)&self->super.mDynamicOpacity + 3);
  v9 = *(double *)(&self->super._suppressesShadowsAndReflections + 3);
  v10 = *(double *)((char *)&self->_cachedAlignmentFrame.origin.x + 3);
  v11 = *(double *)((char *)&self->_cachedAlignmentFrame.origin.y + 3);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootLayout"));

  if (v5 == v7)
LABEL_4:
    -[CRLMediaLayout alignmentFrame](self, "alignmentFrame");
  else
    -[CRLMediaLayout computeAlignmentFrameInRoot:](self, "computeAlignmentFrameInRoot:", 1);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)invalidateAlignmentFrame
{
  BYTE3(self->_cachedAlignmentFrame.size.width) |= 1u;
  -[CRLBoardItemLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (id)commandToResetToSize:(CGSize)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v8;
  void *v9;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout boardItem](self, "boardItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
  v6 = objc_msgSend(v5, "geometryWithNewBounds:", sub_10005FDDC());
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout boardItem](self, "boardItem"));
  v10 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:](v8, "initWithBoardItem:geometry:", v9, v7);

  return v10;
}

- (id)commandToResetMediaToRawPixelSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout mediaItem](self, "mediaItem"));
  objc_msgSend(v3, "mediaRawPixelSize");
  v5 = v4;
  v7 = v6;

  if (v5 == CGSizeZero.width && v7 == CGSizeZero.height)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout commandToResetToSize:](self, "commandToResetToSize:", v5, v7));
  return v9;
}

- (CGRect)boundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->_mediaInvalidFlags + 3);
  v3 = *(double *)((char *)&self->_dynamicStroke + 3);
  v4 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.x + 3);
  v5 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBoundsForStandardKnobs:(CGRect)a3
{
  *(CGFloat *)((char *)&self->_mediaInvalidFlags + 3) = a3.origin.x;
  *(CRLMutableStroke **)((char *)&self->_dynamicStroke + 3) = *(CRLMutableStroke **)&a3.origin.y;
  *(CGFloat *)((char *)&self->_boundsForStandardKnobs.origin.x + 3) = a3.size.width;
  *(CGFloat *)((char *)&self->_boundsForStandardKnobs.origin.y + 3) = a3.size.height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_cachedAlignmentFrame.size.height + 3), 0);
}

@end
