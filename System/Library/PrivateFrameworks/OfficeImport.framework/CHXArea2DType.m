@implementation CHXArea2DType

+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_msgSend(v11, "setVaryColors:", 0);
  objc_msgSend(v7, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "grouping");

  objc_msgSend(v11, "setGrouping:", +[CHXChartType chdGroupingFromXmlGroupingElement:](CHXChartType, "chdGroupingFromXmlGroupingElement:", v10));
}

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(v6, "chart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDArea2DType, "chartTypeWithChart:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "readFrom:chartType:state:", a3, v8, v6);
  return v8;
}

@end
