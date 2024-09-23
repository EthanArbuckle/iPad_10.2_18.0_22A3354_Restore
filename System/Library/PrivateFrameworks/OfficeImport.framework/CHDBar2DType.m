@implementation CHDBar2DType

- (CHDBar2DType)initWithChart:(id)a3
{
  CHDBar2DType *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDBar2DType;
  result = -[CHDChartTypeWithGrouping initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
  {
    *((_BYTE *)&result->super.mGrouping + 4) = 1;
    result->super.mGrouping = 150;
    *((_DWORD *)&result->super.super.mVaryColors + 1) = 0;
    result->mGapWidth = 0;
  }
  return result;
}

- (void)setOverlap:(int)a3
{
  self->mGapWidth = a3;
}

- (void)setGapWidth:(int)a3
{
  int v3;

  if (a3 >= 500)
    v3 = 500;
  else
    v3 = a3;
  self->super.mGrouping = v3;
}

- (void)setColumn:(BOOL)a3
{
  *((_BYTE *)&self->super.mGrouping + 4) = a3;
}

- (BOOL)isHorizontal
{
  return *((_BYTE *)&self->super.mGrouping + 4) == 0;
}

- (BOOL)isColumn
{
  return *((_BYTE *)&self->super.mGrouping + 4);
}

- (int)overlap
{
  return self->mGapWidth;
}

- (int)gapWidth
{
  return self->super.mGrouping;
}

- (int)defaultLabelPosition
{
  CHDDataLabel *mDefaultDataLabel;

  mDefaultDataLabel = self->super.super.mDefaultDataLabel;
  if (mDefaultDataLabel && -[CHDDataLabel position](mDefaultDataLabel, "position"))
    return -[CHDDataLabel position](self->super.super.mDefaultDataLabel, "position");
  if (-[CHDChartTypeWithGrouping isGroupingStacked](self, "isGroupingStacked"))
    return 3;
  return 1;
}

@end
