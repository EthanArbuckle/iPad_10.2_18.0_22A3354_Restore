@implementation WDAAnchor

- (WDAAnchor)init
{
  WDAAnchor *v2;
  WDAAnchor *v3;
  NSArray *mTextWrapPoints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDAAnchor;
  v2 = -[WDAAnchor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->mTextWrappingMode = 3;
    mTextWrapPoints = v2->mTextWrapPoints;
    v2->mTextWrapPoints = 0;

    *(_OWORD *)&v3->mHorizontalPosition = xmmword_22A4D22B0;
    *(_OWORD *)&v3->mWrapDistanceLeft = xmmword_22A4D22C0;
    *(_OWORD *)&v3->mWrapDistanceRight = xmmword_22A4D22C0;
    v3->mAllowOverlap = 1;
    v3->mZIndex = 0;
  }
  return v3;
}

- (void)setHorizontalPosition:(int)a3
{
  self->mHorizontalPosition = a3;
}

- (void)setRelativeHorizontalPosition:(int)a3
{
  self->mRelativeHorizontalPosition = a3;
}

- (void)setVerticalPosition:(int)a3
{
  self->mVerticalPosition = a3;
}

- (void)setRelativeVerticalPosition:(int)a3
{
  self->mRelativeVerticalPosition = a3;
}

- (void)setWrapDistanceLeft:(double)a3
{
  self->mWrapDistanceLeft = a3;
}

- (void)setWrapDistanceTop:(double)a3
{
  self->mWrapDistanceTop = a3;
}

- (void)setWrapDistanceRight:(double)a3
{
  self->mWrapDistanceRight = a3;
}

- (void)setWrapDistanceBottom:(double)a3
{
  self->mWrapDistanceBottom = a3;
}

- (void)setAllowOverlap:(BOOL)a3
{
  self->mAllowOverlap = a3;
}

- (void)setZIndex:(int64_t)a3
{
  self->mZIndex = a3;
}

- (void)setTextWrappingMode:(int)a3
{
  self->mTextWrappingMode = a3;
}

- (void)setTextWrappingModeType:(int)a3
{
  self->mTextWrappingModeType = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int)relativeVerticalPosition
{
  return self->mRelativeVerticalPosition;
}

- (int)textWrappingMode
{
  return self->mTextWrappingMode;
}

- (int)relativeHorizontalPosition
{
  return self->mRelativeHorizontalPosition;
}

- (int64_t)zIndex
{
  return self->mZIndex;
}

+ (id)stringForTextWrappingModeType:(int)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_24F3B1C90[a3];
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAAnchor;
  -[WDAAnchor description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)textWrappingModeType
{
  return self->mTextWrappingModeType;
}

- (NSArray)textWrapPoints
{
  return self->mTextWrapPoints;
}

- (void)setTextWrapPoints:(id)a3
{
  objc_storeStrong((id *)&self->mTextWrapPoints, a3);
}

- (double)wrapDistanceLeft
{
  return self->mWrapDistanceLeft;
}

- (double)wrapDistanceRight
{
  return self->mWrapDistanceRight;
}

- (double)wrapDistanceTop
{
  return self->mWrapDistanceTop;
}

- (double)wrapDistanceBottom
{
  return self->mWrapDistanceBottom;
}

- (int)horizontalPosition
{
  return self->mHorizontalPosition;
}

- (int)verticalPosition
{
  return self->mVerticalPosition;
}

- (BOOL)allowOverlap
{
  return self->mAllowOverlap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextWrapPoints, 0);
}

@end
