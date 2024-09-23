@implementation CRLScalarPathSource

+ (id)rectangleWithNaturalSize:(CGSize)a3
{
  return +[CRLScalarPathSource roundedRectangleWithScalar:naturalSize:continuousCurve:](CRLScalarPathSource, "roundedRectangleWithScalar:naturalSize:continuousCurve:", 0, 0.0, a3.width, a3.height);
}

+ (id)roundedRectangleWithScalar:(double)a3 naturalSize:(CGSize)a4 continuousCurve:(BOOL)a5
{
  return -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", 0, a5, a3, a4.width, a4.height);
}

+ (id)regularPolygonWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  return -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", 1, 0, a3, a4.width, a4.height);
}

+ (id)chevronWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  return -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", 2, 0, a3, a4.width, a4.height);
}

+ (id)pathSourceWithType:(unint64_t)a3 scalar:(double)a4 naturalSize:(CGSize)a5
{
  return -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", a3, 0, a4, a5.width, a5.height);
}

- (CRLScalarPathSource)initWithType:(unint64_t)a3 scalar:(double)a4 naturalSize:(CGSize)a5 continuousCurve:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  CRLScalarPathSource *v11;
  CRLScalarPathSource *v12;
  objc_super v14;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)CRLScalarPathSource;
  v11 = -[CRLScalarPathSource init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[CRLScalarPathSource setType:](v11, "setType:", a3);
    -[CRLScalarPathSource setScalar:](v12, "setScalar:", a4);
    -[CRLScalarPathSource setNaturalSize:](v12, "setNaturalSize:", width, height);
    -[CRLScalarPathSource setIsCurveContinuous:](v12, "setIsCurveContinuous:", v6);
    -[CRLScalarPathSource setShouldShowKnob:](v12, "setShouldShowKnob:", 1);
  }
  return v12;
}

- (CRLScalarPathSource)init
{
  return -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:](self, "initWithType:scalar:naturalSize:continuousCurve:", 0, 0, 5.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLScalarPathSource;
  v4 = -[CRLPathSource copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setType:", -[CRLScalarPathSource type](self, "type"));
  -[CRLScalarPathSource scalar](self, "scalar");
  objc_msgSend(v4, "setScalar:");
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  objc_msgSend(v4, "setNaturalSize:");
  objc_msgSend(v4, "setIsCurveContinuous:", -[CRLScalarPathSource isCurveContinuous](self, "isCurveContinuous"));
  objc_msgSend(v4, "setShouldShowKnob:", -[CRLScalarPathSource shouldShowKnob](self, "shouldShowKnob"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CRLScalarPathSource *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v22;
  objc_super v23;

  v4 = (CRLScalarPathSource *)a3;
  if (v4 == self)
  {
    LOBYTE(v20) = 1;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CRLScalarPathSource;
    if (-[CRLPathSource isEqual:](&v23, "isEqual:", v4))
    {
      objc_opt_class(CRLScalarPathSource, v5);
      v7 = sub_1002223BC(v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = -[CRLScalarPathSource type](self, "type");
      if (v9 != objc_msgSend(v8, "type"))
        goto LABEL_8;
      -[CRLScalarPathSource scalar](self, "scalar");
      v11 = v10;
      objc_msgSend(v8, "scalar");
      if (v11 != v12 && vabdd_f64(v11, v12) >= 0.00999999978)
        goto LABEL_8;
      -[CRLScalarPathSource naturalSize](self, "naturalSize");
      v14 = v13;
      v16 = v15;
      objc_msgSend(v8, "naturalSize");
      if (sub_10005FDF0(v14, v16, v17, v18)
        && (v19 = -[CRLScalarPathSource isCurveContinuous](self, "isCurveContinuous"),
            v19 == objc_msgSend(v8, "isCurveContinuous")))
      {
        v22 = -[CRLScalarPathSource shouldShowKnob](self, "shouldShowKnob");
        v20 = v22 ^ objc_msgSend(v8, "shouldShowKnob") ^ 1;
      }
      else
      {
LABEL_8:
        LOBYTE(v20) = 0;
      }

    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  Class v2;
  NSString *v3;
  void *v4;
  id v5;

  objc_opt_class(self, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "hash");

  return (unint64_t)v5;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  CGSize v15;

  v14.receiver = self;
  v14.super_class = (Class)CRLScalarPathSource;
  v3 = -[CRLScalarPathSource description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = -[CRLScalarPathSource type](self, "type");
  -[CRLScalarPathSource scalar](self, "scalar");
  v8 = v7;
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v9 = NSStringFromCGSize(v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; type=%lu; scalar=%f; natural size=%@; continuous curve=%d"),
                    v6,
                    v8,
                    v10,
                    -[CRLScalarPathSource isCurveContinuous](self, "isCurveContinuous")));
  objc_msgSend(v5, "appendString:", v11);

  if (!-[CRLScalarPathSource shouldShowKnob](self, "shouldShowKnob"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" shouldShowKnob=%d"), -[CRLScalarPathSource shouldShowKnob](self, "shouldShowKnob")));
    objc_msgSend(v5, "appendString:", v12);

  }
  return v5;
}

- (void)setIsCurveContinuous:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (a3)
  {
    if (!-[CRLScalarPathSource type](self, "type"))
    {
      v7 = 1;
      goto LABEL_13;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253A88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E241A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253AA8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource setIsCurveContinuous:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 137, 0, "Trying to make a non-rounded-rectangle path continuously curve");

  }
  v7 = 0;
LABEL_13:
  self->mIsCurveContinuous = v7;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v6;

  height = a3.height;
  width = a3.width;
  if (!-[CRLScalarPathSource type](self, "type"))
  {
    -[CRLPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    self->mScalar = v6 * self->mScalar;
  }
  self->mNaturalSize.width = width;
  self->mNaturalSize.height = height;
}

- (void)setScalarValue:(id)a3
{
  float v4;

  objc_msgSend(a3, "floatValue");
  -[CRLScalarPathSource setScalar:](self, "setScalar:", v4);
}

- (double)maxScalar
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = -[CRLScalarPathSource type](self, "type");
  if (v3 == 2)
  {
    -[CRLScalarPathSource naturalSize](self, "naturalSize");
    return v10 / v11;
  }
  else if (v3 == 1)
  {
    return 100.0;
  }
  else
  {
    result = 0.0;
    if (!v3)
    {
      -[CRLScalarPathSource naturalSize](self, "naturalSize", 0.0);
      v6 = v5;
      y = CGPointZero.y;
      v9 = sub_10006108C(CGPointZero.x, y, 0.0, v8) * 0.5;
      result = sub_10006108C(CGPointZero.x, y, v6, 0.0) * 0.5;
      if (v9 < result)
        return v9;
    }
  }
  return result;
}

- (double)cornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  if (-[CRLScalarPathSource type](self, "type"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253AC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24228();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253AE8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource cornerRadius]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 191, 0, "called cornerRadius on wrong type pathSource");

  }
  -[CRLScalarPathSource scalar](self, "scalar");
  v7 = v6;
  -[CRLScalarPathSource maxCornerRadius](self, "maxCornerRadius");
  return sub_1003C65EC(v7, 0.0, v8);
}

- (double)maxCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  double result;

  if (-[CRLScalarPathSource type](self, "type"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253B08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E242A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253B28);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource maxCornerRadius]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 197, 0, "called cornerRadius on wrong type pathSource");

  }
  -[CRLScalarPathSource maxScalar](self, "maxScalar");
  return result;
}

- (unint64_t)numberOfSides
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if ((id)-[CRLScalarPathSource type](self, "type") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253B48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24328();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253B68);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource numberOfSides]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 202, 0, "called numberOfSides on wrong type pathSource");

  }
  -[CRLScalarPathSource scalar](self, "scalar");
  return (unint64_t)v6;
}

- (unint64_t)numberOfControlKnobs
{
  return -[CRLScalarPathSource shouldShowKnob](self, "shouldShowKnob");
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  unint64_t v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = -[CRLScalarPathSource type](self, "type", a3);
  if (v4 == 2)
  {
    -[CRLScalarPathSource p_getControlKnobPointForChevron](self, "p_getControlKnobPointForChevron");
  }
  else if (v4 == 1)
  {
    -[CRLScalarPathSource p_getControlKnobPointForRegularPolygon](self, "p_getControlKnobPointForRegularPolygon");
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    if (!v4)
      -[CRLScalarPathSource p_getControlKnobPointForRoundedRect](self, "p_getControlKnobPointForRoundedRect", 0.0, 0.0);
  }
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  unint64_t v7;

  y = a4.y;
  x = a4.x;
  v7 = -[CRLScalarPathSource type](self, "type", a3);
  switch(v7)
  {
    case 2uLL:
      -[CRLScalarPathSource p_setControlKnobPointForChevron:](self, "p_setControlKnobPointForChevron:", x, y);
      break;
    case 1uLL:
      -[CRLScalarPathSource p_setControlKnobPointForRegularPolygon:](self, "p_setControlKnobPointForRegularPolygon:", x, y);
      break;
    case 0uLL:
      -[CRLScalarPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", x, y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  double v13;

  v4 = -[CRLScalarPathSource type](self, "type", a3);
  if (v4 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253B88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E243A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253BA8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource getFeedbackStringForKnob:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 262, 0, "Need to provide feedback string for chevron!");

    v11 = &stru_1012A72B0;
  }
  else
  {
    if (v4 == 1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Sides: %d");
    }
    else
    {
      if (v4)
      {
        v11 = 0;
        return v11;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Radius: %d pt");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, 0));
    -[CRLScalarPathSource scalar](self, "scalar");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, (int)v13));

  }
  return v11;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPath *Mutable;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGRect v18;

  if ((id)-[CRLScalarPathSource type](self, "type", a3) != (id)1)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  Mutable = CGPathCreateMutable();
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v11 = -(v6 - v10 * 0.15);
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v13 = -(v8 - v12 * 0.15);
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v15 = v14 * 0.7;
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v18.size.height = v16 * 0.7;
  v18.origin.x = v11;
  v18.origin.y = v13;
  v18.size.width = v15;
  CGPathAddEllipseInRect(Mutable, 0, v18);
  return Mutable;
}

- (id)bezierPathWithoutFlips
{
  unint64_t v3;
  CGPath *v4;
  const CGPath *v5;
  void *v6;

  v3 = -[CRLScalarPathSource type](self, "type");
  if (v3 == 2)
  {
    v4 = -[CRLScalarPathSource p_newChevronPath](self, "p_newChevronPath");
  }
  else if (v3 == 1)
  {
    v4 = -[CRLScalarPathSource p_newRegularPolygonPath](self, "p_newRegularPolygonPath");
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = -[CRLScalarPathSource p_newRoundedRectPath](self, "p_newRoundedRectPath");
  }
  v5 = v4;
LABEL_9:
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v5));
  CGPathRelease(v5);
  return v6;
}

- (BOOL)isRectangular
{
  double v4;

  if (-[CRLScalarPathSource type](self, "type"))
    return 0;
  -[CRLScalarPathSource scalar](self, "scalar");
  return v4 == 0.0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)name
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLScalarPathSource type](self, "type");
  if (v2 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Chevron");
  }
  else if (v2 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Polygon");
  }
  else
  {
    if (v2)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Rounded Rectangle");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

+ (unint64_t)crlaxMaximumAllowedPolygonPointsDuringAdjustment
{
  return 11;
}

- (CGPath)p_newRoundedRectPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CGPath *v18;

  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  y = CGPointZero.y;
  -[CRLScalarPathSource scalar](self, "scalar");
  v9 = v8;
  v10 = sub_10006108C(CGPointZero.x, y, 0.0, v6) * 0.5;
  v11 = sub_10006108C(CGPointZero.x, y, v4, 0.0) * 0.5;
  if (v10 < v11)
    v11 = v10;
  if (v9 >= v11)
    v12 = v11;
  else
    v12 = v9;
  v13 = sub_10005FDDC();
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRoundedRect:upperRightRadius:lowerRightRadius:lowerLeftRadius:upperLeftRadius:useLegacyCorners:keepNoOpElements:](CRLBezierPath, "bezierPathWithRoundedRect:upperRightRadius:lowerRightRadius:lowerLeftRadius:upperLeftRadius:useLegacyCorners:keepNoOpElements:", -[CRLScalarPathSource isCurveContinuous](self, "isCurveContinuous") ^ 1, 0, v13, v14, v15, v16, v12, v12, v12, v12)));
  v18 = CGPathRetain((CGPathRef)objc_msgSend(v17, "CGPath"));

  return v18;
}

- (CGPath)p_newRegularPolygonPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform m;

  Mutable = CGPathCreateMutable();
  -[CRLScalarPathSource scalar](self, "scalar");
  v5 = fmax(v4, 3.0);
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v7 = v6 * 0.5;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v8 / v6);
  v11 = m;
  CGAffineTransformTranslate(&v12, &v11, v7, v7);
  m = v12;
  v12.a = 0.0;
  v12.b = 0.0;
  if ((unint64_t)v5)
  {
    v9 = 0;
    do
    {
      sub_100061EF8(&v12.a, v7, 6.28318531 / (double)(unint64_t)v5 * (double)v9 + -1.57079633);
      if (v9)
        CGPathAddLineToPoint(Mutable, &m, v12.a, v12.b);
      else
        CGPathMoveToPoint(Mutable, &m, v12.a, v12.b);
      ++v9;
    }
    while ((unint64_t)v5 != v9);
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newChevronPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat y;
  CGFloat v12;
  CGRect v14;

  Mutable = CGPathCreateMutable();
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  -[CRLScalarPathSource scalar](self, "scalar");
  v9 = sub_1003C65EC(v7 * v8, 0.0, v5);
  if (v9 == 0.0)
  {
    v14.origin.x = sub_10005FDDC();
    CGPathAddRect(Mutable, 0, v14);
  }
  else
  {
    v10 = v9;
    y = CGPointZero.y;
    v12 = v5 - v9;
    CGPathMoveToPoint(Mutable, 0, CGPointZero.x, y);
    CGPathAddLineToPoint(Mutable, 0, v12, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v5, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, v12, v7);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v7);
    CGPathAddLineToPoint(Mutable, 0, v10, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, CGPointZero.x, y);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;

  x = a3.x;
  -[CRLScalarPathSource naturalSize](self, "naturalSize", a3.x, a3.y);
  v6 = v5;
  y = CGPointZero.y;
  v9 = sub_10006108C(CGPointZero.x, y, 0.0, v8) * 0.5;
  v10 = sub_10006108C(CGPointZero.x, y, v6, 0.0) * 0.5;
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  -[CRLScalarPathSource setScalar:](self, "setScalar:", sub_1003C65EC(x, 0.0, v11));
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  y = CGPointZero.y;
  -[CRLScalarPathSource scalar](self, "scalar");
  v9 = v8;
  v10 = sub_10006108C(CGPointZero.x, y, 0.0, v6) * 0.5;
  v11 = sub_10006108C(CGPointZero.x, y, v4, 0.0) * 0.5;
  if (v10 >= v11)
    v12 = v11;
  else
    v12 = v10;
  v13 = sub_1003C65EC(v9, 0.0, v12);
  v14 = 0.0;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)p_setControlKnobPointForRegularPolygon:(CGPoint)a3
{
  double y;
  double x;
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
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;

  y = a3.y;
  x = a3.x;
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  if (-[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v9 - y;
  else
    v10 = y;
  v11 = x - v7 * 0.5;
  v12 = v7 / v9 * (v10 - v9 * 0.5);
  v13 = -v11;
  v14 = sub_100061070(v11, v12);
  v15 = acos(v13 / v14);
  if (v12 > 0.0)
    v15 = 6.28318531 - v15;
  v16 = v15 / 6.28318531 + -0.25;
  if (v16 >= 0.0)
    v17 = v16;
  else
    v17 = v16 + 1.0;
  v18 = +[CRLScalarPathSource crlaxMaximumAllowedPolygonPointsDuringAdjustment](CRLScalarPathSource, "crlaxMaximumAllowedPolygonPointsDuringAdjustment");
  v19 = v17 * 9.0 + 3.5;
  if (v18 >= (unint64_t)v19)
    v20 = (unint64_t)v19;
  else
    v20 = 3;
  -[CRLScalarPathSource scalar](self, "scalar");
  if ((int)v21 != 3 || v20 == 4)
  {
    -[CRLScalarPathSource scalar](self, "scalar");
    if ((int)v22 != (_DWORD)v18 || v20 == v18 - 1)
      -[CRLScalarPathSource setScalar:](self, "setScalar:", (double)v20);
  }
}

- (CGPoint)p_getControlKnobPointForRegularPolygon
{
  double v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[CRLScalarPathSource scalar](self, "scalar");
  v4 = (unint64_t)fmax(v3, 3.0);
  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  v9 = v5 * 0.5;
  v13 = 0.0;
  v14 = 0.0;
  sub_100061EF8(&v13, v5 * 0.5 * 0.7, ((float)((float)(v4 - 3) / 9.0) + -0.25) * 6.28318531);
  v13 = v9 + v13;
  v14 = v8 * 0.5 + v8 / v6 * v14;
  v10 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v11 = v13;
  v12 = v14;
  if (v10)
    v12 = v8 - v14;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)p_setControlKnobPointForChevron:(CGPoint)a3
{
  double x;
  double v5;
  double v6;

  x = a3.x;
  -[CRLScalarPathSource naturalSize](self, "naturalSize", a3.x, a3.y);
  -[CRLScalarPathSource setScalar:](self, "setScalar:", sub_1003C65EC(x, 0.0, v5) / v6);
}

- (CGPoint)p_getControlKnobPointForChevron
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[CRLScalarPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  -[CRLScalarPathSource scalar](self, "scalar");
  v8 = sub_1003C65EC(v7 * v6, 0.0, v4);
  v9 = v6 * 0.5;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRLScalarPathSource inferredAccessibilityDescription](self, "inferredAccessibilityDescription"));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)inferredAccessibilityDescription
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v11;
  void *v12;

  v3 = -[CRLScalarPathSource type](self, "type");
  -[CRLScalarPathSource scalar](self, "scalar");
  v5 = llround(v4);
  if (v3 == 1)
  {
    switch(v5)
    {
      case 3uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Triangle");
        goto LABEL_9;
      case 4uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Diamond");
        goto LABEL_9;
      case 5uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Pentagon");
        goto LABEL_9;
      case 6uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Hexagon");
        goto LABEL_9;
      case 7uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Heptagon");
        goto LABEL_9;
      case 8uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Octagon");
        goto LABEL_9;
      case 9uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Nonagon");
        goto LABEL_9;
      case 0xAuLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Decagon");
        goto LABEL_9;
      case 0xBuLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Hendecagon");
        goto LABEL_9;
      case 0xCuLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Dodecagon");
        goto LABEL_9;
      default:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ sided polygon"), 0, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12));

        break;
    }
    goto LABEL_10;
  }
  if (!v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v5)
      v8 = CFSTR("Rounded rectangle");
    else
      v8 = CFSTR("Square");
LABEL_9:
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, 0, 0));
LABEL_10:

    return v9;
  }
  v9 = &stru_1012A72B0;
  return v9;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v11;
  void *v12;

  v3 = -[CRLScalarPathSource type](self, "type");
  -[CRLScalarPathSource scalar](self, "scalar");
  v5 = llround(v4);
  if (v3 == 1)
  {
    switch(v5)
    {
      case 3uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected triangle.");
        goto LABEL_9;
      case 4uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected diamond.");
        goto LABEL_9;
      case 5uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected pentagon.");
        goto LABEL_9;
      case 6uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected hexagon.");
        goto LABEL_9;
      case 7uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected heptagon.");
        goto LABEL_9;
      case 8uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected octagon.");
        goto LABEL_9;
      case 9uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected nonagon.");
        goto LABEL_9;
      case 0xAuLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected decagon.");
        goto LABEL_9;
      case 0xBuLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected hendecagon.");
        goto LABEL_9;
      case 0xCuLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Describe the selected dodecagon.");
        goto LABEL_9;
      default:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Describe the selected %@ sided polygon."), 0, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12));

        break;
    }
    goto LABEL_10;
  }
  if (!v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v5)
      v8 = CFSTR("Describe the selected rounded rectangle.");
    else
      v8 = CFSTR("Describe the selected square.");
LABEL_9:
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, 0, 0));
LABEL_10:

    return v9;
  }
  v9 = &stru_1012A72B0;
  return v9;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;

  v3 = -[CRLScalarPathSource type](self, "type", a3);
  if (v3 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253BC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24428();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253BE8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource crlaxLabelComponentForKnobTag:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 641, 0, "Need to provide axLabel component string for chevron!");

    v10 = &stru_1012A72B0;
  }
  else
  {
    if (v3 == 1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Sides");
    }
    else
    {
      if (v3)
      {
        v10 = 0;
        return v10;
      }
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Radius");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11));

  }
  return v10;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  v4 = -[CRLScalarPathSource type](self, "type", a3);
  if (v4 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253C08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E244A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253C28);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource crlaxValueForKnobTag:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 660, 0, "Need to provide axValue string for chevron!");

    v8 = &stru_1012A72B0;
  }
  else if (v4 == 1)
  {
    -[CRLScalarPathSource scalar](self, "scalar");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), (int)v12));
  }
  else if (v4)
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%d points"), 0, 0));
    -[CRLScalarPathSource scalar](self, "scalar");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, (int)v7));

  }
  return v8;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return -[CRLScalarPathSource type](self, "type", a3) < 2;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  return 0;
}

- (unint64_t)type
{
  return self->mType;
}

- (void)setType:(unint64_t)a3
{
  self->mType = a3;
}

- (double)scalar
{
  return self->mScalar;
}

- (void)setScalar:(double)a3
{
  self->mScalar = a3;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

- (BOOL)isCurveContinuous
{
  return self->mIsCurveContinuous;
}

- (BOOL)shouldShowKnob
{
  return self->mShouldShowKnob;
}

- (void)setShouldShowKnob:(BOOL)a3
{
  self->mShouldShowKnob = a3;
}

@end
