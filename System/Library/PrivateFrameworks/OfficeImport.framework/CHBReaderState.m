@implementation CHBReaderState

- (CHBReaderState)initWithEBReaderSheetState:(id)a3
{
  id v5;
  CHBReaderState *v6;
  CHBReaderState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHBReaderState;
  v6 = -[CHBState init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mEBReaderSheetState, a3);
    v7->mXlReader = (void *)objc_msgSend(v5, "xlReader");
    v7->mXlCurrentPlot = 0;
  }

  return v7;
}

- (void)xlReader
{
  return self->mXlReader;
}

- (id)ebReaderSheetState
{
  return self->mEBReaderSheetState;
}

- (void)readAndCacheXlChartDataSeries
{
  int SeriesCount;
  int v4;
  void *value;

  if (self->mXlReader)
  {
    -[CHBState deleteXlChartDataSeriesCollection](self, "deleteXlChartDataSeriesCollection");
    self->super.mXlChartDataSeriesCollection = CFArrayCreateMutable(0, 0, 0);
    SeriesCount = XlChartBinaryReader::getSeriesCount((XlChartBinaryReader *)self->mXlReader);
    self->super.mXlSeriesCount = SeriesCount;
    if (SeriesCount)
    {
      v4 = 0;
      do
      {
        value = 0;
        (*(void (**)(void *, _QWORD, void **, uint64_t))(*(_QWORD *)self->mXlReader + 736))(self->mXlReader, (unsigned __int16)v4, &value, 1);
        CFArrayAppendValue(self->super.mXlChartDataSeriesCollection, value);
        ++v4;
      }
      while (v4 < self->super.mXlSeriesCount);
    }
  }
}

- (id)resources
{
  return -[EBReaderSheetState resources](self->mEBReaderSheetState, "resources");
}

- (void)setAxisGroup:(int)a3
{
  self->mAxisGroup = a3;
}

- (int)axisGroup
{
  return self->mAxisGroup;
}

- (id)workbook
{
  return -[EBReaderSheetState workbook](self->mEBReaderSheetState, "workbook");
}

- (int)xlPlotCount
{
  return XlChartBinaryReader::getPlotCount((uint64_t)self->mXlReader, self->mAxisGroup);
}

- (void)setXlCurrentPlotIndex:(int)a3
{
  self->mXlCurrentPlotIndex = a3;
}

- (void)setXlCurrentPlot:(void *)a3
{
  self->mXlCurrentPlot = a3;
}

- (void)xlCurrentPlot
{
  return self->mXlCurrentPlot;
}

- (int)xlCurrentPlotIndex
{
  return self->mXlCurrentPlotIndex;
}

- (const)xlCurrentDefaultSeriesFormat
{
  return -[CHBReaderState defaultFormatForXlSeries:](self, "defaultFormatForXlSeries:", -[CHBState xlChartDataSeriesAtIndex:](self, "xlChartDataSeriesAtIndex:", self->super.mXlCurrentSeriesIndex));
}

- (const)defaultFormatForXlSeries:(const void *)a3
{
  const XlChartSeriesFormat *result;

  if (!a3)
    return 0;
  if (((*((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 6)) & 0x7FFF8) == 0)
    return 0;
  result = (const XlChartSeriesFormat *)XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a3, 0);
  if (result)
  {
    if (result->var9 >= 0)
      return 0;
  }
  return result;
}

- (OADColorScheme)colorScheme
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EBReaderSheetState workbook](self->mEBReaderSheetState, "workbook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (OADColorScheme *)v5;
}

- (void)setChart:(id)a3
{
  id v4;
  CHAutoStyling *v5;
  CHAutoStyling *mAutoStyling;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHBReaderState;
  -[CHBState setChart:](&v7, sel_setChart_, v4);
  +[CHAutoStyling autoStylingWithChart:drawingTheme:](CHAutoStyling, "autoStylingWithChart:drawingTheme:", v4, 0);
  v5 = (CHAutoStyling *)objc_claimAutoreleasedReturnValue();
  mAutoStyling = self->mAutoStyling;
  self->mAutoStyling = v5;

}

- (id)autoStyling
{
  return self->mAutoStyling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAutoStyling, 0);
  objc_storeStrong((id *)&self->mEBReaderSheetState, 0);
}

@end
