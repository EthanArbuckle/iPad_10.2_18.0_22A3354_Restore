@implementation CHBPie3DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDPie3DType *v4;
  void *v5;
  CHDPie3DType *v6;

  v3 = a3;
  v4 = [CHDPie3DType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDPie2DType initWithChart:](v4, "initWithChart:", v5);

  +[CHBPie2DType readWithState:chartType:](CHBPie2DType, "readWithState:chartType:", v3, v6);
  return v6;
}

@end
