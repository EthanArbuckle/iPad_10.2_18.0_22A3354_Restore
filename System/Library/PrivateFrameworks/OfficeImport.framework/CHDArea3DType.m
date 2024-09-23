@implementation CHDArea3DType

- (CHDArea3DType)initWithChart:(id)a3
{
  CHDArea3DType *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDArea3DType;
  result = -[CHDArea2DType initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
    result->super.super.mGrouping = 150;
  return result;
}

+ (BOOL)is3DType
{
  return 1;
}

- (void)setGapDepth:(int)a3
{
  self->super.super.mGrouping = a3;
}

- (int)gapDepth
{
  return self->super.super.mGrouping;
}

@end
