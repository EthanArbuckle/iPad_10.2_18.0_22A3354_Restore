@implementation CHDLine2DType

- (CHDLine2DType)initWithChart:(id)a3
{
  CHDLine2DType *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDLine2DType;
  result = -[CHDLineType initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
  {
    LOBYTE(result->super.super.mGrouping) = 1;
    BYTE1(result->super.super.mGrouping) = 0;
  }
  return result;
}

- (void)setShowMarker:(BOOL)a3
{
  LOBYTE(self->super.super.mGrouping) = a3;
}

- (BOOL)showMarker
{
  return self->super.super.mGrouping;
}

- (BOOL)isStockType
{
  return BYTE1(self->super.super.mGrouping);
}

- (void)setStockType:(BOOL)a3
{
  BYTE1(self->super.super.mGrouping) = a3;
}

@end
