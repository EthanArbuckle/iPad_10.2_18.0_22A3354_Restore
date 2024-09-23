@implementation CRLInteractiveCanvasRepContentPlatformViewPile

- (CRLInteractiveCanvasRepContentPlatformViewPile)initWithRep:(id)a3 kind:(unint64_t)a4
{
  id v7;
  CRLInteractiveCanvasRepContentPlatformViewPile *v8;
  CRLInteractiveCanvasRepContentPlatformViewPile *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLInteractiveCanvasRepContentPlatformViewPile;
  v8 = -[CRLInteractiveCanvasRepContentPlatformViewPile init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rep, a3);
    v9->_kind = a4;
  }

  return v9;
}

- (CRLInteractiveCanvasRepContentPlatformViewPile)initWithRep:(id)a3
{
  return -[CRLInteractiveCanvasRepContentPlatformViewPile initWithRep:kind:](self, "initWithRep:kind:", a3, 1);
}

- (NSString)description
{
  unint64_t kind;
  uint64_t v4;
  double v5;
  uint64_t v6;

  kind = self->_kind;
  if (kind > 2)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_1012591C0 + kind);
  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p rep=%@ kind=%@>"), v5, v6, self, self->_rep, v4);
}

- (BOOL)isContentEqualToContentOfRepContentPile:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  BOOL v9;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class(CRLInteractiveCanvasRepContentPlatformViewPile, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);

  v9 = v8 && self->_rep == *(CRLCanvasRep **)(v8 + 8) && self->_kind == *(_QWORD *)(v8 + 16);
  return v9;
}

- (CRLPlatformView)contentPlatformView
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t kind;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259180);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D2B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012591A0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentPlatformViewPile contentPlatformView]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 275, 0, "This operation must only be performed on the main thread.");

  }
  kind = self->_kind;
  if (kind == 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalPlatformViewOverRenderable](self->_rep, "additionalPlatformViewOverRenderable"));
  }
  else if (kind == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep contentPlatformView](self->_rep, "contentPlatformView"));
  }
  else if (kind)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalPlatformViewUnderRenderable](self->_rep, "additionalPlatformViewUnderRenderable"));
  }
  return (CRLPlatformView *)v7;
}

- (CGRect)contentPlatformViewFrame
{
  CGRect v2;

  -[CRLCanvasRep layerFrameInScaledCanvas](self->_rep, "layerFrameInScaledCanvas");
  return CGRectIntegral(v2);
}

- (CGRect)contentPlatformViewMaskRect
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;
  CGRect v26;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v6 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self->_rep, "parentRep"));
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      if (objc_msgSend(v7, "masksToBounds"))
      {
        objc_msgSend(v7, "layerFrameInScaledCanvas");
        v8 = v21.origin.x;
        v9 = v21.origin.y;
        v10 = v21.size.width;
        v11 = v21.size.height;
        v22 = CGRectIntegral(v21);
        v19 = v22.origin.y;
        v20 = v22.origin.x;
        v17 = v22.size.height;
        v18 = v22.size.width;
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        if (CGRectIsNull(v22))
        {
          height = v11;
          width = v10;
          y = v9;
          x = v8;
        }
        else
        {
          v23.origin.x = x;
          v23.origin.y = y;
          v23.size.width = width;
          v23.size.height = height;
          v26.origin.y = v19;
          v26.origin.x = v20;
          v26.size.height = v17;
          v26.size.width = v18;
          v24 = CGRectIntersection(v23, v26);
          x = v24.origin.x;
          y = v24.origin.y;
          width = v24.size.width;
          height = v24.size.height;
        }
      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentRep", *(_QWORD *)&v17, *(_QWORD *)&v18, *(_QWORD *)&v19, *(_QWORD *)&v20));

      v7 = (void *)v12;
    }
    while (v12);
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rep, 0);
}

@end
