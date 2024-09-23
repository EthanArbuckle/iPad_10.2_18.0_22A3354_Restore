@implementation CHXDoughnutType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDPie2DType, "chartTypeWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDoughnutType:", 1);
  +[CHXPie2DType readFrom:chartType:state:](CHXPie2DType, "readFrom:chartType:state:", a3, v7, v5);

  return v7;
}

@end
