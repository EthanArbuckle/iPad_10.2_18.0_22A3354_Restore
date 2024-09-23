@implementation CRLSwappableAxesGeometry

- (id)initFlipped:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLSwappableAxesGeometry;
  result = -[CRLSwappableAxesGeometry init](&v5, "init");
  if (result)
    *((_BYTE *)result + 16) = a3;
  return result;
}

+ (id)standardAxesGeometry
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_101414AB8;
  if (!qword_101414AB8)
  {
    v3 = -[CRLSwappableAxesGeometry initFlipped:]([CRLSwappableAxesGeometry alloc], "initFlipped:", 0);
    v4 = (void *)qword_101414AB8;
    qword_101414AB8 = (uint64_t)v3;

    v2 = (void *)qword_101414AB8;
  }
  return v2;
}

+ (id)swappedAxesGeometry
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_101414AC0;
  if (!qword_101414AC0)
  {
    v3 = -[CRLSwappableAxesGeometry initFlipped:]([CRLSwappableAxesGeometry alloc], "initFlipped:", 1);
    v4 = (void *)qword_101414AC0;
    qword_101414AC0 = (uint64_t)v3;

    v2 = (void *)qword_101414AC0;
  }
  return v2;
}

+ (id)geometryWithXAxisAlongEdge:(int)a3
{
  void *v3;

  if ((a3 - 3) < 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry swappedAxesGeometry](CRLSwappableAxesGeometry, "swappedAxesGeometry"));
  }
  else if (a3 > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry standardAxesGeometry](CRLSwappableAxesGeometry, "standardAxesGeometry"));
  }
  return v3;
}

- (unint64_t)knobTagForStandardKnobTag:(unint64_t)a3
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->mFlipped)
  {
    if (a3 < 0xA && ((0x3DFu >> a3) & 1) != 0)
    {
      return qword_100EEC098[a3];
    }
    else
    {
      v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C8A0);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE82B0(v3, v4);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C8C0);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v5, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSwappableAxesGeometry knobTagForStandardKnobTag:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSwappableAxesGeometry.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 88, 0, "Unexpected knob tag");

      return 0;
    }
  }
  return a3;
}

- (int)edgeForStandardRectEdge:(int)a3
{
  if (self->mFlipped)
  {
    if ((a3 - 1) > 4)
      return 3;
    else
      return dword_100EEC0E8[a3 - 1];
  }
  return a3;
}

- (int)horizontalOrientation
{
  return self->mFlipped;
}

- (int)verticalOrientation
{
  return !self->mFlipped;
}

- (BOOL)rect:(CGRect)a3 horizontallyOverlapsRect:(CGRect)a4
{
  if (self->mFlipped)
    return sub_100060120(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  else
    return sub_1000601E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)rect:(CGRect)a3 verticallyOverlapsRect:(CGRect)a4
{
  if (self->mFlipped)
    return sub_1000601E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  else
    return sub_100060120(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (double)rectMinX:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetMinY(a3);
  else
    return CGRectGetMinX(a3);
}

- (double)rectMinY:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetMinX(a3);
  else
    return CGRectGetMinY(a3);
}

- (double)rectMidX:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetMidY(a3);
  else
    return CGRectGetMidX(a3);
}

- (double)rectMidY:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetMidX(a3);
  else
    return CGRectGetMidY(a3);
}

- (double)rectMaxX:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetMaxY(a3);
  else
    return CGRectGetMaxX(a3);
}

- (double)rectMaxY:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetMaxX(a3);
  else
    return CGRectGetMaxY(a3);
}

- (double)rectWidth:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetHeight(a3);
  else
    return CGRectGetWidth(a3);
}

- (double)rectHeight:(CGRect)a3
{
  if (self->mFlipped)
    return CGRectGetWidth(a3);
  else
    return CGRectGetHeight(a3);
}

- (CGRect)makeRectWithX:(double)a3 Y:(double)a4 width:(double)a5 height:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (self->mFlipped)
    v6 = a4;
  else
    v6 = a3;
  if (self->mFlipped)
  {
    a4 = a3;
    v7 = a6;
  }
  else
  {
    v7 = a5;
  }
  if (self->mFlipped)
    a6 = a5;
  v8 = v6;
  v9 = v7;
  result.size.height = a6;
  result.size.width = v9;
  result.origin.y = a4;
  result.origin.x = v8;
  return result;
}

- (CGRect)makeHorizontalSpacingRectBetweenRect:(CGRect)a3 andRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (self->mFlipped)
    v4 = sub_100060E00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  else
    v4 = sub_100060CC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)makeVerticalSpacingRectBetweenRect:(CGRect)a3 andRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (self->mFlipped)
    v4 = sub_100060CC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  else
    v4 = sub_100060E00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)pointX:(CGPoint)a3
{
  if (self->mFlipped)
    a3.x = a3.y;
  return a3.x;
}

- (double)pointY:(CGPoint)a3
{
  if (!self->mFlipped)
    a3.x = a3.y;
  return a3.x;
}

- (CGPoint)makePointWithX:(double)a3 Y:(double)a4
{
  double v4;
  double v5;
  CGPoint result;

  if (self->mFlipped)
    v4 = a4;
  else
    v4 = a3;
  if (self->mFlipped)
    a4 = a3;
  v5 = v4;
  result.y = a4;
  result.x = v5;
  return result;
}

- (id)description
{
  const __CFString *v2;

  if (self->mFlipped)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CRLSwappableAxesGeometry: %p isFlipped: %@>"), self, v2);
}

- (BOOL)isFlipped
{
  return self->mFlipped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAdditionalOrientationIndependentValues, 0);
}

@end
