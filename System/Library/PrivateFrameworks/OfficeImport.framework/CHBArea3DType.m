@implementation CHBArea3DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDArea3DType *v4;
  void *v5;
  CHDArea3DType *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = [CHDArea3DType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDArea3DType initWithChart:](v4, "initWithChart:", v5);

  +[CHBArea2DType readWithState:chartType:](CHBArea2DType, "readWithState:chartType:", v3, v6);
  v7 = objc_msgSend(v3, "xlCurrentPlot");
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 8);
    if (v8)
      -[CHDArea3DType setGapDepth:](v6, "setGapDepth:", *(__int16 *)(v8 + 26));
  }

  return v6;
}

@end
