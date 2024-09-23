@implementation CRLLineEnd

+ (id)simpleArrow
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("simple arrow"), 3.0, 0.0));
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledCircle
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  CRLLineEnd *v8;
  void *v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 6.0;
  v11.size.height = 6.0;
  v12 = CGRectInset(v11, 0.5, 0.5);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = +[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled circle"), MidX, CGRectGetMinY(v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  CGPathRelease(Mutable);
  return v9;
}

+ (id)filledDiamond
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled diamond"), 3.0, 0.331400007));
  CGPathRelease(Mutable);
  return v3;
}

+ (id)openArrow
{
  CGPath *Mutable;
  CRLLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  v3 = -[CRLLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:]([CRLLineEnd alloc], "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", Mutable, 0, 0, CFSTR("open arrow"), 1, 3.0, 0.0);
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledArrow
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 1.5);
  CGPathCloseSubpath(Mutable);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled arrow"), 3.0, 1.5));
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledSquare
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  CRLLineEnd *v8;
  void *v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 6.0;
  v11.size.height = 6.0;
  v12 = CGRectInset(v11, 0.5, 0.5);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGPathAddRect(Mutable, 0, v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = +[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled square"), MidX, CGRectGetMinY(v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  CGPathRelease(Mutable);
  return v9;
}

+ (id)openSquare
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  CRLLineEnd *v8;
  void *v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 6.0;
  v11.size.height = 6.0;
  v12 = CGRectInset(v11, 1.0, 1.0);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGPathAddRect(Mutable, 0, v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = +[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("open square"), MidX, CGRectGetMinY(v15) + -0.800000012);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  CGPathRelease(Mutable);
  return v9;
}

+ (id)openCircle
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  CRLLineEnd *v8;
  void *v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 6.0;
  v11.size.height = 6.0;
  v12 = CGRectInset(v11, 0.5, 0.5);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = +[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("open circle"), MidX, CGRectGetMinY(v15) + -0.800000012);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  CGPathRelease(Mutable);
  return v9;
}

+ (id)invertedArrow
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("inverted arrow"), 3.0, 0.331400007));
  CGPathRelease(Mutable);
  return v3;
}

+ (id)line
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("line"), 3.0, -0.800000012));
  CGPathRelease(Mutable);
  return v3;
}

+ (id)none
{
  return +[CRLLineEnd lineEndWithPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", 0, 0, CFSTR("none"), CGPointZero.x, CGPointZero.y);
}

+ (CRLLineEnd)lineEndWithType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v17 = v8;
  v18 = v7;
  v19 = v6;
  v20 = v5;
  v21 = v4;
  v22 = v3;
  switch(a3)
  {
    case 0:
      goto LABEL_22;
    case 1:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledCircle](CRLLineEnd, "filledCircle"));
      break;
    case 2:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledDiamond](CRLLineEnd, "filledDiamond"));
      break;
    case 3:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd openArrow](CRLLineEnd, "openArrow"));
      break;
    case 4:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledArrow](CRLLineEnd, "filledArrow"));
      break;
    case 5:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledSquare](CRLLineEnd, "filledSquare"));
      break;
    case 6:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd openSquare](CRLLineEnd, "openSquare"));
      break;
    case 7:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd openCircle](CRLLineEnd, "openCircle"));
      break;
    case 8:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd invertedArrow](CRLLineEnd, "invertedArrow"));
      break;
    case 9:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd line](CRLLineEnd, "line"));
      break;
    case 10:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd none](CRLLineEnd, "none"));
      break;
    case 11:
      v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F578);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3657C(v12, v13);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F598);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLLineEnd lineEndWithType:]", v8, v7, v6, v5, v21, v22, v9, v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLLineEnd.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 194, 0, "Should not ask for line end with this type (count)");

LABEL_22:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[CRLLineEnd simpleArrow](CRLLineEnd, "simpleArrow", v17, v18, v19, v20, v21, v22));
      break;
    default:
      return (CRLLineEnd *)a1;
  }
  return (CRLLineEnd *)a1;
}

+ (CRLLineEnd)lineEndWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("simple arrow")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd simpleArrow](CRLLineEnd, "simpleArrow"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled circle")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledCircle](CRLLineEnd, "filledCircle"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled diamond")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledDiamond](CRLLineEnd, "filledDiamond"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("open arrow")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd openArrow](CRLLineEnd, "openArrow"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled arrow")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledArrow](CRLLineEnd, "filledArrow"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled square")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd filledSquare](CRLLineEnd, "filledSquare"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("open square")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd openSquare](CRLLineEnd, "openSquare"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("open circle")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd openCircle](CRLLineEnd, "openCircle"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("inverted arrow")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd invertedArrow](CRLLineEnd, "invertedArrow"));
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("line")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd line](CRLLineEnd, "line"));
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("none")))
    {
      v5 = 0;
      goto LABEL_24;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd none](CRLLineEnd, "none"));
  }
  v5 = (void *)v4;
LABEL_24:

  return (CRLLineEnd *)v5;
}

+ (int64_t)lineEndTypeFromLineEnd:(id)a3
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("simple arrow")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("filled circle")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("filled diamond")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("open arrow")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("filled arrow")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("filled square")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("open square")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("open circle")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inverted arrow")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("line")) & 1) != 0)
  {
    v4 = 9;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("none"));
    v4 = 10;
  }

  return v4;
}

- (NSString)accessibilityDescription
{
  return (NSString *)+[CRLLineEnd accessibilityDescriptionFor:](CRLLineEnd, "accessibilityDescriptionFor:", +[CRLLineEnd lineEndTypeFromLineEnd:](CRLLineEnd, "lineEndTypeFromLineEnd:", self));
}

+ (id)accessibilityDescriptionFor:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Simple arrow");
      goto LABEL_13;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Filled circle");
      goto LABEL_13;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Filled diamond");
      goto LABEL_13;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Open arrow");
      goto LABEL_13;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Filled arrow");
      goto LABEL_13;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Filled square");
      goto LABEL_13;
    case 6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Open square");
      goto LABEL_13;
    case 7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Open circle");
      goto LABEL_13;
    case 8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Inverted arrow");
      goto LABEL_13;
    case 9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Line");
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    case 10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("NONE_ACCESSIBILITY_LABEL");
      v7 = CFSTR("None");
LABEL_14:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v7, 0));

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (CRLLineEnd)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v11;
  uint64_t v12;
  Class v13;
  id v14;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v11 = a6;
  objc_opt_class(a1, v12);
  v14 = objc_msgSend([v13 alloc], "initWithPath:endPoint:isFilled:identifier:", a3, v6, v11, x, y);

  return (CRLLineEnd *)v14;
}

+ (CRLLineEnd)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7
{
  _BOOL8 v7;
  double y;
  double x;
  id v13;
  uint64_t v14;
  Class v15;
  id v16;

  v7 = a6;
  y = a5.y;
  x = a5.x;
  v13 = a7;
  objc_opt_class(a1, v14);
  v16 = objc_msgSend([v15 alloc], "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, v7, v13, 0, x, y);

  return (CRLLineEnd *)v16;
}

- (CRLLineEnd)initWithBezierPath:(id)a3 wrapPath:(id)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  id v17;
  CRLLineEnd *v18;
  NSString *v19;
  NSString *identifier;
  CRLBezierPath *v21;
  CRLBezierPath *path;
  CRLBezierPath *v23;
  CRLBezierPath *wrapPath;
  objc_super v26;

  y = a5.y;
  x = a5.x;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CRLLineEnd;
  v18 = -[CRLLineEnd init](&v26, "init");
  if (v18)
  {
    v19 = (NSString *)objc_msgSend(v17, "copy");
    identifier = v18->_identifier;
    v18->_identifier = v19;

    v18->_lineJoin = a8;
    v21 = (CRLBezierPath *)objc_msgSend(v15, "copy");
    path = v18->_path;
    v18->_path = v21;

    v23 = (CRLBezierPath *)objc_msgSend(v16, "copy");
    wrapPath = v18->_wrapPath;
    v18->_wrapPath = v23;

    v18->_endPoint.x = x;
    v18->_endPoint.y = y;
    v18->_isFilled = a6;
  }

  return v18;
}

- (CRLLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  double y;
  double x;
  id v15;
  CRLLineEnd *v16;

  v8 = *(_QWORD *)&a8;
  v9 = a6;
  y = a5.y;
  x = a5.x;
  v15 = a7;
  if (a3)
    a3 = (CGPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", a3));
  if (a4)
    a4 = (CGPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", a4));
  v16 = -[CRLLineEnd initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, v9, v15, v8, x, y);

  return v16;
}

- (CRLLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return -[CRLLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, 0, a5, a6, 0, a4.x, a4.y);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLLineEnd *v5;
  double v6;
  uint64_t v7;
  CRLLineEnd *v8;
  void *v9;
  unsigned __int8 v10;
  int lineJoin;
  NSString *identifier;
  void *v13;
  CRLBezierPath *path;
  unsigned __int8 v15;

  v5 = (CRLLineEnd *)a3;
  if (self == v5)
  {
    v8 = 0;
LABEL_10:
    v15 = 1;
    goto LABEL_16;
  }
  *(_QWORD *)&v6 = objc_opt_class(self, v4).n128_u64[0];
  if (!-[CRLLineEnd isMemberOfClass:](v5, "isMemberOfClass:", v7, v6))
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  v8 = v5;
  if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("none")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](v8, "identifier"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("none"));

    if ((v10 & 1) != 0)
      goto LABEL_10;
  }
  lineJoin = self->_lineJoin;
  if (lineJoin == -[CRLLineEnd lineJoin](v8, "lineJoin"))
  {
    identifier = self->_identifier;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](v8, "identifier"));
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v13))
    {
      path = self->_path;
      if ((unint64_t)path | (unint64_t)v8->_path)
        v15 = -[CRLBezierPath isEqual:](path, "isEqual:");
      else
        v15 = 1;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;

  objc_opt_class(self, a2);
  return objc_msgSend([v4 alloc], "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", self->_path, self->_wrapPath, self->_isFilled, self->_identifier, self->_lineJoin, self->_endPoint.x, self->_endPoint.y);
}

- (CGImage)newLineEndImageOnRight:(BOOL)a3 forContentsScale:(double)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  _BOOL4 v8;
  CGContext *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat v17;
  CGFloat v18;
  CGFloat MaxX;
  CGFloat MaxY;
  double v21;
  double v22;
  id v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGImage *Image;
  CGAffineTransform v30;
  CGAffineTransform transform;
  CGAffineTransform v32;
  CGRect BoundingBox;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v10 = sub_10040FA64(11, a5.width * a4, a5.height * a4);
  CGContextScaleCTM(v10, a4, a4);
  CGContextSetRGBFillColor(v10, 0.0, 0.0, 0.0, 1.0);
  CGContextSetRGBStrokeColor(v10, 0.0, 0.0, 0.0, 1.0);
  v11 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.c = v12;
  v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v32.tx = v13;
  v14 = -width;
  if (v8)
  {
    *(_OWORD *)&transform.a = v11;
    *(_OWORD *)&transform.c = v12;
    *(_OWORD *)&transform.tx = v13;
    CGAffineTransformScale(&v32, &transform, -1.0, 1.0);
    v30 = v32;
    CGAffineTransformTranslate(&transform, &v30, v14, 0.0);
    v32 = transform;
  }
  v30 = v32;
  CGAffineTransformTranslate(&transform, &v30, 3.0, 1.0);
  v32 = transform;
  if (!-[CRLLineEnd isFilled](self, "isFilled"))
  {
    v30 = v32;
    CGAffineTransformTranslate(&transform, &v30, 0.5, 0.0);
    v32 = transform;
  }
  BoundingBox = CGPathGetBoundingBox(-[CRLBezierPath CGPath](self->_path, "CGPath"));
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  v17 = BoundingBox.size.width;
  v18 = BoundingBox.size.height;
  MaxX = 0.0;
  if (CGRectGetMinX(BoundingBox) < 0.0)
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = v17;
    v34.size.height = v18;
    MaxX = CGRectGetMaxX(v34);
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = v17;
  v35.size.height = v18;
  MaxY = CGRectGetMaxY(v35);
  v30 = v32;
  CGAffineTransformTranslate(&transform, &v30, MaxY, MaxX);
  v32 = transform;
  v30 = transform;
  CGAffineTransformRotate(&transform, &v30, 1.57079633);
  v32 = transform;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = v17;
  v36.size.height = v18;
  v21 = CGRectGetHeight(v36);
  v22 = 1.5;
  if (v21 * 1.5 > height)
  {
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = v17;
    v37.size.height = v18;
    v22 = height / (CGRectGetHeight(v37) * 1.5) * 1.5;
  }
  v30 = v32;
  CGAffineTransformScale(&transform, &v30, v22, v22);
  v32 = transform;
  CGContextConcatCTM(v10, &transform);
  CGContextSetLineJoin(v10, (CGLineJoin)-[CRLLineEnd lineJoin](self, "lineJoin"));
  CGContextSetLineWidth(v10, 0.5);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CRLLineEnd path](self, "path")));
  CGContextAddPath(v10, (CGPathRef)objc_msgSend(v23, "CGPath"));

  if (-[CRLLineEnd isFilled](self, "isFilled"))
    CGContextFillPath(v10);
  else
    CGContextStrokePath(v10);
  -[CRLLineEnd endPoint](self, "endPoint");
  v25 = v24;
  -[CRLLineEnd endPoint](self, "endPoint");
  CGContextMoveToPoint(v10, v25, v26 + 1.0);
  -[CRLLineEnd endPoint](self, "endPoint");
  CGContextAddLineToPoint(v10, v27, v14);
  CGContextStrokePath(v10);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

- (CRLBezierPath)wrapPath
{
  CRLBezierPath *wrapPath;

  wrapPath = self->_wrapPath;
  if (!wrapPath)
    wrapPath = self->_path;
  return (CRLBezierPath *)-[CRLBezierPath copy](wrapPath, "copy");
}

- (BOOL)isNone
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("none"));

  return v3;
}

- (BOOL)isArrow
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](self, "identifier"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("simple arrow")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](self, "identifier"));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("open arrow")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](self, "identifier"));
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("filled arrow"));

    }
  }

  return v4;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEnd identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p %@>"), v5, self, v6));

  return v7;
}

- (double)scaleForStrokeWidth:(double)result
{
  if (result > 1.0)
    return (result + -1.0) * 0.6 + 1.0;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CRLBezierPath)path
{
  return self->_path;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->_isFilled;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_wrapPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
