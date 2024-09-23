@implementation CHBBar2DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDBar2DType *v4;
  void *v5;
  CHDBar2DType *v6;

  v3 = a3;
  v4 = [CHDBar2DType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDBar2DType initWithChart:](v4, "initWithChart:", v5);

  +[CHBBar2DType readWithState:chartType:](CHBBar2DType, "readWithState:chartType:", v3, v6);
  return v6;
}

+ (void)readWithState:(id)a3 chartType:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  XlChartBar *v8;
  uint64_t isStacked;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_msgSend(v10, "xlCurrentPlot");
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v5, "setOverlap:", *(__int16 *)(v6 + 160));
    objc_msgSend(v5, "setGapWidth:", *(__int16 *)(v7 + 162));
    v8 = (XlChartBar *)(v7 + 144);
    objc_msgSend(v5, "setColumn:", XlChartBar::isTranspose(v8) ^ 1);
    isStacked = XlChartBar::isStacked(v8);
    +[CHBChartTypeWithGrouping setGrouping:stacked:categoryPercentage:](CHBChartTypeWithGrouping, "setGrouping:stacked:categoryPercentage:", v5, isStacked, XlChartBar::isCategoryPercentage(v8));
  }

}

@end
