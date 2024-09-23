@implementation CHBBar3DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDBar3DType *v4;
  void *v5;
  CHDBar3DType *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = [CHDBar3DType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDBar3DType initWithChart:](v4, "initWithChart:", v5);

  +[CHBBar2DType readWithState:chartType:](CHBBar2DType, "readWithState:chartType:", v3, v6);
  v7 = objc_msgSend(v3, "xlCurrentPlot");
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 8);
    if (v8)
      -[CHDBar3DType setGapDepth:](v6, "setGapDepth:", *(__int16 *)(v8 + 26));
  }
  v9 = objc_msgSend(v3, "xlCurrentDefaultSeriesFormat");
  if (v9)
    -[CHDBar3DType setShapeType:](v6, "setShapeType:", chdShapeTypeFromXlShapeTypeEnum(*(_DWORD *)(v9 + 76)));

  return v6;
}

@end
