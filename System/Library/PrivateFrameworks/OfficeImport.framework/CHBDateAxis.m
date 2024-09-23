@implementation CHBDateAxis

+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4
{
  id v5;
  CHDDateAxis *v6;
  void *v7;
  CHDDateAxis *v8;
  __int16 *var0;
  __int16 *var3;

  v5 = a4;
  if (a3)
  {
    v6 = [CHDDateAxis alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CHDDateAxis initWithResources:](v6, "initWithResources:", v7);

    var0 = (__int16 *)a3[1].var0;
    if (var0)
    {
      -[CHDAxis setReverseOrder:](v8, "setReverseOrder:", XlChartCatSerRange::isReverse((XlChartCatSerRange *)a3[1].var0));
      -[CHDAxis setCrossesAt:](v8, "setCrossesAt:", (double)var0[8]);
      -[CHDAxis setCrossBetween:](v8, "setCrossBetween:", XlChartCatSerRange::isBetween((XlChartCatSerRange *)var0));
    }
    var3 = (__int16 *)a3[1].var3;
    if (var3)
    {
      if ((XlChartAxCext::isAutoMax((XlChartAxCext *)var3) & 1) == 0)
        -[CHDAxis setScalingMaximum:](v8, "setScalingMaximum:", (double)var3[9]);
      if ((XlChartAxCext::isAutoMin((XlChartAxCext *)var3) & 1) == 0)
        -[CHDAxis setScalingMinimum:](v8, "setScalingMinimum:", (double)var3[8]);
      if ((XlChartAxCext::isAutoMajor((XlChartAxCext *)var3) & 1) == 0)
        -[CHDDateAxis setMajorUnitValue:](v8, "setMajorUnitValue:", (double)var3[10]);
      if ((XlChartAxCext::isAutoMinor((XlChartAxCext *)var3) & 1) == 0)
        -[CHDDateAxis setMinorUnitValue:](v8, "setMinorUnitValue:", (double)var3[12]);
      -[CHDDateAxis setMinorTimeUnit:](v8, "setMinorTimeUnit:", var3[13]);
      -[CHDDateAxis setMajorTimeUnit:](v8, "setMajorTimeUnit:", var3[11]);
      -[CHDDateAxis setBaseTimeUnit:](v8, "setBaseTimeUnit:", var3[14]);
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
  XlChartDateAxis *v3;

  v3 = (XlChartDateAxis *)operator new();
  XlChartDateAxis::XlChartDateAxis(v3);
  return (XlChartPlotAxis *)v3;
}

@end
