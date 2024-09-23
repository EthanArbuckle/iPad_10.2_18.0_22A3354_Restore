@implementation CHBLine3DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDLine3DType *v4;
  void *v5;
  CHDLine3DType *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = [CHDLine3DType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDLine3DType initWithChart:](v4, "initWithChart:", v5);

  +[CHBLineType readWithState:chartType:](CHBLineType, "readWithState:chartType:", v3, v6);
  v7 = objc_msgSend(v3, "xlCurrentPlot");
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 8);
    if (v8)
      -[CHDLine3DType setGapDepth:](v6, "setGapDepth:", *(__int16 *)(v8 + 26));
  }

  return v6;
}

@end
