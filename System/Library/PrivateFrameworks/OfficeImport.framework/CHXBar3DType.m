@implementation CHXBar3DType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDBar3DType, "chartTypeWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CHXBar2DType readFrom:chartType:state:](CHXBar2DType, "readFrom:chartType:state:", a3, v7, v5);
  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "gapDepth");

  if (v10)
    objc_msgSend(v7, "setGapDepth:", CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "OAXChartNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "shape");

  objc_msgSend(v7, "setShapeType:", +[CHXChartType chdShapeTypeFromXmlShapeTypeElement:](CHXChartType, "chdShapeTypeFromXmlShapeTypeElement:", v13));
  return v7;
}

@end
