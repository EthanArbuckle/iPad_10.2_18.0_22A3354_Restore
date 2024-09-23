@implementation CHBSeriesAxis

+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4
{
  id v5;
  CHDSeriesAxis *v6;
  void *v7;
  CHDSeriesAxis *v8;
  __int16 *var0;
  XlChartTextFrame *var2;

  v5 = a4;
  if (a3)
  {
    v6 = [CHDSeriesAxis alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CHDSeriesAxis initWithResources:](v6, "initWithResources:", v7);

    var0 = (__int16 *)a3[1].var0;
    if (var0)
    {
      -[CHDAxis setReverseOrder:](v8, "setReverseOrder:", XlChartCatSerRange::isReverse((XlChartCatSerRange *)a3[1].var0));
      -[CHDAxis setCrossesAt:](v8, "setCrossesAt:", (double)var0[8]);
      -[CHDAxis setCrossBetween:](v8, "setCrossBetween:", XlChartCatSerRange::isBetween((XlChartCatSerRange *)var0));
      -[CHDSeriesAxis setLabelFrequency:](v8, "setLabelFrequency:", var0[9]);
    }
    var2 = a3[1].var2;
    if (var2)
    {
      if ((XlChartAxCext::isAutoMax((XlChartAxCext *)var2) & 1) == 0)
        -[CHDAxis setScalingMaximum:](v8, "setScalingMaximum:", (double)*((__int16 *)var2 + 9));
      if ((XlChartAxCext::isAutoMin((XlChartAxCext *)var2) & 1) == 0)
        -[CHDAxis setScalingMinimum:](v8, "setScalingMinimum:", (double)*((__int16 *)var2 + 8));
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (XlChartPlotAxis)writeXlAxisFrom:(id)a3
{
  id v3;
  XlChartCategoryAxis *v4;
  XlChartCatSerRange *v5;
  double v6;
  XlChartAxCext *v7;
  double v8;
  double v9;

  v3 = a3;
  v4 = (XlChartCategoryAxis *)operator new();
  XlChartCategoryAxis::XlChartCategoryAxis(v4);
  v5 = (XlChartCatSerRange *)operator new();
  XlChartCatSerRange::XlChartCatSerRange(v5);
  XlChartCatSerRange::setReverseFlag((uint64_t)v5, objc_msgSend(v3, "isReverseOrder"));
  objc_msgSend(v3, "crossesAt");
  *((_WORD *)v5 + 8) = (int)v6;
  XlChartCatSerRange::setBetweenFlag((uint64_t)v5, objc_msgSend(v3, "crossBetween") == 1);
  *((_WORD *)v5 + 9) = objc_msgSend(v3, "labelFrequency");
  XlChartCategoryAxis::takeRange((uint64_t)v4, (uint64_t)v5);
  v7 = (XlChartAxCext *)operator new();
  XlChartAxCext::XlChartAxCext(v7);
  objc_msgSend(v3, "scalingMaximum");
  *((_WORD *)v7 + 9) = (int)v8;
  objc_msgSend(v3, "scalingMinimum");
  *((_WORD *)v7 + 8) = (int)v9;
  XlChartCategoryAxis::takeCategorySpec((uint64_t)v4, (uint64_t)v7);

  return (XlChartPlotAxis *)v4;
}

@end
