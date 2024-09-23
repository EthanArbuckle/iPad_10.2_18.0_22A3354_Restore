@implementation CRLShapeRep

- (CRLShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  CRLShapeRep *v7;
  CRLShapeRep *v8;
  void *v9;
  void *v10;
  NSUUID *v11;
  NSUUID *mDownloadObserverIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *mHitTestCache;
  CGSize size;
  __objc2_class *v16;
  void *mHelper;
  CRLShapeRepHelperProtocol *v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLShapeRep;
  v7 = -[CRLCanvasRep initWithLayout:canvas:](&v20, "initWithLayout:canvas:", a3, v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](v7, "shapeInfo"));
    if (v9
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](v8, "shapeLayout")),
          v10,
          v10))
    {
      v11 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      mDownloadObserverIdentifier = v8->mDownloadObserverIdentifier;
      v8->mDownloadObserverIdentifier = v11;

      if (objc_msgSend(v6, "isCanvasInteractive"))
        -[CRLShapeRep p_listenForAssetChangesIfAppropriate](v8, "p_listenForAssetChangesIfAppropriate");
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      mHitTestCache = v8->mHitTestCache;
      v8->mHitTestCache = v13;

      size = CGRectZero.size;
      v8->mLastDynamicInvalidRect.origin = CGRectZero.origin;
      v8->mLastDynamicInvalidRect.size = size;
      v8->mShouldForceRenderableGeometryUpdate = 1;
      v8->mAllowsSimultaneousDrawing = 0;
      if (objc_msgSend(v9, "isFreehandDrawingShape"))
        v16 = CRLShapeRepHelperFreehandDrawing;
      else
        v16 = CRLShapeRepHelperDefault;
      v18 = (CRLShapeRepHelperProtocol *)objc_msgSend([v16 alloc], "initWithShapeRep:", v8);
      mHelper = v8->mHelper;
      v8->mHelper = v18;
    }
    else
    {
      mHelper = v8;
      v8 = 0;
    }

  }
  return v8;
}

- (_TtC8Freeform12CRLShapeItem)shapeInfo
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(_TtC8Freeform12CRLShapeItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (_TtC8Freeform12CRLShapeItem *)v6;
}

- (CRLShapeLayout)shapeLayout
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(CRLShapeLayout, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (CRLShapeLayout *)v6;
}

- (void)setParentRep:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  id v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v26.receiver = self;
  v26.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep setParentRep:](&v26, "setParentRep:", v4);
  if (v5 != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    if (!objc_msgSend(v6, "isCanvasInteractive"))
    {
LABEL_14:

      goto LABEL_15;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v8 = objc_msgSend(v7, "isFreehandDrawingShape");

    if (v8)
    {
      v10 = objc_opt_class(CRLPencilKitInkStroke, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stroke"));
      v13 = sub_100221D0C(v10, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v6)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inkType"));
        v15 = !+[PKInk crl_isSixChannelBlendingUsedByInkType:](PKInk, "crl_isSixChannelBlendingUsedByInkType:", v14);

      }
      else
      {
        v15 = 1;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
      v17 = objc_msgSend(v16, "isTreatedAsFillForFreehandDrawing");

      if (!v15 || v17)
      {
        v19 = (objc_class *)objc_opt_class(CRLFreehandDrawingRep, v18);
        v20 = sub_1002223BC(v19, v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v23 = (objc_class *)objc_opt_class(CRLFreehandDrawingRep, v22);
        v24 = sub_1002223BC(v23, v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if ((v15 & 1) == 0)
        {
          objc_msgSend(v21, "didRemoveSixChannelEnabledChildRep:", self);
          objc_msgSend(v25, "didAddSixChannelEnabledChildRep:", self);
        }
        if (v17)
        {
          objc_msgSend(v21, "didRemoveSixChannelSuppressingChildRep:", self);
          objc_msgSend(v25, "didAddSixChannelSuppressingChildRep:", self);
        }

      }
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (CGRect)frameInUnscaledCanvas
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9[3];
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep frameInUnscaledCanvas](&v10, "frameInUnscaledCanvas");
  v4 = v3;
  v6 = v5;
  if (!self->mFrameInUnscaledCanvasIsValid)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "transformInRoot");
    else
      memset(v9, 0, sizeof(v9));
    objc_msgSend(v8, "shapeFrameWithTransform:", v9);
    self->mFrameInUnscaledCanvasRelativeToSuper = CGRectOffset(v11, -v4, -v6);
    self->mFrameInUnscaledCanvasIsValid = 1;

  }
  return CGRectOffset(self->mFrameInUnscaledCanvasRelativeToSuper, v4, v6);
}

- (CGRect)clipRect
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "isFreehandDrawingShape");

  if (v4)
  {
    -[CRLStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLShapeRep;
    -[CRLStyledRep clipRect](&v9, "clipRect");
  }
  return CGRectInset(*(CGRect *)&v5, -1.0, -1.0);
}

- (BOOL)i_beginApplyOpacity:(CGContext *)a3 forDrawingInOneStep:(BOOL)a4
{
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  void *v14;
  void *v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[CRLShapeRep opacity](self, "opacity");
  if (v7 >= 1.0)
    return 0;
  CGContextSetAlpha(a3, v7);
  if (a4)
    return 0;
  -[CRLCanvasRep i_clipRectRecursive](self, "i_clipRectRecursive");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsNull(v16)
    || (v17.origin.x = x, v17.origin.y = y, v17.size.width = width, v17.size.height = height, CGRectIsInfinite(v17)))
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (CGRectIsNull(v18))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012357A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF69D8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012357C0);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep i_beginApplyOpacity:forDrawingInOneStep:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 273, 0, "Clip rects should never be null.");

    }
    CGContextBeginTransparencyLayer(a3, 0);
  }
  else
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    CGContextBeginTransparencyLayerWithRect(a3, v19, 0);
  }
  return 1;
}

- (void)i_endApplyOpacity:(CGContext *)a3 appliedTransparencyLayer:(BOOL)a4
{
  if (a4)
    CGContextEndTransparencyLayer(a3);
}

- (id)colorBehindLayer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = objc_opt_class(CRLColorFill, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fill"));
  v7 = sub_100221D0C(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 && objc_msgSend(v8, "isOpaque"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color"));
  else
    v9 = 0;

  return v9;
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _BOOL8 v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CCB6C;
    v18[3] = &unk_1012357E8;
    v9 = v6;
    v19 = v9;
    v10 = objc_retainBlock(v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CCB84;
    v16[3] = &unk_1012357E8;
    v17 = v9;
    v11 = objc_retainBlock(v16);
    CGContextSaveGState(a3);
    v12 = -[CRLShapeRep i_beginApplyOpacity:forDrawingInOneStep:](self, "i_beginApplyOpacity:forDrawingInOneStep:", a3, 0);
    v15.receiver = self;
    v15.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](&v15, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v10);
    -[CRLShapeRep i_endApplyOpacity:appliedTransparencyLayer:](self, "i_endApplyOpacity:appliedTransparencyLayer:", a3, v12);
    CGContextRestoreGState(a3);
    v14.receiver = self;
    v14.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](&v14, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v11);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](&v13, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v6);
  }

}

- (void)p_drawChildrenWithoutOpacityInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](&v4, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, a4);
}

- (void)drawInLayerContext:(CGContext *)a3
{
  if (!-[CRLShapeRep p_renderingDestination](self, "p_renderingDestination"))
    -[CRLShapeRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:", a3, 1, 7, 0);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  _BOOL4 v9;
  _BOOL8 v11;
  _BOOL8 v13;
  double v16;
  id v17;

  v9 = a8;
  v11 = a6;
  v13 = a4;
  v17 = a9;
  if (!-[CRLShapeRep isInvisible](self, "isInvisible") || !v11 && (-[CRLShapeRep opacity](self, "opacity"), v16 == 0.0))
    -[CRLShapeRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:", a3, v13, a5, v11);
  if (v9 && (!self->mShadowOnChildrenDisabled || !a7))
  {
    if (v11)
      -[CRLShapeRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](self, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v17);
    else
      -[CRLShapeRep p_drawChildrenWithoutOpacityInContext:keepingChildrenPassingTest:](self, "p_drawChildrenWithoutOpacityInContext:keepingChildrenPassingTest:", a3, v17);
  }

}

- (void)drawInContext:(CGContext *)a3 usingPathOverride:(id)a4 patternOffsetsBySubpathOverride:(id)a5 transparencyLayersBySubpath:(id)a6
{
  -[CRLShapeRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:", a3, 1, 7, 1, a4, a5, a6);
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6
{
  -[CRLShapeRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:", a3, a4, a5, a6, 0, 0, 0);
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9
{
  self->mNeedsDisplay = 0;
  -[CRLShapeRepHelperProtocol drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:](self->mHelper, "drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:", a3, a4, a5, a6, a7, a8);
}

- (CGRect)strokeBoundsWithOptions:(unint64_t)a3 fallbackBounds:(CGRect)a4
{
  void *v5;
  __int128 v6;
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
  double v17;
  double v18;
  _OWORD v19[3];
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v19[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v19[1] = v6;
  v19[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v5, "shapeFrameWithTransform:strokeDrawOptions:", v19, a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)imageOfStroke:(CGRect *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGContext *v17;
  CGImage *Image;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stroke"));

  if (v10 && objc_msgSend(v10, "shouldRender"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    objc_msgSend(v11, "frame");
    x = v14;
    y = v15;
    width = v12;
    height = v13;
    v16 = 0;
    if (v12 > 0.0 && v13 > 0.0)
    {
      v17 = sub_10040FA64(-[CRLShapeRep p_bitmapContextOptionsForDrawingStroke:](self, "p_bitmapContextOptionsForDrawingStroke:", v10) | 8u, v12, v13);
      -[CRLShapeRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:", v17, 0, 7, 0);
      Image = CGBitmapContextCreateImage(v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
      CGContextRelease(v17);
      CGImageRelease(Image);
    }

  }
  else
  {
    v16 = 0;
  }
  a3->origin.x = x;
  a3->origin.y = y;
  a3->size.width = width;
  a3->size.height = height;

  return v16;
}

- (BOOL)isInvisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  double v8;
  void *v10;
  unsigned __int8 v11;

  if (!self->mIsInvisibleCacheValid)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fill"));

    -[CRLShapeRep opacity](self, "opacity");
    v7 = 1;
    if (v8 != 0.0)
    {
      if (v4 && (objc_msgSend(v4, "shouldRender") & 1) != 0)
      {
        v7 = 0;
      }
      else if (v6)
      {
        v7 = objc_msgSend(v6, "isClear");
      }
      else
      {
        v7 = 1;
      }
    }
    self->mIsInvisibleCache = v7;
    self->mIsInvisibleCacheValid = 1;

  }
  if (self->mIsInvisibleCache)
    return 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v11 = objc_msgSend(v10, "isInvisible");

  return v11;
}

- (BOOL)isMoreOptimalToDrawWithOtherShapeRepsIfPossible
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stroke"));

  if (v3)
    v5 = objc_msgSend((id)objc_opt_class(v3, v4), "isMoreOptimalToDrawWithOtherStrokesIfPossible");
  else
    v5 = 0;

  return v5;
}

- (BOOL)canDrawWithOtherShapeRep:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;

  v4 = a3;
  if (!-[CRLShapeRep isPartiallyAnimated](self, "isPartiallyAnimated")
    && (objc_msgSend(v4, "isPartiallyAnimated") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
    if (objc_msgSend(v7, "count"))
    {
      v5 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childReps"));
      v9 = objc_msgSend(v8, "count");

      if (v9)
        goto LABEL_3;
      -[CRLShapeRep opacity](self, "opacity");
      v11 = v10;
      objc_msgSend(v4, "opacity");
      if (v11 != v12 && vabdd_f64(v11, v12) >= fabs(v12 * 0.000000999999997))
        goto LABEL_3;
      -[CRLShapeRep strokeEnd](self, "strokeEnd");
      if (v13 < 1.0)
        goto LABEL_3;
      objc_msgSend(v4, "strokeEnd");
      if (v14 < 1.0)
        goto LABEL_3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeLayout"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fill"));
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fill"));
        v19 = objc_opt_class(NSNull, v18);
        v20 = objc_opt_isKindOfClass(v17, v19) ^ 1;

      }
      else
      {
        v20 = 0;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fill"));
      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fill"));
        v24 = objc_opt_class(NSNull, v23);
        v25 = objc_opt_isKindOfClass(v22, v24) ^ 1;

      }
      else
      {
        v25 = 0;
      }

      if (((v20 | v25) & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stroke"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stroke"));
        v5 = objc_msgSend(v26, "canDrawWithOtherStroke:", v27);

      }
    }

    goto LABEL_4;
  }
LABEL_3:
  v5 = 0;
LABEL_4:

  return v5;
}

- (double)strokeEnd
{
  double result;

  result = 1.0;
  if ((*((_BYTE *)self + 328) & 3) == 1)
    return self->mOverriddenValue;
  return result;
}

- (double)opacity
{
  double v3;
  double v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CRLShapeRep;
  -[CRLStyledRep opacity](&v19, "opacity");
  if ((*((_BYTE *)self + 328) & 3) == 2)
    return self->mOverriddenValue;
  v4 = v3;
  if (-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v6 = objc_msgSend(v5, "isTreatedAsFillForFreehandDrawing");

    if (v6)
    {
      v8 = (objc_class *)objc_opt_class(CRLFreehandDrawingToolFillAndLegacyStroke, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freehandDrawingToolkit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTool"));
      v12 = sub_1002223BC(v8, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

      if (v13)
      {
        objc_msgSend(v13, "actualOpacityValueForOutlineFills");
        v4 = v14;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101235808);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF6A58();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101235828);
        v15 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep opacity]"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 512, 0, "invalid nil value for '%{public}s'", "pathTool");

      }
    }
  }
  return v4;
}

- (BOOL)isPartiallyAnimated
{
  return (*((_BYTE *)self + 328) & 3u) - 1 <= 1 && self->mOverriddenValue < 1.0;
}

- (void)i_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 andStroke:(id)a5 inContext:(CGContext *)a6 useFastDrawing:(BOOL)a7
{
  _BOOL8 v7;
  double x;
  _BOOL4 v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  id v31;

  v7 = a7;
  x = a4.x;
  v10 = a3;
  v31 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v13 = v12;
  if (v10)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "strokeHeadLineEnd"));
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v13, "headLineEndPoint");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v13, "headLineEndAngle");
LABEL_6:
      v24 = v20;
      v25 = sub_1000603D0(v17, v19, x);
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stroke"));
      objc_msgSend(v28, "width");
      objc_msgSend(v15, "scaleForStrokeWidth:");
      v30 = v29;

      objc_msgSend(v31, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v15, a6, v7, v25, v27, v24, v30);
    }
  }
  else
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "strokeTailLineEnd"));
    if (v21)
    {
      v15 = (void *)v21;
      objc_msgSend(v13, "tailLineEndPoint");
      v17 = v22;
      v19 = v23;
      objc_msgSend(v13, "tailLineEndAngle");
      goto LABEL_6;
    }
  }

}

- (BOOL)p_shouldDrawStrokeWide:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "color"));
  if (objc_msgSend(v4, "colorRGBSpace") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v6 = objc_msgSend(v5, "canvasIsWideGamut");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)p_bitmapContextOptionsForDrawingStroke:(id)a3
{
  if (-[CRLShapeRep p_shouldDrawStrokeWide:](self, "p_shouldDrawStrokeWide:", a3))
    return 35;
  else
    return 3;
}

- (_NSRange)i_commitAvailableFreehandDrawingPointsIfPossible
{
  NSRange v3;
  NSUInteger location;
  NSUInteger length;
  NSRange v6;
  _NSRange result;

  v6.location = (NSUInteger)-[CRLShapeRep i_uncommittedFreehandDrawingPointRange](self, "i_uncommittedFreehandDrawingPointRange");
  v3 = NSIntersectionRange(v6, self->mAvailableToCommitPointRange);
  self->mCommittedPointRange = NSUnionRange(self->mCommittedPointRange, v3);
  location = v3.location;
  length = v3.length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)i_brushStrokeFromStroke:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  CRLBrushStroke *v7;
  id v8;
  __CFString **v9;
  __CFString *v10;
  CRLBrushStroke *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  double v18;

  v3 = a3;
  v5 = objc_opt_class(CRLBrushStroke, v4);
  v6 = sub_100221D0C(v5, v3);
  v7 = (CRLBrushStroke *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    v8 = objc_msgSend(v3, "cap");
    v9 = &off_101243D20;
    if (v8 != (id)1)
      v9 = &off_101243D18;
    v10 = *v9;
    v11 = [CRLBrushStroke alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "color"));
    objc_msgSend(v3, "width");
    v14 = v13;
    v15 = objc_msgSend(v3, "cap");
    v16 = objc_msgSend(v3, "join");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pattern"));
    objc_msgSend(v3, "miterLimit");
    v7 = -[CRLBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v11, "initWithName:color:width:cap:join:pattern:miterLimit:", v10, v12, v15, v16, v17, v14, v18);

  }
  return v7;
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  void *v13;

  v3 = a3;
  if (!-[CRLShapeRepHelperProtocol drawsInOneStep](self->mHelper, "drawsInOneStep"))
    return 0;
  v6 = objc_opt_class(CRLImageFill, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fill"));
  v9 = sub_100221D0C(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = v10 == 0;
  if (v10)
    v12 = 1;
  else
    v12 = !v3;
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
    v11 = objc_msgSend(v13, "count") == 0;

  }
  return v11;
}

- (BOOL)shouldShowShadow
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLShapeRep;
  v3 = -[CRLStyledRep shouldShowShadow](&v7, "shouldShowShadow");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v5 = objc_msgSend(v4, "shouldSuppressBackgrounds");

    if ((v5 & 1) != 0)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[CRLShapeRep shadowOnChildrenDisabled](self, "shadowOnChildrenDisabled");
  }
  return v3;
}

- (BOOL)p_shouldUpgradeStrokeForPlayback:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v5 = a3;
  if ((*((_BYTE *)self + 328) & 3) == 1
    && (v6 = objc_opt_class(CRLBrushStroke, v4), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    objc_msgSend(v5, "width");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v10, "viewScale");
    v7 = v9 * v11 < 5.0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)i_strokeForRenderingIncludingPlaybackFromStroke:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (-[CRLShapeRep p_shouldUpgradeStrokeForPlayback:](self, "p_shouldUpgradeStrokeForPlayback:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep i_brushStrokeFromStroke:](self, "i_brushStrokeFromStroke:", v4));

  }
  return v5;
}

- (BOOL)p_isInsidePlayingFreehandDrawing
{
  return (*((_BYTE *)self + 328) & 3) != 0;
}

- (void)setNeedsDisplay
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = objc_msgSend(v3, "i_isInsideResizingFreehandDrawing");

  if (!-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn") && (v4 & 1) == 0)
    -[CRLShapeRep p_forceSetNeedsDisplay](self, "p_forceSetNeedsDisplay");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn"))
    -[CRLShapeRep p_forceSetNeedsDisplayInRect:](self, "p_forceSetNeedsDisplayInRect:", x, y, width, height);
}

- (void)p_forceSetNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRep;
  -[CRLStyledRep setNeedsDisplay](&v3, "setNeedsDisplay");
  self->mNeedsDisplay = 1;
}

- (void)p_forceSetNeedsDisplayInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  objc_super v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep setNeedsDisplayInRect:](&v8, "setNeedsDisplayInRect:");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  if (!CGRectIsEmpty(v9))
    self->mNeedsDisplay = 1;
}

- (CGRect)p_layerFrameInScaledCanvasForDirectlyManagedLayer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;

  v3 = a3;
  if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated") || !v3)
  {
    v44.receiver = self;
    v44.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep layerFrameInScaledCanvas](&v44, "layerFrameInScaledCanvas");
    v16 = v23;
    v18 = v24;
    v20 = v25;
    v22 = v26;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    -[CRLShapeRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    objc_msgSend(v5, "convertUnscaledToBoundsRect:");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v14, "contentsScale");
    v16 = sub_100063400(v7, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;

  }
  if (-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn"))
  {
    -[CRLShapeRep p_scaledCanvasScrollViewBounds](self, "p_scaledCanvasScrollViewBounds");
    v48.origin.x = v27;
    v48.origin.y = v28;
    v48.size.width = v29;
    v48.size.height = v30;
    v45.origin.x = v16;
    v45.origin.y = v18;
    v45.size.width = v20;
    v45.size.height = v22;
    v46 = CGRectUnion(v45, v48);
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v35, "contentsScale");
    v16 = sub_100063400(x, y, width, height, v36);
    v18 = v37;
    v20 = v38;
    v22 = v39;

  }
  v40 = v16;
  v41 = v18;
  v42 = v20;
  v43 = v22;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (CGRect)layerFrameInScaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLShapeRep p_layerFrameInScaledCanvasForDirectlyManagedLayer:](self, "p_layerFrameInScaledCanvasForDirectlyManagedLayer:", -[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep layerFrameInScaledCanvasRelativeToParent](&v15, "layerFrameInScaledCanvasRelativeToParent");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[CRLShapeRep isInvisible](self, "isInvisible") && sub_1000637C8())
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)skipsRerenderForTranslation
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasController"));
  v5 = objc_msgSend(v4, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    v8 = objc_opt_class(CRLFreehandDrawingRep, v7);
    isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  CRLBezierPath *mCachedWrapPathInRoot;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep layoutInRootChangedFrom:to:translatedOnly:](&v8, "layoutInRootChangedFrom:to:translatedOnly:", a3, a4);
  if (!a5)
    self->mFrameInUnscaledCanvasIsValid = 0;
  mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  self->mCachedWrapPathInRoot = 0;

}

- (unint64_t)p_renderingDestination
{
  void *v3;
  void *v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v26;
  double v27;

  if ((-[CRLShapeRepHelperProtocol hasLegacyFreehandDrawingBrushStroke](self->mHelper, "hasLegacyFreehandDrawingBrushStroke") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));
    v5 = -[CRLShapeRep p_shouldUpgradeStrokeForPlayback:](self, "p_shouldUpgradeStrokeForPlayback:", v4);

    if (!v5)
      return 0;
  }
  -[CRLShapeRep p_layerFrameInScaledCanvasForDirectlyManagedLayer:](self, "p_layerFrameInScaledCanvasForDirectlyManagedLayer:", 1);
  -[CRLShapeRep p_sizeForDirectlyManagedImageFromRenderableSize:](self, "p_sizeForDirectlyManagedImageFromRenderableSize:", v6, v7);
  v9 = v8;
  v11 = v10;
  v12 = +[CRLBrushStroke brushStrokeUsesMetal](CRLBrushStroke, "brushStrokeUsesMetal");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
  v14 = v13;
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metalDeviceForScreenWithCanvas"));
    objc_msgSend(v14, "maximumMetalTextureSizeForDevice:", v17);
    v19 = v18;
    v21 = v20;

  }
  else
  {
    objc_msgSend(v13, "maximumHardcodedTextureSize");
    v19 = v22;
    v21 = v23;
  }

  if (v9 > v19 || v11 > v21)
    return 0;
  if (-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn"))
    return 2;
  if (-[CRLShapeRep p_isInsidePlayingFreehandDrawing](self, "p_isInsidePlayingFreehandDrawing"))
  {
    -[CRLShapeRep strokeEnd](self, "strokeEnd");
    if (v26 > 0.0)
    {
      -[CRLShapeRep strokeEnd](self, "strokeEnd");
      if (v27 < 1.0)
        return 2;
    }
  }
  return 1;
}

- (BOOL)directlyManagesLayerContent
{
  _BOOL4 mDirectlyManagesLayerContent;
  _BOOL4 v4;
  void *v6;
  void *v7;
  objc_super v9;

  if (!self->mDirectlyManagesLayerContentCacheValid)
  {
    mDirectlyManagesLayerContent = self->mDirectlyManagesLayerContent;
    if ((char *)-[CRLShapeRep p_renderingDestination](self, "p_renderingDestination") - 1 < (char *)2)
      goto LABEL_9;
    if ((*((_BYTE *)self + 328) & 3) == 2)
    {
      self->mDirectlyManagesLayerContent = 0;
      if (!mDirectlyManagesLayerContent)
        return self->mDirectlyManagesLayerContent;
      goto LABEL_15;
    }
    if (-[CRLShapeRep isInvisible](self, "isInvisible")
      || -[CRLShapeRep p_canApplyStrokeToRenderable](self, "p_canApplyStrokeToRenderable")
      && -[CRLShapeRep p_canApplyFillToRenderable](self, "p_canApplyFillToRenderable"))
    {
LABEL_9:
      v4 = 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)CRLShapeRep;
      v4 = -[CRLCanvasRep directlyManagesLayerContent](&v9, "directlyManagesLayerContent");
    }
    self->mDirectlyManagesLayerContent = v4;
    if (mDirectlyManagesLayerContent && !v4)
    {
LABEL_15:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderableForRep:", self));

      objc_msgSend(v7, "setContents:", 0);
      objc_msgSend(v7, "setBackgroundColor:", 0);
      objc_msgSend(v7, "setBorderColor:", 0);
      objc_msgSend(v7, "setBorderWidth:", 0.0);
      objc_msgSend(v7, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

    }
  }
  return self->mDirectlyManagesLayerContent;
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v4 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentInfo"));
  v6 = sub_100221D0C(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "isNonGroupedChild:", v2) ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)isEditingChildRep
{
  return 0;
}

- (Class)layerClass
{
  objc_class *v3;
  unint64_t v4;
  uint64_t v5;
  __objc2_class **v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  v3 = -[CRLCanvasRep layerClass](&v8, "layerClass");
  v4 = -[CRLShapeRep p_renderingDestination](self, "p_renderingDestination");
  if (v4 == 1)
  {
    v6 = off_1012297B0;
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v6 = off_101229960;
LABEL_5:
    v3 = (objc_class *)objc_opt_class(*v6, v5);
  }
  return v3;
}

- (void)i_forceInvalidateLayerFrame
{
  id v3;

  self->mShouldForceRenderableGeometryUpdate = 1;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (BOOL)p_shouldSkipRenderableRecalculations
{
  _BOOL4 v3;

  v3 = -[CRLShapeRep p_currentlyDrawingSomeOtherShape](self, "p_currentlyDrawingSomeOtherShape");
  if (v3)
    LOBYTE(v3) = !self->mShouldForceRenderableGeometryUpdate && !self->mAllowsSimultaneousDrawing;
  return v3;
}

- (BOOL)p_currentlyDrawingSomeOtherShape
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v5 = objc_opt_class(CRLFreehandDrawingRep, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingToolkit"));
    if (objc_msgSend(v8, "isInDrawingMode")
      && !-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation")
      && objc_msgSend(v7, "isInDynamicOperation")
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTool")),
          v10 = (char *)objc_msgSend(v9, "type"),
          v9,
          (unint64_t)(v10 - 10) <= 0xFFFFFFFFFFFFFFFDLL))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tmCoordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "controllingTM"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tracker"));

      if (v13)
      {
        v15 = objc_opt_class(CRLFreehandDrawingTracker, v14);
        v16 = objc_opt_isKindOfClass(v13, v15);
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

- (CGSize)p_sizeForDirectlyManagedImageFromRenderableSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v5, "contentsScale");
  v7 = sub_1000603DC(width, height, v6);
  v8 = sub_100063090(v7);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)viewScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep viewScaleDidChange](&v3, "viewScaleDidChange");
  self->mShouldForceRenderableGeometryUpdate = 1;
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v4 = a3;
  if (!-[CRLShapeRep p_shouldSkipRenderableRecalculations](self, "p_shouldSkipRenderableRecalculations"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep updateRenderableGeometryFromLayout:](&v7, "updateRenderableGeometryFromLayout:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000CE7B4;
    v6[3] = &unk_10122D110;
    v6[4] = self;
    objc_msgSend(v5, "performBlockAfterLayoutIfNecessary:", v6);

  }
  -[CRLShapeRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");

}

- (void)willUpdateRenderable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  if (self->mDirectlyManagesLayerContentCacheValid)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235848);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6AE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235868);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep willUpdateRenderable:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 921, 0, "didn't clean up");

  }
  -[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent");
  self->mDirectlyManagesLayerContentCacheValid = 1;
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep willUpdateRenderable:](&v8, "willUpdateRenderable:", v4);

}

- (void)didUpdateRenderable:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  double v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  _BOOL4 mNeedsDisplay;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  void *v36;
  CGFloat v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  CRLBrushStrokeLayoutOptions *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  objc_class *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  unsigned int v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  objc_class *v92;
  void *v93;
  id v94;
  void *v95;
  CRLBrushStrokeDirectMetalRenderingContext *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  CRLBrushStrokeDirectMetalRenderingContext *v109;
  void *v110;
  CRLBrushStrokeLayoutOptions *v111;
  id v112;
  _QWORD *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  void *v122;
  void *v123;
  unsigned int v124;
  double v125;
  double v126;
  double v127;
  double v128;
  uint64_t v129;
  const __CFString *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  double v135;
  objc_class *v136;
  void *v137;
  id v138;
  void *v139;
  double v140;
  int v141;
  void *v142;
  void *v143;
  const __CFString *v144;
  void (**v145)(_QWORD);
  id v146;
  CRLBrushStrokeLayoutOptions *v147;
  __int128 v148;
  id v149;
  void *v150;
  unsigned int v151;
  void *v152;
  id v153;
  id v154;
  _QWORD v155[4];
  _QWORD *v156;
  _QWORD v157[5];
  id v158;
  id v159;
  CRLBrushStrokeLayoutOptions *v160;
  id v161;
  double v162;
  double v163;
  CGAffineTransform v164;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v167;
  CGAffineTransform v168;
  objc_super v169;
  void *v170;

  v4 = a3;
  v169.receiver = self;
  v169.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep didUpdateRenderable:](&v169, "didUpdateRenderable:", v4);
  if (!-[CRLShapeRep p_shouldSkipRenderableRecalculations](self, "p_shouldSkipRenderableRecalculations"))
  {
    -[CRLShapeRep opacity](self, "opacity");
    v6 = v5;
    objc_msgSend(v4, "opacity");
    v8 = v7;
    if (v6 != v8)
    {
      *(float *)&v8 = v6;
      objc_msgSend(v4, "setOpacity:", v8);
    }
    if ((*((_BYTE *)self + 328) & 3) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contents"));
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }
    if (!-[CRLShapeRep isInvisible](self, "isInvisible") || v10)
    {
      if (!-[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent")
        && (objc_msgSend(v4, "crl_tilingSafeHasContents") & 1) == 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
        objc_msgSend(v11, "setNeedsDisplayOnLayer:", v12);

      }
    }
    else
    {
      objc_msgSend(v4, "setContents:", 0);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    if (objc_msgSend(v13, "isFreehandDrawingShape"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allReps"));
      v16 = objc_msgSend(v15, "count");

      if ((unint64_t)v16 < 0x5DD)
        goto LABEL_20;
      v18 = objc_opt_class(CRLTilingRenderable, v17);
      v19 = sub_100221D0C(v18, v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v13 = v20;
      if (v20 && (objc_msgSend(v20, "forceTiled") & 1) == 0)
        objc_msgSend(v13, "setForceTiled:", 1);
    }

LABEL_20:
    v152 = v4;
    if (self->mFillChanged)
    {
      v21 = !-[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent");
      if (self->mFillChanged)
      {
        v22 = -[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent");
        goto LABEL_25;
      }
    }
    else
    {
      v21 = 0;
    }
    v22 = 0;
LABEL_25:
    v151 = v21;
    mNeedsDisplay = self->mNeedsDisplay;
    if (-[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent") && !v10)
    {
      self->mNeedsDisplay = 0;
      v24 = -[CRLShapeRep p_renderingDestination](self, "p_renderingDestination");
      if (v24 - 1 <= 1)
      {
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stroke"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep i_strokeForRenderingIncludingPlaybackFromStroke:](self, "i_strokeForRenderingIncludingPlaybackFromStroke:", v27));

        v30 = objc_opt_class(CRLBrushStroke, v29);
        v31 = sub_100221D0C(v30, v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        if (v32)
        {
          if (mNeedsDisplay)
          {
            v148 = *(_OWORD *)&CGAffineTransformIdentity.c;
            *(_OWORD *)&v168.a = *(_OWORD *)&CGAffineTransformIdentity.a;
            *(_OWORD *)&v168.c = v148;
            *(_OWORD *)&v168.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
            objc_msgSend(v33, "contentsScale");
            v35 = v34;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
            objc_msgSend(v36, "contentsScale");
            *(_OWORD *)&v167.a = *(_OWORD *)&v168.a;
            *(_OWORD *)&v167.c = v148;
            *(_OWORD *)&v167.tx = *(_OWORD *)&v168.tx;
            CGAffineTransformScale(&v168, &v167, v35, v37);

            -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
            t2 = v168;
            CGAffineTransformConcat(&v167, &t1, &t2);
            v168 = v167;
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
            objc_msgSend(v38, "pathBounds");
            v40 = v39;
            v42 = v41;

            t2 = v168;
            CGAffineTransformTranslate(&v167, &t2, -v40, -v42);
            v168 = v167;
            v43 = v152;
            objc_msgSend(v152, "frame");
            -[CRLShapeRep p_sizeForDirectlyManagedImageFromRenderableSize:](self, "p_sizeForDirectlyManagedImageFromRenderableSize:", v44, v45);
            if (v46 <= 0.0
              || (v48 = v47, v47 <= 0.0)
              || (v49 = v46, -[CRLShapeRep strokeEnd](self, "strokeEnd"), v50 <= 0.0)
              || -[CRLShapeRep isInvisible](self, "isInvisible") && (*((_BYTE *)self + 328) & 3) == 0)
            {
              if (v25 == 1)
              {
                objc_msgSend(v152, "setContents:", 0);
              }
              else
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012358F0);
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DF6BE4();
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101235910);
                v77 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DE7468(v77);
                v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep didUpdateRenderable:]"));
                v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 1093, 0, "Should only need to clear out images.");

              }
            }
            else
            {
              v149 = objc_msgSend(v32, "copy");
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "pathSource"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bezierPath"));
              v146 = objc_msgSend(v53, "copy");

              v54 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
              if (-[CRLShapeRepHelperProtocol hasLegacyFreehandDrawingBrushStroke](self->mHelper, "hasLegacyFreehandDrawingBrushStroke"))
              {
                v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "dynamicPatternOffsetsBySubpath"));

                if (v56)
                {
                  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dynamicPatternOffsetsBySubpath"));
                  v59 = objc_msgSend(v58, "copy");
                }
                else
                {
                  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
                  objc_msgSend(v57, "strokePatternOffsetDistance");
                  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                  v170 = v58;
                  v59 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v170, 1));
                }
                v80 = v59;
                -[CRLBrushStrokeLayoutOptions setPatternOffsetsBySubpath:](v54, "setPatternOffsetsBySubpath:", v59);

                v43 = v152;
              }
              -[CRLShapeRep strokeEnd](self, "strokeEnd");
              -[CRLBrushStrokeLayoutOptions setStrokeEnd:](v54, "setStrokeEnd:");
              v147 = v54;
              if (v25 == 1)
              {
                v82 = (objc_class *)objc_opt_class(CRLFreehandDrawingRep, v81);
                v83 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
                v84 = sub_1002223BC(v82, v83);
                v85 = (void *)objc_claimAutoreleasedReturnValue(v84);

                if (-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn"))
                  v86 = 0;
                else
                  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "queueForConcurrentlyDrawingChildrenIntoLayersIfSafe"));
                v157[0] = _NSConcreteStackBlock;
                v157[1] = 3221225472;
                v157[2] = sub_1000CF9E8;
                v157[3] = &unk_1012358D0;
                v162 = v49;
                v163 = v48;
                v157[4] = self;
                v158 = v149;
                v164 = v168;
                v110 = v146;
                v159 = v146;
                v160 = v147;
                v112 = v152;
                v161 = v112;
                v113 = objc_retainBlock(v157);
                v114 = v113;
                if (v86)
                {
                  v155[0] = _NSConcreteStackBlock;
                  v155[1] = 3221225472;
                  v155[2] = sub_1000CFAFC;
                  v155[3] = &unk_10122D7E0;
                  v156 = v113;
                  objc_msgSend(v86, "performAsync:", v155);
                  v115 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
                  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "layer"));
                  objc_msgSend(v115, "setNeedsDisplayOnLayer:", v116);

                  v110 = v146;
                }
                else
                {
                  ((void (*)(_QWORD *, _QWORD))v113[2])(v113, 0);
                }

                v98 = v149;
                v111 = v147;
              }
              else
              {
                v87 = -[CRLShapeRep p_shouldDrawStrokeWide:](self, "p_shouldDrawStrokeWide:", v149);
                v88 = sub_1000A6700();
                v90 = objc_claimAutoreleasedReturnValue(v88);
                if (v87)
                  v91 = 115;
                else
                  v91 = 70;
                v92 = (objc_class *)objc_opt_class(CAMetalLayer, v89);
                v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "layer"));
                v94 = sub_1002223BC(v92, v93);
                v86 = (void *)objc_claimAutoreleasedReturnValue(v94);

                objc_msgSend(v86, "setOpaque:", 0);
                objc_msgSend(v86, "setPresentsWithTransaction:", 0);
                objc_msgSend(v86, "setAllowsNextDrawableTimeout:", 0);
                objc_msgSend(v86, "setMaximumDrawableCount:", 3);
                objc_msgSend(v86, "setDevice:", v90);
                objc_msgSend(v86, "setPixelFormat:", v91);
                objc_msgSend(v86, "setColorspace:", 0);
                v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "nextDrawable"));
                v96 = [CRLBrushStrokeDirectMetalRenderingContext alloc];
                v97 = v43;
                v85 = (void *)v90;
                v98 = v149;
                objc_msgSend(v97, "frame");
                v100 = v99;
                v102 = v101;
                v104 = v103;
                v106 = v105;
                v107 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
                objc_msgSend(v107, "contentsScale");
                v167 = v168;
                v109 = -[CRLBrushStrokeDirectMetalRenderingContext initWithMetalDrawable:frame:transform:contentsScale:destinationColorSpaceOverride:metalDeviceOverride:](v96, "initWithMetalDrawable:frame:transform:contentsScale:destinationColorSpaceOverride:metalDeviceOverride:", v95, &v167, 0, v85, v100, v102, v104, v106, v108);

                v110 = v146;
                objc_msgSend(v149, "paintPath:directlyUsingContext:withLayoutOptions:", objc_msgSend(objc_retainAutorelease(v146), "CGPath"), v109, v147);

                v111 = v147;
              }

            }
            self->mCommittedPointRange = self->mAvailableToCommitPointRange;
          }
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101235888);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF6B64();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012358A8);
          v67 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep didUpdateRenderable:]"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v68, v69, 985, 0, "We expect the stroke to be a CRLBrushStroke if drawing into a Metal layer or image.");

        }
        goto LABEL_83;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v60, "viewScale");
      v62 = v61;

      if (-[CRLShapeRep p_canApplyFillToRenderable](self, "p_canApplyFillToRenderable"))
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fill"));

        if (v64)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "fill"));
          objc_msgSend(v66, "applyToRenderable:withScale:", v152, v62);

        }
        else
        {
          objc_msgSend(v152, "setContents:", 0);
          objc_msgSend(v152, "setBackgroundColor:", 0);
        }

      }
      if (-[CRLShapeRep p_canApplyStrokeToRenderable](self, "p_canApplyStrokeToRenderable"))
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "stroke"));

        if (v28)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
          objc_msgSend(v71, "contentsScale");
          v73 = v62 * v72;

          v168.a = 0.0;
          v168.b = 0.0;
          v167.a = 0.0;
          v167.b = 0.0;
          v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
          v153 = 0;
          v154 = 0;
          objc_msgSend(v74, "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v154, &v153, &v168, &v167, v73);
          v75 = v154;
          v76 = v153;

          objc_msgSend(v75, "applyToRepRenderable:withScale:", v152, v62);
        }
        else
        {
          objc_msgSend(v152, "setBorderColor:", 0);
          objc_msgSend(v152, "setBorderWidth:", 0.0);
        }
LABEL_83:

      }
    }
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "freehandDrawingToolkit"));

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "id"));
    v121 = objc_msgSend(v118, "wantsToAnimateForObjectUUID:animation:", v120, CFSTR("CRLFreehandDrawingToolkitAnimationNameOutlineFill"));

    v122 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "id"));
    v124 = objc_msgSend(v118, "wantsToAnimateForObjectUUID:animation:", v123, CFSTR("CRLFreehandDrawingToolkitAnimationNameFloodFill"));

    v4 = v152;
    if ((v121 & 1) == 0 && !v124)
    {
LABEL_103:
      self->mFillChanged = 0;
      self->mDirectlyManagesLayerContentCacheValid = 0;

      goto LABEL_104;
    }
    LODWORD(v126) = 1036831949;
    LODWORD(v125) = 0.25;
    LODWORD(v127) = 0.25;
    LODWORD(v128) = 1.0;
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v125, v126, v127, v128));
    if (((v151 | v22) & 1) != 0)
    {
      if (!v22)
      {
        if (!v151)
        {
          v131 = 0;
          v141 = 0;
          v130 = 0;
          goto LABEL_94;
        }
        v131 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
        objc_msgSend(v131, "setDuration:", 0.2);
        objc_msgSend(v131, "setTimingFunction:", v150);
        objc_msgSend(v131, "setType:", kCATransitionFade);
        v130 = CFSTR("contents");
LABEL_93:
        v141 = 1;
LABEL_94:
        v142 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "id"));
        if (v121)
          v144 = CFSTR("CRLFreehandDrawingToolkitAnimationNameOutlineFill");
        else
          v144 = CFSTR("CRLFreehandDrawingToolkitAnimationNameFloodFill");
        v145 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "animationCompletionHandlerForObjectUUID:animation:", v143, v144));

        if (v131 && v141)
        {
          +[CATransaction begin](CATransaction, "begin");
          v4 = v152;
          objc_msgSend(v152, "addAnimation:forKey:", v131, v130);
          +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v145);
          +[CATransaction commit](CATransaction, "commit");
        }
        else
        {
          v4 = v152;
          if (v145)
            v145[2](v145);
        }

        goto LABEL_103;
      }
      v130 = CFSTR("backgroundColor");
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("backgroundColor")));
      objc_msgSend(v131, "setDuration:", 0.2);
      objc_msgSend(v131, "setTimingFunction:", v150);
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "presentationRenderable"));
      v133 = objc_msgSend(v132, "backgroundColor");
      v134 = v131;
    }
    else
    {
      v135 = 0.0;
      if (v121)
      {
        v136 = (objc_class *)objc_opt_class(CRLFreehandDrawingToolFillAndLegacyStroke, v129);
        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "currentTool"));
        v138 = sub_1002223BC(v136, v137);
        v139 = (void *)objc_claimAutoreleasedReturnValue(v138);

        objc_msgSend(v139, "actualOpacityValueForOutlineFills");
        v135 = v140;

      }
      v130 = CFSTR("opacity");
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
      objc_msgSend(v131, "setDuration:", 0.2);
      objc_msgSend(v131, "setTimingFunction:", v150);
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v135));
      v134 = v131;
      v133 = v132;
    }
    objc_msgSend(v134, "setFromValue:", v133);

    goto LABEL_93;
  }
  self->mDirectlyManagesLayerContentCacheValid = 0;
LABEL_104:

}

- (BOOL)shouldHitTestWithFill
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  double v12;
  void *v13;
  void *v14;
  double v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  if (!objc_msgSend(v3, "isFreehandDrawingShape"))
  {
    v11 = 1;
LABEL_14:

    return v11;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isInDrawingMode");

  if (v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fill"));
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "isClear") ^ 1;
    else
      v10 = 0;
    -[CRLShapeRep opacity](self, "opacity");
    v11 = 1;
    if (v12 != 0.0 && (v10 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));
      if (objc_msgSend(v13, "shouldRender"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "color"));
        objc_msgSend(v14, "alphaComponent");
        v11 = v15 <= 0.0;

      }
    }

    goto LABEL_14;
  }
  return 1;
}

- (void)p_invalidateHitTestCache
{
  -[NSMutableDictionary removeAllObjects](self->mHitTestCache, "removeAllObjects");
}

- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4 withPrecision:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a4.x, a4.y));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v8, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mHitTestCache, "objectForKey:", v10));
  v12 = v11;
  if (v11)
    *a3 = objc_msgSend(v11, "BOOLValue");

  return v12 != 0;
}

- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4 withPrecision:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  NSMutableDictionary *mHitTestCache;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a4.x, a4.y));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v8, v9));

  mHitTestCache = self->mHitTestCache;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  -[NSMutableDictionary setObject:forKey:](mHitTestCache, "setObject:forKey:", v11, v12);

}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  CGContext *v19;
  _BYTE *Data;
  double v21;
  double v22;
  void *v23;
  char v24;
  void *v25;
  CRLStroke *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CRLStroke *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  double v38;
  _BYTE *v40;
  id v41;
  char v42;
  CGPoint v43;
  CGRect v44;
  CGRect v45;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v42 = 0;
  if (!-[CRLShapeRep p_hitCacheGetCachedValue:forPoint:withPrecision:](self, "p_hitCacheGetCachedValue:forPoint:withPrecision:", &v42, a4))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v11 = v10;
    v12 = (double *)&unk_100EF02E0;
    if (!v4)
      v12 = (double *)&qword_100EF02D8;
    v13 = *v12;
    objc_msgSend(v10, "viewScale");
    v15 = v13 / v14;
    -[CRLCanvasRep naturalBounds](self, "naturalBounds");
    v45 = CGRectInset(v44, -v15, -v15);
    v43.x = x;
    v43.y = y;
    if (!CGRectContainsPoint(v45, v43))
    {
      v8 = 0;
LABEL_38:
      -[CRLShapeRep p_hitCacheSetCachedValue:forPoint:withPrecision:](self, "p_hitCacheSetCachedValue:forPoint:withPrecision:", v8, v4, x, y);

      return v8;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path")));
    v18 = objc_msgSend(v17, "CGPath");

    if (!v18)
    {
LABEL_37:

      v8 = (_DWORD)v18 != 0;
      goto LABEL_38;
    }
    v19 = sub_10040FA64(19, 1.0, 1.0);
    Data = CGBitmapContextGetData(v19);
    objc_msgSend(v9, "pathBounds");
    CGContextTranslateCTM(v19, -v21, -v22);
    CGContextTranslateCTM(v19, -x, -y);
    if ((objc_msgSend(v9, "pathIsLineSegment") & 1) == 0
      && (-[CRLShapeRep shouldHitTestWithFill](self, "shouldHitTestWithFill")
       || objc_msgSend(v11, "i_shouldIgnoreClickThrough")))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      objc_msgSend(v23, "paintPath:inContext:", v18, v19);

      if (*Data)
      {
        LODWORD(v18) = 1;
LABEL_36:
        CGContextRelease(v19);
        goto LABEL_37;
      }
      v41 = v18;
      v24 = 0;
    }
    else
    {
      v41 = v18;
      v24 = 1;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v26 = (CRLStroke *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stroke"));

    if ((v24 & 1) == 0 && !-[CRLStroke shouldRender](v26, "shouldRender"))
    {
      -[CRLCanvasRep naturalBounds](self, "naturalBounds");
      if (v27 >= 1.0)
      {
        -[CRLCanvasRep naturalBounds](self, "naturalBounds");
        if (v28 >= 1.0)
          goto LABEL_31;
      }
    }
    if (!v26)
      v26 = objc_alloc_init(CRLStroke);
    -[CRLStroke width](v26, "width");
    if (v15 < v29)
      v15 = v29;
    if (-[CRLStroke drawsOutsideStrokeBounds](v26, "drawsOutsideStrokeBounds"))
    {
      -[CRLStroke width](v26, "width");
      if (v30 >= v15)
      {
LABEL_27:
        LODWORD(v18) = 1;
        -[CRLStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](v26, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", v41, 0, v19, 1, 0, 0);
        if (*Data)
          goto LABEL_35;
        if (objc_msgSend(v9, "pathIsOpen"))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "headLineEnd"));
          if (v37)
          {

LABEL_34:
            v18 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
            CGContextSetStrokeColorWithColor(v19, (CGColorRef)objc_msgSend(v18, "CGColor"));

            v38 = CGPointZero.y;
            -[CRLShapeRep i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 1, v26, v19, 1, CGPointZero.x, v38);
            -[CRLShapeRep i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 0, v26, v19, 1, CGPointZero.x, v38);
            LODWORD(v18) = *Data != 0;
            goto LABEL_35;
          }
          v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tailLineEnd"));

          if (v18)
            goto LABEL_34;
LABEL_35:

          goto LABEL_36;
        }
LABEL_31:
        LODWORD(v18) = 0;
        goto LABEL_35;
      }
      v40 = Data;
      v31 = (CRLStroke *)-[CRLStroke mutableCopy](v26, "mutableCopy");
      -[CRLStroke setWidth:](v31, "setWidth:", v15);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      -[CRLStroke setColor:](v31, "setColor:", v32);
    }
    else
    {
      v40 = Data;
      v33 = objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      v34 = v16;
      v35 = -[CRLStroke join](v26, "join");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
      v36 = v35;
      v16 = v34;
      v31 = (CRLStroke *)objc_claimAutoreleasedReturnValue(+[CRLStroke strokeWithColor:width:cap:join:pattern:](CRLStroke, "strokeWithColor:width:cap:join:pattern:", v33, 1, v36, v32, v15));

      v26 = (CRLStroke *)v33;
    }

    v26 = v31;
    Data = v40;
    goto LABEL_27;
  }
  LOBYTE(v8) = v42 != 0;
  return v8;
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stroke"));

  if (v3)
    v4 = objc_msgSend(v3, "shouldRender") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  CGPoint v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stroke"));

  if (v9)
  {
    objc_msgSend(v9, "width");
    v11 = v10 * 0.5;
  }
  else
  {
    v11 = 1.0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v12, "viewScale");
  v14 = 6.0 / v13;

  if (v14 >= v11)
    v11 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometry"));
  objc_msgSend(v16, "size");
  v33.origin.x = sub_10005FDDC();
  v34 = CGRectInset(v33, -v11, -v11);
  v17 = v34.origin.x;
  v18 = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;

  v35.origin.x = v17;
  v35.origin.y = v18;
  v35.size.width = width;
  v35.size.height = height;
  v32.x = x;
  v32.y = y;
  if (CGRectContainsPoint(v35, v32))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    objc_msgSend(v21, "pathBounds");
    v23 = v22;

    v24 = sub_1000603D0(x, y, v23);
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
    objc_msgSend(v28, "distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:", 0, 0, 0, v24, v26, v11);
    v30 = v29;

    if (a4 && v30 <= v11)
      *a4 = 1;
  }
  else
  {
    v30 = 3.40282347e38;
  }

  return v30;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  _BOOL4 v13;
  CRLBezierPath *mCachedWrapPathInRoot;
  void *v15;
  void *v16;
  CRLBezierPath *v17;
  CRLBezierPath *v18;
  CRLBezierPath *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v8, "frameInRoot");
  v27.origin.x = v9;
  v27.origin.y = v10;
  v27.size.width = v11;
  v27.size.height = v12;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v13 = CGRectIntersectsRect(v26, v27);

  if (!v13)
    return 0;
  mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  if (!mCachedWrapPathInRoot)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "i_wrapPath"));
    v17 = (CRLBezierPath *)objc_msgSend(v16, "copy");
    v18 = self->mCachedWrapPathInRoot;
    self->mCachedWrapPathInRoot = v17;

    v19 = self->mCachedWrapPathInRoot;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "transformInRoot");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }
    -[CRLBezierPath transformUsingAffineTransform:](v19, "transformUsingAffineTransform:", &v23);

    mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  }
  return -[CRLBezierPath intersectsRect:hasFill:](mCachedWrapPathInRoot, "intersectsRect:hasFill:", -[CRLShapeRep shouldHitTestWithFill](self, "shouldHitTestWithFill", v23, v24, v25), x, y, width, height);
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLShapeRep;
  -[CRLStyledRep processChangedProperty:](&v7, "processChangedProperty:");
  if (a3 <= 0x16 && ((1 << a3) & 0x798000) != 0)
  {
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v5, "canvasInvalidatedForRep:", self);

    switch(a3)
    {
      case 0xFuLL:
        self->mIsInvisibleCacheValid = 0;
        -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
        v6 = 248;
        goto LABEL_8;
      case 0x13uLL:
      case 0x15uLL:
      case 0x16uLL:
        -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
        self->mFrameInUnscaledCanvasIsValid = 0;
        if (a3 == 19)
          -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
        break;
      case 0x14uLL:
        -[CRLShapeRep p_listenForAssetChangesIfAppropriate](self, "p_listenForAssetChangesIfAppropriate");
        self->mFillChanged = 1;
        v6 = 379;
LABEL_8:
        *((_BYTE *)&self->super.super.super.isa + v6) = 0;
        break;
      default:
        break;
    }
  }
  -[CRLShapeRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

- (CGRect)aliasedAlignmentFrameInLayerFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v5, "contentsScale");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v8, "viewScale");
  objc_msgSend(v4, "aliasedAlignmentFrameForScale:", v7 * v9);
  objc_msgSend(v3, "convertUnscaledToBoundsRect:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[CRLCanvasRep i_layerFrameInScaledCanvasIgnoringDragging](self, "i_layerFrameInScaledCanvasIgnoringDragging");
  v19 = sub_1000603B8(v11, v13, v18);
  v21 = v15;
  v22 = v17;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicOperationDidBeginWithRealTimeCommands:](&v11, "dynamicOperationDidBeginWithRealTimeCommands:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v6 = objc_msgSend(v5, "isFreehandDrawingShape");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smartSelectionManager"));
    objc_msgSend(v10, "dynamicOperationDidBeginWithRealTimeCommands:", v3);

  }
}

- (void)dynamicOperationDidEnd
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicOperationDidEnd](&v9, "dynamicOperationDidEnd");
  -[CRLShapeRepHelperProtocol dynamicOperationDidEnd](self->mHelper, "dynamicOperationDidEnd");
  self->mShouldForceRenderableGeometryUpdate = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "isFreehandDrawingShape");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionManager"));
    objc_msgSend(v8, "dynamicOperationDidEnd");

  }
}

- (void)dynamicDragDidBegin
{
  uint64_t v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  if (!-[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    -[CRLShapeRep aliasedAlignmentFrameInLayerFrame](self, "aliasedAlignmentFrameInLayerFrame");
    self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.x = v4;
    self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.y = v5;
    self->mOriginalAliasedAlignmentFrameInLayerFrame.size.width = v6;
    self->mOriginalAliasedAlignmentFrameInLayerFrame.size.height = v7;
  }
  v8 = objc_opt_class(CRLFreehandDrawingRep, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v11, "beginTrifurcatedRenderForChildRep:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v13 = objc_msgSend(v12, "isFreehandDrawingShape");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "asiOSCVC"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "smartSelectionManager"));
    objc_msgSend(v17, "dynamicDragDidBegin");

  }
  v18.receiver = self;
  v18.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicDragDidBegin](&v18, "dynamicDragDidBegin");

}

- (void)dynamicDragDidEnd
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicDragDidEnd](&v16, "dynamicDragDidEnd");
  v4 = objc_opt_class(CRLFreehandDrawingRep, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v6 = sub_100221D0C(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "endTrifurcatedRenderForChildRep:", self);
  if (!-[CRLShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    -[CRLShapeRep aliasedAlignmentFrameInLayerFrame](self, "aliasedAlignmentFrameInLayerFrame");
    if (!sub_10005FF70(self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.x, self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.y, self->mOriginalAliasedAlignmentFrameInLayerFrame.size.width, self->mOriginalAliasedAlignmentFrameInLayerFrame.size.height, v8, v9, v10, v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "renderableForRep:", self));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      objc_msgSend(v14, "setNeedsDisplayOnLayer:", v15);

    }
  }

}

- (CGRect)targetRectForEditMenu
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  unsigned int v8;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v8 = objc_msgSend(v7, "pathIsLineSegment");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    objc_msgSend(v9, "headPoint");
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    objc_msgSend(v14, "tailPoint");
    v16 = v15;
    v18 = v17;

    if (!-[CRLShapeRep i_editMenuOverlapsEndKnobs](self, "i_editMenuOverlapsEndKnobs"))
    {
      v19 = sub_100061A8C(v11, v13, v16, v18, 0.5);
      x = sub_10005FD98(v19, v20, 1.0);
      y = v21;
      width = v22;
      height = v23;
    }
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)shouldShowSelectionHighlight
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "isFreehandDrawingShape");

  if ((v4 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  if ((objc_msgSend(v5, "pathIsLineSegment") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = objc_msgSend(v6, "usesAlternateDrawableSelectionHighlight");

    if (!v7)
      return 0;
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep p_pathEditor](self, "p_pathEditor"));

  if (v8)
    return 0;
  v10.receiver = self;
  v10.super_class = (Class)CRLShapeRep;
  return -[CRLStyledRep shouldShowSelectionHighlight](&v10, "shouldShowSelectionHighlight");
}

- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = objc_msgSend(v3, "pathIsLineSegment");

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  return -[CRLCanvasRep shouldSuppressSelectionHighlightDuringMultiselection](&v6, "shouldSuppressSelectionHighlightDuringMultiselection");
}

- (BOOL)shouldIgnoreICCSuppressSelectionKnobs
{
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLShapeRep;
  v3 = -[CRLCanvasRep shouldIgnoreICCSuppressSelectionKnobs](&v7, "shouldIgnoreICCSuppressSelectionKnobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v5 = objc_msgSend(v4, "pathIsLineSegment");

  return v5 | v3;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "supportsResize");

  if (!v4 || -[CRLShapeRep isInvisible](self, "isInvisible"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  return -[CRLStyledRep shouldHideSelectionHighlightDueToRectangularPath](&v6, "shouldHideSelectionHighlightDueToRectangularPath");
}

- (id)pathSourceForSelectionHighlightBehavior
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathSource"));

  return v3;
}

- (CGPath)newHighlightPathInScaledSpace
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  id v13;
  CGPath *v14;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform v18;
  CGAffineTransform transform;

  v3 = -[CRLShapeRep i_targetsDropsToStroke](self, "i_targetsDropsToStroke") ^ 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "computeWrapPathClosed:", v3));

  if (!v5 || (uint64_t)objc_msgSend(v5, "elementCount") <= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v6, "boundsForStandardKnobs");
    v7 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));

    v5 = (void *)v7;
  }
  memset(&transform, 0, sizeof(transform));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transformInRoot");
  else
    memset(&transform, 0, sizeof(transform));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v10, "viewScale");
  v12 = v11;

  CGAffineTransformMakeScale(&t2, v12, v12);
  v16 = transform;
  CGAffineTransformConcat(&v18, &v16, &t2);
  transform = v18;
  v13 = objc_retainAutorelease(v5);
  v14 = CGPathCreateCopyByTransformingPath((CGPathRef)objc_msgSend(v13, "CGPath"), &transform);

  return v14;
}

- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v9 = objc_opt_class(CRLFreehandDrawingRep, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v11 = sub_100221D0C(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (objc_msgSend(v12, "wantsToHandleDropForChildWithDragInfo:atUnscaledPoint:", v7, x, y))
  {
    v13 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLShapeRep;
    v14 = -[CRLCanvasRep repToHighlightForDragInfo:atUnscaledPoint:](&v17, "repToHighlightForDragInfo:atUnscaledPoint:", v7, x, y);
    v13 = (id)objc_claimAutoreleasedReturnValue(v14);
  }
  v15 = v13;

  return v15;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLShapeRep;
  v8 = -[CRLCanvasRep dragOperationForDragInfo:atUnscaledPoint:](&v16, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);
  if (!-[CRLCanvasRep isLocked](self, "isLocked"))
  {
    if (objc_msgSend(v7, "canCreateItemsOfClass:", objc_opt_class(CRLColor, v9))
      && objc_msgSend(v7, "numberOfDraggingItems") == (id)1)
    {
      if (!-[CRLShapeRep allowsColorDrop](self, "allowsColorDrop"))
        goto LABEL_8;
      goto LABEL_7;
    }
    v11 = objc_opt_class(CRLFreehandDrawingRep, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    v13 = sub_100221D0C(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    LODWORD(v12) = objc_msgSend(v14, "wantsToHandleDropForChildWithDragInfo:atUnscaledPoint:", v7, x, y);
    if ((_DWORD)v12)
LABEL_7:
      v8 = (unint64_t)objc_msgSend(v7, "dragOperationMask") & 1;
  }
LABEL_8:

  return v8;
}

- (BOOL)i_targetsDropsToStroke
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  if (objc_msgSend(v2, "pathIsOpen"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fill"));
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[5];

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v11 = objc_opt_class(CRLFreehandDrawingRep, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v13 = sub_100221D0C(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (objc_msgSend(v14, "wantsToHandleDropForChildWithDragInfo:atUnscaledPoint:", v9, x, y))
  {
    v15 = objc_msgSend(v14, "handleDragOperation:withDragInfo:atUnscaledPoint:", a3, v9, x, y);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "editingCoordinator"));
    objc_msgSend(v17, "suspendCollaborationWithReason:", CFSTR("CRLShapeDragAndDrop"));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000D143C;
    v21[3] = &unk_101235938;
    v21[4] = self;
    v19 = objc_msgSend(v9, "createItemsOfClass:completion:", objc_opt_class(CRLColor, v18), v21);
    v15 = 1;
  }

  return v15;
}

- (void)p_forDragAndDropSetColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _TtC8Freeform19CRLCommandSetStroke *v11;
  void *v12;
  _TtC8Freeform19CRLCommandSetStroke *v13;
  void *v14;
  _TtC8Freeform19CRLCommandSetStroke *v15;
  void *v16;
  _TtC8Freeform17CRLCommandSetFill *v17;
  void *v18;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235958);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6CE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235978);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep p_forDragAndDropSetColor:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1674, 0, "This operation must only be performed on the main thread.");

  }
  if (v4)
  {
    if (-[CRLShapeRep i_targetsDropsToStroke](self, "i_targetsDropsToStroke"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stroke"));
      v10 = objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "setColor:", v4);
      v11 = [_TtC8Freeform19CRLCommandSetStroke alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
      v13 = -[CRLCommandSetStroke initWithStyledItem:stroke:](v11, "initWithStyledItem:stroke:", v12, v10);
    }
    else
    {
      v17 = [_TtC8Freeform17CRLCommandSetFill alloc];
      v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v4));
      v13 = -[CRLCommandSetFill initWithShapeItem:fill:](v17, "initWithShapeItem:fill:", v10, v12);
    }
    v15 = v13;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandController"));
    objc_msgSend(v18, "enqueueCommand:", v15);

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235998);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6C64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012359B8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep p_forDragAndDropSetColor:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1689, 0, "Unable to drop nil color");
  }

}

- (BOOL)canBeUsedForImageMask
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containingGroup"));
  v11 = objc_msgSend(v10, "isFreehandDrawing");

  if ((v11 & 1) != 0)
    return 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
  if (objc_msgSend(v14, "widthValid"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometry"));
    if (objc_msgSend(v16, "heightValid") && !-[CRLCanvasRep isPlaceholder](self, "isPlaceholder"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
      v19 = (v8 > 0.0) & ~objc_msgSend(v18, "isLineSegment");
      if (v6 > 0.0)
        v12 = v19;
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)shouldShowKnobs
{
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLShapeRep;
  v3 = -[CRLCanvasRep shouldShowKnobs](&v10, "shouldShowKnobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingGroup"));
  v6 = objc_msgSend(v5, "isFreehandDrawing");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingToolkit"));

    if ((objc_msgSend(v8, "isInDrawingMode") & 1) != 0)
      LOBYTE(v3) = 0;
    else
      v3 &= ~-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn");

  }
  return v3;
}

- (unint64_t)enabledKnobMask
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned int v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = objc_msgSend(v3, "pathIsLineSegment");

  if ((v4 & 1) != 0)
    return 3072;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v7 = objc_msgSend(v6, "supportsResize");

  if (!v7)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  return -[CRLCanvasRep enabledKnobMask](&v8, "enabledKnobMask");
}

- (BOOL)p_parentFreehandDrawingIsSelected
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v3 = objc_opt_class(CRLFreehandDrawingEditor, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  v7 = objc_msgSend(v5, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLFreehandDrawingEditor, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_100221D0C(v3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v12 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info"));
  v15 = sub_100221D0C(v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItems"));
    v18 = objc_msgSend(v17, "containsObject:", v16);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)addSelectionKnobsToArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  char *i;
  CRLCanvasKnob *v14;
  CRLCanvasKnob *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  CRLCanvasKnob *v20;
  CRLCanvasKnob *v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  double y;
  uint64_t j;
  CRLCanvasKnob *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  CRLCanvasKnob *v34;
  uint64_t v35;
  double v36;
  CRLCanvasKnob *v37;
  CRLCanvasKnob *v38;
  objc_super v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep p_pathEditor](self, "p_pathEditor"));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "canAddKnobsForRep:", self))
  {
    objc_msgSend(v6, "addKnobsForRep:toArray:", self, v4);
  }
  else
  {
    v7 = -[CRLShapeRep shouldShowSmartShapeKnobs](self, "shouldShowSmartShapeKnobs");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v10 = v8;
    if (v7)
    {
      v11 = (char *)objc_msgSend(v8, "numberOfControlKnobs");
      if (v11)
      {
        v12 = v11;
        for (i = 0; i != v12; ++i)
        {
          v14 = [CRLCanvasKnob alloc];
          objc_msgSend(v10, "getControlKnobPosition:", i + 12);
          v15 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v14, "initWithType:position:radius:tag:onRep:", 0, i + 12, self);
          objc_msgSend(v4, "addObject:", v15);

        }
      }
    }
    else
    {
      v16 = objc_opt_class(CRLCalloutPathSource, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathSource"));
      v18 = sub_100221D0C(v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (v19)
      {
        v20 = [CRLCanvasKnob alloc];
        objc_msgSend(v10, "getControlKnobPosition:", 12);
        v21 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v20, "initWithType:position:radius:tag:onRep:", 0, 12, self);
        objc_msgSend(v4, "addObject:", v21);

      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v23 = objc_msgSend(v22, "pathIsLineSegment");

    if (v23)
    {
      v24 = -[CRLShapeRep enabledKnobMask](self, "enabledKnobMask");
      y = CGPointZero.y;
      for (j = 10; j != 12; ++j)
      {
        if ((sub_100260884(j) & v24) != 0)
        {
          v27 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, j, self, CGPointZero.x, y, 15.0);
          objc_msgSend(v4, "addObject:", v27);

        }
      }
    }
    v39.receiver = self;
    v39.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep addSelectionKnobsToArray:](&v39, "addSelectionKnobsToArray:", v4);
    if (-[CRLShapeRep shouldShowAdvancedGradientKnobs](self, "shouldShowAdvancedGradientKnobs"))
    {
      v29 = objc_opt_class(CRLGradientFill, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "fill"));
      v32 = sub_100221D0C(v29, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

      v34 = [CRLCanvasKnob alloc];
      if (objc_msgSend(v33, "gradientType") == (id)1)
        v35 = 26;
      else
        v35 = 25;
      v36 = CGPointZero.y;
      v37 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v34, "initWithType:position:radius:tag:onRep:", 0, v35, self, CGPointZero.x, v36, 15.0);
      objc_msgSend(v4, "addObject:", v37);
      v38 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, 27, self, CGPointZero.x, v36, 15.0);
      objc_msgSend(v4, "addObject:", v38);

    }
  }

}

- (BOOL)shouldShowAdditionalKnobs
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v7, "viewScale");
  v9 = sub_1000603DC(v4, v6, v8);
  v11 = v10;

  v12 = v9 < 60.0 || v11 < 60.0;
  if (v12 || -[CRLCanvasRep isPlaceholder](self, "isPlaceholder"))
    return 0;
  else
    return !-[CRLCanvasRep isLocked](self, "isLocked");
}

- (BOOL)shouldShowAdvancedGradientKnobs
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "isFreehandDrawingShape");

  if ((v4 & 1) != 0)
    return 0;
  if (-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self, "currentKnobTracker"));
    v9 = objc_opt_class(CRLGradientFillKnobTracker, v8);
    isKindOfClass = objc_opt_isKindOfClass(v7, v9);

    if ((isKindOfClass & 1) == 0)
      return 0;
  }
  v11 = objc_opt_class(CRLGradientFill, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fill"));
  v14 = sub_100221D0C(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15 && objc_msgSend(v15, "isAdvancedGradient") && !-[CRLCanvasRep isLocked](self, "isLocked"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editorController"));
    v20 = objc_msgSend(v18, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLShapeEditor, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (!objc_msgSend(v21, "fillInspectorDisclosed")
      || -[CRLShapeRep isEditingChildRep](self, "isEditingChildRep")
      || (objc_msgSend(v17, "documentIsSharedReadOnly") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
      v23 = v22;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v26, "viewScale");
      v28 = sub_1000603DC(v23, v25, v27);
      v30 = v29;

      v5 = v30 >= 40.0 && v28 >= 40.0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  if (objc_msgSend(v3, "numberOfControlKnobs"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    if ((objc_msgSend(v4, "documentIsSharedReadOnly") & 1) != 0)
      v5 = 0;
    else
      v5 = -[CRLShapeRep shouldShowAdditionalKnobs](self, "shouldShowAdditionalKnobs");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "tag") < 0xC || (unint64_t)objc_msgSend(v4, "tag") >= 0x11)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLShapeRep;
    v5 = -[CRLCanvasRep canUseSpecializedHitRegionForKnob:](&v7, "canUseSpecializedHitRegionForKnob:", v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self, "currentKnobTracker"));
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class(CRLGradientFillKnobTracker, v6))
    && (unint64_t)objc_msgSend(v4, "tag") >= 0x19)
  {
    v7 = objc_msgSend(v4, "tag");

    if ((unint64_t)v7 < 0x1C)
      goto LABEL_7;
  }
  else
  {

  }
  if (objc_msgSend(v4, "tag") != (id)22)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLShapeRep;
    v8 = -[CRLCanvasRep directlyManagesVisibilityOfKnob:](&v10, "directlyManagesVisibilityOfKnob:", v4);
    goto LABEL_9;
  }
LABEL_7:
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  id v64;
  id v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  void *k;
  void *v74;
  id v75;
  double v76;
  double v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  objc_super v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];

  v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep updatePositionsOfKnobs:](&v92, "updatePositionsOfKnobs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep p_pathEditor](self, "p_pathEditor"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "updatePositionsOfKnobs:forRep:", v4, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  if (objc_msgSend(v7, "pathIsLineSegment"))
  {
    objc_msgSend(v7, "pathBounds");
    v9 = v8;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v89 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
          v16 = objc_msgSend(v15, "tag");
          v17 = objc_msgSend(v15, "tag");
          if (v16 == (id)11 || v17 == (id)10)
          {
            if (v16 == (id)11)
              objc_msgSend(v7, "headPoint");
            else
              objc_msgSend(v7, "tailPoint");
            objc_msgSend(v15, "setPosition:", sub_1000603B8(v19, v20, v9));
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      }
      while (v12);
    }

  }
  if (-[CRLShapeRep shouldShowSmartShapeKnobs](self, "shouldShowSmartShapeKnobs")
    || (v22 = objc_opt_class(CRLCalloutPathSource, v21),
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathSource")),
        v24 = sub_100221D0C(v22, v23),
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24),
        v25,
        v23,
        v25))
  {
    -[CRLCanvasRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
    v27 = v26;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v28 = v4;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v85 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j);
          if ((unint64_t)objc_msgSend(v33, "tag") >= 0xC && (unint64_t)objc_msgSend(v33, "tag") <= 0x10)
          {
            objc_msgSend(v7, "getControlKnobPosition:", objc_msgSend(v33, "tag"));
            objc_msgSend(v33, "setPosition:", sub_1000603D0(v34, v35, v27));
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      }
      while (v30);
    }

  }
  if (-[CRLShapeRep shouldShowAdvancedGradientKnobs](self, "shouldShowAdvancedGradientKnobs"))
  {
    v37 = objc_opt_class(CRLGradientFill, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fill"));
    v40 = sub_100221D0C(v37, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    objc_msgSend(v42, "boundsForStandardKnobs");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "path"));
    objc_msgSend(v41, "startPointForPath:andBounds:", v52, v44, v46, v48, v50);
    v54 = v53;
    v56 = v55;

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "path"));
    objc_msgSend(v41, "endPointForPath:andBounds:", v58, v44, v46, v48, v50);
    v60 = v59;
    v62 = v61;

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v63 = v4;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    if (v64)
    {
      v65 = v64;
      v66 = sub_1000603D0(v60, v62, v44);
      v68 = v67;
      v69 = sub_1000603D0(v54, v56, v44);
      v71 = v70;
      v72 = *(_QWORD *)v81;
      do
      {
        for (k = 0; k != v65; k = (char *)k + 1)
        {
          if (*(_QWORD *)v81 != v72)
            objc_enumerationMutation(v63);
          v74 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)k);
          v75 = objc_msgSend(v74, "tag", (_QWORD)v80);
          v76 = v69;
          v77 = v71;
          if (v75 != (id)25)
          {
            v78 = objc_msgSend(v74, "tag", v69, v71);
            v76 = v69;
            v77 = v71;
            if (v78 != (id)26)
            {
              v79 = objc_msgSend(v74, "tag", v69, v71);
              v76 = v66;
              v77 = v68;
              if (v79 != (id)27)
                continue;
            }
          }
          objc_msgSend(v74, "setPosition:", v76, v77);
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v93, 16, v76, v77);
      }
      while (v65);
    }

  }
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if (!v9)
    goto LABEL_9;
  if ((unint64_t)objc_msgSend(v9, "tag") < 0x19 || (unint64_t)objc_msgSend(v9, "tag") > 0x1B)
  {
    if (objc_msgSend(v9, "tag") != (id)10 && objc_msgSend(v9, "tag") != (id)11)
      goto LABEL_9;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resizeCursor"));
  }
  else
  {
    objc_msgSend(v9, "cursorActiveScaledRect");
    v11 = objc_claimAutoreleasedReturnValue(+[CRLCursor moveCursorWithActiveScaledRect:](CRLCursor, "moveCursorWithActiveScaledRect:"));
  }
  v12 = (void *)v11;
  if (!v11)
  {
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)CRLShapeRep;
    v13 = -[CRLStyledRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v15, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (id)newTrackerForKnob:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  _TtC8Freeform33CRLShapeConnectionLineKnobTracker *v17;
  unint64_t v18;
  __objc2_class *v19;
  objc_super v21;

  v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012359D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6D64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012359F8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep newTrackerForKnob:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1968, 0, "invalid nil value for '%{public}s'", "knob");

  }
  v9 = objc_opt_class(_TtC8Freeform21CRLConnectionLineKnob, v4);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep p_pathEditor](self, "p_pathEditor"));
    v13 = objc_opt_class(CRLPathKnob, v12);
    v14 = sub_100221D0C(v13, v5);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)v15;
    if (v11 && v15)
    {
      v17 = (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)objc_msgSend(v11, "newTrackerForKnob:forRep:", v15, self);
    }
    else
    {
      v18 = (unint64_t)objc_msgSend(v5, "tag");
      if (v18 - 12 > 4)
      {
        if ((v18 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
        {
          v19 = CRLShapeLineSegmentKnobTracker;
        }
        else
        {
          if (v18 - 25 > 2)
          {
            v21.receiver = self;
            v21.super_class = (Class)CRLShapeRep;
            v17 = -[CRLCanvasRep newTrackerForKnob:](&v21, "newTrackerForKnob:", v5);
            goto LABEL_23;
          }
          v19 = CRLGradientFillKnobTracker;
        }
      }
      else
      {
        v19 = CRLShapeControlKnobTracker;
      }
      v17 = (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)objc_msgSend([v19 alloc], "initWithRep:knob:", self, v5);
    }
LABEL_23:
    v10 = v17;

    goto LABEL_24;
  }
  v10 = -[CRLShapeConnectionLineKnobTracker initWithRep:knob:]([_TtC8Freeform33CRLShapeConnectionLineKnobTracker alloc], "initWithRep:knob:", self, v5);
LABEL_24:

  return v10;
}

- (BOOL)shouldShowInvisiblePathHighlight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stroke"));
    v7 = objc_msgSend(v6, "shouldRender");

  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fill"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fill"));
    v12 = objc_msgSend(v11, "isClear") ^ 1;

  }
  else
  {
    v12 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v15 = objc_msgSend(v14, "isRectangular");

  if (((v7 | v12) & 1) != 0)
    return 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (!objc_msgSend(v17, "shouldEverShowPathHighlightOnInvisibleShapes")
    || v15 && -[CRLShapeRep shouldShowSelectionHighlight](self, "shouldShowSelectionHighlight"))
  {
    v16 = 0;
  }
  else
  {
    v16 = -[CRLShapeRep selectionIsAppropriateToShowInvisiblePathHighlight](self, "selectionIsAppropriateToShowInvisiblePathHighlight");
  }

  return v16;
}

- (BOOL)selectionIsAppropriateToShowInvisiblePathHighlight
{
  unsigned int v3;
  void *v4;

  if (-[CRLCanvasRep isSelected](self, "isSelected"))
  {
    LOBYTE(v3) = 1;
  }
  else if (-[CRLCanvasRep isBeingDragged](self, "isBeingDragged"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v3 = objc_msgSend(v4, "isInGroup") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)additionalRenderablesOverRenderable
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  CGAffineTransform v28;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v31;
  CGAffineTransform v32;
  id v33;
  id v34;
  CGPoint v35;
  CGPoint v36;
  objc_super v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "isFreehandDrawingShape");

  if ((v4 & 1) != 0)
  {
    v5 = &__NSArray0__struct;
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)CRLShapeRep;
    v6 = -[CRLCanvasRep additionalRenderablesOverRenderable](&v37, "additionalRenderablesOverRenderable");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5 = objc_msgSend(v7, "mutableCopy");

    if (-[CRLShapeRep shouldShowInvisiblePathHighlight](self, "shouldShowInvisiblePathHighlight"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
      objc_msgSend(v8, "setFillColor:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v8, "setDelegate:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.596078431, 0.596078431, 0.596078431, 0.45));
      objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v11, "viewScale");
      v13 = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v14, "contentsScale");
      v16 = v13 * v15;

      v35 = CGPointZero;
      v36 = v35;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStroke strokeWithColor:width:](CRLStroke, "strokeWithColor:width:", v17, 1.0));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v33 = 0;
      v34 = 0;
      objc_msgSend(v19, "aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:", v18, &v34, &v33, &v36, &v35, v16);
      v20 = v34;
      v21 = v33;

      objc_msgSend(v20, "width");
      objc_msgSend(v8, "setLineWidth:");
      objc_msgSend(v21, "boundsIncludingCRLStroke:", v18);
      v24 = sub_1000630F8(v22, v23, v13);
      memset(&v32, 0, sizeof(v32));
      CGAffineTransformMakeTranslation(&v32, -v24, -v25);
      CGAffineTransformMakeScale(&t2, v13, v13);
      t1 = v32;
      CGAffineTransformConcat(&v31, &t1, &t2);
      v32 = v31;
      objc_msgSend(v21, "transformUsingAffineTransform:", &v31);
      v26 = objc_retainAutorelease(v21);
      objc_msgSend(v8, "setPath:", objc_msgSend(v26, "CGPath"));
      memset(&t1, 0, 32);
      memset(&v31, 0, sizeof(v31));
      -[CRLCanvasRep computeDirectLayerFrame:andTransform:](self, "computeDirectLayerFrame:andTransform:", &t1, &v31);

      objc_msgSend(v8, "setFrame:", t1.a, t1.b, t1.c, t1.d);
      v28 = v31;
      objc_msgSend(v8, "setAffineTransform:", &v28);
      objc_msgSend(v5, "addObject:", v8);

    }
  }
  return v5;
}

- (id)overlayRenderables
{
  void *v3;
  NSArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v22;
  void *v23;
  double v24;
  double v25;
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
  double v37;
  double v38;
  CGFloat v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  CGPath *Mutable;
  id v46;
  CGAffineTransform v48;
  CGAffineTransform t2;
  CGAffineTransform v50;
  CGAffineTransform m;
  objc_super v52;

  if (-[CRLShapeRep p_shouldSkipRenderableRecalculations](self, "p_shouldSkipRenderableRecalculations"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderablesFromLayers:](CRLCanvasRenderable, "renderablesFromLayers:", &__NSArray0__struct));
  }
  else
  {
    v52.receiver = self;
    v52.super_class = (Class)CRLShapeRep;
    v4 = -[CRLCanvasRep overlayRenderables](&v52, "overlayRenderables");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (-[CRLShapeRep shouldShowAdvancedGradientKnobs](self, "shouldShowAdvancedGradientKnobs")
      && -[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
      objc_msgSend(v5, "setFillColor:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.8, 0.66));
      objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

      objc_msgSend(v5, "setLineWidth:", 1.0);
      v8 = objc_opt_class(CRLGradientFill, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fill"));
      v11 = sub_100221D0C(v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      objc_msgSend(v13, "boundsForStandardKnobs");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
      objc_msgSend(v12, "startPointForPath:andBounds:", v23, v15, v17, v19, v21);
      v25 = v24;
      v27 = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "path"));
      objc_msgSend(v12, "endPointForPath:andBounds:", v29, v15, v17, v19, v21);
      v31 = v30;
      v33 = v32;

      v34 = sub_1000603D0(v25, v27, v15);
      v36 = v35;
      v37 = sub_1000603D0(v31, v33, v15);
      v39 = v38;
      memset(&m, 0, sizeof(m));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v41 = v40;
      if (v40)
        objc_msgSend(v40, "transformInRoot");
      else
        memset(&m, 0, sizeof(m));

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v42, "viewScale");
      v44 = v43;

      CGAffineTransformMakeScale(&t2, v44, v44);
      v48 = m;
      CGAffineTransformConcat(&v50, &v48, &t2);
      m = v50;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, &m, v34, v36);
      CGPathAddLineToPoint(Mutable, &m, v37, v39);
      objc_msgSend(v5, "setPath:", Mutable);
      v46 = objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v46, "insertObject:atIndex:", v5, 0);

      CGPathRelease(Mutable);
      v3 = v46;
    }
  }
  return v3;
}

- (id)dynamicResizeDidBegin
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  v3 = -[CRLCanvasRep dynamicResizeDidBegin](&v6, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CRLShapeRep p_beginDynamicallyResizingOrMovingLineEnd](self, "p_beginDynamicallyResizingOrMovingLineEnd");
  return v4;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicFreeTransformDidBeginWithTracker:](&v4, "dynamicFreeTransformDidBeginWithTracker:", a3);
  -[CRLShapeRep p_beginDynamicallyResizingOrMovingLineEnd](self, "p_beginDynamicallyResizingOrMovingLineEnd");
}

- (BOOL)shouldSetPathSourceWhenChangingInfoGeometry
{
  return 1;
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _TtC8Freeform15CRLCommandGroup *v16;
  _TtC8Freeform23CRLCommandSetPathSource *v17;
  void *v18;
  void *v19;
  _TtC8Freeform23CRLCommandSetPathSource *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  _TtC8Freeform19CRLCommandSetStroke *v36;
  void *v37;
  _TtC8Freeform19CRLCommandSetStroke *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  float v61;
  double v62;
  float v63;
  double v64;
  void *v65;
  void *v66;
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *v67;
  objc_super v69;

  v6 = a3;
  v69.receiver = self;
  v69.super_class = (Class)CRLShapeRep;
  v7 = a4;
  v8 = -[CRLCanvasRep newCommandToApplyGeometry:toInfo:](&v69, "newCommandToApplyGeometry:toInfo:", v6, v7);
  v10 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLShapeItem, v9);
  v11 = sub_1002223BC(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235A18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6E70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235A38);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep newCommandToApplyGeometry:toInfo:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 2145, 0, "Can't create CRLCommandSetInfoGeometry without a persistable object.");

  }
  v16 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  -[CRLCommandGroup addCommand:](v16, "addCommand:", v8);
  if (-[CRLShapeRep shouldSetPathSourceWhenChangingInfoGeometry](self, "shouldSetPathSourceWhenChangingInfoGeometry"))
  {
    v17 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathSource"));
    v20 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:](v17, "initWithShapeItem:pathSource:", v12, v19);

    -[CRLCommandGroup addCommand:](v16, "addCommand:", v20);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v22 = objc_msgSend(v21, "i_isInsideResizingFreehandDrawing");

  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stroke"));
    v26 = objc_msgSend(v25, "mutableCopy");
    v28 = objc_opt_class(CRLStroke, v27);
    v34 = sub_10022209C(v26, v28, 1, v29, v30, v31, v32, v33, (uint64_t)&OBJC_PROTOCOL___CRLMutableStroke);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    v36 = [_TtC8Freeform19CRLCommandSetStroke alloc];
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v38 = -[CRLCommandSetStroke initWithStyledItem:stroke:](v36, "initWithStyledItem:stroke:", v37, v35);

    -[CRLCommandGroup addCommand:](v16, "addCommand:", v38);
  }
  v39 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v23);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v41 = sub_100221D0C(v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "pencilKitStrokePathCompactData"));
    if (v22 && (objc_msgSend(v42, "isTreatedAsFillForFreehandDrawing") & 1) == 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "geometry"));
      objc_msgSend(v44, "size");
      v46 = v45;
      v48 = v47;

      if (v46 <= 0.0 || v48 <= 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101235A58);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF6DF0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101235A78);
        v49 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep newCommandToApplyGeometry:toInfo:]"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 2173, 0, "CRLFreehandDrawingShapeItem has invalid geometry size.");

      }
      objc_msgSend(v6, "size");
      if (v46 != v52 || v48 != v53)
      {
        if (v46 <= 0.0)
          v54 = 1.0;
        else
          v54 = v46;
        v55 = v52 / v54;
        if (v48 <= 0.0)
          v56 = 1.0;
        else
          v56 = v48;
        v57 = v53 / v56;
        if (v57 <= 0.0)
          v58 = 1.0;
        else
          v58 = v57;
        if (v55 <= 0.0)
          v59 = v58;
        else
          v59 = v55;
        if (v55 <= 0.0)
          v55 = 1.0;
        if (v57 <= 0.0)
          v60 = v55;
        else
          v60 = v57;
        objc_msgSend(v43, "renderScaleX", v55);
        v62 = v59 * v61;
        *(float *)&v62 = v62;
        objc_msgSend(v43, "setRenderScaleX:", v62);
        objc_msgSend(v43, "renderScaleY");
        v64 = v60 * v63;
        *(float *)&v64 = v64;
        objc_msgSend(v43, "setRenderScaleY:", v64);
      }
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "maskPath"));

    v67 = -[CRLCommandSetFreehandDrawingShapeItemPKData initWithFreehandDrawingShapeItem:strokePathCompactData:maskPath:]([_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData alloc], "initWithFreehandDrawingShapeItem:strokePathCompactData:maskPath:", v42, v43, v66);
    -[CRLCommandGroup addCommand:](v16, "addCommand:", v67);

  }
  return v16;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v4, "dynamicResizeDidEndWithTracker:", a3);
  -[CRLShapeRep p_endDynamicallyResizingOrMovingLineEnd](self, "p_endDynamicallyResizingOrMovingLineEnd");
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicFreeTransformDidEndWithTracker:](&v4, "dynamicFreeTransformDidEndWithTracker:", a3);
  -[CRLShapeRep p_endDynamicallyResizingOrMovingLineEnd](self, "p_endDynamicallyResizingOrMovingLineEnd");
}

- (void)setShadowOnChildrenDisabled:(BOOL)a3
{
  if (self->mShadowOnChildrenDisabled != a3)
  {
    self->mShadowOnChildrenDisabled = a3;
    -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
  }
}

- (BOOL)allowsColorDrop
{
  return 1;
}

- (void)invalidateEffectLayersForChildren
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (!self->mShadowOnChildrenDisabled)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fill"));
    v5 = objc_msgSend(v4, "isOpaque");

    if ((v5 & 1) == 0)
      -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
  }
}

- (void)invalidateExteriorWrap
{
  CRLBezierPath *mCachedWrapPathInRoot;

  mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  self->mCachedWrapPathInRoot = 0;

}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  void *v4;
  unsigned int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicallyRotatingWithTracker:](&v6, "dynamicallyRotatingWithTracker:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v5 = objc_msgSend(v4, "isFreehandDrawingShape");

  if (v5)
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicallyResizingWithTracker:](&v4, "dynamicallyResizingWithTracker:", a3);
  -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  void *v4;
  unsigned int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicallyFreeTransformingWithTracker:](&v6, "dynamicallyFreeTransformingWithTracker:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v5 = objc_msgSend(v4, "isFreehandDrawingShape");

  if (v5)
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)dataForUpdateUploadIndicator
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = objc_opt_class(CRLImageFill, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fill"));
  v6 = sub_100221D0C(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageData"));

  if (v8)
  {
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (void)beginEditingWithString:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101235A98);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v9 = (objc_class *)objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLShapeRep beginEditingWithString:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m";
    v33 = 1024;
    v34 = 2272;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101235AB8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep beginEditingWithString:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
  v18 = (objc_class *)objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 2272, 0, "Abstract method not overridden by %{public}@", v20);

  v22 = (objc_class *)objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLShapeRep beginEditingWithString:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (void)beginEditing
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101235AD8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLShapeRep beginEditing]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m";
    v31 = 1024;
    v32 = 2276;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101235AF8);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep beginEditing]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
  v16 = (objc_class *)objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 2276, 0, "Abstract method not overridden by %{public}@", v18);

  v20 = (objc_class *)objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLShapeRep beginEditing]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)canBeginEditing
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;

  v3 = objc_opt_class(_TtC8Freeform12CRLGroupItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentInfo"));
  v6 = sub_100221D0C(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v9 = objc_msgSend(v7, "isNonGroupedChild:", v8);

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "containingGroup"));
  if (!objc_msgSend(v11, "isFreehandDrawing") || v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v12 = objc_msgSend(v13, "pathIsLineSegment") ^ 1;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)isPathEditable
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathSource"));
  v5 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class(CRLEditableBezierPathSource, v4));

  return v5;
}

- (BOOL)canMakePathEditable
{
  return 1;
}

- (CRLEditableBezierPathSource)editablePathSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editablePathSource"));

  return (CRLEditableBezierPathSource *)v3;
}

- (CGAffineTransform)naturalToEditablePathSpaceTransform
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  CGAffineTransform *result;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform t2;
  CGAffineTransform v17;

  -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v6 = v5;
  v8 = v7;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathSource"));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "pathFlipTransform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  CGAffineTransformMakeTranslation(&t2, v6, v8);
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v17, &v15, &t2);
  v14 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  return result;
}

- (id)p_pathEditor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  if (-[CRLShapeRep canMakePathEditable](self, "canMakePathEditable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
    v6 = objc_msgSend(v4, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLPathEditor, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isEditingPath
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep p_pathEditor](self, "p_pathEditor"));
  v3 = v2 != 0;

  return v3;
}

- (void)dynamicMovePathKnobDidBegin
{
  id v3;
  id v4;

  v3 = -[CRLShapeRep dynamicResizeDidBegin](self, "dynamicResizeDidBegin");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v4, "dynamicMovePathKnobDidBegin");

}

- (void)dynamicallyMovedPathKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v9, "dynamicallyMovedPathKnobTo:withTracker:", v7, x, y);

  self->mFrameInUnscaledCanvasIsValid = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutController"));
  objc_msgSend(v8, "validateLayoutWithDependencies:", v9);

  -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)dynamicMovePathKnobDidEndWithTracker:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v4, "dynamicMovePathKnobDidEnd");

  if (!v5
    || (objc_msgSend(v5, "didDrag") & 1) != 0
    || (objc_msgSend(v5, "isCreatingNode") & 1) != 0
    || objc_msgSend(v5, "toggleNodeType"))
  {
    -[CRLShapeRep enqueuePathSourceChanges](self, "enqueuePathSourceChanges");
  }
  -[CRLShapeRep dynamicResizeDidEndWithTracker:](self, "dynamicResizeDidEndWithTracker:", 0);
  -[CRLShapeRep p_endDynamicallyResizingOrMovingLineEnd](self, "p_endDynamicallyResizingOrMovingLineEnd");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");

}

- (id)dynamicMoveLineSegmentDidBegin
{
  id v3;

  v3 = -[CRLShapeRep dynamicResizeDidBegin](self, "dynamicResizeDidBegin");
  return -[CRLShapeRep shapeLayout](self, "shapeLayout");
}

- (void)dynamicallyMovingLineSegmentWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v6, "dynamicallyMovingLineSegmentWithTracker:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutController"));
  objc_msgSend(v5, "validateLayoutWithDependencies:", v6);

  -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)dynamicMoveLineSegmentDidEndWithTracker:(id)a3
{
  _TtC8Freeform23CRLCommandSetPathSource *v4;
  void *v5;
  void *v6;
  void *v7;
  _TtC8Freeform23CRLCommandSetPathSource *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CRLShapeRep dynamicResizeDidEndWithTracker:](self, "dynamicResizeDidEndWithTracker:", 0);
  if (v11 && objc_msgSend(v11, "didDrag"))
  {
    v4 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathSource"));
    v8 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:](v4, "initWithShapeItem:pathSource:", v5, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandController"));
    objc_msgSend(v10, "enqueueCommand:", v8);

  }
  -[CRLShapeRep p_endDynamicallyResizingOrMovingLineEnd](self, "p_endDynamicallyResizingOrMovingLineEnd");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");

}

- (id)dynamicMoveSmartShapeKnobDidBegin
{
  id v3;
  void *v4;

  v3 = -[CRLShapeRep dynamicResizeDidBegin](self, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v4, "dynamicMoveSmartShapeKnobDidBegin");

  return -[CRLShapeRep shapeLayout](self, "shapeLayout");
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v7, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v9, x, y);
  self->mFrameInUnscaledCanvasIsValid = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutController"));
  objc_msgSend(v8, "validateLayoutWithDependencies:", v7);

  if ((objc_opt_respondsToSelector(v9, "isEnqueueingCommandsInRealTime") & 1) != 0
    && objc_msgSend(v9, "isEnqueueingCommandsInRealTime"))
  {
    -[CRLShapeRep enqueuePathSourceChanges](self, "enqueuePathSourceChanges");
  }
  -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)enqueuePathSourceChanges
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
  unsigned __int8 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC8Freeform23CRLCommandSetPathSource *v17;
  void *v18;
  _TtC8Freeform23CRLCommandSetPathSource *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v6, "openGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Move"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v6, "setCurrentGroupActionString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutInfoGeometry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutInfoGeometry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = -[CRLShapeRep newCommandToApplyGeometry:toInfo:](self, "newCommandToApplyGeometry:toInfo:", v9, v4);
    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235B18);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF6EF0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235B38);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep enqueuePathSourceChanges]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 2432, 0, "invalid nil value for '%{public}s'", "cmd");

    }
    objc_msgSend(v6, "enqueueCommand:", v13);

  }
  v17 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));
  v19 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:](v17, "initWithShapeItem:pathSource:", v4, v18);

  objc_msgSend(v6, "enqueueCommand:", v19);
  objc_msgSend(v6, "closeGroup");

}

- (void)dynamicMoveSmartShapeKnobDidEndWithTracker:(id)a3
{
  id v4;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "didDrag"))
    -[CRLShapeRep enqueuePathSourceChanges](self, "enqueuePathSourceChanges");
  -[CRLShapeRep dynamicResizeDidEndWithTracker:](self, "dynamicResizeDidEndWithTracker:", 0);
  -[CRLShapeRep p_endDynamicallyResizingOrMovingLineEnd](self, "p_endDynamicallyResizingOrMovingLineEnd");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");

}

- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4 withCommittedPointRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect *p_mLastDynamicInvalidRect;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  length = a5.length;
  location = a5.location;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v11, "dynamicallySetBezierPathSource:atUnscaledOrigin:", v10, x, y);

  self->mAvailableToCommitPointRange.location = location;
  self->mAvailableToCommitPointRange.length = length;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v12, "invalidateContentLayersForRep:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bezierPath"));
  v14 = -[CRLShapeRep i_uncommittedFreehandDrawingPointRange](self, "i_uncommittedFreehandDrawingPointRange");
  v16 = objc_msgSend(v13, "copyWithPointsInRange:", v14, v15);

  if ((objc_msgSend(v16, "isEmpty") & 1) != 0)
  {
    v17 = CGRectNull.origin.x;
    v18 = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stroke"));
    objc_msgSend(v16, "boundsIncludingCRLStroke:", v22);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stroke"));
    objc_msgSend(v32, "renderedWidth");
    v34 = v33 * -2.0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stroke"));
    objc_msgSend(v36, "renderedWidth");
    v38 = v37 * -2.0;
    v49.origin.x = v24;
    v49.origin.y = v26;
    v49.size.width = v28;
    v49.size.height = v30;
    v50 = CGRectInset(v49, v34, v38);
    v39 = v50.origin.x;
    v40 = v50.origin.y;
    v41 = v50.size.width;
    v42 = v50.size.height;

    CGAffineTransformMakeTranslation(&v48, x, y);
    v51.origin.x = v39;
    v51.origin.y = v40;
    v51.size.width = v41;
    v51.size.height = v42;
    v52 = CGRectApplyAffineTransform(v51, &v48);
    -[CRLCanvasRep convertNaturalRectFromUnscaledCanvas:](self, "convertNaturalRectFromUnscaledCanvas:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    v17 = v43;
    v18 = v44;
    width = v45;
    height = v46;
  }
  p_mLastDynamicInvalidRect = &self->mLastDynamicInvalidRect;
  v55.origin.x = CGRectZero.origin.x;
  v55.origin.y = CGRectZero.origin.y;
  v55.size.width = CGRectZero.size.width;
  v55.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mLastDynamicInvalidRect, v55))
  {
    -[CRLShapeRep p_forceSetNeedsDisplay](self, "p_forceSetNeedsDisplay");
  }
  else
  {
    v56.origin.x = p_mLastDynamicInvalidRect->origin.x;
    v56.origin.y = self->mLastDynamicInvalidRect.origin.y;
    v56.size.width = self->mLastDynamicInvalidRect.size.width;
    v56.size.height = self->mLastDynamicInvalidRect.size.height;
    v53.origin.x = v17;
    v53.origin.y = v18;
    v53.size.width = width;
    v53.size.height = height;
    v54 = CGRectUnion(v53, v56);
    -[CRLShapeRep p_forceSetNeedsDisplayInRect:](self, "p_forceSetNeedsDisplayInRect:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  }
  p_mLastDynamicInvalidRect->origin.x = v17;
  self->mLastDynamicInvalidRect.origin.y = v18;
  self->mLastDynamicInvalidRect.size.width = width;
  self->mLastDynamicInvalidRect.size.height = height;

}

- (void)i_setIsCurrentlyBeingFreehandDrawn:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_isCurrentlyBeingFreehandDrawn != a3)
  {
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v5, "i_setNeedsDisplayIfNeededForAncestorRepOf:", self);

      self->_isCurrentlyBeingFreehandDrawn = a3;
      -[CRLShapeRep p_forceSetNeedsDisplay](self, "p_forceSetNeedsDisplay");
    }
    else
    {
      self->_isCurrentlyBeingFreehandDrawn = 0;
      -[CRLShapeRep p_forceSetNeedsDisplay](self, "p_forceSetNeedsDisplay");
      v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v6, "i_setNeedsDisplayIfNeededForAncestorRepOf:", self);

    }
  }
}

- (_NSRange)i_uncommittedFreehandDrawingPointRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSUInteger length;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  if (!-[CRLShapeRep i_isCurrentlyBeingFreehandDrawn](self, "i_isCurrentlyBeingFreehandDrawn"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235B58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6F7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235B78);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep i_uncommittedFreehandDrawingPointRange]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2558, 0, "Only should be checking the uncommitted point range if we are freehand drawing; it is the freehand drawing cache mechanism.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bezierPath"));
  v9 = objc_msgSend(v8, "elementCount");

  length = self->mCommittedPointRange.length;
  v11 = length + self->mCommittedPointRange.location;
  v12 = (NSUInteger)v9 - length;
  result.length = v12;
  result.location = v11;
  return result;
}

- (CGRect)p_scaledCanvasScrollViewBounds
{
  void *v2;
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "convertRect:toLayer:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)willBeRemoved
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep willBeRemoved](&v9, "willBeRemoved");
  if (!self->mDownloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235B98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6FFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235BB8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep willBeRemoved]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2589, 0, "invalid nil value for '%{public}s'", "mDownloadObserverIdentifier");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "store"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetManager"));
  objc_msgSend(v8, "removeAllDownloadObserversWithIdentifier:", self->mDownloadObserverIdentifier);

}

- (void)p_listenForAssetChangesIfAppropriate
{
  NSUUID *mDownloadObserverIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSUUID *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[6];

  mDownloadObserverIdentifier = self->mDownloadObserverIdentifier;
  if (!mDownloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235BD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7088();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235BF8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep p_listenForAssetChangesIfAppropriate]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 2594, 0, "invalid nil value for '%{public}s'", "mDownloadObserverIdentifier");

    mDownloadObserverIdentifier = self->mDownloadObserverIdentifier;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D5C3C;
  v16[3] = &unk_101235058;
  v16[4] = self;
  v16[5] = mDownloadObserverIdentifier;
  v7 = mDownloadObserverIdentifier;
  v8 = objc_retainBlock(v16);
  v10 = objc_opt_class(CRLImageFill, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fill"));
  v13 = sub_100221D0C(v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageData"));
  ((void (*)(_QWORD *, void *))v8[2])(v8, v15);

}

- (void)p_handleAssetPreparationCompletion
{
  id v3;

  if (!-[CRLCanvasRep hasBeenRemoved](self, "hasBeenRemoved"))
  {
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v3, "invalidateContentLayersForRep:", self);

  }
}

- (void)p_beginDynamicallyResizingOrMovingLineEnd
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));

  if (objc_msgSend(v4, "shouldRender"))
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)p_endDynamicallyResizingOrMovingLineEnd
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));

  if (objc_msgSend(v4, "shouldRender"))
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (BOOL)p_pathIsAxisAlignedRect
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
  v4 = objc_msgSend(v3, "isFreehandDrawingShape");

  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeInfo](self, "shapeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    if (objc_msgSend(v7, "pathIsOpen"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headLineEnd"));
      if (v8)
      {

LABEL_7:
        v5 = 0;
LABEL_18:

        return v5;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tailLineEnd"));

      if (v9)
        goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    if (-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
    {
      if (v7)
      {
        objc_msgSend(v7, "originalTransformInRoot");
LABEL_14:
        if (objc_msgSend(v10, "isRectangular"))
        {
          v12[0] = v13;
          v12[1] = v14;
          v12[2] = v15;
          v5 = sub_1000793E0((double *)v12);
        }
        else
        {
          v5 = 0;
        }

        goto LABEL_18;
      }
    }
    else if (v7)
    {
      objc_msgSend(v7, "transformInRoot");
      goto LABEL_14;
    }
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)p_canApplyStrokeToRenderable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  unsigned int v9;

  if (-[CRLShapeRep p_pathIsAxisAlignedRect](self, "p_pathIsAxisAlignedRect"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fill"));

    if (v6)
    {
      -[CRLShapeRep opacity](self, "opacity");
      v8 = v7 == 1.0;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v8 = 1;
      if (!v4)
        goto LABEL_9;
    }
    if (objc_msgSend(v4, "shouldRender"))
    {
      v9 = objc_msgSend(v4, "canApplyDirectlyToRepRenderable") & v8;
LABEL_10:

      return v9;
    }
LABEL_9:
    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)p_canApplyFillToRenderable
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (!-[CRLShapeRep p_pathIsAxisAlignedRect](self, "p_pathIsAxisAlignedRect"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fill"));

  if (v4 && (objc_msgSend(v4, "isClear") & 1) == 0)
    v5 = objc_msgSend(v4, "canApplyToRenderable");
  else
    v5 = 1;

  return v5;
}

- (CGRect)boundsForCollaboratorCursorRenderable
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
  unsigned int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect result;

  v35.receiver = self;
  v35.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep boundsForCollaboratorCursorRenderable](&v35, "boundsForCollaboratorCursorRenderable");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v12 = objc_msgSend(v11, "shouldAdjustForStrokeWidthForCollabCursor");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
    objc_msgSend(v14, "size");
    v16 = v15;

    if (v16 == 0.0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stroke"));
      objc_msgSend(v18, "width");
      v10 = v19;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stroke"));
      objc_msgSend(v21, "width");
      v6 = v6 + v22 * -0.5;
LABEL_6:

      goto LABEL_7;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geometry"));
    objc_msgSend(v24, "size");
    v26 = v25;

    if (v26 == 0.0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stroke"));
      objc_msgSend(v28, "width");
      v8 = v29;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stroke"));
      objc_msgSend(v21, "width");
      v4 = v4 + v30 * -0.5;
      goto LABEL_6;
    }
  }
LABEL_7:
  v31 = v4;
  v32 = v6;
  v33 = v8;
  v34 = v10;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGPoint v39;
  CGPoint v40;
  CGRect v41;
  CGRect v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  v4 = objc_msgSend(v3, "pathIsLineSegment");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v5, "headPoint");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v10, "tailPoint");
  v13 = sub_100061A8C(v7, v9, v11, v12, 0.5);
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v13, v15);
  objc_msgSend(v17, "convertUnscaledToBoundsPoint:");
  objc_msgSend(v16, "i_approximateScaledFrameOfEditingMenuAtPoint:");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v27, "headPoint");
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  objc_msgSend(v26, "convertUnscaledToBoundsPoint:");
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
  objc_msgSend(v33, "tailPoint");
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  objc_msgSend(v32, "convertUnscaledToBoundsPoint:");
  v35 = v34;
  v37 = v36;

  v41.origin.x = v19;
  v41.origin.y = v21;
  v41.size.width = v23;
  v41.size.height = v25;
  v39.x = v29;
  v39.y = v31;
  if (CGRectContainsPoint(v41, v39))
    return 1;
  v42.origin.x = v19;
  v42.origin.y = v21;
  v42.size.width = v23;
  v42.size.height = v25;
  v40.x = v35;
  v40.y = v37;
  return CGRectContainsPoint(v42, v40);
}

- (void)documentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep documentModeDidChange](&v3, "documentModeDidChange");
  -[CRLShapeRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return 1;
}

- (CRLShapeRepFreehandDrawingDynamicFillErasingDelegate)freehandDrawingDynamicFillErasingDelegate
{
  return (CRLShapeRepFreehandDrawingDynamicFillErasingDelegate *)objc_loadWeakRetained((id *)&self->_freehandDrawingDynamicFillErasingDelegate);
}

- (void)setFreehandDrawingDynamicFillErasingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_freehandDrawingDynamicFillErasingDelegate, a3);
}

- (BOOL)shadowOnChildrenDisabled
{
  return self->mShadowOnChildrenDisabled;
}

- (BOOL)i_isCurrentlyBeingFreehandDrawn
{
  return self->_isCurrentlyBeingFreehandDrawn;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_freehandDrawingDynamicFillErasingDelegate);
  objc_storeStrong((id *)&self->mCachedWrapPathInRoot, 0);
  objc_storeStrong((id *)&self->mDownloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->mHitTestCache, 0);
  objc_storeStrong((id *)&self->mHelper, 0);
}

@end
