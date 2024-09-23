@implementation CHXBubbleSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
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
  uint64_t v16;
  void *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  uint64_t v20;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeries seriesWithChart:](CHDBubbleSeries, "seriesWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "bubble3D");

  if (v10)
    objc_msgSend(v7, "setBubble3D:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "OAXChartNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "invertIfNegative");

  if (v13)
    objc_msgSend(v7, "setInvertIfNegative:", CXRequiredBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "OAXChartNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "dLbls");

  if (!v16)
  {
    objc_msgSend(v5, "drawingState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "OAXChartNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v19 = (_xmlNode *)OCXFindChild(0, v18, "showBubbleSize");

    if (v19)
      v20 = (uint64_t)CXRequiredBoolAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    else
      v20 = 1;
    objc_msgSend(v7, "setShowBubbleSize:", v20);
  }

  return v7;
}

@end
