@implementation CRLPointPathSource

+ (id)rightSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return _objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 1, a3.x, a3.y, a4.width, a4.height);
}

+ (id)leftSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return _objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 0, a3.x, a3.y, a4.width, a4.height);
}

+ (id)doubleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return _objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 10, a3.x, a3.y, a4.width, a4.height);
}

+ (id)starWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return _objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 100, a3.x, a3.y, a4.width, a4.height);
}

+ (id)plusWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return _objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 200, a3.x, a3.y, a4.width, a4.height);
}

+ (id)pathSourceWithType:(unint64_t)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithType:point:naturalSize:", a3, a4.x, a4.y, a5.width, a5.height);
}

+ (id)p_percentageNumberFormatter
{
  if (qword_101415300 != -1)
    dispatch_once(&qword_101415300, &stru_10124C658);
  return (id)qword_101415308;
}

- (CRLPointPathSource)initWithType:(unint64_t)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  CRLPointPathSource *v10;
  CRLPointPathSource *v11;
  objc_super v13;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLPointPathSource;
  v10 = -[CRLPointPathSource init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[CRLPointPathSource setType:](v10, "setType:", a3);
    -[CRLPointPathSource setPoint:](v11, "setPoint:", x, y);
    -[CRLPointPathSource setNaturalSize:](v11, "setNaturalSize:", width, height);
  }
  return v11;
}

- (CRLPointPathSource)init
{
  return -[CRLPointPathSource initWithType:point:naturalSize:](self, "initWithType:point:naturalSize:", 0, 25.0, 25.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLPointPathSource;
  v4 = -[CRLPathSource copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setType:", -[CRLPointPathSource type](self, "type"));
  -[CRLPointPathSource point](self, "point");
  objc_msgSend(v4, "setPoint:");
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  objc_msgSend(v4, "setNaturalSize:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CRLPointPathSource *v4;
  uint64_t v5;
  uint64_t v6;
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
  double v19;
  double v20;
  double v21;
  BOOL v22;
  objc_super v24;

  v4 = (CRLPointPathSource *)a3;
  if (v4 == self)
  {
    v22 = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLPointPathSource;
    if (-[CRLPathSource isEqual:](&v24, "isEqual:", v4))
    {
      objc_opt_class(CRLPointPathSource, v5);
      v7 = sub_100221D0C(v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = -[CRLPointPathSource type](self, "type");
      if (v9 == objc_msgSend(v8, "type")
        && (-[CRLPointPathSource point](self, "point"),
            v11 = v10,
            v13 = v12,
            objc_msgSend(v8, "point"),
            sub_10005FDF0(v11, v13, v14, v15)))
      {
        -[CRLPointPathSource naturalSize](self, "naturalSize");
        v17 = v16;
        v19 = v18;
        objc_msgSend(v8, "naturalSize");
        v22 = sub_10005FDF0(v17, v19, v20, v21);
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
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
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGSize v15;

  v13.receiver = self;
  v13.super_class = (Class)CRLPointPathSource;
  v3 = -[CRLPointPathSource description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = -[CRLPointPathSource type](self, "type");
  -[CRLPointPathSource point](self, "point");
  v7 = NSStringFromCGPoint(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v9 = NSStringFromCGSize(v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; type=%lu; point=%@; natural size=%@"),
                    v6,
                    v8,
                    v10));
  objc_msgSend(v5, "appendString:", v11);

  return v5;
}

- (CGPoint)minPointValue
{
  double y;
  unint64_t v3;
  double v4;
  double x;
  CGPoint result;

  y = CGPointZero.y;
  v3 = -[CRLPointPathSource type](self, "type");
  if (v3 == 100)
    v4 = 0.1;
  else
    v4 = y;
  x = 3.0;
  if (v3 != 100)
    x = CGPointZero.x;
  result.y = v4;
  result.x = x;
  return result;
}

- (CGPoint)maxPointValue
{
  double y;
  double x;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v5 = -[CRLPointPathSource type](self, "type");
  if (v5 > 99)
  {
    if (v5 == 100)
    {
      y = 1.0;
      x = 100.0;
    }
    else if (v5 == 200)
    {
      -[CRLPointPathSource naturalSize](self, "naturalSize");
      x = v7 * 0.5;
      y = v8 * 0.5;
    }
  }
  else if ((unint64_t)v5 >= 2)
  {
    if (v5 == 10)
    {
      -[CRLPointPathSource naturalSize](self, "naturalSize");
      y = 0.5;
      x = v9 * 0.5;
    }
  }
  else
  {
    -[CRLPointPathSource naturalSize](self, "naturalSize");
    x = v6;
    y = 0.5;
  }
  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (unint64_t)starPoints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if ((id)-[CRLPointPathSource type](self, "type") != (id)100)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18B40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C698);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource starPoints]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 161, 0, "asking for starPoints on wrong type of pathSource");

  }
  -[CRLPointPathSource point](self, "point");
  return (unint64_t)v6;
}

- (unint64_t)maxStarPoints
{
  return 20;
}

- (unint64_t)minStarPoints
{
  double v2;

  -[CRLPointPathSource minPointValue](self, "minPointValue");
  return (unint64_t)v2;
}

- (double)starRadius
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if ((id)-[CRLPointPathSource type](self, "type") != (id)100)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C6B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18BC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C6D8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource starRadius]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 177, 0, "asking for starRadius on wrong type of pathSource");

  }
  -[CRLPointPathSource point](self, "point");
  return v6;
}

- (double)maxStarRadius
{
  double v2;

  -[CRLPointPathSource maxPointValue](self, "maxPointValue");
  return v2;
}

- (double)minStarRadius
{
  double v2;

  -[CRLPointPathSource minPointValue](self, "minPointValue");
  return v2;
}

- (BOOL)p_isArrowType
{
  unint64_t v3;

  if (-[CRLPointPathSource type](self, "type"))
  {
    v3 = -[CRLPointPathSource type](self, "type");
    if (v3 != 1)
      LOBYTE(v3) = (id)-[CRLPointPathSource type](self, "type") == (id)10;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (double)arrowIndent
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if (!-[CRLPointPathSource p_isArrowType](self, "p_isArrowType"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C6F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18C40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C718);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource arrowIndent]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 194, 0, "asking for arrowIndent on wrong type of pathSource");

  }
  -[CRLPointPathSource point](self, "point");
  return v6;
}

- (double)maxArrowIndent
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if (!-[CRLPointPathSource p_isArrowType](self, "p_isArrowType"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C738);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18CC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C758);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource maxArrowIndent]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 199, 0, "asking for arrowIndent on wrong type of pathSource");

  }
  -[CRLPointPathSource maxPointValue](self, "maxPointValue");
  return v6;
}

- (double)minArrowIndent
{
  double v2;

  -[CRLPointPathSource minPointValue](self, "minPointValue");
  return v2;
}

- (double)arrowHead
{
  void *v3;
  void *v4;
  void *v5;
  double result;

  if (!-[CRLPointPathSource p_isArrowType](self, "p_isArrowType"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C778);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18D40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C798);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource arrowHead]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 208, 0, "asking for arrowIndent on wrong type of pathSource");

  }
  -[CRLPointPathSource point](self, "point");
  return result;
}

- (double)maxArrowHead
{
  void *v3;
  void *v4;
  void *v5;
  double result;

  if (!-[CRLPointPathSource p_isArrowType](self, "p_isArrowType"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C7B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18DC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C7D8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource maxArrowHead]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 213, 0, "asking for arrowIndent on wrong type of pathSource");

  }
  -[CRLPointPathSource maxPointValue](self, "maxPointValue");
  return result;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  unint64_t v6;
  double v7;

  height = a3.height;
  width = a3.width;
  v6 = -[CRLPointPathSource type](self, "type");
  if (v6 <= 0xA && ((1 << v6) & 0x403) != 0 || v6 == 200)
  {
    -[CRLPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    self->mPoint.x = v7 * self->mPoint.x;
  }
  self->mNaturalSize.width = width;
  self->mNaturalSize.height = height;
}

- (unint64_t)numberOfControlKnobs
{
  if ((id)-[CRLPointPathSource type](self, "type") == (id)100)
    return 2;
  else
    return 1;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  unint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  v5 = -[CRLPointPathSource type](self, "type");
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    -[CRLPointPathSource p_getControlKnobPointForArrow](self, "p_getControlKnobPointForArrow");
  }
  else if (v5 == 100)
  {
    if (a3 == 12)
      -[CRLPointPathSource p_getControlKnobPointForStarPoints](self, "p_getControlKnobPointForStarPoints");
    else
      -[CRLPointPathSource p_getControlKnobPointForStarInnerRadius](self, "p_getControlKnobPointForStarInnerRadius");
  }
  else
  {
    v7 = 0.0;
    v6 = 0.0;
    if (v5 == 200)
      -[CRLPointPathSource p_getControlKnobPointForPlus](self, "p_getControlKnobPointForPlus", 0.0, 0.0);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  unint64_t v8;

  y = a4.y;
  x = a4.x;
  v8 = -[CRLPointPathSource type](self, "type");
  if (v8 <= 0xA && ((1 << v8) & 0x403) != 0)
  {
    -[CRLPointPathSource p_setControlKnobPointForArrow:](self, "p_setControlKnobPointForArrow:", x, y);
  }
  else if (v8 == 100)
  {
    if (a3 == 12)
      -[CRLPointPathSource p_setControlKnobPointForStarPoints:](self, "p_setControlKnobPointForStarPoints:", x, y);
    else
      -[CRLPointPathSource p_setControlKnobPointForStarInnerRadius:](self, "p_setControlKnobPointForStarInnerRadius:", x, y);
  }
  else if (v8 == 200)
  {
    -[CRLPointPathSource p_setControlKnobPointForPlus:](self, "p_setControlKnobPointForPlus:", x, y);
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  __CFString *v10;
  void *v11;

  v5 = -[CRLPointPathSource type](self, "type");
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0 || v5 == 200)
  {
    v10 = &stru_1012A72B0;
  }
  else if (v5 == 100)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (a3 == 12)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Points: %d"), 0, 0));
      -[CRLPointPathSource point](self, "point");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, (int)v9));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Radius: %@"), 0, 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPointPathSource p_innerRadiusLocalizedPercent](self, "p_innerRadiusLocalizedPercent"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v11));

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  unint64_t v5;
  CGPath *Mutable;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGRect v20;

  v5 = -[CRLPointPathSource type](self, "type");
  Mutable = 0;
  if (a3 == 12 && v5 == 100)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;

    Mutable = CGPathCreateMutable();
    -[CRLPointPathSource naturalSize](self, "naturalSize");
    v13 = -(v9 - v12 * 0.15);
    -[CRLPointPathSource naturalSize](self, "naturalSize");
    v15 = -(v11 - v14 * 0.15);
    -[CRLPointPathSource naturalSize](self, "naturalSize");
    v17 = v16 * 0.7;
    -[CRLPointPathSource naturalSize](self, "naturalSize");
    v20.size.height = v18 * 0.7;
    v20.origin.x = v13;
    v20.origin.y = v15;
    v20.size.width = v17;
    CGPathAddEllipseInRect(Mutable, 0, v20);
  }
  return Mutable;
}

- (id)bezierPathWithoutFlips
{
  unint64_t v3;
  CGPath *v4;
  const CGPath *v5;
  void *v6;

  v3 = -[CRLPointPathSource type](self, "type");
  if (v3 <= 0xA && ((1 << v3) & 0x403) != 0)
  {
    v4 = -[CRLPointPathSource p_newArrowPath](self, "p_newArrowPath");
  }
  else if (v3 == 100)
  {
    v4 = -[CRLPointPathSource p_newStarPath](self, "p_newStarPath");
  }
  else
  {
    if (v3 != 200)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = -[CRLPointPathSource p_newPlusPath](self, "p_newPlusPath");
  }
  v5 = v4;
LABEL_9:
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v5));
  CGPathRelease(v5);
  return v6;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)name
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v2 = -[CRLPointPathSource type](self, "type");
  v3 = 0;
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Star");
      goto LABEL_10;
    }
    if (v2 == 200)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Plus");
      goto LABEL_10;
    }
  }
  else
  {
    if ((unint64_t)v2 < 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Arrow");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

      return v3;
    }
    if (v2 == 10)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Double Arrow");
      goto LABEL_10;
    }
  }
  return v3;
}

- (CGPath)p_newArrowPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t mType;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  unint64_t v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat v37;
  CGFloat MaxX;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  Mutable = CGPathCreateMutable();
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  v8 = sub_10005FDDC();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CRLPointPathSource point](self, "point");
  v16 = v15;
  v18 = v17;
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v20 = v18 * v19;
  mType = self->mType;
  if (mType == 1)
  {
    v24 = v5 - sub_1003C65EC(v16, 0.0, v5);
  }
  else
  {
    if (mType == 10)
    {
      v22 = v5 * 0.5;
      v23 = v16;
    }
    else
    {
      v23 = v16;
      v22 = v5;
    }
    v24 = sub_1003C65EC(v23, 0.0, v22);
  }
  v25 = sub_1003C65EC(v20, 0.0, v7 * 0.5);
  v26 = v25;
  v27 = self->mType;
  if (v27 == 10)
  {
    v47 = v7 - v25;
    CGPathMoveToPoint(Mutable, 0, v24, v7 - v25);
    v53.origin.x = v8;
    v53.origin.y = v10;
    v53.size.width = v12;
    v53.size.height = v14;
    MaxY = CGRectGetMaxY(v53);
    CGPathAddLineToPoint(Mutable, 0, v24, MaxY);
    v54.origin.x = v8;
    v54.origin.y = v10;
    v54.size.width = v12;
    v54.size.height = v14;
    MinX = CGRectGetMinX(v54);
    v55.origin.x = v8;
    v55.origin.y = v10;
    v55.size.width = v12;
    v55.size.height = v14;
    MidY = CGRectGetMidY(v55);
    CGPathAddLineToPoint(Mutable, 0, MinX, MidY);
    CGPathAddLineToPoint(Mutable, 0, v24, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v24, v26);
    v37 = v5 - v24;
    CGPathAddLineToPoint(Mutable, 0, v37, v26);
    CGPathAddLineToPoint(Mutable, 0, v37, 0.0);
    v56.origin.x = v8;
    v56.origin.y = v10;
    v56.size.width = v12;
    v56.size.height = v14;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = v8;
    v57.origin.y = v10;
    v57.size.width = v12;
    v57.size.height = v14;
    v39 = CGRectGetMidY(v57);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v39);
    v58.origin.x = v8;
    v58.origin.y = v10;
    v58.size.width = v12;
    v58.size.height = v14;
    v40 = CGRectGetMaxY(v58);
    CGPathAddLineToPoint(Mutable, 0, v37, v40);
    CGPathAddLineToPoint(Mutable, 0, v37, v47);
    v41 = vabdd_f64(v26, v47);
  }
  else
  {
    if (v27 == 1)
    {
      v28 = v7 - v25;
      CGPathMoveToPoint(Mutable, 0, v24, v7 - v25);
      v59.origin.x = v8;
      v59.origin.y = v10;
      v59.size.width = v12;
      v59.size.height = v14;
      v42 = CGRectGetMaxY(v59);
      CGPathAddLineToPoint(Mutable, 0, v24, v42);
      v60.origin.x = v8;
      v60.origin.y = v10;
      v60.size.width = v12;
      v60.size.height = v14;
      v43 = CGRectGetMaxX(v60);
      v61.origin.x = v8;
      v61.origin.y = v10;
      v61.size.width = v12;
      v61.size.height = v14;
      v44 = CGRectGetMidY(v61);
      CGPathAddLineToPoint(Mutable, 0, v43, v44);
      CGPathAddLineToPoint(Mutable, 0, v24, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v24, v26);
      v62.origin.x = v8;
      v62.origin.y = v10;
      v62.size.width = v12;
      v62.size.height = v14;
      v45 = CGRectGetMinX(v62);
      CGPathAddLineToPoint(Mutable, 0, v45, v26);
      v63.origin.x = v8;
      v63.origin.y = v10;
      v63.size.width = v12;
      v63.size.height = v14;
      v33 = CGRectGetMinX(v63);
    }
    else
    {
      if (v27)
        return Mutable;
      v28 = v7 - v25;
      CGPathMoveToPoint(Mutable, 0, v24, v7 - v25);
      v48.origin.x = v8;
      v48.origin.y = v10;
      v48.size.width = v12;
      v48.size.height = v14;
      v29 = CGRectGetMaxY(v48);
      CGPathAddLineToPoint(Mutable, 0, v24, v29);
      v49.origin.x = v8;
      v49.origin.y = v10;
      v49.size.width = v12;
      v49.size.height = v14;
      v30 = CGRectGetMinX(v49);
      v50.origin.x = v8;
      v50.origin.y = v10;
      v50.size.width = v12;
      v50.size.height = v14;
      v31 = CGRectGetMidY(v50);
      CGPathAddLineToPoint(Mutable, 0, v30, v31);
      CGPathAddLineToPoint(Mutable, 0, v24, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v24, v26);
      v51.origin.x = v8;
      v51.origin.y = v10;
      v51.size.width = v12;
      v51.size.height = v14;
      v32 = CGRectGetMaxX(v51);
      CGPathAddLineToPoint(Mutable, 0, v32, v26);
      v52.origin.x = v8;
      v52.origin.y = v10;
      v52.size.width = v12;
      v52.size.height = v14;
      v33 = CGRectGetMaxX(v52);
    }
    CGPathAddLineToPoint(Mutable, 0, v33, v28);
    v41 = vabdd_f64(v26, v28);
  }
  if (v41 > 0.01)
    CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newStarPath
{
  CGPath *Mutable;
  double v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform m;

  Mutable = CGPathCreateMutable();
  -[CRLPointPathSource point](self, "point");
  v5 = (unint64_t)fmax(v4, 3.0);
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  v10 = v6 * 0.5;
  v11 = 2 * v5;
  -[CRLPointPathSource point](self, "point");
  v13 = v12;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v9 / v7);
  v18 = m;
  CGAffineTransformTranslate(&v19, &v18, v7 * 0.5, v7 * 0.5);
  m = v19;
  if (v11)
  {
    v14 = 0;
    v15 = v13 * v10;
    while (1)
    {
      v19.a = 0.0;
      v19.b = 0.0;
      v16 = 6.28318531 / (double)(unint64_t)v11 * (double)v14 + -1.57079633;
      if ((v14 & 1) != 0)
        break;
      sub_100061EF8(&v19.a, v7 * 0.5, v16);
      if (v14)
        goto LABEL_7;
      CGPathMoveToPoint(Mutable, &m, v19.a, v19.b);
LABEL_8:
      if (v11 == ++v14)
        goto LABEL_9;
    }
    sub_100061EF8(&v19.a, v15, v16);
LABEL_7:
    CGPathAddLineToPoint(Mutable, &m, v19.a, v19.b);
    goto LABEL_8;
  }
LABEL_9:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newPlusPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  Mutable = CGPathCreateMutable();
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  -[CRLPointPathSource point](self, "point");
  v9 = v8;
  v11 = sub_1003C65EC((v5 - v10) * 0.5, 0.0, v5);
  v12 = sub_1003C65EC((v7 - v9) * 0.5, 0.0, v7);
  CGPathMoveToPoint(Mutable, 0, v11, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, v12);
  CGPathAddLineToPoint(Mutable, 0, v5, v12);
  CGPathAddLineToPoint(Mutable, 0, v5, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, v7);
  CGPathAddLineToPoint(Mutable, 0, v11, v7);
  CGPathAddLineToPoint(Mutable, 0, v11, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v12);
  CGPathAddLineToPoint(Mutable, 0, v11, v12);
  CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (id)p_innerRadiusLocalizedPercent
{
  id v3;
  double v4;
  id v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)NSNumber);
  -[CRLPointPathSource point](self, "point");
  v5 = objc_msgSend(v3, "initWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPointPathSource p_percentageNumberFormatter](CRLPointPathSource, "p_percentageNumberFormatter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromNumber:", v5));

  return v7;
}

- (void)p_setControlKnobPointForArrow:(CGPoint)a3
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

  y = a3.y;
  x = a3.x;
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  v10 = v6 * 0.5;
  if (self->mType == 10)
    v11 = v10;
  else
    v11 = v7;
  v12 = sub_1003C65EC(x, 0.0, v11);
  if (-[CRLPointPathSource p_isRightFacingArrow](self, "p_isRightFacingArrow"))
    v12 = v7 - v12;
  v13 = sub_1003C65EC(y / v9, 0.0, 0.5);
  self->mPoint.x = v12;
  self->mPoint.y = v13;
}

- (CGPoint)p_getControlKnobPointForArrow
{
  double v3;
  double v4;
  double v5;
  double v6;
  unsigned int v7;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  v7 = -[CRLPointPathSource p_isRightFacingArrow](self, "p_isRightFacingArrow");
  x = self->mPoint.x;
  if (v7)
    x = v4 - x;
  v9 = v6 * self->mPoint.y;
  v10 = sub_1003C65EC(x, 0.0, v4);
  v11 = sub_1003C65EC(v9, 0.0, v6);
  v12 = v10;
  result.y = v11;
  result.x = v12;
  return result;
}

- (void)p_setControlKnobPointForStarPoints:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  int v18;

  y = a3.y;
  x = a3.x;
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  v10 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v11 = v9 - y;
  if (!v10)
    v11 = y;
  v12 = x - v7 * 0.5;
  v13 = v7 / v9 * (v11 - v9 * 0.5);
  v14 = sub_100061070(v12, v13);
  v15 = acos(-v12 / v14);
  if (v13 > 0.0)
    v15 = 6.28318531 - v15;
  v16 = v15 / 6.28318531 + -0.25;
  if (v16 < 0.0)
    v16 = v16 + 1.0;
  v17 = (unint64_t)(v16 * 18.0 + 3.5);
  if (v17 > 0x14)
    v17 = 3;
  v18 = (int)self->mPoint.x;
  if ((v18 != 3 || v17 == 4) && (v18 != 20 || v17 == 19))
    self->mPoint.x = (double)v17;
}

- (CGPoint)p_getControlKnobPointForStarPoints
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v3 = (int)fmax(self->mPoint.x, 3.0);
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  v8 = v4 * 0.5;
  v12 = 0.0;
  v13 = 0.0;
  sub_100061EF8(&v12, v4 * 0.5 * 0.7, ((float)((float)(v3 - 3) / 18.0) + -0.25) * 6.28318531);
  v12 = v8 + v12;
  v13 = v7 * 0.5 + v7 / v5 * v13;
  v9 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v10 = v12;
  v11 = v13;
  if (v9)
    v11 = v7 - v13;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)p_setControlKnobPointForStarInnerRadius:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint *p_mPoint;
  CGFloat v13;
  double v14;

  y = a3.y;
  x = a3.x;
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  if (-[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v9 - y;
  else
    v10 = y;
  v11 = sub_100061070(x - v7 * 0.5, v7 / v9 * (v10 - v9 * 0.5));
  p_mPoint = &self->mPoint;
  v13 = p_mPoint->x;
  v14 = sub_1003C65EC(v11 / (v7 * 0.5), 0.1, 1.0);
  p_mPoint->x = v13;
  p_mPoint->y = v14;
}

- (CGPoint)p_getControlKnobPointForStarInnerRadius
{
  CGPoint *p_mPoint;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  p_mPoint = &self->mPoint;
  v4 = (int)fmax(self->mPoint.x, 3.0);
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  v9 = v5 * 0.5;
  v10 = p_mPoint->y * (v5 * 0.5);
  v14 = 0.0;
  v15 = 0.0;
  sub_100061EF8(&v14, v10, 3.14159265 / (double)v4 + -1.57079633);
  v14 = v9 + v14;
  v15 = v8 * 0.5 + v8 / v6 * v15;
  v11 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v12 = v14;
  v13 = v15;
  if (v11)
    v13 = v8 - v15;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)p_setControlKnobPointForPlus:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a3.y;
  x = a3.x;
  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v8 = v6 - y * 2.0;
  v10 = sub_1003C65EC(v9 - x * 2.0, 0.0, v9 * 0.5);
  v11 = sub_1003C65EC(v8, 0.0, v7 * 0.5);
  self->mPoint.x = v10;
  self->mPoint.y = v11;
}

- (CGPoint)p_getControlKnobPointForPlus
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  -[CRLPointPathSource naturalSize](self, "naturalSize");
  v4 = (v3 - self->mPoint.x) * 0.5;
  v6 = (v5 - self->mPoint.y) * 0.5;
  result.y = v6;
  result.x = v4;
  return result;
}

- (BOOL)p_isRightFacingArrow
{
  if (self->mType == 1)
    return !-[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  else
    return 0;
}

- (BOOL)p_isFlippedDoubleArrow
{
  if (self->mType == 10)
    return -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  else
    return 0;
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRLPointPathSource inferredAccessibilityDescription](self, "inferredAccessibilityDescription"));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)inferredAccessibilityDescription
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v2 = -[CRLPointPathSource type](self, "type");
  v3 = 0;
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Star");
      goto LABEL_10;
    }
    if (v2 == 200)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Plus");
      goto LABEL_10;
    }
  }
  else
  {
    if ((unint64_t)v2 < 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Arrow");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

      return v3;
    }
    if (v2 == 10)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Double arrow");
      goto LABEL_10;
    }
  }
  return v3;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v2 = -[CRLPointPathSource type](self, "type");
  v3 = 0;
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Describe the selected star.");
      goto LABEL_10;
    }
    if (v2 == 200)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Describe the selected plus.");
      goto LABEL_10;
    }
  }
  else
  {
    if ((unint64_t)v2 < 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Describe the selected arrow.");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

      return v3;
    }
    if (v2 == 10)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Describe the selected double arrow.");
      goto LABEL_10;
    }
  }
  return v3;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = -[CRLPointPathSource type](self, "type");
  if (v4 <= 0xA && ((1 << v4) & 0x403) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Tail length and width");
  }
  else
  {
    if (v4 != 100)
      goto LABEL_9;
    if (a3 == 13)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Inner radius");
      goto LABEL_4;
    }
    if (a3 != 12)
    {
LABEL_9:
      v8 = 0;
      return v8;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Points");
  }
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, 0));

  return v8;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  double v5;
  void *v6;

  if ((id)-[CRLPointPathSource type](self, "type") != (id)100)
    goto LABEL_5;
  if (a3 == 13)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPointPathSource p_innerRadiusLocalizedPercent](self, "p_innerRadiusLocalizedPercent"));
    return v6;
  }
  if (a3 == 12)
  {
    -[CRLPointPathSource point](self, "point");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), (int)v5));
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
  return v6;
}

- (id)crlaxUserInputLabelForKnobTag:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPointPathSource crlaxLabelComponentForKnobTag:](self, "crlaxLabelComponentForKnobTag:", a3));
  v5 = -[CRLPointPathSource type](self, "type");
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Tail"), 0, 0));

    v4 = (void *)v7;
  }
  return v4;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return (id)-[CRLPointPathSource type](self, "type", a3) == (id)100;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  unint64_t v3;

  v3 = -[CRLPointPathSource type](self, "type", a3);
  return (v3 < 0xB) & (0x403u >> v3);
}

- (unint64_t)type
{
  return self->mType;
}

- (void)setType:(unint64_t)a3
{
  self->mType = a3;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->mPoint.x;
  y = self->mPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
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

@end
