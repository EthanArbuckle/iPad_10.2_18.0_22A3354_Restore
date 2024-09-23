@implementation CRLConnectionLinePathSource

- (CRLConnectionLinePathSource)initWithBezierPath:(id)a3
{
  id v4;
  double width;
  double height;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  CRLConnectionLinePathSource *v16;
  objc_super v18;
  float64x2_t v19[3];
  double v20;
  double v21;

  v4 = a3;
  if ((uint64_t)objc_msgSend(v4, "elementCount") < 1)
  {
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  else
  {
    objc_msgSend(v4, "controlPointBounds");
  }
  v7 = width == CGSizeZero.width && height == CGSizeZero.height;
  if (v7 || (sub_1000637C8() & 1) != 0 || objc_msgSend(v4, "elementCount") != (id)3)
  {
    if (objc_msgSend(v4, "elementCount") == (id)2 && objc_msgSend(v4, "elementAtIndex:", 1) == (id)2)
    {
      objc_msgSend(v4, "elementAtIndex:allPoints:", 1, v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));

      objc_msgSend(v8, "moveToPoint:", *(_OWORD *)v19);
      objc_msgSend(v8, "lineToPoint:", sub_1000602A8(v19, 0.5));
      v9 = v20;
      v10 = v21;
      v11 = v8;
    }
    else
    {
      v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012482E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E12608((uint64_t)v4, v12);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248300);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource initWithBezierPath:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 46, 0, "Ignoring invalid bezier path %@", v4);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
      objc_msgSend(v8, "moveToPoint:", CGPointZero.x, CGPointZero.y);
      objc_msgSend(v8, "lineToPoint:", 50.0, 50.0);
      v9 = 100.0;
      v11 = v8;
      v10 = 100.0;
    }
    objc_msgSend(v11, "lineToPoint:", v9, v10);
    v4 = v8;
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLConnectionLinePathSource;
  v16 = -[CRLBezierPathSource initWithBezierPath:](&v18, "initWithBezierPath:", v4);

  return v16;
}

- (CGPoint)getNewNormalizedPositionForMagnet:(BOOL)a3 withPreviousLayout:(id)a4 onNewLayout:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float64x2_t v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGPoint result;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLinePathSource headMagnet](self, "headMagnet"));

    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248320);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E126B0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248340);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource getNewNormalizedPositionForMagnet:withPreviousLayout:onNewLayout:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 60, 0, "invalid nil value for '%{public}s'", "self.headMagnet");

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLinePathSource headMagnet](self, "headMagnet"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLinePathSource tailMagnet](self, "tailMagnet"));

    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248360);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E12744();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248380);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource getNewNormalizedPositionForMagnet:withPreviousLayout:onNewLayout:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 63, 0, "invalid nil value for '%{public}s'", "self.tailMagnet");

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLinePathSource tailMagnet](self, "tailMagnet"));
  }
  v19 = v14;
  objc_msgSend(v14, "magnetNormalizedPosition");
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pureGeometry"));
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "fullTransform");
    v27 = *((double *)&v44 + 1);
    v26 = *(double *)&v44;
    v29 = *((double *)&v45 + 1);
    v28 = *(double *)&v45;
    v30 = *((double *)&v46 + 1);
    v31 = *(double *)&v46;
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v30 = 0.0;
    v29 = 0.0;
    v27 = 0.0;
    v31 = 0.0;
    v28 = 0.0;
    v26 = 0.0;
  }

  if (v9)
    objc_msgSend(v9, "pureTransformInRoot");
  else
    memset(&v42, 0, sizeof(v42));
  CGAffineTransformInvert(&v43, &v42);
  v41 = vaddq_f64(*(float64x2_t *)&v43.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v43.c, v30 + v23 * v29 + v27 * v21), *(float64x2_t *)&v43.a, v31 + v23 * v28 + v26 * v21));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pureGeometry"));
  objc_msgSend(v32, "size");
  v33 = sub_10005FDDC();
  v36 = sub_1000626B8(v41.f64[0], v41.f64[1], v33, v34, v35);
  v38 = v37;

  v39 = v36;
  v40 = v38;
  result.y = v40;
  result.x = v39;
  return result;
}

+ (id)pathSourceOfLength:(double)a3
{
  void *v4;
  CRLConnectionLinePathSource *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  objc_msgSend(v4, "moveToPoint:", 0.0, 0.0);
  objc_msgSend(v4, "lineToPoint:", a3 * 0.5, 0.0);
  objc_msgSend(v4, "lineToPoint:", a3, 0.0);
  v5 = -[CRLConnectionLinePathSource initWithBezierPath:]([CRLConnectionLinePathSource alloc], "initWithBezierPath:", v4);

  return v5;
}

+ (id)pathSourceAtAngleOfSize:(CGSize)a3 forType:(int64_t)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  CRLConnectionLinePathSource *v9;

  height = a3.height;
  width = a3.width;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v8 = v7;
  if (!a4)
  {
    objc_msgSend(v7, "moveToPoint:", 0.0, height);
    objc_msgSend(v8, "lineToPoint:", width * 0.5, height * 0.5);
    height = 0.0;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    objc_msgSend(v7, "moveToPoint:", 0.0, 0.0);
    objc_msgSend(v8, "lineToPoint:", 0.0, height);
LABEL_5:
    objc_msgSend(v8, "lineToPoint:", width, height);
  }
  v9 = -[CRLConnectionLinePathSource initWithBezierPath:]([CRLConnectionLinePathSource alloc], "initWithBezierPath:", v8);
  -[CRLConnectionLinePathSource setType:](v9, "setType:", a4);

  return v9;
}

- (void)bend
{
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

  -[CRLConnectionLinePathSource getControlKnobPosition:](self, "getControlKnobPosition:", 12);
  v4 = v3;
  v6 = v5;
  -[CRLConnectionLinePathSource getControlKnobPosition:](self, "getControlKnobPosition:", 10);
  v8 = v7;
  -[CRLConnectionLinePathSource getControlKnobPosition:](self, "getControlKnobPosition:", 11);
  v11 = sub_1000603B8(v9, v10, v8);
  v13 = sub_100060398(v11, v12);
  v15 = sub_10006200C(1, v13, v14);
  v17 = v15;
  v18 = v16;
  if (v16 > 0.0)
  {
    v17 = sub_1000603DC(v15, v16, -1.0);
    v18 = v19;
  }
  -[CRLBezierPathSource naturalSize](self, "naturalSize");
  v21 = v20;
  -[CRLBezierPathSource naturalSize](self, "naturalSize");
  v23 = v22;
  -[CRLBezierPathSource naturalSize](self, "naturalSize");
  v25 = v24;
  -[CRLBezierPathSource naturalSize](self, "naturalSize");
  v27 = sub_1000603DC(v17, v18, sqrt(v25 * v26 + v21 * v23) * 0.3);
  -[CRLConnectionLinePathSource setControlKnobPosition:toPoint:](self, "setControlKnobPosition:toPoint:", 12, sub_1000603D0(v4, v6, v27));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLConnectionLinePathSource;
  v4 = -[CRLBezierPathSource copyWithZone:](&v8, "copyWithZone:", a3);
  objc_msgSend(v4, "setType:", -[CRLConnectionLinePathSource type](self, "type"));
  -[CRLConnectionLinePathSource outsetFrom](self, "outsetFrom");
  objc_msgSend(v4, "setOutsetFrom:");
  -[CRLConnectionLinePathSource outsetTo](self, "outsetTo");
  objc_msgSend(v4, "setOutsetTo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLinePathSource headMagnet](self, "headMagnet"));
  objc_msgSend(v4, "setHeadMagnet:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLinePathSource tailMagnet](self, "tailMagnet"));
  objc_msgSend(v4, "setTailMagnet:", v6);

  objc_msgSend(v4, "setUserDidSetControlPoint:", -[CRLConnectionLinePathSource userDidSetControlPoint](self, "userDidSetControlPoint"));
  return v4;
}

- (unint64_t)numberOfControlKnobs
{
  return 1;
}

- (int64_t)pathElementIndexForKnobTag:(unint64_t)a3
{
  if (a3 - 10 > 2)
    return -1;
  else
    return qword_100EEE748[a3 - 10];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  int64_t v4;
  double x;
  double y;
  CGPoint v7;
  CGPoint result;

  v7 = CGPointZero;
  v4 = -[CRLConnectionLinePathSource pathElementIndexForKnobTag:](self, "pathElementIndexForKnobTag:", a3);
  if ((v4 & 0x8000000000000000) == 0)
    -[CRLBezierPath elementAtIndex:associatedPoints:](self->super.mPath, "elementAtIndex:associatedPoints:", v4, &v7);
  y = v7.y;
  x = v7.x;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  int64_t v5;
  uint64_t v6;

  v5 = -[CRLConnectionLinePathSource pathElementIndexForKnobTag:](self, "pathElementIndexForKnobTag:", a3, *(_QWORD *)&a4.x, *(_QWORD *)&a4.y);
  if ((v5 & 0x8000000000000000) == 0)
    -[CRLBezierPath setAssociatedPoints:atIndex:](self->super.mPath, "setAssociatedPoints:atIndex:", &v6, v5);
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CRLBezierPath *mPath;
  CGAffineTransform v11;
  CGAffineTransform v12;

  height = a3.height;
  width = a3.width;
  -[CRLBezierPath bounds](self->super.mPath, "bounds");
  v8 = width / v7;
  v9 = 0.0;
  if (v7 == 0.0)
    v8 = 0.0;
  memset(&v12.c, 0, 32);
  if (v6 != 0.0)
    v9 = height / v6;
  *(_OWORD *)&v12.a = 0uLL;
  CGAffineTransformMakeScale(&v12, v8, v9);
  mPath = self->super.mPath;
  v11 = v12;
  -[CRLBezierPath transformUsingAffineTransform:](mPath, "transformUsingAffineTransform:", &v11);
  -[CRLBezierPathSource setNaturalSize:](self, "setNaturalSize:", width, height);
}

- (id)bezierPath
{
  return self->super.mPath;
}

- (CGPoint)fixedPointForControlKnobChange
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGPoint result;

  v4 = 0.0;
  v5 = 0.0;
  -[CRLBezierPath elementAtIndex:associatedPoints:](self->super.mPath, "elementAtIndex:associatedPoints:", 0, &v4);
  v2 = v4;
  v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  return &stru_1012A72B0;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (BOOL)isLineSegment
{
  return 0;
}

- (void)p_setBezierPath:(id)a3
{
  CRLBezierPath *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLBezierPath *v8;
  CRLBezierPath *mPath;
  CRLBezierPath *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  float64x2_t v15[3];
  double v16;
  double v17;

  v4 = (CRLBezierPath *)a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012483A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E127D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012483C0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource p_setBezierPath:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 222, 0, "invalid nil value for '%{public}s'", "path");

  }
  if ((id)-[CRLBezierPath elementCount](v4, "elementCount") == (id)2
    && (id)-[CRLBezierPath elementAtIndex:](v4, "elementAtIndex:", 1) == (id)2)
  {
    -[CRLBezierPath elementAtIndex:allPoints:](v4, "elementAtIndex:allPoints:", 1, v15);
    v8 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    -[CRLBezierPath moveToPoint:](v8, "moveToPoint:", *(_OWORD *)v15);
    -[CRLBezierPath lineToPoint:](v8, "lineToPoint:", sub_1000602A8(v15, 0.5));
    -[CRLBezierPath lineToPoint:](v8, "lineToPoint:", v16, v17);

    v4 = v8;
  }
  mPath = self->super.mPath;
  self->super.mPath = v4;
  v10 = v4;

  -[CRLBezierPath bounds](self->super.mPath, "bounds");
  v12 = v11;
  v14 = v13;

  self->super.mNaturalSize.width = v12;
  self->super.mNaturalSize.height = v14;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLConnectionLinePathSource;
  v3 = -[CRLBezierPathSource description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = -[CRLConnectionLinePathSource type](self, "type");
  v7 = CFSTR("curved");
  if (v6 == 1)
    v7 = CFSTR("orthogonal");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; connection type: %@"),
                   v7));
  objc_msgSend(v5, "appendString:", v8);

  return v5;
}

- (BOOL)canUseToChangeShape
{
  return 0;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[CRLConnectionLinePathSource type](self, "type", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3 == 1)
    v6 = CFSTR("Path control");
  else
    v6 = CFSTR("Curvature control");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

  return v7;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  return 0;
}

- (id)crlaxUserInputLabelForKnobTag:(unint64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[CRLConnectionLinePathSource type](self, "type", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3 == 1)
    v6 = CFSTR("Path");
  else
    v6 = CFSTR("Curvature");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

  return v7;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return 0;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  return 1;
}

- (int64_t)type
{
  return self->mType;
}

- (void)setType:(int64_t)a3
{
  self->mType = a3;
}

- (double)outsetFrom
{
  return self->mOutsetFrom;
}

- (void)setOutsetFrom:(double)a3
{
  self->mOutsetFrom = a3;
}

- (double)outsetTo
{
  return self->mOutsetTo;
}

- (void)setOutsetTo:(double)a3
{
  self->mOutsetTo = a3;
}

- (CRLConnectionLineMagnet)headMagnet
{
  return self->mHeadMagnet;
}

- (void)setHeadMagnet:(id)a3
{
  objc_storeStrong((id *)&self->mHeadMagnet, a3);
}

- (CRLConnectionLineMagnet)tailMagnet
{
  return self->mTailMagnet;
}

- (void)setTailMagnet:(id)a3
{
  objc_storeStrong((id *)&self->mTailMagnet, a3);
}

- (BOOL)userDidSetControlPoint
{
  return self->mUserDidSetControlPoint;
}

- (void)setUserDidSetControlPoint:(BOOL)a3
{
  self->mUserDidSetControlPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTailMagnet, 0);
  objc_storeStrong((id *)&self->mHeadMagnet, 0);
}

@end
