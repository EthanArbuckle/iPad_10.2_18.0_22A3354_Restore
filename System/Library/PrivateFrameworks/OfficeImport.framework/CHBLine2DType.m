@implementation CHBLine2DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDLine2DType *v4;
  void *v5;
  CHDLine2DType *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = [CHDLine2DType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDLine2DType initWithChart:](v4, "initWithChart:", v5);

  if (*(_BYTE *)(objc_msgSend(v3, "xlCurrentPlot") + 141))
  {
    if (objc_msgSend(v3, "axisGroup") == 1)
    {
      objc_msgSend(v3, "chart");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "plotArea");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContainsVolumeStockType:", 1);

    }
    else
    {
      -[CHDLine2DType setStockType:](v6, "setStockType:", 1);
    }
  }
  +[CHBLineType readWithState:chartType:](CHBLineType, "readWithState:chartType:", v3, v6);

  return v6;
}

@end
