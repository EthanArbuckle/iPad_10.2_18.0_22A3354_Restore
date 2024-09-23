@implementation CHXScatterType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "chart", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDScatterType, "chartTypeWithChart:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setVaryColors:", 0);
  return v5;
}

@end
