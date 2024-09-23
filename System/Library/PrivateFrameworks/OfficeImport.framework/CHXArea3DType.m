@implementation CHXArea3DType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDArea3DType, "chartTypeWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CHXArea2DType readFrom:chartType:state:](CHXArea2DType, "readFrom:chartType:state:", a3, v7, v5);
  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "gapDepth");

  if (v10)
    objc_msgSend(v7, "setGapDepth:", CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));

  return v7;
}

@end
