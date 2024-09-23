@implementation CHXOfPieType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  void *v10;
  char v11;

  v5 = a4;
  +[CHXPie2DType chdChartTypeFromXmlChartTypeElement:state:](CHXPie2DType, "chdChartTypeFromXmlChartTypeElement:state:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "ofPieType");

  if (v9
    && (CXRequiredStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("bar")),
        v10,
        (v11 & 1) != 0))
  {
    objc_msgSend(v6, "setBarOfPieType:", 1);
  }
  else
  {
    objc_msgSend(v6, "setPieOfPieType:", 1);
  }

  return v6;
}

@end
