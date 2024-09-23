@implementation CHDBar3DType

- (CHDBar3DType)initWithChart:(id)a3
{
  CHDBar3DType *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDBar3DType;
  result = -[CHDBar2DType initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
  {
    *(_DWORD *)&result->super.mColumn = 150;
    result->super.mOverlap = 0;
  }
  return result;
}

- (void)setGapDepth:(int)a3
{
  *(_DWORD *)&self->super.mColumn = a3;
}

- (void)setShapeType:(int)a3
{
  self->super.mOverlap = a3;
}

- (int)shapeType
{
  return self->super.mOverlap;
}

+ (BOOL)is3DType
{
  return 1;
}

- (int)gapDepth
{
  return *(_DWORD *)&self->super.mColumn;
}

+ (id)stringWithShapeType:(int)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("box");
  else
    return off_24F3A7880[a3 - 1];
}

@end
