@implementation CRLWPTextMagnifierRanged

- (CRLWPTextMagnifierRanged)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CRLWPTextMagnifierRanged *v7;
  void *v8;
  CRLWPTextMagnifierTimeWeightedPoint *v9;
  CRLWPTextMagnifierTimeWeightedPoint *weightedPoint;
  void *v11;
  void *v12;
  id v13;
  CRLWPTextMagnifierRenderer *v14;
  CRLWPTextMagnifierRenderer *magnifierRenderer;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CRLWPTextMagnifierRanged;
  v7 = -[CRLWPTextMagnifierRanged initWithFrame:](&v20, "initWithFrame:");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CRLWPTextMagnifierRanged setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = objc_alloc_init(CRLWPTextMagnifierTimeWeightedPoint);
    weightedPoint = v7->_weightedPoint;
    v7->_weightedPoint = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged underlayImageName](v7, "underlayImageName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v11));

    v13 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v12);
    -[CRLWPTextMagnifierRanged addSubview:](v7, "addSubview:", v13);
    v14 = -[CRLWPTextMagnifierRenderer initWithFrame:]([CRLWPTextMagnifierRenderer alloc], "initWithFrame:", x, y, width, height);
    magnifierRenderer = v7->_magnifierRenderer;
    v7->_magnifierRenderer = v14;

    -[CRLWPTextMagnifierRenderer setRendererDelegate:](v7->_magnifierRenderer, "setRendererDelegate:", v7);
    -[CRLWPTextMagnifierRanged addSubview:](v7, "addSubview:", v7->_magnifierRenderer);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged overlayImageName](v7, "overlayImageName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v16));

    v18 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v17);
    -[CRLWPTextMagnifierRanged addSubview:](v7, "addSubview:", v18);

  }
  return v7;
}

- (double)horizontalMovement
{
  double result;

  -[CRLWPTextMagnifierTimeWeightedPoint displacementInInterval:](self->_weightedPoint, "displacementInInterval:", 0.5);
  return result;
}

- (double)horizontalMovementAtTime:(double)a3
{
  double v4;
  double v5;
  double result;
  double v7;
  double v8;
  double v9;

  -[CRLWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->_weightedPoint, "distanceCoveredInInterval:", 3.40282347e38);
  v5 = v4;
  -[CRLWPTextMagnifierTimeWeightedPoint displacementInInterval:](self->_weightedPoint, "displacementInInterval:", 0.5);
  v7 = fabs(result);
  v9 = fabs(v8) * 4.0;
  if (v5 > v7 * 1.5 || v9 > v7 || v7 < 16.0)
    return 0.0;
  return result;
}

- (BOOL)wasPlacedCarefullyAtTime:(double)a3
{
  double v3;

  -[CRLWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:priorTo:](self->_weightedPoint, "distanceCoveredInInterval:priorTo:", 0.5, a3);
  return v3 < 10.0;
}

- (double)currentOffset
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230168);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED6D8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230188);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged currentOffset]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 85, 0, "Abstract method");

  return 0.0;
}

- (void)setFrame:(CGRect)a3
{
  CRLWPTextMagnifierRenderer *magnifierRenderer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPTextMagnifierRanged;
  -[CRLWPTextMagnifierRanged setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  -[CRLWPTextMagnifierRanged bounds](self, "bounds");
  -[CRLWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierRanged;
  -[CRLWPTextMagnifierRanged setNeedsDisplay](&v3, "setNeedsDisplay");
  -[CRLWPTextMagnifierRenderer setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
}

- (void)updateFrame
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012301A8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED758();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012301C8);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged updateFrame]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 100, 0, "Abstract method");

}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  id v7;
  void *v8;
  UIWindow *v9;
  UIWindow *hostWindow;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  CRLWPTextMagnifierCaretController *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  -[CRLWPTextMagnifierRanged setTarget:](self, "setTarget:");
  -[CRLWPTextMagnifierTimeWeightedPoint clearHistory](self->_weightedPoint, "clearHistory");
  -[CRLWPTextMagnifierRanged setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
  -[CRLWPTextMagnifierRanged setNeedsLayout](self, "setNeedsLayout");
  -[CRLWPTextMagnifierRanged setNeedsDisplay](self, "setNeedsDisplay");
  v7 = objc_alloc((Class)UIWindow);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  v9 = (UIWindow *)objc_msgSend(v7, "initWithFrame:");
  hostWindow = self->_hostWindow;
  self->_hostWindow = v9;

  -[UIWindow setWindowLevel:](self->_hostWindow, "setWindowLevel:", UIWindowLevelStatusBar + 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIWindow setBackgroundColor:](self->_hostWindow, "setBackgroundColor:", v11);

  v13 = objc_opt_class(UIViewController, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
  v16 = sub_100221D0C(v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = -[CRLWPTextMagnifierCaretController initWithPreferredStatusBarStyle:]([CRLWPTextMagnifierCaretController alloc], "initWithPreferredStatusBarStyle:", objc_msgSend(v17, "preferredStatusBarStyle"));
  -[CRLWPTextMagnifierCaretController setView:](v18, "setView:", self);
  -[UIWindow setRootViewController:](self->_hostWindow, "setRootViewController:", v18);
  -[UIWindow addSubview:](self->_hostWindow, "addSubview:", self);
  -[CRLWPTextMagnifierRanged frame](self, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UIWindow setHidden:](self->_hostWindow, "setHidden:", 0);
  -[CRLWPTextMagnifierRanged setFrame:](self, "setFrame:", v20, v22, v24, v26);

}

- (void)stopMagnifying:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012301E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED7D8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230208);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged stopMagnifying:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 136, 0, "Abstract method");

}

- (BOOL)isMagnifierStopping
{
  double v4;
  double v5;
  double v8;

  if (self->_magnificationPoint.x != INFINITY || self->_magnificationPoint.y != INFINITY)
    return 0;
  -[CRLWPTextMagnifierRanged offset](self, "offset");
  if (v5 != CGPointZero.x || v4 != CGPointZero.y)
    return 0;
  -[CRLWPTextMagnifierRanged alpha](self, "alpha");
  return v8 == 0.25;
}

- (void)remove
{
  UIWindow *hostWindow;

  -[UIWindow setHidden:](self->_hostWindow, "setHidden:", 1);
  hostWindow = self->_hostWindow;
  self->_hostWindow = 0;

}

- (void)postAutoscrollPoint:(CGPoint)a3
{
  -[CRLWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:", a3.x, a3.y);
}

- (void)setAutoscrollDirections:(int)a3
{
  -[CRLWPTextMagnifierRenderer setAutoscrollDirections:](self->_magnifierRenderer, "setAutoscrollDirections:", *(_QWORD *)&a3);
}

- (void)autoscrollWillNotStart
{
  -[CRLWPTextMagnifierRanged setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
}

- (CGPoint)terminalPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[CRLWPTextMagnifierTimeWeightedPoint weightedPoint](self->_weightedPoint, "weightedPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3;
  double v4;

  v3 = -[CRLWPTextMagnifierTimeWeightedPoint historyCovers:](self->_weightedPoint, "historyCovers:", 0.5);
  -[CRLWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->_weightedPoint, "distanceCoveredInInterval:", 0.5);
  return v4 < 10.0 && v3;
}

- (CGPoint)magnificationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[CRLWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.x = x;
    self->_magnificationPoint.y = y;
    -[CRLWPTextMagnifierRanged updateFrame](self, "updateFrame");
    -[CRLWPTextMagnifierRenderer setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
  }
  -[CRLWPTextMagnifierRanged setAnimationPoint:](self, "setAnimationPoint:", x, y);
}

- (id)underlayImageName
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230228);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED858();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230248);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged underlayImageName]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 192, 0, "Abstract method");

  return &stru_1012A72B0;
}

- (id)overlayImageName
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230268);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED8D8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230288);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged overlayImageName]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 197, 0, "Abstract method");

  return &stru_1012A72B0;
}

- (NSString)maskImageName
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012302A8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED958();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012302C8);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged maskImageName]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 202, 0, "Abstract method");

  return (NSString *)&stru_1012A72B0;
}

- (BOOL)shouldHideCanvasLayer
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012302E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DED9D8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230308);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged shouldHideCanvasLayer]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 207, 0, "Abstract method");

  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230328);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DEDA58();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101230348);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged drawMagnifierClippedCanvasLayer:inContext:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 212, 0, "Abstract method");

}

- (CRLCanvasRep)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (CGPoint)animationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_animationPoint.x;
  y = self->_animationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_animationPoint = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)pointVelocity
{
  return self->_pointVelocity;
}

- (void)setPointVelocity:(double)a3
{
  self->_pointVelocity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostWindow, 0);
  objc_storeStrong((id *)&self->_magnifierRenderer, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
