@implementation CHBState

- (CHBState)init
{
  CHBState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHBState;
  result = -[CHBState init](&v3, sel_init);
  if (result)
  {
    result->mXlChartDataSeriesCollection = 0;
    *(_QWORD *)&result->mXlSeriesCount = 0;
    *(_QWORD *)((char *)&result->mXlCurrentSeriesIndex + 2) = 0;
  }
  return result;
}

- (void)setChart:(id)a3
{
  CHDChart *v5;
  CHDChart **p_mChart;
  CHDChart *mChart;
  CHDChart *v8;

  v5 = (CHDChart *)a3;
  mChart = self->mChart;
  p_mChart = &self->mChart;
  if (mChart != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mChart, a3);
    v5 = v8;
  }

}

- (id)chart
{
  return self->mChart;
}

- (void)deleteXlChartDataSeriesCollection
{
  __CFArray *mXlChartDataSeriesCollection;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;

  mXlChartDataSeriesCollection = self->mXlChartDataSeriesCollection;
  if (mXlChartDataSeriesCollection)
  {
    Count = CFArrayGetCount(mXlChartDataSeriesCollection);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->mXlChartDataSeriesCollection, i);
        if (ValueAtIndex)
          (*(void (**)(const void *))(*(_QWORD *)ValueAtIndex + 8))(ValueAtIndex);
      }
    }
    CFArrayRemoveAllValues(self->mXlChartDataSeriesCollection);
    CFRelease(self->mXlChartDataSeriesCollection);
    self->mXlChartDataSeriesCollection = 0;
  }
}

- (int)xlSeriesCount
{
  return self->mXlSeriesCount;
}

- (void)xlChartDataSeriesAtIndex:(int)a3
{
  if (self->mXlCurrentSeriesIndex < 0 || !CFArrayGetCount(self->mXlChartDataSeriesCollection))
    return 0;
  else
    return (void *)CFArrayGetValueAtIndex(self->mXlChartDataSeriesCollection, a3);
}

- (void)setXlCurrentSeriesIndex:(int)a3
{
  self->mXlCurrentSeriesIndex = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[CHBState deleteXlChartDataSeriesCollection](self, "deleteXlChartDataSeriesCollection");
  v3.receiver = self;
  v3.super_class = (Class)CHBState;
  -[CHBState dealloc](&v3, sel_dealloc);
}

- (id)workbook
{
  return 0;
}

- (id)resources
{
  return 0;
}

- (void)xlCurrentChartDataSeries
{
  CFIndex mXlCurrentSeriesIndex;
  __CFArray *mXlChartDataSeriesCollection;

  mXlCurrentSeriesIndex = self->mXlCurrentSeriesIndex;
  if ((mXlCurrentSeriesIndex & 0x80000000) != 0)
    return 0;
  mXlChartDataSeriesCollection = self->mXlChartDataSeriesCollection;
  if (!mXlChartDataSeriesCollection)
    return 0;
  else
    return (void *)CFArrayGetValueAtIndex(mXlChartDataSeriesCollection, mXlCurrentSeriesIndex);
}

- (int)xlCurrentChartDataSeriesIndex
{
  return self->mXlCurrentSeriesIndex;
}

- (BOOL)hasPrimaryMixedArea
{
  return self->mHasPrimaryMixedArea;
}

- (void)setHasPrimaryMixedArea:(BOOL)a3
{
  self->mHasPrimaryMixedArea = a3;
}

- (BOOL)hasPrimaryMixedColumn
{
  return self->mHasPrimaryMixedColumn;
}

- (void)setHasPrimaryMixedColumn:(BOOL)a3
{
  self->mHasPrimaryMixedColumn = a3;
}

- (BOOL)hasPrimaryMixedLine
{
  return self->mHasPrimaryMixedLine;
}

- (void)setHasPrimaryMixedLine:(BOOL)a3
{
  self->mHasPrimaryMixedLine = a3;
}

- (BOOL)hasSecondaryMixedArea
{
  return self->mHasSecondaryMixedArea;
}

- (void)setHasSecondaryMixedArea:(BOOL)a3
{
  self->mHasSecondaryMixedArea = a3;
}

- (BOOL)hasSecondaryMixedColumn
{
  return self->mHasSecondaryMixedColumn;
}

- (void)setHasSecondaryMixedColumn:(BOOL)a3
{
  self->mHasSecondaryMixedColumn = a3;
}

- (BOOL)hasSecondaryMixedLine
{
  return self->mHasSecondaryMixedLine;
}

- (void)setHasSecondaryMixedLine:(BOOL)a3
{
  self->mHasSecondaryMixedLine = a3;
}

- (BOOL)isMixedChart
{
  return self->mHasPrimaryMixedArea
      || self->mHasPrimaryMixedColumn
      || self->mHasPrimaryMixedLine
      || self->mHasSecondaryMixedArea
      || self->mHasSecondaryMixedColumn
      || self->mHasSecondaryMixedLine;
}

- (unsigned)chartGroupIndexForType:(int)a3 isForPrimary:(BOOL)a4
{
  unsigned int v7;
  _BOOL4 v8;
  int v9;

  if (a3 == 3 && a4)
    return 0;
  v7 = -[CHBState hasPrimaryMixedArea](self, "hasPrimaryMixedArea");
  if (a3 != 3 || a4)
  {
    v8 = -[CHBState hasSecondaryMixedArea](self, "hasSecondaryMixedArea");
    if (v7)
      v9 = 2;
    else
      v9 = 1;
    if (v8)
      v7 = v9;
    if (a3 != 2 || !a4)
    {
      v7 += -[CHBState hasPrimaryMixedColumn](self, "hasPrimaryMixedColumn");
      if (a3 != 2 || a4)
      {
        v7 += -[CHBState hasSecondaryMixedColumn](self, "hasSecondaryMixedColumn");
        if (a3 != 1 || !a4)
          v7 += -[CHBState hasPrimaryMixedLine](self, "hasPrimaryMixedLine");
      }
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChart, 0);
}

@end
