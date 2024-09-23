@implementation CHBArea2DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v4;
  CHDArea2DType *v5;
  void *v6;
  CHDArea2DType *v7;

  v4 = a3;
  v5 = [CHDArea2DType alloc];
  objc_msgSend(v4, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHDArea2DType initWithChart:](v5, "initWithChart:", v6);

  objc_msgSend(a1, "readWithState:chartType:", v4, v7);
  return v7;
}

+ (void)readWithState:(id)a3 chartType:(id)a4
{
  id v5;
  uint64_t v6;
  XlChartArea *v7;
  uint64_t isStacked;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_msgSend(v9, "xlCurrentPlot");
  if (v6)
  {
    v7 = (XlChartArea *)(v6 + 144);
    isStacked = XlChartArea::isStacked((XlChartArea *)(v6 + 144));
    +[CHBChartTypeWithGrouping setGrouping:stacked:categoryPercentage:](CHBChartTypeWithGrouping, "setGrouping:stacked:categoryPercentage:", v5, isStacked, XlChartArea::isCategoryPercentage(v7));
  }

}

@end
