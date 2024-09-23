@implementation CHXBubbleType

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
  _xmlNode *v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v21;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDBubbleType, "chartTypeWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setVaryColors:", 0);
  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "bubbleScale");

  if (v10)
    objc_msgSend(v7, "setBubbleScale:", CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "OAXChartNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "showNegBubbles");

  if (v13)
    objc_msgSend(v7, "setShowNegBubbles:", CXRequiredBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "OAXChartNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "sizeRepresents");

  if (v16)
  {
    v21 = 0;
    v17 = CXOptionalStringAttribute(v16, (void *)CXNoNamespace, (xmlChar *)"val", &v21);
    v18 = v21;
    v19 = v18;
    if (v17)
      objc_msgSend(v7, "setSizeRepresentsRadius:", objc_msgSend(v18, "isEqualToString:", CFSTR("w")));

  }
  return v7;
}

@end
