@implementation CHDArea2DType

- (CHDArea2DType)initWithChart:(id)a3
{
  CHDArea2DType *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDArea2DType;
  result = -[CHDChartTypeWithGrouping initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
    *((_DWORD *)&result->super.super.mVaryColors + 1) = 3;
  return result;
}

- (int)defaultLabelPosition
{
  CHDDataLabel *mDefaultDataLabel;

  mDefaultDataLabel = self->super.super.mDefaultDataLabel;
  if (mDefaultDataLabel && -[CHDDataLabel position](mDefaultDataLabel, "position"))
    return -[CHDDataLabel position](self->super.super.mDefaultDataLabel, "position");
  else
    return 6;
}

@end
