@implementation CHXBar2DType

+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  id v23;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "setVaryColors:", 0);
  objc_msgSend(v8, "drawingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OAXChartNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "gapWidth");

  if (v11)
    objc_msgSend(v7, "setGapWidth:", CXRequiredUnsignedLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v8, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "overlap");

  if (v14)
    objc_msgSend(v7, "setOverlap:", -(uint64_t)CXRequiredLongAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v8, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(a3, v16, "barDir");

  if (v17)
  {
    v23 = 0;
    v17 = CXOptionalStringAttribute((_xmlNode *)v17, (void *)CXNoNamespace, (xmlChar *)"val", &v23);
    v18 = v23;
    v19 = v18;
    if ((_DWORD)v17)
      v17 = objc_msgSend(v18, "isEqualToString:", CFSTR("col"));

  }
  objc_msgSend(v7, "setColumn:", v17);
  objc_msgSend(v8, "drawingState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "OAXChartNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v22 = OCXFindChild(a3, v21, "grouping");

  objc_msgSend(v7, "setGrouping:", +[CHXChartType chdGroupingFromXmlGroupingElement:](CHXChartType, "chdGroupingFromXmlGroupingElement:", v22));
}

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(v6, "chart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDBar2DType, "chartTypeWithChart:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "readFrom:chartType:state:", a3, v8, v6);
  return v8;
}

@end
