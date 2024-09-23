@implementation TSDLineEnd

+ (id)simpleArrow
{
  CGPath *Mutable;
  TSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("simple arrow"), 3.0, 0.0);
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
  TSDLineEnd *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 0.5, 0.5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled circle"), MidX, CGRectGetMinY(v14));
  CGPathRelease(Mutable);
  return v8;
}

+ (id)filledDiamond
{
  CGPath *Mutable;
  TSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled diamond"), 3.0, 0.331400007);
  CGPathRelease(Mutable);
  return v3;
}

+ (id)openArrow
{
  CGPath *Mutable;
  TSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  v3 = -[TSDLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:]([TSDLineEnd alloc], "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", Mutable, 0, 0, CFSTR("open arrow"), 1, 3.0, 0.0);
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledArrow
{
  CGPath *Mutable;
  TSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 1.5);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled arrow"), 3.0, 1.5);
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
  TSDLineEnd *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 0.5, 0.5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled square"), MidX, CGRectGetMinY(v14));
  CGPathRelease(Mutable);
  return v8;
}

+ (id)openSquare
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  TSDLineEnd *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 1.0, 1.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("open square"), MidX, CGRectGetMinY(v14) + -0.800000012);
  CGPathRelease(Mutable);
  return v8;
}

+ (id)openCircle
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  TSDLineEnd *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 0.5, 0.5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("open circle"), MidX, CGRectGetMinY(v14) + -0.800000012);
  CGPathRelease(Mutable);
  return v8;
}

+ (id)invertedArrow
{
  CGPath *Mutable;
  TSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("inverted arrow"), 3.0, 0.331400007);
  CGPathRelease(Mutable);
  return v3;
}

+ (id)line
{
  CGPath *Mutable;
  TSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  v3 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("line"), 3.0, -0.800000012);
  CGPathRelease(Mutable);
  return v3;
}

+ (id)none
{
  return +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", 0, 0, CFSTR("none"), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

+ (id)lineEndWithType:(int)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow");
      break;
    case 1:
      result = +[TSDLineEnd filledCircle](TSDLineEnd, "filledCircle");
      break;
    case 2:
      result = +[TSDLineEnd filledDiamond](TSDLineEnd, "filledDiamond");
      break;
    case 3:
      result = +[TSDLineEnd openArrow](TSDLineEnd, "openArrow");
      break;
    case 4:
      result = +[TSDLineEnd filledArrow](TSDLineEnd, "filledArrow");
      break;
    case 5:
      result = +[TSDLineEnd filledSquare](TSDLineEnd, "filledSquare");
      break;
    case 6:
      result = +[TSDLineEnd openSquare](TSDLineEnd, "openSquare");
      break;
    case 7:
      result = +[TSDLineEnd openCircle](TSDLineEnd, "openCircle");
      break;
    case 8:
      result = +[TSDLineEnd invertedArrow](TSDLineEnd, "invertedArrow");
      break;
    case 9:
      result = +[TSDLineEnd line](TSDLineEnd, "line");
      break;
    case 10:
      result = +[TSDLineEnd none](TSDLineEnd, "none");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)lineEndWithIdentifier:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("simple arrow")))
    return +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("filled circle")))
    return +[TSDLineEnd filledCircle](TSDLineEnd, "filledCircle");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("filled diamond")))
    return +[TSDLineEnd filledDiamond](TSDLineEnd, "filledDiamond");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("open arrow")))
    return +[TSDLineEnd openArrow](TSDLineEnd, "openArrow");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("filled arrow")))
    return +[TSDLineEnd filledArrow](TSDLineEnd, "filledArrow");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("filled square")))
    return +[TSDLineEnd filledSquare](TSDLineEnd, "filledSquare");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("open square")))
    return +[TSDLineEnd openSquare](TSDLineEnd, "openSquare");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("open circle")))
    return +[TSDLineEnd openCircle](TSDLineEnd, "openCircle");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("inverted arrow")))
    return +[TSDLineEnd invertedArrow](TSDLineEnd, "invertedArrow");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("line")))
    return +[TSDLineEnd line](TSDLineEnd, "line");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("none")))
    return +[TSDLineEnd none](TSDLineEnd, "none");
  return 0;
}

+ (id)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:endPoint:isFilled:identifier:", a3, a5, a6, a4.x, a4.y);
}

+ (id)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, a6, a7, 0, a5.x, a5.y);
}

- (TSDLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  CGFloat y;
  CGFloat x;
  TSDLineEnd *v15;
  objc_super v17;

  y = a5.y;
  x = a5.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDLineEnd;
  v15 = -[TSDLineEnd init](&v17, sel_init);
  if (v15)
  {
    v15->mIdentifier = (NSString *)objc_msgSend(a7, "copy");
    v15->mLineJoin = a8;
    v15->mPath = CGPathCreateMutableCopy(a3);
    v15->mWrapPath = CGPathCreateMutableCopy(a4);
    v15->mEndPoint.x = x;
    v15->mEndPoint.y = y;
    v15->mIsFilled = a6;
  }
  return v15;
}

- (TSDLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return -[TSDLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, 0, a5, a6, 0, a4.x, a4.y);
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->mPath);
  CGPathRelease(self->mWrapPath);

  v3.receiver = self;
  v3.super_class = (Class)TSDLineEnd;
  -[TSDLineEnd dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->mIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
      LOBYTE(v5) = -[NSString isEqualToString:](self->mIdentifier, "isEqualToString:", objc_msgSend(a3, "identifier"));
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", self->mPath, self->mWrapPath, self->mIsFilled, self->mIdentifier, self->mLineJoin, self->mEndPoint.x, self->mEndPoint.y);
}

- (CGImage)newLineEndImageOnRight:(BOOL)a3 forContentsScale:(double)a4 withSize:(CGSize)a5
{
  double width;
  _BOOL4 v7;
  CGContext *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  CGFloat MaxY;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGImage *Image;
  CGAffineTransform v21;
  CGAffineTransform transform;
  CGAffineTransform v23;
  CGRect BoundingBox;

  width = a5.width;
  v7 = a3;
  v9 = TSDBitmapContextCreate(11, a5.width * a4);
  CGContextScaleCTM(v9, a4, a4);
  CGContextSetRGBFillColor(v9, 0.0, 0.0, 0.0, 1.0);
  CGContextSetRGBStrokeColor(v9, 0.0, 0.0, 0.0, 1.0);
  v10 = *MEMORY[0x24BDBD8B8];
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v23.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v23.c = v11;
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v23.tx = v12;
  v13 = -width;
  if (v7)
  {
    *(_OWORD *)&transform.a = v10;
    *(_OWORD *)&transform.c = v11;
    *(_OWORD *)&transform.tx = v12;
    CGAffineTransformScale(&v23, &transform, -1.0, 1.0);
    v21 = v23;
    CGAffineTransformTranslate(&transform, &v21, v13, 0.0);
    v23 = transform;
  }
  v21 = v23;
  CGAffineTransformTranslate(&transform, &v21, 3.0, 1.0);
  v23 = transform;
  if (!-[TSDLineEnd isFilled](self, "isFilled"))
  {
    v21 = v23;
    CGAffineTransformTranslate(&transform, &v21, 0.5, 0.0);
    v23 = transform;
  }
  v21 = v23;
  CGAffineTransformScale(&transform, &v21, 1.5, 1.5);
  v23 = transform;
  BoundingBox = CGPathGetBoundingBox(-[TSDLineEnd path](self, "path"));
  MaxY = CGRectGetMaxY(BoundingBox);
  v21 = v23;
  CGAffineTransformTranslate(&transform, &v21, MaxY, 0.0);
  v23 = transform;
  v21 = transform;
  CGAffineTransformRotate(&transform, &v21, 1.57079633);
  v23 = transform;
  CGContextConcatCTM(v9, &transform);
  CGContextSetLineJoin(v9, (CGLineJoin)-[TSDLineEnd lineJoin](self, "lineJoin"));
  CGContextSetLineWidth(v9, 0.5);
  CGContextAddPath(v9, -[TSDLineEnd path](self, "path"));
  if (-[TSDLineEnd isFilled](self, "isFilled"))
    CGContextFillPath(v9);
  else
    CGContextStrokePath(v9);
  -[TSDLineEnd endPoint](self, "endPoint");
  v16 = v15;
  -[TSDLineEnd endPoint](self, "endPoint");
  CGContextMoveToPoint(v9, v16, v17 + 1.0);
  -[TSDLineEnd endPoint](self, "endPoint");
  CGContextAddLineToPoint(v9, v18, v13);
  CGContextStrokePath(v9);
  Image = CGBitmapContextCreateImage(v9);
  CGContextRelease(v9);
  return Image;
}

- (CGPath)wrapPath
{
  CGPath *result;

  result = self->mWrapPath;
  if (!result)
    return self->mPath;
  return result;
}

- (BOOL)isNone
{
  return -[NSString isEqualToString:](-[TSDLineEnd identifier](self, "identifier"), "isEqualToString:", CFSTR("none"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), NSStringFromClass(v4), self, -[TSDLineEnd identifier](self, "identifier"));
}

- (NSString)identifier
{
  return self->mIdentifier;
}

- (CGPath)path
{
  return self->mPath;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mEndPoint.x;
  y = self->mEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->mIsFilled;
}

- (int)lineJoin
{
  return self->mLineJoin;
}

@end
